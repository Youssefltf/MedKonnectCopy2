/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: medshakeehr
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actes`
--

DROP TABLE IF EXISTS `actes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actes` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `label` varchar(250) DEFAULT NULL,
  `shortLabel` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `flagImportant` tinyint(1) NOT NULL DEFAULT 0,
  `flagCmu` tinyint(1) NOT NULL DEFAULT 0,
  `fromID` smallint(5) unsigned DEFAULT NULL,
  `toID` mediumint(9) NOT NULL DEFAULT 0,
  `creationDate` datetime NOT NULL DEFAULT '2018-01-01 00:00:00',
  `active` enum('oui','non') NOT NULL DEFAULT 'oui',
  PRIMARY KEY (`id`),
  KEY `toID` (`toID`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actes`
--

LOCK TABLES `actes` WRITE;
/*!40000 ALTER TABLE `actes` DISABLE KEYS */;
INSERT INTO `actes` VALUES
(1,1,'Consultation de base','Cs base','---\nConsult:\n  pourcents: 100\n  depassement: 15\n...\n',1,0,1,0,'2019-01-01 00:00:00','oui'),
(2,2,'Consultation gynécologique et FCV','Cs gynéco et FCV','---\nCS:\n  pourcents: 100\n  depassement: 2.54\nMCS:\n  pourcents: 100\n  depassement: 0\nMPC:\n  pourcents: 100\n  depassement: 0\nJKHD001:\n  pourcents: 100\n  depassement: 0\n...\n',1,0,1,0,'2019-01-01 00:00:00','oui'),
(3,1,'Consultation de base','Cs base','---\nConsult:\n  pourcents: 100\n  depassement: 15\n...\n',1,0,1,0,'2019-01-01 00:00:00','oui'),
(4,2,'Consultation gynécologique et FCV','Cs gynéco et FCV','---\nCS:\n  pourcents: 100\n  depassement: 2.54\nMCS:\n  pourcents: 100\n  depassement: 0\nMPC:\n  pourcents: 100\n  depassement: 0\nJKHD001:\n  pourcents: 100\n  depassement: 0\n...\n',1,0,1,0,'2019-01-01 00:00:00','oui');
/*!40000 ALTER TABLE `actes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actes_base`
--

DROP TABLE IF EXISTS `actes_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actes_base` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(7) DEFAULT NULL,
  `activite` tinyint(1) NOT NULL DEFAULT 1,
  `phase` tinyint(1) NOT NULL DEFAULT 0,
  `codeProf` varchar(7) DEFAULT NULL,
  `label` mediumtext DEFAULT NULL,
  `type` enum('NGAP','CCAM','Libre','mCCAM') NOT NULL DEFAULT 'CCAM',
  `dataYaml` mediumtext DEFAULT NULL,
  `tarifUnit` enum('euro','pourcent') NOT NULL DEFAULT 'euro',
  `fromID` mediumint(8) unsigned NOT NULL DEFAULT 1,
  `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`,`activite`,`phase`,`type`,`codeProf`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actes_base`
--

LOCK TABLES `actes_base` WRITE;
/*!40000 ALTER TABLE `actes_base` DISABLE KEYS */;
INSERT INTO `actes_base` VALUES
(1,'CS',1,0,'mgo','Consultation au cabinet par le médecin spécialiste qualifié et le médecin spécialiste qualifié en médecine générale','NGAP','---\ntarifParZone:\n  metro: 23\n  971: 27.6\n  972: 27.6\n  973: 27.6\n  974: 27.6\n  976: 27.6\n...\n','euro',1,'2019-01-01 00:00:00'),
(2,'Consult',1,0,NULL,'Consultation libre exemple','Libre','---\ntarifBase: 50\n...\n','euro',1,'2019-01-01 00:00:00'),
(3,'JKHD001',1,0,NULL,'Prélèvement cervicovaginal','CCAM','---\ntarifParGrilleTarifaire:\n  CodeGrilleT1: 12.46\n  CodeGrilleT2: 9.64\n  CodeGrilleT0: 9.64\n  CodeGrilleT3: 12.46\n  CodeGrilleT4: 9.64\n  CodeGrilleT5: 12.46\n  CodeGrilleT6: 9.64\n  CodeGrilleT7: 12.46\n  CodeGrilleT8: 9.64\n  CodeGrilleT9: 12.46\n  CodeGrilleT10: 9.64\n  CodeGrilleT11: 12.46\n  CodeGrilleT12: 9.64\n  CodeGrilleT13: 9.64\n  CodeGrilleT14: 9.64\n  CodeGrilleT15: 12.46\n  CodeGrilleT16: 12.46\nmodificateursParConventionPs: []\nmajorationsDom:\n  971: 1\n  972: 1\n  973: 1\n  974: 1\n...\n','euro',1,'2019-01-01 00:00:00'),
(4,'MCS',1,0,NULL,'Majoration de coordination spécialiste','NGAP','---\ntarifParZone:\n  metro: 5\n  971: 5\n  972: 5\n  973: 5\n  974: 5\n  976: 5\n...\n','euro',1,'2019-01-01 00:00:00'),
(5,'MPC',1,0,NULL,'Majoration forfaitaire transitoire','NGAP','---\ntarifParZone:\n  metro: 2\n  971: 2\n  972: 2\n  973: 2\n  974: 2\n  976: 2\n...\n','euro',1,'2019-01-01 00:00:00'),
(6,'Consult',1,0,NULL,'Consultation libre exemple','Libre','---\ntarifBase: 50\n...\n','euro',1,'2019-01-01 00:00:00'),
(7,'JKHD001',1,0,NULL,'Prélèvement cervicovaginal','CCAM','---\ntarifParGrilleTarifaire:\n  CodeGrilleT1: 12.46\n  CodeGrilleT2: 9.64\n  CodeGrilleT0: 9.64\n  CodeGrilleT3: 12.46\n  CodeGrilleT4: 9.64\n  CodeGrilleT5: 12.46\n  CodeGrilleT6: 9.64\n  CodeGrilleT7: 12.46\n  CodeGrilleT8: 9.64\n  CodeGrilleT9: 12.46\n  CodeGrilleT10: 9.64\n  CodeGrilleT11: 12.46\n  CodeGrilleT12: 9.64\n  CodeGrilleT13: 9.64\n  CodeGrilleT14: 9.64\n  CodeGrilleT15: 12.46\n  CodeGrilleT16: 12.46\nmodificateursParConventionPs: []\nmajorationsDom:\n  971: 1\n  972: 1\n  973: 1\n  974: 1\n...\n','euro',1,'2019-01-01 00:00:00'),
(8,'MCS',1,0,NULL,'Majoration de coordination spécialiste','NGAP','---\ntarifParZone:\n  metro: 5\n  971: 5\n  972: 5\n  973: 5\n  974: 5\n  976: 5\n...\n','euro',1,'2019-01-01 00:00:00'),
(9,'MPC',1,0,NULL,'Majoration forfaitaire transitoire','NGAP','---\ntarifParZone:\n  metro: 2\n  971: 2\n  972: 2\n  973: 2\n  974: 2\n  976: 2\n...\n','euro',1,'2019-01-01 00:00:00');
/*!40000 ALTER TABLE `actes_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actes_cat`
--

DROP TABLE IF EXISTS `actes_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actes_cat` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `module` varchar(20) NOT NULL DEFAULT 'base',
  `fromID` smallint(5) unsigned NOT NULL,
  `creationDate` datetime NOT NULL,
  `displayOrder` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `displayOrder` (`displayOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actes_cat`
--

LOCK TABLES `actes_cat` WRITE;
/*!40000 ALTER TABLE `actes_cat` DISABLE KEYS */;
INSERT INTO `actes_cat` VALUES
(1,'catConsult','Consultations','','base',1,'2019-01-01 00:00:00',1),
(2,'catGynobsActesContra','DIU & implant','','base',1,'2019-01-01 00:00:00',3);
/*!40000 ALTER TABLE `actes_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `externid` int(10) unsigned DEFAULT NULL,
  `userid` smallint(5) unsigned NOT NULL DEFAULT 3,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `dateAdd` datetime DEFAULT NULL,
  `lastModified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `patientid` mediumint(8) unsigned DEFAULT NULL,
  `fromID` mediumint(8) unsigned DEFAULT NULL,
  `statut` enum('actif','deleted') DEFAULT 'actif',
  `absente` enum('non','oui') DEFAULT 'non',
  `attente` enum('non','oui') NOT NULL DEFAULT 'non',
  `motif` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientid` (`patientid`),
  KEY `externid` (`externid`),
  KEY `userid` (`userid`),
  KEY `typeEtUserid` (`type`,`userid`),
  KEY `start` (`start`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_changelog`
--

DROP TABLE IF EXISTS `agenda_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_changelog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(10) unsigned NOT NULL,
  `userID` smallint(5) unsigned NOT NULL,
  `fromID` smallint(5) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `operation` enum('edit','move','delete','missing','waiting') NOT NULL,
  `olddata` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventID` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_changelog`
--

LOCK TABLES `agenda_changelog` WRITE;
/*!40000 ALTER TABLE `agenda_changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdpm_compositions`
--

DROP TABLE IF EXISTS `bdpm_compositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdpm_compositions` (
  `codeCIS` int(10) unsigned NOT NULL,
  `elementPharmaceutique` varchar(500) NOT NULL,
  `codeSubstance` int(10) unsigned NOT NULL,
  `denomination` varchar(500) DEFAULT NULL,
  `dosage` varchar(250) DEFAULT NULL,
  `dosageRef` varchar(250) DEFAULT NULL,
  `nature` enum('SA','FT') NOT NULL,
  `numLiaison` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`codeCIS`,`elementPharmaceutique`,`codeSubstance`,`numLiaison`),
  KEY `codeCIS` (`codeCIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdpm_compositions`
--

LOCK TABLES `bdpm_compositions` WRITE;
/*!40000 ALTER TABLE `bdpm_compositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdpm_compositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdpm_conditions`
--

DROP TABLE IF EXISTS `bdpm_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdpm_conditions` (
  `codeCIS` int(11) NOT NULL,
  `condition` varchar(255) NOT NULL,
  PRIMARY KEY (`codeCIS`,`condition`),
  KEY `codeCIS` (`codeCIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdpm_conditions`
--

LOCK TABLES `bdpm_conditions` WRITE;
/*!40000 ALTER TABLE `bdpm_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdpm_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdpm_groupesGeneriques`
--

DROP TABLE IF EXISTS `bdpm_groupesGeneriques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdpm_groupesGeneriques` (
  `idGroupe` int(10) unsigned NOT NULL,
  `libelle` mediumtext NOT NULL,
  `codeCIS` int(10) unsigned DEFAULT NULL,
  `typeGene` smallint(5) unsigned DEFAULT NULL,
  `numOrdre` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`idGroupe`,`numOrdre`),
  KEY `idGroupe` (`idGroupe`),
  KEY `codeCIS` (`codeCIS`),
  FULLTEXT KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdpm_groupesGeneriques`
--

LOCK TABLES `bdpm_groupesGeneriques` WRITE;
/*!40000 ALTER TABLE `bdpm_groupesGeneriques` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdpm_groupesGeneriques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bdpm_presentations`
--

DROP TABLE IF EXISTS `bdpm_presentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdpm_presentations` (
  `codeCIS` int(10) unsigned DEFAULT NULL,
  `codeCIP7` int(10) unsigned DEFAULT NULL,
  `libelle` varchar(600) DEFAULT NULL,
  `statutAdministratif` varchar(60) DEFAULT NULL,
  `etatCommercialisation` varchar(200) DEFAULT NULL,
  `dateCommercialisation` varchar(10) DEFAULT NULL,
  `codeCIP13` varchar(13) NOT NULL,
  `agrementCol` enum('oui','non','inconnu') DEFAULT NULL,
  `txRembouSS` varchar(10) DEFAULT NULL,
  `prix1` varchar(9) DEFAULT NULL,
  `prix2` varchar(9) DEFAULT NULL,
  `prix3` varchar(9) DEFAULT NULL,
  `indicRembour` mediumtext DEFAULT NULL,
  PRIMARY KEY (`codeCIP13`),
  KEY `codeCIS` (`codeCIS`),
  FULLTEXT KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdpm_presentations`
--

LOCK TABLES `bdpm_presentations` WRITE;
/*!40000 ALTER TABLE `bdpm_presentations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdpm_presentations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bdpm_presentationsVirtuelles`
--

DROP TABLE IF EXISTS `bdpm_presentationsVirtuelles`;
/*!50001 DROP VIEW IF EXISTS `bdpm_presentationsVirtuelles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bdpm_presentationsVirtuelles` AS SELECT
 1 AS `codeSPE`,
  1 AS `idGroupe`,
  1 AS `codeCIS`,
  1 AS `codeCIP7`,
  1 AS `libelle`,
  1 AS `statutAdministratif`,
  1 AS `etatCommercialisation`,
  1 AS `dateCommercialisation`,
  1 AS `codeCIP13`,
  1 AS `agrementCol`,
  1 AS `txRembouSS`,
  1 AS `prix1`,
  1 AS `prix2`,
  1 AS `prix3`,
  1 AS `indicRembour`,
  1 AS `reservhop` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bdpm_specialites`
--

DROP TABLE IF EXISTS `bdpm_specialites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdpm_specialites` (
  `codeCIS` int(10) unsigned NOT NULL,
  `denomination` varchar(500) DEFAULT NULL,
  `formePharma` varchar(255) DEFAULT NULL,
  `voiesAdmin` varchar(255) DEFAULT NULL,
  `statutAdminAMM` varchar(255) DEFAULT NULL,
  `typeProcedAMM` varchar(255) DEFAULT NULL,
  `etatCommercialisation` varchar(255) DEFAULT NULL,
  `dateAMM` varchar(10) DEFAULT NULL,
  `statutBdm` varchar(50) DEFAULT NULL,
  `numAutoEU` varchar(50) DEFAULT NULL,
  `tituAMM` varchar(500) DEFAULT NULL,
  `surveillanceRenforcee` enum('Oui','Non') DEFAULT NULL,
  PRIMARY KEY (`codeCIS`),
  FULLTEXT KEY `denomination` (`denomination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdpm_specialites`
--

LOCK TABLES `bdpm_specialites` WRITE;
/*!40000 ALTER TABLE `bdpm_specialites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdpm_specialites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bdpm_specialitesVirtuelles`
--

DROP TABLE IF EXISTS `bdpm_specialitesVirtuelles`;
/*!50001 DROP VIEW IF EXISTS `bdpm_specialitesVirtuelles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bdpm_specialitesVirtuelles` AS SELECT
 1 AS `codeSPE`,
  1 AS `codeCIS`,
  1 AS `denomination`,
  1 AS `formePharma`,
  1 AS `voiesAdmin`,
  1 AS `statutAdminAMM`,
  1 AS `typeProcedAMM`,
  1 AS `etatCommercialisation`,
  1 AS `dateAMM`,
  1 AS `statutBDM`,
  1 AS `numAutoEU`,
  1 AS `tituAMM`,
  1 AS `surveillanceRenforcee`,
  1 AS `monovir` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bdpm_updates`
--

DROP TABLE IF EXISTS `bdpm_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bdpm_updates` (
  `fileName` varchar(50) NOT NULL DEFAULT '',
  `fileLastParse` datetime DEFAULT NULL,
  PRIMARY KEY (`fileName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bdpm_updates`
--

LOCK TABLES `bdpm_updates` WRITE;
/*!40000 ALTER TABLE `bdpm_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `bdpm_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `level` enum('default','module','user') DEFAULT 'default',
  `toID` int(10) unsigned NOT NULL DEFAULT 0,
  `module` varchar(20) NOT NULL DEFAULT '',
  `cat` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nameLevel` (`name`,`level`,`module`,`toID`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES
(1,'PraticienPeutEtrePatient','default',0,'','Options','true/false','si false, le praticien peut toujours avoir une fiche patient séparée','true'),
(2,'VoirRouletteObstetricale','default',0,'','Options','true/false','activer le lien roulette obstétricale du menu Outils','true'),
(3,'activGenBarreCode','default',0,'','Options','true/false','Activer ou non la fonctionnalité permettant de générer les codes barres RPPS et ADELI.',''),
(4,'administratifComptaPeutVoirRecettesDe','default',0,'','Règlements','liste','ID des utilisateurs, séparés par des virgules (sans espace)',''),
(5,'administratifPeutAvoirAgenda','default',0,'','Options','true/false','peut avoir un agenda à son nom','true'),
(6,'administratifPeutAvoirFacturesTypes','default',0,'','Règlements','true/false','peut avoir des factures types à son nom','false'),
(7,'administratifPeutAvoirPrescriptionsTypes','default',0,'','Options','true/false','peut avoir des prescriptions types à son nom','false'),
(8,'administratifPeutAvoirRecettes','default',0,'','Règlements','true/false','peut enregistrer des recettes à son nom','true'),
(9,'administratifReglementFormulaires','default',0,'','Règlements','liste','liste des formulaires de règlement disponible dans le dossier patient ','reglePorteurS1,reglePorteurS2,reglePorteurLibre'),
(10,'administratifSecteurGeoTarifaire','default',0,'','Règlements','dossier','zone géographique tarifaire (metro, 971, 972 ...)','metro'),
(11,'administratifSecteurHonorairesCcam','default',0,'','Règlements','','grille tarifaire CCAM du praticien','0'),
(12,'administratifSecteurHonorairesNgap','default',0,'','Règlements','texte','Code profession pour le secteur tarifaire NGAP','mspe'),
(13,'administratifSecteurIK','default',0,'','Règlements','texte','tarification des IK : indiquer plaine ou montagne','plaine'),
(14,'agendaDistantLink','default',0,'','Agenda','url','lien à appliquer à Agenda sur les pages MedShakeEHR. Si agendaService est configuré, alors agendaDistantLink doit être vide',''),
(15,'agendaDistantPatientsOfTheDay','default',0,'','Agenda','url','url distante où l’on peut récupérer une liste horodatée des patients du jour',''),
(16,'agendaEnvoyerChiffreParMail','default',0,'','Agenda','true/false','activer le service d\'envoi par mail de l\'agenda futur chiffré GPG',''),
(17,'agendaEnvoyerChiffreTo','default',0,'','Agenda','texte','adresse email à laquelle envoyer l\'agenda chiffré GPG - séparer par virgule si plusieurs ',''),
(18,'agendaJoursFeriesAfficher','default',0,'','Agenda','true/false','afficher les jours fériés sur l\'agenda','true'),
(19,'agendaJoursFeriesFichier','default',0,'','Agenda','fichier','fichier csv à considérer dans ressources/agenda/ soit jours-feries-seuls.csv ou jours-feries-seuls-alsace-moselle.csv','jours-feries-seuls.csv'),
(20,'agendaLocalPatientsOfTheDay','default',0,'','Agenda','fichier','fichier json de la liste horodatée des patients du jour','patientsOfTheDay.json'),
(21,'agendaModePanneauLateral','default',0,'','Agenda','true/false','Utilisation du panneau latéral (true) ou d\'une fenêtre contextuelle (false)','true'),
(22,'agendaNumberForPatientsOfTheDay','default',0,'','Agenda','nombre','Numéro d\'agenda pour générer à partir de l\'agenda interne concerné une liste des patients du jour pour le menu Patients','0'),
(23,'agendaPremierJour','default',0,'','Agenda','vide/nombre','vide pour roulant, 0 pour dimanche, 1 pour lundi, etc...','1'),
(24,'agendaRefreshDelayEvents','default',0,'','Agenda','int','délai en secondes du rafraîchissement live de l\'agenda - 0 pour jamais','10'),
(25,'agendaRefreshDelayMenuPOTD','default',0,'','Agenda','nombre','délai en secondes du rafraîchissement du menu Patients du jour - 0 pour jamais','5'),
(26,'agendaService','default',0,'','Agenda','vide/clicRDV','si non vide, active le service tiers concerné',''),
(27,'allMySmsApiKey','default',0,'','Rappels SMS','texte','API key allMySMS',''),
(28,'allMySmsLogin','default',0,'','Rappels SMS','texte','login allMySMS',''),
(29,'apiCcamNgapKey','default',0,'','Règlements','string','Clef de l\'API CCAM NGAP MedShake',''),
(30,'apiCcamNgapUrl','default',0,'','Règlements','url','URL de l\'API CCAM NGAP MedShake',''),
(31,'apicrypt2CertName','default',0,'','Apicrypt','texte','nom du certificat à utiliser',''),
(32,'apicrypt2CertPassword','default',0,'','Apicrypt','texte','mot de passe du certificat',''),
(33,'apicryptAdresse','default',0,'','Apicrypt','texte','adresse complète apicrypt, ex :  prenom.NOM@medicalXX.apicrypt.org',''),
(34,'apicryptCheminArchivesInbox','default',0,'','Apicrypt','dossier','chemin du répertoire qui sert à archiver par date de traitement les messages reçus, classés dans les dossiers comme non classés','/home/ehr/inboxArchives/'),
(35,'apicryptCheminFichierC','default',0,'','Apicrypt','dossier','répertoire de travail apicrypt, fichiers chiffrés','/home/ehr/public_html//workingDirectory/C/'),
(36,'apicryptCheminFichierNC','default',0,'','Apicrypt','dossier','répertoire de travail pour Apicrypt, fichier non chiffrés','/home/ehr/public_html//workingDirectory/NC/'),
(37,'apicryptCheminInbox','default',0,'','Apicrypt','dossier','chemin du répertoire qui sert de boite de réception, doit être en zone accessible web','/home/ehr/public_html//inbox/'),
(38,'apicryptCheminVersBinaires','default',0,'','Apicrypt','dossier','chemin vers le répertoire contenant les programmes Apicrypt en ligne de commande','/home/ehr/apicrypt/bin/'),
(39,'apicryptCheminVersClefs','default',0,'','Apicrypt','dossier','chemin vers les répertoire Clefs Apicrypt contenant les clefs de l’utilisateur','/home/ehr/apicrypt/'),
(40,'apicryptDefautSujet','default',0,'','Apicrypt','texte','sujet par défaut des mails Apicrypt (attention, n\'est pas chiffré : jamais d\'éléments d\'identité dans le sujet !)','Document concernant votre patient'),
(41,'apicryptInboxMailForUserID','default',0,'','Apicrypt','nombre','ID ou IDs numériques des comptes utilisateurs (séparés par des virgules) pour lesquels l\'utilisateur courant peut voir les mails Apicrypt relevés en inbox',''),
(42,'apicryptPopHost','default',0,'','Apicrypt','url/ip','serveur pop pour la réception des messages Apicrypt','pop.intermedic.org'),
(43,'apicryptPopPassword','default',0,'','Apicrypt','texte','mot de passe apicrypt',''),
(44,'apicryptPopPort','default',0,'','Apicrypt','nombre','port du serveur pop','110'),
(45,'apicryptPopUser','default',0,'','Apicrypt','texte','nom d\'utilisateur pour le serveur pop : prenom.NOM',''),
(46,'apicryptSmtpHost','default',0,'','Apicrypt','url/ip','serveur smtp pour l\'envoi des messages Apicrypt, en règle générale : smtp.intermedic.org','smtp.intermedic.org'),
(47,'apicryptSmtpPort','default',0,'','Apicrypt','nombre','port du serveur SMTP','587'),
(48,'apicryptUtilisateur','default',0,'','Apicrypt','texte','nom d\'utilisateur Apicrypt (portion devant le @ de l\'adresse)',''),
(49,'apicryptVersion','default',0,'','Apicrypt','texte','version d\'Apicrypt à mettre en œuvre ','1'),
(50,'clicRdvApiKey','default',0,'','clicRDV','texte','',''),
(51,'clicRdvCalId','default',0,'','clicRDV','nombre','',''),
(52,'clicRdvConsultId','default',0,'','clicRDV','JSON','',''),
(53,'clicRdvGroupId','default',0,'','clicRDV','nombre','',''),
(54,'clicRdvPassword','default',0,'','clicRDV','texte','',''),
(55,'clicRdvUserId','default',0,'','clicRDV','texte','',''),
(56,'click2callService','default',0,'','Click2call','string','nom du service Click2call à activer (OVH)',''),
(57,'designAppName','default',0,'','Ergonomie et design','texte','nom de l\'application','MedShakeEHR'),
(58,'designInboxMailsSortOrder','default',0,'','Ergonomie et design','texte','sens du tri des mails en colonne latérale : date ascendante (asc) ou descendante (desc) ','desc'),
(59,'designTopMenuDropboxCountDisplay','default',0,'','Ergonomie et design','true/false','afficher dans le menu de navigation du haut de page le nombre de fichier dans la boite de dépôt','true'),
(60,'designTopMenuInboxCountDisplay','default',0,'','Ergonomie et design','true/false','afficher dans le menu de navigation du haut de page le nombre de nouveaux messages dans la boite de réception','true'),
(61,'designTopMenuSections','default',0,'','Ergonomie et design','textarea','éléments et ordre de la barre de navigation du menu supérieur (yaml : commenter avec #)','- agenda\n- podt\n- patients\n- praticiens\n- groupes\n- registres\n- compta\n- inbox\n- dropbox\n- transmissions\n- outils'),
(62,'designTopMenuStyle','default',0,'','Ergonomie et design','icones / textes','aspect du menu de navigation du haut de page','icones'),
(63,'designTopMenuTooltipDisplay','default',0,'','Ergonomie et design','true/false','si true, affiche les infos bulles sur icones du menu supérieur',''),
(64,'designTopMenuTransmissionsColorIconeImportant','default',0,'','Ergonomie et design','true/false','colore l\'icône transmission si transmission importante non lue','true'),
(65,'designTopMenuTransmissionsColorIconeUrgent','default',0,'','Ergonomie et design','true/false','colore l\'icône transmission si transmission urgente non lue','true'),
(66,'designTopMenuTransmissionsCountDisplay','default',0,'','Ergonomie et design','true/false','afficher dans le menu de navigation du haut de page le nombre de transmissions non lues','true'),
(67,'dicomAutoSendPatient','default',0,'','DICOM','true/false','générer automatiquement le fichier worklist pour Orthanc à l\'ouverture d’un dossier patient. Ne pas mettre à true pour une secrétaire par exemple !','false'),
(68,'dicomDiscoverNewTags','default',0,'','DICOM','true/false','enregistrer automatiquement dans la base de données les nouveaux tags dicom rencontrés lors de la visualisation d\'études afin de pouvoir les associer par la suite automatiquement avec des données de formulaire MedShakeEHR','true'),
(69,'dicomHost','default',0,'','DICOM','url/ip','IP du serveur Orthanc',''),
(70,'dicomPort','default',0,'','DICOM','nombre','port de l\'API Orthanc (défaut 8042)','8042'),
(71,'dicomPrefixIdPatient','default',0,'','DICOM','texte','prefix à appliquer à l\'identifiant numérique MedShakeEHR pour en faire un identifiant DICOM unique','1.100.100'),
(72,'dicomProtocol','default',0,'','DICOM','texte','http:// ou https:// ','http://'),
(73,'dicomWorkListDirectory','default',0,'','DICOM','dossier','chemin du répertoire où Orthanc va récupérer le fichier dicom worklist généré par MedShakeEHR pour le passer à l\'appareil d\'imagerie','/home/ehr/public_html//workingDirectory/'),
(74,'dicomWorkingDirectory','default',0,'','DICOM','dossier','répertoire de travail local où on peut rapatrier des images à partir d\'Orthanc pour les parcourir ou les traiter (pdf, zip ...). Utiliser en général le même répertoire que celui indiqué dans workingDirectory des paramètres généraux. Doit être en zone web accessible','/home/ehr/public_html//workingDirectory/'),
(75,'droitDossierPeutAssignerPropresGroupesPraticienFils','default',0,'','Droits','true/false','si true, peut assigner ses propres appartenances aux groupes à un praticien créé par lui-même','false'),
(76,'droitDossierPeutCreerPraticien','default',0,'','Droits','true/false','si true, peut créer des dossiers praticiens','true'),
(77,'droitDossierPeutRechercherParPeopleExportID','default',0,'','Droits','true/false','si true, autorisation à rechercher par peopleExportID','false'),
(78,'droitDossierPeutRetirerPraticien','default',0,'','Droits','true/false','si true, peut retirer le statut praticien à un dossier (retour à patient, réciproque de droitDossierPeutCreerPraticien)','true'),
(79,'droitDossierPeutSupPatient','default',0,'','Droits','true/false','si true, peut supprimer des dossiers patients (non définitivement)','true'),
(80,'droitDossierPeutSupPraticien','default',0,'','Droits','true/false','si true, peut supprimer des dossiers praticiens (non définitivement)','true'),
(81,'droitDossierPeutTransformerPraticienEnUtilisateur','default',0,'','Droits','true/false','si true, peut rendre utilisateur un praticien','false'),
(82,'droitDossierPeutVoirUniquementPatientsGroupes','default',0,'','Droits','true/false','si true, peut voir tous les dossiers créés par les autres praticiens des groupes','false'),
(83,'droitDossierPeutVoirUniquementPatientsPropres','default',0,'','Droits','true/false','si true, peut voir tous les dossiers créés par les autres praticiens','false'),
(84,'droitDossierPeutVoirUniquementPraticiensGroupes','default',0,'','Droits','true/false','si true, peut voir uniquement les praticiens appartenant aux mêmes groupes','false'),
(85,'droitExportPeutExporterPropresData','default',0,'','Droits','true/false','si true, peut exporter ses propres datas','true'),
(86,'droitExportPeutExporterToutesDataGroupes','default',0,'','Droits','true/false','si true, peut exporter les datas générées par les autres praticiens de ses groupes','false'),
(87,'droitGroupePeutCreerGroupe','default',0,'','Droits','true/false','si true, peut créer des groupes','false'),
(88,'droitGroupePeutVoirTousGroupes','default',0,'','Droits','true/false','si true, peut voir tous les groupes ','false'),
(89,'droitMotSuiviPeutModifierSuprimerDunAutre','default',0,'','Droits','true/false','si coché, l\'utilisateur peut supprimer et modifier un mot de suivi créé par un autre','false'),
(90,'droitRegistrePeutCreerRegistre','default',0,'','Droits','true/false','si true, peut créer des registres','false'),
(91,'droitRegistrePeutGererAdministrateurs','default',0,'','Droits','true/false','si true, peut gérer les administrateurs registres','false'),
(92,'droitRegistrePeutGererGroupes','default',0,'','Droits','true/false','si true, peut gérer les groupes participant à un registre','false'),
(93,'droitStatsPeutVoirStatsGenerales','default',0,'','Droits','true/false','si true, peut voir les statistiques générales','true'),
(94,'droitUnivTagPatientPeutAjouterRetirer','default',0,'','Droits','true/false','peut ajouter ou retirer une étiquette sur un dossier patient','true'),
(95,'droitUnivTagPatientPeutCreerSuprimer','default',0,'','Droits','true/false','peut créer et supprimer des étiquettes pour les dossiers patients','true'),
(96,'droitUnivTagProPeutAjouterRetirer','default',0,'','Droits','true/false','peut ajouter ou retirer une étiquette sur un pro','true'),
(97,'droitUnivTagProPeutCreerSuprimer','default',0,'','Droits','true/false','peut créer et supprimer des étiquettes pour les pro','true'),
(98,'dropboxActiver','default',0,'','Dropbox','true/false','permet d\'activer les fonctions de dropbox externe',''),
(99,'dropboxOptions','default',0,'','Dropbox','textarea','options pour les fonctions de dropbox externe',''),
(100,'ecofaxMyNumber','default',0,'','Fax','n° fax','numéro du fax en réception, ex: 0900000000',''),
(101,'ecofaxPassword','default',0,'','Fax','texte','mot de passe du service de fax',''),
(102,'faxService','default',0,'','Fax','vide/ecofaxOVH','si non vide, active le service tiers concerné',''),
(103,'formFormulaireListingGroupes','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour le listing groupes','baseListingGroupes'),
(104,'formFormulaireListingPatients','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour le listing patients','baseListingPatients'),
(105,'formFormulaireListingPraticiens','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour le listing praticiens','baseListingPro'),
(106,'formFormulaireListingRegistres','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour le listing registres','baseListingRegistres'),
(107,'formFormulaireNouveauGroupe','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour la création d\'un nouveau groupe','baseNewGroupe'),
(108,'formFormulaireNouveauPatient','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour la création d\'un nouveau patient','baseNewPatient'),
(109,'formFormulaireNouveauPraticien','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour la création d\'un nouveau praticien','baseNewPro'),
(110,'formFormulaireNouveauRegistre','default',0,'','Formulaires système','texte','nom du formulaire à utiliser pour la création d\'un nouveau registre','baseNewRegistre'),
(111,'groupesAutoAttachProGroupsToPatient','default',0,'','Groupes','true/false','si true, attacher automatiquement les groupes du praticien aux patients créés',''),
(112,'groupesNbMaxGroupesParPro','default',0,'','Groupes','nombre','nombre maximal de groupes qu\'un praticien peut intégrer (0 = non limité)','1'),
(113,'lapActiverAllergiesStrucSur','default',0,'','LAP','texte','champs sur lesquels activer les Allergies structurées',''),
(114,'lapActiverAtcdStrucSur','default',0,'','LAP','texte','champs sur lesquels activer les atcd structurés',''),
(115,'lapAlertPatientAllaitementSup3Ans','default',0,'','LAP','true/false','alerte pour allaitement sup à 3 ans à l\'entrée dans le LAP','true'),
(116,'lapAlertPatientTermeGrossesseSup46','default',0,'','LAP','true/false','alerte pour terme sup à 46SA à l\'entrée dans le LAP','true'),
(117,'lapAllergiesStrucPersoPourAnalyse','default',0,'','LAP','texte','champs sur lesquels analyser les Allergies structurées',''),
(118,'lapAtcdStrucPersoPourAnalyse','default',0,'','LAP','texte','champs sur lesquels analyser les atcd structurés',''),
(119,'lapPrintAllergyRisk','default',0,'','LAP','true/false','imprimer les risques allergiques détectés','true'),
(120,'lapSearchDefaultType','default',0,'','LAP','texte','mode de recherche par défaut des médicaments','dci'),
(121,'lapSearchResultsSortBy','default',0,'','LAP','texte','ordre préférentiel d\'affichage des médicaments','nom'),
(122,'mailRappelActiver','default',0,'','Rappels mail','true/false','activer / désactiver les rappels par mail',''),
(123,'mailRappelDaysBeforeRDV','default',0,'','Rappels mail','nombre','nombre de jours avant le rendez-vous pour l\'expédition du rappel','3'),
(124,'mailRappelLogCampaignDirectory','default',0,'','Rappels mail','dossier','chemin du répertoire où on va loguer les rappels de rendez-vous par mail','/home/ehr/public_html//mailsRappelRdvArchives/'),
(125,'mailRappelMessage','default',0,'','Rappels mail','textarea','Les balises #heureRdv, #jourRdv et #praticien seront automatiquement remplacées dans le message envoyé','Bonjour,\\n\\nNous vous rappelons votre RDV du #jourRdv à #heureRdv avec le Dr #praticien.\\nNotez bien qu’aucun autre rendez-vous ne sera donné à un patient n’ayant pas honoré le premier.\\n\\nMerci de votre confiance,\\nÀ bientôt !\\n\\nP.S. : Ceci est un mail automatique, merci de ne pas répondre.'),
(126,'optionDossierPatientActiverCourriersCertificats','default',0,'','Options dossier patient','true/false','si true, activer courriers et certificats','true'),
(127,'optionDossierPatientActiverGestionALD','default',0,'','Options dossier patient','true/false','si true, gérer les ALD','true'),
(128,'optionDossierPatientInhiberHistoriquesParDefaut','default',0,'','Options dossier patient','true/false','si true, déactive la production des informations pour les historiques par défaut','false'),
(129,'optionGeActiverAgenda','default',0,'','Activation services','true/false','si true, activation de la gestion agenda','true'),
(130,'optionGeActiverApiRest','default',0,'','Activation services','true/false','si true, activation de l\'API REST','true'),
(131,'optionGeActiverCompta','default',0,'','Activation services','true/false','si true, activation de la gestion compta','true'),
(132,'optionGeActiverDicom','default',0,'','Activation services','true/false','si true, activation des fonctions liées au DICOM (nécessite Orthanc)','true'),
(133,'optionGeActiverDropbox','default',0,'','Activation services','true/false','permet d\'activer les fonctions de dropbox externe','false'),
(134,'optionGeActiverGroupes','default',0,'','Activation services','true/false','si true, activation de la gestion des groupes praticiens','false'),
(135,'optionGeActiverInboxApicrypt','default',0,'','Activation services','true/false','si true, activation de la inbox Apicrypt','true'),
(136,'optionGeActiverLapExterne','default',0,'','Activation services','true/false','activer / désactiver l\'utilisation d\'un LAP externe','false'),
(137,'optionGeActiverLapInterne','default',0,'','Activation services','true/false','activer / désactiver le LAP','false'),
(138,'optionGeActiverPhonecapture','default',0,'','Activation services','true/false','si true, activation de phonecapture (nécessite DICOM)','true'),
(139,'optionGeActiverRappelsRdvMail','default',0,'','Activation services','true/false','activer / désactiver les rappels par mail','false'),
(140,'optionGeActiverRappelsRdvSMS','default',0,'','Activation services','true/false','activer / désactiver les rappels par SMS','false'),
(141,'optionGeActiverRegistres','default',0,'','Activation services','true/false','si true, activation de la gestion de registres','false'),
(142,'optionGeActiverSignatureNumerique','default',0,'','Activation services','true/false','si true, activation des fonctions de signature numérique de documents','true'),
(143,'optionGeActiverTransmissions','default',0,'','Activation services','true/false','si true, activation des transmissions','true'),
(144,'optionGeActiverUnivTags','default',0,'','Activation services','true/false','activer / désactiver l\'utilisation des tags universels','false'),
(145,'optionGeActiverVitaleLecture','default',0,'','Activation services','true/false','activer / désactiver les services liés à la carte vitale','false'),
(146,'optionGeAdminActiverLiensRendreUtilisateur','default',0,'','Options','true/false','si true, l\'administrateur peut transformer des patients ou praticiens en utilisateur via les listings publiques','false'),
(147,'optionGeCreationAutoPeopleExportID','default',0,'','Options','true/false','si true, création automatique d\'un peopleExportID','true'),
(148,'optionGeDestructionDataDossierPatient','default',0,'','Options','true/false','si true, les options de destruction physique des dossiers patients sont activées','false'),
(149,'optionGeExportDataConsentementOff','default',0,'','Options','true/false','si true, exporter les données avec consentement non accepté ou retiré','true'),
(150,'optionGeExportPratListSelection','default',0,'','Options','true/false','si true, sélection possible des datas à exporter par liste praticiens, sinon auto déterminée par droits utilisateur courant','true'),
(151,'optionGeLogin2FA','default',0,'','Login','true/false','si true, activation du login à double facteur d\'authentification','false'),
(152,'optionGeLoginCreationDefaultModule','default',0,'','Login','texte','module par défaut pour création nouvel utilisateur','base'),
(153,'optionGeLoginCreationDefaultTemplate','default',0,'','Login','texte','template par défaut pour création nouvel utilisateur',''),
(154,'optionGeLoginPassAttribution','default',0,'','Login','texte','méthode d\'attribution des mots de passe utilisateur : admin / random','admin'),
(155,'optionGeLoginPassMinLongueur','default',0,'','Login','int','longueur minimale autorisée du mot de passe utilisateur','10'),
(156,'optionGeLoginPassOnlineRecovery','default',0,'','Login','true/false','possibilité de réinitialiser son mot de passe perdu via email ','false'),
(157,'optionGePatientOuvrirApresCreation','default',0,'','Options','dossier / liens','où rediriger après création d\'un nouveau patient','liens'),
(158,'optionGePraticienMontrerPatientsLies','default',0,'','Options','true/false','si true, montrer les patients liés au praticien sur la fiche pro','true'),
(159,'optionsActiverMotSuivi','default',0,'','Options','true/false','activer / désactiver le mot suivi sur le dossier d\'un patient',''),
(160,'optionsDossierPatientActiverMotSuivi','default',0,'','Options dossier patient','true/false','activer / désactiver les mots de suivi dans le dossier patient','false'),
(161,'optionsDossierPatientNbMotSuiviAfficher','default',0,'','Options dossier patient','int','nombre de mots de suivi à afficher par défaut dans un dossier patient','6'),
(162,'ovhApplicationKey','default',0,'','Click2call','string','OVH Application Key',''),
(163,'ovhApplicationSecret','default',0,'','Click2call','string','OVH Application Secret',''),
(164,'ovhConsumerKey','default',0,'','Click2call','string','OVH Consumer Key',''),
(165,'ovhTelecomBillingAccount','default',0,'','Click2call','string','Informations sur la ligne > Nom du groupe',''),
(166,'ovhTelecomCallingNumber','default',0,'','Click2call','string','Numéro de l\'appelant au format international 0033xxxxxxxxxx',''),
(167,'ovhTelecomIntercom','default',0,'','Click2call','true/false','Activer le mode intercom',''),
(168,'ovhTelecomServiceName','default',0,'','Click2call','string','Numéro de la ligne au format international 0033xxxxxxxxxx',''),
(169,'phonecaptureCookieDuration','default',0,'','Phonecapture','nombre','durée de vie d\'identification d\'un périphérique pour PhoneCapture','31104000'),
(170,'phonecaptureFingerprint','default',0,'','Phonecapture','texte','chaîne aléatoire permettant une sécurisation de l\'identification des périphériques PhoneCapture','phonecapture'),
(171,'phonecaptureResolutionHeight','default',0,'','Phonecapture','nombre',' résolution des photos, hauteur','1080'),
(172,'phonecaptureResolutionWidth','default',0,'','Phonecapture','nombre','résolution des photos, largeur','1920'),
(173,'signPeriphName','default',0,'','Options','texte','nom du périphérique pour signature (caractères alphanumériques, sans espaces ni accents)','default'),
(174,'smsCreditsFile','default',0,'','Rappels SMS','fichier','nom du fichier qui contient le nombre de SMS restants','creditsSMS.txt'),
(175,'smsDaysBeforeRDV','default',0,'','Rappels SMS','nombre','nombre de jours avant le rendez-vous pour l\'expédition du rappel SMS','3'),
(176,'smsLogCampaignDirectory','default',0,'','Rappels SMS','dossier','chemin du répertoire où on va loguer les rappels de rendez-vous par SMS','/home/ehr/public_html//smsArchives/'),
(177,'smsProvider','default',0,'','Rappels SMS','url/ip','active le service tiers concerné',''),
(178,'smsRappelActiver','default',0,'','Rappels SMS','true/false','activer / désactiver les rappels par SMS',''),
(179,'smsRappelMessage','default',0,'','Rappels SMS','textarea','Les balises #heureRdv, #jourRdv et #praticien seront automatiquement remplacées dans le message envoyé','Rappel: Vous avez rdv à #heureRdv le #jourRdv avec le Dr #praticien'),
(180,'smsSeuilCreditsAlerte','default',0,'','Rappels SMS','nombre','prévenir dans l\'interface du logiciel si crédit inférieur ou égale à','150'),
(181,'smsTpoa','default',0,'','Rappels SMS','texte','La balise #praticien sera automatiquement remplacée dans le message envoyé','Dr #praticien'),
(182,'smsTypeRdvPourRappel','default',0,'','Rappels SMS','vide/text','N\'envoyer les rappels SMS que pour les types de rendez-vous listés (placer les types de RDV entre \"[]\" et séparés par des virgules, ex : \"[C1],[C2]\"), laisser vide pour envoyer des rappels pour tous les types de rendez-vous.',''),
(183,'smtpDefautSujet','default',0,'','Mail','texte','titre par défaut du mail expédié','Document vous concernant'),
(184,'smtpFrom','default',0,'','Mail','email','adresse de l’expéditeur des messages, ex: user@domain.net',''),
(185,'smtpFromName','default',0,'','Mail','texte','nom en clair de l\'expéditeur des messages',''),
(186,'smtpHost','default',0,'','Mail','url/ip','serveur SMTP',''),
(187,'smtpOptions','default',0,'','Mail','texte','options pour désactiver quelques options de sécurités','off'),
(188,'smtpPassword','default',0,'','Mail','texte','mot de passe pour le serveur SMTP',''),
(189,'smtpPort','default',0,'','Mail','nombre','port du serveur SMTP','587'),
(190,'smtpSecureType','default',0,'','Mail','texte','protocole ssl ou tls (ou rien)','tls'),
(191,'smtpTracking','default',0,'','Mail','texte','permet d\'activer le tracking des mails envoyés via un service tiers',''),
(192,'smtpUsername','default',0,'','Mail','texte','login pour le serveur SMTP',''),
(193,'statsExclusionCats','default',0,'','Statistiques','liste','liste des noms des catégories de formulaires à exclure des statistiques ','catTypeCsATCD,csAutres,declencheur'),
(194,'statsExclusionPatients','default',0,'','Statistiques','liste','liste des ID des dossiers tests à exclure des statistiques ',''),
(195,'templateCourrierHeadAndFoot','default',0,'','Modèles de documents','fichier','template pour les courriers','base-page-headAndNoFoot.html.twig'),
(196,'templateCrHeadAndFoot','default',0,'','Modèles de documents','fichier','template pour les compte-rendus','base-page-headAndNoFoot.html.twig'),
(197,'templateDefautPage','default',0,'','Modèles de documents','fichier','template par défaut pour l\'impression','base-page-headAndFoot.html.twig'),
(198,'templateOrdoALD','default',0,'','Modèles de documents','fichier','template (complet) pour les ordonnances bizones ALD','ordonnanceALD.html.twig'),
(199,'templateOrdoBody','default',0,'','Modèles de documents','fichier','template pour le corps des ordonnances standards','ordonnanceBody.html.twig'),
(200,'templateOrdoHeadAndFoot','default',0,'','Modèles de documents','fichier','template pour header et footer des ordonnances standards (non ALD)','base-page-headAndFoot.html.twig'),
(201,'templatesCdaFolder','default',0,'','Modèles de documents','dossier','répertoire des fichiers de template pour la génération de XML CDA','/home/ehr/templates/CDA/'),
(202,'templatesPdfFolder','default',0,'','Modèles de documents','dossier','répertoire des fichiers de template pour la génération de PDF','/home/ehr/templates/models4print/'),
(203,'theriaqueMode','default',0,'','LAP','texte','code d\'utilisation de Thériaque : WS (webservice) ou PG (base postgre en local)',''),
(204,'theriaquePgDbName','default',0,'','LAP','texte','nom de la base postgre',''),
(205,'theriaquePgDbPassword','default',0,'','LAP','texte','mot de passe postgre',''),
(206,'theriaquePgDbUser','default',0,'','LAP','texte','nom d\'utilisateur postgre',''),
(207,'theriaqueShowMedicHospi','default',0,'','LAP','true/false','voir les médicaments hospitaliers','true'),
(208,'theriaqueShowMedicNonComer','default',0,'','LAP','true/false','voir les médicaments non commercialisés','false'),
(209,'theriaqueWsURL','default',0,'','LAP','texte','url du webservice Thériaque',''),
(210,'transmissionsDefautDestinataires','default',0,'','Transmissions','liste','ID des utilisateurs, séparés par des virgules (sans espace)',''),
(211,'transmissionsNbParPage','default',0,'','Transmissions','nombre entier','nombre de transmissions par page','30'),
(212,'transmissionsPeutCreer','default',0,'','Transmissions','true/false','peut créer des transmissions','true'),
(213,'transmissionsPeutRecevoir','default',0,'','Transmissions','true/false','peut recevoir des transmissions','true'),
(214,'transmissionsPeutVoir','default',0,'','Transmissions','true/false','peut accéder aux transmissions','true'),
(215,'transmissionsPurgerNbJours','default',0,'','Transmissions','nombre entier','nombre de jours sans update après lequel une transmission sera supprimée de la base de données (0 = jamais)','365'),
(216,'utiliserLapExterne','default',0,'','LAP','true/false','activer / désactiver l\'utilisation d\'un LAP externe',''),
(217,'utiliserLapExterneName','default',0,'','LAP','texte','nom du LAP externe',''),
(218,'vitaleActiver','default',0,'','Vitale','true/false','activer / désactiver les services liés à la carte vitale',''),
(219,'vitaleHoteLecteurIP','default',0,'','Vitale','texte','IP sur le réseau interne de la machine supportant le lecteur',''),
(220,'vitaleMode','default',0,'','Vitale','texte','simple / complet','simple'),
(221,'vitaleNomRessourceLecteur','default',0,'','Vitale','texte','nomRessourceLecteur',''),
(222,'vitaleNomRessourcePS','default',0,'','Vitale','texte','nomRessourcePS',''),
(223,'vitaleService','default',0,'','Vitale','texte','service tiers de gestion vitale','');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_cat`
--

DROP TABLE IF EXISTS `data_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_cat` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `groupe` enum('admin','medical','typecs','mail','doc','courrier','ordo','reglement','dicom','user','relation','system') NOT NULL DEFAULT 'admin',
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` enum('base','module','user') NOT NULL DEFAULT 'base',
  `fromID` smallint(5) unsigned NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_cat`
--

LOCK TABLES `data_cat` WRITE;
/*!40000 ALTER TABLE `data_cat` DISABLE KEYS */;
INSERT INTO `data_cat` VALUES
(1,'admin','activity','Activités','Activités professionnelles et de loisir','base',1,'2019-01-01 00:00:00'),
(2,'admin','addressPerso','Adresse personnelle','datas de l\'adresse personnelle','base',1,'2019-01-01 00:00:00'),
(3,'admin','adressPro','Adresse professionnelle','Data de l\'adresse professionnelle','base',1,'2019-01-01 00:00:00'),
(4,'admin','catDataAdminGroupe','Datas groupe','datas relatives à l\'identification d\'un groupe','base',1,'2019-01-01 00:00:00'),
(5,'admin','catDataAdminRegistre','Datas registre','datas relatives à l\'identification d\'un registre','base',1,'2019-01-01 00:00:00'),
(6,'admin','catMarqueursAdminDossiers','Marqueurs','marqueurs dossiers','base',1,'2019-01-01 00:00:00'),
(7,'admin','clicRDV','clicRDV','Paramètres pour clicRDV','base',1,'2019-01-01 00:00:00'),
(8,'admin','contact','Contact','Moyens de contact','base',1,'2019-01-01 00:00:00'),
(9,'admin','divers','Divers','Divers','base',1,'2019-01-01 00:00:00'),
(10,'admin','identity','Etat civil','Datas relatives à l\'identité d\'une personne','base',1,'2019-01-01 00:00:00'),
(11,'admin','internet','Internet','Datas liées aux services internet','base',1,'2019-01-01 00:00:00'),
(12,'admin','numAdmin','Numéros administratifs','RPPS et compagnie','base',1,'2019-01-01 00:00:00'),
(13,'courrier','catModelesCertificats','Certificats','certificats divers','base',1,'2019-01-01 00:00:00'),
(14,'courrier','catModelesCourriers','Courriers','modèles de courrier libres','base',1,'2019-01-01 00:00:00'),
(15,'courrier','catModelesDocASigner','Documents à signer','documents à envoyer à la signature numérique','base',1,'2019-01-01 00:00:00'),
(16,'courrier','catModelesMailsToApicrypt','Mails aux praticiens','modèles de mails pour les praticien (apicrypt)','base',1,'2019-01-01 00:00:00'),
(17,'courrier','catModelesMailsToPatient','Mails aux patients','modèles de mail','base',1,'2019-01-01 00:00:00'),
(18,'dicom','idDicom','ID Dicom','ID du dicom','base',1,'2019-01-01 00:00:00'),
(19,'doc','docForm','Data documents importés / créés','données pour le formulaire documents importés ou créés','base',1,'2019-01-01 00:00:00'),
(20,'doc','docPorteur','Porteur','porteur pour doc importés','base',1,'2019-01-01 00:00:00'),
(21,'mail','dataSms','Data sms','data pour les sms envoyés','base',1,'2019-01-01 00:00:00'),
(22,'mail','mailForm','Data mail','data pour les mails expédiés','base',1,'2019-01-01 00:00:00'),
(23,'mail','porteursTech','Porteurs','porteurs pour les données enfants','base',1,'2019-01-01 00:00:00'),
(24,'medical','aldCat','ALD','paramètres pour la gestion des ALD','base',1,'2019-01-01 00:00:00'),
(25,'medical','atcd','Antécédents et synthèses','antécédents et synthèses','base',1,'2019-01-01 00:00:00'),
(26,'medical','catAtcdStruc','ATCD structurés','données pour antécédents structurés','base',1,'2019-01-01 00:00:00'),
(27,'medical','catDataTransversesFormCs','Données transverses','champs utilisables dans tous formulaires (codage des actes par exemple)','base',1,'2019-01-01 00:00:00'),
(28,'medical','dataBio','Données biologiques','Données biologiques habituelles','base',1,'2019-01-01 00:00:00'),
(29,'medical','dataCliniques','Données cliniques','Données cliniques','base',1,'2019-01-01 00:00:00'),
(30,'medical','dataCsBase','Données formulaire Cs','','base',1,'2019-01-01 00:00:00'),
(31,'medical','grossesse','Grossesse','Données liées à la grossesse','base',1,'2019-01-01 00:00:00'),
(32,'ordo','lapCatLignePrescription','LAP ligne de prescription','data des lignes de prescription','base',1,'2019-01-01 00:00:00'),
(33,'ordo','lapCatMedicament','LAP médicament','data pour les médicaments','base',1,'2019-01-01 00:00:00'),
(34,'ordo','lapCatPorteurs','LAP porteurs','data pour les porteurs LAP','base',1,'2019-01-01 00:00:00'),
(35,'ordo','lapCatSams','LAP SAMs','data pour SAMs LAP','base',1,'2019-01-01 00:00:00'),
(36,'ordo','lapExterne','LAP Externe','','base',1,'2019-01-01 00:00:00'),
(37,'ordo','ordoItems','Ordo','items d\'une ordonnance','base',1,'2019-01-01 00:00:00'),
(38,'ordo','porteursOrdo','Porteurs','porteurs ordonnance','base',1,'2019-01-01 00:00:00'),
(39,'reglement','porteursReglement','Porteurs','porteur d\'un règlement','base',1,'2019-01-01 00:00:00'),
(40,'reglement','reglementItems','Règlement','items d\'un réglement','base',1,'2019-01-01 00:00:00'),
(41,'relation','catAllergiesStruc','Allergies structurées','données pour allergies structurées','base',1,'2019-01-01 00:00:00'),
(42,'relation','relationRelations','Relations','types permettant de définir une relation','base',1,'2019-01-01 00:00:00'),
(43,'system','catTypesUsageSystem','Types à usage system','types à usage system','base',1,'2019-01-01 00:00:00'),
(44,'typecs','catTypeCsATCD','Antécédents et allergies','antécédents et allergies','base',1,'2019-01-01 00:00:00'),
(45,'typecs','csAutres','Autres','autres','base',1,'2019-01-01 00:00:00'),
(46,'typecs','csBase','Consultations','consultations possibles','base',1,'2019-01-01 00:00:00'),
(47,'typecs','declencheur','Déclencheur','','base',1,'2019-01-01 00:00:00'),
(48,'typecs','declencheursHorsHistoriques','Déclencheurs hors historiques','ne donnent pas de ligne dans les historiques','base',1,'2019-01-01 00:00:00');
/*!40000 ALTER TABLE `data_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupe` enum('admin','medical','typecs','mail','doc','courrier','ordo','reglement','dicom','user','relation','system') NOT NULL DEFAULT 'admin',
  `name` varchar(60) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `label` mediumtext DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `validationRules` varchar(255) DEFAULT NULL,
  `validationErrorMsg` varchar(255) DEFAULT NULL,
  `formType` enum('','date','email','number','select','submit','tel','text','textarea','password','checkbox','hidden','range','radio','reset','switch') NOT NULL DEFAULT '',
  `formValues` mediumtext DEFAULT NULL,
  `module` varchar(20) NOT NULL DEFAULT 'base',
  `cat` smallint(5) unsigned DEFAULT NULL,
  `fromID` smallint(5) unsigned DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
  `durationLife` int(10) unsigned NOT NULL DEFAULT 86400,
  `displayOrder` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `groupe` (`groupe`),
  KEY `cat` (`cat`),
  KEY `groupe_2` (`groupe`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES
(1,'admin','job','activité professionnelle','Activité professionnelle','Activité professionnelle','','L\'activité professionnelle n\'est pas correcte','textarea','','base',1,1,'2019-01-01 00:00:00',3600,1),
(2,'admin','sport','sport exercé','Sport','Sport exercé','','Le sport indiqué n\'est pas correct','text','','base',1,1,'2019-01-01 00:00:00',3600,1),
(3,'admin','city','ville','Ville','Adresse perso : ville','','','text','','base',2,1,'2019-01-01 00:00:00',3600,1),
(4,'admin','country','','Pays','Adresse perso : pays','','','select','---\n\"\": \"\"\nAFG: Afghanistan\nZAF: Afrique du Sud\nALB: Albanie\nDZA: Algérie\nDEU: Allemagne\nAND: Andorre\nAGO: Angola\nAIA: Anguilla\nATA: Antarctique\nATG: Antigua-et-Barbuda\nSAU: Arabie saoudite\nARG: Argentine\nARM: Arménie\nABW: Aruba\nAUS: Australie\nAUT: Autriche\nAZE: Azerbaïdjan\nBHS: Bahamas\nBHR: Bahreïn\nBGD: Bangladesh\nBRB: Barbade\nBEL: Belgique\nBLZ: Belize\nBEN: Bénin\nBMU: Bermudes\nBTN: Bhoutan\nBLR: Biélorussie\nMMR: Birmanie\nBOL: Bolivie\nBIH: Bosnie-Herzégovine\nBWA: Botswana\nBRA: Brésil\nBRN: Brunei\nBGR: Bulgarie\nBFA: Burkina Faso\nBDI: Burundi\nKHM: Cambodge\nCMR: Cameroun\nCAN: Canada\nCPV: Cap-Vert\nCHL: Chili\nCHN: Chine\nCYP: \"Chypre (pays)\\t\"\nCOL: Colombie\nCOM: Comores (pays)\nPRK: Corée du Nord\nKOR: Corée du Sud\nCRI: Costa Rica\nCIV: Côte d\'Ivoire\nHRV: Croatie\nCUB: Cuba\nCUW: Curaçao\nDNK: Danemark\nDJI: Djibouti\nDMA: Dominique\nEGY: Égypte\nARE: Émirats arabes unis\nECU: Équateur (pays)\nERI: Érythrée\nESP: Espagne\nEST: Estonie\nFSM: États fédérés de Micronésie (pays)\nUSA: États-Unis\nETH: Éthiopie\nFJI: Fidji\nFIN: Finlande\nFRA: France\nGAB: Gabon\nGMB: Gambie\nGEO: Géorgie (pays)\nSGS: Géorgie du Sud-et-les îles Sandwich du Sud\nGHA: Ghana\nGIB: Gibraltar\nGRC: Grèce\nGRD: \"Grenade (pays)\\t\"\nGRL: Groenland\nGLP: Guadeloupe\nGUM: Guam\nGTM: Guatemala\nGGY: Guernesey\nGIN: Guinée\nGNQ: Guinée équatoriale\nGNB: Guinée-Bissau\nGUY: Guyana\nGUF: Guyane\nHTI: Haïti\nHND: Honduras\nHKG: Hong Kong\nHUN: Hongrie\nBVT: \'  Île Bouvet\'\nCXR: Île Christmas\nIMN: Île de Man\nNFK: Île Norfolk\nALA: Îles Åland\nCYM: Îles Caïmans\nCCK: Îles Cocos\nCOK: Îles Cook\nFRO: Îles Féroé\nHMD: Îles Heard-et-MacDonald\nMNP: Îles Mariannes du Nord\nMHL: Îles Marshall (pays)\nUMI: \'  Îles mineures éloignées des États-Unis\'\nPCN: Îles Pitcairn\nTCA: Îles Turques-et-Caïques\nVGB: Îles Vierges britanniques\nVIR: Îles Vierges des États-Unis\nIND: Inde\nIDN: Indonésie\nIRQ: Irak\nIRN: Iran\nIRL: \"Irlande (pays)\\t\"\nISL: Islande\nISR: Israël\nITA: Italie\nJAM: Jamaïque\nJPN: Japon\nJEY: Jersey\nJOR: Jordanie\nKAZ: Kazakhstan\nKEN: Kenya\nKGZ: Kirghizistan\nKIR: Kiribati\nKWT: Koweït\nREU: La Réunion\nLAO: Laos\nLSO: Lesotho\nLVA: Lettonie\nLBN: Liban\nLBR: Liberia\nLBY: Libye\nLIE: Liechtenstein\nLTU: Lituanie\nLUX: Luxembourg (pays)\nMAC: Macao\nMKD: Macédoine du Nord\nMDG: Madagascar\nMYS: Malaisie\nMWI: Malawi\nMDV: Maldives\nMLI: Mali\nFLK: Malouines\nMLT: Malte\nMAR: Maroc\nMTQ: Martinique\nMUS: Maurice (pays)\nMRT: Mauritanie\nMYT: Mayotte\nMEX: Mexique\nMDA: Moldavie\nMCO: Monaco\nMNG: Mongolie\nMNE: Monténégro\nMSR: Montserrat\nMOZ: Mozambique\nNAM: Namibie\nNRU: Nauru\nNPL: Népal\nNIC: Nicaragua\nNER: Niger\nNGA: Nigeria\nNIU: Niue\nNOR: Norvège\nNCL: Nouvelle-Calédonie\nNZL: Nouvelle-Zélande\nOMN: Oman\nUGA: Ouganda\nUZB: Ouzbékistan\nPAK: Pakistan\nPLW: Palaos\nPSE: Palestine\nPAN: Panama\nPNG: Papouasie-Nouvelle-Guinée\nPRY: Paraguay\nNLD: Pays-Bas\nBES: Pays-Bas caribéens\nPER: Pérou\nPHL: Philippines\nPOL: Pologne\nPYF: Polynésie française\nPRI: Porto Rico\nPRT: Portugal\nQAT: Qatar\nESH: République arabe sahraouie démocratique\nCAF: République centrafricaine\nCOD: République démocratique du Congo\nDOM: République dominicaine\nCOG: République du Congo\nROU: Roumanie\nGBR: Royaume-Uni\nRUS: Russie\nRWA: Rwanda\nBLM: Saint-Barthélemy\nKNA: Saint-Christophe-et-Niévès\nSMR: Saint-Marin\nMAF: Saint-Martin\nSXM: Saint-Martin\nSPM: Saint-Pierre-et-Miquelon\nVAT: \'  Saint-Siège (État de la Cité du Vatican)\'\nVCT: Saint-Vincent-et-les-Grenadines\nSHN: Sainte-Hélène, Ascension et Tristan da Cunha\nLCA: Sainte-Lucie\nSLB: Salomon\nSLV: Salvador\nWSM: Samoa\nASM: Samoa américaines\nSTP: Sao Tomé-et-Principe\nSEN: Sénégal\nSRB: Serbie\nSYC: Seychelles\nSLE: Sierra Leone\nSGP: Singapour\nSVK: Slovaquie\nSVN: Slovénie\nSOM: Somalie\nSDN: Soudan\nSSD: Soudan du Sud\nLKA: Sri Lanka\nSWE: Suède\nCHE: Suisse\nSUR: Suriname\nSJM: Svalbard et ile Jan Mayen\nSWZ: Swaziland\nSYR: Syrie\nTJK: Tadjikistan\nTWN: Taïwan / (République de Chine (Taïwan))\nTZA: Tanzanie\nTCD: Tchad\nCZE: Tchéquie\nATF: Terres australes et antarctiques françaises\nIOT: Territoire britannique de l\'océan Indien\nTHA: Thaïlande\nTLS: Timor oriental\nTGO: Togo\nTKL: Tokelau\nTON: Tonga\nTTO: Trinité-et-Tobago\nTUN: Tunisie\nTKM: Turkménistan\nTUR: Turquie\nTUV: Tuvalu\nUKR: Ukraine\nURY: Uruguay\nVUT: Vanuatu\nVEN: Venezuela\nVNM: Viêt Nam\nWLF: Wallis-et-Futuna\nYEM: Yémen\nZMB: Zambie\nZWE: Zimbabwe\n...\n','base',2,1,'2019-01-01 00:00:00',3600,13),
(5,'admin','postalCodePerso','code postal','Code postal','Adresse perso : code postal','','Le code postal n\'est pas correct','text','','base',2,1,'2019-01-01 00:00:00',3600,1),
(6,'admin','street','type et nom de la voie','Voie','Adresse perso : voie','','','text','','base',2,1,'2019-01-01 00:00:00',3600,1),
(7,'admin','streetNumber','n° dans la voie','n°','Adresse perso : n° dans la voie','','Le numéro de voie est incorrect','text','','base',2,1,'2019-01-01 00:00:00',3600,1),
(8,'admin','codePostalPro','code postal','Code postal','Adresse pro : code postal','','Le code postal n\'est pas conforme','text','','base',3,1,'2019-01-01 00:00:00',3600,1),
(9,'admin','etablissementAdressePro','établissement','Établissement','Adresse pro : établissement','','','text','','base',3,1,'2019-01-01 00:00:00',3600,1),
(10,'admin','numAdressePro','n° dans la voie','n°','Adresse pro : n° dans la voie','','Le numero n\'est pas conforme','text','','base',3,1,'2019-01-01 00:00:00',3600,1),
(11,'admin','paysAdressePro','','Pays','Adresse pro : pays','','','select','---\n\"\": \"\"\nAFG: Afghanistan\nZAF: Afrique du Sud\nALB: Albanie\nDZA: Algérie\nDEU: Allemagne\nAND: Andorre\nAGO: Angola\nAIA: Anguilla\nATA: Antarctique\nATG: Antigua-et-Barbuda\nSAU: Arabie saoudite\nARG: Argentine\nARM: Arménie\nABW: Aruba\nAUS: Australie\nAUT: Autriche\nAZE: Azerbaïdjan\nBHS: Bahamas\nBHR: Bahreïn\nBGD: Bangladesh\nBRB: Barbade\nBEL: Belgique\nBLZ: Belize\nBEN: Bénin\nBMU: Bermudes\nBTN: Bhoutan\nBLR: Biélorussie\nMMR: Birmanie\nBOL: Bolivie\nBIH: Bosnie-Herzégovine\nBWA: Botswana\nBRA: Brésil\nBRN: Brunei\nBGR: Bulgarie\nBFA: Burkina Faso\nBDI: Burundi\nKHM: Cambodge\nCMR: Cameroun\nCAN: Canada\nCPV: Cap-Vert\nCHL: Chili\nCHN: Chine\nCYP: \"Chypre (pays)\\t\"\nCOL: Colombie\nCOM: Comores (pays)\nPRK: Corée du Nord\nKOR: Corée du Sud\nCRI: Costa Rica\nCIV: Côte d\'Ivoire\nHRV: Croatie\nCUB: Cuba\nCUW: Curaçao\nDNK: Danemark\nDJI: Djibouti\nDMA: Dominique\nEGY: Égypte\nARE: Émirats arabes unis\nECU: Équateur (pays)\nERI: Érythrée\nESP: Espagne\nEST: Estonie\nFSM: États fédérés de Micronésie (pays)\nUSA: États-Unis\nETH: Éthiopie\nFJI: Fidji\nFIN: Finlande\nFRA: France\nGAB: Gabon\nGMB: Gambie\nGEO: Géorgie (pays)\nSGS: Géorgie du Sud-et-les îles Sandwich du Sud\nGHA: Ghana\nGIB: Gibraltar\nGRC: Grèce\nGRD: \"Grenade (pays)\\t\"\nGRL: Groenland\nGLP: Guadeloupe\nGUM: Guam\nGTM: Guatemala\nGGY: Guernesey\nGIN: Guinée\nGNQ: Guinée équatoriale\nGNB: Guinée-Bissau\nGUY: Guyana\nGUF: Guyane\nHTI: Haïti\nHND: Honduras\nHKG: Hong Kong\nHUN: Hongrie\nBVT: \'  Île Bouvet\'\nCXR: Île Christmas\nIMN: Île de Man\nNFK: Île Norfolk\nALA: Îles Åland\nCYM: Îles Caïmans\nCCK: Îles Cocos\nCOK: Îles Cook\nFRO: Îles Féroé\nHMD: Îles Heard-et-MacDonald\nMNP: Îles Mariannes du Nord\nMHL: Îles Marshall (pays)\nUMI: \'  Îles mineures éloignées des États-Unis\'\nPCN: Îles Pitcairn\nTCA: Îles Turques-et-Caïques\nVGB: Îles Vierges britanniques\nVIR: Îles Vierges des États-Unis\nIND: Inde\nIDN: Indonésie\nIRQ: Irak\nIRN: Iran\nIRL: \"Irlande (pays)\\t\"\nISL: Islande\nISR: Israël\nITA: Italie\nJAM: Jamaïque\nJPN: Japon\nJEY: Jersey\nJOR: Jordanie\nKAZ: Kazakhstan\nKEN: Kenya\nKGZ: Kirghizistan\nKIR: Kiribati\nKWT: Koweït\nREU: La Réunion\nLAO: Laos\nLSO: Lesotho\nLVA: Lettonie\nLBN: Liban\nLBR: Liberia\nLBY: Libye\nLIE: Liechtenstein\nLTU: Lituanie\nLUX: Luxembourg (pays)\nMAC: Macao\nMKD: Macédoine du Nord\nMDG: Madagascar\nMYS: Malaisie\nMWI: Malawi\nMDV: Maldives\nMLI: Mali\nFLK: Malouines\nMLT: Malte\nMAR: Maroc\nMTQ: Martinique\nMUS: Maurice (pays)\nMRT: Mauritanie\nMYT: Mayotte\nMEX: Mexique\nMDA: Moldavie\nMCO: Monaco\nMNG: Mongolie\nMNE: Monténégro\nMSR: Montserrat\nMOZ: Mozambique\nNAM: Namibie\nNRU: Nauru\nNPL: Népal\nNIC: Nicaragua\nNER: Niger\nNGA: Nigeria\nNIU: Niue\nNOR: Norvège\nNCL: Nouvelle-Calédonie\nNZL: Nouvelle-Zélande\nOMN: Oman\nUGA: Ouganda\nUZB: Ouzbékistan\nPAK: Pakistan\nPLW: Palaos\nPSE: Palestine\nPAN: Panama\nPNG: Papouasie-Nouvelle-Guinée\nPRY: Paraguay\nNLD: Pays-Bas\nBES: Pays-Bas caribéens\nPER: Pérou\nPHL: Philippines\nPOL: Pologne\nPYF: Polynésie française\nPRI: Porto Rico\nPRT: Portugal\nQAT: Qatar\nESH: République arabe sahraouie démocratique\nCAF: République centrafricaine\nCOD: République démocratique du Congo\nDOM: République dominicaine\nCOG: République du Congo\nROU: Roumanie\nGBR: Royaume-Uni\nRUS: Russie\nRWA: Rwanda\nBLM: Saint-Barthélemy\nKNA: Saint-Christophe-et-Niévès\nSMR: Saint-Marin\nMAF: Saint-Martin\nSXM: Saint-Martin\nSPM: Saint-Pierre-et-Miquelon\nVAT: \'  Saint-Siège (État de la Cité du Vatican)\'\nVCT: Saint-Vincent-et-les-Grenadines\nSHN: Sainte-Hélène, Ascension et Tristan da Cunha\nLCA: Sainte-Lucie\nSLB: Salomon\nSLV: Salvador\nWSM: Samoa\nASM: Samoa américaines\nSTP: Sao Tomé-et-Principe\nSEN: Sénégal\nSRB: Serbie\nSYC: Seychelles\nSLE: Sierra Leone\nSGP: Singapour\nSVK: Slovaquie\nSVN: Slovénie\nSOM: Somalie\nSDN: Soudan\nSSD: Soudan du Sud\nLKA: Sri Lanka\nSWE: Suède\nCHE: Suisse\nSUR: Suriname\nSJM: Svalbard et ile Jan Mayen\nSWZ: Swaziland\nSYR: Syrie\nTJK: Tadjikistan\nTWN: Taïwan / (République de Chine (Taïwan))\nTZA: Tanzanie\nTCD: Tchad\nCZE: Tchéquie\nATF: Terres australes et antarctiques françaises\nIOT: Territoire britannique de l\'océan Indien\nTHA: Thaïlande\nTLS: Timor oriental\nTGO: Togo\nTKL: Tokelau\nTON: Tonga\nTTO: Trinité-et-Tobago\nTUN: Tunisie\nTKM: Turkménistan\nTUR: Turquie\nTUV: Tuvalu\nUKR: Ukraine\nURY: Uruguay\nVUT: Vanuatu\nVEN: Venezuela\nVNM: Viêt Nam\nWLF: Wallis-et-Futuna\nYEM: Yémen\nZMB: Zambie\nZWE: Zimbabwe\n...\n','base',3,1,'2019-01-01 00:00:00',3600,13),
(12,'admin','rueAdressePro','type et nom de la voie','Voie','Adresse pro : voie','','','text','','base',3,1,'2019-01-01 00:00:00',3600,1),
(13,'admin','serviceAdressePro','service','Service','Adresse pro : service','','','text','','base',3,1,'2019-01-01 00:00:00',3600,1),
(14,'admin','villeAdressePro','ville','Ville','Adresse pro : ville','','','text','','base',3,1,'2019-01-01 00:00:00',3600,1),
(15,'medical','aldCIM10','','Code CIM10 associé','Code CIM10 attaché à l\'ALD','','','text','','base',24,1,'2019-01-01 00:00:00',3600,0),
(16,'medical','aldCIM10label','','Label CIM10 associé','Label CIM10 attaché à l\'ALD','','','text','','base',24,1,'2019-01-01 00:00:00',3600,0),
(17,'medical','aldDateDebutPriseEnCharge','','Début de prise en charge','date de début de prise en charge','','','date','','base',24,1,'2019-01-01 00:00:00',3600,0),
(18,'medical','aldDateFinPriseEnCharge','','Fin de prise en charge','date de fin de prise en charge','','','date','','base',24,1,'2019-01-01 00:00:00',3600,0),
(19,'medical','aldNumber','','ALD','ALD choisie','','','select','---\n1: Accident vasculaire cérébral invalidant\n2: Insuffisances médullaires et autres cytopénies chroniques\n3: Artériopathies chroniques avec manifestations ischémiques\n4: Bilharziose compliquée\n5: Insuffisance cardiaque grave, troubles du rythme graves, cardiopathies valvulaires\n  graves, cardiopathies  congénitales graves\n6: Maladies chroniques actives du foie et cirrhoses\n7: \'Déficit immunitaire primitif grave nécessitant un traitement prolongé, infection\n  par le virus de 9: l\'\'immuno-déficience humaine (VIH)\'\n8: Diabète de type 1 et diabète de type 2\n9: Formes graves des affections neurologiques et musculaires (dont myopathie), épilepsie\n  grave\n10: Hémoglobinopathies, hémolyses, chroniques constitutionnelles et acquises sévères\n11: Hémophilies et affections constitutionnelles de l\'hémostase graves\n12: Maladie coronaire\n13: Insuffisance respiratoire chronique grave\n14: Maladie d\'Alzheimer et autres démences\n15: Maladie de Parkinson\n16: Maladies métaboliques héréditaires nécessitant un traitement prolongé spécialisé\n17: Mucoviscidose\n18: Néphropathie chronique grave et syndrome néphrotique primitif\n19: Paraplégie\n20: Vascularites, lupus érythémateux systémique, sclérodermie systémique\n21: Polyarthrite rhumatoïde évolutive\n22: Affections psychiatriques de longue durée\n23: Rectocolite hémorragique et maladie de Crohn évolutives\n24: Sclérose en plaques\n25: Scoliose idiopathique structurale évolutive (dont l\'angle est égal ou supérieur\n  à 25 degrés) jusqu\'à maturation rachidienne\n26: Spondylarthrite grave\n27: Suites de transplantation d\'organe\n28: Tuberculose active, lèpre\n29: Tumeur maligne, affection maligne du tissu lymphatique ou hématopoïétique\n31: Affection hors liste\n32: Etat polypathologique\n...\n','base',24,1,'2019-01-01 00:00:00',3600,0),
(20,'medical','allaitementActuel','','Allaitement','allaitement actuel','','','switch','','base',25,1,'2019-01-01 00:00:00',3600,1),
(21,'medical','allergies','allergies et intolérances','Allergies','Allergies et intolérances du patient','','','textarea','','base',25,1,'2019-01-01 00:00:00',3600,1),
(22,'medical','atcdFamiliaux','Antécédents familiaux','Antécédents familiaux','Antécédents familiaux','','','textarea','','base',25,1,'2019-01-01 00:00:00',3600,1),
(23,'medical','atcdMedicChir','Antécédents médico-chirurgicaux personnels','Antécédents médico-chirurgicaux','Antécédents médico-chirurgicaux personnels','','','textarea','','base',25,1,'2019-01-01 00:00:00',3600,1),
(24,'medical','baseSynthese','synthèse sur le patient','Synthèse patient','Synthèse sur le patient','','','textarea','','base',25,1,'2019-01-01 00:00:00',3600,1),
(25,'medical','dataImport','','Import','support pour consultations importées','','','textarea','','base',25,1,'2019-01-01 00:00:00',84600,1),
(26,'medical','grossesseActuelle','','Grossesse en cours','grossesse actuelle (gestion ON/OFF de la grossesse)','','','switch','','base',25,1,'2019-01-01 00:00:00',3600,1),
(27,'medical','insuffisanceHepatique','','Insuffisance hépatique','degré d\'insuffisance hépatique','','','select','---\nz: \'?\'\n\"n\": Pas d\'insuffisance hépatique connue\n1: Légère\n2: Modérée\n3: Sévère\n...\n','base',25,1,'2019-01-01 00:00:00',3600,1),
(28,'medical','toxiques','tabac et drogues','Toxiques','habitudes de consommation','','','textarea','','base',25,1,'2019-01-01 00:00:00',3600,1),
(29,'relation','allergieCodeTheriaque','','Code Thériaque de l\'allergie','code Thériaque de l\'allergie','','','text','','base',41,1,'2019-01-01 00:00:00',3600,0),
(30,'relation','allergieLibelleTheriaque','','Libelle Thériaque de l\'allergie','libelle Thériaque de l\'allergie','','','text','','base',41,1,'2019-01-01 00:00:00',3600,0),
(31,'medical','atcdStrucCIM10','','Code CIM 10','code CIM 10 de l\'atcd','','','text','','base',26,1,'2019-01-01 00:00:00',3600,0),
(32,'medical','atcdStrucCIM10InLap','','A prendre en compte dans le LAP','prise en compte ou non dans le LAP','','','select','---\no: oui\n\"n\": non\n...\n','base',26,1,'2019-01-01 00:00:00',3600,1),
(33,'medical','atcdStrucCIM10Label','','Label CIM 10','label CIM 10 de l\'atcd','','','text','','base',26,1,'2019-01-01 00:00:00',3600,0),
(34,'medical','atcdStrucDateDebutAnnee','','Année','année de début de l\'atcd','','','number','','base',26,1,'2019-01-01 00:00:00',3600,0),
(35,'medical','atcdStrucDateDebutJour','','Jour','jour de début de l\'atcd','','','number','0','base',26,1,'2019-01-01 00:00:00',3600,0),
(36,'medical','atcdStrucDateDebutMois','','Mois','mois de début de l\'atcd','','','select','---\n- non précisé\n- janvier\n- février\n- mars\n- avril\n- mai\n- juin\n- juillet\n- août\n- septembre\n- octobre\n- novembre\n- décembre\n...\n','base',26,1,'2019-01-01 00:00:00',3600,0),
(37,'medical','atcdStrucDateFinAnnee','','Année','année de fin de l\'atcd','','','number','','base',26,1,'2019-01-01 00:00:00',3600,0),
(38,'medical','atcdStrucDateFinJour','','Jour','jour de fin de l\'atcd','','','number','0','base',26,1,'2019-01-01 00:00:00',3600,0),
(39,'medical','atcdStrucDateFinMois','','Mois','mois de fin de l\'atcd','','','select','---\n- non précisé\n- janvier\n- février\n- mars\n- avril\n- mai\n- juin\n- juillet\n- août\n- septembre\n- octobre\n- novembre\n- décembre\n...\n','base',26,1,'2019-01-01 00:00:00',3600,0),
(40,'medical','atcdStrucNotes','notes concernant cet antécédent','Notes','notes concernant l\'atcd','','','textarea','','base',26,1,'2019-01-01 00:00:00',3600,0),
(41,'admin','groupname','nom du groupe','Nom du groupe','nom du groupe','','','text','','base',4,1,'2019-01-01 00:00:00',3600,1),
(42,'admin','registryAuthorisationDate','','Date d\'autorisation du registre','date d\'autorisation du registre','','','date','','base',5,1,'2019-01-01 00:00:00',3600,1),
(43,'admin','registryAuthorisationEndDate','','Date de fin d\'autorisation du registre','date de fin d\'autorisation du registre','','','date','','base',5,1,'2019-01-01 00:00:00',3600,1),
(44,'admin','registryPrefixTech','','Préfixe technique','préfixe technique pour qualifier les éléments de structuration du registre','','','text','','base',5,1,'2019-01-01 00:00:00',3600,12),
(45,'admin','registryState','','État du registre','état du registre','','','select','---\nactif: registre actif\nsuspendu: registre suspendu\n...\n','base',5,1,'2019-01-01 00:00:00',3600,4),
(46,'admin','registryname','nom du registre','Nom du registre','nom du registre','','','text','','base',5,1,'2019-01-01 00:00:00',3600,1),
(47,'medical','codeTechniqueExamen','','Acte lié à l\'examen réalisé','code acte caractérisant l\'examen fait via le formulaire qui l\'emploie','','','text','','base',27,1,'2019-01-01 00:00:00',3600,1),
(48,'admin','administratifMarqueurDestruction','','Dossier détruit','marqueur pour la destruction d\'un dossier','','','text','','base',6,1,'2019-01-01 00:00:00',3600,11),
(49,'admin','administratifMarqueurPasRdv','','Ne pas donner de rendez-vous','','','','switch','','base',6,1,'2019-01-01 00:00:00',3600,1),
(50,'admin','administratifMarqueurSuppression','','Dossier supprimé','marqueur pour la suppression d\'un dossier','','','text','','base',6,1,'2019-01-01 00:00:00',3600,1),
(51,'admin','peopleExportID','','Id aléatoire export','id aléatoire export','','','text','','base',6,1,'2019-01-01 00:00:00',3600,1),
(52,'courrier','modeleCertifVierge','','Certificat','modèle de certificat vierge','','','','certif-certificatVierge','base',13,1,'2019-01-01 00:00:00',3600,0),
(53,'courrier','modeleCourrierTtEnCours','','Traitement en cours','modèle de courrier pour l\'impression du traitement en cours','','','','courrier-ttEnCours','base',14,1,'2019-01-01 00:00:00',3600,6),
(54,'courrier','modeleCourrierVierge','','Courrier','modèle de courrier vierge','','','','courrier-courrierVierge','base',14,1,'2019-01-01 00:00:00',3600,0),
(55,'courrier','mmDefautApi','','Défaut','modèle mail par défaut','base','','','Cher confrère,\n\nVeuillez trouver en pièce jointe un document concernant notre patient commun.\nVous souhaitant bonne réception.\n\nBien confraternellement\n\n','base',16,1,'2019-01-01 00:00:00',3600,0),
(56,'typecs','csAldDeclaration',NULL,'Déclaration ALD','support parent pour déclaration ALD',NULL,NULL,'','aldDeclaration','base',44,1,'2019-01-01 00:00:00',84600,1),
(57,'typecs','csAtcdStrucDeclaration',NULL,'Ajout d\'antécédent','support parent pour déclaration d\'antécédent structuré',NULL,NULL,'','atcdStrucDeclaration','base',44,1,'2019-01-01 00:00:00',84600,1),
(58,'system','ageCalcule','','Age calculé','Age calculé (formulaire d\'affichage)','','','text','','base',43,1,'2019-01-01 00:00:00',3600,1),
(59,'system','currentPassword','Mot de passe actuel','Mot de passe actuel','Mot de passe actuel de l\'utilisateur','required','Le mot de passe actuel est manquant','password','','base',43,1,'2019-01-01 00:00:00',86400,1),
(60,'system','date','','Début de période','','','','date','','base',43,1,'2019-01-01 00:00:00',86400,1),
(61,'system','identite','','Identité','LASTNAME Firstname (BIRTHNAME) (formulaire d\'affichage)','','','text','','base',43,1,'2019-01-01 00:00:00',3600,1),
(62,'system','module','','Module','module','','','select','','base',43,1,'2019-01-01 00:00:00',86400,1),
(63,'system','otpCode','code otp','code otp','code otp','','Le code otp est manquant','text','','base',43,1,'2019-01-01 00:00:00',86400,1),
(64,'system','password','mot de passe','Mot de passe','mot de passe utilisateur','','Le mot de passe est manquant','password','','base',43,1,'2019-01-01 00:00:00',86400,1),
(65,'system','submit','','Valider','bouton submit de validation','','','submit','','base',43,1,'2019-01-01 00:00:00',86400,1),
(66,'system','template','','Template','template','','','select','','base',43,1,'2019-01-01 00:00:00',86400,1),
(67,'system','username','nom d\'utilisateur','Nom d\'utilisateur','nom d\'utilisateur','required','','text','','base',43,1,'2019-01-01 00:00:00',86400,1),
(68,'system','verifPassword','confirmation du mot de passe','Confirmation du mot de passe','Confirmation du mot de passe utilisateur','required','La confirmation du mot de passe est manquante','password','','base',43,1,'2019-01-01 00:00:00',86400,1),
(69,'admin','clicRdvCalId','Agenda','Agenda','Agenda sélectionné','','','select','','base',7,1,'2019-01-01 00:00:00',3600,4),
(70,'admin','clicRdvConsultId','Consultations','Consultations','Correspondance entre consultations','','','select','','base',7,1,'2019-01-01 00:00:00',3600,5),
(71,'admin','clicRdvGroupId','Groupe','Groupe','Groupe Sélectionné','','','select','','base',7,1,'2019-01-01 00:00:00',3600,3),
(72,'admin','clicRdvPassword','Mot de passe','Mot de passe','Mot de passe (chiffré)','','','password','','base',7,1,'2019-01-01 00:00:00',3600,2),
(73,'admin','clicRdvUserId','identifiant','identifiant','email@address.com','','','text','','base',7,1,'2019-01-01 00:00:00',3600,1),
(74,'admin','emailApicrypt','adresse mail apicript','Email apicrypt','Email apicrypt','valid_email','','email','','base',8,1,'2019-01-01 00:00:00',3600,1),
(75,'admin','faxPro','fax professionel','Fax professionnel','FAx pro','phone','','tel','','base',8,1,'2019-01-01 00:00:00',3600,1),
(76,'admin','homePhone','0x xx xx xx xx','Téléphone domicile','Téléphone du domicile de la forme 0x xx xx xx xx','phone','Le numéro de téléphone du domicile n\'est pas correct','tel','','base',8,1,'2019-01-01 00:00:00',3600,1),
(77,'admin','mobilePhone','mobile: 0x xx xx xx xx','Téléphone mobile','Numéro de téléphone commençant par 06 ou 07','mobilphone','Le numéro de téléphone mobile est incorrect','tel','','base',8,1,'2019-01-01 00:00:00',3600,1),
(78,'admin','mobilePhonePro','06 xx xx xx xx','Téléphone mobile pro.','Numéro de téléphone commençant par 06 ou 07','mobilphone','Le numéro de téléphone mobile pro est incorrect','tel','','base',8,1,'2019-01-01 00:00:00',3600,1),
(79,'admin','personalEmail','email@domain.ext','Email personnelle','Adresse email personnelle','valid_email','L\'adresse email n\'est pas correcte. Elle doit être de la forme email@domain.net','email','','base',8,1,'2019-01-01 00:00:00',3600,1),
(80,'admin','pgpPublicKey','','Clef publique PGP','Clef publique PGP','','','textarea','','base',8,1,'2019-01-01 00:00:00',3600,14),
(81,'admin','profesionnalEmail','email@domain.ext','Email professionnelle','Adresse email professionnelle','valid_email','L\'adresse email n\'est pas correcte. Elle doit être de la forme email@domain.net','email','','base',8,1,'2019-01-01 00:00:00',3600,1),
(82,'admin','telPro','téléphone professionnel','Téléphone professionnel','Téléphone pro.','phone','','tel','','base',8,1,'2019-01-01 00:00:00',3600,1),
(83,'admin','telPro2','téléphone professionnel 2','Téléphone professionnel 2','Téléphone pro. 2','phone','','tel','','base',8,1,'2019-01-01 00:00:00',3600,1),
(84,'typecs','csImport','','Import','support parent pour import','','','','baseImportExternal','base',45,1,'2019-01-01 00:00:00',84600,1),
(85,'typecs','csBaseGroup','','Consultation','support parent pour les consultations','','','','baseConsult','base',46,1,'2019-01-01 00:00:00',86400,1),
(86,'medical','clairanceCreatinine','','Clairance créatinine','clairance de la créatinine en mL/min','','','text','','base',28,1,'2019-01-01 00:00:00',3600,1),
(87,'medical','creatinineMgL','','Créatinine','créatinine en mg/l','','','text','','base',28,1,'2019-01-01 00:00:00',3600,1),
(88,'medical','creatinineMicroMolL','','Créatinine','créatinine en μmol/l','','','text','','base',28,1,'2019-01-01 00:00:00',3600,1),
(89,'medical','freqCardiaque','','FC','fréquence cardiaque en bpm','','','text','','base',29,1,'2019-01-01 00:00:00',60,1),
(90,'medical','imc','','IMC','IMC (autocalcule)','','','text','','base',29,1,'2019-01-01 00:00:00',3600,1),
(91,'medical','poids','','Poids','poids du patient en kg','','','text','','base',29,1,'2019-01-01 00:00:00',3600,1),
(92,'medical','spO2','','SpO2','saturation en oxygène','','','text','','base',29,1,'2019-01-01 00:00:00',60,1),
(93,'medical','taDiastolique','','TAD','tension artérielle diastolique en mm Hg','','','text','','base',29,1,'2019-01-01 00:00:00',60,1),
(94,'medical','taSystolique','','TAS','tension artérielle systolique en mm Hg','','','text','','base',29,1,'2019-01-01 00:00:00',60,1),
(95,'medical','taillePatient','','Taille','taille du patient en cm','','','text','','base',29,1,'2019-01-01 00:00:00',3600,1),
(96,'medical','examenDuJour','examen du jour','Examen du jour','examen du jour','','','textarea','','base',30,1,'2019-01-01 00:00:00',3600,1),
(97,'mail','smsId','','smsId','id du sms','','','','','base',21,1,'2019-01-01 00:00:00',1576800000,1),
(98,'typecs','nouvelleGrossesse','','Nouvelle grossesse','support parent pour nouvelle grossesse','','','','','base',47,1,'2019-01-01 00:00:00',86400,1),
(99,'admin','clicRdvPatientId','ID patient','ID patient','ID patient','','','text','','base',9,1,'2019-01-01 00:00:00',3600,1),
(100,'admin','notes','notes','Notes','Zone de notes','','','textarea','','base',9,1,'2019-01-01 00:00:00',3600,1),
(101,'admin','notesPro','notes pros','Notes pros','Zone de notes pros','','','textarea','','base',9,1,'2019-01-01 00:00:00',3600,1),
(102,'admin','preferedSendingMethod','','Méthode d\'envoi préférée','Permet de choisir la méthode de d\'envoi préférée pour le transfert d\'un document patient','','','select','---\nNONE: Aucune méthode d\'envoi préférée\n...\n','base',9,1,'2019-01-01 00:00:00',3600,10),
(103,'doc','docOriginalName','','Nom original','nom original du document','','','','','base',19,1,'2019-01-01 00:00:00',3600,1),
(104,'doc','docOrigine','','Origine du document','origine du document : interne ou externe(null)','','','text','','base',19,1,'2019-01-01 00:00:00',3600,1),
(105,'doc','docRegistre','','Registre lié au document','registre lié au document','','','number','','base',19,1,'2019-01-01 00:00:00',3600,1),
(106,'doc','docTitle','','Titre','titre du document','','','','','base',19,1,'2019-01-01 00:00:00',3600,1),
(107,'doc','docType','','Type du document','type du document importé','','','text','','base',19,1,'2019-01-01 00:00:00',3600,1),
(108,'doc','docPorteur','','Document','porteur pour nouveau document importé','','','','','base',20,1,'2019-01-01 00:00:00',1576800000,1),
(109,'medical','DDR','ddr','DDR','date des dernières règles','','validedate,\'d/m/Y\'','date','','base',31,1,'2019-01-01 00:00:00',3600,1),
(110,'medical','ddg','ddg','DDG (théorique)','date de début de grossesse','','','text','','base',31,1,'2019-01-01 00:00:00',3600,1),
(111,'medical','ddgReel','','DDG (retenue)','date de début de grossesse corrigé','','','date','','base',31,1,'2019-01-01 00:00:00',3600,1),
(112,'medical','groFermetureSuivi','','Fermeture de la grossesse','date de fermeture de la grossesse (porteur)','','','text','','base',31,1,'2019-01-01 00:00:00',3600,1),
(113,'medical','terme9mois','','Terme (9 mois)','terme','','','text','','base',31,1,'2019-01-01 00:00:00',3600,1),
(114,'medical','termeDuJour','','Terme du jour','terme du jour','','','text','','base',31,1,'2019-01-01 00:00:00',3600,1),
(115,'dicom','dicomInstanceID','','InstanceID','','','','text','','base',18,1,'2019-01-01 00:00:00',3600,1),
(116,'dicom','dicomSerieID','','SerieID','','','','text','','base',18,1,'2019-01-01 00:00:00',3600,1),
(117,'dicom','dicomStudyID','','StudyID','','','','text','','base',18,1,'2019-01-01 00:00:00',3600,1),
(118,'admin','administrativeGenderCode','','Sexe','Sexe','','','select','---\nF: Femme\nM: Homme\nU: Inconnu\n...\n','base',10,1,'2019-01-01 00:00:00',3600,1),
(119,'admin','birthdate','naissance: dd/mm/YYYY','Date de naissance','Date de naissance au format dd/mm/YYYY','validedate,\'d/m/Y\'','La date de naissance indiquée n\'est pas valide','date','','base',10,1,'2019-01-01 00:00:00',3600,1),
(120,'admin','birthname','nom','Nom de naissance','Nom reçu à la naissance','identite','Le nom de naissance est indispensable et ne doit pas contenir de caractères interdits','text','','base',10,1,'2019-01-01 00:00:00',3600,1),
(121,'admin','deathdate','décès: dd/mm/YYYY','Date de décès','Date de décès au format dd/mm/YYYY','validedate,\'d/m/Y\'','La date de décès indiquée n\'est pas valide','date','','base',10,1,'2019-01-01 00:00:00',3600,1),
(122,'admin','firstname','prénom','Prénom','Prénom figurant sur la pièce d\'identité','identite','Le prénom est indispensable et ne doit pas contenir de caractères interdits','text','','base',10,1,'2019-01-01 00:00:00',3600,1),
(123,'admin','lastname','nom marital ou d\'usage','Nom d\'usage','Nom utilisé au quotidien','identite','Le nom d\'usage ne doit pas contenir de caractères interdits','text','','base',10,1,'2019-01-01 00:00:00',3600,1),
(124,'admin','othersfirstname','liste des prénoms secondaires','Autres prénoms','Les autres prénoms d\'une personne','','','text','','base',10,1,'2019-01-01 00:00:00',3600,1),
(125,'admin','titre','Dr, Pr ...','Titre','Titre du pro de santé','','','text','','base',10,1,'2019-01-01 00:00:00',3600,1),
(126,'admin','twitterAccount','','Twitter','Compte twitter','twitterAccount','','text','','base',11,1,'2019-01-01 00:00:00',3600,1),
(127,'admin','website','','Site web','Site web','url','','text','','base',11,1,'2019-01-01 00:00:00',3600,1),
(128,'ordo','lapLignePrescriptionDatePriseDebut','','Date de début de prise','date de début de prise','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(129,'ordo','lapLignePrescriptionDatePriseFin','','Date de fin de prise','date de fin de prise','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(130,'ordo','lapLignePrescriptionDatePriseFinAvecRenouv','','Date de fin de prise renouvellements inclus','date de fin de prise renouvellements inclus','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(131,'ordo','lapLignePrescriptionDatePriseFinEffective','','Date effective de fin de prise','date effective de fin de prise','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(132,'ordo','lapLignePrescriptionDureeJours','','Durée de la prescription en jours','durée de la prescription en jours','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(133,'ordo','lapLignePrescriptionIsALD','','isALD','ligne ALD ou non','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(134,'ordo','lapLignePrescriptionIsChronique','','isChronique','ligne TT chronique ou non','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(135,'ordo','lapLignePrescriptionRenouvelle','','ID de la ligne qui est renouvelée par cette ligne','ID de la ligne qui est renouvelée par cette ligne','','','','','base',32,1,'2019-01-01 00:00:00',3600,1),
(136,'ordo','lapMedicamentCodeATC','','Code ATC du médicament','code ATC du médicament','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(137,'ordo','lapMedicamentCodeSubstanceActive','','Code substance active du médicament','code substance active du médicament','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(138,'ordo','lapMedicamentDC','','DC du médicament','DC du médicament','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(139,'ordo','lapMedicamentEstPrescriptibleEnDC','','Médicament prescriptible en DC','médicament prescriptible en DC','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(140,'ordo','lapMedicamentMotifPrescription','','Motif de prescription du médicament','motif de prescription du médicament','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(141,'ordo','lapMedicamentPresentationCodeTheriaque','','Code Thériaque de la présentation','code Thériaque de la présentation (a priori le CIP7)','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(142,'ordo','lapMedicamentSpecialiteCodeTheriaque','','Code Thériaque de la spécialité','code Thériaque de la spécialité','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(143,'ordo','lapMedicamentSpecialiteNom','','Nom de la spécialité','nom de la spécialité','','','','','base',33,1,'2019-01-01 00:00:00',3600,1),
(144,'ordo','lapLigneMedicament','','Médicament','médicament LAP','','','','','base',34,1,'2019-01-01 00:00:00',3600,1),
(145,'ordo','lapLignePrescription','','Ligne de prescription','ligne de prescription LAP','','','','','base',34,1,'2019-01-01 00:00:00',3600,1),
(146,'ordo','lapOrdonnance','','Ordonnance','ordonnance LAP','','','','','base',34,1,'2019-01-01 00:00:00',3600,1),
(147,'ordo','lapSam','','SAM','porteur SAM LAP','','','','','base',34,1,'2019-01-01 00:00:00',1576800000,1),
(148,'ordo','lapExtOrdonnance','','Porteur','','','','number','','base',36,1,'2019-01-01 00:00:00',3600,1),
(149,'mail','mailBody','texte du message','Message','texte du message','','','textarea','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(150,'mail','mailFrom','email@domain.net','De','mail from','','','email','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(151,'mail','mailModeles','','Modèle','liste des modèles','','','select','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(152,'mail','mailPJ1','','ID pièce jointe','id de la pièce jointe au mail','','','','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(153,'mail','mailSujet','sujet du mail','Sujet','sujet du mail','','','text','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(154,'mail','mailTo','','A','mail to','','','email','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(155,'mail','mailToApicrypt','','A (correspondant apicrypt)','Champ pour les correspondants apicrypt','','','email','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(156,'mail','mailToEcofaxName','','Destinataire du fax','Destinataire du fax (ecofax OVH)','','','text','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(157,'mail','mailToEcofaxNumber','','Numéro de fax du destinataire','Numéro du destinataire du fax (ecofax OVH)','','','text','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(158,'mail','mailTrackingID','','TrackingID','num de tracking du mail dans le service externe','','','','','base',22,1,'2019-01-01 00:00:00',1576800000,1),
(159,'admin','PSCodeProSpe','','Code normé de la profession/spécialité du praticien','code normé de la profession/spécialité du praticien','','','select','---\nZ: Jeu de valeurs normées absent\n...\n','base',12,1,'2019-01-01 00:00:00',3600,1),
(160,'admin','PSCodeStructureExercice','','Code normé de la structure d\'exercice du praticien','code normé de la structure d\'exercice du praticien','','','select','---\nZ: Jeu de valeurs normées absent\n...\n','base',12,1,'2019-01-01 00:00:00',3600,1),
(161,'admin','PSIdNat','','Identifiant national praticien santé','identifiant national praticien santé','','','text','','base',12,1,'2019-01-01 00:00:00',3600,1),
(162,'admin','adeli','adeli','Adeli','n° adeli','','','text','','base',12,1,'2019-01-01 00:00:00',3600,1),
(163,'admin','nReseau','','Numéro de réseau','numéro de réseau (dépistage)','','','text','','base',12,1,'2019-01-01 00:00:00',3600,1),
(164,'admin','nmu','','Numéro de mutuelle','numéro de mutelle','','','text','','base',12,1,'2019-01-01 00:00:00',3600,1),
(165,'admin','nss','','Numéro de sécu','numéro de sécurité sociale','','','text','','base',12,1,'2019-01-01 00:00:00',3600,1),
(166,'admin','rpps','rpps','RPPS','rpps','numeric','','number','','base',12,1,'2019-01-01 00:00:00',3600,1),
(167,'ordo','ordoImpressionNbLignes','','Imprimer le nombre de lignes de prescription','imprimer le nombre de lignes de prescription','','','','','base',37,1,'2019-01-01 00:00:00',3600,1),
(168,'ordo','ordoLigneOrdo','','Ligne d\'ordonnance','porteur pour une ligne d\'ordo','','','','','base',37,1,'2019-01-01 00:00:00',3600,1),
(169,'ordo','ordoLigneOrdoALDouPas','','Ligne d\'ordonnance : ald','1 si ald','','','','','base',37,1,'2019-01-01 00:00:00',3600,1),
(170,'ordo','ordoTypeImpression','','Type ordonnance impression','type d\'ordonnance pour impression','','','','','base',37,1,'2019-01-01 00:00:00',3600,1),
(171,'ordo','ordoPorteur','','Ordonnance','Ordonnance simple','','','','','base',38,1,'2019-01-01 00:00:00',3600,1),
(172,'reglement','reglePorteurLibre','','Règlement','Règlement hors convention','','','','baseReglementLibre','base',39,1,'2019-01-01 00:00:00',1576800000,1),
(173,'reglement','reglePorteurS1','','Règlement','Règlement conventionné S1','','','','baseReglementS1','base',39,1,'2019-01-01 00:00:00',1576800000,1),
(174,'reglement','reglePorteurS2','','Règlement','Règlement conventionné S2','','','','baseReglementS2','base',39,1,'2019-01-01 00:00:00',1576800000,1),
(175,'mail','mailPorteur','','Mail','porteur pour les mails','','','','','base',23,1,'2019-01-01 00:00:00',1576800000,1),
(176,'mail','smsPorteur','','Mail','porteur pour les sms','','','','','base',23,1,'2019-01-01 00:00:00',1576800000,1),
(177,'reglement','regleBanqueCheque','Banque','Nom de la Banque','Nom de la Banque du chèque','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(178,'reglement','regleCB','','CB','montant versé en CB','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(179,'reglement','regleCheque','','Chèque','montant versé en chèque','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(180,'reglement','regleDepaCejour','','Dépassement','dépassement pratiqué ce jour','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(181,'reglement','regleDetailsActes','','Détails des actes','détails des actes de la facture','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(182,'reglement','regleEspeces','','Espèces','montant versé en espèce','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(183,'reglement','regleFacture','','Facturé','facturé ce jour','','','text','0','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(184,'reglement','regleFseData','','FSE data','data de la FSE générée par service tiers','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(185,'reglement','regleIdentiteCheque','n° de chèque, nom du payeur si différent du patient,...','Informations paiement','Information complémentaires sur le paiement','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(186,'reglement','regleModulCejour','','Modulation','modulation appliquée ce jour','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(187,'reglement','regleNumeroCheque','n° de chèque','n° de chèque','n° de chèque','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(188,'reglement','regleSecteurGeoTarifaire','','Secteur géographique tarifaire','secteur géographique tarifaire','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(189,'reglement','regleSecteurHonoraires','','Secteur tarifaire','secteur tarifaire appliqué','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(190,'reglement','regleSecteurHonorairesNgap','','Secteur tarifaire NGAP','secteur tarifaire NGAP appliqué','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(191,'reglement','regleSecteurIK','','Secteur tarifaire pour IK','secteur tarifaire IK appliqué','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(192,'reglement','regleSituationPatient','','Situation du patient','situation du patient : cmu / tp / tout venant','','','select','---\nG: Tout venant\nCMU: CMU\nTP: Tiers payant AMO\nTP ALD DEP: \'ALD : tiers payant AVEC dépassement \'\nTP ALD: \'ALD : tiers payant SANS dépassement \'\n...\n','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(193,'reglement','regleTarifLibreCejour','','Tarif','tarif appliqué ce jour','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(194,'reglement','regleTarifSSCejour','','Tarif SS','tarif SS appliqué ce jour','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(195,'reglement','regleTiersPayeur','','Tiers','part du tiers','','','text','','base',40,1,'2019-01-01 00:00:00',1576800000,1),
(196,'relation','relationExternePatient','','Relation externe patient','relation externe patient','','','number','','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(197,'relation','relationGroupeRegistre','','Relation groupe registre','relation groupe registre','','','select','---\nmembre: Membre\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(198,'relation','relationID','','Porteur de relation','porteur de relation entre patients ou entre patients et praticiens','','','number','','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(199,'relation','relationPatientGroupe','','Relation patient groupes','relation patient groupes','','','select','---\nmembre: membre\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(200,'relation','relationPatientPatient','','Relation patient patient','relation patient patient','','','select','---\nconjoint: conjoint\nenfant: parent\nparent: enfant\ngrand parent: petit enfant\npetit enfant: grand parent\nsœur / frère: sœur / frère\ntante / oncle: nièce / neveu\nnièce / neveu: tante / oncle\ncousin: cousin\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(201,'relation','relationPatientPraticien','','Relation patient praticien','relation patient  praticien','','','select','---\nMTD: Médecin traitant déclaré\nMT: Médecin traitant\nMS: Médecin spécialiste\nAutre: Autre correspondant\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(202,'relation','relationPraticienGroupe','','Relation praticien groupe','relation praticien groupe','','','select','---\nmembre: Membre\nadmin: Administrateur\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(203,'relation','relationRegistrePatient','','Relation registre patient','relation registre patient','','','select','---\ninclus: inclus\nexclu: exclu\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1),
(204,'relation','relationRegistrePraticien','','Relation praticien registre','relation praticien registre','','','select','---\nadmin: Administrateur\n...\n','base',42,1,'2019-01-01 00:00:00',1576800000,1);
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dicomTags`
--

DROP TABLE IF EXISTS `dicomTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dicomTags` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `dicomTag` varchar(150) NOT NULL,
  `typeName` varchar(60) DEFAULT NULL,
  `dicomCodeMeaning` varchar(255) DEFAULT NULL,
  `dicomUnits` varchar(255) DEFAULT NULL,
  `returnValue` enum('min','max','avg') NOT NULL DEFAULT 'avg',
  `roundDecimal` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dicomTag` (`dicomTag`,`typeName`),
  KEY `dicomTag_2` (`dicomTag`),
  KEY `typeName` (`typeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dicomTags`
--

LOCK TABLES `dicomTags` WRITE;
/*!40000 ALTER TABLE `dicomTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `dicomTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT 'base',
  `internalName` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `dataset` varchar(60) NOT NULL DEFAULT 'data_types',
  `groupe` enum('admin','medical','mail','doc','courrier','ordo','reglement','relation') NOT NULL DEFAULT 'medical',
  `formMethod` enum('post','get') NOT NULL DEFAULT 'post',
  `formAction` varchar(255) DEFAULT '/patient/ajax/saveCsForm/',
  `cat` smallint(6) DEFAULT NULL,
  `type` enum('public','private') NOT NULL DEFAULT 'public',
  `yamlStructure` mediumtext DEFAULT NULL,
  `options` mediumtext DEFAULT NULL,
  `printModel` varchar(50) DEFAULT NULL,
  `cda` mediumtext DEFAULT NULL,
  `javascript` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `internalName` (`internalName`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES
(1,'base','baseListingGroupes','Listing des groupes','description des colonnes affichées en résultat d\'une recherche groupes','data_types','medical','post','/patient/ajax/saveCsForm/',1,'public','---\ncol1:\n  head: Nom du centre\n  bloc:\n  - groupname\ncol2:\n  head: Pays\n  bloc:\n  - country,text-uppercase\ncol3:\n  head: Ville\n  bloc:\n  - city,text-uppercase\n...\n','','','',''),
(2,'base','baseListingPatients','Listing des patients','description des colonnes affichées en résultat d\'une recherche patient','data_types','admin','post','',1,'public','---\ncol1:\n  head: Identité\n  blocseparator: \' - \'\n  bloc:\n  - identite\ncol2:\n  head: Date de naissance\n  blocseparator: \' - \'\n  bloc:\n  - birthdate\n  - ageCalcule\ncol3:\n  head: Tel\n  blocseparator: \' - \'\n  bloc:\n  - mobilePhone,click2call\n  - homePhone,click2call\ncol4:\n  head: Email\n  bloc:\n  - personalEmail\ncol5:\n  head: Ville\n  bloc:\n  - city,text-uppercase\n...\n','','','',''),
(3,'base','baseListingPro','Listing des praticiens','description des colonnes affichées en résultat d\'une recherche praticien','data_types','admin','post','',1,'public','---\ncol1:\n  head: Identité\n  bloc:\n  - identite\ncol2:\n  head: Activité pro\n  bloc:\n  - job\ncol3:\n  head: Tel\n  bloc:\n  - telPro,click2call\ncol4:\n  head: Fax\n  bloc:\n  - faxPro\ncol5:\n  head: Email\n  blocseparator: \' - \'\n  bloc:\n  - emailApicrypt\n  - personalEmail\ncol6:\n  head: Pays\n  bloc:\n  - paysAdressePro,text-uppercase\ncol7:\n  head: Ville\n  bloc:\n  - villeAdressePro,text-uppercase\n...\n',NULL,'',NULL,NULL),
(4,'base','baseListingRegistres','Listing des registres','description des colonnes affichées en résultat d\'une recherche registres','data_types','medical','post','/patient/ajax/saveCsForm/',1,'public','---\ncol1:\n  head: Nom du registre\n  bloc:\n  - registryname\ncol2:\n  head: État du registre\n  bloc:\n  - registryState\n...\n','','','',''),
(5,'base','baseATCD','Formulaire latéral écran patient principal (atcd)','formulaire en colonne latéral du dossier patient (atcd)','data_types','medical','post','',2,'public','---\nstructure:\n  row1:\n    col1:\n      size: 12 col-12 col-sm-4 col-lg-4\n      bloc:\n      - poids,plus={<i class=\"fas fa-clone duplicate\"></i>}\n    col2:\n      size: 12 col-12 col-sm-4 col-lg-4\n      bloc:\n      - taillePatient,plus={<i class=\"fas fa-clone duplicate\"></i>}\n    col3:\n      size: 12 col-12 col-sm-4 col-lg-4\n      bloc:\n      - imc,readonly,plus={<i class=\"fas fa-chart-line graph\"></i>}\n  row2:\n    col1:\n      size: 12\n      bloc:\n      - job,rows=1\n      - allergies,rows=1\n      - toxiques,rows=1\n  row3:\n    col1:\n      size: 12\n      bloc:\n      - atcdMedicChir,rows=2\n      - atcdFamiliaux,rows=2\n...\n',NULL,'',NULL,'$(document).ready(function() {\r\n\r\n  //calcul IMC\r\n  if ($(\'#id_imc_id\').length > 0) {\r\n\r\n    imc = imcCalc($(\'#id_poids_id\').val(), $(\'#id_taillePatient_id\').val());\r\n    if (imc > 0) {\r\n      $(\'#id_imc_id\').val(imc);\r\n    }\r\n\r\n    $(\"#patientLatCol\").on(\"keyup\", \"#id_poids_id , #id_taillePatient_id\", function() {\r\n      poids = $(\'#id_poids_id\').val();\r\n      taille = $(\'#id_taillePatient_id\').val();\r\n      imc = imcCalc(poids, taille);\r\n      $(\'#id_imc_id\').val(imc);\r\n      patientID = $(\'#identitePatient\').attr(\"data-patientID\");\r\n      setPeopleDataByTypeName(imc, patientID, \'imc\', \'#id_imc_id\', \'0\');\r\n\r\n    });\r\n  }\r\n\r\n  //ajutement auto des textarea en hauteur\r\n  autosize($(\'#formName_baseATCD textarea\')); \r\n  \r\n});'),
(6,'base','aldDeclaration','Déclaration d\'ALD','formulaire d\'enregistrement d\'une ALD','data_types','medical','post','/patient/ajax/saveCsForm/',3,'public','---\nstructure:\n  row1:\n    head: Enregistrement d\'une prise en charge en ALD\n    col1:\n      size: 12\n      bloc:\n      - aldNumber\n  row2:\n    col1:\n      size: 4\n      bloc:\n      - aldDateDebutPriseEnCharge\n    col2:\n      size: 4\n      bloc:\n      - aldDateFinPriseEnCharge\n  row3:\n    col1:\n      size: 2\n      bloc:\n      - aldCIM10,plus={<i class=\"fas fa-search\"></i>}\n    col2:\n      size: 10\n      bloc:\n      - aldCIM10label,readonly\n...\n',NULL,'','','$(\"#nouvelleCs\").on(\"click\",\"#id_aldCIM10_idAddOn\", function() {\r\n  $(\'#searchCIM10\').modal(\'show\');\r\n});\r\n\r\n$(\'#searchCIM10\').on(\'shown.bs.modal\', function() {\r\n  $(\'#searchCIM10 #texteRechercheCIM10\').focus();\r\n});\r\n\r\n$(\"#nouvelleCs\").on(\"keyup\",\"#id_aldCIM10_id\", function() {\r\n  if ($(\"#id_aldCIM10_id\").val() == \'\') $(\"#id_aldCIM10label_id\").val(\'\');\r\n});\r\n\r\n$(\"#texteRechercheCIM10\").typeWatch({\r\n  wait: 1000,\r\n  highlight: false,\r\n  allowSubmit: false,\r\n  captureLength: 3,\r\n  callback: function(value) {\r\n    $.ajax({\r\n      url: urlBase+\'/lap/ajax/cim10search/\',\r\n      type: \'post\',\r\n      data: {\r\n        term: value\r\n      },\r\n      dataType: \"html\",\r\n      beforeSend: function() {\r\n        $(\'#codeCIM10trouves\').html(\'<div class=\"col-md-12\">Attente des résultats de la recherche ...</div>\');\r\n      },\r\n      success: function(data) {\r\n        $(\'#codeCIM10trouves\').html(data);\r\n      },\r\n      error: function() {\r\n        alert(\'Problème, rechargez la page !\');\r\n      }\r\n    });\r\n  }\r\n});\r\n\r\n$(\'#searchCIM10\').on(\"click\", \"button.catchCIM10\", function() {\r\n  code = $(this).attr(\'data-code\');\r\n  label = $(this).attr(\'data-label\');\r\n  $(\"#id_aldCIM10_id\").val(code);\r\n  $(\"#id_aldCIM10label_id\").val(label);\r\n  $(\'#searchCIM10\').modal(\'toggle\');\r\n  $(\'#codeCIM10trouves\').html(\'\');\r\n  $(\"#texteRechercheCIM10\").val(\'\');\r\n\r\n});'),
(7,'base','atcdStrucDeclaration','Déclaration d\'atcd structuré','ajout d\'antécédents structuré et codé CIM 10','data_types','medical','post','/patient/ajax/saveCsForm/',3,'public','---\nglobal:\n  formClass: ignoreReturn\nstructure:\n  row1:\n    head: Ajout d\'un antécédent à partir de la classification CIM 10\n    col1:\n      size: 2\n      bloc:\n      - atcdStrucCIM10,plus={<i class=\"fas fa-search\"></i>}\n    col2:\n      size: 7\n      bloc:\n      - atcdStrucCIM10Label,readonly\n    col3:\n      size: 3\n      bloc:\n      - atcdStrucCIM10InLap\n  row2:\n    col1:\n      size: 5\n      head: Début\n    col2:\n      size: 2\n      head: \"\"\n    col3:\n      size: 5\n      head: Fin\n  row3:\n    col1:\n      size: 1\n      bloc:\n      - atcdStrucDateDebutJour\n    col2:\n      size: 2\n      bloc:\n      - atcdStrucDateDebutMois\n    col3:\n      size: 2\n      bloc:\n      - atcdStrucDateDebutAnnee,min=1910,step=1\n    col4:\n      size: 2\n    col5:\n      size: 1\n      bloc:\n      - atcdStrucDateFinJour\n    col6:\n      size: 2\n      bloc:\n      - atcdStrucDateFinMois\n    col7:\n      size: 2\n      bloc:\n      - atcdStrucDateFinAnnee,min=1910,step=1\n  row4:\n    col1:\n      head: Notes\n      size: 12\n      bloc:\n      - atcdStrucNotes,nolabel\n...\n',NULL,'','','$(document).ready(function() {\r\n  $(\"#nouvelleCs\").on(\"click\",\"#id_atcdStrucCIM10_idAddOn\", function() {\r\n    $(\'#searchCIM10\').modal(\'show\');\r\n  });\r\n\r\n  $(\'#searchCIM10\').on(\'shown.bs.modal\', function() {\r\n    $(\'#searchCIM10 #texteRechercheCIM10\').focus();\r\n  });\r\n\r\n  $(\"#texteRechercheCIM10\").typeWatch({\r\n    wait: 1000,\r\n    highlight: false,\r\n    allowSubmit: false,\r\n    captureLength: 3,\r\n    callback: function(value) {\r\n      $.ajax({\r\n        url: urlBase+\'/lap/ajax/cim10search/\',\r\n        type: \'post\',\r\n        data: {\r\n          term: value\r\n        },\r\n        dataType: \"html\",\r\n        beforeSend: function() {\r\n          $(\'#codeCIM10trouves\').html(\'<div class=\"col-md-12\">Attente des résultats de la recherche ...</div>\');\r\n        },\r\n        success: function(data) {\r\n          $(\'#codeCIM10trouves\').html(data);\r\n        },\r\n        error: function() {\r\n          alert(\'Problème, rechargez la page !\');\r\n        }\r\n      });\r\n    }\r\n  });\r\n\r\n  $(\'#searchCIM10\').on(\"click\", \"button.catchCIM10\", function() {\r\n    code = $(this).attr(\'data-code\');\r\n    label = $(this).attr(\'data-label\');\r\n    $(\"#id_atcdStrucCIM10_id\").val(code);\r\n    $(\"#id_atcdStrucCIM10Label_id\").val(label);\r\n    $(\'#searchCIM10\').modal(\'toggle\');\r\n    $(\'#codeCIM10trouves\').html(\'\');\r\n    $(\"#texteRechercheCIM10\").val(\'\');\r\n\r\n  });\r\n  \r\n  //ajutement auto des textarea en hauteur\r\n  autosize($(\'#id_atcdStrucNotes_id\'));\r\n  \r\n});'),
(8,'base','baseConsult','Formulaire CS','formulaire basique de consultation','data_types','medical','post','/patient/ajax/saveCsForm/',3,'public','---\nglobal:\n  formClass: newCS\nstructure:\n  row1:\n    head: Consultation\n    col1:\n      size: 12\n      bloc:\n      - examenDuJour,rows=10\n...\n',NULL,'csBase',NULL,NULL),
(9,'base','baseSynthese','Synthèse patiente','formulaire fixe de synthèse','data_types','medical','post','',4,'public','---\nstructure:\n  row1:\n    col1:\n      size: 12\n      bloc:\n      - baseSynthese,rows=2\n...\n',NULL,'',NULL,'$(document).ready(function() {  \r\n  //ajutement auto des textarea en hauteur\r\n  autosize($(\'#formName_baseSynthese textarea\'));\r\n });'),
(10,'base','baseModalNewPatient','Formulaire patient pour agenda','formulaire patient pour agenda','data_types','admin','post','',6,'public','---\nglobal:\n  noFormTags: true\nstructure:\n  row1:\n    class: my-0\n    col1:\n      size: 12\n      bloc:\n      - administrativeGenderCode,nolabel\n  row2:\n    class: my-0\n    col1:\n      size: 6\n      bloc:\n      - birthname,required,nolabel,class={font-weight-bold},autocomplete,data-acTypeID=lastname:birthname\n    col2:\n      size: 6\n      bloc:\n      - lastname,nolabel,class={font-weight-bold},autocomplete,data-acTypeID=lastname:birthname\n  row3:\n    class: my-0\n    col1:\n      size: 12\n      bloc:\n      - firstname,nolabel,class={font-weight-bold},required,autocomplete,data-acTypeID=firstname:othersfirstname:igPrenomFA:igPrenomFB:igPrenomFC\n  row4:\n    class: my-0\n    col1:\n      size: 6\n      bloc:\n      - birthdate,nolabel,required,class=pick-years\n    col2:\n      size: 6\n      bloc:\n      - nss,nolabel,class=updatable,plus={<i class=\"far fa-address-card\"></i>}\n  row5:\n    class: my-0\n    col1:\n      size: 12\n      bloc:\n      - personalEmail,nolabel,class=updatable\n  row6:\n    class: my-0\n    col1:\n      size: 6\n      bloc:\n      - mobilePhone,nolabel,class=updatable\n    col2:\n      size: 6\n      bloc:\n      - homePhone,nolabel,class=updatable\n  row7:\n    class: my-0\n    col1:\n      size: 4\n      bloc:\n      - streetNumber,nolabel,class=updatable\n      - postalCodePerso,nolabel,class=updatable\n    col2:\n      size: 8\n      bloc:\n      - street,nolabel,autocomplete,data-acTypeID=street:rueAdressePro,class=updatable\n      - city,nolabel,autocomplete,data-acTypeID=city:villeAdressePro,class=updatable\n  row8:\n    class: my-0\n    col1:\n      size: 12\n      bloc:\n      - notes,nolabel,rows=2,class=updatable\n...\n',NULL,'',NULL,NULL),
(11,'base','baseNewGroupe','Formulaire de création d\'un groupe','formulaire de création d\'un nouveau groupe','data_types','admin','post','/groupe/register/',6,'public','---\nstructure:\n  row1:\n    col1:\n      size: 4\n      bloc:\n      - groupname,required\n    col2:\n      size: 4\n      bloc:\n      - country\n    col3:\n      size: 4\n      bloc:\n      - city\n...\n','','','',''),
(12,'base','baseNewPatient','Formulaire nouveau patient','formulaire d\'enregistrement d\'un nouveau patient','data_types','admin','post','/patient/register/',6,'public','---\nstructure:\n  row1:\n    col1:\n      head: Etat civil\n      size: 4\n      bloc:\n      - administrativeGenderCode\n      - birthname,required,autocomplete,data-acTypeID=lastname:birthname\n      - lastname,autocomplete,data-acTypeID=lastname:birthname\n      - firstname,required,autocomplete,data-acTypeID=firstname:othersfirstname:igPrenomFA:igPrenomFB:igPrenomFC\n      - birthdate,class=pick-year\n    col2:\n      head: Contact\n      size: 4\n      bloc:\n      - personalEmail\n      - mobilePhone\n      - homePhone\n      - nss\n      - nmu\n    col3:\n      head: Adresse personnelle\n      size: 4\n      bloc:\n      - streetNumber\n      - street,autocomplete,data-acTypeID=street:rueAdressePro\n      - postalCodePerso\n      - city,autocomplete,data-acTypeID=city:villeAdressePro\n      - deathdate\n  row2:\n    col1:\n      size: 12\n      bloc:\n      - notes,rows=3\n...\n',NULL,'',NULL,'$(document).ready(function() {\r\n\r\n  //ajutement auto des textarea en hauteur\r\n  autosize($(\'#formName_baseNewPatient textarea\')); \r\n\r\n  // modal edit data admin patient\r\n  $(\'#editAdmin\').on(\'shown.bs.modal\', function (e) {\r\n    autosize.update($(\'#editAdmin textarea\'));\r\n  });\r\n  \r\n});'),
(13,'base','baseNewPro','Formulaire nouveau pro','formulaire d\'enregistrement d\'un nouveau pro','data_types','admin','post','/pro/register/',6,'public','---\nstructure:\n  row1:\n    col1:\n      head: Etat civil\n      size: 4\n      bloc:\n      - administrativeGenderCode\n      - job,autocomplete,rows=1\n      - titre,autocomplete\n      - birthname,autocomplete,data-acTypeID=firstname:othersfirstname:igPrenomFA:igPrenomFB:igPrenomFC\n      - lastname,autocomplete,data-acTypeID=lastname:birthname\n      - firstname,autocomplete,data-acTypeID=firstname:othersfirstname:igPrenomFA:igPrenomFB:igPrenomFC\n    col2:\n      head: Contact\n      size: 4\n      bloc:\n      - emailApicrypt\n      - profesionnalEmail\n      - personalEmail\n      - telPro\n      - telPro2\n      - mobilePhonePro\n      - faxPro\n    col3:\n      head: Adresse professionnelle\n      size: 4\n      bloc:\n      - numAdressePro\n      - rueAdressePro,autocomplete,data-acTypeID=street:rueAdressePro\n      - codePostalPro\n      - villeAdressePro,autocomplete,data-acTypeID=city:villeAdressePro\n      - serviceAdressePro,autocomplete\n      - etablissementAdressePro,autocomplete\n  row2:\n    col1:\n      size: 12\n      bloc:\n      - notesPro,rows=3\n  row3:\n    col1:\n      size: 4\n      bloc:\n      - rpps\n      - PSIdNat\n    col2:\n      size: 4\n      bloc:\n      - adeli\n      - PSCodeProSpe,plus={<i class=\"fas fa-pen\"></i>}\n    col3:\n      size: 4\n      bloc:\n      - nReseau\n      - PSCodeStructureExercice,plus={<i class=\"fas fa-pen\"></i>}\n  row4:\n    col1:\n      size: 12\n      bloc:\n      - preferedSendingMethod\n...\n','','','','$(document).ready(function() {\r\n\r\n   // modal edit data admin patient\r\n  $(\'#newPro\').on(\'shown.bs.modal\', function (e) {\r\n    autosize.update($(\'#newPro textarea\'));\r\n  });\r\n  \r\n  //ajutement auto des textarea en hauteur\r\n  autosize($(\'#formName_baseNewPro textarea\')); \r\n\r\n});'),
(14,'base','baseNewRegistre','Formulaire nouveau registre','formulaire nouveau registre','data_types','admin','post','/registre/register/',6,'public','---\nstructure:\n  row1:\n    col1:\n      size: col-12\n      bloc:\n      - registryname,required\n  row2:\n    col1:\n      size: col-12 col-md-3\n      bloc:\n      - registryAuthorisationDate,required\n    col2:\n      size: col-12 col-md-3\n      bloc:\n      - registryAuthorisationEndDate\n    col3:\n      size: col-12 col-md-3\n      bloc:\n      - registryState\n  row3:\n    col1:\n      size: col-6 col-md-4\n      bloc:\n      - registryPrefixTech\n...\n','','','',''),
(15,'base','basePeopleComplement','Formulaire patient/pro complémentaire','formulaire patient/pro complémentaire','data_types','admin','post','/patient/ajax/saveCsForm/',6,'public','---\nstructure:\n  row1:\n    col1:\n      size: 12\n      bloc:\n      - pgpPublicKey,rows=20,class={text-monospace}\n...\n','','','',''),
(16,'base','baseAgendaPriseRDV','Agenda prise rdv','formulaire latéral de prise de rdv','data_types','admin','post','',7,'public','---\nglobal:\n  noFormTags: true\nstructure:\n  row1:\n    col1:\n      size: 6\n      bloc:\n      - birthname,readonly\n    col2:\n      size: 6\n      bloc:\n      - firstname,readonly\n  row2:\n    col1:\n      size: 6\n      bloc:\n      - lastname,readonly\n    col2:\n      size: 6\n      bloc:\n      - birthdate,readonly\n  row3:\n    col1:\n      size: 12\n      bloc:\n      - personalEmail\n  row4:\n    col1:\n      size: 6\n      bloc:\n      - mobilePhone\n    col2:\n      size: 6\n      bloc:\n      - homePhone\n...\n',NULL,'',NULL,NULL),
(17,'base','baseAskUserPassword','Demande du mot de passe','demande du mot de passe à l\'utilisateur courant','data_types','medical','post','/patient/ajax/saveCsForm/',7,'public','---\nglobal:\n  noFormTags: true\nstructure:\n  row1:\n    col1:\n      size: col\n      bloc:\n      - password,required\n...\n','','','',''),
(18,'base','baseFax','Formulaire écofax','formulaire pour ecofax OVH','data_types','mail','post','/patient/actions/sendMail/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: col\n      bloc:\n      - mailToEcofaxName,required\n  row2:\n    col1:\n      size: col\n      bloc:\n      - mailToEcofaxNumber,required\n...\n',NULL,'',NULL,NULL),
(19,'base','baseFirstLogin','Premier utilisateur','Création du premier utilisateur','data_types','admin','post','/login/logInFirstDo/',7,'public','---\nstructure:\n  row1:\n    col1:\n      head: Premier utilisateur\n      size: 3\n      bloc:\n      - username,required\n      - password,required\n      - verifPassword,required\n      - submit,Valider,class={btn-primary}\n...\n',NULL,NULL,NULL,NULL),
(20,'base','baseImportExternal','Import','formulaire pour consultation importée d\'une source externe','data_types','medical','post','',7,'public','---\nglobal:\n  formClass: newCS\nstructure:\n  row1:\n    head: Consultation importée\n    col1:\n      size: 12\n      bloc:\n      - dataImport,rows=10\n...\n',NULL,'csImportee',NULL,NULL),
(21,'base','baseLogin','Login','formulaire login utilisateur','data_types','admin','post','/login/logInDo/',7,'public','---\nglobal:\n  formClass: form-signin\nstructure:\n  row1:\n    col1:\n      size: 12\n      bloc:\n      - username,required,nolabel\n      - password,required,nolabel\n      - otpCode,nolabel\n      - submit,Connexion,class=btn-primary,class=btn-block\n...\n',NULL,'',NULL,NULL),
(22,'base','baseNewUser','Formulaire nouvel utilisateur','formulaire nouvel utilisateur','data_types','admin','post','/configuration/ajax/configUserCreate/',7,'public','---\nstructure:\n  row1:\n    class: mb-4\n    col1:\n      size: col-3\n      bloc:\n      - administrativeGenderCode,tabindex=1\n      - personalEmail,tabindex=4\n    col2:\n      size: col-3\n      bloc:\n      - birthname,tabindex=1\n      - profesionnalEmail,tabindex=5\n    col3:\n      size: col-3\n      bloc:\n      - lastname,tabindex=2\n    col4:\n      size: col-3\n      bloc:\n      - firstname,required,tabindex=3\n  row2:\n    col1:\n      size: col-3\n      bloc:\n      - username,required,tabindex=6\n    col2:\n      size: col-3\n      bloc:\n      - password,tabindex=7\n    col3:\n      size: col-3\n      bloc:\n      - module,tabindex=8\n    col4:\n      size: col-3\n      bloc:\n      - template,tabindex=9\n...\n','','','',''),
(23,'base','baseNewUserFromPeople','Formulaire nouvel utilisateur pour un individu déjà existant','formulaire nouvel utilisateur pour un individu déjà existant','data_types','admin','post','/configuration/ajax/configUserCreate/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: col-4\n      bloc:\n      - username,required,tabindex=1\n      - template,tabindex=4\n    col2:\n      size: col-4\n      bloc:\n      - password,tabindex=2\n    col3:\n      size: col-4\n      bloc:\n      - module,tabindex=3\n...\n','','','',''),
(24,'base','baseReglementLibre','Formulaire règlement','formulaire pour le règlement d\'honoraires libres','data_types','reglement','post','/patient/ajax/saveReglementForm/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: 4\n      bloc:\n      - regleTarifLibreCejour,readonly,plus={€},class=regleTarifCejour\n    col2:\n      size: 4\n      bloc:\n      - regleModulCejour,plus={€},class=regleDepaCejour\n    col3:\n      size: 4\n      bloc:\n      - regleFacture,readonly,plus={€},class=regleFacture\n  row2:\n    col1:\n      size: 4\n      bloc:\n      - regleCB,plus={€},class=regleCB\n    col2:\n      size: 4\n      bloc:\n      - regleCheque,plus={€},class=regleCheque\n    col3:\n      size: 4\n      bloc:\n      - regleEspeces,plus={€},class=regleEspeces\n  row3:\n    col1:\n      size: 4\n      bloc:\n      - regleNumeroCheque,class=regleNumeroCheque\n    col2:\n      size: 4\n      bloc:\n      - regleBanqueCheque,class=regleBanqueCheque,autocomplete\n    col3:\n      size: 4\n      bloc:\n      - regleIdentiteCheque,class=regleIdentiteCheque\n...\n','','','',''),
(25,'base','baseReglementS1','Règlement conventionné S1','Formulaire pour le règlement d\'honoraires conventionnés secteur 1','data_types','reglement','post','/patient/ajax/saveReglementForm/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: 3\n      bloc:\n      - regleSituationPatient,class=regleSituationPatient\n    col2:\n      size: 3\n      bloc:\n      - regleTarifSSCejour,required,readonly,plus={€},class=regleTarifCejour\n    col3:\n      size: 3\n      bloc:\n      - regleDepaCejour,plus={€},class=regleDepaCejour\n    col4:\n      size: 3\n      bloc:\n      - regleFacture,readonly,plus={€},class=regleFacture\n  row2:\n    col1:\n      size: 3\n      bloc:\n      - regleCB,plus={€},class=regleCB\n    col2:\n      size: 3\n      bloc:\n      - regleCheque,plus={€},class=regleCheque\n    col3:\n      size: 3\n      bloc:\n      - regleEspeces,plus={€},class=regleEspeces\n    col4:\n      size: 3\n      bloc:\n      - regleTiersPayeur,plus={€},class=regleTiersPayeur\n  row3:\n    col1:\n      size: 4\n      bloc:\n      - regleNumeroCheque,class=regleNumeroCheque\n    col2:\n      size: 4\n      bloc:\n      - regleBanqueCheque,class=regleBanqueCheque,autocomplete\n    col3:\n      size: 4\n      bloc:\n      - regleIdentiteCheque,class=regleIdentiteCheque\n...\n','','','',''),
(26,'base','baseReglementS2','Règlement conventionné S2','Formulaire pour le règlement d\'honoraires conventionnés secteur 2','data_types','reglement','post','/patient/ajax/saveReglementForm/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: 3\n      bloc:\n      - regleSituationPatient,class=regleSituationPatient\n    col2:\n      size: 3\n      bloc:\n      - regleTarifSSCejour,required,readonly,plus={€},class=regleTarifCejour\n    col3:\n      size: 3\n      bloc:\n      - regleDepaCejour,plus={€},class=regleDepaCejour\n    col4:\n      size: 3\n      bloc:\n      - regleFacture,readonly,plus={€},class=regleFacture\n  row2:\n    col1:\n      size: 3\n      bloc:\n      - regleCB,plus={€},class=regleCB\n    col2:\n      size: 3\n      bloc:\n      - regleCheque,plus={€},class=regleCheque\n    col3:\n      size: 3\n      bloc:\n      - regleEspeces,plus={€},class=regleEspeces\n    col4:\n      size: 3\n      bloc:\n      - regleTiersPayeur,plus={€},class=regleTiersPayeur\n  row3:\n    col1:\n      size: 4\n      bloc:\n      - regleNumeroCheque,class=regleNumeroCheque\n    col2:\n      size: 4\n      bloc:\n      - regleBanqueCheque,class=regleBanqueCheque,autocomplete\n    col3:\n      size: 4\n      bloc:\n      - regleIdentiteCheque,class=regleIdentiteCheque\n...\n','','','',''),
(27,'base','baseReglementSearch','Recherche règlements','formulaire recherche règlement','data_types','admin','post','',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: 3\n      bloc:\n      - date\n    col2:\n      size: 3\n      bloc:\n      - date\n    col3:\n      size: 3\n      bloc:\n      - submit\n...\n',NULL,'',NULL,NULL),
(28,'base','baseSendMail','Formulaire mail','formulaire pour mail','data_types','mail','post','/patient/actions/sendMail/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: 6\n      bloc:\n      - mailFrom,required\n    col2:\n      size: 6\n      bloc:\n      - mailTo,required\n  row2:\n    col1:\n      size: 12\n      bloc:\n      - mailSujet,required\n  row3:\n    col1:\n      size: 12\n      bloc:\n      - mailModeles\n  row4:\n    col1:\n      size: 12\n      bloc:\n      - mailBody,rows=10\n...\n',NULL,'',NULL,NULL),
(29,'base','baseSendMailApicrypt','Formulaire mail Apicrypt','formulaire pour expédier un mail vers un correspondant apicrypt','data_types','mail','post','/patient/actions/sendMail/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: 6\n      bloc:\n      - mailFrom,required\n    col2:\n      size: 6\n      bloc:\n      - mailToApicrypt,required\n  row2:\n    col1:\n      size: 12\n      bloc:\n      - mailSujet,required\n  row3:\n    col1:\n      size: 12\n      bloc:\n      - mailModeles\n  row4:\n    col1:\n      size: 12\n      bloc:\n      - mailBody,rows=10\n...\n',NULL,'',NULL,NULL),
(30,'base','baseUserParametersClicRdv','Paramètres utilisateur clicRDV','Paramètres utilisateur clicRDV','data_types','admin','post','/user/ajax/userParametersClicRdv/',7,'public','---\nglobal: formClass:\'ajaxForm\'\nstructure:\n  row1:\n    col1:\n      head: Compte clicRDV\n      size: 3\n      bloc:\n      - clicRdvUserId\n      - clicRdvPassword\n      - clicRdvGroupId\n      - clicRdvCalId\n      - clicRdvConsultId,nolabel\n...\n',NULL,NULL,NULL,NULL),
(31,'base','baseUserParametersPassword','Changement mot de passe utilisateur','Changement mot de passe utilisateur','data_types','admin','post','/user/actions/userParametersPassword/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: col-12\n      bloc:\n      - currentPassword,required\n      - password,required\n      - verifPassword,required\n...\n',NULL,NULL,NULL,NULL),
(32,'base','baseUserPasswordRecovery','Nouveau password après perte','saisie d\'un nouveau password en zone publique après perte','data_types','admin','post','/patient/ajax/saveCsForm/',7,'public','---\nstructure:\n  row1:\n    col1:\n      size: col-12\n      bloc:\n      - password,required\n      - verifPassword\n...\n','','','','$(document).ready(function() {\r\n  $(\"#treatNewPass\").on(\"click\", function(e) {\r\n    e.preventDefault();\r\n    password = $(\'#id_password_id\').val();\r\n    verifPassword = $(\'#id_verifPassword_id\').val();\r\n	randStringControl = $(\'input[name=\"randStringControl\"]\').val();\r\n\r\n    $.ajax({\r\n      url: urlBase + \'/public/ajax/publicLostPasswordNewPassTreat/\',\r\n      type: \'post\',\r\n      data: {\r\n        p_password: password,\r\n        p_verifPassword: verifPassword,\r\n        randStringControl: randStringControl,\r\n      },\r\n      dataType: \"json\",\r\n      success: function(data) {\r\n        \r\n       if (data.status == \'ok\') {\r\n         $(\'i.fa-lock\').addClass(\'text-success fa-unlock\').removeClass(\'text-warning fa-lock\');\r\n         $(\'#newPassAskForm\').addClass(\'d-none\');\r\n         $(\'#newPassTreatConfirmation\').removeClass(\'d-none\');\r\n       } else {\r\n         $(\'#newPassAskForm div.alert.cleanAndHideOnModalHide\').removeClass(\'d-none\');\r\n         $(\'#newPassAskForm div.alert.cleanAndHideOnModalHide ul\').html(\'\');\r\n         $.each(data.msg, function(index, value) {\r\n           $(\'#newPassAskForm div.alert.cleanAndHideOnModalHide ul\').append(\'<li>\' + value + \'</li>\');\r\n         });\r\n         $(\'#newPassAskForm .is-invalid\').removeClass(\'is-invalid\');\r\n         $.each(data.code, function(index, value) {\r\n           $(\'#newPassAskForm *[name=\"\' + value + \'\"]\').addClass(\'is-invalid\');\r\n         });\r\n       }        \r\n        \r\n\r\n      },\r\n      error: function() {\r\n        alert(\'Problème, rechargez la page !\');\r\n      }\r\n    });\r\n\r\n  });\r\n});');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_cat`
--

DROP TABLE IF EXISTS `forms_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms_cat` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` enum('base','user') NOT NULL DEFAULT 'user',
  `fromID` smallint(5) unsigned NOT NULL,
  `creationDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_cat`
--

LOCK TABLES `forms_cat` WRITE;
/*!40000 ALTER TABLE `forms_cat` DISABLE KEYS */;
INSERT INTO `forms_cat` VALUES
(1,'displayforms','Formulaires d\'affichage','Formulaires liés à l\'affichage d\'informations','user',1,'2019-01-01 00:00:00'),
(2,'formATCD','Formulaires d\'antécédents','Formulaires pour construire les antécédents','user',1,'2019-01-01 00:00:00'),
(3,'formCS','Formulaires de consultation','Formulaires pour construire les consultations','user',1,'2019-01-01 00:00:00'),
(4,'formSynthese','Formulaires de synthèse','Formulaires pour construire les synthèses','user',1,'2019-01-01 00:00:00'),
(5,'formsProdOrdoEtDoc','Formulaires de production d\'ordonnances','formulaires de production d\'ordonnances et de documents','user',1,'2019-01-01 00:00:00'),
(6,'patientforms','Formulaires de saisie','Formulaire liés à la saisie de données','user',1,'2019-01-01 00:00:00'),
(7,'systemForm','Formulaires système','formulaires système','user',1,'2019-01-01 00:00:00');
/*!40000 ALTER TABLE `forms_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hprim`
--

DROP TABLE IF EXISTS `hprim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hprim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromID` smallint(5) unsigned NOT NULL,
  `toID` smallint(5) unsigned NOT NULL,
  `date` date DEFAULT '1000-01-01',
  `objetID` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `labelStandard` varchar(255) NOT NULL,
  `typeResultat` varchar(2) NOT NULL,
  `resultat` varchar(255) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `normaleInf` varchar(20) NOT NULL,
  `normaleSup` varchar(20) NOT NULL,
  `indicateurAnormal` varchar(5) NOT NULL,
  `statutRes` varchar(1) NOT NULL,
  `resAutreU` varchar(50) NOT NULL,
  `normaleInfAutreU` varchar(20) NOT NULL,
  `normalSupAutreU` varchar(20) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hprim`
--

LOCK TABLES `hprim` WRITE;
/*!40000 ALTER TABLE `hprim` DISABLE KEYS */;
/*!40000 ALTER TABLE `hprim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailForUserID` smallint(5) unsigned NOT NULL DEFAULT 0,
  `txtFileName` varchar(30) NOT NULL,
  `mailHeaderInfos` blob DEFAULT NULL,
  `txtDatetime` datetime NOT NULL,
  `txtNumOrdre` int(10) unsigned NOT NULL,
  `hprimIdentite` varchar(250) NOT NULL,
  `hprimExpediteur` varchar(250) NOT NULL,
  `hprimCodePatient` varchar(250) NOT NULL,
  `hprimDateDossier` varchar(30) NOT NULL,
  `hprimAllSerialize` blob NOT NULL,
  `pjNombre` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `pjSerializeName` blob NOT NULL,
  `archived` enum('y','c','n') NOT NULL DEFAULT 'n',
  `assoToID` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`txtFileName`,`mailForUserID`) USING BTREE,
  UNIQUE KEY `id` (`id`),
  KEY `archived` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbox`
--

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motsuivi`
--

DROP TABLE IF EXISTS `motsuivi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motsuivi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fromID` int(10) unsigned NOT NULL,
  `toID` int(10) unsigned NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `texte` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fromID` (`fromID`),
  KEY `toID` (`toID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motsuivi`
--

LOCK TABLES `motsuivi` WRITE;
/*!40000 ALTER TABLE `motsuivi` DISABLE KEYS */;
/*!40000 ALTER TABLE `motsuivi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objets_data`
--

DROP TABLE IF EXISTS `objets_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objets_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fromID` int(10) unsigned NOT NULL DEFAULT 0,
  `byID` int(10) unsigned DEFAULT NULL,
  `toID` int(10) unsigned NOT NULL DEFAULT 0,
  `typeID` int(10) unsigned NOT NULL DEFAULT 0,
  `parentTypeID` int(10) unsigned DEFAULT 0,
  `instance` int(10) unsigned NOT NULL DEFAULT 0,
  `registerDate` datetime NOT NULL DEFAULT current_timestamp(),
  `creationDate` datetime DEFAULT current_timestamp(),
  `updateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `value` mediumtext DEFAULT NULL,
  `outdated` enum('','y') NOT NULL DEFAULT '',
  `important` enum('n','y') DEFAULT 'n',
  `titre` varchar(255) NOT NULL DEFAULT '',
  `deleted` enum('','y') NOT NULL DEFAULT '',
  `deletedByID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toID_typeID` (`toID`,`typeID`),
  KEY `typeID` (`typeID`),
  KEY `instance` (`instance`),
  KEY `parentTypeID` (`parentTypeID`),
  KEY `toID` (`toID`),
  KEY `toID_2` (`toID`,`outdated`,`deleted`),
  KEY `typeIDetValue` (`typeID`,`value`(15))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objets_data`
--

LOCK TABLES `objets_data` WRITE;
/*!40000 ALTER TABLE `objets_data` DISABLE KEYS */;
INSERT INTO `objets_data` VALUES
(1,1,NULL,5,122,0,0,'2024-11-24 14:23:14','2024-11-24 14:23:14','2024-11-24 14:23:14','Moussi','','n','','',NULL),
(2,1,NULL,5,120,0,0,'2024-11-24 14:23:14','2024-11-24 14:23:14','2024-11-24 14:23:14','ADMIN','','n','','',NULL);
/*!40000 ALTER TABLE `objets_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type` enum('patient','pro','externe','service','deleted','groupe','destroyed','registre') NOT NULL DEFAULT 'patient',
  `rank` enum('','admin') DEFAULT NULL,
  `module` varchar(20) DEFAULT 'base',
  `pass` varbinary(1000) DEFAULT NULL,
  `secret2fa` varbinary(1000) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `fromID` smallint(6) DEFAULT NULL,
  `lastLogIP` varchar(50) DEFAULT NULL,
  `lastLogDate` datetime DEFAULT NULL,
  `lastLogFingerprint` varchar(50) DEFAULT NULL,
  `lastLostPassDate` datetime DEFAULT NULL,
  `lastLostPassRandStr` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES
(1,'clicRDV','service','','base','',NULL,'2019-01-01 00:00:00',1,'','2019-01-01 00:00:00','',NULL,NULL),
(2,'medshake','service','','base','',NULL,'2019-01-01 00:00:00',1,'','2019-01-01 00:00:00','',NULL,NULL),
(5,'moussi','pro','admin','base','��?��*T�a�#b�=J�<+��7�Ϩ���<���׺�/Ȇ.v��n�9����K�i�&���f',NULL,'2024-11-24 13:23:14',1,'127.0.0.1','2024-11-24 13:33:04','fb5502b70deba2bdfcc946ebae18a9f76d5dc5db',NULL,NULL);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescriptions` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) unsigned NOT NULL DEFAULT 0,
  `label` varchar(250) NOT NULL,
  `description` mediumtext NOT NULL,
  `fromID` smallint(5) unsigned NOT NULL,
  `toID` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `toID` (`toID`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES
(1,1,'Ligne vierge','',1,0,'2019-01-01 00:00:00'),
(2,2,'Ligne vierge','',1,0,'2019-01-01 00:00:00'),
(3,1,'Ligne vierge','',1,0,'2019-01-01 00:00:00'),
(4,2,'Ligne vierge','',1,0,'2019-01-01 00:00:00');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions_cat`
--

DROP TABLE IF EXISTS `prescriptions_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescriptions_cat` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` enum('nonlap','lap') NOT NULL DEFAULT 'nonlap',
  `fromID` smallint(5) unsigned NOT NULL,
  `toID` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `creationDate` datetime NOT NULL,
  `displayOrder` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `displayOrder` (`displayOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions_cat`
--

LOCK TABLES `prescriptions_cat` WRITE;
/*!40000 ALTER TABLE `prescriptions_cat` DISABLE KEYS */;
INSERT INTO `prescriptions_cat` VALUES
(1,'prescriNonMedic','Prescriptions non médicamenteuses','prescriptions non médicamenteuses','nonlap',1,0,'2019-01-01 00:00:00',1),
(2,'prescripMedic','Prescriptions médicamenteuses','prescriptions médicamenteuses','nonlap',1,0,'2019-01-01 00:00:00',1);
/*!40000 ALTER TABLE `prescriptions_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printed`
--

DROP TABLE IF EXISTS `printed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fromID` int(10) unsigned NOT NULL,
  `toID` int(10) unsigned NOT NULL,
  `type` enum('cr','ordo','courrier','ordoLAP','ordoLapExt','doc','reglement') NOT NULL DEFAULT 'cr',
  `objetID` int(10) unsigned DEFAULT NULL,
  `creationDate` datetime DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `serializedTags` longblob DEFAULT NULL,
  `outdated` enum('','y') NOT NULL,
  `anonyme` enum('','y') DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `examenID` (`objetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printed`
--

LOCK TABLES `printed` WRITE;
/*!40000 ALTER TABLE `printed` DISABLE KEYS */;
/*!40000 ALTER TABLE `printed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `groupe` enum('system','module','cron','lock','plugin') DEFAULT 'system',
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nameGroupe` (`name`,`groupe`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES
(1,'base','module','v8.1.3'),
(2,'state','system','maintenance');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmissions`
--

DROP TABLE IF EXISTS `transmissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transmissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fromID` mediumint(8) unsigned DEFAULT NULL,
  `aboutID` int(10) unsigned DEFAULT NULL,
  `sujetID` int(10) unsigned DEFAULT NULL,
  `statut` enum('open','deleted') NOT NULL DEFAULT 'open',
  `priorite` tinyint(3) unsigned DEFAULT NULL,
  `registerDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sujet` varchar(255) DEFAULT NULL,
  `texte` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fromID` (`fromID`),
  KEY `aboutID` (`aboutID`),
  KEY `sujetID` (`sujetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmissions`
--

LOCK TABLES `transmissions` WRITE;
/*!40000 ALTER TABLE `transmissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transmissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmissions_to`
--

DROP TABLE IF EXISTS `transmissions_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transmissions_to` (
  `sujetID` int(10) unsigned NOT NULL,
  `toID` mediumint(8) unsigned NOT NULL,
  `destinataire` enum('oui','non') NOT NULL DEFAULT 'non',
  `statut` enum('open','checked','deleted') NOT NULL DEFAULT 'open',
  `dateLecture` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sujetID`,`toID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmissions_to`
--

LOCK TABLES `transmissions_to` WRITE;
/*!40000 ALTER TABLE `transmissions_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `transmissions_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `univtags_join`
--

DROP TABLE IF EXISTS `univtags_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `univtags_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `toID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqUnivTagsJoin` (`tagID`,`toID`),
  KEY `tagID` (`tagID`),
  KEY `toID` (`toID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `univtags_join`
--

LOCK TABLES `univtags_join` WRITE;
/*!40000 ALTER TABLE `univtags_join` DISABLE KEYS */;
/*!40000 ALTER TABLE `univtags_join` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `univtags_tag`
--

DROP TABLE IF EXISTS `univtags_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `univtags_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeID` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#B6B6B6',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqUnivTagTypeName` (`typeID`,`name`),
  KEY `typeID` (`typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `univtags_tag`
--

LOCK TABLES `univtags_tag` WRITE;
/*!40000 ALTER TABLE `univtags_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `univtags_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `univtags_type`
--

DROP TABLE IF EXISTS `univtags_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `univtags_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `droitCreSup` varchar(128) NOT NULL,
  `droitAjoRet` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `univtags_type`
--

LOCK TABLES `univtags_type` WRITE;
/*!40000 ALTER TABLE `univtags_type` DISABLE KEYS */;
INSERT INTO `univtags_type` VALUES
(1,'patients','Étiquettes pour catégoriser le dossier médical d\'un patient',1,'droitUnivTagPatientPeutCreerSuprimer','droitUnivTagPatientPeutAjouterRetirer'),
(2,'pros','Étiquettes pour catégoriser une fiche pro.',1,'droitUnivTagProPeutCreerSuprimer','droitUnivTagProPeutAjouterRetirer');
/*!40000 ALTER TABLE `univtags_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bdpm_presentationsVirtuelles`
--

/*!50001 DROP VIEW IF EXISTS `bdpm_presentationsVirtuelles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`moussi`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `bdpm_presentationsVirtuelles` AS (select `p`.`codeCIS` AS `codeSPE`,`g`.`idGroupe` AS `idGroupe`,`p`.`codeCIS` AS `codeCIS`,`p`.`codeCIP7` AS `codeCIP7`,`p`.`libelle` AS `libelle`,`p`.`statutAdministratif` AS `statutAdministratif`,`p`.`etatCommercialisation` AS `etatCommercialisation`,`p`.`dateCommercialisation` AS `dateCommercialisation`,`p`.`codeCIP13` AS `codeCIP13`,`p`.`agrementCol` AS `agrementCol`,`p`.`txRembouSS` AS `txRembouSS`,`p`.`prix1` AS `prix1`,`p`.`prix2` AS `prix2`,`p`.`prix3` AS `prix3`,`p`.`indicRembour` AS `indicRembour`,case when `con`.`condition` = 'réservé à l\'usage HOSPITALIER' then 'OUI' else 'NON' end AS `reservhop` from ((`bdpm_presentations` `p` left join `bdpm_groupesGeneriques` `g` on(`g`.`codeCIS` = `p`.`codeCIS` and `g`.`numOrdre` = '1')) left join `bdpm_conditions` `con` on(`con`.`codeCIS` = `p`.`codeCIS` and `con`.`condition` = 'réservé à l\'usage HOSPITALIER'))) union (select `g`.`idGroupe` AS `codeSPE`,`g`.`idGroupe` AS `idGroupe`,`p`.`codeCIS` AS `codeCIS`,`p`.`codeCIP7` AS `codeCIP7`,`p`.`libelle` AS `libelle`,`p`.`statutAdministratif` AS `statutAdministratif`,`p`.`etatCommercialisation` AS `etatCommercialisation`,`p`.`dateCommercialisation` AS `dateCommercialisation`,`p`.`codeCIP13` AS `codeCIP13`,`p`.`agrementCol` AS `agrementCol`,`p`.`txRembouSS` AS `txRembouSS`,`p`.`prix1` AS `prix1`,`p`.`prix2` AS `prix2`,`p`.`prix3` AS `prix3`,`p`.`indicRembour` AS `indicRembour`,case when `con`.`condition` = 'réservé à l\'usage HOSPITALIER' then 'OUI' else 'NON' end AS `reservhop` from ((`bdpm_presentations` `p` join `bdpm_groupesGeneriques` `g` on(`g`.`codeCIS` = `p`.`codeCIS` and `g`.`numOrdre` = '1')) left join `bdpm_conditions` `con` on(`con`.`codeCIS` = `p`.`codeCIS` and `con`.`condition` = 'réservé à l\'usage HOSPITALIER'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bdpm_specialitesVirtuelles`
--

/*!50001 DROP VIEW IF EXISTS `bdpm_specialitesVirtuelles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`moussi`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `bdpm_specialitesVirtuelles` AS (select `g`.`idGroupe` AS `codeSPE`,`g`.`codeCIS` AS `codeCIS`,concat(substring_index(`g`.`libelle`,' - ',1),', ',substring_index(`g`.`libelle`,', ',-1)) AS `denomination`,`s`.`formePharma` AS `formePharma`,`s`.`voiesAdmin` AS `voiesAdmin`,'' AS `statutAdminAMM`,'' AS `typeProcedAMM`,'' AS `etatCommercialisation`,'' AS `dateAMM`,'' AS `statutBDM`,'' AS `numAutoEU`,'' AS `tituAMM`,'' AS `surveillanceRenforcee`,'1' AS `monovir` from (`bdpm_groupesGeneriques` `g` left join `bdpm_specialites` `s` on(`s`.`codeCIS` = `g`.`codeCIS`)) where `g`.`typeGene` = '0' and `g`.`numOrdre` = '1') union (select `s1`.`codeCIS` AS `codeSPE`,`s1`.`codeCIS` AS `codeCIS`,`s1`.`denomination` AS `denomination`,`s1`.`formePharma` AS `formePharma`,`s1`.`voiesAdmin` AS `voiesAdmin`,`s1`.`statutAdminAMM` AS `statutAdminAMM`,`s1`.`typeProcedAMM` AS `typeProcedAMM`,`s1`.`etatCommercialisation` AS `etatCommercialisation`,`s1`.`dateAMM` AS `dateAMM`,`s1`.`statutBdm` AS `statutBdm`,`s1`.`numAutoEU` AS `numAutoEU`,`s1`.`tituAMM` AS `tituAMM`,`s1`.`surveillanceRenforcee` AS `surveillanceRenforcee`,'0' AS `monovir` from `bdpm_specialites` `s1`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 14:33:13
