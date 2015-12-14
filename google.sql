-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: store_locator
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(450) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('1', 'Geoambiente', 'Av. Shishima Hifumi , Urbanova, São José dos Campos - SP', '-23.2002745', '-45.9392451';
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('2', 'CenterVale Shopping', 'Avenida Deputado Benedito Matarazzo, 9403 - Jardim Oswaldo Cruz,São José dos Campos - SP', '-23.1998466', '-45.8833888';
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('3', 'Colinas Shopping', 'Av. São João, 2200 - Jardim das Colinas,São José dos Campos - SP', '-23.2046568', '-45.9106775';
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('4', 'Vale Sul Shopping', 'Av. Andrômeda, 227 - Jardim Satelite,São José dos Campos - SP', '-23.2178127', '-45.8944523';
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('5', 'Esplanada Shopping', 'Av. São João, 644 - Jardim Esplanada,São José dos Campos - SP', '-23.2047223', '-45.9146969';
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('6', 'Colégio Univap - Aquarius', 'Rua Doutor Tertuliano Delphim Júnior, 181 - Jardim Aquarius,São José dos Campos - SP', '-23.2207165', '-45.904694');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('7', 'Faculdade de Direito da Universidade do Vale do Paraíba', 'Praça Rotary, 116 - Centro,São José dos Campos - SP', '-23.2203151', '-46.0343661');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('8', 'Universidade Federal de São Paulo - UNIFESP', 'Rua Sena Madureira, 1500 - Vila Clementino,São José dos Campos - SP', '-23.2155928', '-45.888892');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('9', 'FATEC São José dos Campos - Prof. Jessen Vidal', 'Av. Cesare Monsueto Giulio Lattes, s/n - Eugênio de Melo,São José dos Campos - SP', '-23.1621341', '-45.7974797');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('10', 'FAAP', 'Avenida Jorge Zarur, São José dos Campos - SP', '-23.2103594', '-45.9042265');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('11', 'UNIP São José dos Campos', 'km 157,5,Rod. Pres. Dutra - Jardim Limoeiro,São José dos Campos - SP', '-23.2550908', '-45.9500528');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('12', 'UNITAU', 'RUA EXP ERNESTO PEREIRA,Centro,Taubaté - SP', '-23.0276542', '-45.5649753');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('13', 'Colégio Nossa Senhora de Aparecida', 'Rua Coronel José Monteiro, São José dos Campos - SP', '-23.1821016', '-45.8838996');
INSERT INTO `store_locator`.`markers` (`id`, `name`, `address`, `lat`, `lng`) VALUES ('14', 'ETEP', 'Av. Barão do Rio Branco, 882 - Jardim Esplanada,São José dos Campos - SP', '-23.1991216', '-45.9079626');

/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'store_locator'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-29 15:22:09
