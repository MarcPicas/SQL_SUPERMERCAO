-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `Caixer`
--

DROP TABLE IF EXISTS `Caixer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caixer` (
  `Id_Caixer` int(11) NOT NULL,
  `Nom_Caixer` varchar(15) DEFAULT NULL,
  `Cognom_Caixer` varchar(15) DEFAULT NULL,
  `Ntelf_Caixer` int(11) DEFAULT NULL,
  `DNI_Caixer` char(9) DEFAULT NULL,
  PRIMARY KEY (`Id_Caixer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caixer`
--

LOCK TABLES `Caixer` WRITE;
/*!40000 ALTER TABLE `Caixer` DISABLE KEYS */;
INSERT INTO `Caixer` VALUES (23,'Lluc','Avellan',932541525,'12366677E'),(34,'Pau','Barber',938742595,'11363547X'),(54,'Fran','Catala',932457825,'14366677W'),(123,'Roser','Avellan',934524565,'12366677Z');
/*!40000 ALTER TABLE `Caixer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `DNI_Client` char(10) NOT NULL,
  `Nom_Client` varchar(15) DEFAULT NULL,
  `Cognom_Cli` varchar(15) DEFAULT NULL,
  `Ntelf_Cli` int(11) DEFAULT NULL,
  `Tipus_Client` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DNI_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES ('25366677-S','David','Campos',934152545,'Preferent');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compra`
--

DROP TABLE IF EXISTS `Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compra` (
  `Id_Compra` int(20) NOT NULL,
  `DNI_Client` char(10) DEFAULT NULL,
  `Data_Compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Id_Caixer` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Compra`),
  KEY `DNI_Client` (`DNI_Client`),
  KEY `Id_Caixer` (`Id_Caixer`),
  CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`DNI_Client`) REFERENCES `Clients` (`DNI_Client`),
  CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`Id_Caixer`) REFERENCES `Caixer` (`Id_Caixer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compra`
--

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;
INSERT INTO `Compra` VALUES (34,'25366677-S','2008-12-12 13:45:00',123),(35,'25366677-S','2008-12-12 13:50:00',54);
/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Linia_Compra`
--

DROP TABLE IF EXISTS `Linia_Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Linia_Compra` (
  `Id_Compra` int(20) DEFAULT NULL,
  `Id_Linia` int(11) NOT NULL,
  `Id_Producte` int(11) DEFAULT NULL,
  `Unitats_Compra` int(11) DEFAULT NULL,
  `Total_Linia` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Linia`),
  KEY `Id_Compra` (`Id_Compra`),
  CONSTRAINT `Linia_Compra_ibfk_1` FOREIGN KEY (`Id_Compra`) REFERENCES `Compra` (`Id_Compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Linia_Compra`
--

LOCK TABLES `Linia_Compra` WRITE;
/*!40000 ALTER TABLE `Linia_Compra` DISABLE KEYS */;
INSERT INTO `Linia_Compra` VALUES (34,1,2,2,NULL),(34,2,3,1,NULL),(35,3,4,2,NULL);
/*!40000 ALTER TABLE `Linia_Compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-30 20:45:51
