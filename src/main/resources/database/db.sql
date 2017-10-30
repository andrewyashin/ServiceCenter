SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema service
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `service` ;

-- -----------------------------------------------------
-- Schema service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `service` DEFAULT CHARACTER SET utf8 ;
USE `service` ;

-- -----------------------------------------------------
-- Table `service`.`workers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service`.`workers` ;

CREATE TABLE IF NOT EXISTS `service`.`workers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NULL,
  `position` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `salary` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service`.`clients` ;

CREATE TABLE IF NOT EXISTS `service`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service`.`car` ;

CREATE TABLE IF NOT EXISTS `service`.`car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`.`providers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service`.`providers` ;

CREATE TABLE IF NOT EXISTS `service`.`providers` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`.`warehouse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service`.`warehouse` ;

CREATE TABLE IF NOT EXISTS `service`.`warehouse` (
  `id` INT NOT NULL,
  `idCar` INT NOT NULL,
  `idProvider` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `sold` TINYINT(1) NOT NULL,
  `code` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_warehouse_car1_idx` (`idCar` ASC),
  INDEX `fk_warehouse_providers1_idx` (`idProvider` ASC),
  CONSTRAINT `fk_warehouse_car1`
    FOREIGN KEY (`idCar`)
    REFERENCES `service`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_warehouse_providers1`
    FOREIGN KEY (`idProvider`)
    REFERENCES `service`.`providers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service`.`orders` ;

CREATE TABLE IF NOT EXISTS `service`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idWorker` INT NOT NULL,
  `idClient` INT NOT NULL,
  `idCar` INT NOT NULL,
  `idDetail` INT NOT NULL,
  `totalPrice` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_workers_idx` (`idWorker` ASC),
  INDEX `fk_orders_clients1_idx` (`idClient` ASC),
  INDEX `fk_orders_car1_idx` (`idCar` ASC),
  INDEX `fk_orders_warehouse1_idx` (`idDetail` ASC),
  CONSTRAINT `fk_orders_workers`
    FOREIGN KEY (`idWorker`)
    REFERENCES `service`.`workers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`idClient`)
    REFERENCES `service`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_car1`
    FOREIGN KEY (`idCar`)
    REFERENCES `service`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_warehouse1`
    FOREIGN KEY (`idDetail`)
    REFERENCES `service`.`warehouse` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
