CREATE DATABASE  IF NOT EXISTS `streamverse_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `streamverse_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: streamverse_db
-- ------------------------------------------------------
-- Server version	9.7.1

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '3fcccb47-89c1-11f1-87fa-d0c1b57f61d1:1-141';

--
-- Table structure for table `assinantes`
--

DROP TABLE IF EXISTS `assinantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinantes` (
  `id_assinante` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_cadastro` date NOT NULL,
  `id_plano` int NOT NULL,
  PRIMARY KEY (`id_assinante`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_assinante_plano` (`id_plano`),
  CONSTRAINT `fk_assinante_plano` FOREIGN KEY (`id_plano`) REFERENCES `planos` (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinantes`
--

LOCK TABLES `assinantes` WRITE;
/*!40000 ALTER TABLE `assinantes` DISABLE KEYS */;
INSERT INTO `assinantes` VALUES (1,'Carlos Eduardo','carlos@email.com','2024-01-15',3),(2,'Mariana Lima','mariana@email.com','2024-02-10',2),(3,'Beatriz Souza','beatriz@email.com','2024-03-01',1),(4,'Lucas Mendes','lucas@email.com','2024-03-12',3),(5,'Fernanda Rocha','fernanda@email.com','2024-04-05',4);
/*!40000 ALTER TABLE `assinantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Ficção Científica'),(2,'Ação'),(3,'Documentário'),(4,'Animação'),(5,'Drama');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_visualizacao`
--

DROP TABLE IF EXISTS `historico_visualizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_visualizacao` (
  `id_historico` int NOT NULL AUTO_INCREMENT,
  `id_perfil` int NOT NULL,
  `id_titulo` int NOT NULL,
  `data_visualizacao` datetime NOT NULL,
  `percentual_assistido` int NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `fk_hist_perfil` (`id_perfil`),
  KEY `fk_hist_titulo` (`id_titulo`),
  CONSTRAINT `fk_hist_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfis` (`id_perfil`),
  CONSTRAINT `fk_hist_titulo` FOREIGN KEY (`id_titulo`) REFERENCES `titulos` (`id_titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_visualizacao`
--

LOCK TABLES `historico_visualizacao` WRITE;
/*!40000 ALTER TABLE `historico_visualizacao` DISABLE KEYS */;
INSERT INTO `historico_visualizacao` VALUES (1,1,1,'2024-04-10 20:30:00',100),(2,2,4,'2024-04-11 15:00:00',80),(3,3,5,'2024-04-12 21:15:00',45),(4,4,2,'2024-04-13 18:00:00',100),(5,5,3,'2024-04-14 10:00:00',95);
/*!40000 ALTER TABLE `historico_visualizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_assinante` int NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` date NOT NULL,
  `status_pagamento` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_pag_assinante` (`id_assinante`),
  CONSTRAINT `fk_pag_assinante` FOREIGN KEY (`id_assinante`) REFERENCES `assinantes` (`id_assinante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,1,55.90,'2024-04-01','Aprovado'),(2,2,39.90,'2024-04-02','Aprovado'),(3,3,21.90,'2024-04-03','Recusado'),(4,4,55.90,'2024-04-04','Aprovado'),(5,5,69.90,'2024-04-05','Pendente');
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfis` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(50) NOT NULL,
  `tipo_classificacao` varchar(20) NOT NULL,
  `id_assinante` int NOT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `fk_perfil_assinante` (`id_assinante`),
  CONSTRAINT `fk_perfil_assinante` FOREIGN KEY (`id_assinante`) REFERENCES `assinantes` (`id_assinante`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` VALUES (1,'Cadu_Main','Adulto',1),(2,'Mari_Kids','Infantil',2),(3,'Bia_Cinema','Adulto',3),(4,'Lucas_Gamer','Adulto',4),(5,'Família_Geral','Livre',5);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos`
--

DROP TABLE IF EXISTS `planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor_mensal` decimal(10,2) NOT NULL,
  `resolucao_maxima` varchar(10) NOT NULL,
  PRIMARY KEY (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planos`
--

LOCK TABLES `planos` WRITE;
/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
INSERT INTO `planos` VALUES (1,'Básico',21.90,'HD'),(2,'Padrão',39.90,'FHD'),(3,'Premium',55.90,'4K'),(4,'Família',69.90,'4K'),(5,'Corporativo',199.90,'8K');
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulos` (
  `id_titulo` int NOT NULL AUTO_INCREMENT,
  `nome_titulo` varchar(150) NOT NULL,
  `ano_lancamento` int NOT NULL,
  `duracao_minutos` int NOT NULL,
  `classificacao_etaria` varchar(10) NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_titulo`),
  KEY `fk_titulo_categoria` (`id_categoria`),
  CONSTRAINT `fk_titulo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos`
--

LOCK TABLES `titulos` WRITE;
/*!40000 ALTER TABLE `titulos` DISABLE KEYS */;
INSERT INTO `titulos` VALUES (1,'Cyberpunk 2099',2023,130,'16+',1),(2,'A Jornada do Herói',2021,105,'12+',2),(3,'Planeta Azul: Profundezas',2022,90,'Livre',3),(4,'O Reino das Sombras',2024,85,'10+',4),(5,'Ecos do Passado',2020,142,'14+',5);
/*!40000 ALTER TABLE `titulos` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-28  9:55:29
