-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema creagnanubhal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema creagnanubhal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `creagnanubhal` DEFAULT CHARACTER SET utf8 ;
USE `creagnanubhal` ;

-- -----------------------------------------------------
-- Table `creagnanubhal`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `creagnanubhal`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `line_1` VARCHAR(255) NULL,
  `line_2` VARCHAR(255) NULL,
  `line_3` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `county_province` VARCHAR(255) NULL,
  `zip_or_postocde` VARCHAR(255) NULL,
  `country` VARCHAR(255) NULL,
  `other_address_details` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `creagnanubhal`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `creagnanubhal`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(255) NULL,
  `lastname` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(255) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_customer_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `creagnanubhal`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `creagnanubhal`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `creagnanubhal`.`booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `notes` VARCHAR(1000) NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_booking_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_booking_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `creagnanubhal`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `creagnanubhal`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `creagnanubhal`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `rate` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `creagnanubhal`.`booking_has_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `creagnanubhal`.`booking_has_room` (
  `booking_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `room_id`),
  INDEX `fk_booking_has_room_room1_idx` (`room_id` ASC),
  INDEX `fk_booking_has_room_booking1_idx` (`booking_id` ASC),
  CONSTRAINT `fk_booking_has_room_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `creagnanubhal`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_has_room_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `creagnanubhal`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
