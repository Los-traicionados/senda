-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2023 at 12:27 PM
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
(1, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', '2023-11-16 11:21:06.177763', 1, 'senda', '', '', 'senda@senda.com', 1, 1, '2023-11-01 14:49:23.270714', '', '', NULL, ''),
(13, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', '2023-11-16 11:26:22.064875', 0, 'Victor', 'Victor', 'Terroso Prieto', 'v.terroso87@gmail.com', 0, 1, '2023-11-07 16:14:36.000000', '44444444T', 'C/Laberinto del amor, 1', '1987-12-01 00:00:00.000000', '666164018'),
(16, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Angel', 'Angel', 'Polo', 'angelpolotorres@gmail.com', 0, 1, '2023-11-16 10:20:01.000000', '11111111Y', 'No sé', '1999-10-11 00:00:00.000000', '123456'),
(17, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Marina', 'Marina', 'Rubio', 'marina.rubio.alonso@gmail.com', 0, 1, '2023-11-16 10:49:58.000000', '22222222M', 'C/Madrid, 1', '1999-10-11 00:00:00.000000', '444444444'),
(18, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Leonardo', 'Leonardo', 'Narvaez', 'leonxrdo.n@gmail.com', 0, 1, '2023-11-16 10:51:18.000000', '33333333L', 'C/Madrid, 1', '1990-10-01 00:00:00.000000', '555555555'),
(19, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', '2023-11-16 11:25:14.311057', 0, 'Vradis', 'Vradis', 'Florez', 'vradis.florez@gmail.com', 0, 1, '2023-11-16 10:52:44.000000', '44444444V', 'C/Madrid, 1', '1992-10-11 00:00:00.000000', '555555555'),
(20, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Paula', 'Paula', 'del Pino', 'paula.p.ramirez@gmail.com', 0, 1, '2023-11-16 10:53:45.000000', '99999999p', 'C/Madrid, 1', '1990-01-01 00:00:00.000000', '888888888'),
(21, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Shuai', 'Shuai', 'Wang', 'wang.shuai@netbuilt.eu', 0, 1, '2000-11-16 10:54:48.000000', '65555555P', 'C/Madrid, 1', '1990-10-11 00:00:00.000000', '123456789'),
(22, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Pedro', 'Pedro', 'Martinez', 'pedromar@student.42madrid.com', 0, 1, '2023-11-16 10:56:21.000000', '56478521P', 'C/Madrid, 1', '1987-04-01 00:00:00.000000', '582469874'),
(23, 'pbkdf2_sha256$320000$gMuNzGdcrd4NxMJX104dEA$TKJXnqOizBEfSj0otJG7eQ9wsTHlZsh1JZmaafQ+9o8=', NULL, 0, 'Jorge', 'Jorge', 'Vasquez', 'jvasquez@student.42madrid.com', 0, 1, '2023-11-16 10:57:42.000000', '58963214J', 'C/Madrid, 1', '1990-08-01 00:00:00.000000', '357159864');

--
-- Dumping data for table `booking_actividad`
--

INSERT INTO `booking_actividad` (`id`, `act_nombre`, `act_descripcion`, `act_precio`, `act_imagen`, `act_ciudad`) VALUES
(1, 'Aventura a Caballo', 'Descubre la majestuosidad natural de la Sierra de Madrid de una manera única y auténtica: a lomos de un caballo. Nuestra emocionante ruta a caballo te llevará a través de senderos serpenteantes, bosques frondosos y paisajes montañosos.', 58.00, 'actividad/horse-6123172_640_z8J5KKs.jpg', 'Madrid'),
(2, 'Bus por el centro de Madrid', 'Explora la esencia de Madrid desde la comodidad de nuestro bus turístico, diseñado para llevarte a través de los rincones más emblemáticos y pintorescos del corazón de la ciudad.', 26.00, 'actividad/madrid-city-tour-bus.jpg', 'Madrid'),
(3, 'Recorrido gastronómico', 'Explora los sabores auténticos de la Ciudad Eterna en nuestro recorrido gastronómico por Roma. Sumérgete en la rica tradición culinaria italiana mientras paseas por encantadoras calles adoquinadas y disfrutas de experiencias gastronómicas únicas.', 99.00, 'actividad/rome-1968149_640.jpg', 'Roma'),
(4, 'Crucero por el Sena', 'Descubre la majestuosidad de París desde una perspectiva totalmente nueva con nuestro inolvidable crucero por el Sena. Este viaje pintoresco te llevará por las icónicas aguas del río, ofreciéndote vistas panorámicas de los monumentos más emblemáticos.', 100.00, 'actividad/paris-2557526_640.jpg', 'Paris'),
(5, 'Excursión Castillos', 'Embárcate en un viaje fascinante a través de la historia medieval con nuestra emocionante excursión a los castillos que rodean París. Descubre la majestuosidad de tiempos pasados mientras exploras fortalezas centenarias.', 68.00, 'actividad/chateau-de-sceaux-6667247_640.jpg', 'Paris'),
(6, 'Museos de Madrid', 'Descubre la riqueza histórica y artística de Madrid con nuestra actividad de museos. Sumérgete en la vibrante escena cultural de la ciudad mientras exploras fascinantes colecciones, exposiciones únicas y maravillas artísticas.', 35.00, 'actividad/woman-1283009_640.jpg', 'Madrid'),
(7, 'Curso de cocina', '¿Te apasiona la cocina o estás buscando desarrollar tus habilidades culinarias? Únete a nuestro emocionante curso de cocina, donde explorarás el fascinante mundo de los sabores, las técnicas y la creatividad culinaria. Impartido por nuestro chef Jorge.', 47.00, 'actividad/chef-3975832_640.jpg', 'Madrid'),
(8, 'Excursión por viñedo', 'Sumérgete en la magia de la viticultura con nuestra emocionante excursión a viñedos. Experimenta la belleza pintoresca de los campos de uva mientras exploras nuestros viñedos cuidadosamente cultivados. Desde el sol besando las hojas de la vid hasta el aro', 143.00, 'actividad/disparo-enfoque-selectivo-arboles-vid-capturados-hermoso-vinedo-crepusculo.jpg', 'Paris'),
(9, 'Espectáculo nocturno', 'Sumérgete en un deslumbrante espectáculo visual en la emblemática Fuente de Montjuïc, donde la fusión de agua, luz y música te transportará a un mundo de belleza y encanto.', 14.00, 'actividad/magic-fountain-3599855_640.jpg', 'Barcelona');

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

--
-- Dumping data for table `booking_pack`
--

INSERT INTO `booking_pack` (`id`, `pa_nombre`, `pa_descipcion`, `actividad_id`, `hotel_id`, `vuelo_id`, `pa_imagen`, `pa_precio`, `pa_ciudad`) VALUES
(1, 'Finde gastronómico en Madrid', 'Fin de semana en la capital de España, disfrutando del exclusivo hotel Riu y realizando un curso de cocina con uno de los mejores chefs del mundo.', 7, 1, 11, 'pack/madrid-2111814_640.jpg', 268.00, 'Madrid'),
(2, 'Paris, la ciudad del amor', 'Embárcate en un viaje lleno de romance y encanto en la capital mundial del amor: París. Nuestra oferta exclusiva de fin de semana te invita a sumergirte en la magia de la Ciudad de la Luz. Inclute entrada al museo Louvre.', 6, 3, 3, 'pack/eiffel-tower-3349075_640.jpg', 425.00, 'Paris'),
(3, 'Escapada a Barcelona', 'Embárcate en una escapada mágica a Barcelona, donde la mezcla de historia, cultura y modernidad te cautivará. Tu fin de semana incluirá explorar las icónicas Ramblas, degustar la deliciosa gastronomía local y culminará con una visita nocturna a Montjuic', 9, 6, 1, 'pack/travel-5188598_640.jpg', 391.00, 'Barcelona'),
(4, 'La Dolce Vita en Roma', 'Sumérgete en la esencia de la Ciudad Eterna con nuestro pack de viaje a Roma, una experiencia completa que combina la riqueza histórica con la exquisita gastronomía italiana.', 3, 2, 5, 'pack/tiber-river-4529605_640.jpg', 293.00, 'Roma');

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

--
-- Dumping data for table `user_cliente`
--

INSERT INTO `user_cliente` (`id`, `user_id`) VALUES
(10, 13),
(11, 16),
(12, 17),
(13, 18),
(14, 19),
(15, 20),
(16, 21),
(17, 22),
(18, 23);

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
