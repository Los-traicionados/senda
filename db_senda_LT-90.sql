-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2023 at 05:39 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add puesto empleado', 7, 'add_puestoempleado'),
(26, 'Can change puesto empleado', 7, 'change_puestoempleado'),
(27, 'Can delete puesto empleado', 7, 'delete_puestoempleado'),
(28, 'Can view puesto empleado', 7, 'view_puestoempleado'),
(29, 'Can add empleado', 8, 'add_empleado'),
(30, 'Can change empleado', 8, 'change_empleado'),
(31, 'Can delete empleado', 8, 'delete_empleado'),
(32, 'Can view empleado', 8, 'view_empleado'),
(33, 'Can add cliente', 9, 'add_cliente'),
(34, 'Can change cliente', 9, 'change_cliente'),
(35, 'Can delete cliente', 9, 'delete_cliente'),
(36, 'Can view cliente', 9, 'view_cliente'),
(37, 'Can add actividad', 10, 'add_actividad'),
(38, 'Can change actividad', 10, 'change_actividad'),
(39, 'Can delete actividad', 10, 'delete_actividad'),
(40, 'Can view actividad', 10, 'view_actividad'),
(41, 'Can add hotel', 11, 'add_hotel'),
(42, 'Can change hotel', 11, 'change_hotel'),
(43, 'Can delete hotel', 11, 'delete_hotel'),
(44, 'Can view hotel', 11, 'view_hotel'),
(45, 'Can add pack', 12, 'add_pack'),
(46, 'Can change pack', 12, 'change_pack'),
(47, 'Can delete pack', 12, 'delete_pack'),
(48, 'Can view pack', 12, 'view_pack'),
(49, 'Can add reserva', 13, 'add_reserva'),
(50, 'Can change reserva', 13, 'change_reserva'),
(51, 'Can delete reserva', 13, 'delete_reserva'),
(52, 'Can view reserva', 13, 'view_reserva'),
(53, 'Can add vuelo', 14, 'add_vuelo'),
(54, 'Can change vuelo', 14, 'change_vuelo'),
(55, 'Can delete vuelo', 14, 'delete_vuelo'),
(56, 'Can view vuelo', 14, 'view_vuelo'),
(57, 'Can add count emails', 15, 'add_countemails'),
(58, 'Can change count emails', 15, 'change_countemails'),
(59, 'Can delete count emails', 15, 'delete_countemails'),
(60, 'Can view count emails', 15, 'view_countemails');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha_nacimiento` datetime(6) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `direccion`, `fecha_nacimiento`, `telefono`) VALUES
(1, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', '2023-11-09 18:22:43.228651', 1, 'senda', '', '', 'senda@senda.com', 1, 1, '2023-11-01 14:49:23.270714', '', '', NULL, ''),
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
(13, 'pbkdf2_sha256$320000$k7u3pYpu1ITg0GllXxmHT2$Qg6EaSTJhYpixq5fyabSUX7cfy4sPISekJ6vTsPUo7w=', '2023-11-08 16:54:20.992503', 0, 'vterroso', '', '', 'v.terroso8@gmail.com', 0, 1, '2023-11-07 16:14:36.036487', '', '', NULL, ''),
(14, 'pbkdf2_sha256$320000$oH1NVQ5ridYbKZSFox2tll$xs7epC6wv14I4v+215wBncoFLaMA3GY/M02UB9HGYcE=', '2023-11-08 16:56:23.745176', 0, 'terroso', '', '', 'v.terroso8@gmail.com', 0, 1, '2023-11-08 16:56:23.090176', '', '', NULL, ''),
(15, 'pbkdf2_sha256$320000$dkNlPujCyaVMWF6urM3GZW$uiMBH4YGfqb/zqxSWxYWHb10XueOaWMxu2TwjRRuI/o=', '2023-11-09 10:37:20.374164', 0, 'victor', '', '', 'v.terroso8@gmail.com', 0, 1, '2023-11-09 10:37:19.713831', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_actividad`
--

