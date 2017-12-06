CREATE DATABASE  IF NOT EXISTS `adquisiciones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adquisiciones`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: adquisiciones
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bienes`
--

DROP TABLE IF EXISTS `bienes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bienes` (
  `cod_bienes` int(11) NOT NULL,
  `nom_bienes` varchar(150) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `precio_base` decimal(19,4) NOT NULL,
  `est_categoria` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_bienes`),
  KEY `fk__producto__cod_ca__108b795b` (`cod_categoria`),
  CONSTRAINT `fk__producto__cod_ca__108b795b` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bienes`
--

LOCK TABLES `bienes` WRITE;
/*!40000 ALTER TABLE `bienes` DISABLE KEYS */;
INSERT INTO `bienes` VALUES (1,'CAMILLA DE EMERGENCIA SEMI AUTOMATICA',1,4640.3200,'1');
/*!40000 ALTER TABLE `bienes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `cod_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cargo` varchar(150) NOT NULL,
  `est_cargo` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_cargo`),
  KEY `fk_estado_idx` (`est_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL,
  `nom_categoria` varchar(150) NOT NULL,
  `est_categoria` varchar(15) DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'EQUIPOS MEDICOS','1');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conformidad`
--

DROP TABLE IF EXISTS `conformidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conformidad` (
  `cod_conformidad` int(11) NOT NULL,
  `cod_empleado` int(11) NOT NULL,
  `cod_orden` int(11) NOT NULL,
  `fec_conformidad` date NOT NULL,
  `nro_entregable` tinyint(3) unsigned NOT NULL,
  `conformidad_si_no` tinyint(4) NOT NULL DEFAULT '1',
  `aplica_penalidad_si_no` tinyint(4) NOT NULL DEFAULT '0',
  `est_conformidad` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `observaciones` varchar(500) NOT NULL,
  PRIMARY KEY (`cod_conformidad`),
  KEY `fk__conformid__cod_e__32e0915f` (`cod_empleado`),
  KEY `fk__conformid__cod_o__33d4b598` (`cod_orden`),
  CONSTRAINT `fk__conformid__cod_e__32e0915f` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`cod_empleado`),
  CONSTRAINT `fk__conformid__cod_o__33d4b598` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conformidad`
--

