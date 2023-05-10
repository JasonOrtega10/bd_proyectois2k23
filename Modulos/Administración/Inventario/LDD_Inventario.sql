CREATE TABLE tbl_almacen
(
	codigo_almacen int PRIMARY KEY,
    nombre_almacen VARCHAR(60),
    estatus_almacen VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE  tbl_linea
(
	codigo_linea int PRIMARY KEY,
    nombre_linea VARCHAR(60),
    estatus_linea VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

CREATE TABLE tbl_marca
(
	codigo_marca int PRIMARY KEY,
    nombre_marca VARCHAR(60),
    estatus_marca VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

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

CREATE TABLE tbl_existencia
(
    codigo_almacen int,
    codigo_producto int,
    saldo_existencia FLOAT(10,2),
    PRIMARY KEY (codigo_almacen, codigo_producto),
	FOREIGN KEY (codigo_almacen) REFERENCES tbl_almacen(codigo_almacen),
    FOREIGN KEY (codigo_producto) REFERENCES tbl_producto(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1