use sig;
/*--------------------SEGURIDAD---------------*/
-- -----MODULOS

INSERT INTO `tbl_modulos` VALUES
('1000', 'SEGURIDAD', 'Seguridad', 1),
('2000', 'VENTAS', 'ventas', 1),
('3000', 'COMPRAS', 'compras', 1),
('4000', 'CxC', 'CxC', 1),
('5000', 'CxP', 'CxP', 1),
('6000','INVENTARIO','inventario',1)
;

-- -----APLICACIONES
INSERT INTO `tbl_aplicaciones` VALUES
('1000', 'MDI SEGURIDAD', 'PARA SEGURIDAD', '1'),
('1001', 'Mant. Usuario', 'PARA SEGURIDAD', '1'),
('1002', 'Mant. Aplicación', 'PARA SEGURIDAD', '1'),
('1003', 'Mant. Modulo', 'PARA SEGURIDAD', '1'),
('1004', 'Mant. Perfil', 'PARA SEGURIDAD', '1'),
('1101', 'Asign. Modulo Aplicacion', 'PARA SEGURIDAD', '1'),
('1102', 'Asign. Aplicacion Perfil', 'PARA SEGURIDAD', '1'),
('1103', 'Asign. Perfil Usuario', 'PARA SEGURIDAD', '1'),
('1201', 'Pcs. Cambio Contraseña', 'PARA SEGURIDAD', '1'),
('1301', 'Pcs. BITACORA', 'PARA SEGURIDAD', '1'),
('2000', 'MDI VENTAS', 'PARA VENTAS', '1'),
('2001', 'Mant. Vendedores', 'PARA VENTAS', '1'),
('2002', 'Mant. Politicas', 'PARA VENTAS', '1'),
('2003', 'Mant. Cotizaciones', 'PARA VENTAS', '1'),
('2004', 'Mant. Pedidos', 'PARA VENTAS', '1'),
('2101', 'Pcs. Clientes', 'PARA VENTAS', '1'),
('2102', 'Pcs. Facturas', 'PARA VENTAS', '1'),
('2103', 'Pcs. Devoluciones', 'PARA VENTAS', '1'),
('2104', 'Pcs. Notas de credito', 'PARA VENTAS', '1'),
('2105', 'Pcs. Venta', 'PARA VENTAS', '1'),
('2201', 'Rep. Clientes', 'PARA VENTAS', '1'),
('2202', 'Rep. Facturas', 'PARA VENTAS', '1'),
('2203', 'Rep. Devoluciones', 'PARA VENTAS', '1'),
('2204', 'Rep. Ventas', 'PARA VENTAS', '1'),
('2205', 'Rep. Cotizaciones', 'PARA VENTAS', '1'),
('2206', 'Rep. Pedidos', 'PARA VENTAS', '1'),
('3000', 'MDI COMPRAS', 'PARA COMPRAS', '1'),
('3001', 'Mant. Orden de compra', 'PARA COMPRAS', '1'),
('3101', 'Pcs compras', 'PARA COMPRAS', '1'),
('3102', 'Pcs devoluciones', 'PARA COMPRAS', '1'),
('3103', 'Pcs facturas', 'PARA COMPRAS', '1'),
('3201', 'Rep. compras', 'PARA COMPRAS', '1'),
('3202', 'Rep. devoluciones', 'PARA COMPRAS', '1'),
('3203', 'Rep. facturas', 'PARA COMPRAS', '1'),
('3204', 'Rep. orden de compras', 'PARA COMPRAS', '1'),
('4000', 'MDI CxC', 'PARA CxC', '1'),
('4001', 'Mant. Moneda', 'PARA CxC', '1'),
('4002', 'Mant. Tipo Pago', 'PARA CxC', '1'),
('4003', 'Mant. Concepto por Cobrar', 'PARA CxC', '1'),
('4101', 'Pcs. Pago de cliente', 'PARA CxC', '1'),
('4102', 'Pcs. Balance General de Cliente', 'PARA CxC', '1'),
('4201', 'Rep. Estado de Cuenta', 'PARA CxC', '1'),
('4202', 'Rep. Estado de Cuenta Cardex', 'PARA CxC', '1'),
('4203', 'Rep. Balance de clientes', 'PARA CxC', '1'),
('5000', 'MDI CxP', 'PARA CxP', '1'),
('5001', 'Mant. Proveedor', 'PARA CxP', '1'),
('5002', 'Mant. Moneda', 'PARA CxP', '1'),
('5003', 'Mant. Tipo Pago', 'PARA CxP', '1'),
('5004', 'Mant. Concepto por Pagar', 'PARA CxP', '1'),
('5101', 'Pcs. Movimineto por pagar', 'PARA CxP', '1'),
('5102', 'Pcs. Balance Saldos', 'PARA CxP', '1'),
('5103', 'Pcs. Ingreso Factura', 'PARA CxP', '1'),
('5201', 'Rep. Estado de Cuenta', 'PARA CxP', '1'),
('5202', 'Rep. Antiguedad de saldos', 'PARA CxP', '1'),
('5203', 'Rep. Cardex', 'PARA CxP', '1'),
('6000', 'MDI INVENTARIO', 'PARA INVENTARIO', '1'),
('6001', 'Mant. Producto', 'PARA INVENTARIO', '1'),
('6002', 'Mant. Linea', 'PARA INVENTARIO', '1'),
('6003', 'Mant. Marca', 'PARA INVENTARIO', '1'),
('6004', 'Mant. Almacen', 'PARA INVENTARIO', '1')
;

