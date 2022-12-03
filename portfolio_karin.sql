-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2022 a las 22:40:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `portfolio_karin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `carrera` varchar(45) NOT NULL,
  `anio_inicio` date NOT NULL,
  `anio_fin` date DEFAULT NULL,
  `institucion` varchar(90) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `education`
--

INSERT INTO `education` (`id`, `carrera`, `anio_inicio`, `anio_fin`, `institucion`, `descripcion`, `persona_id`) VALUES
(1, 'Secundario', '1984-03-01', '1988-12-30', 'Instituto Modelo Hebreo Argentino \'Rambam\'', 'Trayectoria con especialización, bachiller con orientación pedagógica.', 1),
(2, 'Profesorado de Hebreo', '1990-05-01', '1993-12-30', 'Mijlelet Shazar', 'Carrera de profesora de hebreo nivel primario. Hice también materias intensivas en la Universidad de Tel Aviv, en Israel.', 1),
(3, 'Diseño Gráfico', '1991-03-01', '1993-12-30', 'ORT', 'Carrera terciaria de Diseño gráfico. Cursé en una época donde apenas empezaban a utilizarse las computadoras, el diseño era a mano y dedicarse al dise', 1),
(4, 'Desarrolladora Full Stack Jr.', '2020-06-28', '2023-01-15', 'Argentina Programa', 'Programa para la formación de desarrolladores Full Stack, donde aprendí muchísimo sobre esta especialización que tanto me apasiona.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exp_laboral`
--

CREATE TABLE `exp_laboral` (
  `id` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `lugar` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `anio_inicio` date DEFAULT NULL,
  `anio_fin` date DEFAULT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `exp_laboral`
--

INSERT INTO `exp_laboral` (`id`, `categoria`, `lugar`, `cargo`, `anio_inicio`, `anio_fin`, `persona_id`) VALUES
(1, 'Teaching', 'Asociación Amigos de la Astronomía', 'Investigación en fotografía electrónica (Mead', '2000-03-01', '2015-12-20', 1),
(2, 'Teaching', 'Escuela Tel Aviv', 'Docente de hebreo nivel primario. Enseñanza d', '2008-02-11', '2018-12-28', 1),
(3, 'Teaching', 'Escuela Dr.Hertz - Iona', 'Profesora de computación, programación y robó', '2021-09-01', '2022-12-28', 1),
(4, 'Teaching', 'GoINTEC (Ministerio de Educación C.A.B.A.)', 'Soy facilitadora pedagógico digital en nivel ', '2011-05-09', NULL, 1),
(5, 'Design', 'Asociación Amigos de la Astronomía', 'Diseño gráfico de algunos ejemplares de la re', '2000-05-02', '2015-09-28', 1),
(6, 'Design', 'Trabajos varios', 'Trabajos varios de diseño: logotipos, sitios ', '1994-01-02', NULL, 1),
(7, 'Design', 'TecnoDesign', 'Cambios en el código del sitio. Apertura y ma', '2020-04-09', '2021-10-05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cargo` varchar(150) NOT NULL,
  `foto_yo` varchar(100) NOT NULL,
  `sobre_mi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `cargo`, `foto_yo`, `sobre_mi`) VALUES
(1, 'Karin', 'Suchowlanski Drobiner', 'Desarrolladora Web Full Stack Jr.', 'https://drive.google.com/file/d/1TGJsmvvgtaoval9quTHyThnADWb4fepO/view?usp=sharing', '¡Hola! Yo soy Karin.\r\nMe apasiona aprender y enseñar, la tecnología, el diseño y la astronomía.\r\nMi meta es crecer y afianzarme profesionalmente como Desarrolladora Web Full Stack Jr.\r\nBusco formarme, estar actualizada, utilizando lo aprendido. \r\nSoy una persona curiosa, responsable, creativa, empática, ávida por aprender y descubrir soluciones nuevas.\r\nMe gustaría ser parte de un equipo y proyectos que me permitan seguir desarrollándome como profesional, mejorar mis habilidades y colaborar para lograr los objetivos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `imagen_proy` varchar(100) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `descripcion` longtext NOT NULL,
  `live_url` varchar(100) NOT NULL,
  `repo_url` varchar(100) DEFAULT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `project`
--

INSERT INTO `project` (`id`, `imagen_proy`, `titulo`, `descripcion`, `live_url`, `repo_url`, `persona_id`) VALUES
(1, 'https://drive.google.com/file/d/1DkjJ5naPScLDYZsnaIspkD5cU4C_JZEC/view?usp=sharing', 'Portfolio personal', 'Armado de portfolio personal utilizando las herramientas aprendidas de FrontEnd y BackEnd para Argentina Programa #YoProgramo, 3ª cohorte.', '', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `id` int(11) NOT NULL,
  `red` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `redes`
--

INSERT INTO `redes` (`id`, `red`, `link`, `persona_id`) VALUES
(1, 'Github', 'https://github.com/karinsudro', 1),
(2, 'LinkedIn', 'https://www.linkedin.com/in/karin-sudro/', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `habilidad_tipo` varchar(30) NOT NULL,
  `habilidad_nombre` varchar(45) NOT NULL,
  `progreso` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `skills`
--

INSERT INTO `skills` (`id`, `habilidad_tipo`, `habilidad_nombre`, `progreso`, `persona_id`) VALUES
(1, 'HardSkills', 'HTML 5', 90, 1),
(2, 'HardSkills', 'CSS 3', 90, 1),
(3, 'HardSkills', 'JavaScript', 50, 1),
(4, 'HardSkills', 'Bootstrap', 90, 1),
(5, 'HardSkills', 'Angular', 80, 1),
(6, 'HardSkills', 'BackEnd algun programa', 75, 1),
(7, 'HardSkills', 'Photoshop', 90, 1),
(8, 'HardSkills', 'Indesign', 90, 1),
(9, 'HardSkills', 'Illustrator', 90, 1),
(10, 'HardSkills', 'Hebreo', 90, 1),
(11, 'HardSkills', 'Inglés', 90, 1),
(12, 'SoftSkills', 'Colaborativa', 85, 1),
(13, 'SoftSkills', 'Comunicativa', 90, 1),
(14, 'SoftSkills', 'Empática', 90, 1),
(15, 'SoftSkills', 'Autodidacta', 85, 1),
(16, 'SoftSkills', 'Puntual', 90, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`,`persona_id`),
  ADD KEY `fk_education_persona_idx` (`persona_id`);

--
-- Indices de la tabla `exp_laboral`
--
ALTER TABLE `exp_laboral`
  ADD PRIMARY KEY (`id`,`persona_id`),
  ADD KEY `fk_exp_laboral_persona1_idx` (`persona_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`,`persona_id`),
  ADD KEY `fk_project_persona1_idx` (`persona_id`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`id`,`persona_id`),
  ADD KEY `fk_redes_persona1_idx` (`persona_id`);

--
-- Indices de la tabla `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`,`persona_id`),
  ADD KEY `fk_skills_persona1_idx` (`persona_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `exp_laboral`
--
ALTER TABLE `exp_laboral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `fk_education_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `exp_laboral`
--
ALTER TABLE `exp_laboral`
  ADD CONSTRAINT `fk_exp_laboral_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `fk_project_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `redes`
--
ALTER TABLE `redes`
  ADD CONSTRAINT `fk_redes_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `fk_skills_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
