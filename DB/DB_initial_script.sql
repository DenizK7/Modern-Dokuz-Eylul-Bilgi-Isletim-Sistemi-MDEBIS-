-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MDEBIS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MDEBIS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MDEBIS` DEFAULT CHARACTER SET utf8 ;
USE `MDEBIS` ;

-- -----------------------------------------------------
-- Table `MDEBIS`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Student` (
  `idStudent` INT NOT NULL,
  `password` INT NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `depCode` INT NOT NULL,
  `grade` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `GPA` INT NULL,
  `coursesTaken` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Manager` (
  `idManager` INT NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idManager`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Lecturer` (
  `idLecturer` INT NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `depCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLecturer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Course` (
  `idCourse` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `lecturerID` INT NULL,
  `respDept` VARCHAR(45) NULL,
  `day` VARCHAR(45) NULL,
  `hours` VARCHAR(45) NULL,
  PRIMARY KEY (`idCourse`),
  INDEX `fk_Course_Lecturer_idx` (`lecturerID` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Lecturer`
    FOREIGN KEY (`lecturerID`)
    REFERENCES `MDEBIS`.`Lecturer` (`idLecturer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Course_has_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Course_has_Student` (
  `idCourse` INT NOT NULL,
  `idStudent` INT NOT NULL,
  PRIMARY KEY (`idCourse`, `idStudent`),
  INDEX `fk_Course_has_Student_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_Course_has_Student_Course1_idx` (`idCourse` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Student_Course1`
    FOREIGN KEY (`idCourse`)
    REFERENCES `MDEBIS`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Student_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `MDEBIS`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
