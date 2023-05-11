
-- -----------------------------------------------------
-- Schema ModuloVentas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ModuloVentas` ;

-- -----------------------------------------------------
-- Schema ModuloVentas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ModuloVentas` DEFAULT CHARACTER SET utf8 ;
USE `ModuloVentas` ;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_estados` (
  `Pk_id_estados` INT NOT NULL,
  `Descripcion_estados` VARCHAR(45) NOT NULL,
  `restriccion_estados` INT NOT NULL,
  PRIMARY KEY (`Pk_id_estados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_vendedores` (
  `Pk_idVendedores` INT NOT NULL,
  `Dpi_vendedores` VARCHAR(45) NOT NULL,
  `Nombres_vendedores` VARCHAR(45) NOT NULL,
  `Apellidos_vendedores` VARCHAR(45) NOT NULL,
  `estado_vendedores` INT NOT NULL,
  `nit_vendedores` VARCHAR(45) NOT NULL,
  `edad_vendedores` INT NOT NULL,
  PRIMARY KEY (`Pk_idVendedores`),
  CONSTRAINT `fk_estad_cl0`
    FOREIGN KEY (`estado_vendedores`)
    REFERENCES `ModuloVentas`.`tbl_estados` (`Pk_id_estados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_clientes` (
  `Pk_idClientes` INT NOT NULL,
  `Dpi_clientes` VARCHAR(45) NOT NULL,
  `Nombres_clientes` VARCHAR(45) NOT NULL,
  `Apellidos_clientes` VARCHAR(45) NOT NULL,
  `FechaNac_clientes` DATE NOT NULL,
  `nit_clientes` VARCHAR(45) NOT NULL,
  `estado_clientes` INT NOT NULL,
  `direccion_clientes` VARCHAR(45) NOT NULL,
  `telefono_clientes` VARCHAR(45) NOT NULL,
  `Pk_idVendedores` INT NOT NULL,
  `SMesAnterior_clientes` FLOAT NOT NULL,
  `SActual_clientes` FLOAT NOT NULL,
  `CargoMes_clientes` FLOAT NOT NULL,
  `AbonosMes_clientes` FLOAT NOT NULL,
  `CargosAcumulados_clientes` FLOAT NOT NULL,
  `AbonosAcumulados_clientes` FLOAT NOT NULL,
  PRIMARY KEY (`Pk_idClientes`),
  CONSTRAINT `fk_estad_cl`
    FOREIGN KEY (`estado_clientes`)
    REFERENCES `ModuloVentas`.`tbl_estados` (`Pk_id_estados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor`
    FOREIGN KEY (`Pk_idVendedores`)
    REFERENCES `ModuloVentas`.`tbl_vendedores` (`Pk_idVendedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_venta` (
  `Pk_idVenta` INT NOT NULL,
  `codigo_almacen` VARCHAR(5) NOT NULL,
  `fecha_venta` DATETIME NOT NULL,
  `Descuento_venta` FLOAT NOT NULL,
  `IVA_venta` FLOAT NOT NULL,
  `Total_venta` FLOAT NOT NULL,
  `Estado_fac_venta` VARCHAR(45) NOT NULL,
  `fecha_venci_venta` DATE NOT NULL,
  `moneda_venta` INT NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  PRIMARY KEY (`Pk_idVenta`, `Almacen_venta`),
  CONSTRAINT `idcliente_v`
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `ModuloVentas`.`tbl_clientes` (`Pk_idClientes`),
    CONSTRAINT `fk_almacen`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_devolucion` (
  `Pk_idDevolucion` INT NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  `Fecha_devolucion` DATETIME NOT NULL,
  `Nota_cred_devolucion` INT NOT NULL,
  `No_fac_devolucion` INT NOT NULL,
  PRIMARY KEY (`Pk_idDevolucion`),
  CONSTRAINT `asdsd`
    FOREIGN KEY (`No_fac_devolucion`)
    REFERENCES `ModuloVentas`.`tbl_venta` (`Pk_idVenta`),
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `ModuloVentas`.`tbl_clientes` (`Pk_idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_pedido` (
  `Pk_idPedido` INT NOT NULL,
  `codigo_almacen` VARCHAR(5) NOT NULL,
  `Fecha_pedido` DATETIME NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  PRIMARY KEY (`Pk_idPedido`, `codigo_almacen`),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `ModuloVentas`.`tbl_clientes` (`Pk_idClientes`),
	CONSTRAINT `fk_almacen`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_detalle_venta` (
  `codigo_almacen` VARCHAR(5) NOT NULL,
  `PK_orden_detalleventa` INT NOT NULL,
  `Pk_idVenta` INT NOT NULL,
  `codigo_producto` VARCHAR(18) NOT NULL,
  `Cantidad_detalleventa` INT NOT NULL,
  `Precio_uni_detalleventa` FLOAT NOT NULL,
  `Total_detalleventa` FLOAT NOT NULL,
  `Estado_detalleventa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_almacen`, `PK_orden_detalleventa`, `Pk_idVenta`, `codigo_producto`),
  CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta`
    FOREIGN KEY (`Pk_idVenta`)
    REFERENCES `ModuloVentas`.`tbl_venta` (`Pk_idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_almacen`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_cotizacion` (
  `Pk_idCotizacion` INT NOT NULL,
  `codigo_almacen` VARCHAR(5) NOT NULL,
  `codigo_producto` VARCHAR(18) NOT NULL,
  `Pk_idClientes` INT NOT NULL,
  PRIMARY KEY (`Pk_idCotizacion`, `codigo_almacen`),
  CONSTRAINT `clienteCoti`
    FOREIGN KEY (`Pk_idClientes`)
    REFERENCES `ModuloVentas`.`tbl_clientes` (`Pk_idClientes`),
    CONSTRAINT `fk_almacen`
    FOREIGN KEY (`codigo_almacen`)
    REFERENCES `tbl_almacen` (`codigo_almacen`),
	CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_detalle_Cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_detalle_Cotizacion` (
  `Pk_detallecotizacion` INT NOT NULL,
  `Pk_idCotizacion` INT NOT NULL,
  `codigo_producto` VARCHAR(18),
  `Cantidad_detallecotizacion` INT NOT NULL,
  `Precio_uni_detallecotizacion` FLOAT NOT NULL,
  `Total_detalle_detallecotizacion` FLOAT NOT NULL,
  `Estado_detallecotizacion` INT NOT NULL,
  PRIMARY KEY (`Pk_detallecotizacion`),
  CONSTRAINT `fk_cotizacion`
    FOREIGN KEY (`Pk_idCotizacion`)
    REFERENCES `ModuloVentas`.`tbl_cotizacion` (`Pk_idCotizacion`),
    CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ModuloVentas`.`tbl_detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ModuloVentas`.`tbl_detalle_pedido` (
  `Pk_detalle_pedido` INT NOT NULL,
  `Pk_idPedido` INT NOT NULL,
  `codigo_producto` VARCHAR(18) NOT NULL,
  `Cantidad_detallepedido` INT NOT NULL,
  `Precio_uni_detallepedido` FLOAT NOT NULL,
  `Total_detallepedido` FLOAT NOT NULL,
  `Estado_detallepedido` INT NOT NULL,
  PRIMARY KEY (`Pk_detalle_pedido`),
  CONSTRAINT `fk_pedido`
    FOREIGN KEY (`Pk_idPedido`)
    REFERENCES `ModuloVentas`.`tbl_pedido` (`Pk_idPedido`),
    CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo_producto`)
    REFERENCES `tbl_producto` (`codigo_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
