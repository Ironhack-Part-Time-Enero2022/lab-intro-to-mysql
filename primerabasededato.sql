-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coches2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches2` DEFAULT CHARACTER SET utf8 ;
USE `coches2` ;

-- -----------------------------------------------------
-- Table `coches2`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches2`.`customers` (
  `idcustomers` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `phone_number` INT(9) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `state_province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NULL,
  `postcode` INT NOT NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches2`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches2`.`salesperson` (
  `idsalesperson` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `sucursal` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsalesperson`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches2`.`newcars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches2`.`newcars` (
  `idnewcars` INT NOT NULL,
  `vin` INT NOT NULL,
  `manufacturer` DATE NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` DATE NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idnewcars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches2`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches2`.`invoice` (
  `idinvoice` INT NOT NULL,
  `number` INT NOT NULL,
  `date` DATE NOT NULL,
  `car` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `salesperson` VARCHAR(45) NOT NULL,
  `newcars_idnewcars` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  `salesperson_idsalesperson` INT NOT NULL,
  PRIMARY KEY (`idinvoice`),
  INDEX `fk_invoice_newcars1_idx` (`newcars_idnewcars` ASC) VISIBLE,
  INDEX `fk_invoice_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_invoice_salesperson1_idx` (`salesperson_idsalesperson` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_newcars1`
    FOREIGN KEY (`newcars_idnewcars`)
    REFERENCES `coches2`.`newcars` (`idnewcars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `coches2`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_salesperson1`
    FOREIGN KEY (`salesperson_idsalesperson`)
    REFERENCES `coches2`.`salesperson` (`idsalesperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches2`.`Date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches2`.`Date` (
  `idDate` INT NOT NULL,
  `date_` DATE NOT NULL,
  `invoice_idinvoice` INT NOT NULL,
  PRIMARY KEY (`idDate`),
  INDEX `fk_Date_invoice1_idx` (`invoice_idinvoice` ASC) VISIBLE,
  CONSTRAINT `fk_Date_invoice1`
    FOREIGN KEY (`invoice_idinvoice`)
    REFERENCES `coches2`.`invoice` (`idinvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
