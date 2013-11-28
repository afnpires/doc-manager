DROP DATABASE IF exists `docmanager`;

CREATE DATABASE `docmanager`;

USE `docmanager`;

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
		ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE=InnoDB;

DROP TABLE IF EXISTS `docmanager`.`document_types`;

CREATE TABLE `document_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_type_fk1_idx` (`parent_id`),
  CONSTRAINT `doc_type_fk1` FOREIGN KEY (`parent_id`) REFERENCES `document_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `docmanager`.`document_fields`;

CREATE TABLE `docmanager`.`document_fields` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `document_type_id` INT NOT NULL,
  `field_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `document_type_fk1_idx` (`document_type_id` ASC),
  CONSTRAINT `document_type_fk1`
    FOREIGN KEY (`document_type_id`)
    REFERENCES `docmanager`.`document_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `docmanager`.`documents`;

CREATE TABLE `docmanager`.`documents` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(64) NOT NULL,
	`file_name` VARCHAR(256) NOT NULL,
	`document_type_id` INT NOT NULL,
	`content` MEDIUMBLOB NOT NULL,
	`content_type` VARCHAR(32) NOT NULL,
	`creation_date` DATETIME NOT NULL,
	`company_id` INT NOT NULL,
	PRIMARY KEY(`id`),
	INDEX `fk_document1` (`document_type_id` ASC),
	CONSTRAINT `fk_document1`
		FOREIGN KEY (`document_type_id`)
		REFERENCES `docmanager`.`document_types` (`id`)
		ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_document2`
    FOREIGN KEY (`company_id`)
    REFERENCES `docmanager`.`companies` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `docmanager`.`field_values`;

CREATE TABLE `field_values` (
  `id` int(11) NOT NULL,
  `value` varchar(45) NOT NULL,
  `document_id` int(11) NOT NULL,
  `document_field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doc_fk1_idx` (`document_id`),
  KEY `doc_field_fk1_idx` (`document_field_id`),
  CONSTRAINT `doc_fk1` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `doc_field_fk1` FOREIGN KEY (`document_field_id`) REFERENCES `document_fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;


CREATE TABLE `docmanager`.`status_values` (
  `id` INT NOT NULL,
  `group` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


INSERT INTO `docmanager`.`roles` (`name`) VALUES ('ADMIN');
INSERT INTO `docmanager`.`roles` (`name`) VALUES ('USER');

INSERT INTO `docmanager`.`document_types` (`name`) VALUES ('document_type_1');
INSERT INTO `docmanager`.`document_types` (`name`) VALUES ('document_type_2');
INSERT INTO `docmanager`.`document_types` (`name`, `parent_id`) VALUES ('document_type_3', 1);

INSERT INTO `docmanager`.`companies` (`short_name`, `full_name`) VALUES ('comp_1', 'Company 1 GmbH');
INSERT INTO `docmanager`.`companies` (`short_name`, `full_name`) VALUES ('comp_2', 'Company 2 GmbH');
INSERT INTO `docmanager`.`companies` (`short_name`, `full_name`) VALUES ('comp_3', 'Company 3 GmbH');

INSERT INTO `docmanager`.`users` (`username`, `password`, `salt`, `name`, `email`, `registration_date`, `enabled`, `role_id`) VALUES ('jmachado', 'password', 'salt', 'João Machado', 'jalexmach@gmail.com', '2013-11-12', 1, '1');
INSERT INTO `docmanager`.`users` (`username`, `password`, `salt`, `name`, `email`, `registration_date`, `enabled`, `role_id`) VALUES ('pserra', 'password', 'salt', 'João Machado', 'pdiogomserra@gmail.com', '2013-11-12', 1, '1');
INSERT INTO `docmanager`.`users` (`username`, `password`, `salt`, `name`, `email`, `registration_date`, `enabled`, `role_id`) VALUES ('ptorra', 'password', 'salt', 'João Machado', 'nomail@gmail.com', '2013-11-12', 1, '1');
