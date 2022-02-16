-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8 ;
USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`customer` (
  `idcustomer` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`cars_inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`cars_inventory` (
  `idcars_inventory` INT NOT NULL,
  `vin` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `production_year` YEAR NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcars_inventory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`sales_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`sales_person` (
  `idsales_person` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsales_person`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coches`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`invoices` (
  `idinvoices` INT NOT NULL,
  `invoice_number` INT NOT NULL,
  `invoice_date` DATE NOT NULL,
  `cars_inventory_idcars_inventory` INT NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  `sales_person_idsales_person` INT NOT NULL,
  PRIMARY KEY (`idinvoices`),
  INDEX `fk_invoices_cars_inventory_idx` (`cars_inventory_idcars_inventory` ASC) VISIBLE,
  INDEX `fk_invoices_customer1_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_invoices_sales_person1_idx` (`sales_person_idsales_person` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars_inventory`
    FOREIGN KEY (`cars_inventory_idcars_inventory`)
    REFERENCES `coches`.`cars_inventory` (`idcars_inventory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customer1`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `coches`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_sales_person1`
    FOREIGN KEY (`sales_person_idsales_person`)
    REFERENCES `coches`.`sales_person` (`idsales_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
