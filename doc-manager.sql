DROP DATABASE IF exists `docmanager`;

CREATE DATABASE `docmanager`;

DROP TABLE IF EXISTS `docmanager`.`roles`;

CREATE TABLE `docmanager`.`roles` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(32) NOT NULL,
	PRIMARY KEY(`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `docmanager`.`companies`;

CREATE TABLE `docmanager`.`companies` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`short_name` VARCHAR(32) NOT NULL,
	`full_name` VARCHAR(128) NOT NULL,
	PRIMARY KEY(`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `docmanager`.`users`;

CREATE TABLE `docmanager`.`users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(32) NOT NULL,
	`password`VARCHAR(128) NOT NULL,
	`salt` VARCHAR(64) NOT NULL,
	`name` VARCHAR(128) NOT NULL,
	`email` VARCHAR(128) NOT NULL,
	`registration_date` DATETIME NOT NULL,
	`enabled` BIT NOT NULL,
	`role_id` INT NOT NULL,
	PRIMARY KEY(`id`),
	INDEX `fk_user1` (`role_id` ASC),
	CONSTRAINT `fk_user1`
		FOREIGN KEY (`role_id`)
		REFERENCES `docmanager`.`roles` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `docmanager`.`document_types`;

CREATE TABLE `docmanager`.`document_types` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(32) NOT NULL,
	PRIMARY KEY(`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `docmanager`.`documents`;

CREATE TABLE `docmanager`.`documents` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(64) NOT NULL,
	`file_name` VARCHAR(256) NOT NULL,
	`document_type_id` INT NOT NULL,
	`content` MEDIUMBLOB NOT NULL,
	`content_type` VARCHAR(32) NOT NULL,
	`creation_date` DATETIME NOT NULL, 
	PRIMARY KEY(`id`),
	INDEX `fk_document1` (`document_type_id` ASC),
	CONSTRAINT `fk_document1`
		FOREIGN KEY (`document_type_id`)
		REFERENCES `docmanager`.`document_types` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `docmanager`.`roles` (`name`) VALUES ('ADMIN');

INSERT INTO `docmanager`.`users` (`username`, `password`, `salt`, `name`, `email`, `registration_date`, `enabled`, `role_id`) VALUES ('jmachado', 'password', 'salt', 'João Machado', 'jalexmach@gmail.com', '2013-11-12', 1, '1');
