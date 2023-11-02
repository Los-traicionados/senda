-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-11-2023 a las 22:28:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_senda`
--

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `direccion`, `fecha_nacimiento`, `telefono`) VALUES
(1, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', '2023-11-01 14:51:03.871126', 1, 'senda', '', '', 'senda@senda.com', 1, 1, '2023-11-01 14:49:23.270714', '', '', NULL, ''),
(2, '123456', NULL, 0, 'María', '', '', '', 0, 1, '2023-11-01 14:57:30.000000', 'A123456B', 'Ronda', '2023-11-01 14:58:11.000000', '123456789'),
(3, 'Pedro', NULL, 0, 'Pedro', '', '', '', 0, 1, '2023-11-01 14:59:13.000000', 'A123457B', 'Madrid', '2023-11-01 14:59:46.000000', '123456789'),
(4, '123456', NULL, 0, 'Celia', '', '', '', 0, 1, '2023-11-01 21:11:09.000000', 'A1234568B', 'Su casa', '2023-11-01 21:12:26.000000', '123456'),
(5, '123456', NULL, 0, 'Valeria', '', '', '', 0, 1, '2023-11-01 21:12:28.000000', 'A1234569B', 'Casa', '2023-11-01 21:13:02.000000', '123546'),
(6, '123456', NULL, 0, 'Alexander', '', '', '', 0, 1, '2023-11-01 21:13:03.000000', 'A1234570B', 'Casa', '2023-11-01 21:13:20.000000', '123456'),
(7, '123456', NULL, 0, 'Álvaro', '', '', '', 0, 1, '2023-11-01 21:13:33.000000', 'A1234571B', 'Casa', '2023-11-01 21:13:49.000000', '123456'),
(8, '123456', NULL, 0, 'Alonso', '', '', '', 0, 1, '2023-11-01 21:13:57.000000', 'A1234572B', 'Trabajo', '2023-11-01 21:14:20.000000', '123456'),
(9, '123456', NULL, 0, 'Mario', '', '', '', 0, 1, '2023-11-01 21:14:32.000000', 'A1234572B', 'Madrid', '2023-11-01 21:14:59.000000', '123456'),
(10, '123456', NULL, 0, 'Pablo', '', '', '', 0, 1, '2023-11-01 21:15:12.000000', 'A1234573B', 'Madrid', '2023-11-01 21:15:32.000000', '123456'),
(11, '123456', NULL, 0, 'Nora', '', '', '', 0, 1, '2023-11-01 21:15:34.000000', 'A1234573B', 'Madrid', '2023-11-01 21:15:51.000000', '123456'),
(12, '123456', NULL, 0, 'Olga', '', '', '', 0, 1, '2023-11-01 21:16:07.000000', 'A1234574B', 'Valencia', '2023-11-01 21:16:21.000000', '123456');

--
-- Volcado de datos para la tabla `booking_actividad`
--

INSERT INTO `booking_actividad` (`id`, `act_nombre`, `act_descripcion`, `act_precio`) VALUES
(1, 'Paseo a Caballo', 'Paseo en burro', 12.00),
(2, 'Excursión Bus', 'Paseo en bus por la ciudad', 15.00),
(3, 'Recorrido gastronómico', 'Comidaaa!', 30.00),
(4, 'Crucero', 'Mar y bebida', 100.00),
(5, 'Excursión Castillos', '...', 20.00),
(6, 'Museo', 'Cosas de historia', 10.00),
(7, 'Clases de cocina', 'Más comida', 25.00),
(8, 'Excursión por viñedo', 'Incluye vino', 12.00),
(9, 'Espectáculo nocturno', 'Bailes, obras y esas cosas', 14.00),
(10, 'Traslado privado', 'De un lugar a otro', 23.50),
(11, 'Aventura vintage', '...', 10.50);

--
-- Volcado de datos para la tabla `booking_hotel`
--

INSERT INTO `booking_hotel` (`id`, `ho_nombre`, `ho_direccion`, `ho_precio`) VALUES
(1, 'Riu', 'Plaza España', 159.00),
(2, 'Ibis', 'Porai', 68.00),
(3, 'NH', 'Porai', 134.00),
(4, 'Príncipe Pio', 'PPio', 107.00),
(5, 'Petit palace', '...', 116.00),
(6, 'Woohoo suites', 'Woohoo', 89.00),
(7, 'Eurostars', '...', 103.00),
(8, 'Hat', '...', 48.00),
(9, 'Vértice', '...', 52.00),
(10, 'Catalonia', 'Gran vía', 162.00),
(11, 'Santo Domingo', 'Madrid', 108.00);

--
-- Volcado de datos para la tabla `booking_pack`
--

INSERT INTO `booking_pack` (`id`, `pa_nombre`, `pa_descipcion`, `actividad_id`, `hotel_id`, `vuelo_id`) VALUES
(1, 'Madrid un finde', 'Estadía Madrid y luego París', NULL, 1, 1);

--
-- Volcado de datos para la tabla `booking_reserva`
--

INSERT INTO `booking_reserva` (`id`, `res_f_inicio`, `res_f_fin`, `res_precio`, `client_id`, `empleado_id`, `pack_id`) VALUES
(1, NULL, NULL, 5.00, 2, 2, 1),
(2, NULL, NULL, 6.00, 7, 2, 1),
(3, NULL, NULL, 7.00, 8, 2, 1),
(4, NULL, NULL, 32.00, 8, 3, 1),
(5, NULL, NULL, 61.00, 5, 2, 1),
(6, NULL, NULL, 12.00, 4, 2, 1),
(7, NULL, NULL, 432.00, 9, 4, 1);

--
-- Volcado de datos para la tabla `booking_vuelo`
--

INSERT INTO `booking_vuelo` (`id`, `vu_nombre`, `vu_precio`, `vu_asiento`) VALUES
(1, 'Madrid - Paris', 75.00, 'A5'),
(2, 'Paris - Madrid', 25.00, 'A1'),
(3, 'Madrid - Valencia', 80.00, 'C1'),
(4, 'Valencia - Madrid', 29.00, 'H1'),
(5, 'Madrid - Barcelona', 58.00, 'J1'),
(6, 'Barcelona - Madrid', 78.00, 'O1'),
(7, 'Madrid - Ámsterdam', 97.00, 'Y1'),
(8, 'Madrid - Lisboa', 67.00, 'K9'),
(9, 'Lisboa - Madrid', 46.00, 'G2'),
(10, 'Ámsterdam - Roma', 47.00, 'N1');

--
-- Volcado de datos para la tabla `user_cliente`
--

INSERT INTO `user_cliente` (`id`, `user_id`) VALUES
(2, 3),
(3, 4),
(4, 6),
(5, 7),
(6, 9),
(7, 10),
(8, 11),
(9, 12);

--
-- Volcado de datos para la tabla `user_empleado`
--

INSERT INTO `user_empleado` (`id`, `p_emp_id`, `user_id`) VALUES
(2, 2, 2),
(3, 2, 3),
(4, 3, 5);

--
-- Volcado de datos para la tabla `user_puestoempleado`
--

INSERT INTO `user_puestoempleado` (`id`, `p_emp_nombre`, `p_emp_descripcion`) VALUES
(2, 'Vendedor', 'Vende cosas'),
(3, 'Encargado', 'Hace cosas');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