-- -----USUARIOS
INSERT INTO `tbl_usuarios` VALUES
('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A='),
('2', 'seguridad', 'seguridad', 'seguridad', 'X9yc1/l1b2A=', 'seguridad@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A='),
('3', 'ventas', 'ventas', 'ventas', 'X9yc1/l1b2A=', 'ventas@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A='),
('4', 'compras', 'compras', 'compras', 'X9yc1/l1b2A=', 'compras@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A='),
('5', 'cxc', 'cxc', 'cxc', 'X9yc1/l1b2A=', 'cxc@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A='),
('6', 'cxp', 'cxp', 'cxp', 'X9yc1/l1b2A=', 'cxp@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A='),
('7', 'inventario', 'inventario', 'inventario', 'X9yc1/l1b2A=', 'inventario@gmail.com', '1', 'COLOR FAVORITO', 'X9yc1/l1b2A=')
;

-- -----PERFILES
INSERT INTO `tbl_perfiles` VALUES
('1', 'ADMINISTRADOR', 'contiene todos los permisos del programa', 1),
('2', 'SEGURIDAD', 'contiene todos los permisos de seguridad', 1),
('3', 'VENTAS', 'contiene todos los permisos de ventas', 1),
('4', 'COMPRAS', 'contiene todos los permisos de compras', 1),
('5', 'CxC', 'contiene todos los permisos de CxC', 1),
('6', 'CxP', 'contiene todos los permisos de CxP', 1),
('7', 'INVENTARIO', 'contiene todos los permisos de CxP', 1)
;

-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES
('1000', '1000'),
('1000', '1001'),
('1000', '1002'),
('1000', '1003'),
('1000', '1004'),
('1000', '1102'),
('1000', '1103'),
('1000', '1201'),
('1000', '1301'),
('2000', '2000'),
('2000', '2001'),
('2000', '2002'),
('2000', '2003'),
('2000', '2004'),
('2000', '2101'),
('2000', '2102'),
('2000', '2103'),
('2000', '2104'),
('2000', '2105'),
('2000', '2201'),
('2000', '2202'),
('2000', '2203'),
('2000', '2204'),
('2000', '2205'),
('2000', '2206'),
('3000', '3000'),
('3000', '3001'),
('3000', '3101'),
('3000', '3102'),
('3000', '3103'),
('3000', '3201'),
('3000', '3202'),
('3000', '3203'),
('3000', '3204'),
('4000', '4000'),
('4000', '4001'),
('4000', '4002'),
('4000', '4003'),
('4000', '4101'),
('4000', '4102'),
('4000', '4201'),
('4000', '4202'),
('4000', '4203'),
('5000', '5000'),
('5000', '5001'),
('5000', '5002'),
('5000', '5003'),
('5000', '5004'),
('5000', '5101'),
('5000', '5102'),
('5000', '5103'),
('5000', '5201'),
('5000', '5202'),
('5000', '5203'),
('6000', '6000'),
('6000', '6001'),
('6000', '6002'),
('6000', '6003'),
('6000', '6004')
;

