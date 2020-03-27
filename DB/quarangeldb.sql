-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quarangeldb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `quarangeldb` ;

-- -----------------------------------------------------
-- Schema quarangeldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quarangeldb` DEFAULT CHARACTER SET utf8 ;
USE `quarangeldb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `history_id` INT NULL,
  `address_id` INT NULL,
  `volunteer_id` VARCHAR(45) NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cards_requests_task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cards_requests_task` ;

CREATE TABLE IF NOT EXISTS `cards_requests_task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `requestor_id` INT NOT NULL,
  `volunteer_id` INT NOT NULL,
  `category_title` VARCHAR(45) NULL,
  `task_description` VARCHAR(250) NOT NULL,
  `date_created` DATETIME NULL,
  `date_deadline` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` INT NULL,
  `street` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `history` ;

CREATE TABLE IF NOT EXISTS `history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `task_id` INT NOT NULL,
  `historycol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categories` ;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `volunteers` ;

CREATE TABLE IF NOT EXISTS `volunteers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bio` VARCHAR(1000) NULL,
  `skills` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rewards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rewards` ;

CREATE TABLE IF NOT EXISTS `rewards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tasks_completed` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notification` ;

CREATE TABLE IF NOT EXISTS `notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `task_id` INT NOT NULL,
  `message` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS quarangeluser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'quarangeluser'@'localhost' IDENTIFIED BY 'quarangelpassword';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'quarangeluser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `history_id`, `address_id`, `volunteer_id`, `enabled`, `role`) VALUES (1, 'seths', 'admin', 'seth', 'schneider', 12345678, 1, 1, '1', 1, 'user');

COMMIT;

