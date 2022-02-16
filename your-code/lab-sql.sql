-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LabSQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LabSQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LabSQL` DEFAULT CHARACTER SET utf8 ;
USE `LabSQL` ;

-- -----------------------------------------------------
-- Table `LabSQL`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LabSQL`.`Clientes` (
  `idClientes` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` INT(9) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Provincia` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LabSQL`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LabSQL`.`Vendedor` (
  `idVendedor` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Tienda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LabSQL`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LabSQL`.`Factura` (
  `idFactura` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Coche` VARCHAR(45) NOT NULL,
  `Cliente` VARCHAR(45) NOT NULL,
  `Vendedor` VARCHAR(45) NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Vendedor_idVendedor` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Factura_Vendedor1_idx` (`Vendedor_idVendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `LabSQL`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Vendedor1`
    FOREIGN KEY (`Vendedor_idVendedor`)
    REFERENCES `LabSQL`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LabSQL`.`Coche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LabSQL`.`Coche` (
  `idCoche` VARCHAR(45) NOT NULL,
  `Fabricante` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Año` INT(4) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Factura_idFactura` INT NOT NULL,
  PRIMARY KEY (`idCoche`),
  INDEX `fk_Coche_Factura1_idx` (`Factura_idFactura` ASC) VISIBLE,
  CONSTRAINT `fk_Coche_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `LabSQL`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
