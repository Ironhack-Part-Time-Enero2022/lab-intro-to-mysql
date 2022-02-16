-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LABSQL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LABSQL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LABSQL` DEFAULT CHARACTER SET utf8 ;
USE `LABSQL` ;

-- -----------------------------------------------------
-- Table `LABSQL`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LABSQL`.`Cliente` (
  `idCliente` INT(1) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `provincia` VARCHAR(45) NULL,
  `telefono` INT(9) NOT NULL,
  `correo` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LABSQL`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LABSQL`.`factura` (
  `idfactura` INT NOT NULL,
  `num. factura` FLOAT NOT NULL,
  `fecha` DATE NOT NULL,
  `producto` VARCHAR(45) NOT NULL,
  `cliente` VARCHAR(45) NOT NULL,
  `vendedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfactura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LABSQL`.`Fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LABSQL`.`Fecha` (
  `idFecha` INT NOT NULL,
  `fecha_` DATE NOT NULL,
  `factura_idfactura` INT NOT NULL,
  `cliente` VARCHAR(45) NULL,
  `vendedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idFecha`, `factura_idfactura`),
  INDEX `fk_Fecha_factura1_idx` (`factura_idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_Fecha_factura1`
    FOREIGN KEY (`factura_idfactura`)
    REFERENCES `LABSQL`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LABSQL`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LABSQL`.`vendedor` (
  `idvendedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `tienda` VARCHAR(45) NOT NULL,
  `id.personal` INT NOT NULL,
  PRIMARY KEY (`idvendedor`),
  INDEX `fk_vendedor_factura1_idx` (`id.personal` ASC) VISIBLE,
  CONSTRAINT `fk_vendedor_factura1`
    FOREIGN KEY (`id.personal`)
    REFERENCES `LABSQL`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LABSQL`.`automovil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LABSQL`.`automovil` (
  `idproducto` INT NOT NULL,
  `vin` INT NOT NULL,
  `fabricante` VARCHAR(45) NOT NULL,
  `año` DATE NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `factura_idfactura` INT NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `fk_automovil_factura1_idx` (`factura_idfactura` ASC) VISIBLE,
  CONSTRAINT `fk_automovil_factura1`
    FOREIGN KEY (`factura_idfactura`)
    REFERENCES `LABSQL`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
