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
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


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
  `phone` VARCHAR(15) NULL,
  `address_id` INT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_id_idx` (`address_id` ASC),
  CONSTRAINT `fk_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task` ;

CREATE TABLE IF NOT EXISTS `task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `requestor_userid` INT NOT NULL,
  `volunteer_userid` INT NOT NULL,
  `category_id` INT NOT NULL,
  `date_created` DATETIME NULL,
  `date_deadline` DATETIME NULL,
  `date_completed` DATETIME NULL,
  `requestor_comment` TEXT NULL,
  `volunteer_comment` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requestor_id_idx` (`requestor_userid` ASC),
  INDEX `fk_card_volunteer_userid_idx` (`volunteer_userid` ASC),
  INDEX `fk_card_category_id_idx` (`category_id` ASC),
  CONSTRAINT `fk_card_requestor_userid`
    FOREIGN KEY (`requestor_userid`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_volunteer_userid`
    FOREIGN KEY (`volunteer_userid`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_card_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reward` ;

CREATE TABLE IF NOT EXISTS `reward` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reward_level` VARCHAR(50) NOT NULL,
  `num_of_tasks_completed` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notification` ;

CREATE TABLE IF NOT EXISTS `notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `volunteer_userid` INT NOT NULL,
  `task_id` INT NOT NULL,
  `message` VARCHAR(200) NULL,
  `notification_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notification_userid_idx` (`volunteer_userid` ASC),
  INDEX `fk_task_id_idx` (`task_id` ASC),
  CONSTRAINT `fk_notification_userid`
    FOREIGN KEY (`volunteer_userid`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_id`
    FOREIGN KEY (`task_id`)
    REFERENCES `task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_reward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_reward` ;

CREATE TABLE IF NOT EXISTS `user_reward` (
  `user_id` INT NOT NULL,
  `reward_id` INT NOT NULL,
  `date_of_reward` DATE NULL,
  `task_id` INT NULL,
  PRIMARY KEY (`user_id`, `reward_id`),
  INDEX `fk_user_has_rewards_rewards1_idx` (`reward_id` ASC),
  INDEX `fk_user_has_rewards_user1_idx` (`user_id` ASC),
  INDEX `fk_reward_task_id_idx` (`task_id` ASC),
  CONSTRAINT `fk_user_has_rewards_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_rewards_rewards1`
    FOREIGN KEY (`reward_id`)
    REFERENCES `reward` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reward_task_id`
    FOREIGN KEY (`task_id`)
    REFERENCES `task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_category` ;

CREATE TABLE IF NOT EXISTS `user_has_category` (
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `category_id`),
  INDEX `fk_user_has_categories_categories1_idx` (`category_id` ASC),
  INDEX `fk_user_has_categories_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_categories_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_categories_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `task_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `task_comment` ;

CREATE TABLE IF NOT EXISTS `task_comment` (
  `id` INT NOT NULL,
  `poster_id` INT NOT NULL,
  `comment_text` TEXT NULL,
  `comment_date_posted` DATETIME NOT NULL,
  `task_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_task_id_idx` (`task_id` ASC),
  INDEX `fk_poster_user_id_idx` (`poster_id` ASC),
  CONSTRAINT `fk_comment_task_id`
    FOREIGN KEY (`task_id`)
    REFERENCES `task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poster_user_id`
    FOREIGN KEY (`poster_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, '123 test st', 'test commons', 'test island', 12345);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (2, '1002 burnwood drive', 'denver', 'colorado', 55555);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address_id`, `enabled`, `role`, `biography`) VALUES (1, 'seths', 'admin', 'seth', 'schneider', '1234567891', 1, 1, 'user', 'avid volunteer');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address_id`, `enabled`, `role`, `biography`) VALUES (2, 'testuser', 'password', 'bob', 'dobbs', '1234567891', 1, 1, 'user', 'avid mountain climber');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address_id`, `enabled`, `role`, `biography`) VALUES (3, 'bestvolunteereva', 'ponies', 'jim', 'joe', '5555555555', 2, 1, 'user', 'Loves to read books');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address_id`, `enabled`, `role`, `biography`) VALUES (4, 'granny05', 'puppies', 'betty', 'boop', '5551234567', 1, 1, 'user', 'Loves her grandchildren');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address_id`, `enabled`, `role`, `biography`) VALUES (5, 'emilioman', 'partyanimal', 'lucas', 'skywalker', '5551234567', 2, 1, 'user', 'needs constant help');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'House chore', 'Small tasks around the house');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Ride', 'give a ride to someone');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'Delivery', 'Pick something up and deliver it');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (4, 'Monetary Donation', 'Donate money to someone in need');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (5, 'Walk a pet', 'Walk a pet for someone who cant get outside');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (6, 'Handy man', 'Help fix small stuff like a door');
INSERT INTO `category` (`id`, `name`, `description`) VALUES (7, 'Other', 'My request doesnt fit into the other categories');

COMMIT;


-- -----------------------------------------------------
-- Data for table `task`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `task` (`id`, `description`, `requestor_userid`, `volunteer_userid`, `category_id`, `date_created`, `date_deadline`, `date_completed`, `requestor_comment`, `volunteer_comment`) VALUES (1, 'help me cross the road', 1, 2, 1, '2020-03-15', '2020-03-18', '2020-03-16', 'Please hurry', 'No problem i am on my way');
INSERT INTO `task` (`id`, `description`, `requestor_userid`, `volunteer_userid`, `category_id`, `date_created`, `date_deadline`, `date_completed`, `requestor_comment`, `volunteer_comment`) VALUES (2, 'Please run to the store and get me some food', 4, 1, 3, '2020-03-28', '2020-03-31', NULL, 'I prefer charmin ultra', 'They are out of charmin ultra');

COMMIT;


-- -----------------------------------------------------
-- Data for table `reward`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `reward` (`id`, `reward_level`, `num_of_tasks_completed`) VALUES (1, 'Beginner volunteer', 1);
INSERT INTO `reward` (`id`, `reward_level`, `num_of_tasks_completed`) VALUES (2, 'Semi-Experienced Volunteer', 10);
INSERT INTO `reward` (`id`, `reward_level`, `num_of_tasks_completed`) VALUES (3, 'Experienced Volunteer', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `notification`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `notification` (`id`, `volunteer_userid`, `task_id`, `message`, `notification_date`) VALUES (1, 1, 1, 'Thanks for helping me', '2020-03-28 00:00:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_reward`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `user_reward` (`user_id`, `reward_id`, `date_of_reward`, `task_id`) VALUES (1, 1, '2020-03-10', 1);
INSERT INTO `user_reward` (`user_id`, `reward_id`, `date_of_reward`, `task_id`) VALUES (3, 1, '2020-03-25', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `quarangeldb`;
INSERT INTO `user_has_category` (`user_id`, `category_id`) VALUES (1, 1);

COMMIT;

