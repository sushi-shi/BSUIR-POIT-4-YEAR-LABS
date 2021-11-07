/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 15.0 		*/
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0
; 
/* Drop Tables */

DROP TABLE IF EXISTS `cities` CASCADE
;

DROP TABLE IF EXISTS `computers` CASCADE
;

DROP TABLE IF EXISTS `connections` CASCADE
;

DROP TABLE IF EXISTS `dates` CASCADE
;

DROP TABLE IF EXISTS `library_in_json` CASCADE
;

DROP TABLE IF EXISTS `overflow` CASCADE
;

DROP TABLE IF EXISTS `rooms` CASCADE
;

DROP TABLE IF EXISTS `shopping` CASCADE
;

DROP TABLE IF EXISTS `site_pages` CASCADE
;

DROP TABLE IF EXISTS `table_with_nulls` CASCADE
;

DROP TABLE IF EXISTS `test_counts` CASCADE
;

/* Create Tables */

CREATE TABLE `cities`
(
	`ct_id` INT NOT NULL AUTO_INCREMENT,
	`ct_name` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_cities` PRIMARY KEY (`ct_id` ASC)
)

;

CREATE TABLE `computers`
(
	`c_id` INT NOT NULL AUTO_INCREMENT,
	`c_room` INT NULL,
	`c_name` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_computers` PRIMARY KEY (`c_id` ASC)
)

;

CREATE TABLE `connections`
(
	`cn_from` INT NOT NULL,
	`cn_to` INT NOT NULL,
	`cn_cost` DOUBLE(10,2) NULL,
	`cn_bidir` ENUM ('N','Y') NOT NULL,
	CONSTRAINT `PK_connections` PRIMARY KEY (`cn_from` ASC, `cn_to` ASC)
)

;

CREATE TABLE `dates`
(
	`d` DATE NULL
)

;

CREATE TABLE `library_in_json`
(
	`lij_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`lij_book` VARCHAR(150) NOT NULL,
	`lij_author` JSON NOT NULL,
	`lij_genre` JSON NOT NULL,
	CONSTRAINT `PK_library_in_json` PRIMARY KEY (`lij_id` ASC)
)

;

CREATE TABLE `overflow`
(
	`x` INT NULL
)

;

CREATE TABLE `rooms`
(
	`r_id` INT NOT NULL AUTO_INCREMENT,
	`r_name` VARCHAR(50) NOT NULL,
	`r_space` TINYINT NOT NULL,
	CONSTRAINT `PK_rooms` PRIMARY KEY (`r_id` ASC)
)

;

CREATE TABLE `shopping`
(
	`sh_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`sh_transaction` INT UNSIGNED NOT NULL,
	`sh_category` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_shopping` PRIMARY KEY (`sh_id` ASC)
)

;

CREATE TABLE `site_pages`
(
	`sp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`sp_parent` INT UNSIGNED NULL,
	`sp_name` VARCHAR(200) NULL,
	CONSTRAINT `PK_site_pages` PRIMARY KEY (`sp_id` ASC)
)

;

CREATE TABLE `table_with_nulls`
(
	`x` INT NULL
)

;

CREATE TABLE `test_counts`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`fni` INT NULL,
	`fwi` INT NULL,
	`fni_nn` INT NOT NULL,
	`fwi_nn` INT NOT NULL,
	CONSTRAINT `PK_test_counts` PRIMARY KEY (`id` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `dates` 
 ADD INDEX `idx_d` (`d` ASC)
;

ALTER TABLE `test_counts` 
 ADD INDEX `idx_fwi` (`fwi` ASC)
;

ALTER TABLE `test_counts` 
 ADD INDEX `idx_fwi_nn` (`fwi_nn` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `computers` 
 ADD CONSTRAINT `FK_computers_rooms`
	FOREIGN KEY (`c_room`) REFERENCES `rooms` (`r_id`) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE `connections` 
 ADD CONSTRAINT `FK_connections_cities1`
	FOREIGN KEY (`cn_from`) REFERENCES `cities` (`ct_id`) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE `connections` 
 ADD CONSTRAINT `FK_connections_cities2`
	FOREIGN KEY (`cn_to`) REFERENCES `cities` (`ct_id`) ON DELETE Cascade ON UPDATE Cascade
;

ALTER TABLE `site_pages` 
 ADD CONSTRAINT `FK_site_pages_site_pages`
	FOREIGN KEY (`sp_parent`) REFERENCES `site_pages` (`sp_id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1
; 
