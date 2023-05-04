-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: comprasmod3
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
-- Table structure for table `tbl_compra`
--

DROP TABLE IF EXISTS `tbl_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_compra` (
  `pk_id_compra` int NOT NULL,
  `fk_id_proveedor` int DEFAULT NULL,
  `fecha_creacion_compra` varchar(45) DEFAULT NULL,
  `prioridad_compra` varchar(45) DEFAULT NULL,
  `fecha_entrega_compra` varchar(45) DEFAULT NULL,
  `total_compra` float DEFAULT NULL,
  `forma_pago_compra` varchar(45) DEFAULT NULL,
  `estatus_compra` tinyint DEFAULT NULL,
  PRIMARY KEY (`pk_id_compra`),
  KEY `fkidproveedor_compra_idx` (`fk_id_proveedor`),
  CONSTRAINT `fkidproveedor_compra` FOREIGN KEY (`fk_id_proveedor`) REFERENCES `tbl_proveedor` (`pk_id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_compra`
--

LOCK TABLES `tbl_compra` WRITE;
/*!40000 ALTER TABLE `tbl_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_compra`
--

DROP TABLE IF EXISTS `tbl_detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_compra` (
  `pk_id_detalle_compra` int NOT NULL,
  `fk_id_compra` int DEFAULT NULL,
  `fk_id_productos` int DEFAULT NULL,
  `cantidad_detalle_compra` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_compra`),
  KEY `fk_id_compra_detalle_compra_idx` (`fk_id_compra`),
  KEY `fk_id_productos_detalle_compra_idx` (`fk_id_productos`),
  CONSTRAINT `fk_id_compra_detalle_compra` FOREIGN KEY (`fk_id_compra`) REFERENCES `tbl_compra` (`pk_id_compra`),
  CONSTRAINT `fk_id_productos_detalle_compra` FOREIGN KEY (`fk_id_productos`) REFERENCES `tbl_productos` (`pk_id_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_compra`
--

LOCK TABLES `tbl_detalle_compra` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_factura`
--

DROP TABLE IF EXISTS `tbl_detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_factura` (
  `pk_id_detalle_factura` int NOT NULL,
  `fk_id_factura` int DEFAULT NULL,
  `nit_detalle_factura` varchar(45) DEFAULT NULL,
  `fecha_creacion_detalle_factura` varchar(45) DEFAULT NULL,
  `nombre_encargado_detalle_factura` varchar(45) DEFAULT NULL,
  `estado_detalle_factura` tinyint DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_factura`),
  KEY `fk_id_factura_detalle_factura_idx` (`fk_id_factura`),
  CONSTRAINT `fk_id_factura_detalle_factura` FOREIGN KEY (`fk_id_factura`) REFERENCES `tbl_factura` (`pk_id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_factura`
--

LOCK TABLES `tbl_detalle_factura` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_orden_compra`
--

DROP TABLE IF EXISTS `tbl_detalle_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_orden_compra` (
  `pk_id_detalle_orden_compra` int NOT NULL,
  `fk_id_orden_compra` int DEFAULT NULL,
  `fk_id_productos` int DEFAULT NULL,
  `cantidad_detalle_orden_compra` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_orden_compra`),
  KEY `fk_id_orden_compra_detalle_orden_idx` (`fk_id_orden_compra`),
  KEY `fk_id_productos_detalle_orden_idx` (`fk_id_productos`),
  CONSTRAINT `fk_id_orden_compra_detalle_orden` FOREIGN KEY (`fk_id_orden_compra`) REFERENCES `tbl_orden_compra` (`pk_id_orden_compra`),
  CONSTRAINT `fk_id_productos_detalle_orden` FOREIGN KEY (`fk_id_productos`) REFERENCES `tbl_productos` (`pk_id_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_orden_compra`
--

LOCK TABLES `tbl_detalle_orden_compra` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_orden_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_devolucion`
--

DROP TABLE IF EXISTS `tbl_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_devolucion` (
  `pk_id_devolucion` int NOT NULL,
  `fk_id_detalle_factura` int DEFAULT NULL,
  `fecha_devolucion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk_id_devolucion`),
  KEY `fk_id_detalle_factura_devolucio_idx` (`fk_id_detalle_factura`),
  CONSTRAINT `fk_id_detalle_factura_devolucio` FOREIGN KEY (`fk_id_detalle_factura`) REFERENCES `tbl_detalle_factura` (`pk_id_detalle_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_devolucion`
--

LOCK TABLES `tbl_devolucion` WRITE;
/*!40000 ALTER TABLE `tbl_devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_factura`
--

DROP TABLE IF EXISTS `tbl_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_factura` (
  `pk_id_factura` int NOT NULL,
  `fk_id_compra` int DEFAULT NULL,
  `total_factura` float DEFAULT NULL,
  `estatus_factura` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pk_id_factura`),
  KEY `fk_id_compra_factura_idx` (`fk_id_compra`),
  CONSTRAINT `fk_id_compra_factura` FOREIGN KEY (`fk_id_compra`) REFERENCES `tbl_compra` (`pk_id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_factura`
--

LOCK TABLES `tbl_factura` WRITE;
/*!40000 ALTER TABLE `tbl_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orden_compra`
--

DROP TABLE IF EXISTS `tbl_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orden_compra` (
  `pk_id_orden_compra` int NOT NULL,
  `fk_id_proveedor` int DEFAULT NULL,
  `fecha_creacion_orden_compra` varchar(45) DEFAULT NULL,
  `prioridad_orden_compra` varchar(45) DEFAULT NULL,
  `fecha_ini_orden_compra` varchar(45) DEFAULT NULL,
  `fecha_entre_orden_compra` varchar(45) DEFAULT NULL,
  `total_orden_compra` float DEFAULT NULL,
  `estatus_orden_compra` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pk_id_orden_compra`),
  KEY `fk_id_proveedor_compra_idx` (`fk_id_proveedor`),
  CONSTRAINT `fk_id_proveedor_compra` FOREIGN KEY (`fk_id_proveedor`) REFERENCES `tbl_proveedor` (`pk_id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orden_compra`
--

LOCK TABLES `tbl_orden_compra` WRITE;
/*!40000 ALTER TABLE `tbl_orden_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_productos` (
  `pk_id_productos` int NOT NULL,
  `nombre_productos` varchar(45) DEFAULT NULL,
  `marca_productos` varchar(45) DEFAULT NULL,
  `precio_unitario_productos` float DEFAULT NULL,
  PRIMARY KEY (`pk_id_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proveedor`
--

DROP TABLE IF EXISTS `tbl_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proveedor` (
  `pk_id_proveedor` int NOT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  `direccion_proveedor` varchar(50) DEFAULT NULL,
  `telefono_proveedor` int DEFAULT NULL,
  `correo_proveedor` varchar(50) DEFAULT NULL,
  `rubro_proveedor` varchar(100) DEFAULT NULL,
  `estado_proveedor` tinyint DEFAULT NULL,
  PRIMARY KEY (`pk_id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proveedor`
--

LOCK TABLES `tbl_proveedor` WRITE;
/*!40000 ALTER TABLE `tbl_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04  9:12:16
