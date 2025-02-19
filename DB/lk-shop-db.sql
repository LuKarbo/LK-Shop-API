-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lk-shop-db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Acción'),(2,'Aventura'),(3,'RPG'),(4,'Deportes'),(5,'Carreras'),(6,'Simulación'),(7,'Estrategia'),(8,'Shooter'),(9,'Puzzle'),(10,'Luca'),(11,'Música'),(12,'Sandbox'),(13,'Horror'),(14,'Multijugador'),(15,'MOBA');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_code`
--

DROP TABLE IF EXISTS `discount_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_code` (
  `id_discount_code` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `id_discount_status` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_finalizacion` datetime NOT NULL,
  `procentaje` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_discount_code`),
  KEY `fk_discount_code_discount_status1_idx` (`id_discount_status`),
  CONSTRAINT `fk_discount_code_discount_status1` FOREIGN KEY (`id_discount_status`) REFERENCES `discount_status` (`id_discount_status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_code`
--

LOCK TABLES `discount_code` WRITE;
/*!40000 ALTER TABLE `discount_code` DISABLE KEYS */;
INSERT INTO `discount_code` VALUES (1,'NEWCODE2024',2,'2024-07-01 00:00:00','2024-09-30 23:59:59',25.00),(2,'BIENV3N1D0',2,'2024-11-21 15:30:00','2024-11-21 18:30:00',15.00),(3,'H3LL0W',2,'2024-11-21 15:30:00','2024-11-21 15:30:00',23.00),(4,'TEST',2,'2024-11-21 15:30:00','2024-11-21 15:30:00',80.00),(5,'SUMMER2024',2,'2024-06-01 00:00:00','2024-08-31 23:59:59',20.00),(6,'VERANO2024MOD',2,'2024-12-03 16:52:47','2024-12-11 00:00:00',20.00),(7,'taste',1,'2024-12-04 16:24:54','2024-12-26 00:00:00',68.00),(8,'asdasd',2,'2024-12-03 16:48:34','2024-12-04 00:00:00',23.00),(9,'holi',2,'2024-12-03 17:26:44','2024-12-05 00:00:00',23.00),(10,'djkhgslkjhglkjdfg',2,'2024-12-03 17:50:11','2024-12-05 00:00:00',3.00),(11,'ASD',1,'2024-12-12 17:39:48','2025-01-04 00:00:00',29.00);
/*!40000 ALTER TABLE `discount_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_status`
--

DROP TABLE IF EXISTS `discount_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_status` (
  `id_discount_status` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_discount_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_status`
--

LOCK TABLES `discount_status` WRITE;
/*!40000 ALTER TABLE `discount_status` DISABLE KEYS */;
INSERT INTO `discount_status` VALUES (1,'Activo'),(2,'Caducado');
/*!40000 ALTER TABLE `discount_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editor` (
  `id_editor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_editor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
INSERT INTO `editor` VALUES (1,'Electronic Arts'),(2,'Activision\n'),(3,'Ubisoft'),(4,'Square Enix'),(5,'Bethesda'),(6,'Nintendo'),(7,'Sony Interactive Entertainment'),(8,'Rockstar Games'),(9,'Blizzard Entertainment'),(10,'Take-Two Interactive'),(11,'CD Projekt Red');
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `id_favorite` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL,
  PRIMARY KEY (`id_favorite`),
  KEY `fk_favorite_user1_idx` (`id_user`),
  KEY `fk_favorite_game1_idx` (`id_game`),
  CONSTRAINT `fk_favorite_game1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  CONSTRAINT `fk_favorite_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (4,4,1),(5,4,4),(20,6,5),(21,6,3),(22,6,7),(24,6,2),(26,6,4),(27,7,1),(28,7,3),(30,9,2),(31,9,4),(33,10,3),(34,10,1),(35,8,3),(36,8,1);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id_game` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `gameBanner` varchar(1000) DEFAULT NULL,
  `fecha_lanzamiento` date NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `descuento` tinyint NOT NULL,
  `puntaje` decimal(3,1) DEFAULT NULL,
  `id_editor` int NOT NULL,
  `copias_disponibles` int NOT NULL,
  `copias_cantidad` int NOT NULL,
  PRIMARY KEY (`id_game`),
  KEY `fk_game_editor1_idx` (`id_editor`),
  CONSTRAINT `fk_game_editor1` FOREIGN KEY (`id_editor`) REFERENCES `editor` (`id_editor`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Grand Theft Auto V','Un juego de mundo abierto donde los jugadores asumen tres personajes distintos, explorando la ciudad ficticia de Los Santos mientras participan en una serie de misiones que involucran crimen, persecuciones y acción sin restricciones.','https://image.api.playstation.com/vulcan/ap/rnd/202101/2019/cyLyyBLlQoIVqNFh3ofR4qkP.jpg','2013-09-17',50.00,11,8.6,8,127,10000),(2,'The Witcher 3: Wild Hunt','Un RPG de acción en un mundo abierto, donde los jugadores controlan a Geralt de Rivia, un cazador de monstruos, mientras exploran un vasto mundo lleno de magia, intrigas políticas y criaturas fantásticas.','https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/292030/capsule_616x353.jpg?t=1730212926.jpg','2015-05-19',45.00,1,9.0,11,123,5000),(3,'Call of Duty: Warzone','Un juego gratuito de batalla real dentro del universo de Call of Duty, donde los jugadores compiten en un mapa grande para ser el último en pie. Presenta mecánicas de disparos de alta calidad y opciones para jugar en solitario, dúos o equipos.','https://media.tycsports.com/files/2023/02/13/534192/call-of-duty-warzone-2_1440x810_wmk.webp','2020-03-10',0.00,0,8.2,2,126,10000),(4,'Super Mario Odyssey','Un juego de plataformas en 3D protagonizado por Mario, quien viaja por diversos mundos para rescatar a la Princesa Peach. La mecánica central es la habilidad de Mario para poseer objetos y enemigos usando su sombrero, Cappy.','https://imagenes.20minutos.es/files/image_1920_1080/uploads/imagenes/2018/02/26/646050.jpg','2017-10-27',45.00,0,8.1,6,126,2500),(5,'FIFA 23','La última entrega de la serie FIFA, un simulador de fútbol que ofrece modos de juego como Ultimate Team, Carreer Mode y el modo multijugador en línea, con mejoras en la jugabilidad y gráficos que reflejan la última temporada de fútbol mundial.','https://www.esportmaniacos.com/wp-content/uploads/2022/06/fifa-23-780x470.jpg','2022-09-30',60.00,0,7.3,1,125,2500),(7,'The Legend of Zelda: TOTK','La épica aventura de Link en los cielos de Hyrule','https://assets.nintendo.com/image/upload/w_920,f_auto,q_auto/v1681238674/Microsites/zelda-tears-of-the-kingdom/videos/posters/totk_microsite_officialtrailer3_1304xj47am.jpg','2023-05-12',54.99,9,9.9,1,83,100),(10,'test','test',NULL,'0000-00-00',68.00,7,0.0,5,126,10000),(11,'test 2','asdad',NULL,'2024-12-19',0.00,0,2.0,1,127,2000),(13,'asdasd','asdasd','https://www.shutterstock.com/shutterstock/photos/1836724762/display_1500/stock-vector-collage-of-user-interface-elements-glitched-window-with-picture-of-the-great-wave-in-vaporwave-pop-1836724762.jpg','2024-12-19',10.00,7,2.0,2,10000,10000);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `groupbanner` varchar(600) DEFAULT NULL,
  `id_owner` int NOT NULL,
  PRIMARY KEY (`id_group`),
  KEY `fk_group_user1_idx` (`id_owner`),
  CONSTRAINT `fk_group_user1` FOREIGN KEY (`id_owner`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (2,'RPG Enthusiasts','A gathering place for role-playing game enthusiasts to discuss their favorite RPG titles','/images/group2_banner.jpg',2),(9,'Grupo Juan','Amantes de juan','https://i.kym-cdn.com/entries/icons/original/000/035/644/juancover.jpg',6),(16,'test','asdasd56464','',6),(18,'asd','asd','https://www.shutterstock.com/shutterstock/photos/1836724762/display_1500/stock-vector-collage-of-user-interface-elements-glitched-window-with-picture-of-the-great-wave-in-vaporwave-pop-1836724762.jpg',10),(20,'TEst','asdasda','',8);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `id_library` int NOT NULL AUTO_INCREMENT,
  `resenia` tinyint DEFAULT NULL,
  `puntaje` tinyint DEFAULT NULL,
  `procentaje_completado` decimal(4,1) NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_library`),
  KEY `fk_library_user1_idx` (`id_user`),
  CONSTRAINT `fk_library_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (2,1,9,90.2,4),(3,NULL,NULL,0.0,6),(4,NULL,NULL,0.0,7),(5,1,3,0.0,8),(6,NULL,NULL,0.0,9),(7,1,5,0.0,10);
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id_permissions` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_permissions`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'User'),(2,'Support'),(3,'Admin');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `id_purchase` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL,
  `fecha` datetime NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_purchase`),
  KEY `fk_purchase_user1_idx` (`id_user`),
  KEY `fk_purchase_game1_idx` (`id_game`),
  CONSTRAINT `fk_purchase_game1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  CONSTRAINT `fk_purchase_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (3,4,2,'2024-03-10 14:20:00',45.00),(4,4,4,'2024-04-05 11:15:00',45.00),(8,6,5,'2024-11-27 13:36:50',60.00),(9,6,4,'2024-11-27 13:39:16',45.00),(10,7,5,'2024-11-29 12:05:00',60.00),(11,7,2,'2024-11-29 12:08:35',45.00),(12,6,3,'2024-11-29 12:51:05',0.00),(13,6,7,'2024-11-30 11:19:18',54.99),(15,9,2,'2024-11-30 14:34:02',45.00),(16,8,2,'2024-12-01 11:04:19',45.00),(17,8,5,'2024-12-01 11:04:45',60.00),(18,8,7,'2024-12-03 12:04:10',54.99),(20,10,5,'2024-12-12 14:23:01',60.00);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_status`
--

DROP TABLE IF EXISTS `query_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_status` (
  `id_query_status` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`id_query_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_status`
--

LOCK TABLES `query_status` WRITE;
/*!40000 ALTER TABLE `query_status` DISABLE KEYS */;
INSERT INTO `query_status` VALUES (1,'En Espera','Su Consulta se encuentra en cola de espera para ser respondida por nuestros soportes'),(2,'Respondida','Su consulta a sido respondida'),(3,'Rechazada','Su consulta fue rechazada');
/*!40000 ALTER TABLE `query_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_game_category`
--

DROP TABLE IF EXISTS `r_game_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_game_category` (
  `id_r_game_category` int NOT NULL AUTO_INCREMENT,
  `id_game` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_r_game_category`),
  KEY `fk_r_game_category_game1_idx` (`id_game`),
  KEY `fk_r_game_category_category1_idx` (`id_category`),
  CONSTRAINT `fk_r_game_category_category1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`),
  CONSTRAINT `fk_r_game_category_game1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_game_category`
--

LOCK TABLES `r_game_category` WRITE;
/*!40000 ALTER TABLE `r_game_category` DISABLE KEYS */;
INSERT INTO `r_game_category` VALUES (21,10,2),(22,10,1),(33,11,8),(34,11,9),(41,13,2),(42,3,1),(43,3,8),(44,3,14),(45,5,4),(46,5,14),(50,1,1),(51,1,2),(52,1,12),(53,4,2),(54,4,12),(55,7,1),(56,7,2),(57,7,3),(58,7,11),(59,2,1),(60,2,2),(61,2,3);
/*!40000 ALTER TABLE `r_game_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_group_category`
--

DROP TABLE IF EXISTS `r_group_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_group_category` (
  `id_r_group_category` int NOT NULL AUTO_INCREMENT,
  `id_group` int NOT NULL,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_r_group_category`),
  KEY `fk_r_group_category_group1_idx` (`id_group`),
  KEY `fk_r_group_category_category1_idx` (`id_category`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_group_category`
--

LOCK TABLES `r_group_category` WRITE;
/*!40000 ALTER TABLE `r_group_category` DISABLE KEYS */;
INSERT INTO `r_group_category` VALUES (1,1,1),(2,1,14),(3,2,3),(4,1,1),(5,1,14),(6,2,3),(7,14,2),(8,14,1),(9,14,5),(10,15,4),(11,15,2),(12,15,6),(20,16,2),(19,16,7),(18,16,3),(16,17,2),(17,17,5),(21,16,6),(23,18,4),(24,18,5);
/*!40000 ALTER TABLE `r_group_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_library_game`
--

DROP TABLE IF EXISTS `r_library_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_library_game` (
  `id_r_library_game` int NOT NULL AUTO_INCREMENT,
  `id_game` int NOT NULL,
  `id_library` int NOT NULL,
  `fecha_adquirido` date NOT NULL,
  `horas_jugadas` int DEFAULT NULL,
  PRIMARY KEY (`id_r_library_game`),
  KEY `fk_copy_game_game1_idx` (`id_game`),
  KEY `fk_copy_game_library1_idx` (`id_library`),
  CONSTRAINT `fk_copy_game_game1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  CONSTRAINT `fk_copy_game_library1` FOREIGN KEY (`id_library`) REFERENCES `library` (`id_library`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_library_game`
--

LOCK TABLES `r_library_game` WRITE;
/*!40000 ALTER TABLE `r_library_game` DISABLE KEYS */;
INSERT INTO `r_library_game` VALUES (3,2,2,'2024-03-10',40),(4,4,2,'2024-04-05',20),(8,5,3,'2024-11-27',NULL),(9,4,3,'2024-11-27',NULL),(10,5,4,'2024-11-29',NULL),(11,2,4,'2024-11-29',NULL),(12,3,3,'2024-11-29',NULL),(13,7,3,'2024-11-30',NULL),(15,2,6,'2024-11-30',NULL),(16,2,5,'2024-12-01',NULL),(17,5,5,'2024-12-01',NULL),(18,7,5,'2024-12-03',NULL),(20,5,7,'2024-12-12',NULL);
/*!40000 ALTER TABLE `r_library_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_user_group`
--

DROP TABLE IF EXISTS `r_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_user_group` (
  `id_r_user_group` int NOT NULL AUTO_INCREMENT,
  `id_group` int NOT NULL,
  `id_user` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_r_user_group`),
  KEY `fk_r_user_group_group1_idx` (`id_group`),
  KEY `fk_r_user_group_user1_idx` (`id_user`),
  KEY `fk_r_user_group_rol1_idx` (`id_rol`),
  CONSTRAINT `fk_r_user_group_group1` FOREIGN KEY (`id_group`) REFERENCES `group` (`id_group`),
  CONSTRAINT `fk_r_user_group_rol1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `fk_r_user_group_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_user_group`
--

LOCK TABLES `r_user_group` WRITE;
/*!40000 ALTER TABLE `r_user_group` DISABLE KEYS */;
INSERT INTO `r_user_group` VALUES (3,2,2,'2024-03-10',1),(20,9,6,'2024-11-28',1),(27,16,6,'2024-11-29',1),(28,16,7,'2024-11-29',3),(35,16,8,'2024-11-29',3),(36,2,6,'2024-11-29',3),(37,2,8,'2024-11-29',3),(38,16,9,'2024-11-30',3),(40,9,10,'2024-12-12',3),(41,16,10,'2024-12-12',3),(42,18,10,'2024-12-12',1),(46,20,8,'2024-12-13',1);
/*!40000 ALTER TABLE `r_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_user_msg_group`
--

DROP TABLE IF EXISTS `r_user_msg_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r_user_msg_group` (
  `id_r_user_msg_group` int NOT NULL AUTO_INCREMENT,
  `id_group` int NOT NULL,
  `id_user` int NOT NULL,
  `mensaje` varchar(1000) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_r_user_msg_group`),
  KEY `fk_r_user_msg_group_group1_idx` (`id_group`),
  KEY `fk_r_user_msg_group_user1_idx` (`id_user`),
  CONSTRAINT `fk_r_user_msg_group_group1` FOREIGN KEY (`id_group`) REFERENCES `group` (`id_group`),
  CONSTRAINT `fk_r_user_msg_group_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_user_msg_group`
--

LOCK TABLES `r_user_msg_group` WRITE;
/*!40000 ALTER TABLE `r_user_msg_group` DISABLE KEYS */;
INSERT INTO `r_user_msg_group` VALUES (3,2,2,'RPG discussion starts here!','2024-03-10 19:45:00'),(5,2,2,'¡Hola a todos!','2024-11-23 13:53:45'),(6,16,8,'Hola!','2024-11-29 18:51:27'),(7,16,8,'como estas','2024-11-29 18:55:04'),(8,16,8,'asda','2024-11-29 18:59:21'),(9,2,8,'hola','2024-11-29 19:00:15'),(10,16,8,'asd','2024-11-29 19:00:49'),(11,2,8,'asd','2024-11-29 19:00:53'),(12,16,8,'ajjajaja','2024-11-29 19:08:31'),(13,16,6,'Que onda','2024-11-29 19:10:30'),(14,9,6,'Buenas!','2024-11-29 19:20:54'),(15,2,6,'que onda','2024-11-29 19:24:16'),(16,16,8,'asdasda','2024-11-30 11:52:04'),(17,16,8,'asda','2024-11-30 11:52:05'),(18,16,9,'tvrfrgyr]\\','2024-11-30 14:38:38'),(19,16,10,'Hola','2024-12-12 14:30:33'),(20,9,10,'beunas','2024-12-12 14:30:36'),(21,18,10,'bienvenidos','2024-12-12 14:31:07'),(22,20,8,'Hola','2024-12-13 15:41:35');
/*!40000 ALTER TABLE `r_user_msg_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_game` int NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha` datetime NOT NULL,
  `puntaje` int DEFAULT NULL,
  PRIMARY KEY (`id_review`),
  KEY `fk_review_user1_idx` (`id_user`),
  KEY `fk_review_game1_idx` (`id_game`),
  CONSTRAINT `fk_review_game1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`),
  CONSTRAINT `fk_review_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (3,4,2,'Una historia épica con gráficos impresionantes','2024-03-10 19:45:00',9),(4,4,4,'Mario Odyssey, un clásico moderno de plataformas','2024-04-05 16:30:00',8),(7,8,5,'test','2024-12-01 10:59:53',2),(8,8,7,'asdasd','2024-12-04 14:18:13',3),(9,10,5,'asda','2024-12-12 14:28:05',5);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Owner'),(2,'Mod'),(3,'User');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Offline'),(2,'Online'),(3,'Banned');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(600) NOT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `profileIMG` varchar(1000) DEFAULT NULL,
  `profileBanner` varchar(1000) DEFAULT NULL,
  `id_status` int NOT NULL,
  `id_permissions` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  KEY `fk_user_status_idx` (`id_status`),
  KEY `fk_user_permissions1_idx` (`id_permissions`),
  CONSTRAINT `fk_user_permissions1` FOREIGN KEY (`id_permissions`) REFERENCES `permissions` (`id_permissions`),
  CONSTRAINT `fk_user_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Support1','support1@lk-devs.com','support2024',NULL,NULL,NULL,1,1,'2024-11-29 15:43:37'),(3,'Admin24','admin1@lk-devs.com','admin2024',NULL,NULL,NULL,1,3,'2024-11-29 15:43:37'),(4,'Juan Pérez Actualizado 22 2','juan.nuevo@ejemplo.com','123',NULL,'/uploads/profiles/juan.jpg','/uploads/banners/juan-banner.jpg',3,2,'2024-11-29 15:43:37'),(5,'New Name','newemail@example.com','password123',NULL,'/path/to/new/avatar.jpg','',3,1,'2024-11-29 15:43:37'),(6,'Juan Pérez','juan.perez@example.com','$2b$10$Y4zIguB.x20OOzKWzLKrSuXMB7F91Zu30j0QucVWBEOCg/XafebhC','test 22','https://img.freepik.com/foto-gratis/ilustracion-fondo-abstracto-formas-diseno-multicolor-generadas-ia_188544-15582.jpg','https://www.shutterstock.com/image-illustration/david-street-style-graphic-designtextile-600nw-2265632523.jpg',2,1,'2024-11-29 15:43:37'),(7,'Pepe','pepe@gmail.com','$2b$10$bPoXWHL00Q6wS1NoHO54tOffjQzGsk0M0HbjyfyPHfpdZn5TjWVpe',NULL,'','',2,1,'2024-11-29 15:43:37'),(8,'Lucas','Admin@lkdevs.com.ar','$2b$10$Ei273IipFEKksYck2AawJ.sPoTfwVLQqpeHTTvkYj/2enRBGuru0S','','https://img.freepik.com/foto-gratis/ilustracion-fondo-abstracto-formas-diseno-multicolor-generadas-ia_188544-15582.jpg','https://img.freepik.com/foto-gratis/ilustracion-fondo-abstracto-formas-diseno-multicolor-generadas-ia_188544-15582.jpg',1,3,'2024-11-29 21:18:38'),(9,'34t35]','juan.perez1@example.com','$2b$10$0.GqyxtzBJ9jKMzq9AQaJuaGyirOZ1F43XoZcig1E9NO7Q416g.zW','ghnghmjntjmu','https://media.pilaradiario.com/p/2add261b19f3ec8d54e17e0b811b7d26/adjuntos/352/imagenes/100/117/0100117045/790x0/smart/autos-colapintojpg.jpg','https://media.pilaradiario.com/p/2add261b19f3ec8d54e17e0b811b7d26/adjuntos/352/imagenes/100/117/0100117045/790x0/smart/autos-colapintojpg.jpg',2,1,'2024-11-30 17:33:27'),(10,'Test 23','cliente@gmail.com','$2b$10$BhtLSAcsNCF3fUPDo5g6heVPJIb5EIVA8YVU5TjQZaj5V7IHDeHgm','Soy nuevo','https://www.shutterstock.com/shutterstock/photos/2131372891/display_1500/stock-vector-glitch-art-vector-face-glitched-rgb-color-mode-circle-halftone-patter-illustration-from-d-2131372891.jpg','https://www.shutterstock.com/shutterstock/photos/1836724762/display_1500/stock-vector-collage-of-user-interface-elements-glitched-window-with-picture-of-the-great-wave-in-vaporwave-pop-1836724762.jpg',1,1,'2024-12-12 17:20:04'),(12,'Julio','baneado@gmail.com','$2b$10$Th19dZhtN.NDOBQjJosUO.6pwmiupCgiqPuSkSuGhVEuTlOVkVyFu','','','',3,1,'2024-12-12 17:50:45'),(13,'Soporte','soporte@lk-devs.com.ar','$2b$10$Qwim0jQ5mmM9XCBYQ.6b7OUp1detJ9lCEA./ZxVg678OQb6oNiP4O','','','',2,2,'2024-12-14 13:14:24');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_query`
--

DROP TABLE IF EXISTS `user_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_query` (
  `id_user_query` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_admin_response` int DEFAULT NULL,
  `titulo` varchar(250) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `respuesta` varchar(1000) DEFAULT NULL,
  `fecha_respuesta` datetime DEFAULT NULL,
  `id_query_status` int NOT NULL,
  PRIMARY KEY (`id_user_query`),
  KEY `fk_user_query_user1_idx` (`id_user`),
  KEY `fk_user_query_user2_idx` (`id_admin_response`),
  KEY `fk_user_query_query_status1_idx` (`id_query_status`),
  CONSTRAINT `fk_user_query_query_status1` FOREIGN KEY (`id_query_status`) REFERENCES `query_status` (`id_query_status`),
  CONSTRAINT `fk_user_query_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `fk_user_query_user2` FOREIGN KEY (`id_admin_response`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_query`
--

LOCK TABLES `user_query` WRITE;
/*!40000 ALTER TABLE `user_query` DISABLE KEYS */;
INSERT INTO `user_query` VALUES (2,4,3,'Account Access','I cannot login to my account','2024-02-20 14:45:00','Please reset your password','2024-02-21 09:30:00',2),(6,4,3,'Problema con mi pedido','No he recibido mi pedido #12345','2024-11-23 13:03:42','Hemos verificado su pedido y será entregado mañana.','2024-11-23 13:05:20',2),(7,6,NULL,'Consulta Duda 1','asdasdasdasd','2024-11-29 12:23:46',NULL,NULL,1),(8,8,NULL,'POrueba de test','testeo','2024-11-30 11:41:12',NULL,NULL,1),(9,6,NULL,'test','testewetetet','2024-11-30 11:53:25',NULL,NULL,1),(10,6,NULL,'asd','asdasdasd','2024-11-30 11:53:28',NULL,NULL,1),(11,6,NULL,'test','test','2024-11-30 12:06:35',NULL,NULL,1),(12,6,8,'etetet','etetete','2024-11-30 12:06:37','asd','2024-12-08 14:39:50',2),(13,6,NULL,'sdfsdfsdf','sdfsdfsfd','2024-11-30 12:06:39',NULL,NULL,1),(14,6,8,'456754','sdfhb5664','2024-11-30 12:06:42','asd','2024-12-08 14:39:48',2),(15,9,13,'asdfgdsf','dfsadf','2024-11-30 14:38:54','asd','2024-12-14 10:21:31',2),(16,8,8,'test','test','2024-12-08 14:06:01','test 222','2024-12-08 14:36:04',2),(17,10,8,'duda','duda','2024-12-12 14:28:17','oka\n','2024-12-12 14:32:41',2);
/*!40000 ALTER TABLE `user_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lk-shop-db'
--

--
-- Dumping routines for database 'lk-shop-db'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddGameToFavorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGameToFavorites`(
    IN p_user_id INT, 
    IN p_game_id INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM favorite 
        WHERE id_user = p_user_id AND id_game = p_game_id
    ) THEN
        INSERT INTO favorite (id_user, id_game)
        VALUES (p_user_id, p_game_id);
        
        SELECT 'Game added to favorites successfully' AS result;
    ELSE
        SELECT 'Game is already in favorites' AS result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdminEditUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminEditUser`(
    IN p_id_user INT,
    IN p_nombre VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_id_permissions INT,
    IN p_id_status INT
)
BEGIN
    UPDATE `user`
    SET 
        nombre = COALESCE(p_nombre, nombre),
        email = COALESCE(p_email, email),
        id_permissions = COALESCE(p_id_permissions, id_permissions),
        id_status = COALESCE(p_id_status, id_status)
    WHERE id_user = p_id_user;
    
    SELECT ROW_COUNT() AS rows_affected;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateDiscountCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateDiscountCode`(
    IN p_codigo VARCHAR(45),
    IN p_id_discount_status INT,
    IN p_fecha_creacion DATETIME,
    IN p_fecha_finalizacion DATETIME,
    IN p_procentaje DECIMAL(4,2)
)
BEGIN

    IF EXISTS (SELECT 1 FROM discount_code WHERE codigo = p_codigo) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Discount code already exists';
    END IF;

    IF p_procentaje < 0 OR p_procentaje > 100 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Discount percentage must be between 0 and 100';
    END IF;

    IF p_fecha_creacion > p_fecha_finalizacion THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Creation date must be before finalization date';
    END IF;

    INSERT INTO discount_code (
        codigo, 
        id_discount_status, 
        fecha_creacion, 
        fecha_finalizacion, 
        procentaje
    ) VALUES (
        p_codigo, 
        p_id_discount_status, 
        p_fecha_creacion, 
        p_fecha_finalizacion, 
        p_procentaje
    );

    SELECT LAST_INSERT_ID() AS new_discount_code_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGroup`(
    IN p_nombre VARCHAR(45), 
    IN p_descripcion VARCHAR(1000),
    IN p_groupbanner VARCHAR(600), 
    IN p_id_owner INT,
    IN p_categories VARCHAR(255)
)
BEGIN
    DECLARE v_group_id INT;
    DECLARE v_category_id INT;
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_category_cursor CURSOR FOR 
        SELECT CAST(TRIM(category_id) AS UNSIGNED) 
        FROM (
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(p_categories, ',', numbers.n), ',', -1) category_id
            FROM (
                SELECT 1 + units.i + tens.i * 10 n
                FROM 
                    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units,
                    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) tens
                ORDER BY n
            ) numbers
            WHERE n <= 1 + (LENGTH(p_categories) - LENGTH(REPLACE(p_categories, ',', '')))
        ) categories
    WHERE category_id != '';
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    INSERT INTO `lk-shop-db`.`group` 
    (nombre, descripcion, groupbanner, id_owner) 
    VALUES 
    (p_nombre, p_descripcion, p_groupbanner, p_id_owner);
    
    SET v_group_id = LAST_INSERT_ID();
    
    INSERT INTO `lk-shop-db`.`r_user_group` 
    (id_group, id_user, fecha_ingreso, id_rol) 
    VALUES 
    (v_group_id, p_id_owner, CURRENT_DATE(), 1);
    
    OPEN v_category_cursor;
    category_loop: LOOP
        FETCH v_category_cursor INTO v_category_id;
        IF v_done THEN
            LEAVE category_loop;
        END IF;
        
        INSERT INTO `lk-shop-db`.`r_group_category` 
        (id_group, id_category) 
        VALUES 
        (v_group_id, v_category_id);
    END LOOP;
    CLOSE v_category_cursor;
    
    SELECT v_group_id AS new_group_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewGame`(
    IN game_name VARCHAR(45),
    IN game_description VARCHAR(1000),
    IN game_banner VARCHAR(1000),
    IN release_date DATE,
    IN original_price DECIMAL(5,2),
    IN discount_id INT,
    IN score DECIMAL(3,1),
    IN editor_id INT,
    IN copies_available INT,
    IN total_copies INT,
    IN category_ids VARCHAR(255) 
)
BEGIN
    DECLARE new_game_id INT;

    INSERT INTO game (
        nombre, descripcion, gameBanner, fecha_lanzamiento,
        precio, descuento, puntaje, id_editor,
        copias_disponibles, copias_cantidad
    )
    VALUES (
        game_name, game_description, game_banner, release_date,
        original_price, discount_id, score, editor_id,
        copies_available, total_copies
    );

    SET new_game_id = LAST_INSERT_ID();

    WHILE LOCATE(',', category_ids) > 0 DO
        INSERT INTO r_game_category (id_game, id_category)
        VALUES (new_game_id, CAST(SUBSTRING_INDEX(category_ids, ',', 1) AS UNSIGNED));

        SET category_ids = SUBSTRING(category_ids, LOCATE(',', category_ids) + 1);
    END WHILE;

    IF category_ids != '' THEN
        INSERT INTO r_game_category (id_game, id_category)
        VALUES (new_game_id, CAST(category_ids AS UNSIGNED));
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateReviewAndUpdateLibrary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateReviewAndUpdateLibrary`(
    IN p_user_id INT, 
    IN p_game_id INT, 
    IN p_review_content VARCHAR(1000),
    IN p_review_score INT
)
BEGIN
    DECLARE v_library_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    INSERT INTO review (id_user, id_game, contenido, fecha, puntaje)
    VALUES (p_user_id, p_game_id, p_review_content, NOW(), p_review_score);

    SELECT id_library INTO v_library_id
    FROM library 
    WHERE id_user = p_user_id;

    UPDATE library 
    SET resenia = 1, puntaje = p_review_score
    WHERE id_library = v_library_id;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(
    IN p_nombre VARCHAR(100), 
    IN p_email VARCHAR(100), 
    IN p_pass VARCHAR(600)
)
BEGIN
    DECLARE user_count INT;
    
    SELECT COUNT(*) INTO user_count 
    FROM `lk-shop-db`.`user` 
    WHERE email = p_email;
    
    IF user_count > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Ya existe una cuenta con ese email.';
    ELSE

        INSERT INTO `lk-shop-db`.`user` 
        (`nombre`, `email`, `password`, `bio`, `profileIMG`, `profileBanner`, `id_status`, `id_permissions`, `created_at`) 
        VALUES 
        (p_nombre, p_email, p_pass, '', '', '', 2, 1, NOW());
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUserQuery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUserQuery`(
    IN p_user_id INT,
    IN p_titulo VARCHAR(250),
    IN p_contenido VARCHAR(1000)
)
BEGIN
    INSERT INTO `lk-shop-db`.`user_query` (
        `id_user`, 
        `titulo`, 
        `contenido`, 
        `fecha_creacion`, 
        `id_query_status`
    ) VALUES (
        p_user_id,
        p_titulo,
        p_contenido,
        NOW(),
        1
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame`(
    IN p_id_game INT
)
BEGIN

    DECLARE game_exists INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el juego y sus registros relacionados';
    END;
    
    SELECT COUNT(*) INTO game_exists FROM game WHERE id_game = p_id_game;
    
    IF game_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El juego no existe';
    ELSE
        START TRANSACTION;
        
        DELETE FROM r_library_game WHERE id_game = p_id_game;
        DELETE FROM r_game_category WHERE id_game = p_id_game;
        DELETE FROM favorite WHERE id_game = p_id_game;
        DELETE FROM review WHERE id_game = p_id_game;
        DELETE FROM purchase WHERE id_game = p_id_game;
        
        DELETE FROM game WHERE id_game = p_id_game;
        
        COMMIT;
        
        SELECT 'Juego y registros relacionados eliminados exitosamente' AS result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGroup`(IN group_id_param INT)
BEGIN

    START TRANSACTION;
    
    DELETE FROM r_user_msg_group 
    WHERE id_group = group_id_param;
    
    DELETE FROM r_user_group 
    WHERE id_group = group_id_param;
    
    DELETE FROM `group` 
    WHERE id_group = group_id_param;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(IN user_id_param INT)
BEGIN

    SET FOREIGN_KEY_CHECKS = 0;

    DELETE FROM review WHERE id_user = user_id_param;

    DELETE FROM purchase WHERE id_user = user_id_param;

    DELETE FROM favorite WHERE id_user = user_id_param;

    DELETE FROM r_library_game 
    WHERE id_library IN (SELECT id_library FROM library WHERE id_user = user_id_param);
    
    DELETE FROM library WHERE id_user = user_id_param;

    DELETE FROM r_user_msg_group WHERE id_user = user_id_param;

    DELETE FROM r_user_group WHERE id_user = user_id_param;

    DELETE FROM r_group_category 
    WHERE id_group IN (SELECT id_group FROM `group` WHERE id_owner = user_id_param);
    
    DELETE FROM r_user_msg_group 
    WHERE id_group IN (SELECT id_group FROM `group` WHERE id_owner = user_id_param);
    
    DELETE FROM r_user_group 
    WHERE id_group IN (SELECT id_group FROM `group` WHERE id_owner = user_id_param);
    
    DELETE FROM `group` WHERE id_owner = user_id_param;

    DELETE FROM user_query WHERE id_user = user_id_param;

    DELETE FROM user WHERE id_user = user_id_param;

    SET FOREIGN_KEY_CHECKS = 1;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditDiscountCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditDiscountCode`(
    IN p_id_discount_code INT,
    IN p_codigo VARCHAR(45),
    IN p_id_discount_status INT,
    IN p_fecha_creacion DATETIME,
    IN p_fecha_finalizacion DATETIME,
    IN p_procentaje DECIMAL(4,2)
)
BEGIN

    IF NOT EXISTS (SELECT 1 FROM discount_code WHERE id_discount_code = p_id_discount_code) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Discount code not found';
    END IF;

    IF EXISTS (
        SELECT 1 FROM discount_code 
        WHERE codigo = p_codigo AND id_discount_code != p_id_discount_code
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Discount code already exists';
    END IF;

    IF p_procentaje < 0 OR p_procentaje > 100 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Discount percentage must be between 0 and 100';
    END IF;

    IF p_fecha_creacion > p_fecha_finalizacion THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Creation date must be before finalization date';
    END IF;

    UPDATE discount_code
    SET 
        codigo = p_codigo,
        id_discount_status = p_id_discount_status,
        fecha_creacion = p_fecha_creacion,
        fecha_finalizacion = p_fecha_finalizacion,
        procentaje = p_procentaje
    WHERE id_discount_code = p_id_discount_code;

    SELECT ROW_COUNT() AS rows_affected;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditGame`(
    IN p_id_game INT,
    IN game_name VARCHAR(45),
    IN game_description VARCHAR(1000),
    IN game_banner VARCHAR(1000),
    IN release_date DATE,
    IN original_price DECIMAL(5,2),
    IN discount_id TINYINT,
    IN score DECIMAL(3,1),
    IN editor_id INT,
    IN copies_available INT,
    IN total_copies INT,
    IN category_ids VARCHAR(255)
)
BEGIN
    DECLARE game_exists INT;
    
    SELECT COUNT(*) INTO game_exists FROM game WHERE id_game = p_id_game;
    
    IF game_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El juego no existe';
    ELSE
        START TRANSACTION;
        
        UPDATE game 
        SET 
            nombre = COALESCE(game_name, nombre),
            descripcion = COALESCE(game_description, descripcion),
            gameBanner = COALESCE(game_banner, gameBanner),
            fecha_lanzamiento = COALESCE(release_date, fecha_lanzamiento),
            precio = COALESCE(original_price, precio),
            descuento = COALESCE(discount_id, descuento),
            puntaje = COALESCE(score, puntaje),
            id_editor = COALESCE(editor_id, id_editor),
            copias_disponibles = COALESCE(copies_available, copias_disponibles),
            copias_cantidad = COALESCE(total_copies, copias_cantidad)
        WHERE id_game = p_id_game;
        
        IF category_ids IS NOT NULL THEN

            DELETE FROM r_game_category WHERE id_game = p_id_game;
            
            WHILE LOCATE(',', category_ids) > 0 DO
                INSERT INTO r_game_category (id_game, id_category)
                VALUES (p_id_game, CAST(SUBSTRING_INDEX(category_ids, ',', 1) AS UNSIGNED));
                SET category_ids = SUBSTRING(category_ids, LOCATE(',', category_ids) + 1);
            END WHILE;
            
            IF category_ids != '' THEN
                INSERT INTO r_game_category (id_game, id_category)
                VALUES (p_id_game, CAST(category_ids AS UNSIGNED));
            END IF;
        END IF;
        
        COMMIT;
        
        SELECT 'Juego actualizado exitosamente' AS result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditGroup`(
    IN group_id_param INT,
    IN new_name_param VARCHAR(45),
    IN new_description_param VARCHAR(1000),
    IN new_group_banner_param VARCHAR(100),
    IN new_categories_param VARCHAR(255)
)
BEGIN

    UPDATE `group`
    SET 
        nombre = COALESCE(new_name_param, nombre),
        descripcion = COALESCE(new_description_param, descripcion),
        groupbanner = COALESCE(new_group_banner_param, groupbanner)
    WHERE id_group = group_id_param;
    
    DELETE FROM `r_group_category` 
    WHERE id_group = group_id_param;
    
    IF new_categories_param IS NOT NULL AND new_categories_param != '' THEN
        INSERT INTO `r_group_category` (id_group, id_category)
        SELECT 
            group_id_param, 
            CAST(TRIM(category_id) AS UNSIGNED)
        FROM (
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(new_categories_param, ',', numbers.n), ',', -1) category_id
            FROM (
                SELECT 1 + units.i + tens.i * 10 n
                FROM 
                    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) units,
                    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) tens
                ORDER BY n
            ) numbers
            WHERE n <= 1 + (LENGTH(new_categories_param) - LENGTH(REPLACE(new_categories_param, ',', '')))
        ) categories
        WHERE category_id != '';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditUser`(
    IN p_id_user INT,
    IN p_nombre VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_bio VARCHAR(500),
    IN p_id_permissions INT,
    IN p_id_status INT,
    IN p_profileIMG VARCHAR(1000),
    IN p_profileBanner VARCHAR(1000)
)
BEGIN
    UPDATE `lk-shop-db`.`user`
    SET 
        nombre = COALESCE(p_nombre, nombre),
        email = COALESCE(p_email, email),
        bio = COALESCE(p_bio, bio),
        id_permissions = COALESCE(p_id_permissions, id_permissions),
        id_status = COALESCE(p_id_status, id_status),
        profileIMG = COALESCE(p_profileIMG, profileIMG),
        profileBanner = COALESCE(p_profileBanner, profileBanner)
    WHERE id_user = p_id_user;
    
    SELECT ROW_COUNT() AS rows_affected;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllDiscountCodes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDiscountCodes`()
BEGIN
    CALL UpdateExpiredDiscountCodes();
    
    SELECT 
        dc.id_discount_code,
        dc.codigo,
        dc.id_discount_status,
        ds.nombre as status_nombre,
        dc.fecha_creacion,
        dc.fecha_finalizacion,
        dc.procentaje,
        CASE 
            WHEN NOW() < dc.fecha_creacion THEN 'Pending'
            WHEN NOW() BETWEEN dc.fecha_creacion AND dc.fecha_finalizacion THEN 'Active'
            WHEN NOW() > dc.fecha_finalizacion THEN 'Expired'
        END as current_status
    FROM 
        discount_code dc
    LEFT JOIN 
        discount_status ds ON dc.id_discount_status = ds.id_discount_status
    ORDER BY 
        dc.fecha_creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllGames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllGames`()
BEGIN
SELECT
    g.id_game,
    g.nombre AS game_name,
    g.descripcion AS game_description,
    g.gameBanner,
    g.fecha_lanzamiento,
    g.precio AS precio_original,
    CASE
        WHEN dc.id_discount_status = 1
        THEN ROUND(g.precio * (1 - dc.procentaje / 100), 2)
        ELSE g.precio
    END AS precio_con_descuento,
    g.descuento AS id_descuento,
    CASE
        WHEN dc.id_discount_status = 1
        THEN COALESCE(dc.procentaje, 0)
        ELSE 0
    END AS descuento_porcentaje,
    g.puntaje,
    e.nombre AS editor_nombre,
    g.copias_disponibles,
    g.copias_cantidad,
    GROUP_CONCAT(DISTINCT c.nombre SEPARATOR ', ') AS categorias
FROM
    game g
LEFT JOIN
    editor e ON g.id_editor = e.id_editor
LEFT JOIN
    r_game_category rgc ON g.id_game = rgc.id_game
LEFT JOIN
    category c ON rgc.id_category = c.id_category
LEFT JOIN
    discount_code dc ON g.descuento = dc.id_discount_code
GROUP BY
    g.id_game, g.nombre, g.descripcion, g.gameBanner, g.fecha_lanzamiento,
    g.precio, g.descuento, dc.procentaje, dc.fecha_creacion, 
    dc.fecha_finalizacion, dc.id_discount_status, g.puntaje, e.nombre,
    g.copias_disponibles, g.copias_cantidad
ORDER BY
    g.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPermissions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPermissions`()
BEGIN
    SELECT id_permissions, nombre 
    FROM permissions 
    ORDER BY id_permissions;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPurchases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPurchases`()
BEGIN
    SELECT 
        p.id_purchase,
        u.nombre AS nombre_usuario,
        g.nombre AS nombre_juego,
        g.gameBanner AS game_img,
        p.fecha,
        p.precio
    FROM 
        purchase p
    JOIN 
        user u ON p.id_user = u.id_user
    JOIN 
        game g ON p.id_game = g.id_game
    ORDER BY 
        p.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllReviews`()
BEGIN
    SELECT 
        r.id_review,
        u.nombre AS nombre_usuario,
        g.nombre AS nombre_juego,
        r.contenido,
        r.fecha,
        r.puntaje
    FROM 
        review r
    JOIN 
        user u ON r.id_user = u.id_user
    JOIN 
        game g ON r.id_game = g.id_game
    ORDER BY 
        r.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllStatuses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllStatuses`()
BEGIN
    SELECT id_status, nombre FROM status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUser`()
BEGIN
    SELECT 
        u.id_user, 
        u.nombre, 
        u.email, 
        u.profileIMG, 
        u.profileBanner, 
        s.nombre AS status_name, 
        p.nombre AS permissions_name
    FROM `lk-shop-db`.`user` u
    JOIN `lk-shop-db`.`status` s ON u.id_status = s.id_status
    JOIN `lk-shop-db`.`permissions` p ON u.id_permissions = p.id_permissions;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDiscountCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDiscountCode`(
    IN p_id_discount_code INT
)
BEGIN
    CALL UpdateExpiredDiscountCodes();
    
    IF NOT EXISTS (SELECT 1 FROM discount_code WHERE id_discount_code = p_id_discount_code) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Discount code not found';
    END IF;
    
    SELECT 
        dc.id_discount_code,
        dc.codigo,
        dc.id_discount_status,
        ds.nombre as status_nombre,
        dc.fecha_creacion,
        dc.fecha_finalizacion,
        dc.procentaje,
        CASE 
            WHEN NOW() < dc.fecha_creacion THEN 'Pending'
            WHEN NOW() BETWEEN dc.fecha_creacion AND dc.fecha_finalizacion THEN 'Active'
            WHEN NOW() > dc.fecha_finalizacion THEN 'Expired'
        END as current_status
    FROM 
        discount_code dc
    LEFT JOIN 
        discount_status ds ON dc.id_discount_status = ds.id_discount_status
    WHERE 
        dc.id_discount_code = p_id_discount_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGroupMessages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGroupMessages`(IN p_id_group INT)
BEGIN
    SELECT 
        msg.id_r_user_msg_group AS mensaje_id,
        usr.nombre AS usuario_nombre,
        usr.id_user AS id_user,
        msg.mensaje,
        msg.fecha
    FROM `lk-shop-db`.`r_user_msg_group` msg
    JOIN `lk-shop-db`.`user` usr ON msg.id_user = usr.id_user
    WHERE msg.id_group = p_id_group
    ORDER BY msg.fecha ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetGroupsWithDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGroupsWithDetails`()
BEGIN
    SELECT 
        g.id_group, 
        g.nombre AS group_name, 
        g.descripcion AS group_description,
        g.groupbanner, 
        u.nombre AS owner_name,
        u.id_user AS owner_id,
        COUNT(DISTINCT rug.id_user) AS member_count,
        GROUP_CONCAT(DISTINCT c.nombre SEPARATOR ', ') AS categories
    FROM 
        `group` g
    LEFT JOIN 
        user u ON g.id_owner = u.id_user
    LEFT JOIN 
        r_user_group rug ON g.id_group = rug.id_group
    LEFT JOIN 
        r_group_category rgc ON g.id_group = rgc.id_group
    LEFT JOIN 
        category c ON rgc.id_category = c.id_category
    GROUP BY 
        g.id_group, g.nombre, g.descripcion, g.groupbanner, u.nombre
    ORDER BY 
        member_count DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(
    IN p_user_id INT
)
BEGIN
    SELECT 
        u.id_user, 
        u.nombre, 
        u.email, 
        u.bio,
        u.profileIMG, 
        u.profileBanner, 
        s.nombre AS status_name, 
        p.nombre AS permissions_name,
        u.created_at AS registro_creado
    FROM `lk-shop-db`.`user` u
    JOIN `lk-shop-db`.`status` s ON u.id_status = s.id_status
    JOIN `lk-shop-db`.`permissions` p ON u.id_permissions = p.id_permissions
    WHERE u.id_user = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserFavorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserFavorites`(IN p_user_id INT)
BEGIN
    SELECT 
        g.id_game,
        g.nombre AS game_name,
        g.descripcion,
        g.gameBanner,
        g.precio,
        g.descuento,
        g.puntaje,
        e.nombre AS editor_name,
        GROUP_CONCAT(c.nombre) AS categories
    FROM favorite f
    INNER JOIN game g ON f.id_game = g.id_game
    INNER JOIN editor e ON g.id_editor = e.id_editor
    LEFT JOIN r_game_category rgc ON g.id_game = rgc.id_game
    LEFT JOIN category c ON rgc.id_category = c.id_category
    WHERE f.id_user = p_user_id
    GROUP BY g.id_game;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserGames` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserGames`(IN userId INT)
BEGIN
    SELECT 
        g.id_game,
        g.nombre AS game_name,
        g.descripcion,
        g.gameBanner,
        g.fecha_lanzamiento,
        g.precio,
        g.descuento,
        g.puntaje,
        e.nombre AS editor_name,
        rlg.fecha_adquirido,
        rlg.horas_jugadas,
        GROUP_CONCAT(c.nombre) AS categories
    FROM game g
    INNER JOIN r_library_game rlg ON g.id_game = rlg.id_game
    INNER JOIN library l ON rlg.id_library = l.id_library
    INNER JOIN editor e ON g.id_editor = e.id_editor
    LEFT JOIN r_game_category rgc ON g.id_game = rgc.id_game
    LEFT JOIN category c ON rgc.id_category = c.id_category
    WHERE l.id_user = userId
    GROUP BY g.id_game, rlg.fecha_adquirido, rlg.horas_jugadas
    ORDER BY rlg.fecha_adquirido DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserGroups`(IN p_user_id INT)
BEGIN
    SELECT 
        g.id_group, 
        g.nombre AS group_name, 
        g.descripcion AS group_description,
        g.groupbanner, 
        r.id_rol,
        rl.nombre AS rol_nombre,
        r.fecha_ingreso,
        GROUP_CONCAT(DISTINCT c.nombre SEPARATOR ', ') AS categories
    FROM `lk-shop-db`.`group` g
    JOIN `lk-shop-db`.`r_user_group` r ON g.id_group = r.id_group
    JOIN `lk-shop-db`.`rol` rl ON r.id_rol = rl.id_rol
    LEFT JOIN `lk-shop-db`.`r_group_category` rgc ON g.id_group = rgc.id_group
    LEFT JOIN `lk-shop-db`.`category` c ON rgc.id_category = c.id_category
    WHERE r.id_user = p_user_id
    GROUP BY 
        g.id_group, g.nombre, g.descripcion, g.groupbanner, 
        r.id_rol, rl.nombre, r.fecha_ingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserLibrary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserLibrary`(IN userId INT)
BEGIN
    SELECT 
        u.nombre AS 'Usuario',
        g.nombre AS 'Juego',
        g.descripcion AS 'Descripción',
        rlg.fecha_adquirido AS 'Fecha de Adquisición',
        rlg.horas_jugadas AS 'Horas Jugadas',
        l.procentaje_completado AS 'Porcentaje Completado',
        l.puntaje AS 'Puntuación Usuario',
        g.puntaje AS 'Puntuación General',
        ed.nombre AS 'Editor',
        GROUP_CONCAT(DISTINCT c.nombre) AS 'Categorías'
    FROM library l
    INNER JOIN user u ON l.id_user = u.id_user
    INNER JOIN r_library_game rlg ON l.id_library = rlg.id_library
    INNER JOIN game g ON rlg.id_game = g.id_game
    INNER JOIN editor ed ON g.id_editor = ed.id_editor
    LEFT JOIN r_game_category rgc ON g.id_game = rgc.id_game
    LEFT JOIN category c ON rgc.id_category = c.id_category
    WHERE l.id_user = userId
    GROUP BY u.nombre, g.nombre, g.descripcion, rlg.fecha_adquirido, 
             rlg.horas_jugadas, l.procentaje_completado, l.puntaje, 
             g.puntaje, ed.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPurchases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserPurchases`(IN p_user_id INT)
BEGIN
    SELECT 
        p.id_purchase,
        g.nombre AS nombre_juego,
        g.gameBanner AS game_IMG,
        p.fecha,
        p.precio
    FROM 
        purchase p
    JOIN 
        game g ON p.id_game = g.id_game
    WHERE 
        p.id_user = p_user_id
    ORDER BY 
        p.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserReviews`(IN p_user_id INT)
BEGIN
    SELECT 
        r.id_review,
        g.nombre AS nombre_juego,
        r.contenido,
        r.fecha,
        r.puntaje
    FROM 
        review r
    JOIN 
        game g ON r.id_game = g.id_game
    WHERE 
        r.id_user = p_user_id
    ORDER BY 
        r.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `JoinGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `JoinGroup`(
    IN p_id_group INT, 
    IN p_id_user INT
)
BEGIN
    DECLARE user_exists INT;
    
    SELECT COUNT(*) INTO user_exists
    FROM `lk-shop-db`.`r_user_group`
    WHERE id_group = p_id_group AND id_user = p_id_user;
    
    IF user_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario ya es miembro de este grupo';
    ELSE
        INSERT INTO `lk-shop-db`.`r_user_group` 
        (id_group, id_user, fecha_ingreso, id_rol) 
        VALUES 
        (p_id_group, p_id_user, CURRENT_DATE(), 3);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeaveGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LeaveGroup`(IN p_user_id INT, IN p_group_id INT)
BEGIN
    DECLARE v_owner_id INT;
    
    SELECT id_owner INTO v_owner_id 
    FROM `lk-shop-db`.`group`
    WHERE id_group = p_group_id;
    
    IF v_owner_id = p_user_id THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Group owner cannot leave the group';
    ELSE
        DELETE FROM `lk-shop-db`.`r_user_group`
        WHERE id_user = p_user_id AND id_group = p_group_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PurchaseGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PurchaseGame`(
    IN p_user_id INT, 
    IN p_game_id INT
)
BEGIN
    DECLARE v_game_price DECIMAL(5,2);
    DECLARE v_library_id INT;
    DECLARE v_copies_available INT;

    SELECT precio, copias_disponibles 
    INTO v_game_price, v_copies_available
    FROM game 
    WHERE id_game = p_game_id;

    IF v_copies_available > 0 THEN
        START TRANSACTION;

        INSERT INTO purchase (id_user, id_game, fecha, precio)
        VALUES (p_user_id, p_game_id, NOW(), v_game_price);

        UPDATE game 
        SET copias_disponibles = copias_disponibles - 1 
        WHERE id_game = p_game_id;

        SELECT id_library INTO v_library_id
        FROM library 
        WHERE id_user = p_user_id;

        IF v_library_id IS NULL THEN
            INSERT INTO library (resenia, puntaje, procentaje_completado, id_user)
            VALUES (NULL, NULL, 0.0, p_user_id);
            
            SET v_library_id = LAST_INSERT_ID();
        END IF;

        INSERT INTO r_library_game (id_game, id_library, fecha_adquirido, horas_jugadas)
        VALUES (p_game_id, v_library_id, CURDATE(), NULL);

        COMMIT;

        SELECT 'Game purchased successfully' AS result;
    ELSE
        SELECT 'Game is out of stock' AS result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RefundGame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RefundGame`(
    IN p_user_id INT,
    IN p_game_id INT
)
BEGIN
    DECLARE v_purchase_price DECIMAL(5,2);
    DECLARE v_purchase_exists INT;
    DECLARE v_library_id INT;
    
    SELECT COUNT(*), precio 
    INTO v_purchase_exists, v_purchase_price
    FROM purchase 
    WHERE id_user = p_user_id 
    AND id_game = p_game_id;
    
    IF v_purchase_exists > 0 THEN
        START TRANSACTION;
        
        DELETE FROM purchase 
        WHERE id_user = p_user_id 
        AND id_game = p_game_id;
        
        UPDATE game 
        SET copias_disponibles = copias_disponibles + 1 
        WHERE id_game = p_game_id;
        
        SELECT id_library INTO v_library_id 
        FROM library 
        WHERE id_user = p_user_id;
        
        DELETE FROM r_library_game 
        WHERE id_game = p_game_id 
        AND id_library = v_library_id;
        
        COMMIT;
        
        SELECT 'Game refunded successfully' AS result;
    ELSE
        SELECT 'Error: Game purchase not found for this user' AS result;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveGameFromFavorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveGameFromFavorites`(
    IN p_user_id INT, 
    IN p_game_id INT
)
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM favorite 
        WHERE id_user = p_user_id AND id_game = p_game_id
    ) THEN
        DELETE FROM favorite 
        WHERE id_user = p_user_id AND id_game = p_game_id;
        
        SELECT 'Game removed from favorites successfully' AS result;
    ELSE
        SELECT 'Game was not in favorites' AS result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RespondToUserQuery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RespondToUserQuery`(
    IN p_query_id INT, 
    IN p_admin_id INT, 
    IN p_response VARCHAR(1000)
)
BEGIN

    IF NOT EXISTS (SELECT 1 FROM user_query WHERE id_user_query = p_query_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Query ID does not exist';
    END IF;

    IF NOT EXISTS (
        SELECT 1 
        FROM user 
        WHERE id_user = p_admin_id 
        AND id_permissions IN (2, 3)
    ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid user or insufficient permissions';
    END IF;

    UPDATE user_query
    SET 
        id_admin_response = p_admin_id,
        respuesta = p_response,
        fecha_respuesta = NOW(),
        id_query_status = 2 
    WHERE id_user_query = p_query_id;

    SELECT ROW_COUNT() AS rows_affected;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchAllUserQueries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllUserQueries`()
BEGIN
    SELECT 
        uq.id_user_query, 
        uq.titulo, 
        uq.contenido, 
        uq.fecha_creacion, 
        u1.nombre AS user_name, 
        u2.nombre AS admin_name, 
        qs.nombre AS query_status, 
        uq.respuesta, 
        uq.fecha_respuesta
    FROM 
        user_query uq
    LEFT JOIN 
        user u1 ON uq.id_user = u1.id_user
    LEFT JOIN 
        user u2 ON uq.id_admin_response = u2.id_user
    LEFT JOIN 
        query_status qs ON uq.id_query_status = qs.id_query_status
    ORDER BY 
        uq.fecha_creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUserQueries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUserQueries`(IN p_id_user INT)
BEGIN
    SELECT 
        uq.id_user_query, 
        uq.titulo, 
        uq.contenido, 
        uq.fecha_creacion, 
        u1.nombre AS user_name, 
        u2.nombre AS admin_name, 
        qs.nombre AS query_status, 
        uq.respuesta, 
        uq.fecha_respuesta
    FROM 
        user_query uq
    LEFT JOIN 
        user u1 ON uq.id_user = u1.id_user
    LEFT JOIN 
        user u2 ON uq.id_admin_response = u2.id_user
    LEFT JOIN 
        query_status qs ON uq.id_query_status = qs.id_query_status
    WHERE
        uq.id_user = p_id_user
    ORDER BY 
        uq.fecha_creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SendGroupMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SendGroupMessage`(
    IN p_id_group INT, 
    IN p_id_user INT, 
    IN p_mensaje VARCHAR(1000)
)
BEGIN
    INSERT INTO `lk-shop-db`.`r_user_msg_group` 
    (id_group, id_user, mensaje, fecha) 
    VALUES 
    (p_id_group, p_id_user, p_mensaje, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateExpiredDiscountCodes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateExpiredDiscountCodes`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE discount_id INT;
    
    DECLARE cur CURSOR FOR 
        SELECT id_discount_code 
        FROM discount_code 
        WHERE fecha_finalizacion < NOW() 
        AND id_discount_status != 2;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    update_loop: LOOP
        FETCH cur INTO discount_id;
        IF done THEN
            LEAVE update_loop;
        END IF;
        
        UPDATE discount_code 
        SET id_discount_status = 2
        WHERE id_discount_code = discount_id;
    END LOOP;
    
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-14 10:41:41
