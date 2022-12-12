-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio_karin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio_karin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_karin` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `portfolio_karin` ;

-- -----------------------------------------------------
-- Table `portfolio_karin`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_karin`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(150) NOT NULL,
  `foto_yo` VARCHAR(100) NOT NULL,
  `sobre_mi` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_karin`.`exp_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_karin`.`exp_laboral` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  `lugar` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `anio_inicio` DATE NOT NULL,
  `anio_fin` DATE NULL,
  `descripcion` LONGTEXT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_exp_laboral_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_exp_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_karin`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_karin`.`redes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_karin`.`redes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `red` VARCHAR(50) NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_redes_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_redes_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_karin`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_karin`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_karin`.`project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `imagen_proy` VARCHAR(100) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `live_url` VARCHAR(100) NOT NULL,
  `repo_url` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_project_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_project_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_karin`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_karin`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_karin`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `carrera` VARCHAR(45) NOT NULL,
  `anio_inicio` DATE NOT NULL,
  `anio_fin` DATE NULL,
  `institucion` VARCHAR(90) NULL,
  `descripcion` VARCHAR(150) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_education_persona_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_education_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_karin`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `portfolio_karin`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio_karin`.`skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `habilidad_tipo` VARCHAR(100) NOT NULL,
  `habilidad_nombre` VARCHAR(45) NOT NULL,
  `progreso` INT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_skills_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_skills_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio_karin`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
