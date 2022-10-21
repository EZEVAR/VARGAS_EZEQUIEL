-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ejercicio3
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Laura','Lordain','Gral. Roca','3764885321'),(2,'Joel','Soto','sucre 120','3751202021'),(3,'Noelia','Serto','25 de mayo 10','3751869531'),(4,'Fabio','Dosantos','jamaica','236531'),(5,'Patricia','Fernandez','debenedeti 1130','3764158956'),(6,'Juan','Lacian',NULL,'3751223569');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_has_reserva`
--

DROP TABLE IF EXISTS `cliente_has_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_has_reserva` (
  `reserva_id_identificacion` int NOT NULL,
  `cliente_idcliente1` int NOT NULL,
  PRIMARY KEY (`reserva_id_identificacion`,`cliente_idcliente1`),
  KEY `fk_cliente_has_reserva_reserva1_idx` (`reserva_id_identificacion`),
  KEY `fk_cliente_has_reserva_cliente1_idx` (`cliente_idcliente1`),
  CONSTRAINT `fk_cliente_has_reserva_cliente1` FOREIGN KEY (`cliente_idcliente1`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_cliente_has_reserva_reserva1` FOREIGN KEY (`reserva_id_identificacion`) REFERENCES `reserva` (`id_identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_has_reserva`
--

LOCK TABLES `cliente_has_reserva` WRITE;
/*!40000 ALTER TABLE `cliente_has_reserva` DISABLE KEYS */;
INSERT INTO `cliente_has_reserva` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `cliente_has_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coche`
--

DROP TABLE IF EXISTS `coche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coche` (
  `idcoche` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `precio_alquiler` varchar(45) NOT NULL,
  `reserva_id_identificacion` int NOT NULL,
  PRIMARY KEY (`idcoche`),
  KEY `fk_coche_reserva1_idx` (`reserva_id_identificacion`),
  CONSTRAINT `fk_coche_reserva1` FOREIGN KEY (`reserva_id_identificacion`) REFERENCES `reserva` (`id_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coche`
--

LOCK TABLES `coche` WRITE;
/*!40000 ALTER TABLE `coche` DISABLE KEYS */;
INSERT INTO `coche` VALUES (1,'ac123hn','palio','azul','fiat','15000',1),(2,'ad142lk','fiesta','blanco','ford','20000',2),(3,'rgt645','gol','blanco','wv','10000',3),(4,'mzr414','siena','gris','fiat','10000',4),(5,'ddl252','polo','gris','wv','10000',5);
/*!40000 ALTER TABLE `coche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_identificacion` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `precio_total` int DEFAULT NULL,
  `cant_comb` varchar(45) NOT NULL,
  PRIMARY KEY (`id_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2022-10-20 00:00:00',NULL,NULL,'20'),(2,'2022-10-20 00:00:00',NULL,NULL,'10'),(3,'2022-10-02 00:00:00',NULL,NULL,'0'),(4,'2022-10-18 00:00:00',NULL,NULL,'0'),(5,'2020-09-10 00:00:00',NULL,NULL,'10'),(6,'2022-10-08 00:00:00',NULL,NULL,'0');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21 19:56:51
