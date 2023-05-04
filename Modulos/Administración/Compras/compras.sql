-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: colchoneria3
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `codigo_empleado` int NOT NULL,
  `nombre_completo` varchar(40) NOT NULL,
  `puesto` varchar(15) NOT NULL,
  `departamento` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aplicaciones`
--

DROP TABLE IF EXISTS `tbl_aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_aplicaciones` (
  `pk_id_aplicacion` int NOT NULL,
  `nombre_aplicacion` varchar(40) NOT NULL,
  `descripcion_aplicacion` varchar(15) NOT NULL,
  `estado_aplicacion` varchar(15) NOT NULL,
  PRIMARY KEY (`pk_id_aplicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aplicaciones`
--

LOCK TABLES `tbl_aplicaciones` WRITE;
/*!40000 ALTER TABLE `tbl_aplicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacionesperfilusuario`
--

DROP TABLE IF EXISTS `tbl_asignacionesperfilusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacionesperfilusuario` (
  `fk_id_usuario` int NOT NULL,
  `fk_id_perfiles` varchar(40) NOT NULL,
  PRIMARY KEY (`fk_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacionesperfilusuario`
--

LOCK TABLES `tbl_asignacionesperfilusuario` WRITE;
/*!40000 ALTER TABLE `tbl_asignacionesperfilusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignacionesperfilusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacionmoduloapicacion`
--

DROP TABLE IF EXISTS `tbl_asignacionmoduloapicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacionmoduloapicacion` (
  `fk_id_modulos` int NOT NULL,
  `fk_id_aplicacion` varchar(40) NOT NULL,
  PRIMARY KEY (`fk_id_modulos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacionmoduloapicacion`
--

LOCK TABLES `tbl_asignacionmoduloapicacion` WRITE;
/*!40000 ALTER TABLE `tbl_asignacionmoduloapicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignacionmoduloapicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacoradeeventos`
--

DROP TABLE IF EXISTS `tbl_bitacoradeeventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacoradeeventos` (
  `pk_id_bitacora` int NOT NULL,
  `fk_id_usuario` varchar(40) NOT NULL,
  `fk_id_aplicacion` varchar(15) NOT NULL,
  `hora_bitacora` varchar(15) NOT NULL,
  `host_bitacora` varchar(15) NOT NULL,
  `ip_bitacora` varchar(15) NOT NULL,
  `accion_bitacora` varchar(15) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacoradeeventos`
--

LOCK TABLES `tbl_bitacoradeeventos` WRITE;
/*!40000 ALTER TABLE `tbl_bitacoradeeventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bitacoradeeventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bitacoratablas`
--

DROP TABLE IF EXISTS `tbl_bitacoratablas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bitacoratablas` (
  `pk_id_bitacora` int NOT NULL,
  `fecha_de_accion` varchar(40) NOT NULL,
  `tabla_referencia` varchar(15) NOT NULL,
  `fk_id_usuario` varchar(15) NOT NULL,
  `metodo` varchar(15) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bitacoratablas`
--

LOCK TABLES `tbl_bitacoratablas` WRITE;
/*!40000 ALTER TABLE `tbl_bitacoratablas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bitacoratablas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consultainteligente`
--

DROP TABLE IF EXISTS `tbl_consultainteligente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consultainteligente` (
  `nombre_consulta` varchar(40) NOT NULL,
  `tabla_consulta` varchar(40) NOT NULL,
  `campos_consultas` varchar(15) NOT NULL,
  `alias_consultas` varchar(15) NOT NULL,
  `PkId` int NOT NULL,
  `metodo` varchar(15) NOT NULL,
  PRIMARY KEY (`PkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consultainteligente`
--

LOCK TABLES `tbl_consultainteligente` WRITE;
/*!40000 ALTER TABLE `tbl_consultainteligente` DISABLE KEYS */;
INSERT INTO `tbl_consultainteligente` VALUES ('Simple','tbl_perfiles','pk_id_perfil','perfilSimple',1,'where');
/*!40000 ALTER TABLE `tbl_consultainteligente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consultainteligente1`
--

DROP TABLE IF EXISTS `tbl_consultainteligente1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consultainteligente1` (
  `operador_consulta` varchar(40) NOT NULL,
  `campos_consulta` varchar(40) NOT NULL,
  `valor_consultas` varchar(15) NOT NULL,
  `PkId` int NOT NULL,
  `metodo` varchar(15) NOT NULL,
  PRIMARY KEY (`PkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consultainteligente1`
--

LOCK TABLES `tbl_consultainteligente1` WRITE;
/*!40000 ALTER TABLE `tbl_consultainteligente1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_consultainteligente1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consultainteligente2`
--

DROP TABLE IF EXISTS `tbl_consultainteligente2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consultainteligente2` (
  `PkId` int NOT NULL,
  `ordenar_consulta` varchar(40) NOT NULL,
  `campo_consulta` varchar(40) NOT NULL,
  `metodo` varchar(15) NOT NULL,
  PRIMARY KEY (`PkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consultainteligente2`
--

LOCK TABLES `tbl_consultainteligente2` WRITE;
/*!40000 ALTER TABLE `tbl_consultainteligente2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_consultainteligente2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulos`
--

DROP TABLE IF EXISTS `tbl_modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_modulos` (
  `Pk_id` int NOT NULL,
  `nombre_modulo` varchar(40) NOT NULL,
  `descripcion_modulo` varchar(40) NOT NULL,
  `estado_modulo` varchar(15) NOT NULL,
  PRIMARY KEY (`Pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulos`
--

LOCK TABLES `tbl_modulos` WRITE;
/*!40000 ALTER TABLE `tbl_modulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_modulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02 19:47:41
