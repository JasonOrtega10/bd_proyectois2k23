create database if not exists `sig`;
use `sig`;

create table if not exists `tbl_Moneda`(
	pk_id_moneda int primary key,
	nombre_moneda VARCHAR(50) not null,
	simbolo_moneda VARCHAR(5) not null,
	cambio_moneda float not null,
    estado_moneda tinyint not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE if not exists `tbl_TipoPago` (
	pk_id_tipopago INT PRIMARY KEY,
	nombre_tipopago VARCHAR(50) not null,
	estado_tipopago tinyint not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

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