INSERT INTO `tbl_moneda` (`pk_id_moneda`, `nombre_moneda`, `simbolo_moneda`, `cambio_moneda`, `estado_moneda`) VALUES 
('1', 'Quetzal', 'Q', '1', '1'), 
('2', 'Dolar', '$', '7.72', '1'), 
('3', 'Peso Mexicano', '$MX', '0.36', '1');

INSERT INTO `tbl_tipopago` (`pk_id_tipopago`, `nombre_tipopago`, `estado_tipopago`) VALUES 
('1', 'Efectivo', '1'), 
('2', 'Tarjeta Credito', '1'), 
('3', 'Tarjeta Debito', '1'), 
('4', 'Paypal', '0');

INSERT INTO `tbl_conceptocuentaporcobrar` (`pk_id_concepto_cxc`, `descripcion_concepto_cxc`, `tipoconcepto_concepto_cxc`, `estado_concepto_cxc`) VALUES 
('1', 'Cobro de factura', '1', '0');