-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES
('1', '1000', '1', '1', '1', '1', '1'),
('1', '1001', '1', '1', '1', '1', '1'),
('1', '1002', '1', '1', '1', '1', '1'),
('1', '1003', '1', '1', '1', '1', '1'),
('1', '1004', '1', '1', '1', '1', '1'),
('1', '1101', '1', '1', '1', '1', '1'),
('1', '1102', '1', '1', '1', '1', '1'),
('1', '1103', '1', '1', '1', '1', '1'),
('1', '1201', '1', '1', '1', '1', '1'),
('1', '1301', '1', '1', '1', '1', '1'),
('1', '2000', '1', '1', '1', '1', '1'),
('1', '2001', '1', '1', '1', '1', '1'),
('1', '2002', '1', '1', '1', '1', '1'),
('1', '2003', '1', '1', '1', '1', '1'),
('1', '2004', '1', '1', '1', '1', '1'),
('1', '2101', '1', '1', '1', '1', '1'),
('1', '2102', '1', '1', '1', '1', '1'),
('1', '2103', '1', '1', '1', '1', '1'),
('1', '2104', '1', '1', '1', '1', '1'),
('1', '2105', '1', '1', '1', '1', '1'),
('1', '2201', '1', '1', '1', '1', '1'),
('1', '2202', '1', '1', '1', '1', '1'),
('1', '2203', '1', '1', '1', '1', '1'),
('1', '2204', '1', '1', '1', '1', '1'),
('1', '2205', '1', '1', '1', '1', '1'),
('1', '2206', '1', '1', '1', '1', '1'),
('1', '3000', '1', '1', '1', '1', '1'),
('1', '3001', '1', '1', '1', '1', '1'),
('1', '3101', '1', '1', '1', '1', '1'),
('1', '3102', '1', '1', '1', '1', '1'),
('1', '3103', '1', '1', '1', '1', '1'),
('1', '3201', '1', '1', '1', '1', '1'),
('1', '3202', '1', '1', '1', '1', '1'),
('1', '3203', '1', '1', '1', '1', '1'),
('1', '3204', '1', '1', '1', '1', '1'),
('1', '4000', '1', '1', '1', '1', '1'),
('1', '4001', '1', '1', '1', '1', '1'),
('1', '4002', '1', '1', '1', '1', '1'),
('1', '4003', '1', '1', '1', '1', '1'),
('1', '4101', '1', '1', '1', '1', '1'),
('1', '4102', '1', '1', '1', '1', '1'),
('1', '4201', '1', '1', '1', '1', '1'),
('1', '4202', '1', '1', '1', '1', '1'),
('1', '4203', '1', '1', '1', '1', '1'),
('1', '5000', '1', '1', '1', '1', '1'),
('1', '5001', '1', '1', '1', '1', '1'),
('1', '5002', '1', '1', '1', '1', '1'),
('1', '5003', '1', '1', '1', '1', '1'),
('1', '5004', '1', '1', '1', '1', '1'),
('1', '5101', '1', '1', '1', '1', '1'),
('1', '5102', '1', '1', '1', '1', '1'),
('1', '5103', '1', '1', '1', '1', '1'),
('1', '5201', '1', '1', '1', '1', '1'),
('1', '5202', '1', '1', '1', '1', '1'),
('1', '5203', '1', '1', '1', '1', '1'),
('1', '6000', '1', '1', '1', '1', '1'),
('1', '6001', '1', '1', '1', '1', '1'),
('1', '6002', '1', '1', '1', '1', '1'),
('1', '6003', '1', '1', '1', '1', '1'),
('1', '6004', '1', '1', '1', '1', '1'),
('2', '1000', '1', '1', '1', '1', '1'),
('2', '1001', '1', '1', '1', '1', '1'),
('2', '1002', '1', '1', '1', '1', '1'),
('2', '1003', '1', '1', '1', '1', '1'),
('2', '1004', '1', '1', '1', '1', '1'),
('2', '1101', '1', '1', '1', '1', '1'),
('2', '1102', '1', '1', '1', '1', '1'),
('2', '1103', '1', '1', '1', '1', '1'),
('2', '1201', '1', '1', '1', '1', '1'),
('2', '1301', '1', '1', '1', '1', '1'),
('3', '2000', '1', '1', '1', '1', '1'),
('3', '2001', '1', '1', '1', '1', '1'),
('3', '2002', '1', '1', '1', '1', '1'),
('3', '2003', '1', '1', '1', '1', '1'),
('3', '2004', '1', '1', '1', '1', '1'),
('3', '2101', '1', '1', '1', '1', '1'),
('3', '2102', '1', '1', '1', '1', '1'),
('3', '2103', '1', '1', '1', '1', '1'),
('3', '2104', '1', '1', '1', '1', '1'),
('3', '2105', '1', '1', '1', '1', '1'),
('3', '2201', '1', '1', '1', '1', '1'),
('3', '2202', '1', '1', '1', '1', '1'),
('3', '2203', '1', '1', '1', '1', '1'),
('3', '2204', '1', '1', '1', '1', '1'),
('3', '2205', '1', '1', '1', '1', '1'),
('3', '2206', '1', '1', '1', '1', '1'),
('4', '3000', '1', '1', '1', '1', '1'),
('4', '3001', '1', '1', '1', '1', '1'),
('4', '3101', '1', '1', '1', '1', '1'),
('4', '3102', '1', '1', '1', '1', '1'),
('4', '3103', '1', '1', '1', '1', '1'),
('4', '3201', '1', '1', '1', '1', '1'),
('4', '3202', '1', '1', '1', '1', '1'),
('4', '3203', '1', '1', '1', '1', '1'),
('4', '3204', '1', '1', '1', '1', '1'),
('5', '4000', '1', '1', '1', '1', '1'),
('5', '4001', '1', '1', '1', '1', '1'),
('5', '4002', '1', '1', '1', '1', '1'),
('5', '4003', '1', '1', '1', '1', '1'),
('5', '4101', '1', '1', '1', '1', '1'),
('5', '4102', '1', '1', '1', '1', '1'),
('5', '4201', '1', '1', '1', '1', '1'),
('5', '4202', '1', '1', '1', '1', '1'),
('5', '4203', '1', '1', '1', '1', '1'),
('6', '5000', '1', '1', '1', '1', '1'),
('6', '5001', '1', '1', '1', '1', '1'),
('6', '5002', '1', '1', '1', '1', '1'),
('6', '5003', '1', '1', '1', '1', '1'),
('6', '5004', '1', '1', '1', '1', '1'),
('6', '5101', '1', '1', '1', '1', '1'),
('6', '5102', '1', '1', '1', '1', '1'),
('6', '5103', '1', '1', '1', '1', '1'),
('6', '5201', '1', '1', '1', '1', '1'),
('6', '5202', '1', '1', '1', '1', '1'),
('6', '5203', '1', '1', '1', '1', '1'),
('7', '6000', '1', '1', '1', '1', '1'),
('7', '6001', '1', '1', '1', '1', '1'),
('7', '6002', '1', '1', '1', '1', '1'),
('7', '6003', '1', '1', '1', '1', '1'),
('7', '6004', '1', '1', '1', '1', '1')
;

