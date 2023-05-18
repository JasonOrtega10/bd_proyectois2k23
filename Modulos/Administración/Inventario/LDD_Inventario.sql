CREATE TABLE tbl_almacen
(
	pk_codigo_almacen int PRIMARY KEY,
    nombre_almacen VARCHAR(60),
    estatus_almacen VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE  tbl_linea
(
	pk_codigo_linea int PRIMARY KEY,
    nombre_linea VARCHAR(60),
    estatus_linea VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE tbl_marca
(
	pk_codigo_marca int PRIMARY KEY,
    nombre_marca VARCHAR(60),
    estatus_marca VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE tbl_producto
(
	pk_codigo_producto int PRIMARY KEY,
    nombre_producto VARCHAR(60),
    fk_codigo_linea int,
    fk_codigo_marca int,
    existencia_producto FLOAT(10,2),
    costouni_producto FLOAT(10,2),
    preciouni_producto FLOAT(10,2),
    fechaultentrada_marca VARCHAR(60),
    fechaultsalida_marca VARCHAR(60),
    estatus_producto VARCHAR(1),
    FOREIGN KEY (fk_codigo_linea) REFERENCES tbl_linea(pk_codigo_linea),
    FOREIGN KEY (fk_codigo_marca) REFERENCES tbl_marca(pk_codigo_marca)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE tbl_existencia
(
    fk_codigo_almacen int,
    fk_codigo_producto int,
    saldo_existencia FLOAT(10,2),
    PRIMARY KEY (codigo_almacen, codigo_producto),
	FOREIGN KEY (fk__codigo_almacen) REFERENCES tbl_almacen(pk_codigo_almacen),
    FOREIGN KEY (fk__codigo_producto) REFERENCES tbl_producto(pk_codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1