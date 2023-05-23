USE `sig`;
DROP procedure IF EXISTS `EstadoDeCuentaCliente`;
;
DELIMITER $$
USE `sig`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EstadoDeCuentaCliente`(in id_cliente int, in fecha_corte date)
BEGIN
    SELECT
        v.Pk_idVenta AS id_factura,
        v.codigo_almacen AS id_almacen_venta,
        v.fecha_venta,
        IFNULL(cc.fecha_pago_cxc, 'N/E') AS fecha_ultimo_pago,
        DATEDIFF(v.fecha_venci_venta, fecha_corte) AS dias_restantes_para_vencimiento_de_factura,
        v.Total_venta AS total_factura,
        IFNULL(SUM(cc.monto_pago_cxc), 0) AS total_abonado,
        v.Total_venta - IFNULL(SUM(cc.monto_pago_cxc), 0) AS diferencia
    FROM
        tbl_venta v
        LEFT JOIN tbl_CuentaPorCobrar cc ON cc.fk_id_factura = v.Pk_idVenta AND cc.fk_id_almacen_venta = v.codigo_almacen
    WHERE
        v.Pk_idClientes = id_cliente
    GROUP BY
        v.Pk_idVenta, v.codigo_almacen, v.fecha_venta
    ORDER BY
        v.fecha_venta ASC; 
END$$
USE `sig`;
DROP procedure IF EXISTS `EstadoDeCuentaCardex`;
;
DELIMITER $$
USE `sig`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EstadoDeCuentaCardex`(
    IN clienteID INT,
    IN fechaInicio DATE,
    IN fechaFin DATE
)
BEGIN
    SELECT
        v.Pk_idVenta AS id_factura,
        v.codigo_almacen AS id_almacen_venta,
        v.fecha_venta,
        IFNULL(cc.fecha_pago_cxc, 'N/E') AS fecha_ultimo_pago,
        DATEDIFF(v.fecha_venci_venta, fechaFin) AS dias_restantes_para_vencimiento_de_factura,
        v.Total_venta AS total_factura,
        IFNULL(SUM(cc.monto_pago_cxc), 0) AS total_abonado,
        v.Total_venta - IFNULL(SUM(cc.monto_pago_cxc), 0) AS diferencia
    FROM
        tbl_venta v
        LEFT JOIN tbl_CuentaPorCobrar cc ON cc.fk_id_factura = v.Pk_idVenta AND cc.fk_id_almacen_venta = v.codigo_almacen
    WHERE
        v.Pk_idClientes = clienteID
        AND v.fecha_venta BETWEEN fechaInicio AND fechaFin
    GROUP BY
        v.Pk_idVenta, v.codigo_almacen, v.fecha_venta
    ORDER BY
        v.fecha_venta ASC;  
END$$

DELIMITER ;
;
