create database if not exists `CXP`;
use `CXP`;


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

CREATE TABLE tbl_almacen
(
	codigo_almacen INT PRIMARY KEY NOT NULL,
    nombre_almacen VARCHAR(60) NOT NULL,
    estatus_almacen VARCHAR(1) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

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

CREATE TABLE `tbl_factura` (
  pk_id_factura int NOT NULL,
  pk_id_almacen INT not null,
  pk_id_proveedor INT not null,
  fecha_emision_factura DATE not null,
  fecha_vencimiento_factura DATE not null,
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
