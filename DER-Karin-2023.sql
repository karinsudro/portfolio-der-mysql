-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio_ksd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio_ksd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_ksd` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `portfolio_ksd` ;

-- -----------------------------------------------------
-- Table `portfolio_ksd`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ksd`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hola` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  `fondo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_ksd`.`exp_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ksd`.`exp_laboral` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `inicio` VARCHAR(4) NOT NULL,
  `fin` VARCHAR(4) NULL,
  `lugar` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_exp_laboral_persona1_idx` (`persona_id` ASC),
  CONSTRAINT `fk_exp_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ksd`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_ksd`.`red`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ksd`.`red` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `red` VARCHAR(50) NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  `icono` VARCHAR(100) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_red_persona1_idx` (`persona_id` ASC),
  CONSTRAINT `fk_red_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ksd`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_ksd`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ksd`.`project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `imagen` VARCHAR(100) NOT NULL,
  `proyecto` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `live_url` VARCHAR(100) NULL,
  `repo_url` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_project_persona1_idx` (`persona_id` ASC),
  CONSTRAINT `fk_project_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ksd`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_ksd`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ksd`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `carrera` VARCHAR(45) NOT NULL,
  `inicio` VARCHAR(4) NOT NULL,
  `fin` VARCHAR(4) NULL,
  `institucion` VARCHAR(90) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_education_persona_idx` (`persona_id` ASC),
  CONSTRAINT `fk_education_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ksd`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_karin`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_ksd`.`skill` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habil_tipo` VARCHAR(45) NOT NULL,
  `habil_nombre` VARCHAR(45) NOT NULL,
  `icono` VARCHAR(100) NULL,
  `progreso` INT NOT NULL,
  `color` VARCHAR(100) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_skill_persona1_idx` (`persona_id` ASC),
  CONSTRAINT `fk_skill_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_ksd`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