-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7')
; 

-- ----------Reportes CxC----------
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxC\\ReportMoneda.rpt','Moneda','4001','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxC\\ReportTipoPago.rpt','Tipo de Pago','4002','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxC\\ReportConceptoCxC.rpt','Concepto de Cobro','4003','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxC\\EstadoCuenta.rpt','Estado de Cuenta','4201','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxC\\EstadoCuentaCardex.rpt','Estado de CuentaCardex','4202','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxC\\BalanceDeClientes.rpt','Estado de CuentaCardex','4203','visible');

-- --------------Reportes CxP------------
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\ReporteProveedor.rpt','ReporteProveedor','5001','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\ReporteMoneda.rpt','ReporteMoneda','5002','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\ReporteTipoPago.rpt','ReporteTipoPago','5003','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\ConceptoCXP.rpt','ReporteConceptoPorPagar','5004','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\EstadodeCuenta.rpt','ReporteEstadoCuentaProveedor','5201','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\ReporteBalance.rpt','ReporteBalance','5202','visible');
insert into tbl_regreporteria(ruta, nombre_archivo, aplicacion, estado) values ('Modulos\\CxP\\CardexProveedor.rpt','ReporteCardexProveedor','5203','visible');

INSERT INTO `tbl_almacen` (`pk_codigo_almacen`, `nombre_almacen`, `estatus_almacen`) VALUES 
('1', 'la bendición', '1'),
('2', 'la comunidad', '1'),(
'3', 'la soledad', '1');

