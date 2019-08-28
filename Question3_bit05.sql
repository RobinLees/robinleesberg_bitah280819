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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `mutation_id` INT NOT NULL,
  `chromosomal_location` VARCHAR(45) NULL,
  `Gene_id` INT NULL,
  PRIMARY KEY (`mutation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL COMMENT '\n    Patient\n        Name, sex, age_diagnose\n    Mutation\n        Chromosomal location\n    Gene\n        Name, location, description\n',
  `patient_name` VARCHAR(45) NULL,
  `patient_sex` ENUM('f', 'm') NULL,
  `patient_age_diagnose` VARCHAR(3) NULL COMMENT '\n    Patient\n        Name, sex, age_diagnose\n    Mutation\n        Chromosomal location\n    Gene\n        Name, location, description\n',
  `mutation_id` INT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `fk_mutation_id_idx` (`mutation_id` ASC) VISIBLE,
  CONSTRAINT `fk_mutation_id`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `mydb`.`Mutation` (`mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `Gene_id` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Gene_location` VARCHAR(45) NULL,
  `Gene_description` TEXT(200) NULL,
  PRIMARY KEY (`Gene_id`),
  CONSTRAINT `fk_Gene_id`
    FOREIGN KEY (`Gene_id`)
    REFERENCES `mydb`.`Mutation` (`mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '\n    Patient\n        Name, sex, age_diagnose\n    Mutation\n        Chromosomal location\n    Gene\n        Name, location, description\n';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
