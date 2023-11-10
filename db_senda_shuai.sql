-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2023 at 10:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_senda`
--

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `direccion`, `fecha_nacimiento`, `telefono`) VALUES
(1, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', '2023-11-09 15:05:55.197519', 1, 'senda', '', '', 'senda@senda.com', 1, 1, '2023-11-01 14:49:23.270714', '', '', NULL, ''),
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
(12, '123456', NULL, 0, 'Olga', '', '', '', 0, 1, '2023-11-01 21:16:07.000000', 'A1234574B', 'Valencia', '2023-11-01 21:16:21.000000', '123456'),
(13, 'pbkdf2_sha256$320000$SEaO59o8fsCNF3Hkw5UrvT$mSVPKW/r8kZ54/bgrKbM2sTjhM/8cQQpa8ZnsFRE1Zg=', '2023-11-08 13:46:14.707929', 0, 'hola', '', '', 'infosenda42@gmail.com', 0, 1, '2023-11-08 13:46:14.478244', '', '', NULL, ''),
(14, 'pbkdf2_sha256$320000$ERadbRzG860gi7qYK4sNvG$3UtRpG5a7flFH5RdkqMjSaROnDJcKXq0C9msBJsa7cI=', '2023-10-08 16:41:45.000000', 0, 'leo', '', '', 'leonxrdo.n@gmail.com', 0, 1, '2023-11-08 16:41:44.000000', 'werg', 'werg', NULL, 'wgr'),
(15, 'pbkdf2_sha256$320000$0Xo2sHCh1yVqGTu1uaGTYf$2LhPAhPkzxSAJPrUcbySiD0RnZtuN67/XlBdeNWzRJI=', '2023-11-09 15:05:34.435483', 0, 'shuai', '', '', 'elenajiangholaaa@gmail.com', 0, 1, '2023-11-05 16:42:32.000000', 'y3584837w', 'calle libertad', NULL, '691297433'),
(17, 'pbkdf2_sha256$320000$hLZSQtlHiA221lhPboruh0$yWG+S0YfvQJe2jW4iTp724tEUAVTk/7fFi6JiKmx6ss=', '2023-11-09 10:26:25.000000', 0, 'sandia', '', '', '439092301@qq.com', 0, 1, '2023-10-01 10:26:23.000000', 'Y8879479497', 'wuifgy', NULL, '6559554');

--
-- Dumping data for table `booking_actividad`
--

INSERT INTO `booking_actividad` (`id`, `act_nombre`, `act_descripcion`, `act_precio`, `act_imagen`) VALUES
(1, 'Paseo a Caballo', 'Paseo en burro', 12.00, ''),
(2, 'Excursión Bus', 'Paseo en bus por la ciudad', 15.00, ''),
(3, 'Recorrido gastronómico', 'Comidaaa!', 30.00, ''),
(4, 'Crucero', 'Mar y bebida', 100.00, ''),
(5, 'Excursión Castillos', '...', 20.00, ''),
(6, 'Museo', 'Cosas de historia', 10.00, ''),
(7, 'Clases de cocina', 'Más comida', 25.00, ''),
(8, 'Excursión por viñedo', 'Incluye vino', 12.00, ''),
(9, 'Espectáculo nocturno', 'Bailes, obras y esas cosas', 14.00, ''),
(10, 'Traslado privado', 'De un lugar a otro', 23.50, ''),
(11, 'Aventura vintage', '...', 10.50, '');

--
-- Dumping data for table `booking_hotel`
--

INSERT INTO `booking_hotel` (`id`, `ho_nombre`, `ho_direccion`, `ho_precio`, `ho_imagen`) VALUES
(1, 'Riu', 'Plaza España', 159.00, ''),
(2, 'Ibis', 'Porai', 68.00, ''),
(3, 'NH', 'Porai', 134.00, ''),
(4, 'Príncipe Pio', 'PPio', 107.00, ''),
(5, 'Petit palace', '...', 116.00, ''),
(6, 'Woohoo suites', 'Woohoo', 89.00, ''),
(7, 'Eurostars', '...', 103.00, ''),
(8, 'Hat', '...', 48.00, ''),
(9, 'Vértice', '...', 52.00, ''),
(10, 'Catalonia', 'Gran vía', 162.00, ''),
(11, 'Santo Domingo', 'Madrid', 108.00, '');

--
-- Dumping data for table `booking_pack`
--

INSERT INTO `booking_pack` (`id`, `pa_nombre`, `pa_descipcion`, `pa_imagen`, `actividad_id`, `hotel_id`, `vuelo_id`) VALUES
(1, 'Madrid un finde', 'Estadía Madrid y luego París', '', NULL, 1, 1);

--
-- Dumping data for table `booking_reserva`
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
-- Dumping data for table `booking_vuelo`
--

INSERT INTO `booking_vuelo` (`id`, `vu_nombre`, `vu_precio`, `vu_asiento`, `vu_imagen`) VALUES
(1, 'Madrid - Paris', 75.00, 'A5', ''),
(2, 'Paris - Madrid', 25.00, 'A1', ''),
(3, 'Madrid - Valencia', 80.00, 'C1', ''),
(4, 'Valencia - Madrid', 29.00, 'H1', ''),
(5, 'Madrid - Barcelona', 58.00, 'J1', ''),
(6, 'Barcelona - Madrid', 78.00, 'O1', ''),
(7, 'Madrid - Ámsterdam', 97.00, 'Y1', ''),
(8, 'Madrid - Lisboa', 67.00, 'K9', ''),
(9, 'Lisboa - Madrid', 46.00, 'G2', ''),
(10, 'Ámsterdam - Roma', 47.00, 'N1', '');

--
-- Dumping data for table `user_cliente`
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
-- Dumping data for table `user_countemails`
--

INSERT INTO `user_countemails` (`id`, `user`, `email`, `asunto`, `fecha`) VALUES
(1, 'senda', 'senda@senda.com', 'test', '2023-11-08 17:24:21.502680'),
(2, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-08 17:24:22.738327'),
(3, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-08 17:24:24.032318'),
(4, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-08 17:24:25.280521'),
(5, 'senda', 'senda@senda.com', 'test', '2023-11-08 17:24:29.444857'),
(6, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-08 17:24:30.645273'),
(7, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-08 17:24:31.851490'),
(8, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-08 17:24:33.034867'),
(9, 'senda', 'senda@senda.com', 'test', '2023-11-08 17:37:32.581231'),
(10, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-08 17:37:33.817934'),
(11, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-08 17:37:34.960520'),
(12, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-08 17:37:36.113117'),
(13, 'senda', 'senda@senda.com', 'test', '2023-11-09 10:04:29.736098'),
(14, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 10:04:31.167307'),
(15, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 10:04:32.804142'),
(16, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 10:04:34.340365'),
(17, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 11:32:17.879842'),
(18, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 11:32:19.412861'),
(19, 'sandia', '439092301@qq.com', 'test', '2023-11-09 11:36:21.026752'),
(20, 'senda', 'senda@senda.com', 'test', '2023-11-09 11:41:00.656177'),
(21, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 11:41:01.965046'),
(22, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 11:41:03.632522'),
(23, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 11:41:05.069431'),
(24, 'senda', 'senda@senda.com', 'test', '2023-11-09 11:45:16.026005'),
(25, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 11:45:17.548901'),
(26, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 11:45:19.195415'),
(27, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 11:45:20.753760'),
(28, 'senda', 'senda@senda.com', 'test', '2023-11-09 14:39:19.233433'),
(29, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 14:39:20.565317'),
(30, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 14:39:21.794331'),
(31, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 14:39:23.125822'),
(32, 'senda', 'senda@senda.com', 'test', '2023-11-09 14:40:02.141099'),
(33, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 14:40:03.471135'),
(34, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 14:40:04.905218'),
(35, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 14:40:06.341097'),
(36, 'senda', 'senda@senda.com', 'test', '2023-11-09 15:27:37.987658'),
(37, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 15:27:39.217767'),
(38, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 15:27:40.650678'),
(39, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 15:27:42.787240'),
(40, 'senda', 'senda@senda.com', 'test', '2023-11-09 15:31:51.332259'),
(41, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 15:31:52.762423'),
(42, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 15:31:54.111091'),
(43, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 15:31:55.427470'),
(44, 'senda', 'senda@senda.com', 'test', '2023-11-09 15:36:46.451747'),
(45, 'hola', 'infosenda42@gmail.com', 'test', '2023-11-09 15:36:47.995997'),
(46, 'leo', 'leonxrdo.n@gmail.com', 'test', '2023-11-09 15:36:49.725400'),
(47, 'shuai', 'elenajiangholaaa@gmail.com', 'test', '2023-11-09 15:36:51.159714');

--
-- Dumping data for table `user_empleado`
--

INSERT INTO `user_empleado` (`id`, `p_emp_id`, `user_id`) VALUES
(2, 2, 2),
(3, 2, 3),
(4, 3, 5);

--
-- Dumping data for table `user_puestoempleado`
--

INSERT INTO `user_puestoempleado` (`id`, `p_emp_nombre`, `p_emp_descripcion`) VALUES
(2, 'Vendedor', 'Vende cosas'),
(3, 'Encargado', 'Hace cosas');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