INSERT INTO `tbl_moneda` (`pk_id_moneda`, `nombre_moneda`, `simbolo_moneda`, `cambio_moneda`, `estado_moneda`) VALUES 
('1', 'Quetzal', 'Q', '1', '1'), 
('2', 'Dolar', '$', '7.72', '1'), 
('3', 'Peso Mexicano', '$MX', '0.36', '1');

INSERT INTO `tbl_tipopago` (`pk_id_tipopago`, `nombre_tipopago`, `estado_tipopago`) VALUES 
('1', 'Efectivo', '1'), 
('2', 'Tarjeta Credito', '1'), 
('3', 'Tarjeta Debito', '1');

INSERT INTO `tbl_estados` (`Pk_id_estados`, `Descripcion_estados`, `restriccion_estados`) VALUES ('1', 'activo', '1');
INSERT INTO `tbl_vendedores` (`Pk_idVendedores`, `Dpi_vendedores`, `Nombres_vendedores`, `Apellidos_vendedores`, `Pk_id_estados`, `nit_vendedores`, `edad_vendedores`) VALUES ('1', '123456789', 'juan', 'perez', '1', '123456789', '18');
INSERT INTO `tbl_clientes` (`Pk_idClientes`, `Dpi_clientes`, `Nombres_clientes`, `Apellidos_clientes`, `FechaNac_clientes`, `nit_clientes`, `Pk_id_estados`, `direccion_clientes`, `telefono_clientes`, `Pk_idVendedores`, `SMesAnterior_clientes`, `SActual_clientes`, `CargoMes_clientes`, `AbonosMes_clientes`, `CargosAcumulados_clientes`, `AbonosAcumulados_clientes`) VALUES ('1', '123456788', 'juan', 'lee', '2001-05-01', '12345678', '1', 'Guatemala', '12345678', '1', '0', '1000', '1000', '0', '0', '0');
INSERT INTO `tbl_venta` (`Pk_idVenta`, `codigo_almacen`, `fecha_venta`, `Descuento_venta`, `IVA_venta`, `Total_venta`, `Estado_fac_venta`, `fecha_venci_venta`, `moneda_venta`, `Pk_idClientes`, `UUidFel_venta`, `serieFel_venta`, `NumeroFel_venta`) VALUES ('1', '1', '2023-05-19 13:21:19', '0', '0', '1000', '1', '2023-08-19', '1', '1', '1', '1', '1');


INSERT INTO `tbl_conceptocuentaporcobrar` (`pk_id_concepto_cxc`, `descripcion_concepto_cxc`, `tipoconcepto_concepto_cxc`, `estado_concepto_cxc`) VALUES 
('1', 'Cobro de factura', '1', '1');
