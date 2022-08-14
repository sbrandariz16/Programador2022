-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-08-2022 a las 17:20:59
-- Versión del servidor: 5.6.51-log
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c1610719_pcanina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dueno`
--

CREATE TABLE `Dueno` (
  `DNI` int(25) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Telefono` int(25) NOT NULL,
  `Direccion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Dueno`
--

INSERT INTO `Dueno` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES
(22567876, 'Romualdo', 'Quijano', 1176890909, 'Balcarce 49'),
(25555666, 'Fabian', 'Rojas', 1133446776, 'Anchorena 344'),
(27456897, 'Paulina', 'Rodriguez', 1178965454, 'Cabildo 3456'),
(33666777, 'Cristina', 'Gomez', 1155445665, 'Santa Fe 2458');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial`
--

CREATE TABLE `Historial` (
  `ID_Historial` int(25) NOT NULL,
  `Fecha` date NOT NULL,
  `Perro` int(25) NOT NULL,
  `Descripcion` int(25) NOT NULL,
  `Monto` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Historial`
--

INSERT INTO `Historial` (`ID_Historial`, `Fecha`, `Perro`, `Descripcion`, `Monto`) VALUES
(1, '2022-08-08', 1, 23, 3400),
(2, '2022-08-09', 2, 34, 7000),
(3, '2021-06-15', 3, 45, 235),
(10, '2022-06-06', 4, 35, 7850);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Perro`
--

CREATE TABLE `Perro` (
  `ID_Perro` int(25) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` char(5) NOT NULL,
  `DNI_Dueno` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Perro`
--

INSERT INTO `Perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `DNI_Dueno`) VALUES
(1, 'Firulai', '2021-12-22', 'Macho', 33666777),
(2, 'Blanca', '2022-05-24', 'Fem', 22567876),
(3, 'Cacho', '2018-05-07', 'Macho', 27456897),
(4, 'Morena', '2019-08-09', 'Fem', 27456897);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Dueno`
--
ALTER TABLE `Dueno`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD KEY `Perro` (`Perro`);

--
-- Indices de la tabla `Perro`
--
ALTER TABLE `Perro`
  ADD PRIMARY KEY (`ID_Perro`),
  ADD KEY `DNI_Dueno` (`DNI_Dueno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Historial`
--
ALTER TABLE `Historial`
  MODIFY `ID_Historial` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `Perro`
--
ALTER TABLE `Perro`
  MODIFY `ID_Perro` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Perro`
--
ALTER TABLE `Perro`
  ADD CONSTRAINT `Perro_ibfk_1` FOREIGN KEY (`DNI_Dueno`) REFERENCES `Dueno` (`DNI`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Perro_ibfk_2` FOREIGN KEY (`ID_Perro`) REFERENCES `Historial` (`Perro`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
