#! /bin/bash

# This file is part of MedKonnectEHR.
#
# Copyright (c) 2020
# Michaël Val 
# MedKonnectEHR is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# MedKonnectEHR is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with MedKonnectEHR.  If not, see <http://www.gnu.org/licenses/>.

# Installateur de base
#
# @author Michaël Val
# @contrib B-Yasmina

selectMkehrPath() {
    read -er -i "$mkehrPath" -p "Choix du dossier d'installation [défaut : /opt/ehr] : " input
    mkehrPath="${input:-$mkehrPath}"
}

selectPackages() {
    echo "Installation des dépendances de MedKonnectEHR minimales, tapez 1 [défaut]"
    echo "Installation de MedKonnectEHR avec Orthanc (Phonecapture, Echographe ...), tapez 2"
    echo "Ne rien installer, tapez 3"
    read -er -i "$selectInstall" -p "Choix : " input
    selectInstall="${input:-$selectInstall}"
    case $selectInstall in
        "1" )
            packagesInstall ;;
        "2" )
            mkehrDep="${mkehrDep} ${extraDicom}"
            packagesInstall
            orthancConfig ;;
        "3" ) 
		 ;;
        * ) 
            echo "Mauvaise valeur saisie"
            selectPackages ;;
    esac 
}

packagesInstall(){
	apt update && apt upgrade -y && apt install -y $mkehrDep
}

orthancConfig(){
    read -r -p "Choix du nom de l'utilisateur d'Orthanc : " orthancUser
    echo
    while true; do
        while true; do
            read -s -r -p "Choix du mot de passe utilisateur d'Orthanc (ne pas utiliser les caractères : \"'$,[]*?{}~#%\<,>|^; ) : " orthancPswd
            echo
            [[ $orthancPswd != *@($caracteres_interdits)* ]] && break || echo "Mot de passe utilisateur d'Orthanc invalide: ne pas inclure de caractères interdits. Veuillez choisir un nouveau mot de passe."
        done
        read -s -r -p "Confirmation du mot de passe : " orthancPswd1
        echo
        [ "$orthancPswd" = "$orthancPswd1" ] && break || echo "Mot de passe non correspondant: veuillez reessayez."
    done
    sed -i 's/"AuthenticationEnabled" : false,/"AuthenticationEnabled" : true,/' /etc/orthanc/orthanc.json
    sed -i "s|// \"alice\" : \"alicePassword\"|\"$orthancUser\" : \"$orthancPswd\"|" /etc/orthanc/orthanc.json
}

selectLampConfig() {
read -er -i "$selectLampConfig" -p "Vous souhaitez que le serveur LAMP soit configuré par défaut, tapez 1 [défaut], vous voulez configurer le serveur LAMP tapez 2, si vous l'avez déjà configuré tapez 3 : " input
selectLampConfig="${input:-$selectLampConfig}"
case $selectLampConfig in
    "1" )
        certGen
        apacheConfig
        mariadbConfig ;;       
    "2" )
        selectdomain
        certGen
        apacheConfig
        mariadbConfig ;;
    "3" ) 
	 ;;
    * ) 
        echo "Mauvaise valeur saisie"
        selectLampConfig ;;
esac 
}

selectdomain() {
    read -er -i "$mkehrDom" -p "Choix du domaine [défaut : mkehr.local] : " input
    mkehrDom="${input:-$mkehrDom}"
}

certGen() {
    mkdir /etc/ssl/"$mkehrDom"
    cd /etc/ssl/"$mkehrDom" || exit
    openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout "$mkehrDom".key -out "$mkehrDom".crt -subj "/CN=$mkehrDom" -addext "subjectAltName=DNS:$mkehrDom"
}

