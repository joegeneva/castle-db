-- MySQL Script generated by MySQL Workbench
-- Fri Aug 30 00:26:01 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Castle
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Castle` ;

-- -----------------------------------------------------
-- Schema Castle
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Castle` DEFAULT CHARACTER SET utf8 ;
USE `Castle` ;

-- -----------------------------------------------------
-- Table `Castle`.`Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Class` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Class` (
  `idClass` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idClass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Profession`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Profession` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Profession` (
  `idProfession` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Pay` INT NULL,
  `Class` INT NULL,
  PRIMARY KEY (`idProfession`),
  INDEX `Class_idx` (`Class` ASC) VISIBLE,
  CONSTRAINT `ProfessionC`
    FOREIGN KEY (`Class`)
    REFERENCES `Castle`.`Class` (`idClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Person` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Person` (
  `idPerson` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Class` INT NULL,
  `Profession` INT NULL,
  `Superior` INT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerson`),
  INDEX `Prof_idx` (`Profession` ASC) VISIBLE,
  INDEX `Superior_idx` (`Superior` ASC) VISIBLE,
  INDEX `Class_idx` (`Class` ASC) VISIBLE,
  CONSTRAINT `PersonP`
    FOREIGN KEY (`Profession`)
    REFERENCES `Castle`.`Profession` (`idProfession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonS`
    FOREIGN KEY (`Superior`)
    REFERENCES `Castle`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PersonC`
    FOREIGN KEY (`Class`)
    REFERENCES `Castle`.`Class` (`idClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Feature` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Feature` (
  `idFeatures` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Material` VARCHAR(45) NULL,
  PRIMARY KEY (`idFeatures`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Skill` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Skill` (
  `idSkill` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idSkill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Position_Requirement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Position_Requirement` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Position_Requirement` (
  `idPosition` INT NOT NULL AUTO_INCREMENT,
  `Profession` INT NULL,
  `Skill` INT NULL,
  `Level` INT NULL,
  PRIMARY KEY (`idPosition`),
  INDEX `Job_idx` (`Profession` ASC) VISIBLE,
  INDEX `Skill_idx` (`Skill` ASC) VISIBLE,
  CONSTRAINT `PositionRequirementJ`
    FOREIGN KEY (`Profession`)
    REFERENCES `Castle`.`Profession` (`idProfession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PositionRequirementS`
    FOREIGN KEY (`Skill`)
    REFERENCES `Castle`.`Skill` (`idSkill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Skill_Level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Skill_Level` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Skill_Level` (
  `idSkill` INT NOT NULL AUTO_INCREMENT,
  `Skill` INT NULL,
  `Person` INT NULL,
  `Level` INT NULL,
  `HoursToNext` INT NULL,
  PRIMARY KEY (`idSkill`),
  INDEX `Name_idx` (`Person` ASC) VISIBLE,
  INDEX `Skill_idx` (`Skill` ASC) VISIBLE,
  CONSTRAINT `SkillLevelN`
    FOREIGN KEY (`Person`)
    REFERENCES `Castle`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SkillLevelS`
    FOREIGN KEY (`Skill`)
    REFERENCES `Castle`.`Skill` (`idSkill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Location` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Location` (
  `idLocation` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idLocation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Location_Feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Location_Feature` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Location_Feature` (
  `idLocationFeature` INT NOT NULL AUTO_INCREMENT,
  `Location` INT NULL,
  `Feature` INT NULL,
  PRIMARY KEY (`idLocationFeature`),
  INDEX `FeatureID_idx` (`Feature` ASC) VISIBLE,
  INDEX `LocationID_idx` (`Location` ASC) VISIBLE,
  CONSTRAINT `LocationFF`
    FOREIGN KEY (`Feature`)
    REFERENCES `Castle`.`Feature` (`idFeatures`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `LocationL`
    FOREIGN KEY (`Location`)
    REFERENCES `Castle`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Location_Mapping`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Location_Mapping` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Location_Mapping` (
  `idLocationMapping` INT NOT NULL AUTO_INCREMENT,
  `Primary` INT NULL,
  `Contains` INT NULL,
  PRIMARY KEY (`idLocationMapping`),
  INDEX `Prim_idx` (`Primary` ASC) VISIBLE,
  INDEX `Sub_idx` (`Contains` ASC) VISIBLE,
  CONSTRAINT `LocationMappingP`
    FOREIGN KEY (`Primary`)
    REFERENCES `Castle`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `LocationMappingS`
    FOREIGN KEY (`Contains`)
    REFERENCES `Castle`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Shift`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Shift` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Shift` (
  `idShift` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `StartHour` INT NOT NULL,
  `EndHour` INT NULL,
  PRIMARY KEY (`idShift`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Location_Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Location_Staff` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Location_Staff` (
  `idLocationStaff` INT NOT NULL AUTO_INCREMENT,
  `Location` INT NULL,
  `Profession` INT NULL,
  `Min` INT NULL,
  `Max` INT NULL,
  `Shift` INT NULL,
  PRIMARY KEY (`idLocationStaff`),
  INDEX `Loc_idx` (`Location` ASC) VISIBLE,
  INDEX `Prof_idx` (`Profession` ASC) VISIBLE,
  INDEX `Shift_idx` (`Shift` ASC) VISIBLE,
  CONSTRAINT `LocationStaffL`
    FOREIGN KEY (`Location`)
    REFERENCES `Castle`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `LocationStaffP`
    FOREIGN KEY (`Profession`)
    REFERENCES `Castle`.`Profession` (`idProfession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `LocationStaffS`
    FOREIGN KEY (`Shift`)
    REFERENCES `Castle`.`Shift` (`idShift`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Schedule` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Schedule` (
  `idSchedule` INT NOT NULL AUTO_INCREMENT,
  `Person` INT NULL,
  `LocationStaff` INT NULL,
  `Day` VARCHAR(45) NULL,
  PRIMARY KEY (`idSchedule`),
  INDEX `Person_idx` (`Person` ASC) VISIBLE,
  INDEX `LocStaff_idx` (`LocationStaff` ASC) VISIBLE,
  CONSTRAINT `ScheduleP`
    FOREIGN KEY (`Person`)
    REFERENCES `Castle`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ScheduleL`
    FOREIGN KEY (`LocationStaff`)
    REFERENCES `Castle`.`Location_Staff` (`idLocationStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Castle`.`Battle_History`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Castle`.`Battle_History` ;

CREATE TABLE IF NOT EXISTS `Castle`.`Battle_History` (
  `idBattleHistory` INT NOT NULL AUTO_INCREMENT,
  `Person` INT NULL,
  `Battle` VARCHAR(45) NULL,
  `Profession` INT NULL,
  `Performance` INT NULL,
  PRIMARY KEY (`idBattleHistory`),
  INDEX `Per_idx` (`Person` ASC) VISIBLE,
  INDEX `PRof_idx` (`Profession` ASC) VISIBLE,
  CONSTRAINT `BattleHistoryPer`
    FOREIGN KEY (`Person`)
    REFERENCES `Castle`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BattleHistoryProf`
    FOREIGN KEY (`Profession`)
    REFERENCES `Castle`.`Profession` (`idProfession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS Castle_Ruler;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'Castle_Ruler';

GRANT ALL ON `Castle`.* TO 'Castle_Ruler';
GRANT SELECT, INSERT, TRIGGER ON TABLE `Castle`.* TO 'Castle_Ruler';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `Castle`.* TO 'Castle_Ruler';
GRANT SELECT ON TABLE `Castle`.* TO 'Castle_Ruler';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;