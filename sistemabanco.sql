-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2022 a las 03:37:59
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemabanco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` int(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `monto_dinero` double NOT NULL,
  `numero_cuenta` varchar(13) NOT NULL,
  `clave_web` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombres`, `apellidos`, `direccion`, `email`, `monto_dinero`, `numero_cuenta`, `clave_web`) VALUES
(12345671, 'Sergio Daniel', 'Mogollon Caceres', 'Javier Luna Pizarro Mz. A Lote 1 - Cerro Colorado', 'smogollon@unsa.edu.pe', 4149.169999999999, '3003314747231', 'sergio123'),
(12345672, 'Nelzon Jorge', 'Apaza Apaza', 'Av. Avenida Miguel Forga #224  Arequipa - Arequipa', 'napaza@unsa.edu.pe', 705.5100000000001, '3003314747232', 'nelzon123'),
(12345673, 'Luciana Julissa', 'Huaman Coaquira', 'Cal. Calle Ricardo Palma #502 , Frente Al Parque Libertad De Expresion - Arequipa / Arequipa / Arequipa', 'lhuaman@unsa.edu.pe', 111.38999999999999, '3003314747233', 'luciana123'),
(12345674, 'Braulio Nayap', 'Maldonado Casilla', 'Cal. Calle Cahuide #313 , Esq. Con La Calle America - Arequipa / Arequipa / Alto Selva Alegre', 'bmaldonado@unsa.edu.pe', 527.8499999999999, '3003314747234', 'braulio123'),
(12345675, 'Jharold Alonso', 'Mayorga Villena', 'Cal. Calle Huanuco #107 , - - Arequipa / Arequipa / Mariano Melgar', 'jmayorga@unsa.edu.pe', 5001.55, '3003314747235', 'jharold123'),
(12345676, 'Paul Antony', 'Parizaca Mozo', 'Pj. Pasaje Las Lilas #108 , Una Cuadra Del Bembos - Arequipa / Arequipa / Yanahuara', 'pparizaca@unsa.edu.pe', 625.99, '3003314747236', 'paul123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `codigo` int(10) NOT NULL,
  `cuenta_receptora` varchar(20) NOT NULL,
  `cuenta_emisora` varchar(20) NOT NULL,
  `monto` float NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `hora` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`codigo`, `cuenta_receptora`, `cuenta_emisora`, `monto`, `fecha`, `hora`) VALUES
(3, '123456789', '789456123', 100, '2022-08-15', '16:50:11'),
(11, '3003314747233', '3003314747231', 1.55, '2022-08-23', '16:57:28'),
(13, '3003314747234', '3003314747231', 1.25, '2022-08-23', '18:12:16'),
(14, '3003314747236', '3003314747231', 2.66, '2022-08-23', '18:12:50'),
(15, '3003314747232', '3003314747231', 3.33, '2022-08-23', '18:13:03'),
(16, '3003314747237', '3003314747231', 55.55, '2022-08-24', '11:48:49'),
(17, '3003314747237', '3003314747231', 55.55, '2022-08-24', '11:48:54'),
(18, '3003314747237', '3003314747231', 55.55, '2022-08-24', '11:49:01'),
(19, '3003314747237', '3003314747231', 55.55, '2022-08-24', '11:49:01'),
(20, '3003314747237', '3003314747231', 10, '2022-08-24', '11:49:43'),
(21, '3003314747237', '3003314747231', 2.5, '2022-08-24', '12:30:46'),
(22, '3003314747237', '3003314747231', 1.44, '2022-08-24', '12:32:09'),
(23, '3003314747237', '3003314747231', 1.2, '2022-08-24', '12:34:09'),
(24, '3003314747237', '3003314747231', 1.2, '2022-08-24', '12:38:14'),
(25, '3003314747237', '3003314747231', 1.2, '2022-08-24', '12:38:35'),
(26, '3003314747237', '3003314747231', 1.3, '2022-08-24', '12:39:12'),
(27, '3003314747237', '3003314747231', 1.2, '2022-08-24', '12:39:43'),
(28, '3003314747233', '3003314747231', 1.8, '2022-08-24', '17:58:20'),
(29, '3003314747236', '3003314747231', 23.33, '2022-08-24', '18:49:48'),
(30, '3003314747235', '3003314747231', 1.55, '2022-08-24', '19:00:28'),
(31, '3003314747234', '3003314747231', 25.55, '2022-08-24', '19:13:39'),
(32, '3003314747234', '3003314747231', 1.05, '2022-08-24', '19:16:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
