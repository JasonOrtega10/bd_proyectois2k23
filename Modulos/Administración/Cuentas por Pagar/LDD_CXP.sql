create database if not exists `CXP`;
use `CXP`;


create table if not exists `tbl_proveedor`(
pk_id_proveedor int not null,
nombre_proveedor varchar(50) not null,
direccion_proveedor varchar(50) not null,
telefono_proveedor int not null,
correo_proveedor varchar(50) not null,
rubro_proveedor varchar(100) not null,
saldo_mes_anterior_balanceproveedores FLOAT DEFAULT 0,
saldo_actual_proveedor FLOAT, 
cargo_del_mes_proveedor FLOAT, 
abonos_del_mes_proveedor FLOAT,  
cargos_acumulados_proveedor FLOAT,
abonos_acumulados_proveedors FLOAT,
estado_proveedor tinyint not null default 0,
primary key(pk_id_proveedor)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists `tbl_Moneda`(
	pk_id_moneda int primary key auto_increment,
	nombre_moneda VARCHAR(50) not null,
	simbolo_moneda VARCHAR(5) not null,
	cambio_moneda float not null,
    estado_moneda tinyint not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_TipoPago` (
	pk_id_tipopago INT PRIMARY KEY auto_increment,
	nombre_tipopago VARCHAR(50) not null,
	estado_tipopago tinyint not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_ConceptoCuentaPorPagar`(
pk_id_conceptocuentaporpagar int not null,
descripcion_conceptocuentaporpagar varchar(50) not null,
tipoconcepto_conceptocuentaporpagar varchar(15) not null,
estado_conceptocuentaporpagar tinyint default 0 not null,
primary key(pk_id_conceptocuentaporpagar)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*CREATE TABLE if not exists `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_compras` int DEFAULT NULL,
  `total` FLOAT,
  `estatus` TINYINT,
  PRIMARY KEY (`id_factura`),
  KEY `id_compras_idx` (`id_compras`),
  CONSTRAINT `id_compras` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id_compras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;*/

CREATE TABLE if not exists `factura` (
`id_factura` int not null,
primary key(id_factura)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_CuentaPorPagar`(
  pk_id_cuentaporpagar INT PRIMARY KEY,
  fk_id_tipopago INT not null,
  fk_id_moneda INT not null,
  fk_id_factura INT not null,
  fk_id_conceptocuentaporpagar INT not null,
  fecha_movimiento_cuentaporpagar DATE not null,
  monto_pago_cuentaporpagar float not null,
  FOREIGN KEY (fk_id_tipopago) REFERENCES tbl_TipoPago(pk_id_tipopago),
  FOREIGN KEY (fk_id_moneda) REFERENCES tbl_Moneda(pk_id_moneda),
  FOREIGN KEY (fk_id_conceptocuentaporpagar) REFERENCES tbl_ConceptoCuentaPorPagar(pk_id_conceptocuentaporpagar),
  FOREIGN KEY (fk_id_factura) REFERENCES factura(id_factura)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