apacheConfig() {
    ## Configuration vhost http
    echo "<VirtualHost *:80>
        ServerName $mkehrDom
        ServerAlias mkehr ehr medkonnectehr MedKonnectEHR
        RedirectMatch     permanent ^(.*)$ https://$mkehrDom\$1
    </VirtualHost>

    <VirtualHost *:443>
        ServerName $mkehrDom
        ServerAlias mkehr ehr medkonnectehr MedKonnectEHR
        DocumentRoot $mkehrPath/public_html
        RewriteEngine On
        SSLEngine On
        SSLCertificateFile /etc/ssl/$mkehrDom/$mkehrDom.crt
        SSLCertificateKeyFile /etc/ssl/$mkehrDom/$mkehrDom.key
        <Directory $mkehrPath/public_html>
            Options FollowSymLinks
            AllowOverride all
            Require all granted
        </Directory>
        ErrorLog /var/log/apache2/error.$mkehrDom.log
        CustomLog /var/log/apache2/access.$mkehrDom.log combined
    </VirtualHost>
    " > /etc/apache2/sites-available/"$mkehrDom".conf

    a2enmod rewrite headers ssl

    a2dissite 000-default.conf default-ssl.conf

    a2ensite "$mkehrDom "

    sed -i 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
    sed -i 's/ServerSignature On/ServerSignature Off/' /etc/apache2/conf-available/security.conf

    ## Réglage php.ini
	vphp=$(php -r "echo PHP_VERSION;" | cut -c1-3)
	sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/' /etc/php/"$vphp"/apache2/php.ini
	sed -i 's/post_max_size = 8M/post_max_size = 20M/' /etc/php/"$vphp"/apache2/php.ini
	sed -i 's/;max_input_vars = 1000/max_input_vars = 10000/' /etc/php/"$vphp"/apache2/php.ini

    service apache2 restart
}   

mariadbConfig() {
    while true; do
        while true; do
            read -s -r -p "Choix du mot de passe administrateur (root) de la base de données (ne pas utiliser les caractères : \"'$,[]*?{}~#%\<,>|^; ) : " mysqlRootPswd
            echo
            [[ $mysqlRootPswd != *@($caracteres_interdits)* ]] && break || echo "Mot de passe administrateur root invalide: ne pas inclure de caractères interdits. Veuillez choisir un nouveau mot de passe."
        done
        read -r -s -p "Confirmation du mot de passe : " mysqlRootPswd1
        echo
        [ "$mysqlRootPswd" = "$mysqlRootPswd1" ] && break || echo "Mot de passe non correspondant: veuillez reessayez."
    done
    echo
    read -er -i "$mkehrDbName" -p "Choix du nom de la base de donnée (défaut : medkonnectehr) : " input
    mkehrDbName="${input:-$mkehrDbName}"
    echo
    read -r -p "Choix du nom de l'utilisateur de la base de données : " mysqlUser
    echo
    while true; do
        while true; do
            read -r -s -p "Choix du mot de passe utilisateur de la base de données (ne pas utiliser les caractères : \"'$,[]*?{}~#%\<,>|^; ) : " mysqlUserPswd 
            echo
            [[ $mysqlUserPswd != *@($caracteres_interdits)* ]] && break || echo "Mot de passe utilisateur invalide: ne pas inclure les caractères interdits. Veuillez choisir un nouveau mot de passe."
        done
        read -r -s -p "Confirmation du mot de passe : " mysqlUserPswd1
        echo
        [ "$mysqlUserPswd" = "$mysqlUserPswd1" ] && break || echo "Mot de passe non correspondant: veuillez reessayez."
    done
    service mysql start
    mysql <<EOF
    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${mysqlRootPswd}');
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    CREATE DATABASE $mkehrDbName;
    GRANT ALL ON $mkehrDbName.* TO '${mysqlUser}'@'localhost' IDENTIFIED BY '${mysqlUserPswd}' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
EOF
}

selectVersion() {
    read -er -i "$selectVersion" -p "Vous voulez installer la dernière version stable tapez 1 [défaut], vous voulez installer une autre version tapez 2, ne rien installer tapez 3 : " input
    selectVersion="${input:-$selectVersion}"
    case $selectVersion in
    "1" )
        mkehrLatest ;;  
    "2" )
        selectMkehrVersion ;;
    "3" )
        selectRemoveInstallFiles ;;
    * ) 
        echo "Mauvaise valeur saisie"
        selectVersion ;;
esac 
}

