-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars` DEFAULT CHARACTER SET utf8 ;
USE `cars` ;

-- -----------------------------------------------------
-- Table `cars`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`salesperson` (
  `id` INT NOT NULL,
  `idsalesperson` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cars`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`customer` (
  `id` INT NOT NULL,
  `idcustomer` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `phone` INT(11) NOT NULL,
  `e_mail` VARCHAR(45) NULL DEFAULT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cars`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`invoices` (
  `id` INT NOT NULL,
  `idinvoices` INT NOT NULL,
  `date` DATE NOT NULL,
  `car` INT NOT NULL,
  `customer_name` INT NOT NULL,
  `salesperson` INT NOT NULL,
  `salesperson_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoices_salesperson_idx` (`salesperson_id` ASC) VISIBLE,
  INDEX `fk_invoices_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salesperson`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `cars`.`salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `cars`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cars`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`car` (
  `idcar` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `salesperson_id` INT NOT NULL,
  `invoices_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`idcar`),
  INDEX `fk_car_salesperson1_idx` (`salesperson_id` ASC) VISIBLE,
  INDEX `fk_car_invoices1_idx` (`invoices_id` ASC) VISIBLE,
  INDEX `fk_car_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_car_salesperson1`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `cars`.`salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_invoices1`
    FOREIGN KEY (`invoices_id`)
    REFERENCES `cars`.`invoices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `cars`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
