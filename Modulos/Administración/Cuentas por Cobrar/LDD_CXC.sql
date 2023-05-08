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
CREATE TABLE if not exists `tbl_CuentaPorCobrar`(
  fk_id_factura INT not null primary key,
  fk_id_almacen INT not null,
  fk_id_tipoPago INT not null,
  fk_id_moneda INT not null,
  fecha_emision_cxc DATE not null,
  fecha_pago_cxc DATE default null,
  cambio_moneda_pago_cxc float not null default 0,
  monto_cobro_cxc float not null default 0,
  monto_pago_cxc float not null default 0,
  estado_cxc tinyint default 0,
  key(fk_id_almacen),
  FOREIGN KEY (fk_id_factura) REFERENCES tbl_venta(Pk_idVenta),
  -- FOREIGN KEY (fk_id_almacen) REFERENCES tbl_Almacen(pk_id_almacen),
  FOREIGN KEY (fk_id_tipoPago) REFERENCES tbl_TipoPago(pk_id_tipopago),
  FOREIGN KEY (fk_id_moneda) REFERENCES tbl_Moneda(pk_id_moneda)
);