-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car` DEFAULT CHARACTER SET utf8 ;
USE `car` ;

-- -----------------------------------------------------
-- Table `car`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car`.`salesperson` (
  `idsalesperson` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsalesperson`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `car`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car`.`customers` (
  `idcustomers` INT NOT NULL,
  `customers_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state_province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal` INT NOT NULL,
  `salesperson_idsalesperson` INT NULL,
  PRIMARY KEY (`idcustomers`),
  INDEX `fk_customers_salesperson_idx` (`salesperson_idsalesperson` ASC) VISIBLE,
  CONSTRAINT `fk_customers_salesperson`
    FOREIGN KEY (`salesperson_idsalesperson`)
    REFERENCES `car`.`salesperson` (`idsalesperson`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `car`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car`.`cars` (
  `idcars` INT NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `customers_idcustomers` INT NULL,
  `salesperson_idsalesperson` INT NULL,
  PRIMARY KEY (`idcars`),
  INDEX `fk_cars_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_cars_salesperson1_idx` (`salesperson_idsalesperson` ASC) VISIBLE,
  CONSTRAINT `fk_cars_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `car`.`customers` (`idcustomers`),
  CONSTRAINT `fk_cars_salesperson1`
    FOREIGN KEY (`salesperson_idsalesperson`)
    REFERENCES `car`.`salesperson` (`idsalesperson`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `car`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invoices_number` INT NOT NULL,
  `date` DATE NOT NULL,
  `idcars` INT NOT NULL,
  `idcustomers` INT NOT NULL,
  `idsalesperson` INT NOT NULL,
  PRIMARY KEY (`idinvoices`, `idcars`, `idcustomers`, `idsalesperson`),
  INDEX `fk_invoices_customers1_idx` (`idcustomers` ASC) VISIBLE,
  INDEX `fk_invoices_salesperson1_idx` (`idsalesperson` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`idcars` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`idcars`)
    REFERENCES `car`.`cars` (`idcars`),
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`idcustomers`)
    REFERENCES `car`.`customers` (`idcustomers`),
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`idsalesperson`)
    REFERENCES `car`.`salesperson` (`idsalesperson`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
