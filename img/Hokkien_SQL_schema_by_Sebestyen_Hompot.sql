DROP DATABASE IF EXISTS `hokkien`;
CREATE DATABASE `hokkien`;
USE `hokkien`;

CREATE TABLE `countries` (
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`name_english` VARCHAR(50) NOT NULL,
`name_former` VARCHAR(255)
);

CREATE TABLE `cities` (
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`name_english` VARCHAR(50) NOT NULL,
`name_asianchar` VARCHAR(50),
`name_former` VARCHAR(50),
`country` INT,
FOREIGN KEY (`country`) REFERENCES `countries`(`id`)
);

CREATE TABLE `missionary_societies` (
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`name` VARCHAR(255) NOT NULL, 
`church` ENUM("Catholic", "Protestant", "other"),
`home_country` INT,
FOREIGN KEY (`home_country`) REFERENCES `countries`(`id`)
);

CREATE TABLE `publishers` (
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`name_orig` VARCHAR(255) NOT NULL,
`name_asianchar` VARCHAR(255),
`name_translated` VARCHAR(255),
`city` INT,
FOREIGN KEY (`city`) REFERENCES `cities`(`id`),
`country` INT,
FOREIGN KEY (`country`) REFERENCES `countries`(`id`)
);

CREATE TABLE `people` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name_orig` VARCHAR(255) NOT NULL,
`name_asianchar`  VARCHAR(50),
`nationality` INT,
FOREIGN KEY (`nationality`) REFERENCES `countries`(`id`),
`occupation` ENUM("interpreter", "missionary", "official", "scholar", "unspecified"),
`missionary_society` INT,
FOREIGN KEY (`missionary_society`) REFERENCES `missionary_societies`(`id`)
);

CREATE TABLE `transcription_methods` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name_orig` VARCHAR(255) NOT NULL,
`name_asianchar` VARCHAR(255),
`creator` INT,
FOREIGN KEY (`creator`) REFERENCES `people`(`id`),
`first_appearance` INT,
`based_on` VARCHAR(255),
`type` VARCHAR(255)
);

CREATE TABLE `publications` (
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`title_orig` VARCHAR(255) NOT NULL,
`title_asianchar` VARCHAR(255),
`title_translated` VARCHAR(255), 
`year_pub` INT NOT NULL,
`city_pub` INT,
FOREIGN KEY (`city_pub`) REFERENCES `cities`(`id`),
`country_pub` INT,
FOREIGN KEY (`country_pub`) REFERENCES `countries`(`id`),
`publisher` INT,
FOREIGN KEY (`publisher`) REFERENCES `publishers`(`id`),
`type` ENUM("dictionary", "manuscript", "phrasebook", "rime chart", "rime dictionary", "textbook", "unspecified"),
`language` ENUM("Classical Chinese", "Dutch", "English", "Hokkien", "Japanese", "Latin", "Mandarin", "Spanish", "other"),
`transcription_method` INT,
FOREIGN KEY (`transcription_method`) REFERENCES `transcription_methods` (`id`),
`digitized_at` VARCHAR(255),
`paper_version_available_at` VARCHAR(255),
`mentioned_in` VARCHAR(255)
);

CREATE TABLE `pub_author` (
`author` INT NOT NULL,
FOREIGN KEY (`author`) REFERENCES `people`(`id`),
`publication` INT NOT NULL,
FOREIGN KEY (`publication`) REFERENCES `publications`(`id`)
);
