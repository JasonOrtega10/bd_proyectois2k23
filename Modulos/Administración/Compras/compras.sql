
DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id_compras` int NOT NULL,
  `id_detalle_ordendecompras` int DEFAULT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `id_detalleordencompras_idx` (`id_detalle_ordendecompras`),
  CONSTRAINT `id_detalleordencompras` FOREIGN KEY (`id_detalle_ordendecompras`) REFERENCES `detalle_orden_de_compra` (`iddetalle_orden_de_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `compras` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `detalle_compras`;

CREATE TABLE `detalle_compras` (
  `id_detalle_compras` int NOT NULL,
  `id_compras` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compras`),
  KEY `id_compras_idx` (`id_compras`),
  KEY `idcomprass_idx` (`id_compras`),
  CONSTRAINT `idcomprass` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `detalle_compras` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `detalle_factura`;

CREATE TABLE `detalle_factura` (
  `iddetalle_factura` int NOT NULL AUTO_INCREMENT,
  `id_factura` int DEFAULT NULL,
  `nit` int DEFAULT NULL,
  `fecha_creacion` varchar(45) DEFAULT NULL,
  `nombre_encargado` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_factura`),
  KEY `id_factura_idx` (`id_factura`),
  CONSTRAINT `idfactura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `detalle_factura` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `detalle_orden_de_compra`;

CREATE TABLE `detalle_orden_de_compra` (
  `iddetalle_orden_de_compra` int NOT NULL,
  `id_orden_de_compra` int DEFAULT NULL,
  `fk_id_proveedor` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_orden_de_compra`),
  KEY `id_orden_de_compra_idx` (`id_orden_de_compra`),
  KEY `id_producto_idx` (`id_producto`),
  KEY `fk_id_proveedor` (`fk_id_proveedor`),
  CONSTRAINT `fk_id_proveedor` FOREIGN KEY (`fk_id_proveedor`) REFERENCES `tbl_proveedor` (`pk_id_proveedor`),
  CONSTRAINT `id_orden_de_compra` FOREIGN KEY (`id_orden_de_compra`) REFERENCES `orden_de_compra` (`id_orden_de_compra`),
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `detalle_orden_de_compra` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `devolucion`;

CREATE TABLE `devolucion` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT,
  `id_detalle_factura` int DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_devolucion`),
  KEY `id_detallefactura_idx` (`id_detalle_factura`),
  CONSTRAINT `id_detallefactura` FOREIGN KEY (`id_detalle_factura`) REFERENCES `detalle_factura` (`iddetalle_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `devolucion` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_compras` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_compras_idx` (`id_compras`),
  CONSTRAINT `id_compras` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `factura` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `orden_de_compra`;

CREATE TABLE `orden_de_compra` (
  `id_orden_de_compra` int NOT NULL AUTO_INCREMENT,
  `fecha_creacion_orden` varchar(45) DEFAULT NULL,
  `prioridad` varchar(45) DEFAULT NULL,
  `fecha_ini_orden_compra` varchar(45) DEFAULT NULL,
  `fecha_entre_orden_compra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_orden_de_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `orden_de_compra` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_productos` int NOT NULL,
  `producto` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  PRIMARY KEY (`id_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




LOCK TABLES `productos` WRITE;
UNLOCK TABLES;



DROP TABLE IF EXISTS `tbl_proveedor`;
CREATE TABLE `tbl_proveedor` (
  `pk_id_proveedor` int NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion_proveedor` varchar(50) NOT NULL,
  `telefono_proveedor` int NOT NULL,
  `correo_proveedor` varchar(50) NOT NULL,
  `rubro_proveedor` varchar(100) NOT NULL,
  `estado_proveedor` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


--
-- Dumping data for table `tbl_proveedor`
--

LOCK TABLES `tbl_proveedor` WRITE;

UNLOCK TABLES;


