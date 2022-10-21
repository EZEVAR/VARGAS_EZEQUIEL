-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ejecicio2
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `fecha_alta` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `LOCALIDAD_codigo_localidad1` int NOT NULL,
  PRIMARY KEY (`id_empleado`,`LOCALIDAD_codigo_localidad1`),
  KEY `fk_EMPLEADO_LOCALIDAD1_idx` (`LOCALIDAD_codigo_localidad1`),
  CONSTRAINT `fk_EMPLEADO_LOCALIDAD1` FOREIGN KEY (`LOCALIDAD_codigo_localidad1`) REFERENCES `localidad` (`codigo_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (2,'36253231','JOSE LOPEZ','01123589654','2020-10-10',1),(3,'90321759','SEBASTIAN WILLER','1123567589','1999-10-06',2),(4,'40326521','DORA SOTO',NULL,'2021-03-19',3);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `codigo_localidad` int NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `codigo_postal` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `PROVINCIA_id_provincia1` int NOT NULL,
  PRIMARY KEY (`codigo_localidad`,`PROVINCIA_id_provincia1`),
  UNIQUE KEY `codigo_postal_UNIQUE` (`codigo_postal`),
  KEY `fk_LOCALIDAD_PROVINCIA2_idx` (`PROVINCIA_id_provincia1`),
  CONSTRAINT `fk_LOCALIDAD_PROVINCIA2` FOREIGN KEY (`PROVINCIA_id_provincia1`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'CORRIENTES','3400',1),(2,'DURAZNO','7000',3),(3,'AVELLANEDA','1870',2);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `id_pais_UNIQUE` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'ARGENTINA'),(2,'URUGUAY'),(3,'PARAGUAY');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `PAIS_id_pais1` int NOT NULL,
  PRIMARY KEY (`id_provincia`,`PAIS_id_pais1`),
  KEY `fk_PROVINCIA_PAIS2_idx` (`PAIS_id_pais1`),
  CONSTRAINT `fk_PROVINCIA_PAIS2` FOREIGN KEY (`PAIS_id_pais1`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'CORRIENTES ',1),(2,'BUENOS AIRES',1),(3,'MONTEVIDEO',2),(4,'ENCARNACION',3);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 20:27:40
