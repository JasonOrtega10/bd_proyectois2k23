create database if not exists `colchoneria`;
use `colchoneria`;

create table if not exists `tbl_Moneda`(
	pk_id_moneda int primary key auto_increment,
	nombre_moneda VARCHAR(50) not null,
	simbolo_moneda VARCHAR(5) not null,
	cambio_moneda float not null,
    estado_moneda tinyint not null
);
CREATE TABLE if not exists `tbl_TipoPago` (
	pk_id_tipopago INT PRIMARY KEY auto_increment,
	nombre_tipopago VARCHAR(50) not null,
	estado_tipopago tinyint not null
);
CREATE TABLE if not exists `tbl_Mora` (
	pk_id_mora INT PRIMARY KEY auto_increment,
	mes_min_mora FLOAT not null,
	mes_max_mora FLOAT not null,
	cantidad_fija_mora FLOAT not null,
	cantidad_porcentaje_mora FLOAT not null,
	estado_tipopago tinyint not null
);
CREATE TABLE if not exists `tbl_CuentaPorCobrar`(
  id INT PRIMARY KEY auto_increment,
  fk_id_factura INT not null,
  fk_id_tipoPago INT not null,
  fk_id_moneda INT not null,
  fk_id_mora INT not null,
  fecha_pago DATE not null,
  abonado_pago float not null,
  -- FOREIGN KEY (fk_id_factura) REFERENCES EncabezadoFactura(id_encabezado),
  FOREIGN KEY (fk_id_tipoPago) REFERENCES tbl_TipoPago(pk_id_tipopago),
  FOREIGN KEY (fk_id_moneda) REFERENCES tbl_Moneda(pk_id_moneda),
  FOREIGN KEY (fk_id_mora) REFERENCES tbl_Mora(pk_id_mora)
);
