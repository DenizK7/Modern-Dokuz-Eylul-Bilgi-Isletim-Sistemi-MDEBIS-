-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mdebis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mdebis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mdebis` DEFAULT CHARACTER SET utf8mb3 ;
USE `mdebis` ;

-- -----------------------------------------------------
-- Table `mdebis`.`announcement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdebis`.`announcement` (
  `announcementID`  NOT NULL,
  `Course_idCourse`  NOT NULL,
  `content` LONGTEXT NOT NULL,
  PRIMARY KEY (`announcementID`),
  INDEX `fk_Announcement_Course1_idx` (`Course_idCourse` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mdebis`.`lecturer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdebis`.`lecturer` (
  `username` VARCHAR(45) NOT NULL,
  `idLecturer`  NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `depName` VARCHAR(45) NOT NULL,
  `e_mail` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mdebis`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdebis`.`course` (
  `idCourse`  NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `Lecturer_idLecturer`  NULL DEFAULT NULL,
  `respDept` VARCHAR(45) NULL DEFAULT NULL,
  `day` VARCHAR(45) NULL DEFAULT NULL,
  `hours` VARCHAR(45) NULL DEFAULT NULL,
  `Lecturer_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCourse`),
  INDEX `fk_Course_Lecturer1_idx` (`Lecturer_username` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Lecturer1`
    FOREIGN KEY (`Lecturer_username`)
    REFERENCES `mdebis`.`lecturer` (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mdebis`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdebis`.`student` (
  `username` VARCHAR(45) NOT NULL,
  `idStudent`  NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `depName` VARCHAR(45) NOT NULL,
  `grade`  NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `GPA` FLOAT NULL DEFAULT NULL,
  `e_mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mdebis`.`course_has_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdebis`.`course_has_student` (
  `idCourse`  NOT NULL,
  `idStudent`  NOT NULL,
  PRIMARY KEY (`idCourse`, `idStudent`),
  INDEX `fk_Course_has_Student_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_Course_has_Student_Course1_idx` (`idCourse` ASC) VISIBLE,
  CONSTRAINT `fk_Course_has_Student_Course1`
    FOREIGN KEY (`idCourse`)
    REFERENCES `mdebis`.`course` (`idCourse`),
  CONSTRAINT `fk_Course_has_Student_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `mdebis`.`student` (`idStudent`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mdebis`.`generalannouncement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdebis`.`generalannouncement` (
  `idgeneralAnnouncement`  NOT NULL,
  `title`  NULL DEFAULT NULL,
  `content` LONGTEXT NULL DEFAULT NULL,
  `link` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`idgeneralAnnouncement`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
