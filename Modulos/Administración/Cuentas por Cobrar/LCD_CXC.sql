USE `sig`;
DROP procedure IF EXISTS `EstadoDeCuenta`;
DROP procedure IF EXISTS `sig`.`EstadoDeCuenta`;
;
DELIMITER $$
USE `sig`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EstadoDeCuenta`(in id_cliente int)
BEGIN
SELECT
    v.Pk_idVenta AS factura,
    v.codigo_almacen AS almacen,
    COALESCE(cc.pk_comprobante_cxc, 0)  AS comprobante,
    v.fecha_venta AS f_venta,
    CASE WHEN cc.fecha_pago_cxc IS NOT NULL THEN cc.fecha_pago_cxc ELSE NULL END AS f_pago,
    COALESCE(cc.monto_cobro_cxc, v.Total_venta) AS deuda,
    COALESCE(cc.monto_pago_cxc, 0) AS abono,
    (COALESCE(cc.monto_pago_cxc, 0)- COALESCE(cc.monto_cobro_cxc, v.Total_venta)) AS diferencia,
    (SELECT COALESCE(SUM(CargoMes_clientes), 0) FROM tbl_clientes WHERE Pk_idClientes = v.Pk_idClientes) AS TotalCargos,
    (SELECT COALESCE(SUM(AbonosMes_clientes), 0) FROM tbl_clientes WHERE Pk_idClientes = v.Pk_idClientes) AS TotalAbonos
FROM
    tbl_venta v
    LEFT JOIN tbl_CuentaPorCobrar cc ON cc.fk_id_factura = v.Pk_idVenta AND cc.fk_id_almacen_venta = v.codigo_almacen
WHERE
    v.Pk_idClientes = id_cliente
ORDER BY
    v.fecha_venta and deuda ASC; 
END$$
DELIMITER ;
;
