CREATE TABLE `tbl_compra` (
  `pk_id_compra` int NOT NULL,
  `codigo_almacen` int,
  `fk_id_proveedor` int DEFAULT NULL,
  `fecha_creacion_compra` varchar(45) DEFAULT NULL,
  `prioridad_compra` varchar(45) DEFAULT NULL,
  `fecha_entrega_compra` varchar(45) DEFAULT NULL,
  `total_compra` float DEFAULT NULL,
  `fk_id_tipoPago` int DEFAULT NULL,
  `tipo_compra` varchar(1) DEFAULT NULL,
  `estatus_compra` tinyint DEFAULT NULL,
  PRIMARY KEY (`pk_id_compra`, `codigo_almacen`),
  KEY `fkidproveedor_compra_idx` (`fk_id_proveedor`),
KEY `fkidtipopago_compra_idx` (`fk_id_tipopago`),
CONSTRAINT `fkidproveedor_compra` FOREIGN KEY (`fk_id_proveedor`) REFERENCES `tbl_proveedor` (`pk_id_proveedor`),
CONSTRAINT `fkidtipopago_compra` FOREIGN KEY (`fk_id_tipopago`) REFERENCES `tbl_TipoPago` (`pk_id_tipopago`),
FOREIGN KEY (`codigo_almacen`) REFERENCES `tbl_almacen`(`codigo_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `tbl_detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_compra` (
  `pk_id_detalle_compra` int NOT NULL,
  `fk_id_compra` int DEFAULT NULL,
  `fk_id_listado_productos` int DEFAULT NULL,
  `cantidad_detalle_compra` int DEFAULT NULL,
  `precio_unitario` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_compra`),
  KEY `fk_id_compra_detalle_compra_idx` (`fk_id_compra`),
  KEY `fk_id_productos_detalle_compra_idx` (`fk_id_listado_productos`),
  CONSTRAINT `fk_id_compra_detalle_compra` FOREIGN KEY (`fk_id_compra`) REFERENCES `tbl_compra` (`pk_id_compra`),
  CONSTRAINT `fk_id_productos_detalle_compra` FOREIGN KEY (`fk_id_listado_productos`) REFERENCES `tbl_listado_productos` (`pk_id_listado_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `tbl_detalle_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalle_orden_compra` (
  `pk_id_detalle_orden_compra` int NOT NULL,
  `fk_id_orden_compra` int DEFAULT NULL,
  `fk_id_listado_productos` int DEFAULT NULL,
  `cantidad_detalle_orden_compra` int DEFAULT NULL,
  `precio_unitario` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_orden_compra`),
  KEY `fk_id_orden_compra_detalle_orden_idx` (`fk_id_orden_compra`),
  KEY `fk_id_productos_detalle_orden_idx` (`fk_id_listado_productos`),
  CONSTRAINT `fk_id_orden_compra_detalle_orden` FOREIGN KEY (`fk_id_orden_compra`) REFERENCES `tbl_orden_compra` (`pk_id_orden_compra`),
  CONSTRAINT `fk_id_productos_detalle_orden` FOREIGN KEY (`fk_id_listado_productos`) REFERENCES `tbl_listado_productos` (`pk_id_listado_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `tbl_listado_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_listado_productos` (
  `pk_id_listado_productos` int NOT NULL,
  `nombre_listado_productos` varchar(45) DEFAULT NULL,
  `marca_listado_productos` varchar(45) DEFAULT NULL,
  `precio_unitario_listado_productos` float DEFAULT NULL,
  PRIMARY KEY (`pk_id_listado_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



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


