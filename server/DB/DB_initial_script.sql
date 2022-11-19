-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MDEBIS` DEFAULT CHARACTER SET utf8 ;
USE `MDEBIS` ;

-- -----------------------------------------------------
-- Table `MDEBIS`.`Lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Lecturer` (
  `Lecturer_Id` INT NOT NULL,
  `Password` VARCHAR(1000) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Mail` VARCHAR(45) NULL,
  `Department_Id` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Lecturer_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Department` (
  `Department_Id` INT NOT NULL,
  `Head_Lecturer_Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Department_Id`),
  INDEX `fk_Department_Lecturer1_idx` (`Head_Lecturer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Lecturer1`
    FOREIGN KEY (`Head_Lecturer_Id`)
    REFERENCES `MDEBIS`.`Lecturer` (`Lecturer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Course` (
  `Course_Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Departmend_Ids` INT NOT NULL,
  `Attandence_Limit` INT NOT NULL,
  `Student_Ids` TEXT(500) NOT NULL,
  `Days` VARCHAR(40) NOT NULL,
  `Hours` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Course_Id`),
  INDEX `fk_Course_Department1_idx` (`Departmend_Ids` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Department1`
    FOREIGN KEY (`Departmend_Ids`)
    REFERENCES `MDEBIS`.`Department` (`Department_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Student` (
  `Student_Id` INT NOT NULL,
  `Password` VARCHAR(1000) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Year` INT NOT NULL,
  `GPA` FLOAT NULL,
  `Department_Id` INT NOT NULL,
  `Mail` VARCHAR(70) NULL,
  `Course_Ids` VARCHAR(70) NULL,
  PRIMARY KEY (`Student_Id`),
  INDEX `fk_Student_Department1_idx` (`Department_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Department1`
    FOREIGN KEY (`Department_Id`)
    REFERENCES `MDEBIS`.`Department` (`Department_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Course_has_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Course_has_Student` (
  `Course_Id` INT NOT NULL,
  `Student_Id` INT NOT NULL,
  `Situtation` ENUM("Passed", "Current", "Failed") NOT NULL DEFAULT 'Current',
  `Non_Attendance` INT NOT NULL DEFAULT 0,
  `Grade` ENUM("AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF") NULL,
  PRIMARY KEY (`Course_Id`, `Student_Id`, `Non_Attendance`),
  INDEX `fk_Course_has_Student_Student1_idx` (`Student_Id` ASC) VISIBLE,
  INDEX `fk_Course_has_Student_Course_idx` (`Course_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Student_Course`
    FOREIGN KEY (`Course_Id`)
    REFERENCES `MDEBIS`.`Course` (`Course_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Student_Student1`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `MDEBIS`.`Student` (`Student_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Add_Drop_Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Add_Drop_Requests` (
  `Request_Id` INT NOT NULL,
  `Student_Id` INT NOT NULL,
  `Responsible_Lecturer_Id` INT NOT NULL,
  PRIMARY KEY (`Request_Id`, `Student_Id`, `Responsible_Lecturer_Id`),
  INDEX `fk_Add_Drop_Requests_Student1_idx` (`Student_Id` ASC) VISIBLE,
  INDEX `fk_Add_Drop_Requests_Lecturer1_idx` (`Responsible_Lecturer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Add_Drop_Requests_Student1`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `MDEBIS`.`Student` (`Student_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Add_Drop_Requests_Lecturer1`
    FOREIGN KEY (`Responsible_Lecturer_Id`)
    REFERENCES `MDEBIS`.`Lecturer` (`Lecturer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Manager` (
  `Manager_Id` INT NOT NULL,
  `Password` VARCHAR(1000) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Manager_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Course_has_Lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Course_has_Lecturer` (
  `Course_Course_Id` INT NOT NULL,
  `Lecturer_Lecturer_Id` INT NOT NULL,
  PRIMARY KEY (`Course_Course_Id`, `Lecturer_Lecturer_Id`),
  INDEX `fk_Course_has_Lecturer_Lecturer1_idx` (`Lecturer_Lecturer_Id` ASC) VISIBLE,
  INDEX `fk_Course_has_Lecturer_Course1_idx` (`Course_Course_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Lecturer_Course1`
    FOREIGN KEY (`Course_Course_Id`)
    REFERENCES `MDEBIS`.`Course` (`Course_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_has_Lecturer_Lecturer1`
    FOREIGN KEY (`Lecturer_Lecturer_Id`)
    REFERENCES `MDEBIS`.`Lecturer` (`Lecturer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Add_Drop_Requests_has_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Add_Drop_Requests_has_Course` (
  `Add_Drop_Requests_Request_Id` INT NOT NULL,
  `Course_Course_Id` INT NOT NULL,
  PRIMARY KEY (`Add_Drop_Requests_Request_Id`, `Course_Course_Id`),
  INDEX `fk_Add_Drop_Requests_has_Course_Course1_idx` (`Course_Course_Id` ASC) VISIBLE,
  INDEX `fk_Add_Drop_Requests_has_Course_Add_Drop_Requests1_idx` (`Add_Drop_Requests_Request_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Add_Drop_Requests_has_Course_Add_Drop_Requests1`
    FOREIGN KEY (`Add_Drop_Requests_Request_Id`)
    REFERENCES `MDEBIS`.`Add_Drop_Requests` (`Request_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Add_Drop_Requests_has_Course_Course1`
    FOREIGN KEY (`Course_Course_Id`)
    REFERENCES `MDEBIS`.`Course` (`Course_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`General_Announcements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`General_Announcements` (
  `General_Announcements_Id` INT NOT NULL,
  `Title` TINYTEXT NOT NULL,
  `Content` LONGTEXT NOT NULL,
  `link` VARCHAR(1000) NULL,
  PRIMARY KEY (`General_Announcements_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MDEBIS`.`Course_Announcements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MDEBIS`.`Course_Announcements` (
  `Course_Announcements_Id` INT NOT NULL,
  `Course_Course_Id` INT NOT NULL,
  `Title` TINYTEXT NOT NULL,
  `Content` LONGTEXT NOT NULL,
  `link` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`Course_Announcements_Id`, `Course_Course_Id`),
  INDEX `fk_Course_Announcements_Course1_idx` (`Course_Course_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Announcements_Course1`
    FOREIGN KEY (`Course_Course_Id`)
    REFERENCES `MDEBIS`.`Course` (`Course_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
