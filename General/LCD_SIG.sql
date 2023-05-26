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

USE `sig`;
DROP procedure IF EXISTS `cardexProveedor`;
;
DELIMITER $$
USE `sig`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cardexProveedor`(in id_proveedor int, fecha_inicio date, fecha_fin date)
BEGIN
SELECT
    f.pk_id_factura AS Factura,
    f.pk_id_almacen AS Almacen,
    COALESCE(cp.pk_id_cuentaporpagar, 0)  AS Documento,
    f.fecha_emision_factura AS f_factura,
    CASE WHEN cp.fecha_movimiento_cuentaporpagar IS NOT NULL THEN cp.fecha_movimiento_cuentaporpagar ELSE NULL END AS f_movimiento,
    COALESCE(cp.saldo_pago_cuentaporpagar, f.total_factura) AS Deuda,
    COALESCE(cp.monto_pago_cuentaporpagar, 0) AS Ingreso,
    COALESCE(ccp.tipoconcepto_conceptocuentaporpagar, 'N/A') AS T_concepto,
	(select if (T_concepto ="abono",(sum(Deuda-Ingreso)),(sum(Deuda+Ingreso))))as diferencia
FROM
    tbl_factura f
    INNER JOIN tbl_cuentaporpagar cp ON cp.pk_id_factura = f.pk_id_factura AND cp.pk_id_almacen = f.pk_id_almacen INNER JOIN tbl_conceptocuentaporpagar ccp  ON cp.fk_id_conceptocuentaporpagar = ccp.pk_id_conceptocuentaporpagar
WHERE
    f.pk_id_proveedor = id_proveedor and cp.fecha_movimiento_cuentaporpagar <= fecha_fin and  cp.fecha_movimiento_cuentaporpagar >= fecha_inicio
ORDER BY
    f.fecha_emision_factura ASC;
END$$

DELIMITER ;
;

USE `sig`;
DROP procedure IF EXISTS `EstadoCuentaProveedor`;
;
DELIMITER $$
USE `sig`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EstadoCuentaProveedor`(in id_proveedor int, fecha_corte date)
BEGIN
SELECT
    pk_id_factura AS Factura,
    pk_id_almacen AS Almacen,
    fecha_emision_factura AS f_factura,
    total_factura as TotalFactura,
	(select if ((select ccp.tipoconcepto_conceptocuentaporpagar FROM tbl_conceptocuentaporpagar ccp inner join tbl_cuentaporpagar cp ON ccp.pk_id_conceptocuentaporpagar = cp.fk_id_conceptocuentaporpagar  inner join tbl_factura  f on cp.pk_id_proveedor = f.pk_id_proveedor order by cp.pk_id_cuentaporpagar  desc limit 1)= "cargo",
	(select sum(saldo_pago_cuentaporpagar+monto_pago_cuentaporpagar) from tbl_cuentaporpagar  where pk_id_cuentaporpagar =  (select pk_id_cuentaporpagar from tbl_cuentaporpagar where pk_id_factura = pk_id_factura order by pk_id_cuentaporpagar  desc limit 1)),
    (select sum(saldo_pago_cuentaporpagar-monto_pago_cuentaporpagar) from tbl_cuentaporpagar  where pk_id_cuentaporpagar =  (select pk_id_cuentaporpagar from tbl_cuentaporpagar where pk_id_factura = pk_id_factura order by pk_id_cuentaporpagar  desc limit 1)))) AS Deuda
FROM
    tbl_factura 
WHERE
    pk_id_proveedor = id_proveedor  and fecha_emision_factura <= fecha_corte
ORDER BY
    fecha_emision_factura ASC;
END$$

DELIMITER ;
;