CREATE TABLE `booking_actividad` (
  `id` bigint(20) NOT NULL,
  `act_nombre` varchar(50) NOT NULL,
  `act_descripcion` varchar(255) NOT NULL,
  `act_precio` decimal(10,2) NOT NULL,
  `act_imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_actividad`
--

INSERT INTO `booking_actividad` (`id`, `act_nombre`, `act_descripcion`, `act_precio`, `act_imagen`) VALUES
(1, 'Aventura a Caballo', 'Descubre la majestuosidad natural de la Sierra de Madrid de una manera única y auténtica: a lomos de un caballo. Nuestra emocionante ruta a caballo te llevará a través de senderos serpenteantes, bosques frondosos y paisajes montañosos.', 58.00, 'actividad/horse-6123172_640_z8J5KKs.jpg'),
(2, 'Bus por el centro de Madrid', 'Explora la esencia de Madrid desde la comodidad de nuestro bus turístico, diseñado para llevarte a través de los rincones más emblemáticos y pintorescos del corazón de la ciudad.', 26.00, 'actividad/madrid-city-tour-bus.jpg'),
(3, 'Recorrido gastronómico', 'Explora los sabores auténticos de la Ciudad Eterna en nuestro recorrido gastronómico por Roma. Sumérgete en la rica tradición culinaria italiana mientras paseas por encantadoras calles adoquinadas y disfrutas de experiencias gastronómicas únicas.', 99.00, 'actividad/rome-1968149_640.jpg'),
(4, 'Crucero por el Sena', 'Descubre la majestuosidad de París desde una perspectiva totalmente nueva con nuestro inolvidable crucero por el Sena. Este viaje pintoresco te llevará por las icónicas aguas del río, ofreciéndote vistas panorámicas de los monumentos más emblemáticos.', 100.00, 'actividad/paris-2557526_640.jpg'),
(5, 'Excursión Castillos', 'Embárcate en un viaje fascinante a través de la historia medieval con nuestra emocionante excursión a los castillos que rodean París. Descubre la majestuosidad de tiempos pasados mientras exploras fortalezas centenarias.', 68.00, 'actividad/chateau-de-sceaux-6667247_640.jpg'),
(6, 'Museos de Madrid', 'Descubre la riqueza histórica y artística de Madrid con nuestra actividad de museos. Sumérgete en la vibrante escena cultural de la ciudad mientras exploras fascinantes colecciones, exposiciones únicas y maravillas artísticas.', 35.00, 'actividad/woman-1283009_640.jpg'),
(7, 'Curso de cocina', '¿Te apasiona la cocina o estás buscando desarrollar tus habilidades culinarias? Únete a nuestro emocionante curso de cocina, donde explorarás el fascinante mundo de los sabores, las técnicas y la creatividad culinaria. Impartido por nuestro chef Jorge.', 47.00, 'actividad/chef-3975832_640.jpg'),
(8, 'Excursión por viñedo', 'Sumérgete en la magia de la viticultura con nuestra emocionante excursión a viñedos. Experimenta la belleza pintoresca de los campos de uva mientras exploras nuestros viñedos cuidadosamente cultivados. Desde el sol besando las hojas de la vid hasta el aro', 143.00, 'actividad/disparo-enfoque-selectivo-arboles-vid-capturados-hermoso-vinedo-crepusculo.jpg'),
(9, 'Espectáculo nocturno', 'Sumérgete en un deslumbrante espectáculo visual en la emblemática Fuente de Montjuïc, donde la fusión de agua, luz y música te transportará a un mundo de belleza y encanto.', 14.00, 'actividad/magic-fountain-3599855_640.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `booking_hotel`
--

CREATE TABLE `booking_hotel` (
  `id` bigint(20) NOT NULL,
  `ho_nombre` varchar(50) NOT NULL,
  `ho_direccion` varchar(255) NOT NULL,
  `ho_precio` decimal(10,2) NOT NULL,
  `ho_imagen` varchar(100) DEFAULT NULL,
  `ho_ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_hotel`
--

INSERT INTO `booking_hotel` (`id`, `ho_nombre`, `ho_direccion`, `ho_precio`, `ho_imagen`, `ho_ciudad`) VALUES
(1, 'Riu Plaza España', 'Plaza España', 159.00, 'hotel/plaza-espana-2002978_640.jpg', 'Madrid'),
(2, 'Ibis Roma Fiera', 'Via Arturo Mercanti, 63, 00148', 68.00, 'hotel/bedroom-6686061_640.jpg', 'Roma'),
(3, 'Le Regent', '61 Rue Dauphine, 75006', 134.00, 'hotel/hotel-1979406_640.jpg', 'Paris'),
(4, 'Príncipe Pio', 'PPio', 107.00, 'hotel/room-4768551_640.jpg', 'Madrid'),
(5, 'Milton', 'Via Emanuele Filiberto, 155, 00185', 142.00, 'hotel/bedroom-5664221_640.jpg', 'Roma'),
(6, 'Ibis Barcelona', 'Passeig d\'Andreu Nin, 9, 0816', 151.00, 'hotel/salon-spa-vista-playa_KJXXEo6.jpg', 'Barcelona'),
(7, 'Eurostars', 'Pº Castellana, 259 28046', 103.00, 'hotel/almohada-cama.jpg', 'Madrid'),
(8, 'Hat', 'C/ Madrid, 98', 210.00, 'hotel/vista-lujoso-espacio-interior-hotel.jpg', 'Paris'),
(9, 'Vértice', 'Avenida aeronáutica, 5 41020', 52.00, 'hotel/piscina-tumbonas-manana-hotel-resort-verano-mediterraneo-turquia-bodrum.jpg', 'Sevilla'),
(10, 'Catalonia', 'Gran vía, 7-9 28013', 162.00, 'hotel/moderno-hotel-lujo-recepcion-oficina-salon-sala-reuniones_xsmVjbI.jpg', 'Madrid'),
(11, 'Santo Domingo', 'C/San Bernardo, 1 28013', 125.00, 'hotel/suite-dormitorio-moderno-clasico-lujo-hotel.jpg', 'Madrid');

-- --------------------------------------------------------

--
-- Table structure for table `booking_pack`
--

CREATE TABLE `booking_pack` (
  `id` bigint(20) NOT NULL,
  `pa_nombre` varchar(50) NOT NULL,
  `pa_descipcion` varchar(255) NOT NULL,
  `actividad_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `vuelo_id` bigint(20) DEFAULT NULL,
  `pa_imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_pack`
--

INSERT INTO `booking_pack` (`id`, `pa_nombre`, `pa_descipcion`, `actividad_id`, `hotel_id`, `vuelo_id`, `pa_imagen`) VALUES
(1, 'Finde gastronómico en Madrid', 'Fin de semana en la capital de España, disfrutando del exclusivo hotel Riu y realizando un curso de cocina con uno de los mejores chefs del mundo.', 7, 1, 11, 'pack/madrid-2111814_640.jpg'),
(2, 'Paris, la ciudad del amor', 'Embárcate en un viaje lleno de romance y encanto en la capital mundial del amor: París. Nuestra oferta exclusiva de fin de semana te invita a sumergirte en la magia de la Ciudad de la Luz. Inclute entrada al museo Louvre.', 6, 3, 3, 'pack/eiffel-tower-3349075_640.jpg'),
(3, 'Escapada a Barcelona', 'Embárcate en una escapada mágica a Barcelona, donde la mezcla de historia, cultura y modernidad te cautivará. Tu fin de semana incluirá explorar las icónicas Ramblas, degustar la deliciosa gastronomía local y culminará con una visita nocturna a Montjuic', 9, 6, 1, 'pack/travel-5188598_640.jpg'),
(4, 'La Dolce Vita en Roma', 'Sumérgete en la esencia de la Ciudad Eterna con nuestro pack de viaje a Roma, una experiencia completa que combina la riqueza histórica con la exquisita gastronomía italiana.', 3, 2, 5, 'pack/tiber-river-4529605_640.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `booking_reserva`
--

CREATE TABLE `booking_reserva` (
  `id` bigint(20) NOT NULL,
  `res_f_inicio` datetime(6) DEFAULT NULL,
  `res_f_fin` datetime(6) DEFAULT NULL,
  `res_precio` decimal(10,2) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  `empleado_id` bigint(20) NOT NULL,
  `pack_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `booking_vuelo`
--

CREATE TABLE `booking_vuelo` (
  `id` bigint(20) NOT NULL,
  `vu_precio` decimal(10,2) NOT NULL,
  `vu_asiento` varchar(20) NOT NULL,
  `vu_destino` varchar(50) DEFAULT NULL,
  `vu_origen` varchar(50) DEFAULT NULL,
  `vu_nombre` varchar(50) DEFAULT NULL,
  `vu_imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_vuelo`
--

INSERT INTO `booking_vuelo` (`id`, `vu_precio`, `vu_asiento`, `vu_destino`, `vu_origen`, `vu_nombre`, `vu_imagen`) VALUES
(1, 75.00, 'A5', 'Barcelona', 'Madrid', 'Madrid - Barcelona', 'vuelo/barcelona-3226639_640.jpg'),
(3, 80.00, 'C1', 'Paris', 'Madrid', 'Madrid - Paris', 'vuelo/building-102840_640.jpg'),
(4, 29.00, 'H1', 'Madrid', 'Paris', 'Paris - Madrid', 'vuelo/madrid-328111_640.jpg'),
(5, 58.00, 'J1', 'Roma', 'Madrid', 'Madrid - Roma', 'vuelo/rome-4124391_640.jpg'),
(6, 78.00, 'O1', 'Madrid', 'Roma', 'Roma - Madrid', 'vuelo/madrid-385104_640.jpg'),
(11, 164.00, '8H', 'Madrid', 'Barcelona', 'Barcelona - Madrid', 'vuelo/building-470925_640.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-11-13 19:14:48.881941', '11', 'Santo Domingo', 2, '[]', 11, 1),
(2, '2023-11-13 19:20:40.738498', '11', 'Santo Domingo', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(3, '2023-11-13 19:23:51.145555', '11', 'Santo Domingo', 2, '[{\"changed\": {\"fields\": [\"Direcci\\u00f3n\", \"Precio Hotel\"]}}]', 11, 1),
(4, '2023-11-13 19:25:18.647000', '10', 'Catalonia', 2, '[{\"changed\": {\"fields\": [\"Direcci\\u00f3n\", \"Ho imagen\"]}}]', 11, 1),
(5, '2023-11-13 20:07:36.351799', '10', 'Catalonia', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(6, '2023-11-13 20:07:42.761246', '10', 'Catalonia', 2, '[]', 11, 1),
(7, '2023-11-13 20:08:01.804745', '11', 'Santo Domingo', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(8, '2023-11-13 20:09:01.552874', '9', 'Vértice', 2, '[{\"changed\": {\"fields\": [\"Direcci\\u00f3n\", \"Ho ciudad\", \"Ho imagen\"]}}]', 11, 1),
(9, '2023-11-13 20:13:53.606362', '8', 'Hat', 2, '[{\"changed\": {\"fields\": [\"Precio Hotel\", \"Ho imagen\"]}}]', 11, 1),
(10, '2023-11-13 20:14:12.150934', '8', 'Hat', 2, '[{\"changed\": {\"fields\": [\"Direcci\\u00f3n\"]}}]', 11, 1),
(11, '2023-11-13 20:16:26.747203', '7', 'Eurostars', 2, '[{\"changed\": {\"fields\": [\"Direcci\\u00f3n\", \"Ho imagen\"]}}]', 11, 1),
(12, '2023-11-13 20:18:17.582752', '6', 'Ibis Barcelona', 2, '[{\"changed\": {\"fields\": [\"Hotel\", \"Direcci\\u00f3n\", \"Precio Hotel\", \"Ho ciudad\", \"Ho imagen\"]}}]', 11, 1),
(13, '2023-11-13 20:21:18.356211', '5', 'Petit palace', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(14, '2023-11-13 20:23:04.732588', '5', 'Milton', 2, '[{\"changed\": {\"fields\": [\"Hotel\", \"Direcci\\u00f3n\", \"Precio Hotel\"]}}]', 11, 1),
(15, '2023-11-13 20:26:52.543746', '3', 'Le Regent', 2, '[{\"changed\": {\"fields\": [\"Hotel\", \"Direcci\\u00f3n\", \"Ho ciudad\", \"Ho imagen\"]}}]', 11, 1),
(16, '2023-11-13 20:27:50.232793', '4', 'Príncipe Pio', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(17, '2023-11-13 20:30:02.160817', '2', 'Ibis Roma Fiera', 2, '[{\"changed\": {\"fields\": [\"Hotel\", \"Direcci\\u00f3n\", \"Ho ciudad\", \"Ho imagen\"]}}]', 11, 1),
(18, '2023-11-13 20:32:09.972005', '1', 'Riu', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(19, '2023-11-13 20:50:09.658367', '10', 'Catalonia', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(20, '2023-11-13 20:50:26.086566', '6', 'Ibis Barcelona', 2, '[{\"changed\": {\"fields\": [\"Ho imagen\"]}}]', 11, 1),
(21, '2023-11-13 20:51:22.886139', '1', 'Riu Plaza España', 2, '[{\"changed\": {\"fields\": [\"Hotel\"]}}]', 11, 1),
(22, '2023-11-13 20:53:05.589741', '11', 'Barcelona - Madrid', 2, '[{\"changed\": {\"fields\": [\"Vu imagen\"]}}]', 14, 1),
(23, '2023-11-13 20:53:40.335250', '6', 'Roma - Madrid', 2, '[{\"changed\": {\"fields\": [\"Vu imagen\"]}}]', 14, 1),
(24, '2023-11-13 20:54:31.489027', '5', 'Madrid - Roma', 2, '[{\"changed\": {\"fields\": [\"Vu imagen\"]}}]', 14, 1),
(25, '2023-11-13 20:55:18.902405', '4', 'Paris - Madrid', 2, '[{\"changed\": {\"fields\": [\"Vu imagen\"]}}]', 14, 1),
(26, '2023-11-13 20:55:48.888020', '3', 'Madrid - Paris', 2, '[{\"changed\": {\"fields\": [\"Vu imagen\"]}}]', 14, 1),
(27, '2023-11-13 20:56:20.788029', '1', 'Madrid - Barcelona', 2, '[{\"changed\": {\"fields\": [\"Vu imagen\"]}}]', 14, 1),
(28, '2023-11-13 20:57:13.244211', '11', 'Aventura vintage', 3, '', 10, 1),
(29, '2023-11-13 21:02:06.068080', '10', 'Traslado privado', 3, '', 10, 1),
(30, '2023-11-13 21:02:44.097445', '8', 'Excursión por viñedo', 2, '[{\"changed\": {\"fields\": [\"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(31, '2023-11-14 09:32:19.927397', '8', 'Excursión por viñedo', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n de la actividad\"]}}]', 10, 1),
(32, '2023-11-14 09:41:02.871509', '1', 'Madrid un finde', 2, '[{\"changed\": {\"fields\": [\"Vuelo\", \"Actividad\", \"Descripci\\u00f3n Pack\", \"Pa imagen\"]}}]', 12, 1),
(33, '2023-11-14 09:45:09.827409', '2', 'Paris, la ciudad del amor', 1, '[{\"added\": {}}]', 12, 1),
(34, '2023-11-14 09:46:54.354736', '1', 'Madrid un finde', 2, '[{\"changed\": {\"fields\": [\"Actividad\", \"Descripci\\u00f3n Pack\"]}}]', 12, 1),
(35, '2023-11-14 09:48:43.506451', '1', 'Madrid un finde', 2, '[{\"changed\": {\"fields\": [\"Pa imagen\"]}}]', 12, 1),
(36, '2023-11-14 09:51:56.865306', '4', 'Crucero por el Sena', 2, '[{\"changed\": {\"fields\": [\"Nombre de la Actividad\", \"Descripci\\u00f3n de la actividad\", \"Act imagen\"]}}]', 10, 1),
(37, '2023-11-14 09:54:24.253759', '7', 'Clases de cocina', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n de la actividad\", \"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(38, '2023-11-14 09:54:34.534809', '7', 'Curso de cocina', 2, '[{\"changed\": {\"fields\": [\"Nombre de la Actividad\"]}}]', 10, 1),
(39, '2023-11-14 09:58:38.875853', '1', 'Finde gastronómico en Madrid', 2, '[{\"changed\": {\"fields\": [\"Nombre del Pack\"]}}]', 12, 1),
(40, '2023-11-14 10:22:54.303209', '6', 'Museos de Madrid', 2, '[{\"changed\": {\"fields\": [\"Nombre de la Actividad\", \"Descripci\\u00f3n de la actividad\", \"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(41, '2023-11-14 10:28:34.208685', '5', 'Excursión Castillos', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n de la actividad\", \"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(42, '2023-11-14 10:34:56.598938', '3', 'Recorrido gastronómico', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n de la actividad\", \"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(43, '2023-11-14 10:40:54.066125', '9', 'Espectáculo nocturno', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n de la actividad\", \"Act imagen\"]}}]', 10, 1),
(44, '2023-11-14 10:44:55.720310', '1', 'Aventura a Caballo', 2, '[{\"changed\": {\"fields\": [\"Nombre de la Actividad\", \"Descripci\\u00f3n de la actividad\", \"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(45, '2023-11-14 10:46:37.282496', '1', 'Aventura a Caballo', 2, '[{\"changed\": {\"fields\": [\"Act imagen\"]}}]', 10, 1),
(46, '2023-11-14 10:49:43.742688', '2', 'Bus por el centro de Madrid', 2, '[{\"changed\": {\"fields\": [\"Nombre de la Actividad\", \"Descripci\\u00f3n de la actividad\", \"Precio actividad\", \"Act imagen\"]}}]', 10, 1),
(47, '2023-11-14 11:01:16.920972', '3', 'Escapada a Barcelona', 1, '[{\"added\": {}}]', 12, 1),
(48, '2023-11-14 11:13:42.231384', '4', 'La Dolce Vita en Roma', 1, '[{\"added\": {}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(10, 'booking', 'actividad'),
(11, 'booking', 'hotel'),
(12, 'booking', 'pack'),
(13, 'booking', 'reserva'),
(14, 'booking', 'vuelo'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(9, 'user', 'cliente'),
(15, 'user', 'countemails'),
(8, 'user', 'empleado'),
(7, 'user', 'puestoempleado'),
(6, 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-09 17:59:59.109943'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-11-09 17:59:59.135764'),
(3, 'auth', '0001_initial', '2023-11-09 17:59:59.406716'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-11-09 17:59:59.681819'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-11-09 17:59:59.694452'),
(6, 'auth', '0004_alter_user_username_opts', '2023-11-09 17:59:59.705938'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-11-09 17:59:59.717645'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-11-09 17:59:59.721377'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-11-09 17:59:59.731610'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-11-09 17:59:59.740860'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-11-09 17:59:59.751702'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-11-09 17:59:59.763519'),
(13, 'auth', '0011_update_proxy_permissions', '2023-11-09 17:59:59.772108'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-11-09 17:59:59.782337'),
(15, 'user', '0001_initial', '2023-11-09 18:00:00.375781'),
(16, 'admin', '0001_initial', '2023-11-09 18:00:00.766482'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-11-09 18:00:00.789440'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-09 18:00:00.805011'),
(19, 'booking', '0001_initial', '2023-11-09 18:00:00.902825'),
(20, 'booking', '0002_initial', '2023-11-09 18:00:01.379209'),
(21, 'booking', '0003_alter_actividad_options_alter_hotel_options_and_more', '2023-11-09 18:00:01.410499'),
(22, 'booking', '0004_actividad_act_imagen', '2023-11-09 18:00:01.459781'),
(23, 'booking', '0005_hotel_ho_imagen_pack_pa_imagen_vuelo_vu_imagen_and_more', '2023-11-09 18:00:01.496317'),
(24, 'booking', '0006_remove_vuelo_vu_nombre_vuelo_vu_destino_and_more', '2023-11-09 18:00:01.566938'),
(25, 'booking', '0007_vuelo_vu_nombre', '2023-11-09 18:00:01.579172'),
(26, 'booking', '0008_remove_vuelo_vu_imagen', '2023-11-09 18:00:01.593136'),
(27, 'booking', '0009_hotel_ho_ciudad', '2023-11-09 18:00:01.603457'),
(28, 'booking', '0010_alter_hotel_ho_imagen', '2023-11-09 18:00:01.665941'),
(29, 'sessions', '0001_initial', '2023-11-09 18:00:01.692791'),
(30, 'user', '0002_alter_cliente_options_alter_empleado_options_and_more', '2023-11-09 18:00:01.843929'),
(31, 'booking', '0003_vuelo_vu_imagen', '2023-11-13 20:38:15.134521');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('samcgyxszu2mz4r1g1j96ild5zfgfwrf', '.eJxVjsEOwiAQRP-FsyHQpbR49O43NAu7SJXQpC1ejP9um9REr-_NTOYlBqxrGurC8zCSOAstTr_MY3hw2QXdsdwmGaayzqOXe0QedpHXiThfjuzfQMIlbW3TO9M5RrSN0Zqt7yMjRSA0qgPrHBjVknK-B2vYeW0CeACiNqqmC802Gjkk3E6iOJea8xc8K-f1YO8PxuxErQ:1r1ADM:jS2Hh571yRUgM8qENlBuZh1XpuPFff1vCtSNb5Ys0As', '2023-11-23 18:57:16.090716');

-- --------------------------------------------------------

--
-- Table structure for table `user_cliente`
--

CREATE TABLE `user_cliente` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `user_empleado`
--

CREATE TABLE `user_empleado` (
  `id` bigint(20) NOT NULL,
  `p_emp_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_empleado`
--

INSERT INTO `user_empleado` (`id`, `p_emp_id`, `user_id`) VALUES
(2, 2, 2),
(3, 2, 3),
(4, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_puestoempleado`
--

CREATE TABLE `user_puestoempleado` (
  `id` bigint(20) NOT NULL,
  `p_emp_nombre` varchar(20) NOT NULL,
  `p_emp_descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_puestoempleado`
--

INSERT INTO `user_puestoempleado` (`id`, `p_emp_nombre`, `p_emp_descripcion`) VALUES
(2, 'Vendedor', 'Vende cosas'),
(3, 'Encargado', 'Hace cosas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `booking_actividad`
--
ALTER TABLE `booking_actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_hotel`
--
ALTER TABLE `booking_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_pack`
--
ALTER TABLE `booking_pack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_pack_actividad_id_22dbea51_fk_booking_actividad_id` (`actividad_id`),
  ADD KEY `booking_pack_hotel_id_4e97d1f2_fk_booking_hotel_id` (`hotel_id`),
  ADD KEY `booking_pack_vuelo_id_f8e7d912_fk_booking_vuelo_id` (`vuelo_id`);

--
-- Indexes for table `booking_reserva`
--
ALTER TABLE `booking_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_reserva_client_id_0c6511b6_fk_user_cliente_id` (`client_id`),
  ADD KEY `booking_reserva_empleado_id_bd3ce7d8_fk_user_empleado_id` (`empleado_id`),
  ADD KEY `booking_reserva_pack_id_dfa2f2b4_fk_booking_pack_id` (`pack_id`);

--
-- Indexes for table `booking_vuelo`
--
ALTER TABLE `booking_vuelo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `user_cliente`
--
ALTER TABLE `user_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_empleado`
--
ALTER TABLE `user_empleado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_empleado_p_emp_id_a3a6f8b3_fk_user_puestoempleado_id` (`p_emp_id`);

--
-- Indexes for table `user_puestoempleado`
--
ALTER TABLE `user_puestoempleado`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_actividad`
--
ALTER TABLE `booking_actividad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `booking_hotel`
--
ALTER TABLE `booking_hotel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `booking_pack`
--
ALTER TABLE `booking_pack`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking_reserva`
--
ALTER TABLE `booking_reserva`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking_vuelo`
--
ALTER TABLE `booking_vuelo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_cliente`
--
ALTER TABLE `user_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_empleado`
--
ALTER TABLE `user_empleado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_puestoempleado`
--
ALTER TABLE `user_puestoempleado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `booking_pack`
--
ALTER TABLE `booking_pack`
  ADD CONSTRAINT `booking_pack_actividad_id_22dbea51_fk_booking_actividad_id` FOREIGN KEY (`actividad_id`) REFERENCES `booking_actividad` (`id`),
  ADD CONSTRAINT `booking_pack_hotel_id_4e97d1f2_fk_booking_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `booking_hotel` (`id`),
  ADD CONSTRAINT `booking_pack_vuelo_id_f8e7d912_fk_booking_vuelo_id` FOREIGN KEY (`vuelo_id`) REFERENCES `booking_vuelo` (`id`);

--
-- Constraints for table `booking_reserva`
--
ALTER TABLE `booking_reserva`
  ADD CONSTRAINT `booking_reserva_client_id_0c6511b6_fk_user_cliente_id` FOREIGN KEY (`client_id`) REFERENCES `user_cliente` (`id`),
  ADD CONSTRAINT `booking_reserva_empleado_id_bd3ce7d8_fk_user_empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `user_empleado` (`id`),
  ADD CONSTRAINT `booking_reserva_pack_id_dfa2f2b4_fk_booking_pack_id` FOREIGN KEY (`pack_id`) REFERENCES `booking_pack` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_cliente`
--
ALTER TABLE `user_cliente`
  ADD CONSTRAINT `user_cliente_user_id_40c072f0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_empleado`
--
ALTER TABLE `user_empleado`
  ADD CONSTRAINT `user_empleado_p_emp_id_a3a6f8b3_fk_user_puestoempleado_id` FOREIGN KEY (`p_emp_id`) REFERENCES `user_puestoempleado` (`id`),
  ADD CONSTRAINT `user_empleado_user_id_bcf7ee45_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
