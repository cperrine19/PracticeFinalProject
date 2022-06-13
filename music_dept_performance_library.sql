-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema music_dept_performance_library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema music_dept_performance_library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `music_dept_performance_library` DEFAULT CHARACTER SET utf8 ;
USE `music_dept_performance_library` ;

-- -----------------------------------------------------
-- Table `music_dept_performance_library`.`composer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_dept_performance_library`.`composer` ;

CREATE TABLE IF NOT EXISTS `music_dept_performance_library`.`composer` (
  `idcomposer` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcomposer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_dept_performance_library`.`performer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_dept_performance_library`.`performer` ;

CREATE TABLE IF NOT EXISTS `music_dept_performance_library`.`performer` (
  `idperformer` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idperformer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_dept_performance_library`.`song_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_dept_performance_library`.`song_type` ;

CREATE TABLE IF NOT EXISTS `music_dept_performance_library`.`song_type` (
  `idsong_type` INT NOT NULL AUTO_INCREMENT,
  `performance_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsong_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_dept_performance_library`.`song_title`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_dept_performance_library`.`song_title` ;

CREATE TABLE IF NOT EXISTS `music_dept_performance_library`.`song_title` (
  `idsong_title` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `idcomposer` INT NOT NULL,
  PRIMARY KEY (`idsong_title`),
  INDEX `idcomposer_idx` (`idcomposer` ASC) VISIBLE,
  CONSTRAINT `idcomposer`
    FOREIGN KEY (`idcomposer`)
    REFERENCES `music_dept_performance_library`.`composer` (`idcomposer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_dept_performance_library`.`performances`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `music_dept_performance_library`.`performances` ;

CREATE TABLE IF NOT EXISTS `music_dept_performance_library`.`performances` (
  `idperformances` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `idperformer` INT NOT NULL,
  `idsong_title` INT NOT NULL,
  `idsong_type` INT NOT NULL,
  `idcomposer` INT NOT NULL,
  PRIMARY KEY (`idperformances`),
  INDEX `idperformer_idx` (`idperformer` ASC) VISIBLE,
  INDEX `idsong_title_idx` (`idsong_title` ASC) VISIBLE,
  INDEX `idsong_type_idx` (`idsong_type` ASC) VISIBLE,
  INDEX `idcomposer_idx` (`idcomposer` ASC) VISIBLE,
  CONSTRAINT `idperformer`
    FOREIGN KEY (`idperformer`)
    REFERENCES `music_dept_performance_library`.`performer` (`idperformer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idsong_title`
    FOREIGN KEY (`idsong_title`)
    REFERENCES `music_dept_performance_library`.`song_title` (`idsong_title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idsong_type`
    FOREIGN KEY (`idsong_type`)
    REFERENCES `music_dept_performance_library`.`song_type` (`idsong_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcomposer`
    FOREIGN KEY (`idcomposer`)
    REFERENCES `music_dept_performance_library`.`composer` (`idcomposer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
