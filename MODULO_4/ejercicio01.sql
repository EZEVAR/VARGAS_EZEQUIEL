-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ejercicio1
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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `cod_matricula` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `dni` varchar(30) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_matricula`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `fecha_nacimiento_UNIQUE` (`fecha_nacimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'DANTE LOPEZ','23569856','1980-02-12','DEJARLOPASAR@GMAIL.COM'),(2,'JULIO SOTO','42053625','2016-12-13',NULL),(3,'LUCIA ESTEBAES','33568956','1987-03-05','HOLA@GMAIL.COM');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_has_curso1`
--

DROP TABLE IF EXISTS `alumno_has_curso1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_has_curso1` (
  `ALUMNO_cod_matricula` int NOT NULL,
  `CURSO_cod_curso` int NOT NULL,
  `CURSO_ALUMNO_cod_matricula` int NOT NULL,
  PRIMARY KEY (`ALUMNO_cod_matricula`,`CURSO_cod_curso`,`CURSO_ALUMNO_cod_matricula`),
  KEY `fk_ALUMNO_has_CURSO1_CURSO1_idx` (`CURSO_cod_curso`,`CURSO_ALUMNO_cod_matricula`),
  KEY `fk_ALUMNO_has_CURSO1_ALUMNO1_idx` (`ALUMNO_cod_matricula`),
  CONSTRAINT `fk_ALUMNO_has_CURSO1_ALUMNO1` FOREIGN KEY (`ALUMNO_cod_matricula`) REFERENCES `alumno` (`cod_matricula`),
  CONSTRAINT `fk_ALUMNO_has_CURSO1_CURSO1` FOREIGN KEY (`CURSO_cod_curso`, `CURSO_ALUMNO_cod_matricula`) REFERENCES `curso` (`cod_curso`, `ALUMNO_cod_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_has_curso1`
--

LOCK TABLES `alumno_has_curso1` WRITE;
/*!40000 ALTER TABLE `alumno_has_curso1` DISABLE KEYS */;
INSERT INTO `alumno_has_curso1` VALUES (2,1,1),(2,2,1),(3,4,3);
/*!40000 ALTER TABLE `alumno_has_curso1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `cod_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ALUMNO_cod_matricula` int NOT NULL,
  PRIMARY KEY (`cod_curso`,`ALUMNO_cod_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'MECANICA',1),(2,'ELECTRICIDAD',1),(3,'PINTURA',2),(4,'REFRIGERACION',3);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(25) NOT NULL,
  `Especialidad` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `id_profesor_UNIQUE` (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'JUAN SOTELO','ELECTRICIDAD',NULL),(2,'ANA STEVIA','ARTE',NULL),(3,'LAURA ESCALANTE','REFRIGERACION',NULL);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor_has_curso`
--

DROP TABLE IF EXISTS `profesor_has_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor_has_curso` (
  `PROFESOR_id_profesor` int NOT NULL,
  `CURSO_cod_curso` int NOT NULL,
  `CURSO_ALUMNO_cod_matricula` int NOT NULL,
  PRIMARY KEY (`PROFESOR_id_profesor`,`CURSO_cod_curso`,`CURSO_ALUMNO_cod_matricula`),
  KEY `fk_PROFESOR_has_CURSO_CURSO1_idx` (`CURSO_cod_curso`,`CURSO_ALUMNO_cod_matricula`),
  KEY `fk_PROFESOR_has_CURSO_PROFESOR1_idx` (`PROFESOR_id_profesor`),
  CONSTRAINT `fk_PROFESOR_has_CURSO_CURSO1` FOREIGN KEY (`CURSO_cod_curso`, `CURSO_ALUMNO_cod_matricula`) REFERENCES `curso` (`cod_curso`, `ALUMNO_cod_matricula`),
  CONSTRAINT `fk_PROFESOR_has_CURSO_PROFESOR1` FOREIGN KEY (`PROFESOR_id_profesor`) REFERENCES `profesor` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor_has_curso`
--

LOCK TABLES `profesor_has_curso` WRITE;
/*!40000 ALTER TABLE `profesor_has_curso` DISABLE KEYS */;
INSERT INTO `profesor_has_curso` VALUES (1,2,1),(2,3,2),(3,4,3);
/*!40000 ALTER TABLE `profesor_has_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 19:55:45
