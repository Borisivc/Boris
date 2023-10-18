-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2023 a las 02:00:54
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
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `id_candidato` int(10) NOT NULL,
  `nombre_candidato` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`id_candidato`, `nombre_candidato`) VALUES
(1, 'Patricio Aylwin Azócar'),
(2, 'Eduardo Frei Ruiz-Tagle'),
(3, 'Ricardo Lagos Escobar'),
(4, 'Michelle Bachelet Jeria'),
(5, 'Sebastián Piñera Echenique'),
(6, 'Gabriel Boric Font');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id_comuna` int(10) NOT NULL,
  `nombre_comuna` varchar(50) NOT NULL,
  `id_region` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id_comuna`, `nombre_comuna`, `id_region`) VALUES
(1, 'Iquique', 1),
(2, 'Alto Hospicio', 1),
(3, 'Pozo Almonte', 1),
(4, 'Camiña', 1),
(5, 'Colchane', 1),
(6, 'Huara', 1),
(7, 'Pica', 1),
(8, 'Antofagasta', 2),
(9, 'Mejillones', 2),
(10, 'Sierra Gorda', 2),
(11, 'Taltal', 2),
(12, 'Calama', 2),
(13, 'Ollagüe', 2),
(14, 'San Pedro de Atacama', 2),
(15, 'Tocopilla', 2),
(16, 'María Elena', 2),
(17, 'Copiapó', 3),
(18, 'Caldera', 3),
(19, 'Tierra Amarilla', 3),
(20, 'Chañaral', 3),
(21, 'Diego de Almagro', 3),
(22, 'Vallenar', 3),
(23, 'Alto del Carmen', 3),
(24, 'Freirina', 3),
(25, 'Huasco', 3),
(26, 'La Serena', 4),
(27, 'Coquimbo', 4),
(28, 'Andacollo', 4),
(29, 'La Higuera', 4),
(30, 'Paiguano', 4),
(31, 'Vicuña', 4),
(32, 'Illapel', 4),
(33, 'Canela', 4),
(34, 'Los Vilos', 4),
(35, 'Salamanca', 4),
(36, 'Ovalle', 4),
(37, 'Combarbalá', 4),
(38, 'Monte Patria', 4),
(39, 'Punitaqui', 4),
(40, 'Río Hurtado', 4),
(41, 'Valparaíso', 5),
(42, 'Casablanca', 5),
(43, 'Concón', 5),
(44, 'Juan Fernández', 5),
(45, 'Puchuncaví', 5),
(46, 'Quintero', 5),
(47, 'Viña del Mar', 5),
(48, 'Isla de Pascua', 5),
(49, 'Los Andes', 5),
(50, 'Calle Larga', 5),
(51, 'Rinconada', 5),
(52, 'San Esteban', 5),
(53, 'La Ligua', 5),
(54, 'Cabildo', 5),
(55, 'Papudo', 5),
(56, 'Petorca', 5),
(57, 'Zapallar', 5),
(58, 'Quillota', 5),
(59, 'Calera', 5),
(60, 'Hijuelas', 5),
(61, 'La Cruz', 5),
(62, 'Nogales', 5),
(63, 'San Antonio', 5),
(64, 'Algarrobo', 5),
(65, 'Cartagena', 5),
(66, 'El Quisco', 5),
(67, 'El Tabo', 5),
(68, 'Santo Domingo', 5),
(69, 'San Felipe', 5),
(70, 'Catemu', 5),
(71, 'Llaillay', 5),
(72, 'Panquehue', 5),
(73, 'Putaendo', 5),
(74, 'Santa María', 5),
(75, 'Limache', 5),
(76, 'Quilpué', 5),
(77, 'Villa Alemana', 5),
(78, 'Olmué', 5),
(79, 'Chépica', 6),
(80, 'Chimbarongo', 6),
(81, 'Codegua', 6),
(82, 'Coinco', 6),
(83, 'Coltauco', 6),
(84, 'Doñihue', 6),
(85, 'Graneros', 6),
(86, 'La Estrella', 6),
(87, 'Las Cabras', 6),
(88, 'Litueche', 6),
(89, 'Lolol', 6),
(90, 'Machalí', 6),
(91, 'Malloa', 6),
(92, 'Marchigue', 6),
(93, 'Mostazal', 6),
(94, 'Nancagua', 6),
(95, 'Navidad', 6),
(96, 'Cauquenes', 7),
(97, 'Chanco', 7),
(98, 'Colbún', 7),
(99, 'Constitución', 7),
(100, 'Curepto', 7),
(101, 'Curicó', 7),
(102, 'Empedrado', 7),
(103, 'Hualañé', 7),
(104, 'Licantén', 7),
(105, 'Linares', 7),
(106, 'Longaví', 7),
(107, 'Maule', 7),
(108, 'Molina', 7),
(109, 'Parral', 7),
(110, 'Pelarco', 7),
(111, 'Arauco', 8),
(112, 'Cañete', 8),
(113, 'Contulmo', 8),
(114, 'Curanilahue', 8),
(115, 'Lebu', 8),
(116, 'Los Álamos', 8),
(117, 'Tirúa', 8),
(118, 'Alto Biobío', 8),
(119, 'Antuco', 8),
(120, 'Cabrero', 8),
(121, 'Laja', 8),
(122, 'Los Ángeles', 8),
(123, 'Mulchén', 8),
(124, 'Nacimiento', 8),
(125, 'Negrete', 8),
(126, 'Quilaco', 8),
(127, 'Quilleco', 8),
(128, 'San Rosendo', 8),
(129, 'Santa Bárbara', 8),
(130, 'Tucapel', 8),
(131, 'Yumbel', 8),
(132, 'Chiguayante', 8),
(133, 'Concepción', 8),
(134, 'Coronel', 8),
(135, 'Florida', 8),
(136, 'Hualpén', 8),
(137, 'Hualqui', 8),
(138, 'Lota', 8),
(139, 'Penco', 8),
(140, 'San Pedro de la Paz', 8),
(141, 'Santa Juana', 8),
(142, 'Talcahuano', 8),
(143, 'Tomé', 8),
(144, 'Carahue', 9),
(145, 'Cholchol', 9),
(146, 'Cunco', 9),
(147, 'Curarrehue', 9),
(148, 'Freire', 9),
(149, 'Galvarino', 9),
(150, 'Gorbea', 9),
(151, 'Lautaro', 9),
(152, 'Loncoche', 9),
(153, 'Melipeuco', 9),
(154, 'Nueva Imperial', 9),
(155, 'Padre Las Casas', 9),
(156, 'Perquenco', 9),
(157, 'Pitrufquén', 9),
(158, 'Pucón', 9),
(159, 'Puerto Saavedra', 9),
(160, 'Temuco', 9),
(161, 'Teodoro Schmidt', 9),
(162, 'Toltén', 9),
(163, 'Vilcún', 9),
(164, 'Villarrica', 9),
(165, 'Ancud', 10),
(166, 'Castro', 10),
(167, 'Chonchi', 10),
(168, 'Curaco de Vélez', 10),
(169, 'Dalcahue', 10),
(170, 'Puqueldón', 10),
(171, 'Queilén', 10),
(172, 'Quemchi', 10),
(173, 'Quellón', 10),
(174, 'Quinchao', 10),
(175, 'Calbuco', 10),
(176, 'Cochamó', 10),
(177, 'Fresia', 10),
(178, 'Frutillar', 10),
(179, 'Llanquihue', 10),
(180, 'Los Muermos', 10),
(181, 'Maullín', 10),
(182, 'Puerto Montt', 10),
(183, 'Puerto Varas', 10),
(184, 'Osorno', 10),
(185, 'Puerto Octay', 10),
(186, 'Purranque', 10),
(187, 'Puyehue', 10),
(188, 'Río Negro', 10),
(189, 'San Juan de la Costa', 10),
(190, 'San Pablo', 10),
(191, 'Chaitén', 10),
(192, 'Futaleufú', 10),
(193, 'Hualaihué', 10),
(194, 'Palena', 10),
(195, 'Cisnes', 11),
(196, 'Guaitecas', 11),
(197, 'Aysén', 11),
(198, 'Cochrane', 11),
(199, 'OHiggins', 11),
(200, 'Tortel', 11),
(201, 'Coyhaique', 11),
(202, 'Lago Verde', 11),
(203, 'Chile Chico', 11),
(204, 'Río Ibáñez', 11),
(205, 'Antártica', 12),
(206, 'Cabo de Hornos', 12),
(207, 'Laguna Blanca', 12),
(208, 'Punta Arenas', 12),
(209, 'Río Verde', 12),
(210, 'San Gregorio', 12),
(211, 'Porvenir', 12),
(212, 'Primavera', 12),
(213, 'Timaukel', 12),
(214, 'Natales', 12),
(215, 'Torres del Paine', 12),
(216, 'Colina', 13),
(217, 'Lampa', 13),
(218, 'Til Til', 13),
(219, 'Pirque', 13),
(220, 'Puente Alto', 13),
(221, 'San José de Maipo', 13),
(222, 'Buin', 13),
(223, 'Calera de Tango', 13),
(224, 'Paine', 13),
(225, 'San Bernardo', 13),
(226, 'Alhué', 13),
(227, 'Curacaví', 13),
(228, 'María Pinto', 13),
(229, 'Melipilla', 13),
(230, 'San Pedro', 13),
(231, 'Cerrillos', 13),
(232, 'Cerro Navia', 13),
(233, 'Conchalí', 13),
(234, 'El Bosque', 13),
(235, 'Estación Central', 13),
(236, 'Huechuraba', 13),
(237, 'Independencia', 13),
(238, 'La Cisterna', 13),
(239, 'La Granja', 13),
(240, 'La Florida', 13),
(241, 'La Pintana', 13),
(242, 'La Reina', 13),
(243, 'Las Condes', 13),
(244, 'Lo Barnechea', 13),
(245, 'Lo Espejo', 13),
(246, 'Lo Prado', 13),
(247, 'Macul', 13),
(248, 'Maipú', 13),
(249, 'Ñuñoa', 13),
(250, 'Pedro Aguirre Cerda', 13),
(251, 'Peñalolén', 13),
(252, 'Providencia', 13),
(253, 'Pudahuel', 13),
(254, 'Quilicura', 13),
(255, 'Quinta Normal', 13),
(256, 'Recoleta', 13),
(257, 'Renca', 13),
(258, 'San Miguel', 13),
(259, 'San Joaquín', 13),
(260, 'San Ramón', 13),
(261, 'Santiago', 13),
(262, 'Vitacura', 13),
(263, 'El Monte', 13),
(264, 'Isla de Maipo', 13),
(265, 'Padre Hurtado', 13),
(266, 'Peñaflor', 13),
(267, 'Talagante', 13),
(268, 'Mariquina', 14),
(269, 'Lanco', 14),
(270, 'Máfil', 14),
(271, 'Valdivia', 14),
(272, 'Corral', 14),
(273, 'Paillaco', 14),
(274, 'Los Lagos', 14),
(275, 'Panguipulli', 14),
(276, 'La Unión', 14),
(277, 'Río Bueno', 14),
(278, 'Lago Ranco', 14),
(279, 'Futrono', 14),
(280, 'Arica', 15),
(281, 'Camarones', 15),
(282, 'General Lagos', 15),
(283, 'Putre', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencia`
--

CREATE TABLE `preferencia` (
  `id_preferencia` int(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `preferencia`
--

INSERT INTO `preferencia` (`id_preferencia`, `descripcion`) VALUES
(1, 'Web'),
(2, 'TV'),
(3, 'Redes Sociales'),
(4, 'Amigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id_region` int(10) NOT NULL,
  `nombre_region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id_region`, `nombre_region`) VALUES
