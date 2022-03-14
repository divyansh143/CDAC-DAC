-- MySQL Script generated by MySQL Workbench
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema car_booking
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `car_booking` ;

-- -----------------------------------------------------
-- Schema car_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_booking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
SHOW WARNINGS;
USE `car_booking` ;

-- -----------------------------------------------------
-- Table `car_booking`.`vehicle_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`vehicle_category` (
  `vehicle_category_code` INT UNSIGNED NOT NULL,
  `vehicle_category_description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`vehicle_category_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `car_booking`.`manufacturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`manufacturer` (
  `manufacturer_code` INT UNSIGNED NOT NULL,
  `manufacturer_name` VARCHAR(100) NOT NULL,
  `manufacturer_details` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`manufacturer_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `car_booking`.`model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`model` (
  `model_code` VARCHAR(10) NOT NULL,
  `daily_hire_date` INT UNSIGNED NOT NULL,
  `model_name` VARCHAR(10) NOT NULL,
  `manufacturer_code` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`model_code`),
  CONSTRAINT `model_ibfk_1`
    FOREIGN KEY (`manufacturer_code`)
    REFERENCES `car_booking`.`manufacturer` (`manufacturer_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `manufacturer_code` ON `car_booking`.`model` (`manufacturer_code` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `car_booking`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`vehicle` (
  `registration_number` VARCHAR(10) NOT NULL,
  `mileage` INT UNSIGNED NULL DEFAULT NULL,
  `daily_hire_date` INT UNSIGNED NULL DEFAULT NULL,
  `date_mot_due` DATE NULL DEFAULT NULL,
  `engine_size` INT UNSIGNED NULL DEFAULT NULL,
  `vehicle_category_code` INT UNSIGNED NULL DEFAULT NULL,
  `model_code` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`registration_number`),
  CONSTRAINT `vehicle_ibfk_1`
    FOREIGN KEY (`vehicle_category_code`)
    REFERENCES `car_booking`.`vehicle_category` (`vehicle_category_code`),
  CONSTRAINT `vehicle_ibfk_2`
    FOREIGN KEY (`model_code`)
    REFERENCES `car_booking`.`model` (`model_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `vehicle_category_code` ON `car_booking`.`vehicle` (`vehicle_category_code` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `model_code` ON `car_booking`.`vehicle` (`model_code` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `car_booking`.`booking_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`booking_status` (
  `booking_status_code` VARCHAR(10) NOT NULL,
  `booking_status_description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_status_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `car_booking`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(20) NOT NULL,
  `customer_details` VARCHAR(200) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `email_address` VARCHAR(50) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `address_line1` VARCHAR(50) NULL DEFAULT NULL,
  `address_line2` VARCHAR(50) NULL DEFAULT NULL,
  `address_line3` VARCHAR(50) NULL DEFAULT NULL,
  `town` VARCHAR(50) NULL DEFAULT NULL,
  `county` VARCHAR(50) NULL DEFAULT NULL,
  `country` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `car_booking`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_booking`.`booking` (
  `booking_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_from` DATE NOT NULL,
  `date_to` DATE NOT NULL,
  `confirmation_letter_sent_yn` CHAR(1) NULL DEFAULT NULL,
  `payment_received_yn` CHAR(1) NULL DEFAULT NULL,
  `customer_id` INT UNSIGNED NULL DEFAULT NULL,
  `booking_status_code` VARCHAR(10) NULL DEFAULT NULL,
  `registration_number` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  CONSTRAINT `booking_ibfk_1`
    FOREIGN KEY (`registration_number`)
    REFERENCES `car_booking`.`vehicle` (`registration_number`),
  CONSTRAINT `booking_ibfk_2`
    FOREIGN KEY (`booking_status_code`)
    REFERENCES `car_booking`.`booking_status` (`booking_status_code`),
  CONSTRAINT `booking_ibfk_3`
    FOREIGN KEY (`customer_id`)
    REFERENCES `car_booking`.`customer` (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `registration_number` ON `car_booking`.`booking` (`registration_number` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `booking_status_code` ON `car_booking`.`booking` (`booking_status_code` ASC) VISIBLE;

SHOW WARNINGS;
CREATE INDEX `customer_id` ON `car_booking`.`booking` (`customer_id` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
