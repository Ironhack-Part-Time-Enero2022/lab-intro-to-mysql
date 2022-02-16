-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Lab_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Lab_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lab_1` DEFAULT CHARACTER SET utf8 ;
USE `Lab_1` ;

-- -----------------------------------------------------
-- Table `Lab_1`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_1`.`vendedores` (
  `idvendedores` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `tienda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvendedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab_1`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_1`.`clientes` (
  `idclientes` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `c.p` INT(5) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab_1`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_1`.`facturas` (
  `idfacturas` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `vehiculo` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  `vendedores_idvendedores` INT NOT NULL,
  PRIMARY KEY (`idfacturas`),
  INDEX `fk_facturas_vendedores1_idx` (`vendedores_idvendedores` ASC) VISIBLE,
  INDEX `fk_facturas_clientes1_idx` (`clientes_idclientes` ASC) VISIBLE,
  CONSTRAINT `fk_facturas_vendedores1`
    FOREIGN KEY (`vendedores_idvendedores`)
    REFERENCES `Lab_1`.`vendedores` (`idvendedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `Lab_1`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab_1`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab_1`.`vehiculos` (
  `idinventario_vehiculos` VARCHAR(25) NOT NULL,
  `fabricante` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `color` VARCHAR(25) NOT NULL,
  `año` INT(4) NOT NULL,
  `facturas_idfacturas` INT NOT NULL,
  PRIMARY KEY (`idinventario_vehiculos`),
  INDEX `fk_inventario_vehiculos_facturas_idx` (`facturas_idfacturas` ASC) VISIBLE,
  CONSTRAINT `fk_inventario_vehiculos_facturas`
    FOREIGN KEY (`facturas_idfacturas`)
    REFERENCES `Lab_1`.`facturas` (`idfacturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