(1, 'Tarapaca'),
(2, 'Antofagasta'),
(3, 'Atacama'),
(4, 'Coquimbo'),
(5, 'Valparaiso'),
(6, 'Ohiggins'),
(7, 'Maule'),
(8, 'Biobio'),
(9, 'Araucania'),
(10, 'Los Lagos'),
(11, 'Aysen'),
(12, 'Magallanes'),
(13, 'Metropolitana'),
(14, 'Los Rios'),
(15, 'Arica y Parinacota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_votacion`
--

CREATE TABLE `registro_votacion` (
  `id_voto` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_candidato` int(10) NOT NULL,
  `id_preferencia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votante`
--

CREATE TABLE `votante` (
  `id_usuario` int(10) NOT NULL,
  `nombre_usuario` varchar(40) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `rut` varchar(9) NOT NULL,
  `email` varchar(40) NOT NULL,
  `id_comuna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`id_candidato`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id_comuna`),
  ADD KEY `id_region` (`id_region`) USING BTREE;

--
-- Indices de la tabla `preferencia`
--
ALTER TABLE `preferencia`
  ADD PRIMARY KEY (`id_preferencia`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id_region`);

--
-- Indices de la tabla `registro_votacion`
--
ALTER TABLE `registro_votacion`
  ADD PRIMARY KEY (`id_voto`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_candidato` (`id_candidato`),
  ADD KEY `id_preferencia` (`id_preferencia`);

--
-- Indices de la tabla `votante`
--
ALTER TABLE `votante`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_comuna` (`id_comuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidato`
--
ALTER TABLE `candidato`
  MODIFY `id_candidato` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id_comuna` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT de la tabla `preferencia`
--
ALTER TABLE `preferencia`
  MODIFY `id_preferencia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id_region` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `registro_votacion`
--
ALTER TABLE `registro_votacion`
  MODIFY `id_voto` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `votante`
--
ALTER TABLE `votante`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `comuna` (`id_region`);

--
-- Filtros para la tabla `registro_votacion`
--
ALTER TABLE `registro_votacion`
  ADD CONSTRAINT `registro_votacion_ibfk_2` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`),
  ADD CONSTRAINT `registro_votacion_ibfk_3` FOREIGN KEY (`id_preferencia`) REFERENCES `preferencia` (`id_preferencia`),
  ADD CONSTRAINT `registro_votacion_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `votante` (`id_usuario`);

--
-- Filtros para la tabla `votante`
--
ALTER TABLE `votante`
  ADD CONSTRAINT `votante_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_region`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