mkehrLatest() {
    vRelease=$(curl --silent "https://api.github.com/repos/MedKonnect/MedKonnectEHR-base/releases/latest" |
        grep '"tag_name":' |                                                          
        sed -E 's/.*"([^"]+)".*/\1/')
        mkehrInstall
}	

selectMkehrVersion() {
    read -r -p "Tapez la version sous la forme vX.X.X : " vRelease
    mkehrInstall
}	

mkehrInstall() {
    wget --no-check-certificate https://github.com/MedShake/MedShakeEHR-base/archive/"$vRelease".zip -P /tmp

    unzip -q -o -d /tmp /tmp/"$vRelease".zip 

    mkdir -p "$mkehrPath"/public_html
    version=$(echo "$vRelease" | cut -f2 -d "v")
    mv -f /tmp/MedKonnectEHR-base-"$version"/* "$mkehrPath"
    echo "$mkehrPath
    " > "$mkehrPath"/public_html/MEDKONNECTEHRPATH
    chown www-data:www-data -R "$mkehrPath"
    chmod 755 "$mkehrPath" "$mkehrPath"/public_html

    cd "$mkehrPath" || exit
    su www-data -s/bin/bash -c 'composer install --no-interaction --no-cache -o'
    cd "$mkehrPath"/public_html || exit
    su www-data -s/bin/bash -c 'composer install --no-interaction --no-cache -o'
    su www-data -s/bin/bash -c  "php $mkehrPath/public_html/install.php -N -s localhost -d $mkehrDbName -u $mysqlUser -p $mysqlUserPswd -r https -D $mkehrDom -o localhost"

    selectRemoveInstallFiles
}  

selectRemoveInstallFiles() {
read -er -i "$selectRemove" -p "Si vous souhaitez détruire les fichiers d'installation tapez 1 [défaut], si vous souhaitez les conserver tapez 2 : " input
selectRemove="${input:-$selectRemove}"
case "$selectRemove" in
    "1" )
        removeInstallFiles ;;
    "2" ) 
	    echo "Pensez à configurer votre pare-feu et les mises à jours, plus d'infos sur https://c-medkonnectehr.fr/doc.";;
    * ) 
        echo "Mauvaise valeur saisie"
        selectRemoveInstallFiles ;;
esac
}
    
removeInstallFiles() {
    rm -r /tmp/"$vRelease".zip /tmp/MedKonnectEHR-base-"$version" /tmp/debian-bash-installer.sh
    echo "Pensez à configurer votre pare-feu et les mises à jours, plus d'infos sur https://c-medkonnectehr.fr/doc"
}

selectInstall(){
    echo "Bienvenue, ce script va vous guider lors de l'installation de MedKonnectEHR. Si vous avez besoin d'aide au cours de l'installation : https://c-medkonnectehr.fr/doc"
    read -er -i "$persoInstall" -p "Pour commencer, si vous souhaitez installer MedKonnectEHR avec ses valeurs par défaut, tapez 1 [défaut] ou personnaliser l'installation, tapez 2 : " input
    persoInstall="${input:-$persoInstall}"
    case "$persoInstall" in
        "1" )
            packagesInstall
            certGen
            apacheConfig
            mariadbConfig
            mkehrLatest ;;
        "2" )
            selectMkehrPath
            selectPackages
            selectLampConfig
            selectVersion ;;
        * ) 
            echo "Mauvaise valeur saisie"
            selectInstall ;;    
    esac  
}

# Variables globales par défauts.
caracteres_interdits="\"|\'|\$|\,|\[|\]|\*|\?|\{|\}|\~|\#|\%|\<|\>|\||\^|\;"
persoInstall=1
mkehrPath=/opt/ehr
selectInstall=1
selectLampConfig=1
mkehrDom=mkehr.local
mkehrDbName=medkonnectehr
selectVersion=1
selectRemove=1
mkehrDep="apache2 composer curl ghostscript git imagemagick mariadb-server ntp pdftk-java php php-bcmath php-curl php-gd php-gnupg php-imagick php-imap php-intl php-mysql php-soap php-xml php-yaml php-zip"
extraDicom="orthanc"

clear
selectInstall