LOCK TABLES `conformidad` WRITE;
/*!40000 ALTER TABLE `conformidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `conformidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_conformidad_factura`
--

DROP TABLE IF EXISTS `detalle_conformidad_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_conformidad_factura` (
  `cod_conformidad` int(11) NOT NULL,
  `cod_bienes` int(11) NOT NULL,
  `cantidad_recibida` int(11) NOT NULL,
  `cod_factura` int(11) DEFAULT NULL,
  KEY `fk__detalle_c__cod_c__3c69fb99` (`cod_conformidad`),
  KEY `fk__detalle_c__cod_o__3d5e1fd2_idx` (`cod_bienes`),
  KEY `fk_factura_idx` (`cod_factura`),
  CONSTRAINT `fk__detalle_c__cod_c__3c69fb99` FOREIGN KEY (`cod_conformidad`) REFERENCES `conformidad` (`cod_conformidad`),
  CONSTRAINT `fk__detalle_c__cod_o__3d5e1fd2` FOREIGN KEY (`cod_bienes`) REFERENCES `bienes` (`cod_bienes`),
  CONSTRAINT `fk_detalle_factura_conformidad` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`cod_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_conformidad_factura`
--

LOCK TABLES `detalle_conformidad_factura` WRITE;
/*!40000 ALTER TABLE `detalle_conformidad_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_conformidad_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_orden` (
  `cod_orden` int(11) NOT NULL,
  `cod_bienes` int(11) NOT NULL,
  `cantidad_comprada` int(11) NOT NULL,
  `precio_compra` decimal(19,4) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  PRIMARY KEY (`cod_orden`,`cod_bienes`),
  KEY `fk__detalle_o__cod_p__2d27b809` (`cod_bienes`),
  CONSTRAINT `fk__detalle_o__cod_o__2c3393d0` FOREIGN KEY (`cod_orden`) REFERENCES `orden` (`cod_orden`),
  CONSTRAINT `fk__detalle_o__cod_p__2d27b809` FOREIGN KEY (`cod_bienes`) REFERENCES `bienes` (`cod_bienes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden`
--

LOCK TABLES `detalle_orden` WRITE;
/*!40000 ALTER TABLE `detalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_requerimiento`
--

DROP TABLE IF EXISTS `detalle_requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_requerimiento` (
  `cod_requerimiento` int(11) NOT NULL,
  `cod_bienes` int(11) NOT NULL,
  `cantidad_requerida` int(11) NOT NULL,
  `precio_base` double NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  PRIMARY KEY (`cod_requerimiento`,`cod_bienes`),
  KEY `fk__detalle_r__cod_p__20c1e124` (`cod_bienes`),
  CONSTRAINT `fk__detalle_r__cod_p__20c1e124` FOREIGN KEY (`cod_bienes`) REFERENCES `bienes` (`cod_bienes`),
  CONSTRAINT `fk__detalle_r__cod_r__1fcdbceb` FOREIGN KEY (`cod_requerimiento`) REFERENCES `requerimiento` (`cod_requerimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_requerimiento`
--

LOCK TABLES `detalle_requerimiento` WRITE;
/*!40000 ALTER TABLE `detalle_requerimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distrito` (
  `cod_distrito` int(11) NOT NULL,
  `nom_distrito` varchar(150) NOT NULL,
  `est_distrito` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_distrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'SAN MARTIN DE PORRES','1');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `cod_empleado` int(11) NOT NULL,
  `nom_empleado` varchar(150) NOT NULL,
  `ape_empleado` varchar(150) NOT NULL,
  `dir_empleado` varchar(150) NOT NULL,
  `cod_distrito` int(11) NOT NULL,
  `fec_nac_empleado` date NOT NULL,
  `tlf_empleado` varchar(15) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `est_empleado` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `cel_empleado` varchar(15) NOT NULL,
  `cod_usuario` char(8) DEFAULT NULL,
  `cod_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_empleado`),
  KEY `fk__empleado__cod_di__164452b1` (`cod_distrito`),
  KEY `cod_usuario_idx` (`cod_usuario`),
  KEY `cod_cargo_idx` (`cod_cargo`),
  CONSTRAINT `fk__empleado__cod_di__164452b1` FOREIGN KEY (`cod_distrito`) REFERENCES `distrito` (`cod_distrito`),
  CONSTRAINT `fk_cod_cargo` FOREIGN KEY (`cod_cargo`) REFERENCES `cargo` (`cod_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuariosistema` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'ELIAS','JURADO SANTOS','CAL. PEDRO REMY 190',1,'1986-01-17','013810817','eliasljurado@gmail.com','ACTIVO','940285514',NULL,NULL);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `cod_factura` int(11) NOT NULL,
  `cod_empleado` int(11) NOT NULL,
  `fec_emision` date NOT NULL,
  `fec_cancelacion` date DEFAULT NULL,
  `est_factura` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_factura`),
  KEY `fk__factura__cod_emp__4316f928` (`cod_empleado`),
  CONSTRAINT `fk__factura__cod_emp__4316f928` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`cod_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `cod_orden` int(11) NOT NULL,
  `cod_empleado` int(11) NOT NULL,
  `cod_requerimiento` int(11) NOT NULL,
  `tipo_orden` varchar(150) NOT NULL,
  `fec_orden` date NOT NULL,
  `cod_proveedor` int(11) NOT NULL,
  `cantidad_entregables` int(11) NOT NULL,
  `penalidad_diaria` decimal(19,4) NOT NULL,
  `est_orden` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  `observaciones` varchar(500) NOT NULL,
  PRIMARY KEY (`cod_orden`),
  KEY `fk__orden__cod_emple__267aba7a` (`cod_empleado`),
  KEY `fk__orden__cod_prove__286302ec` (`cod_proveedor`),
  KEY `fk__orden__cod_reque__276edeb3` (`cod_requerimiento`),
  CONSTRAINT `fk__orden__cod_emple__267aba7a` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`cod_empleado`),
  CONSTRAINT `fk__orden__cod_prove__286302ec` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`),
  CONSTRAINT `fk__orden__cod_reque__276edeb3` FOREIGN KEY (`cod_requerimiento`) REFERENCES `requerimiento` (`cod_requerimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `cod_proveedor` int(11) NOT NULL,
  `prov_razon_social` varchar(150) NOT NULL,
  `prov_ruc` varchar(15) NOT NULL,
  `prov_direccion` varchar(150) NOT NULL,
  `prov_telefono` varchar(15) NOT NULL,
  `prov_correo` varchar(150) NOT NULL,
  `prov_pais` varchar(150) NOT NULL,
  `cod_categoria` int(11) NOT NULL,
  `est_proveedor` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_proveedor`),
  KEY `fk__proveedor__cod_c__0ad2a005` (`cod_categoria`),
  CONSTRAINT `fk__proveedor__cod_c__0ad2a005` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'MEDICAL CARE S.A.C.','20430965781','AV. BENAVIDES 346, MIRAFLORES','013558945','ventas@medicalcare.com','PERU',1,'Activo'),(2,'GOGG','20430965781','AV. BENAVIDES 346, MIRAFLORES','013558945','ventas@medicalcare.com','PERU',1,'Activo');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requerimiento`
--

DROP TABLE IF EXISTS `requerimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requerimiento` (
  `cod_requerimiento` int(11) NOT NULL,
  `cod_empleado` int(11) NOT NULL,
  `fec_requerimiento` date NOT NULL,
  `fec_entrega` date NOT NULL,
  `est_requerimiento` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_requerimiento`),
  KEY `fk__requerimi__cod_e__1bfd2c07` (`cod_empleado`),
  CONSTRAINT `fk__requerimi__cod_e__1bfd2c07` FOREIGN KEY (`cod_empleado`) REFERENCES `empleado` (`cod_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimiento`
--

LOCK TABLES `requerimiento` WRITE;
/*!40000 ALTER TABLE `requerimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `requerimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(128) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `uk_principal_name` (`principal_id`,`name`),
  KEY `ix_tmp_autoinc` (`diagram_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
INSERT INTO `sysdiagrams` VALUES ('Diagrama General de logÃ­stica_adquisiciones',1,1,1,'ÐÏà¡±\Zá\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0þÿ	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%\0\0\0\0\0\0þÿÿÿ\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿýÿÿÿ\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0þÿÿÿ\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0!\0\0\0\"\0\0\0#\0\0\0$\0\0\0þÿÿÿþÿÿÿ=\0\0\0þÿÿÿ)\0\0\0*\0\0\0+\0\0\0,\0\0\0-\0\0\0.\0\0\0/\0\0\00\0\0\01\0\0\02\0\0\03\0\0\04\0\0\05\0\0\06\0\0\07\0\0\08\0\0\09\0\0\0:\0\0\0;\0\0\0<\0\0\0þÿÿÿ>\0\0\0þÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿR\0o\0o\0t\0 \0E\0n\0t\0r\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à2\rqc^Ó&\0\0\0À\0\0\0\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ê\0\0\0\0\0\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Š2\0\0\0\0\0\0\0C\0o\0m\0p\0O\0b\0j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_\0\0\0\0\0\0\0\04\0\nP\0\0€5\0\0\0\0ÿÿ(\0\0\05\0\0\0\0}\0\0ïl\0\0A<\0\0-\0oÄ\0\0&!ÿÿË‹ÿÿÞ€[ñ•Ð° \0ª\0½Ë\\\0\0\00\0\0\0\0\0\0\0\0\08\0+\0\0\0	\0\0\0Ùæ°éÐ­Q\0 ÉW9ô;„aÇC…5)†áÕRø 2}²Øb•B˜\'<%¢Ú-\0\0,\0C \0\0\0\0\0\0\0\0\0\0SDMÒÑŽc\0`—ÒßH4ÉÒwywØp\0[„\rœ\0\0,\0C \0\0\0\0\0\0\0\0\0\0QDMÒÑŽc\0`—ÒßH4ÉÒwywØp\0[„\rœ5\0\0\0Ð\0\0\0µ\0\0\04\0¥	\0\0\0\0€\0\0\0¤\0\0\0€\0\0	\0\0€SchGrid\0r%ÿÿœÍÿÿcategoria\0\0\0\0\04\0¥	\0\0\0\0€\0\0\0¨\0\0\0€\0\0\0\0€SchGrid\0Ž®ÿÿêÙÿÿconformidad\0\0\0<\0¥	\0\0\0\0€\0\0\0¸\0\0\0€\0\0\0\0€SchGrid\0Íÿÿˆáÿÿdetalle_conformidad\0\0\0€\0¥	\0\0\0\0€\0\0\0R\0\0\0€\0\0U\0\0€Control\0wÂÿÿÍåÿÿRelación \'FK__detalle_c__cod_c__3C69FB99\' entre \'conformidad\' y \'detalle_conformidad\'t\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0ß¾ÿÿèÿÿ\0\08\0¥	\0\0\0\0€\0\0\0°\0\0\0€\0\0\0\0€SchGrid\0ÿÿ^\Z\0\0detalle_factura\0\0\0|\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0Q\0\0€Control\0ÿ£ÿÿ%èÿÿRelación \'FK__detalle_f__cod_c__49C3F6B7\' entre \'conformidad\' y \'detalle_factura\'\0\0\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0§”ÿÿ§\0\0\0\0\08\0¥	\0\0\0\0€	\0\0\0¬\0\0\0€\0\0\r\0\0€SchGrid\0êCÿÿ|±ÿÿdetalle_orden\0\0\0\0@\0¥	\0\0\0\0€\n\0\0\0¼\0\0\0€\0\0\0\0€SchGrid\0bbÿÿÎæÿÿdetalle_requerimiento	\0\0\0\00\0¥	\0\0\0\0€\0\0\0¢\0\0\0€\0\0\0\0€SchGrid\0žqÿÿ>þÿÿdistrito\0\00\0¥	\0\0\0\0€\0\0\0¢\0\0\0€\0\0\0\0€SchGrid\0Ú€ÿÿŠÐÿÿempleado\0\0p\0¥	\0\0\0\0€\r\0\0\0b\0\0\0€\0\0G\0\0€Control\0“zÿÿ:íÿÿRelación \'FK__empleado__cod_di__164452B1\' entre \'distrito\' y \'empleado\'\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0éŠÿÿíüÿÿ\0\0t\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0J\0\0€Control\0Ã”ÿÿÅÞÿÿRelación \'FK__conformid__cod_e__32E0915F\' entre \'empleado\' y \'conformidad\'}\0\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0ControloÅ¥ÿÿUÞÿÿ\0\00\0¥	\0\0\0\0€\0\0\0 \0\0\0€\0\0\0\0€SchGrid\0ÿÿ>þÿÿfactura\0\0\0p\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0F\0\0€ControloeŠÿÿ>íÿÿRelación \'FK__factura__cod_emp__4316F928\' entre \'empleado\' y \'factura\'À\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0Ûyÿÿôüÿÿ\0\0t\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0I\0\0€Controloÿ£ÿÿcæÿÿRelación \'FK__factura__cod_con__440B1D61\' entre \'conformidad\' y \'factura\'\'}\0\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0c“ÿÿZóÿÿ\0\0x\0¥	\0\0\0\0€\0\0\0R\0\0\0€\0\0M\0\0€Control\0™ÿÿí\r\0\0Relación \'FK__detalle_f__cod_f__48CFD27E\' entre \'factura\' y \'detalle_factura\'\0¸\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0#‡ÿÿî\0\0\0\00\0¥	\0\0\0\0€\0\0\0œ\0\0\0€\0\0\0\0€SchGrid\0<yÿÿ¶†ÿÿordenid\0\0\0l\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0D\0\0€Control\0ã‚ÿÿŸÿÿRelación \'FK__orden__cod_emple__267ABA7A\' entre \'empleado\' y \'orden\'\0\0(\0µ\0\0\0\0€\Z\0\0\01\0\0\0o\0\0\0€\0\0Controloªvÿÿ®µÿÿ\0\0t\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0I\0\0€Control\0ûLÿÿŸÿÿRelación \'FK__detalle_o__cod_o__2C3393D0\' entre \'orden\' y \'detalle_orden\'ura\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0EÿÿS£ÿÿ\0\0p\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0G\0\0€Controlo‰„ÿÿŸÿÿRelación \'FK__conformid__cod_o__33D4B598\' entre \'orden\' y \'conformidad\'\0\0(\0µ\0\0\0\0€\0\0\01\0\0\0o\0\0\0€\0\0Control\0\Z¡ÿÿà¨ÿÿ\0\0x\0¥	\0\0\0\0€\0\0\0b\0\0\0€\0\0O\0\0€Control\0K†ÿÿŸÿÿRelación \'FK__detalle_c__cod_o__3D5E1FD2\' entre \'orden\' y \'detalle_conformidad\'\0\0(\0µ\0\0\0\0€ \0\0\01\0\0\0o\0\0\0€\0\0Control\0 Âÿÿ,¨ÿÿ\0\00\0¥	\0\0\0\0€!\0\0\0¢\0\0\0€\0\0\0\0€SchGrid\0r%ÿÿ´âÿÿproducto\0\0p\0¥	\0\0\0\0€\"\0\0\0R\0\0\0€\0\0H\0\0€Control\0g.ÿÿÈÖÿÿRelación \'FK__producto__cod_ca__108B795B\' entre \'categoria\' y \'producto\'\0\0(\0µ\0\0\0\0€#\0\0\01\0\0\0o\0\0\0€\0\0Control\0ÓÿÿÛÝÿÿ\0\0|\0¥	\0\0\0\0€$\0\0\0b\0\0\0€\0\0T\0\0€Control\0[9ÿÿçéÿÿRelación \'FK__detalle_r__cod_p__20C1E124\' entre \'producto\' y \'detalle_requerimiento\'\0\0(\0µ\0\0\0\0€%\0\0\01\0\0\0o\0\0\0€\0\0ControloY@ÿÿ…îÿÿ\0\0t\0¥	\0\0\0\0€&\0\0\0b\0\0\0€\0\0L\0\0€Control\0[9ÿÿ5¸ÿÿRelación \'FK__detalle_o__cod_p__2D27B809\' entre \'producto\' y \'detalle_orden\'\0\0(\0µ\0\0\0\0€\'\0\0\01\0\0\0o\0\0\0€\0\0Control\0RBÿÿ_Îÿÿ\0\04\0¥	\0\0\0\0€(\0\0\0¤\0\0\0€\0\0	\0\0€SchGrid\0r%ÿÿ\n«ÿÿproveedor\0\0\0\0\0t\0¥	\0\0\0\0€)\0\0\0R\0\0\0€\0\0I\0\0€Control\0g.ÿÿ7ÁÿÿRelación \'FK__proveedor__cod_c__0AD2A005\' entre \'categoria\' y \'proveedor\'en\'\0\0(\0µ\0\0\0\0€*\0\0\01\0\0\0o\0\0\0€\0\0Control\0­0ÿÿ²Çÿÿ\0\0p\0¥	\0\0\0\0€+\0\0\0Z\0\0\0€\0\0E\0\0€Control\0g.ÿÿóÿÿRelación \'FK__orden__cod_prove__286302EC\' entre \'proveedor\' y \'orden\'to\'\0\0(\0µ\0\0\0\0€,\0\0\01\0\0\0o\0\0\0€\0\0Controloq@ÿÿ“ÿÿ\0\0t\0¥	\0\0\0\0€-\0\0\0b\0\0\0€\0\0K\0\0€Control\0[9ÿÿÁµÿÿRelación \'FK__conformid__cod_p__34C8D9D1\' entre \'proveedor\' y \'conformidad\'\'\0\0(\0µ\0\0\0\0€.\0\0\01\0\0\0o\0\0\0€\0\0Control\0|ÿÿ¸ÿÿ\0\08\0¥	\0\0\0\0€/\0\0\0¬\0\0\0€\0\0\r\0\0€SchGrid\0bbÿÿDËÿÿrequerimiento\0\0\0\0t\0¥	\0\0\0\0€0\0\0\0b\0\0\0€\0\0L\0\0€Control\0Kvÿÿ)ÓÿÿRelación \'FK__requerimi__cod_e__1BFD2C07\' entre \'empleado\' y \'requerimiento\'\0\0(\0µ\0\0\0\0€1\0\0\01\0\0\0o\0\0\0€\0\0ControlowwÿÿSÕÿÿ\0\0„\0¥	\0\0\0\0€2\0\0\0R\0\0\0€\0\0Y\0\0€Control\0WkÿÿóÚÿÿRelación \'FK__detalle_r__cod_r__1FCDBCEB\' entre \'requerimiento\' y \'detalle_requerimiento\'\0\0\0\0\0(\0µ\0\0\0\0€3\0\0\01\0\0\0o\0\0\0€\0\0Control\0RYÿÿ;âÿÿ\0\0t\0¥	\0\0\0\0€4\0\0\0b\0\0\0€\0\0I\0\0€Control\0WkÿÿŸÿÿRelación \'FK__orden__cod_reque__276EDEB3\' entre \'requerimiento\' y \'orden\'to\'\0\0(\0µ\0\0\0\0€5\0\0\01\0\0\0o\0\0\0€\0\0Control\0mÿÿC¬ÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!C4\0\0\0\0\0ã\0\0xV4\0\0\0\0\0c\0a\0t\0e\0g\0o\0r\0i\0a\0\0\0r\0o\0g\0r\0a\0m\0 \0F\0i\0l\0e\0s\0 \0(\0x\08\06\0)\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0/\01\00\00\0/\0T\0o\0o\0l\0s\0/\0B\0i\0n\0n\0/\0V\0S\0S\0h\0e\0l\0l\0/\0C\0o\0m\0m\0o\0n\07\0/\0I\0D\0E\0/\0P\0r\0i\0v\0a\0t\0e\0A\0s\0s\0e\0m\0b\0l\0i\0e\0s\0/\0e\0s\0-\0E\0S\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\n\0\0\0c\0a\0t\0e\0g\0o\0r\0i\0a\0\0\0!C4\0\0\0\0\0\0\0xV4\0\0\0\0\0c\0o\0n\0f\0o\0r\0m\0i\0d\0a\0d\0\0\0g\0r\0a\0m\0 \0F\0i\0l\0e\0s\0 \0(\0x\08\06\0)\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0/\01\00\00\0/\0T\0o\0o\0l\0s\0/\0B\0i\0n\0n\0/\0V\0S\0S\0h\0e\0l\0l\0/\0C\0o\0m\0m\0o\0n\07\0/\0I\0D\0E\0/\0M\0i\0c\0r\0o\0s\0o\0f\0t\0.\0S\0q\0l\0S\0e\0r\0v\0e\0r\0.\0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0.\0D\0a\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0Í\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0½\0\0\0\0\0\0\0\0\0Ç\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0c\0o\0n\0f\0o\0r\0m\0i\0d\0a\0d\0\0\0!C4\0\0\0\0\0ã\0\0xV4\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0a\0d\0\0\0=\02\0.\00\0.\00\0.\00\0,\0 \0C\0u\0l\0t\0u\0r\0e\0=\0n\0e\0u\0t\0r\0a\0l\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0T\0o\0k\0e\0n\0=\0b\07\07\0a\05\0c\05\06\01\09\03\04\0e\00\08\09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0½\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0a\0d\0\0\0\0\0£ÃÿÿdçÿÿÍÿÿdçÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ß¾ÿÿèÿÿí\0\0X\0\02\0\0\0\0\0\0\0í\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0c\0_\0_\0c\0o\0d\0_\0c\0_\0_\03\0C\06\09\0F\0B\09\09\0!C4\0\0\0\0\0·	\0\0xV4\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0f\0a\0c\0t\0u\0r\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Hùv\\’®\\’®\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’®s\0/\0\0\0\0\0 ’®þÿÿÿo\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0·	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0½\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0f\0a\0c\0t\0u\0r\0a\0\0\0\0\0Ž®ÿÿ¼éÿÿ&¨ÿÿ¼éÿÿ&¨ÿÿ\0\0+¥ÿÿ\0\0\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0§”ÿÿ§\0\0\0Ð\0\0X\0\02\0\0\0\0\0\0\0Ð\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0f\0_\0_\0c\0o\0d\0_\0c\0_\0_\04\09\0C\03\0F\06\0B\07\0!C4\0\0\0\0\0:\0\0xV4\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0o\0r\0d\0e\0n\0\0\0,\0 \0V\0e\0r\0s\0i\0o\0n\0=\01\00\0.\00\0.\00\0.\00\0,\0 \0C\0u\0l\0t\0u\0r\0e\0=\0n\0e\0u\0t\0r\0a\0l\0,\0 \0P\0u\0b\0l\0i\0c\0K\0e\0y\0T\0o\0k\0e\0n\0=\08\09\08\04\05\0d\0c\0d\08\00\08\00\0c\0c\09\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0o\0r\0d\0e\0n\0\0\0!C4\0\0\0\0\0\0\0xV4\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0r\0e\0q\0u\0e\0r\0i\0m\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0r\0e\0q\0u\0e\0r\0i\0m\0i\0e\0n\0t\0o\0\0\0!C4\0\0\0\0\0ã\0\0xV4\0\0\0\0\0d\0i\0s\0t\0r\0i\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0ÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0d\0i\0s\0t\0r\0i\0t\0o\0\0\0!C4\0\0\0\0\0k\0\0xV4\0\0\0\0\0e\0m\0p\0l\0e\0a\0d\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0Þ \0\0\0\0\0\0-\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0½\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0e\0m\0p\0l\0e\0a\0d\0o\0\0\0\0\0*|ÿÿ>þÿÿ*|ÿÿEüÿÿ:ŠÿÿEüÿÿ:Šÿÿõïÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0éŠÿÿíüÿÿ|\0\0X\0\09\0\0\0\0\0\0\0|\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0e\0m\0p\0l\0e\0a\0d\0o\0_\0_\0c\0o\0d\0_\0d\0i\0_\0_\01\06\04\04\05\02\0B\01\0\0\0ï•ÿÿ\\àÿÿr§ÿÿ\\àÿÿr§ÿÿ8æÿÿŽ®ÿÿ8æÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Å¥ÿÿUÞÿÿ`\0\0X\0\02\0\0\0\0\0\0\0`\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0_\0_\0c\0o\0d\0_\0e\0_\0_\03\02\0E\00\09\01\05\0F\0!C4\0\0\0\0\0f\0\0xV4\0\0\0\0\0f\0a\0c\0t\0u\0r\0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0ˆ\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0½\0\0\0\0\0\0\0\0\0Ç\0\0!\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0f\0a\0c\0t\0u\0r\0a\0\0\0\0\0ü‹ÿÿõïÿÿü‹ÿÿEüÿÿ¢šÿÿEüÿÿ¢šÿÿ>þÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ûyÿÿôüÿÿš\0\0X\0\02\0\0\0\0\0\0\0š\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0f\0a\0c\0t\0u\0r\0a\0_\0_\0c\0o\0d\0_\0e\0m\0p\0_\0_\04\03\01\06\0F\09\02\08\0\0\0Ž®ÿÿúçÿÿr§ÿÿúçÿÿr§ÿÿž\0\0+¥ÿÿž\0\0\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0c“ÿÿZóÿÿ`\0\0X\0\02\0\0\0\0\0\0\0`\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0f\0a\0c\0t\0u\0r\0a\0_\0_\0c\0o\0d\0_\0c\0o\0n\0_\0_\04\04\00\0B\01\0D\06\01\0\0\0¢šÿÿ¤\0\0¢šÿÿ^\Z\0\0\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#‡ÿÿî\0\0Ð\0\0X\0\0?\0\0\0\0\0\0\0Ð\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0f\0_\0_\0c\0o\0d\0_\0f\0_\0_\04\08\0C\0F\0D\02\07\0E\0!C4\0\0\0\0\0\0\0xV4\0\0\0\0\0o\0r\0d\0e\0n\0\0\0c\0o\0l\0.\0i\0n\0d\0e\0x\0_\0c\0o\0l\0u\0m\0n\0_\0i\0d\0,\0 \0c\0o\0l\0.\0n\0a\0m\0e\0 \0a\0s\0 \0c\0o\0l\0u\0m\0n\0_\0n\0N\0a\0m\0e\0,\0 \0i\0n\0d\0_\0c\0o\0l\0.\0k\0e\0y\0_\0o\0r\0d\0i\0n\0a\0l\0,\0 \0i\0n\0d\0_\0c\0o\0l\0.\0i\0s\0_\0d\0e\0s\0c\0e\0n\0d\0i\0n\0g\0_\0k\0e\0y\0,\0 \0i\0n\0d\0_\0c\0o\0l\0.\0i\0s\0_\0i\0n\0c\0l\0u\0d\0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0Í\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0o\0r\0d\0e\0n\0\0\0\0\0f‹ÿÿŠÐÿÿf‹ÿÿå¨ÿÿ^„ÿÿå¨ÿÿ^„ÿÿÊ¡ÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0ªvÿÿ®µÿÿ\r\0\0X\0\02\0\0\0\0\0\0\0\r\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0o\0r\0d\0e\0n\0_\0_\0c\0o\0d\0_\0e\0m\0p\0l\0e\0_\0_\02\06\07\0A\0B\0A\07\0A\0\0\0Ú€ÿÿÊ¡ÿÿÚ€ÿÿZ¥ÿÿvNÿÿZ¥ÿÿvNÿÿ|±ÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0EÿÿS£ÿÿC\0\0X\0\0B\0\0\0\0\0\0\0C\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0o\0_\0_\0c\0o\0d\0_\0o\0_\0_\02\0C\03\03\09\03\0D\00\0\0\0 †ÿÿÊ¡ÿÿ †ÿÿ1¨ÿÿ\Z¹ÿÿ1¨ÿÿ\Z¹ÿÿêÙÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z¡ÿÿà¨ÿÿ|\0\0X\0\02\0\0\0\0\0\0\0|\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0_\0_\0c\0o\0d\0_\0o\0_\0_\03\03\0D\04\0B\05\09\08\0\0\0â‡ÿÿÊ¡ÿÿâ‡ÿÿ}§ÿÿ’×ÿÿ}§ÿÿ’×ÿÿˆáÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0 Âÿÿ,¨ÿÿ&\0\0X\0\0:\0\0\0\0\0\0\0&\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0c\0_\0_\0c\0o\0d\0_\0o\0_\0_\03\0D\05\0E\01\0F\0D\02\0!C4\0\0\0\0\0:\0\0xV4\0\0\0\0\0p\0r\0o\0d\0u\0c\0t\0o\0\0\0p\0a\0c\0e\0_\0n\0a\0m\0e\0,\0 \0i\0n\0d\0.\0i\0n\0d\0e\0x\0_\0i\0d\0,\0 \0i\0n\0d\0.\0t\0y\0p\0e\0,\0 \0i\0n\0d\0.\0i\0s\0_\0u\0n\0i\0q\0u\0e\0,\0 \0i\0n\0d\0.\0i\0g\0n\0o\0r\0e\0_\0d\0u\0p\0_\0k\0e\0y\0,\0 \0i\0n\0d\0.\0i\0s\0_\0p\0r\0i\0m\0a\0r\0y\0_\0k\0e\0y\0,\0 \0i\0n\0d\0.\0i\0s\0_\0u\0n\0i\0q\0u\0e\0_\0c\0o\0n\0s\0t\0r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0w\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0	\0\0\0p\0r\0o\0d\0u\0c\0t\0o\0\0\0\0\0þ/ÿÿÙÿÿþ/ÿÿ´âÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#\0\0\0\0\0\0\0ÓÿÿÛÝÿÿ|\0\0X\0\07\0\0\0\0\0\0\0|\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0p\0r\0o\0d\0u\0c\0t\0o\0_\0_\0c\0o\0d\0_\0c\0a\0_\0_\01\00\08\0B\07\09\05\0B\0\0\0‡:ÿÿ~ëÿÿ£Aÿÿ~ëÿÿ£AÿÿÖíÿÿbbÿÿÖíÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%\0\0\0\0\0\0\0Y@ÿÿ…îÿÿí\0\0X\0\0A\0\0\0\0\0\0\0í\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0r\0_\0_\0c\0o\0d\0_\0p\0_\0_\02\00\0C\01\0E\01\02\04\0\0\0‡:ÿÿ¼éÿÿ£Aÿÿ¼éÿÿ£Aÿÿ°¹ÿÿêCÿÿ°¹ÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\'\0\0\0\0\0\0\0RBÿÿ_Îÿÿ&\0\0X\0\0=\0\0\0\0\0\0\0&\0\0X\0\0\0\0\0\0\0\0\0€\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0o\0_\0_\0c\0o\0d\0_\0p\0_\0_\02\0D\02\07\0B\08\00\09\0!C4\0\0\0\0\0è\0\0xV4\0\0\0\0\0p\0r\0o\0v\0e\0e\0d\0o\0r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0»\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0è\0\0\0\0\0\0	\0\0\0	\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\n\0\0\0p\0r\0o\0v\0e\0e\0d\0o\0r\0\0\0\0\0þ/ÿÿœÍÿÿþ/ÿÿòÃÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*\0\0\0\0\0\0\0­0ÿÿ²Çÿÿð\0\0X\0\07\0\0\0\0\0\0\0ð\0\0X\0\0\0\0\0\0\0ÿÿÿ\0\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0p\0r\0o\0v\0e\0e\0d\0o\0r\0_\0_\0c\0o\0d\0_\0c\0_\0_\00\0A\0D\02\0A\00\00\05\0\0\0þ/ÿÿ\n«ÿÿþ/ÿÿn’ÿÿ<yÿÿn’ÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0\0\0\0\0q@ÿÿ“ÿÿÔ\0\0X\0\00\0\0\0\0\0\0\0Ô\0\0X\0\0\0\0\0\0\0ÿÿÿ\0\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0o\0r\0d\0e\0n\0_\0_\0c\0o\0d\0_\0p\0r\0o\0v\0e\0_\0_\02\08\06\03\00\02\0E\0C\0\0\0‡:ÿÿX·ÿÿ&¨ÿÿX·ÿÿ&¨ÿÿväÿÿŽ®ÿÿväÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0\0|ÿÿ¸ÿÿ¶\0\0X\0\02\0\0\0\0\0\0\0¶\0\0X\0\0\0\0\0\0\0ÿÿÿ\0\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0_\0_\0c\0o\0d\0_\0p\0_\0_\03\04\0C\08\0D\09\0D\01\0!C4\0\0\0\0\0f\0\0xV4\0\0\0\0\0r\0e\0q\0u\0e\0r\0i\0m\0i\0e\0n\0t\0o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0,\0\0\0,\0\0\0,\0\0\04\0\0\0\0\0\0\0\0\0\0\0–$\0\0ˆ\0\0\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0T\0\0\0\0h\0\0ÿ\0\0\08\0\0\0\0J\0\0\0\0²\0\0Ñ\0\0\0\0\0\0\0\0\0\0\0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Û\0\0\0\0\0\0\0\0\0Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0Ç\0\0í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0\0\0\0\0\0\0\0\0,\0\0Þ \0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0¼\0\0$	\0\0 \0\0xV4\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0r\0e\0q\0u\0e\0r\0i\0m\0i\0e\0n\0t\0o\0\0\0\0\0Ú€ÿÿ\\àÿÿ\nyÿÿ\\àÿÿ\nyÿÿ¤Ôÿÿwwÿÿ¤Ôÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01\0\0\0\0\0\0\0wwÿÿSÕÿÿC\0\0X\0\0d\0\0\0\0\0\0\0C\0\0X\0\0\0\0\0\0\0ÿÿÿ\0\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0r\0e\0q\0u\0e\0r\0i\0m\0i\0_\0_\0c\0o\0d\0_\0e\0_\0_\01\0B\0F\0D\02\0C\00\07\0\0\0îlÿÿªÝÿÿîlÿÿÎæÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\03\0\0\0\0\0\0\0RYÿÿ;âÿÿí\0\0X\0\0;\0\0\0\0\0\0\0í\0\0X\0\0\0\0\0\0\0ÿÿÿ\0\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0r\0_\0_\0c\0o\0d\0_\0r\0_\0_\01\0F\0C\0D\0B\0C\0E\0B\0\0\0îlÿÿDËÿÿîlÿÿå¨ÿÿœ‚ÿÿå¨ÿÿœ‚ÿÿÊ¡ÿÿ\0\0\0\0\0\0\0ððð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05\0\0\0\0\0\0\0mÿÿC¬ÿÿÔ\0\0X\0\02\0\0\0\0\0\0\0Ô\0\0X\0\0\0\0\0\0\0ÿÿÿ\0\0\0€\0\0\0\0\0\0\0DB\0Tahoma\0F\0K\0_\0_\0o\0r\0d\0e\0n\0_\0_\0c\0o\0d\0_\0r\0e\0q\0u\0e\0_\0_\02\07\06\0E\0D\0E\0B\03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0þÿÿÿþÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0þÿÿÿþÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\0þÿ\n\0\0ÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Microsoft DDS Form 2.0\0\0\0\0Embedded Object\0\0\0\0\0ô9²q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Na¼\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ûæ°éÐ­Q\0 ÉW9\0\0\0`µØpc^Ó\0\0HE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0x\0\0D\0a\0t\0a\0 \0S\0o\0u\0r\0c\0e\0=\0(\0l\0o\0c\0a\0l\0)\0\\\0S\0Q\0L\0E\0X\0P\0R\0E\0S\0S\0;\0I\0n\0i\0t\0i\0a\0l\0 \0C\0a\0t\0a\0l\0o\0g\0=\0l\0o\0g\0i\0s\0t\0i\0c\0a\0;\0I\0n\0t\0e\0g\0r\0a\0t\0e\0d\0 \0S\0e\0c\0u\0r\0i\0t\0y\0=\0T\0r\0u\0e\0;\0M\0u\0l\0t\0i\0p\0l\0e\0A\0c\0t\0i\0v\0e\0R\0e\0s\0u\0l\0t\0S\0e\0t\0s\0=\0F\0a\0l\0s\0e\0;\0P\0a\0c\0k\0e\0t\0 \0S\0i\0z\0e\0=\04\00\09\06\0;\0A\0p\0\0D\0d\0s\0S\0t\0r\0e\0a\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0N(\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0S\0R\0E\0F\0-\0S\0C\0H\0E\0M\0A\0-\0C\0O\0N\0T\0E\0N\0T\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0º\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0 \0P\0o\0s\0t\0 \0V\06\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&!ÿÿË‹ÿÿ\0&\0\0\0s\0c\0h\0_\0l\0a\0b\0e\0l\0s\0_\0v\0i\0s\0i\0b\0l\0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\02\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\02\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0c\0_\0_\0c\0o\0d\0_\0c\0_\0_\03\0C\06\09\0F\0B\09\09\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Í´˜Í´\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\02\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0f\0_\0_\0c\0o\0d\0_\0c\0_\0_\04\09\0C\03\0F\06\0B\07\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0±¿0±¿\0\0\0\0\0\0\0\0­\0\0\0\0	\0\0\0	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\n\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\02\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\r\0\0\0\r\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0e\0m\0p\0l\0e\0a\0d\0o\0_\0_\0c\0o\0d\0_\0d\0i\0_\0_\01\06\04\04\05\02\0B\01\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0³¿ð³¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0_\0_\0c\0o\0d\0_\0e\0_\0_\03\02\0E\00\09\01\05\0F\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0²¿0²¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\02\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0f\0a\0c\0t\0u\0r\0a\0_\0_\0c\0o\0d\0_\0e\0m\0p\0_\0_\04\03\01\06\0F\09\02\08\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³¿0³¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0f\0a\0c\0t\0u\0r\0a\0_\0_\0c\0o\0d\0_\0c\0o\0n\0_\0_\04\04\00\0B\01\0D\06\01\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0µ¿pµ¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0f\0_\0_\0c\0o\0d\0_\0f\0_\0_\04\08\0C\0F\0D\02\07\0E\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0±¿°±¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0o\0r\0d\0e\0n\0_\0_\0c\0o\0d\0_\0e\0m\0p\0l\0e\0_\0_\02\06\07\0A\0B\0A\07\0A\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\Z\0\0\0\Z\0\0\0\0\0\0\0\0\0³¿°³¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0o\0_\0_\0c\0o\0d\0_\0o\0_\0_\02\0C\03\03\09\03\0D\00\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³¿p³¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0_\0_\0c\0o\0d\0_\0o\0_\0_\03\03\0D\04\0B\05\09\08\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·¿0·¿\0\0\0\0\0\0\0\0­\0\0\0\0\0\0\0\0\0\0\0\0\0\0N\0\0\0\05\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0c\0_\0_\0c\0o\0d\0_\0o\0_\0_\03\0D\05\0E\01\0F\0D\02\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0 \0\0\0 \0\0\0\0\0\0\0\0\0¶¿0¶¿\0\0\0\0\0\0\0\0­\0\0\0\0!\0\0\0!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0\"\0\0\0\"\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0p\0r\0o\0d\0u\0c\0t\0o\0_\0_\0c\0o\0d\0_\0c\0a\0_\0_\01\00\08\0B\07\09\05\0B\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0#\0\0\0#\0\0\0\"\0\0\0\0\0\0´¿p´¿\0\0\0\0\0\0\0\0­\0\0\0\0$\0\0\0$\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0r\0_\0_\0c\0o\0d\0_\0p\0_\0_\02\00\0C\01\0E\01\02\04\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0%\0\0\0%\0\0\0$\0\0\0\0\0\0°¿p°¿\0\0\0\0\0\0\0\0­\0\0\0\0&\0\0\0&\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0o\0_\0_\0c\0o\0d\0_\0p\0_\0_\02\0D\02\07\0B\08\00\09\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0\'\0\0\0\'\0\0\0&\0\0\0\0\0\0²¿°²¿\0\0\0\0\0\0\0\0­\0\0\0\0(\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\0)\0\0\0)\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0p\0r\0o\0v\0e\0e\0d\0o\0r\0_\0_\0c\0o\0d\0_\0c\0_\0_\00\0A\0D\02\0A\00\00\05\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0*\0\0\0*\0\0\0)\0\0\0\0\0\0®¿p®¿\0\0\0\0\0\0\0\0­\0\0\0\0+\0\0\0+\0\0\0\0\0\0\0N\0\0\0\05\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0o\0r\0d\0e\0n\0_\0_\0c\0o\0d\0_\0p\0r\0o\0v\0e\0_\0_\02\08\06\03\00\02\0E\0C\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0,\0\0\0,\0\0\0+\0\0\0\0\0\0ª¿pª¿\0\0\0\0\0\0\0\0­\0\0\0\0-\0\0\0-\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0_\0_\0c\0o\0d\0_\0p\0_\0_\03\04\0C\08\0D\09\0D\01\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\0.\0\0\0.\0\0\0-\0\0\0\0\0\0­¿0­¿\0\0\0\0\0\0\0\0­\0\0\0\0/\0\0\0/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ð\0\0\0(\0\0\0A\0c\0t\0i\0v\0e\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0\0\0\0\0\0\0\0\0\01\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\00\0\0\0\0\0\0\0:\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\0,\01\06\02\00\0,\05\0,\01\00\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\01\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\07\05\05\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\02\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\03\0\0\0\0\0\0\0\0\0\02\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0\0\0 \0\0\0T\0a\0b\0l\0e\0V\0i\0e\0w\0M\0o\0d\0e\0:\04\0\0\0\0\0\0\0>\0\0\04\0,\00\0,\02\08\04\0,\00\0,\01\09\08\00\0,\01\02\0,\02\03\04\00\0,\01\01\0,\01\04\04\00\0\0\00\0\0\00\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0r\0e\0q\0u\0e\0r\0i\0m\0i\0_\0_\0c\0o\0d\0_\0e\0_\0_\01\0B\0F\0D\02\0C\00\07\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\01\0\0\01\0\0\00\0\0\0\0\0\0¨¿p¨¿\0\0\0\0\0\0\0\0­\0\0\0\02\0\0\02\0\0\0\0\0\0\0N\0\0\0ÿ·\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0d\0e\0t\0a\0l\0l\0e\0_\0r\0_\0_\0c\0o\0d\0_\0r\0_\0_\01\0F\0C\0D\0B\0C\0E\0B\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\03\0\0\03\0\0\02\0\0\0\0\0\0¨¿°¨¿\0\0\0\0\0\0\0\0­\0\0\0\04\0\0\04\0\0\0\0\0\0\0N\0\0\0\05\0\0\0\0d\0b\0o\0\0\0F\0K\0_\0_\0o\0r\0d\0e\0n\0_\0_\0c\0o\0d\0_\0r\0e\0q\0u\0e\0_\0_\02\07\06\0E\0D\0E\0B\03\0\0\0\0\0\0\0\0\0\0\0Ä\0\0\0\05\0\0\05\0\0\04\0\0\0\0\0\0­¿ð­¿\0\0\0\0\0\0\0\0­\0\0\0\0d\0\0\0)\0\0\0\0\0\0(\0\0\0\"\0\0\0#\0\0\0\"\0\0\0\0\0\0!\0\0\0#\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0t\0\0\0e\0\0\0\0\0\0\0\0\0\0\0\0z\0\0\0U\0\0\0\0\0\0\0\0\0\0\0\0s\0\0\0X\0\0\0\r\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\00\0\0\0\0\0\0/\0\0\0z\0\0\0e\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0%\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0{\0\0\0n\0\0\0\0\0\0\0\0\0\0\0\0#\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\01\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0+\0\0\0\"\0\0\0\0\0\0\0\0\0	\0\0\0\0\0\0\"\0\0\0&\0\0\0!\0\0\0	\0\0\0]\0\0\0`\0\0\0$\0\0\0!\0\0\0\n\0\0\0c\0\0\0\\\0\0\0-\0\0\0(\0\0\0\0\0\0o\0\0\0h\0\0\0+\0\0\0(\0\0\0\0\0\0\"\0\0\0l\0\0\04\0\0\0/\0\0\0\0\0\0\"\0\0\0\0\0\02\0\0\0/\0\0\0\n\0\0\0#\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\0l\0i\0c\0a\0t\0i\0o\0n\0 \0N\0a\0m\0e\0=\0\"\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0 \0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0 \0S\0t\0u\0d\0i\0o\0\"\0\0\0\0€\0X\0\0\0D\0i\0a\0g\0r\0a\0m\0a\0 \0G\0e\0n\0e\0r\0a\0l\0 \0d\0e\0 \0l\0o\0g\0í\0s\0t\0i\0c\0a\0_\0a\0d\0q\0u\0i\0s\0i\0c\0i\0o\0n\0e\0s\0\0\0\0&\0\0\0\0c\0a\0t\0e\0g\0o\0r\0i\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0c\0o\0n\0f\0o\0r\0m\0i\0d\0a\0d\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0(\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0c\0o\0n\0f\0o\0r\0m\0i\0d\0a\0d\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0 \0\0\0d\0e\0t\0a\0l\0l\0e\0_\0f\0a\0c\0t\0u\0r\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0o\0r\0d\0e\0n\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0,\0\0\0d\0e\0t\0a\0l\0l\0e\0_\0r\0e\0q\0u\0e\0r\0i\0m\0i\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0d\0i\0s\0t\0r\0i\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0e\0m\0p\0l\0e\0a\0d\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0f\0a\0c\0t\0u\0r\0a\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0o\0r\0d\0e\0n\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0p\0r\0o\0d\0u\0c\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0&\0\0\0\0p\0r\0o\0v\0e\0e\0d\0o\0r\0\0\0\0\0\0d\0b\0o\0\0\0\0$\0\0\0\0r\0e\0q\0u\0e\0r\0i\0m\0i\0e\0n\0t\0o\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0Ö…	³»kòEš¸7dð2p\0N\0\0\0{\01\06\03\04\0C\0D\0D\07\0-\00\08\08\08\0-\04\02\0E\03\0-\09\0F\0A\02\0-\0B\06\0D\03\02\05\06\03\0B\09\01\0D\0}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0bˆR');
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariosistema`
--

DROP TABLE IF EXISTS `usuariosistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuariosistema` (
  `cod_usuario` char(8) NOT NULL,
  `pass_usuario` varchar(8) NOT NULL,
  `est_usuario` varchar(15) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariosistema`
--

LOCK TABLES `usuariosistema` WRITE;
/*!40000 ALTER TABLE `usuariosistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariosistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'adquisiciones'
--

--
-- Dumping routines for database 'adquisiciones'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06 11:12:14
