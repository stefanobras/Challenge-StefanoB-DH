-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2020 a las 17:03:33
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comegatodb`
--
CREATE DATABASE IF NOT EXISTS `comegatodb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `comegatodb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `cartNumber` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carts`
--

INSERT INTO `carts` (`id`, `cartNumber`, `total`, `idUser`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 1000, 2000, 12, '2020-08-17 03:24:10', '2020-08-17 03:24:10', NULL),
(2, 1001, 1000, 12, '2020-08-17 03:43:42', '2020-08-17 03:43:42', NULL),
(3, 1002, 2500, 12, '2020-08-17 03:46:47', '2020-08-17 03:46:47', NULL),
(4, 1003, 2000, 12, '2020-08-17 03:50:22', '2020-08-17 03:50:22', NULL),
(5, 1004, 1500, 12, '2020-08-17 04:10:53', '2020-08-17 04:10:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'CD', '2020-08-08 17:45:22', NULL, NULL),
(2, 'Vinyl', '2020-08-08 17:46:00', NULL, NULL),
(3, 'Cassette', '2020-08-08 17:46:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `subTotal` int(10) NOT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `idUser` int(10) UNSIGNED NOT NULL,
  `idCart` int(10) UNSIGNED DEFAULT NULL,
  `idProduct` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `price`, `quantity`, `subTotal`, `status`, `idUser`, `idCart`, `idProduct`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(19, '1000', 1, 1000, 0, 12, 1, 204, '2020-08-17 03:15:09', '2020-08-17 03:15:09', NULL),
(20, '1000', 1, 1000, 0, 12, 1, 240, '2020-08-17 03:16:49', '2020-08-17 03:16:49', NULL),
(22, '1000', 1, 1000, 0, 12, 2, 246, '2020-08-17 03:42:58', '2020-08-17 03:42:58', NULL),
(24, '2500', 1, 2500, 0, 12, 3, 227, '2020-08-17 03:46:45', '2020-08-17 03:46:45', NULL),
(25, '2000', 1, 2000, 0, 12, 4, 251, '2020-08-17 03:50:21', '2020-08-17 03:50:21', NULL),
(26, '1500', 1, 1500, 0, 12, 5, 322, '2020-08-17 04:10:51', '2020-08-17 04:10:51', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `img` varchar(1000) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `idCategory` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `productscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `img`, `sale`, `idCategory`, `createdAt`, `updatedAt`, `deletedAt`, `productscol`) VALUES
(200, '(What\'s the Story) Morning Glory? - Oasis', '(What\'s the Story) Morning Glory? (1995) - Oa', '1000', 'cd38.jpg', 0, 1, '2020-08-08 20:51:02', NULL, NULL, NULL),
(201, '...And Justice for All - Metallica', '...And Justice for All (1988) - Metallica', '3000', 'c14.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(202, '...Japanese Justice - Metallica', '...Japanese Justice (2015) - Metallica', '2000', 'v27.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(203, '21st Century Breakdown - Green Day', '21st Century Breakdown (2009) - Green Day', '2500', 'c38.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(204, '1984 - Van Halen', '1984 (1984) - Van Halen', '1000', 'cd30.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(205, '1. Outside (The Nathan Adler Diaries: A Hyper)', '1. Outside (The Nathan Adler Diaries: A Hyper)', '2500', 'v8.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(206, '39/Smooth - Green Day', '39/Smooth (1990) - Green Day', '3000', 'c36.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(207, 'A Brief Inquiry into Online Relationships - The 1975', 'A Brief Inquiry into Online Relationships (2018) - The 1975', '2000', 'c55.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(208, 'A Thousand Suns - Linkin Park', 'A Thousand Suns (2010) - Linkin Park', '300', 'cd56.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(209, 'Absolution - Muse', 'Absolution (2003) - Muse', '500', 'cd45.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(210, 'After Hours - The Weeknd', 'After Hours (2020) - The Weeknd', '1500', 'c42.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(211, 'After Laughter - Paramore', 'After Laughter (2017) - Paramore', '2000', 'c54.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(212, 'Alive! - KISS', 'Alive! (1975) - KISS', '1500', 'cd13.jpg', 0, 1, '2020-08-08 20:28:09', NULL, NULL, NULL),
(213, 'All We Know Is Falling - Paramore', 'All We Know Is Falling (2015) - Paramore', '1200', 'v56.png', 1, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(214, 'AM - Arctic Monkeys', 'AM (2013) - Arctic Monkeys', '300', 'cd51.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(215, 'AM - Arctic Monkeys', 'AM (2013) - Arctic Monkeys', '2000', 'c51.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(216, 'American Idiot - Green Day', 'American Idiot (2004) - Green Day', '2000', 'c35.jpg', 1, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(217, 'Angles - The Strokes', 'Angles (2011) - The Strokes', '300', 'cd59.jpg', 0, 1, '2020-08-08 21:10:11', NULL, NULL, NULL),
(218, 'Appetite for Destruction - Guns N\' Roses', 'Appetite for Destruction (1987) - Guns N\' Ros', '1000', 'cd27.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(219, 'Appetite for Destruction - Guns N\' Roses', 'Appetite for Destruction (1987) - Guns N\' Ros', '3000', 'c11.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(220, 'Appetite for Destruction - Guns N\' Roses', 'Appetite for Destruction (1987) - Guns N\' Ros', '3000', 'c12.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(221, 'Baby Don\'t Cry - INXS', 'Baby Don\'t Cry (1992) - INXS', '2000', 'v18.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(222, 'Back in Black - AC/DC', 'Back in Black (1980) - AC/DC', '1000', 'cd24.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(223, 'Battle Born - The Killers', 'Battle Born (2012) - The Killers', '1500', 'image-1597646342406.png', 0, 2, '2020-08-09 01:40:19', '2020-08-17 06:39:02', NULL, NULL),
(224, 'Bleach - Nirvana', 'Bleach (1989) - Nirvana', '3000', 'c27.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(225, 'Blink-182 - Blink-182', 'Blink-182 (2012) - Blink-182', '1500', 'v33.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(226, 'Blink-182 - Blink-182', 'Blink-182 (2013) - Blink-182', '1500', 'v34.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(227, 'Blink-182 - Blink-182', 'Blink-182 (2003) - Blink-182', '2500', 'c30.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(228, 'Blonde on Blonde - Bob Dylan', 'Blonde on Blonde (1966) - Bob Dylan', '2000', 'cd6.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(229, 'Blood Sugar Sex Magik - Red Hot Chili Peppers', 'Blood Sugar Sex Magik (1991) - Red Hot Chili ', '1000', 'cd40.jpg', 0, 1, '2020-08-08 20:51:02', NULL, NULL, NULL),
(230, 'Blood Sugar Sex Magik - Red Hot Chili Peppers', 'Blood Sugar Sex Magik (1991) - Red Hot Chili ', '3000', 'c41.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(231, 'Blurryface - Twenty One Pilots', 'Blurryface (2015) - Twenty One Pilots', '300', 'cd60.jpg', 0, 1, '2020-08-08 21:10:11', NULL, NULL, NULL),
(232, 'Blurryface - Twenty One Pilots', 'Blurryface (2015) - Twenty One Pilots', '2000', 'c16.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(233, 'Bob Dylan - Bob Dylan', 'Bob Dylan (2013) - Bob Dylan', '3000', 'v3.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(234, 'Bohemian Rhapsody/I\'m In Love With My Car - Queen', 'Bohemian Rhapsody/I\'m In Love With My Car (2017) - Queen', '2000', 'v15.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(235, 'Brand New Eyes - Paramore', 'Brand New Eyes (2013) - Paramore', '1000', 'v57.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(236, 'Broadcasting Live In The USA \'64 - The Beatle', 'Broadcasting Live In The USA \'64 (2015) - The', '3000', 'v1.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(237, 'Brothers - The Black Keys', 'Brothers (2010) - The Black Keys', '300', 'cd53.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(238, 'By the Way - Red Hot Chili Peppers', 'By the Way (2002) - Red Hot Chili Peppers', '500', 'cd47.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(239, 'California - Blink-182', 'California (2017) - Blink-182', '1000', 'v32.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(240, 'Combat Rock - The Clash', 'Combat Rock (1982) - The Clash', '1000', 'cd29.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(241, 'Cruel But Fair - Pink Floyd', 'Cruel But Fair (2010) - Pink Floyd', '2500', 'v13.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(242, 'Danger Days - My Chemical Romance', 'Danger Days (2011) - My Chemical Romance', '1000', 'v46.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(243, 'Danger Days - My Chemical Romance', 'Danger Days (2010) - My Chemical Romance', '2000', 'c47.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(244, 'Dirt - Alice In Chains', 'Dirt (1992) - Alice In Chains', '1000', 'cd34.jpg', 0, 1, '2020-08-08 20:51:01', NULL, NULL, NULL),
(245, 'Dirty Deeds Done Dirt Cheap - AC/DC', 'Dirty Deeds Done Dirt Cheap (1976) - AC/DC', '3500', 'c10.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(246, 'Dookie - Green Day', 'Dookie (1994) - Green Day', '1000', 'cd37.jpg', 0, 1, '2020-08-08 20:51:02', NULL, NULL, NULL),
(247, 'Dookie - Green Day', 'Dookie (1994) - Green Day', '3000', 'c34.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(248, 'Dude Ranch - Blink-182', 'Dude Ranch (1997) - Blink-182', '1000', 'cd36.jpg', 0, 1, '2020-08-08 20:51:01', NULL, NULL, NULL),
(249, 'Electric Ladyland - The Jimi Hendrix Experien', 'Electric Ladyland (1968) - The Jimi Hendrix E', '2000', 'cd7.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(250, 'Elton John - Elton John', 'Elton John (1970) - Elton John', '1500', 'cd19.jpg', 0, 1, '2020-08-08 20:28:10', NULL, NULL, NULL),
(251, 'Enema of the State - Blink-182', 'Enema of the State (2014) - Blink-182', '2000', 'v35.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(252, 'Enema of the State - Blink-182', 'Enema of the State (1999) - Blink-182', '3000', 'c32.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(253, 'Entreat Plus - The Cure', 'Entreat Plus (2010) - The Cure', '2000', 'v22.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(254, 'Eurockeennes de Belfort \'99 - Metallica', 'Eurockeennes de Belfort \'99 (2013) - Metallic', '2000', 'v24.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(255, 'From Under the Cork Tree - Fall Out Boy', 'From Under the Cork Tree (2005) - Fall Out Bo', '500', 'cd42.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(256, 'From Under the Cork Tree - Fall Out Boy', 'From Under the Cork Tree (2016) - Fall Out Bo', '1500', 'v41.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(257, 'Future Hearts - All Time Low', 'Future Hearts (2015) - All Time Low', '2000', 'c28.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(258, 'Gish - The Smashing Pumpkins', 'Gish (1991) - The Smashing Pumpkins', '3000', 'c22.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(259, 'Goats Head Soup - The Rolling Stones', 'Goats Head Soup (1973) - The Rolling Stones', '3500', 'c1.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(260, 'Good at Falling - The Japanese House', 'Good at Falling (2016) - The Japanese House', '2000', 'c58.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(261, 'Greatest Hits - Red Hot Chili Peppers', 'Greatest Hits (2016) - Red Hot Chili Peppers', '2000', 'v40.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(262, 'Greatest Hits: Believers Never Die – Volume Two - Fall Out Boy', 'Greatest Hits: Believers Never Die – Volume Two (2019) - Fall Out Boy', '2000', 'c3.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(263, 'Green River - Creedence Clearwater Revival', 'Green River (1969) - Creedence Clearwater Rev', '2000', 'cd3.jpg', 0, 1, '2020-08-08 20:15:05', NULL, NULL, NULL),
(264, 'Hardwired... to Self-Destruct - Metallica', 'Hardwired... to Self-Destruct (2016) - Metall', '1000', 'v25.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(265, 'Hash Pipe - Weezer', 'Hash Pipe (2001) - Weezer', '1200', 'v50.png', 1, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(266, 'Heaven Sent - INXS', 'Heaven Sent (1992) - INXS', '2000', 'V19.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(267, 'Hot Fuss - The Killers', 'Hot Fuss (2004) - The Killers', '500', 'cd49.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(268, 'Hot Fuss - The Killers', 'Hot Fuss (2004) - The Killers', '1500', 'v48.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(269, 'Hot Rocks - The Rolling Stones', 'Hot Rocks (1971) - The Rolling Stones', '1500', 'cd16.jpg', 0, 1, '2020-08-08 20:28:10', NULL, NULL, NULL),
(270, 'Hotel California - Eagles', 'Hotel California (1977) - Eagles', '1500', 'cd12.jpg', 0, 1, '2020-08-08 20:28:09', NULL, NULL, NULL),
(271, 'Houses of the Holy - Led Zeppelin', 'Houses of the Holy (1973) - Led Zeppelin', '1500', 'cd20.jpg', 0, 1, '2020-08-08 20:28:10', NULL, NULL, NULL),
(272, 'I Brought You My Bullets, You Brought Me Your', 'I Brought You My Bullets, You Brought Me Your', '2500', 'c44.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(273, 'I Like It When You Sleep, for You Are So Beautiful Yet So Unaware of It - The 1975', 'I Like It When You Sleep, for You Are So Beautiful Yet So Unaware of It (2016) - The 1975', '2000', 'c57.jfif', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(274, 'I Was Made For Lovin\' You - KISS', 'I Was Made For Lovin\' You (1979) - KISS', '2500', 'v11.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(275, 'Illiteracy Will Prevail - Nirvana', 'Illiteracy Will Prevail (2013) - Nirvana', '2000', 'v29.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(276, 'Imploding the Mirage - The Killers', 'Imploding the Mirage (2020) - The Killers', '1500', 'c48.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(277, 'In Through the Out Door - Led Zeppelin', 'In Through the Out Door (1978) - Led Zeppelin', '2500', 'c4.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(278, 'Infinity On High - Fall Out Boy', 'Infinity On High (2014) - Fall Out Boy', '1500', 'v42.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(279, 'Innuendo - Queen', 'Innuendo (1991) - Queen', '2000', 'v16.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(280, 'Kick - INXS', 'Kick (1987) - INXS', '1000', 'cd21.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(281, 'Kill \'Em All - Metallica', 'Kill \'Em All (1983) - Metallica', '3000', 'c17.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(282, 'Kiss Me, Kiss Me, Kiss Me - The Cure', 'Kiss Me, Kiss Me, Kiss Me (1987) - The Cure', '1000', 'cd22.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(283, 'Labyrinth - David Bowie', 'Labyrinth (2017) - David Bowie', '2500', 'v9.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(284, 'Led Zeppelin - Led Zeppelin', 'Led Zeppelin (1969) - Led Zeppelin', '2000', 'cd8.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(285, 'Led Zeppelin - Led Zeppelin', 'Led Zeppelin (1969) - Led Zeppelin', '4000', 'c5.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(286, 'Let It Bleed - The Rolling Stones', 'Let It Bleed (1969) - The Rolling Stones. CD ', '2000', 'cd2.jpg', 0, 1, '2020-08-08 20:15:05', NULL, NULL, NULL),
(287, 'Living Proof - State Champs', 'Living Proof (2018) - State Champs', '1000', 'v60.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(288, 'London Calling - The Clash', 'London Calling (1979) - The Clash', '3500', 'c20.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(289, 'Low - David Bowie', 'Low (1976) - David Bowie', '1500', 'cd11.jpg', 0, 1, '2020-08-08 20:28:09', NULL, NULL, NULL),
(290, 'Maladroit - Weezer', 'Maladroit (2002) - Weezer', '500', 'cd50.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(291, 'Master of Puppets - Metallica', 'Master of Puppets (1986) - Metallica', '1000', 'cd28.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(292, 'Master of Puppets - Metallica', 'Master of Puppets (1986) - Metallica', '3000', 'c13.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(293, 'Meaty Beaty Big and Bouncy - The Who', 'Meaty Beaty Big and Bouncy (1971) - The Who', '1500', 'cd17.jpg', 0, 1, '2020-08-08 20:28:10', NULL, NULL, NULL),
(294, 'Mellon Collie and the Infinite Sadness - The Smashing Pumpkins', 'Mellon Collie and the Infinite Sadness (1995) - The Smashing Pumpkins', '1000', 'cd32.jpg', 0, 1, '2020-08-08 20:51:01', NULL, NULL, NULL),
(295, 'Metallica - Metallica', 'Metallica (1991) - Metallica', '3000', 'c15.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(296, 'Meteora - Linkin Park', 'Meteora (2013) - Linkin Park', '1500', 'v54.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(297, 'MTV Unplugged in New York - Nirvana', 'MTV Unplugged in New York (1994) - Nirvana', '3000', 'c26.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(298, 'My Hero - Foo Fighters', 'My Hero (1998) - Foo Fighters', '2000', 'v43.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(299, 'Nevermind - Nirvana', 'Nevermind (1991) - Nirvana', '1000', 'cd33.jpg', 0, 1, '2020-08-08 20:51:01', NULL, NULL, NULL),
(300, 'Nevermind - Nirvana', 'Nevermind (2015) - Nirvana', '2000', 'v28.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(301, 'Nevermind - Nirvana', 'Nevermind (1992) - Nirvana', '2000', 'v30.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(302, 'Nevermind - Nirvana', 'Nevermind (1991) - Nirvana', '3000', 'c25.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(303, 'NINE - Blink-182', 'NINE (2019) - Blink-182', '2000', 'c29.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(304, 'No Plan EP - David Bowie', 'No Plan EP (2017) - David Bowie', '2500', 'v10.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(305, 'No Stone Unturned - The Rolling Stones', 'No Stone Unturned (1973) - The Rolling Stones', '3500', 'c2.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(306, 'Notes On A Conditional Form - The 1975', 'Notes On A Conditional Form (2020) - The 1975', '1500', 'c56.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(307, 'OK Computer OKNOTOK 1997 2017 - Radiohead', 'OK Computer OKNOTOK 1997 2017 (2017) - Radiohead', '3000', 'c39.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(308, 'One By One - Foo Fighters', 'One By One (2002) - Foo Fighters', '400', 'cd44.jpg', 1, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(309, 'Outlandos d\'Amour - The Police', 'Outlandos d\'Amour (1978) - The Police', '1500', 'cd15.jpg', 0, 1, '2020-08-08 20:28:10', NULL, NULL, NULL),
(310, 'Pablo Honey - Radiohead', 'Pablo Honey (1993) - Radiohead', '1000', 'cd39.jpg', 0, 1, '2020-08-08 20:51:02', NULL, NULL, NULL),
(311, 'Paramore - Paramore', 'Paramore (2013) - Paramore', '300', 'cd57.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(312, 'Permanent Vacation - Aerosmith', 'Permanent Vacation (1987) - Aerosmith', '1000', 'cd25.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(313, 'Pink - Aerosmith', 'Pink (1997) - Aerosmith', '2000', 'v23.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(314, 'Pipe Dream - The Jimi Hendrix Experience', 'Pipe Dream (2011) - The Jimi Hendrix Experien', '3000', 'v6.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(315, 'Return of the Snake - Metallica', 'Return of the Snake (2013) - Metallica', '1000', 'v26.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(316, 'Riot! - Paramore', 'Riot! (2007) - Paramore', '2500', 'c53.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(317, 'Road to Revolution: Live at Milton Keynes - Linkin Park', 'Road to Revolution: Live at Milton Keynes (2008) - Linkin Park', '1500', 'v55.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(318, 'Room On Fire - The Strokes', 'Room On Fire (2015) - The Strokes', '2000', 'v58.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(319, 'Sandinista - The Clash', 'Sandinista (1980) - The Clash', '3000', 'c18.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(320, 'Sempiternal - Bring Me The Horizon', 'Sempiternal (2013) - Bring Me The Horizon', '300', 'cd54.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(321, 'Sgt. Pepper\'s Lonely Hearts Club Band - The Beatles', 'Sgt. Pepper\'s Lonely Hearts Club Band (1967) - The Beatles', '2000', 'cd1.jpg', 0, 1, '2020-08-08 17:47:14', NULL, NULL, NULL),
(322, 'Sheer Heart Attack - Queen', 'Sheer Heart Attack (1974)  - Queen', '1500', 'cd18.jpg', 0, 1, '2020-08-08 20:28:10', NULL, NULL, NULL),
(323, 'Siamese Dream - The Smashing Pumpkins', 'Siamese Dream (1993) - The Smashing Pumpkins', '3000', 'c24.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(324, 'Simulation Theory - Muse', 'Simulation Theory (2019) - Muse', '2000', 'c43.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(325, 'Sing For Absolution - Muse', 'Sing For Absolution (2004) - Muse', '1500', 'v44.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(326, 'Six Pack - The Police', 'Six Pack (1980) - The Police', '2000', 'v14.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(327, 'Slappy EP - Green Day', 'Slappy EP (1990) - Green Day', '2000', 'v37.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(328, 'Slippery When Wet - Bon Jovi', 'Slippery When Wet (1986) - Bon Jovi', '1000', 'cd26.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(329, 'So Wrong, It\'s Right - All Time Low', 'So Wrong, It\'s Right (2019) - All Time Low', '1500', 'v59.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(330, 'Starman - David Bowie', 'Starman (2016) - David Bowie', '3500', 'c6.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(331, 'Still Not Getting Any... - Simple Plan', 'Still Not Getting Any... (2004) - Simple Plan', '500', 'cd48.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(332, 'Strange Days - The Doors', 'Strange Days (1967) - The Doors', '2000', 'cd5.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(333, 'Strange Days - The Doors', 'Strange Days (2017) - The Doors', '3000', 'v2.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(334, 'Strange Love - Simple Creatures', 'Strange Love (2019) - Simple Creatures', '2000', 'c19.png', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(335, 'Strangeways, Here We Come - The Smiths', 'Strangeways, Here We Come (1987) - The Smiths', '3000', 'c8.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(336, 'Suck It And See - Arctic Monkeys', 'Suck It And See (2011) - Arctic Monkeys', '2000', 'c52.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(337, 'Suicide Season - Bring Me The Horizon', 'Suicide Season (2017) - Bring Me The Horizon', '1500', 'v53.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(338, 'Surfin\' Safari / Surfin\' USA - The Beach Boys', 'Surfin\' Safari / Surfin\' USA (1963) - The Bea', '2000', 'cd4.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(339, 'Take Off Your Pants and Jacket - Blink-182', 'Take Off Your Pants and Jacket (2001) - Blink', '500', 'cd43.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(340, 'Take Off Your Pants And Jacket - Blink-182', 'Take Off Your Pants And Jacket (2001) - Blink', '2500', 'c31.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(341, 'Ten - Pearl Jam', 'Ten (1991) - Pearl Jam', '800', 'cd31.jpg', 1, 1, '2020-08-08 20:51:01', NULL, NULL, NULL),
(342, 'The 1975 - The 1975', 'The 1975 (2013) - The 1975', '300', 'cd58.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(343, 'The Alternate Axis: Bold As Love - The Jimi Hendrix Experience', 'The Alternate Axis: Bold As Love (2014) - The Jimi Hendrix Experience', '3000', 'v5.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(344, 'The Big Come Up - The Black Keys', 'The Big Come Up (2015) - The Black Keys', '1000', 'v51.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(345, 'The Big Come Up - The Black Keys', 'The Big Come Up (2015) - The Black Keys', '1000', 'v52.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(346, 'The Black Parade - My Chemical Romance', 'The Black Parade (2006) - My Chemical Romance', '500', 'cd46.jpg', 0, 1, '2020-08-08 21:02:03', NULL, NULL, NULL),
(347, 'The Black Parade - My Chemical Romance', 'The Black Parade (2015) - My Chemical Romance', '1500', 'v45.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(348, 'The Black Parade - My Chemical Romance', 'The Black Parade (2006) - My Chemical Romance', '2500', 'c46.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(349, 'The Cure In Orange - The Cure', 'The Cure In Orange (2017) - The Cure', '2000', 'v21.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(350, 'The Dark Side of the Moon - Pink Floyd', 'The Dark Side of the Moon (1973) - Pink Floyd', '1500', 'cd14.jpg', 0, 1, '2020-08-08 20:28:09', NULL, NULL, NULL),
(351, 'The Dark Side of the Moon - Pink Floyd', 'The Dark Side of the Moon (1973) - Pink Floyd', '3500', 'c7.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(352, 'The Getaway - Red Hot Chili Peppers', 'The Getaway (2016) - Red Hot Chili Peppers', '2000', 'c40.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(353, 'The Joshua Tree - U2', 'The Joshua Tree (1987) - U2', '1000', 'cd23.jpg', 0, 1, '2020-08-08 20:36:53', NULL, NULL, NULL),
(354, 'The King of Limbs - Radiohead', 'The King of Limbs (2011) - Radiohead', '2000', 'v39.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(355, 'The Last Laugh - Pink Floyd', 'The Last Laugh (2018) - Pink Floyd', '2500', 'v12.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(356, 'The Mark, Tom, and Travis Show (The Enema Strikes Back!) - Blink-182', 'The Mark, Tom, and Travis Show (The Enema Strikes Back!) (2000) - Blink-182', '1500', 'v36.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(357, 'The Mark, Tom, and Travis Show (The Enema Strikes Back!) - Blink-182', 'The Mark, Tom, and Travis Show (The Enema Strikes Back!) (2000) - Blink-182', '3000', 'c33.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(358, 'The McLaughlin Sessions NYC 1969 - Jimi Hendr', 'The McLaughlin Sessions NYC 1969 (2015) - Jim', '3000', 'v4.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(359, 'The New Abnormal - The Strokes', 'The New Abnormal (2020) - The Strokes', '1500', 'c59.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(360, 'The Notorious Byrd Brothers - The Byrds', 'The Notorious Byrd Brothers (1968) - The Byrd', '2000', 'cd9.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(361, 'The Strangest Party (These Are The Times) - INXS', 'The Strangest Party (These Are The Times) (1994) - INXS', '2000', 'v20.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(362, 'The Times They Are A-Changin\' - The Byrds', 'The Times They Are A-Changin\' (2011) - The By', '3000', 'v7.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(363, 'The Who Sings My Generation - The Who', 'The Who Sings My Generation (1965) - The Who', '2000', 'cd10.jpg', 0, 1, '2020-08-08 20:15:06', NULL, NULL, NULL),
(364, 'The Works - Queen', 'The Works (1984) - Queen', '3000', 'c9.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(365, 'Three Cheers For Sweet Revenge - My Chemical Romance', 'Three Cheers For Sweet Revenge (2004) - My Chemical Romance', '2500', 'c45.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(366, 'Tiny Music... Songs from the Vatican Gift Shop - Stone Temple Pilots', 'Tiny Music... Songs from the Vatican Gift Shop (1996) - Stone Temple Pilots', '1000', 'cd35.jpg', 0, 1, '2020-08-08 20:51:01', NULL, NULL, NULL),
(367, 'Tiny Music... Songs From The Vatican Gift Shop - Stone Temple Pilots', 'Tiny Music... Songs From The Vatican Gift Shop (1996) - Stone Temple Pilots', '2000', 'v31.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(368, 'Too Much Love Will Kill You - Queen', 'Too Much Love Will Kill You (1996) - Queen', '2000', 'v17.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(369, 'Total Life Forever - Foals', 'Total Life Forever (2010) - Foals', '300', 'cd55.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(370, 'Tranquility Base Hotel & Casino - Arctic Monkeys', 'Tranquility Base Hotel & Casino (2018) - Arctic Monkeys', '2000', 'c49.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(371, 'Trench - Twenty One Pilots', 'Trench (2018) - Twenty One Pilots', '2000', 'c60.png', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(372, 'Vs - Pearl Jam', 'Vs (1993) - Pearl Jam', '3000', 'c21.jpg', 0, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(373, 'Warning - Green Day', 'Warning (2000) - Green Day', '500', 'cd41.jpg', 0, 1, '2020-08-08 21:02:02', NULL, NULL, NULL),
(374, 'Warning - Green Day', 'Warning (2000) - Green Day', '2500', 'c37.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(375, 'Wasting Light - Foo Fighters', 'Wasting Light (2011) - Foo Fighters', '300', 'cd52.jpg', 0, 1, '2020-08-08 21:10:10', NULL, NULL, NULL),
(376, 'Weezer - Weezer', 'Weezer (2016) - Weezer', '1500', 'v49.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(377, 'Whatever People Say I Am, That\'s What I\'m Not', 'Whatever People Say I Am, That\'s What I\'m Not', '2500', 'c50.jpg', 0, 3, '2020-08-09 01:40:20', NULL, NULL, NULL),
(378, 'Zero - The Smashing Pumpkins', 'Zero (1996) - The Smashing Pumpkins', '2400', 'c23.png', 1, 3, '2020-08-09 01:40:19', NULL, NULL, NULL),
(379, '¡DOS!- Green Day', '¡DOS! (2012) - Green Day', '1000', 'v38.png', 0, 2, '2020-08-09 01:40:19', NULL, NULL, NULL),
(380, 'Let\'s Dance - David Bowie', 'Let\'s Dance (1983) - David Bowie', '1000', 'image-1597642756551.jpg', 0, 1, '2020-08-17 05:39:16', '2020-08-17 05:39:16', NULL, NULL),
(385, 'American Idiot - Green Day', 'American Idiot (2004) - Green Day', '500', 'image-1597648469533.jpg', 0, 1, '2020-08-17 07:14:29', '2020-08-17 07:14:29', '2020-08-17 07:14:38', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(45) NOT NULL,
  `idUser` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `rol` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `address`, `email`, `password`, `rol`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(2, 'Paul', 'McCartney', 'Ciudad Autónoma de Buenos Aires', 'Paul@gmail.com', 'johnstealsmylyrics', 0, '2020-08-13 16:54:38', NULL, NULL),
(3, 'George', 'Harrison', 'Provincia de Buenos Aires', 'george@gmail.com', 'chilling', 0, '2020-08-13 16:54:38', NULL, NULL),
(4, 'Ringo', 'Starr', 'Ciudad Autónoma de Buenos Aires', 'ringo@gmail.com', 'imthefunnyone', 0, '2020-08-13 16:54:38', NULL, NULL),
(5, 'John', 'Lennon', 'Provincia de Buenos Aires', 'John@gmail.com', 'iwasbetterthanpaullmao', 0, '2020-08-13 16:54:38', '2020-08-13 16:54:38', NULL),
(6, 'Jimi', 'Hendrix', 'Ciudad Autónoma de Buenos Aires', 'jimi@gmail.com', 'purplehaze', 0, '2020-08-13 20:17:12', '2020-08-13 20:17:12', NULL),
(7, 'Kurt', 'Cobain', 'Ciudad Autónoma de Buenos Aires', 'kurt@gmail.com', '$2a$10$7hjVJMgUDmtHikuk1FLZvuWF5p5aNzTbTlpoNU', 0, '2020-08-13 21:01:21', '2020-08-13 21:01:21', NULL),
(8, 'Freddy', 'Mercury', 'Provincia de Buenos Aires', 'freddy@gmail.com', '$2a$10$XW0UWXO6yynGRPbkKF7a0.PgAZcswhD/2K32bC', 0, '2020-08-14 18:53:19', '2020-08-14 18:53:19', NULL),
(9, 'James', 'Hetfield', 'Ciudad Autónoma de Buenos Aires', 'hetfield@gmail.com', '$2a$10$gOGvXYsSiaRckaJKMRr8iu1Ynu9YtYOpGHsLkL', 0, '2020-08-14 22:32:42', '2020-08-14 22:32:42', NULL),
(10, 'Dave', 'Grohl', 'Provincia de Buenos Aires', 'dave@gmail.com', '$2a$10$c9LBEiROtdbimDXFaK1O/et4bveuOJ4NbXbeb0', 0, '2020-08-15 01:29:51', '2020-08-15 01:29:51', NULL),
(11, 'Eddie', 'Van Halen', 'Ciudad Autónoma de Buenos Aires', 'eddie@gmail.com', '$2a$10$8t.CkGmYVZelJJH1NOz7/e3DI/ei3fMCqpaWsZ8fEcx/L92EnppzO', 0, '2020-08-16 15:38:45', '2020-08-16 15:38:45', NULL),
(12, 'Stefano', 'Brascetta', 'Ciudad Autónoma de Buenos Aires', 'stefanobras20@gmail.com', '$2a$10$jnyJbDcJ2dK479FG.XSbBOo1lHR9qYv.FhiV0jNlyMgpmdU.QyOc2', 1, '2020-08-16 15:45:57', '2020-08-17 02:36:05', NULL),
(13, 'Billie Joe', 'Armstrong', 'Ciudad Autónoma de Buenos Aires', 'billiejoe@gmail.com', '$2a$10$HBMA3Ln2AAayUzktueFVcu4s6pA5.8y9HnmX/8uzGxmKrAStGyZl.', 0, '2020-08-16 16:52:12', '2020-08-16 16:52:12', NULL),
(14, 'Mike', 'Dirnt', 'Provincia de Buenos Aires', 'dirnt@gmail.com', '$2a$10$4aGL6J.H0pThgHaUlhjADeKcJr90NaLVANxd6o9bDy6AMupgtWKwC', 0, '2020-08-16 21:18:39', '2020-08-16 21:18:39', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `items_ibfk_2` (`idCart`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Indices de la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`idCart`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
