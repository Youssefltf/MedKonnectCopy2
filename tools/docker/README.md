#  MedKonnectEHR Docker Compose

Pile LAMP pour MedKonnectEHR en local :
* PHP
* Apache
* MySQL
* phpMyAdmin
* Orthanc
* Reverse proxy
* Certificat SSL autosigné
* VPN (Wireguard)

##  Installation

* Configurez le .env selon vos besoins.

```bash
cp sample.env .env
nano .env
```
*  Modifiez l'image mkehr de votre choix. 

```bash
nano compose.yml
medkonnectehr:
    image: marsante/mkehrtest:x.x.x
```

* Ou modifiez le fichier compose avec le Dockerfile de votre choix. 

```bash
nano compose.yml
medkonnectehr:
    build: ./
```

* Vous pouvez aussi modifier le Dockerfile avec votre clone de MedKonnectEHR pour tester vos nouvelles fonctionnalités.
* Puis lancez la stack :
```bash
docker compose up --build -d
# sudo devant si docker non rootless et que l'utilisateur ne fait pas partie du groupe docker
# docker-compose up --build -d si vous avez une ancienne version de docker compose
```
suivant votre configuration.
* Tapez [mkehr.localhost/install.php](mkehr.localhost/install.php) dans votre navigateur.
* Suivez les instructions.

* Pour ajouter un module, ou le mettre à jour :

```bash
docker exec -ti mkehr php /usr/local/bin/mkehr.upgrade.php base
```

* les arguments disponibles sont : base, chiro, gyneco, general, thermal, mpr, osteo


## Orthanc
* Créez le fichier de configuration `cp sample-orthanc.json orthanc.json` et éditez `nano orthanc.json`
* Relancez la stack docker compose ainsi `docker compose --profile dicom`

## phpMyAdmin
* Relancez la stack docker compose ainsi `docker compose --profile debug` puis rendez-vous sur [pma.mkehr.localhost/](pma.mkehr.localhost/)

## VPN (Wireguard)
* Modifiez le .env en personnalisant avec vos données réseaux / domaine.
* Relancez la stack docker compose ainsi `docker compose --profile vpn`.

