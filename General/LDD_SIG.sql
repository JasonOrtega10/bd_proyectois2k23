DROP DATABASE IF EXISTS sig;
CREATE DATABASE IF NOT EXISTS sig;
USE sig;
/*------Consulta Inteligente------------------*/
DROP TABLE IF EXISTS tbl_consultainteligente;
CREATE TABLE IF NOT EXISTS tbl_consultainteligente (
	nombre_consulta varchar(50) not null,
    tabla_consulta varchar(50) not null,
    campos_consultas varchar(50) not null,
    alias_consultas varchar(50) not null,
    cadena_consultas varchar(80) not null,
    PkId INT NOT NULL,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_consultainteligente1; 
CREATE TABLE IF NOT EXISTS tbl_consultainteligente1 (
 operador_consulta varchar(50) not null,
    campos_consulta varchar(50) not null,
    valor_consultas varchar(50) not null,
    PkId INT NOT NULL,   
    metodo varchar(50) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_consultainteligente2;
CREATE TABLE IF NOT EXISTS tbl_consultainteligente2 (
    PkId INT NOT NULL,
    ordenar_consulta varchar(50) not null,
    campo_consulta varchar(50) not null,    
    metodo varchar(50) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

/*---------Reporteria----------*/

CREATE TABLE tbl_regreporteria (
  idregistro int NOT NULL AUTO_INCREMENT,
  ruta varchar(500) NOT NULL,
  nombre_archivo varchar(45) NOT NULL,
  aplicacion varchar(45) NOT NULL,
  estado varchar(45) NOT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*-----------Seguridad-----------*/

DROP TABLE IF EXISTS `tbl_modulos`;
CREATE TABLE IF NOT EXISTS `tbl_modulos` (
	pk_id_modulos INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion_modulo VARCHAR(150) NOT NULL,
    estado_modulo TINYINT DEFAULT 0,
    primary key (`pk_id_modulos`)
);

DROP TABLE IF EXISTS `tbl_aplicaciones`;
CREATE TABLE IF NOT EXISTS `tbl_aplicaciones` (
	pk_id_aplicacion INT NOT NULL,
    nombre_aplicacion VARCHAR(50) NOT NULL,
    descripcion_aplicacion VARCHAR(150) NOT NULL,
    estado_aplicacion TINYINT DEFAULT 0,
    primary key (`pk_id_aplicacion`)
);

DROP TABLE IF EXISTS `tbl_AsignacionModuloAplicacion`;
CREATE TABLE IF NOT EXISTS `tbl_AsignacionModuloAplicacion` (
  fk_id_modulos INT NOT NULL,
  fk_id_aplicacion INT NOT NULL, 
  PRIMARY KEY (`fk_id_modulos`,`fk_id_aplicacion` ),
  FOREIGN KEY (`fk_id_modulos`) REFERENCES `tbl_modulos` (`pk_id_modulos`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  pk_id_usuario INT AUTO_INCREMENT NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  username_usuario VARCHAR(20) NOT NULL,
  password_usuario VARCHAR(100) NOT NULL,
  email_usuario VARCHAR(50) NOT NULL,
  estado_usuario TINYINT DEFAULT 0 NOT NULL,
  pregunta varchar(50) not null,
  respuesta varchar(50) not null,
  PRIMARY KEY (`pk_id_usuario`)
);

DROP TABLE IF EXISTS `tbl_perfiles`;
CREATE TABLE IF NOT EXISTS `tbl_perfiles` (
	pk_id_perfil INT AUTO_INCREMENT NOT NULL,
    nombre_perfil VARCHAR(50) NOT NULL,
    descripcion_perfil VARCHAR(150) NOT NULL,
    estado_perfil TINYINT DEFAULT 0,
    primary key (pk_id_perfil)
);

DROP TABLE IF EXISTS `tbl_permisosAplicacionesUsuario`;
CREATE TABLE IF NOT EXISTS `tbl_permisosAplicacionesUsuario` (
  fk_id_aplicacion INT NOT NULL, 
  fk_id_usuario INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`fk_id_aplicacion`,`fk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_permisosAplicacionPerfil`;
CREATE TABLE IF NOT EXISTS `tbl_permisosAplicacionPerfil` (
  fk_id_perfil INT NOT NULL, 
  fk_id_aplicacion INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`fk_id_perfil`,`fk_id_aplicacion`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacionesPerfilsUsuario`;
CREATE TABLE IF NOT EXISTS `tbl_asignacionesPerfilsUsuario` (
  fk_id_usuario INT NOT NULL, 
  fk_id_perfil INT NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil` ),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_bitacoraDeEventos`;
CREATE TABLE IF NOT EXISTS `tbl_bitacoraDeEventos` (
  pk_id_bitacora INT AUTO_INCREMENT NOT NULL,
  fk_id_usuario INT NOT NULL,
  fk_id_aplicacion INT NOT NULL,
  fecha_bitacora DATE NOT NULL,
  hora_bitacora TIME NOT NULL,
  host_bitacora VARCHAR(45) NOT NULL,
  ip_bitacora VARCHAR(100) NOT NULL,
  accion_bitacora VARCHAR(50) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


-- vistas Seguridad------------------------------------------------------------------------
CREATE 
VIEW `colchoneria`.`vista_aplicacion_perfil` AS 
    SELECT 
        `b`.`fk_id_perfil` AS `ID`,
        `a`.`nombre_perfil` AS `Perfil`,
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `b`.`guardar_permiso` AS `Insertar`,
        `b`.`modificar_permiso` AS `Modificar`,
        `b`.`eliminar_permiso` AS `Eliminar`,
        `b`.`buscar_permiso` AS `Buscar`,
        `b`.`imprimir_permiso` AS `Reporte`
    FROM
        (`colchoneria`.`tbl_permisosaplicacionperfil` `b`
        JOIN `colchoneria`.`tbl_perfiles` `a` ON ((`a`.`pk_id_perfil` = `b`.`fk_id_perfil`)));
        
CREATE 
VIEW `colchoneria`.`vista_aplicacionusuario` AS
    SELECT 
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `b`.`fk_id_usuario` AS `ID`,
        `a`.`nombre_usuario` AS `Usuario`,
        `b`.`guardar_permiso` AS `Insertar`,
        `b`.`modificar_permiso` AS `Editar`,
        `b`.`eliminar_permiso` AS `Eliminar`,
        `b`.`buscar_permiso` AS `Buscar`,
        `b`.`imprimir_permiso` AS `Reporte`
    FROM
        (`colchoneria`.`tbl_permisosaplicacionesusuario` `b`
        JOIN `colchoneria`.`tbl_usuarios` `a` ON ((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`)));
        
CREATE 
VIEW `colchoneria`.`vista_modulo_aplicacion` AS
    SELECT 
        `b`.`fk_id_modulos` AS `ID`,
        `a`.`nombre_modulo` AS `Modulo`,
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `c`.`nombre_aplicacion` AS `Nombre`,
        `c`.`descripcion_aplicacion` AS `Descripcion`
    FROM
        ((`colchoneria`.`tbl_asignacionmoduloaplicacion` `b`
        JOIN `colchoneria`.`tbl_modulos` `a` ON ((`a`.`pk_id_modulos` = `b`.`fk_id_modulos`)))
        JOIN `colchoneria`.`tbl_aplicaciones` `c` ON ((`c`.`pk_id_aplicacion` = `b`.`fk_id_aplicacion`)));
        
CREATE 
VIEW `colchoneria`.`vista_perfil_usuario` AS
    SELECT 
        `b`.`fk_id_usuario` AS `ID`,
        `a`.`nombre_usuario` AS `Usuario`,
        `a`.`username_usuario` AS `nickName`,
        `b`.`fk_id_perfil` AS `perfil`,
        `c`.`nombre_perfil` AS `Nombre`
    FROM
        ((`colchoneria`.`tbl_asignacionesperfilsusuario` `b`
        JOIN `colchoneria`.`tbl_usuarios` `a` ON ((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`)))
        JOIN `colchoneria`.`tbl_perfiles` `c` ON ((`c`.`pk_id_perfil` = `b`.`fk_id_perfil`)));
        
        

/*------------------Almacen/Inventario-------------*/
DROP TABLE IF EXISTS tbl_almacen;
CREATE TABLE tbl_almacen
(
	codigo_almacen int,
    nombre_almacen VARCHAR(60) NOT NULL,
    estatus_almacen VARCHAR(1) NOT NULL,
    primary key(codigo_almacen)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS tbl_linea;
CREATE TABLE  tbl_linea
(
	codigo_linea int PRIMARY KEY,
    nombre_linea VARCHAR(60),
    estatus_linea VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS tbl_marca;
CREATE TABLE tbl_marca
(
	codigo_marca int PRIMARY KEY,
    nombre_marca VARCHAR(60),
    estatus_marca VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS tbl_producto;
CREATE TABLE tbl_producto
(
	codigo_producto int PRIMARY KEY,
    nombre_producto VARCHAR(60),
    codigo_linea int,
    codigo_marca int,
    existencia_producto FLOAT(10,2),
    costouni_producto FLOAT(10,2),
    preciouni_producto FLOAT(10,2),
    fechaultentrada_marca VARCHAR(60),
    fechaultsalida_marca VARCHAR(60),
    estatus_producto VARCHAR(1),
    FOREIGN KEY (codigo_linea) REFERENCES tbl_linea(codigo_linea),
    FOREIGN KEY (codigo_marca) REFERENCES tbl_marca(codigo_marca)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS tbl_existencia;
CREATE TABLE tbl_existencia
(
    codigo_almacen int,
    codigo_producto int,
    saldo_existencia FLOAT(10,2),
    PRIMARY KEY (codigo_almacen, codigo_producto),
	FOREIGN KEY (codigo_almacen) REFERENCES tbl_almacen(codigo_almacen),
    FOREIGN KEY (codigo_producto) REFERENCES tbl_producto(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


/*-------------COMPRAS------------*/

create table if not exists `tbl_proveedor`(
pk_id_proveedor int not null,
nombre_proveedor varchar(50) not null,
direccion_proveedor varchar(50) not null,
telefono_proveedor int not null,
correo_proveedor varchar(50) not null,
rubro_proveedor varchar(100) not null,
saldo_mes_anterior_proveedor FLOAT ,
saldo_actual_proveedor FLOAT, 
cargo_del_mes_proveedor FLOAT, 
abonos_del_mes_proveedor FLOAT,  
cargos_acumulados_proveedor FLOAT,
abonos_acumulados_proveedor FLOAT,
estado_proveedor tinyint not null,
primary key(pk_id_proveedor)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_TipoPago` (
	pk_id_tipopago INT PRIMARY KEY,
	nombre_tipopago VARCHAR(50) not null,
	estado_tipopago tinyint not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists `tbl_Moneda`(
	pk_id_moneda int primary key,
	nombre_moneda VARCHAR(50) not null,
	simbolo_moneda VARCHAR(5) not null,
	cambio_moneda float not null,
    estado_moneda tinyint not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_listado_productos`;
CREATE TABLE `tbl_listado_productos` (
  `pk_id_listado_productos` int NOT NULL,
  `nombre_listado_productos` varchar(45) DEFAULT NULL,
  `marca_listado_productos` varchar(45) DEFAULT NULL,
  `costo_unitario_listado_productos` float DEFAULT NULL,
  PRIMARY KEY (`pk_id_listado_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
CREATE TABLE `tbl_detalle_compra` (
  `pk_id_detalle_compra` int NOT NULL,
  `codigo_almacen` int,
  `fk_id_compra` int DEFAULT NULL,
  `fk_id_listado_productos` int DEFAULT NULL,
  `cantidad_detalle_compra` int DEFAULT NULL,
  `costo_unitario` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_compra`, `codigo_almacen`),
  KEY `fk_id_compra_detalle_compra_idx` (`fk_id_compra`),
  KEY `fk_id_productos_detalle_compra_idx` (`fk_id_listado_productos`),
  CONSTRAINT `fk_id_compra_detalle_compra` FOREIGN KEY (`fk_id_compra`) REFERENCES `tbl_compra` (`pk_id_compra`),
  CONSTRAINT `fk_id_productos_detalle_compra` FOREIGN KEY (`fk_id_listado_productos`) REFERENCES `tbl_listado_productos` (`pk_id_listado_productos`),
  FOREIGN KEY (`codigo_almacen`) REFERENCES `tbl_almacen`(`codigo_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_orden_compra`;
CREATE TABLE `tbl_orden_compra` (
  `pk_id_orden_compra` int NOT NULL,
  `codigo_almacen` int,
  `fk_id_proveedor` int DEFAULT NULL,
  `fecha_creacion_orden_compra` varchar(45) DEFAULT NULL,
  `prioridad_orden_compra` varchar(45) DEFAULT NULL,
  `fecha_ini_orden_compra` varchar(45) DEFAULT NULL,
  `fecha_entre_orden_compra` varchar(45) DEFAULT NULL,
  `total_orden_compra` float DEFAULT NULL,
  `estatus_orden_compra` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pk_id_orden_compra`, `codigo_almacen`),
  KEY `fk_id_proveedor_compra_idx` (`fk_id_proveedor`),
  CONSTRAINT `fk_id_proveedor_compra` FOREIGN KEY (`fk_id_proveedor`) REFERENCES `tbl_proveedor` (`pk_id_proveedor`),
  FOREIGN KEY (`codigo_almacen`) REFERENCES `tbl_almacen`(`codigo_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `tbl_detalle_orden_compra`;
CREATE TABLE `tbl_detalle_orden_compra` (
  `pk_id_detalle_orden_compra` int NOT NULL,
  `codigo_almacen` int,
  `fk_id_orden_compra` int DEFAULT NULL,
  `fk_id_listado_productos` int DEFAULT NULL,
  `cantidad_detalle_orden_compra` int DEFAULT NULL,
  `costo_unitario` int DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle_orden_compra`, `codigo_almacen`),
  KEY `fk_id_orden_compra_detalle_orden_idx` (`fk_id_orden_compra`),
  KEY `fk_id_productos_detalle_orden_idx` (`fk_id_listado_productos`),
  CONSTRAINT `fk_id_orden_compra_detalle_orden` FOREIGN KEY (`fk_id_orden_compra`) REFERENCES `tbl_orden_compra` (`pk_id_orden_compra`),
  CONSTRAINT `fk_id_productos_detalle_orden` FOREIGN KEY (`fk_id_listado_productos`) REFERENCES `tbl_listado_productos` (`pk_id_listado_productos`),
  FOREIGN KEY (`codigo_almacen`) REFERENCES `tbl_almacen`(`codigo_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*----------------Cuenta Por Pagar----------------*/


CREATE TABLE if not exists `tbl_ConceptoCuentaPorPagar`(
pk_id_conceptocuentaporpagar int not null,
descripcion_conceptocuentaporpagar varchar(50) not null,
tipoconcepto_conceptocuentaporpagar varchar(15) not null,
estado_conceptocuentaporpagar tinyint default 0 not null,
primary key(pk_id_conceptocuentaporpagar)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_factura` (
  pk_id_factura int NOT NULL,
  pk_id_almacen int not null,
  pk_id_proveedor INT not null,
  fecha_emision_factura DATE not null,
  total_factura float DEFAULT NULL,
  estatus_factura tinyint(1) DEFAULT NULL,
  PRIMARY KEY (pk_id_factura,pk_id_almacen,pk_id_proveedor),
  FOREIGN KEY (pk_id_almacen) REFERENCES tbl_almacen(codigo_almacen),
  FOREIGN KEY (pk_id_proveedor) REFERENCES tbl_Proveedor(pk_id_proveedor)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_CuentaPorPagar`(
  pk_id_cuentaporpagar INT not null,
  pk_id_almacen INT not null ,
  pk_id_proveedor INT not null,
  pk_id_factura INT not null,
  fk_id_tipopago INT not null,
  fk_id_moneda INT not null,
  fk_id_conceptocuentaporpagar INT not null,
  cambio_moneda_cuentaporpagar float not null,
  fecha_emision_cuentaporpagar DATE not null,
  fecha_movimiento_cuentaporpagar DATE not null,
  saldo_pago_cuentaporpagar float not null,
  monto_pago_cuentaporpagar float not null,
  estado_cuentaporpagar tinyint default 0,
  PRIMARY KEY (pk_id_cuentaporpagar,pk_id_almacen,pk_id_proveedor,pk_id_factura),
  FOREIGN KEY (fk_id_tipopago) REFERENCES tbl_TipoPago(pk_id_tipopago),
  FOREIGN KEY (pk_id_almacen) REFERENCES tbl_almacen(codigo_almacen),
  FOREIGN KEY (pk_id_proveedor) REFERENCES tbl_Proveedor(pk_id_proveedor),
  FOREIGN KEY (fk_id_moneda) REFERENCES tbl_Moneda(pk_id_moneda),
  FOREIGN KEY (fk_id_conceptocuentaporpagar) REFERENCES tbl_ConceptoCuentaPorPagar(pk_id_conceptocuentaporpagar),
  FOREIGN KEY (pk_id_factura) REFERENCES tbl_factura(pk_id_factura)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*-----------Ventas----------------*/

CREATE TABLE IF NOT EXISTS `tbl_estados` (
  `Pk_id_estados` INT NOT NULL,
  `Descripcion_estados` VARCHAR(45) NOT NULL,
  `restriccion_estados` INT NOT NULL,
  PRIMARY KEY (`Pk_id_estados`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_vendedores` (
  `Pk_idVendedores` INT NOT NULL,
  `Dpi_vendedores` VARCHAR(45) NOT NULL,
  `Nombres_vendedores` VARCHAR(45) NOT NULL,
  `Apellidos_vendedores` VARCHAR(45) NOT NULL,
  `Pk_id_estados` INT NOT NULL,
  `nit_vendedores` VARCHAR(45) NOT NULL,
  `edad_vendedores` INT NOT NULL,
  PRIMARY KEY (`Pk_idVendedores`),
  CONSTRAINT `fk_estad_cl0`
    FOREIGN KEY (`Pk_id_estados`)
    REFERENCES `tbl_estados` (`Pk_id_estados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_clientes` (
  `Pk_idClientes` INT NOT NULL,
  `Dpi_clientes` VARCHAR(45) NOT NULL,
  `Nombres_clientes` VARCHAR(45) NOT NULL,
  `Apellidos_clientes` VARCHAR(45) NOT NULL,
  `FechaNac_clientes` DATE NOT NULL,
  `nit_clientes` VARCHAR(45) NOT NULL,
  `Pk_id_estados` INT NOT NULL,
  `direccion_clientes` VARCHAR(45) NOT NULL,
  `telefono_clientes` VARCHAR(45) NOT NULL,
  `Pk_idVendedores` INT NOT NULL,
  `SMesAnterior_clientes` FLOAT NOT NULL,
  `SActual_clientes` FLOAT NOT NULL,
  `CargoMes_clientes` FLOAT NOT NULL,
  `AbonosMes_clientes` FLOAT NOT NULL,
  `CargosAcumulados_clientes` FLOAT NOT NULL,
  `AbonosAcumulados_clientes` FLOAT NOT NULL,
  PRIMARY KEY (`Pk_idClientes`),
  CONSTRAINT `fk_estad_cl`
    FOREIGN KEY (`Pk_id_estados`)
    REFERENCES `tbl_estados` (`Pk_id_estados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor`
    FOREIGN KEY (`Pk_idVendedores`)
    REFERENCES `tbl_vendedores` (`Pk_idVendedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_venta` (
  `Pk_idVenta` INT NOT NULL,
  `codigo_almacen` INT NOT NULL,
  `fecha_venta` DATETIME NOT NULL,
  `Descuento_venta` FLOAT NOT NULL,
  `IVA_venta` FLOAT NOT NULL,
  `Total_venta` FLOAT NOT NULL,
  `Estado_fac_venta` VARCHAR(45) NOT NULL,
  `fecha_venci_venta` DATE NOT NULL,
  `moneda_venta` INT NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  `UUidFel_venta` VARCHAR(45) NOT NULL,
  `serieFel_venta` VARCHAR(45) NOT NULL,
  `NumeroFel_venta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Pk_idVenta`, `codigo_almacen`),
  CONSTRAINT `idcliente_v`
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `tbl_clientes` (`Pk_idClientes`),
    CONSTRAINT `fk_almacen`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_devolucion` (
  `Pk_idDevolucion` INT NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  `Fecha_devolucion` DATETIME NOT NULL,
  `Nota_cred_devolucion` INT NOT NULL,
  `No_fac_devolucion` INT NOT NULL,
  PRIMARY KEY (`Pk_idDevolucion`),
  CONSTRAINT `asdsd`
    FOREIGN KEY (`No_fac_devolucion`)
    REFERENCES `tbl_venta` (`Pk_idVenta`),
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `tbl_clientes` (`Pk_idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `tbl_pedido` (
  `Pk_idPedido` INT NOT NULL,
  `codigo_almacen` INT NOT NULL,
  `Fecha_pedido` DATETIME NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  PRIMARY KEY (`Pk_idPedido`, `codigo_almacen`),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `tbl_clientes` (`Pk_idClientes`),
	CONSTRAINT `fk_codigo_almacen`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `tbl_detalle_venta` (
  `codigo_almacen` INT NOT NULL,
  `PK_orden_detalleventa` INT NOT NULL,
  `Pk_idVenta` INT NOT NULL,
  `codigo_producto` int NOT NULL,
  `Cantidad_detalleventa` INT NOT NULL,
  `Precio_uni_detalleventa` FLOAT NOT NULL,
  `Total_detalleventa` FLOAT NOT NULL,
  `Estado_detalleventa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_almacen`, `PK_orden_detalleventa`, `Pk_idVenta`, `codigo_producto`),
  CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta`
    FOREIGN KEY (`Pk_idVenta`)
    REFERENCES `tbl_venta` (`Pk_idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_codigo_almacenes`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `tbl_cotizacion` (
  `Pk_idCotizacion` INT NOT NULL,
  `codigo_almacen` INT NOT NULL,
  `codigo_producto` INT NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  PRIMARY KEY (`Pk_idCotizacion`, `codigo_almacen`),
  CONSTRAINT `clienteCoti`
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `tbl_clientes` (`Pk_idClientes`),
    CONSTRAINT `fk_almacenes`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`),
	CONSTRAINT `fk_codigo_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `tbl_detalle_Cotizacion` (
  `Pk_detallecotizacion` INT NOT NULL,
  `Pk_idCotizacion` INT NOT NULL,
  `codigo_producto` INT NOT NULL,
  `Cantidad_detallecotizacion` INT NOT NULL,
  `Precio_uni_detallecotizacion` FLOAT NOT NULL,
  `Total_detalle_detallecotizacion` FLOAT NOT NULL,
  `Estado_detallecotizacion` INT NOT NULL,
  PRIMARY KEY (`Pk_detallecotizacion`),
  CONSTRAINT `fk_cotizacion`
    FOREIGN KEY (`Pk_idCotizacion`)
    REFERENCES `tbl_cotizacion` (`Pk_idCotizacion`),
    CONSTRAINT `fk_codigo_productos`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `tbl_detalle_pedido` (
  `Pk_detalle_pedido` INT NOT NULL,
  `Pk_idPedido` INT NOT NULL,
  `codigo_producto` INT NOT NULL,
  `Cantidad_detallepedido` INT NOT NULL,
  `Precio_uni_detallepedido` FLOAT NOT NULL,
  `Total_detallepedido` FLOAT NOT NULL,
  `Estado_detallepedido` INT NOT NULL,
  PRIMARY KEY (`Pk_detalle_pedido`),
  CONSTRAINT `fk_pedido`
    FOREIGN KEY (`Pk_idPedido`)
    REFERENCES `tbl_pedido` (`Pk_idPedido`),
    CONSTRAINT `fk_productos`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*------------------------Cuentas por Cobrar-----------------*/


CREATE TABLE if not exists `tbl_ConceptoCuentaPorCobrar`(
pk_id_concepto_cxc int not null primary key,
descripcion_concepto_cxc varchar(75) not null,
tipoconcepto_concepto_cxc varchar(15) not null,
estado_concepto_cxc tinyint default 0 not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_CuentaPorCobrar`(
  pk_comprobante_cxc INT not null primary key,
  fk_id_factura INT not null,
  fk_id_almacen_venta INT not null,
  fk_id_almacen_pago INT not null,
  fk_id_cliente INT not null,
  fk_id_tipoPago INT not null,
  fk_id_moneda INT not null,
  fk_id_concepto_cxc INT not null,
  fecha_emision_cxc DATE not null,
  fecha_pago_cxc DATE default null,
  cambio_moneda_pago_cxc float not null default 0,
  monto_cobro_cxc float not null default 0,
  monto_pago_cxc float not null default 0,
  estado_cxc tinyint default 0,
  key(fk_id_almacen_pago, fk_id_cliente),
  FOREIGN KEY (fk_id_factura) REFERENCES tbl_venta(Pk_idVenta),
  FOREIGN KEY (fk_id_almacen_venta) REFERENCES tbl_almacen(codigo_almacen),
  FOREIGN KEY (fk_id_almacen_pago) REFERENCES tbl_almacen(codigo_almacen),
  FOREIGN KEY (fk_id_cliente) REFERENCES tbl_clientes(Pk_idClientes),
  FOREIGN KEY (fk_id_tipoPago) REFERENCES tbl_TipoPago(pk_id_tipopago),
  FOREIGN KEY (fk_id_moneda) REFERENCES tbl_Moneda(pk_id_moneda),
  FOREIGN KEY (fk_id_concepto_cxc) REFERENCES tbl_ConceptoCuentaPorCobrar(pk_id_concepto_cxc)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;