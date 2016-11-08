-- MySQL Script generated by MySQL Workbench
-- 11/08/16 20:33:24
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema depOrientacion
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `depOrientacion` ;

-- -----------------------------------------------------
-- Schema depOrientacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `depOrientacion` DEFAULT CHARACTER SET utf8 ;
USE `depOrientacion` ;

-- -----------------------------------------------------
-- Table `depOrientacion`.`Consejo_Orientador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Consejo_Orientador` (
  `idConsejo_Orientador` INT NOT NULL,
  `opciones` VARCHAR(45) NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`idConsejo_Orientador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `depOrientacion`.`Transito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Transito` (
  `idTransito` INT NULL AUTO_INCREMENT,
  `ceip` VARCHAR(80) NULL DEFAULT 'colegio procedencia',
  `repeticiones` INT(1) NULL,
  `ncc` VARCHAR(45) NULL DEFAULT 'nivel competencia curricular',
  `area_suspensa` VARCHAR(45) NULL,
  `observaciones` VARCHAR(100) NULL,
  PRIMARY KEY (`idTransito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `depOrientacion`.`Trayect_Acad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Trayect_Acad` (
  `idTrayect_Acad` INT NOT NULL,
  `ano_academico` VARCHAR(9) NOT NULL,
  `grupo` VARCHAR(4) NOT NULL,
  `evaluaciones` VARCHAR(30) NOT NULL,
  `observaciones` VARCHAR(100) NOT NULL,
  `pendientes` VARCHAR(45) NULL COMMENT 'Asignaturas pendientes.',
  `promocion` VARCHAR(15) NOT NULL,
  `titulacion` VARCHAR(2) NULL,
  `fecha_ev` DATETIME NULL,
  `propuesta` VARCHAR(20) NULL,
  `inte_grup` VARCHAR(45) NULL COMMENT 'Integracion Grupal',
  `tutor` VARCHAR(45) NULL,
  PRIMARY KEY (`idTrayect_Acad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `depOrientacion`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`provincias` (
  `cod` CHAR(2) NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `comunidad_id` TINYINT(4) NULL,
  PRIMARY KEY (`cod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `depOrientacion`.`Alumnado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Alumnado` (
  `idAlumnado` INT NOT NULL AUTO_INCREMENT,
  `apellidos` VARCHAR(45) NULL,
  `nombre` VARCHAR(30) NULL,
  `nie` INT(7) NULL,
  `dni` VARCHAR(9) NULL,
  `fechaNacimiento` DATETIME NULL,
  `edad` INT(2) NULL,
  `fotoAlumnado` VARCHAR(45) NULL,
  `Consejo_Orientador_idConsejo_Orientador` INT NOT NULL,
  `Transito_idTransito` INT NOT NULL,
  `Trayect_Acad_idTrayect_Acad` INT NOT NULL,
  `nombreT1` VARCHAR(80) NULL,
  `dniT1` VARCHAR(9) NULL,
  `nombreT2` VARCHAR(80) NULL,
  `dniT2` VARCHAR(9) NULL,
  `direccion` VARCHAR(45) NULL,
  `cp` INT(5) NULL,
  `poblacion` VARCHAR(45) NULL,
  `cod_provincia` VARCHAR(45) NULL,
  `telefono1` INT(9) NULL,
  `telefono2` INT(9) NULL,
  `tipo` VARCHAR(45) NULL,
  `situacion` VARCHAR(45) NULL,
  `implicacion_escolar` VARCHAR(45) NULL,
  `provincias_cod` CHAR(2) NOT NULL,
  `provincias_cod1` CHAR(2) NOT NULL,
  PRIMARY KEY (`idAlumnado`, `Consejo_Orientador_idConsejo_Orientador`, `provincias_cod`, `provincias_cod1`),
  CONSTRAINT `fk_Alumnado_Consejo_Orientador1`
    FOREIGN KEY (`Consejo_Orientador_idConsejo_Orientador`)
    REFERENCES `depOrientacion`.`Consejo_Orientador` (`idConsejo_Orientador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnado_Transito1`
    FOREIGN KEY (`Transito_idTransito`)
    REFERENCES `depOrientacion`.`Transito` (`idTransito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnado_Trayect_Acad1`
    FOREIGN KEY (`Trayect_Acad_idTrayect_Acad`)
    REFERENCES `depOrientacion`.`Trayect_Acad` (`idTrayect_Acad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnado_provincias1`
    FOREIGN KEY (`provincias_cod`)
    REFERENCES `depOrientacion`.`provincias` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnado_provincias2`
    FOREIGN KEY (`provincias_cod1`)
    REFERENCES `depOrientacion`.`provincias` (`cod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Alumnado_Consejo_Orientador1_idx` ON `depOrientacion`.`Alumnado` (`Consejo_Orientador_idConsejo_Orientador` ASC);

CREATE INDEX `fk_Alumnado_Transito1_idx` ON `depOrientacion`.`Alumnado` (`Transito_idTransito` ASC);

CREATE INDEX `fk_Alumnado_Trayect_Acad1_idx` ON `depOrientacion`.`Alumnado` (`Trayect_Acad_idTrayect_Acad` ASC);

CREATE INDEX `fk_Alumnado_provincias1_idx` ON `depOrientacion`.`Alumnado` (`provincias_cod` ASC);

CREATE INDEX `fk_Alumnado_provincias2_idx` ON `depOrientacion`.`Alumnado` (`provincias_cod1` ASC);


-- -----------------------------------------------------
-- Table `depOrientacion`.`Entrevistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Entrevistas` (
  `idEntrevistas` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `motivo` VARCHAR(45) NULL,
  `asistentes` VARCHAR(20) NULL,
  `temas` VARCHAR(100) NULL,
  `acuerdos` VARCHAR(100) NULL,
  `Alumnado_idAlumnado` INT NOT NULL,
  `Alumnado_Familia_idFamilia` INT NOT NULL,
  `Alumnado_Consejo_Orientador_idConsejo_Orientador` INT NOT NULL,
  PRIMARY KEY (`idEntrevistas`, `Alumnado_idAlumnado`, `Alumnado_Familia_idFamilia`, `Alumnado_Consejo_Orientador_idConsejo_Orientador`),
  CONSTRAINT `fk_Entrevistas_Alumnado1`
    FOREIGN KEY (`Alumnado_idAlumnado` , `Alumnado_Consejo_Orientador_idConsejo_Orientador`)
    REFERENCES `depOrientacion`.`Alumnado` (`idAlumnado` , `Consejo_Orientador_idConsejo_Orientador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Entrevistas_Alumnado1_idx` ON `depOrientacion`.`Entrevistas` (`Alumnado_idAlumnado` ASC, `Alumnado_Familia_idFamilia` ASC, `Alumnado_Consejo_Orientador_idConsejo_Orientador` ASC);


-- -----------------------------------------------------
-- Table `depOrientacion`.`Datos_Salud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Datos_Salud` (
  `idDatos_Salud` INT NULL AUTO_INCREMENT,
  `datos_medicos` VARCHAR(100) NULL,
  `datos_psicologicos` VARCHAR(100) NULL,
  `informes` VARCHAR(100) NULL,
  `Alumnado_idAlumnado` INT NOT NULL,
  `Alumnado_Familia_idFamilia` INT NOT NULL,
  PRIMARY KEY (`idDatos_Salud`, `Alumnado_idAlumnado`, `Alumnado_Familia_idFamilia`),
  CONSTRAINT `fk_Datos_Salud_Alumnado1`
    FOREIGN KEY (`Alumnado_idAlumnado`)
    REFERENCES `depOrientacion`.`Alumnado` (`idAlumnado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Datos_Salud_Alumnado1_idx` ON `depOrientacion`.`Datos_Salud` (`Alumnado_idAlumnado` ASC, `Alumnado_Familia_idFamilia` ASC);


-- -----------------------------------------------------
-- Table `depOrientacion`.`Protocolos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Protocolos` (
  `idProtocolos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_ini` DATETIME NOT NULL,
  `fecha_fin` DATETIME NOT NULL,
  `observaciones` VARCHAR(100) NULL,
  `Alumnado_idAlumnado` INT NOT NULL,
  `Alumnado_Familia_idFamilia` INT NOT NULL,
  PRIMARY KEY (`idProtocolos`, `Alumnado_idAlumnado`, `Alumnado_Familia_idFamilia`),
  CONSTRAINT `fk_Protocolos_Alumnado1`
    FOREIGN KEY (`Alumnado_idAlumnado`)
    REFERENCES `depOrientacion`.`Alumnado` (`idAlumnado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Protocolos_Alumnado1_idx` ON `depOrientacion`.`Protocolos` (`Alumnado_idAlumnado` ASC, `Alumnado_Familia_idFamilia` ASC);


-- -----------------------------------------------------
-- Table `depOrientacion`.`Neae`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Neae` (
  `idNeae` INT NOT NULL,
  `censo` VARCHAR(45) NULL,
  `ev_ps` VARCHAR(100) NULL COMMENT 'Evaluacion Psicopedagogica PDF',
  `dic_es` VARCHAR(100) NULL COMMENT 'Dictamen de Escolarizacion PDF',
  `Alumnado_idAlumnado` INT NOT NULL,
  `Alumnado_Familia_idFamilia` INT NOT NULL,
  PRIMARY KEY (`idNeae`, `Alumnado_idAlumnado`, `Alumnado_Familia_idFamilia`),
  CONSTRAINT `fk_Neae_Alumnado1`
    FOREIGN KEY (`Alumnado_idAlumnado`)
    REFERENCES `depOrientacion`.`Alumnado` (`idAlumnado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Neae_Alumnado1_idx` ON `depOrientacion`.`Neae` (`Alumnado_idAlumnado` ASC, `Alumnado_Familia_idFamilia` ASC);


-- -----------------------------------------------------
-- Table `depOrientacion`.`MedidasAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`MedidasAD` (
  `idMedidasAD` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_ini` DATETIME NULL,
  `fecha_fin` DATETIME NULL,
  `observaciones` VARCHAR(100) NULL,
  `Alumnado_idAlumnado` INT NOT NULL,
  `Alumnado_Familia_idFamilia` INT NOT NULL,
  PRIMARY KEY (`idMedidasAD`, `Alumnado_idAlumnado`, `Alumnado_Familia_idFamilia`),
  CONSTRAINT `fk_MedidasAD_Alumnado1`
    FOREIGN KEY (`Alumnado_idAlumnado`)
    REFERENCES `depOrientacion`.`Alumnado` (`idAlumnado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_MedidasAD_Alumnado1_idx` ON `depOrientacion`.`MedidasAD` (`Alumnado_idAlumnado` ASC, `Alumnado_Familia_idFamilia` ASC);


-- -----------------------------------------------------
-- Table `depOrientacion`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usu` VARCHAR(45) NULL,
  `nombre_persona` VARCHAR(45) NULL,
  `apellidos_persona` VARCHAR(60) NULL,
  `correo` VARCHAR(180) NULL,
  `estado` CHAR(1) NULL,
  `dni` VARCHAR(10) NULL,
  `clave` VARCHAR(260) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `depOrientacion`.`Usuario_has_Alumnado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `depOrientacion`.`Usuario_has_Alumnado` (
  `Usuario_idUsuario` INT NOT NULL,
  `Alumnado_idAlumnado` INT NOT NULL,
  `Alumnado_Familia_idFamilia` INT NOT NULL,
  `Alumnado_Consejo_Orientador_idConsejo_Orientador` INT NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Alumnado_idAlumnado`, `Alumnado_Familia_idFamilia`, `Alumnado_Consejo_Orientador_idConsejo_Orientador`),
  CONSTRAINT `fk_Usuario_has_Alumnado_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `depOrientacion`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Alumnado_Alumnado1`
    FOREIGN KEY (`Alumnado_idAlumnado` , `Alumnado_Consejo_Orientador_idConsejo_Orientador`)
    REFERENCES `depOrientacion`.`Alumnado` (`idAlumnado` , `Consejo_Orientador_idConsejo_Orientador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Usuario_has_Alumnado_Alumnado1_idx` ON `depOrientacion`.`Usuario_has_Alumnado` (`Alumnado_idAlumnado` ASC, `Alumnado_Familia_idFamilia` ASC, `Alumnado_Consejo_Orientador_idConsejo_Orientador` ASC);

CREATE INDEX `fk_Usuario_has_Alumnado_Usuario1_idx` ON `depOrientacion`.`Usuario_has_Alumnado` (`Usuario_idUsuario` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;