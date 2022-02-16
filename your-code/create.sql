-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_sql_eduardoarroyo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_sql_eduardoarroyo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_sql_eduardoarroyo` ;
USE `lab_sql_eduardoarroyo` ;

-- -----------------------------------------------------
-- Table `lab_sql_eduardoarroyo`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_eduardoarroyo`.`cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_sql_eduardoarroyo`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_eduardoarroyo`.`customers` (
  `ID` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state_province` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_sql_eduardoarroyo`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_eduardoarroyo`.`salespersons` (
  `ID` INT NOT NULL,
  `staff_id` VARCHAR(5) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_sql_eduardoarroyo`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_sql_eduardoarroyo`.`invoices` (
  `ID` INT NOT NULL,
  `invoice_number` INT NOT NULL,
  `date` DATE NOT NULL,
  `cars_ID` INT NULL,
  `customers_ID` INT NULL,
  `salespersons_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_invoices_cars1_idx` (`cars_ID` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_ID` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_ID`)
    REFERENCES `lab_sql_eduardoarroyo`.`cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `lab_sql_eduardoarroyo`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_ID`)
    REFERENCES `lab_sql_eduardoarroyo`.`salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
