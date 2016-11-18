-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 17, 2016 at 06:36 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a9515949_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `acuerdos`
--

CREATE TABLE `acuerdos` (
  `fsid` int(10) NOT NULL AUTO_INCREMENT,
  `fsjuntaid` int(10) NOT NULL,
  `fsasunto` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `fsacuerdo` varchar(150) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`fsid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `acuerdos`
--

INSERT INTO `acuerdos` VALUES(1, 2, 'fadf', 'jjjaf');
INSERT INTO `acuerdos` VALUES(2, 0, 'fd', 'eee');
INSERT INTO `acuerdos` VALUES(3, 0, 'fd', 'eee');
INSERT INTO `acuerdos` VALUES(4, 2, 'tt', 'ttttt');
INSERT INTO `acuerdos` VALUES(5, 5, 'iois', 'tlplpl');
INSERT INTO `acuerdos` VALUES(6, 5, 'otro asunto', 'jklj;ad');
INSERT INTO `acuerdos` VALUES(7, 3, 'Terra', 'pppp');
INSERT INTO `acuerdos` VALUES(8, 8, 'olimpiadas', 'que haremos despues');
INSERT INTO `acuerdos` VALUES(9, 9, 'Smash For Glory', 'Que se arme la machaca');
INSERT INTO `acuerdos` VALUES(10, 11, 'Lolis legales para el mundo', 'Sociedad');
INSERT INTO `acuerdos` VALUES(11, 11, 'Lolis legales para el mundo version2', 'Sociedad');
INSERT INTO `acuerdos` VALUES(12, 14, 'Mencion de alumnos egresados', 'Egresados');
INSERT INTO `acuerdos` VALUES(13, 15, 'acuerdo1', '1');
INSERT INTO `acuerdos` VALUES(14, 15, 'acuerdo1', 'asuntos generales');
INSERT INTO `acuerdos` VALUES(15, 15, 'acuerdo1', 'asuntos generales');
INSERT INTO `acuerdos` VALUES(16, 15, 'acuerdo1', 'asuntos generales');
INSERT INTO `acuerdos` VALUES(17, 15, 'acuerdo1', 'asuntos generales');
INSERT INTO `acuerdos` VALUES(18, 15, 'acuerdo1', 'asuntos generalesfinak');
INSERT INTO `acuerdos` VALUES(19, 15, 'acuerdo1', 'asuntos generalesfinak');

-- --------------------------------------------------------

--
-- Table structure for table `invitados`
--

CREATE TABLE `invitados` (
  `fsid` int(11) NOT NULL AUTO_INCREMENT,
  `fsidjunta` int(10) NOT NULL,
  `fsidusuario` int(10) NOT NULL,
  `asistencia` varchar(10) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`fsid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=126 ;

--
-- Dumping data for table `invitados`
--

INSERT INTO `invitados` VALUES(22, 5, 1, '');
INSERT INTO `invitados` VALUES(9, 2, 3, '');
INSERT INTO `invitados` VALUES(123, 15, 1, 'true');
INSERT INTO `invitados` VALUES(23, 5, 2, '');
INSERT INTO `invitados` VALUES(68, 6, 5, '');
INSERT INTO `invitados` VALUES(67, 6, 3, '');
INSERT INTO `invitados` VALUES(116, 3, 3, '');
INSERT INTO `invitados` VALUES(115, 3, 1, '');
INSERT INTO `invitados` VALUES(60, 8, 5, '');
INSERT INTO `invitados` VALUES(59, 8, 3, 'true');
INSERT INTO `invitados` VALUES(66, 6, 4, '');
INSERT INTO `invitados` VALUES(65, 6, 1, 'true');
INSERT INTO `invitados` VALUES(64, 6, 2, 'true');
INSERT INTO `invitados` VALUES(78, 10, 1, '');
INSERT INTO `invitados` VALUES(77, 9, 5, '');
INSERT INTO `invitados` VALUES(76, 9, 3, 'true');
INSERT INTO `invitados` VALUES(75, 9, 4, '');
INSERT INTO `invitados` VALUES(79, 10, 3, '');
INSERT INTO `invitados` VALUES(80, 11, 1, '');
INSERT INTO `invitados` VALUES(81, 11, 6, '');
INSERT INTO `invitados` VALUES(114, 13, 6, '');
INSERT INTO `invitados` VALUES(113, 13, 1, '');
INSERT INTO `invitados` VALUES(110, 12, 9, '');
INSERT INTO `invitados` VALUES(109, 12, 8, '');
INSERT INTO `invitados` VALUES(108, 12, 7, '');
INSERT INTO `invitados` VALUES(107, 12, 6, '');
INSERT INTO `invitados` VALUES(106, 12, 2, '');
INSERT INTO `invitados` VALUES(105, 12, 5, '');
INSERT INTO `invitados` VALUES(122, 14, 9, '');
INSERT INTO `invitados` VALUES(121, 14, 1, '');
INSERT INTO `invitados` VALUES(124, 15, 8, 'true');
INSERT INTO `invitados` VALUES(125, 15, 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `juntas`
--

CREATE TABLE `juntas` (
  `fsid` int(10) NOT NULL AUTO_INCREMENT,
  `fstema` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `fsfecha` datetime NOT NULL,
  PRIMARY KEY (`fsid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `juntas`
--

INSERT INTO `juntas` VALUES(3, 'tercera cars', '2016-08-08 00:00:00');
INSERT INTO `juntas` VALUES(2, 'segunda junta ahora con fecha', '2016-07-07 00:00:00');
INSERT INTO `juntas` VALUES(8, 'junta apego al plan', '2016-08-14 07:00:00');
INSERT INTO `juntas` VALUES(6, 'cambiar el nombre', '2016-08-26 07:00:00');
INSERT INTO `juntas` VALUES(9, 'Smash Party', '2016-08-16 07:00:00');
INSERT INTO `juntas` VALUES(10, 'Revision', '2016-08-25 07:00:00');
INSERT INTO `juntas` VALUES(13, 'psycho', '2017-09-03 07:00:00');
INSERT INTO `juntas` VALUES(12, 'Curso de drones', '2016-08-19 07:00:00');
INSERT INTO `juntas` VALUES(14, 'Acto Academico', '2016-10-21 07:00:00');
INSERT INTO `juntas` VALUES(15, 'Acreditacion', '2016-10-10 07:00:00');
INSERT INTO `juntas` VALUES(16, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `qrdb`
--

CREATE TABLE `qrdb` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `serie` varchar(7) COLLATE latin1_general_ci NOT NULL,
  `owner` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `pet` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `colonia` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `telefono` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `celular` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ciudad` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `concolonia` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `esterilizado` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `antirrabica` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serie` (`serie`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `qrdb`
--

INSERT INTO `qrdb` VALUES(1, '1', 'Luis', 'Grace', 'mesa', '6646987512', '6645549871', 'Tijuana', 'true', 'true', 'true', 'l');


-- --------------------------------------------------------

--
-- Table structure for table `qrnews`
--

CREATE TABLE `qrnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `title` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `picurl` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `qrnews`
--

INSERT INTO `qrnews` VALUES(1, 'muse', 'carrera', 'survival.jpg');
INSERT INTO `qrnews` VALUES(2, 'Arudinos', 'campaña de arduinos nano', 'arduino.jpg');
INSERT INTO `qrnews` VALUES(3, 'se esterilizaran mascotas', 'campaña de esterilizacion', 'esterilizacion.jpg');
INSERT INTO `qrnews` VALUES(4, 'mascotas perdidas', 'mascotas perdidas', 'lost.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `type` int(2) NOT NULL,
  `direccion` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `telefono1` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `telefono2` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(1, 'root', 'pppp', 'iscluispalomares@gmail.com', 1, 'bug75', '8671', '1018');
INSERT INTO `users` VALUES(2, 'luis', 'pppp', 'luya7x@gmail.com', 1, 'bugs 75', '45646', '21313');
INSERT INTO `users` VALUES(3, 'pose', 'pppp', 'luy_a7x@hotmail.com', 1, 'dasd', 'djjja', 'oiji');
INSERT INTO `users` VALUES(4, 'root2', 'pppp', 'iscluispalomaresitt@gmail.com', 1, 'priv', 'priv', 'priv');
INSERT INTO `users` VALUES(5, 'lpalomares', 'pppp', 'l.palomares@posey.com', 1, 'priv', 'priv', 'priv');
INSERT INTO `users` VALUES(6, 'nicoMaki', 'camarones11', 'jeduardoguzmanl@gmail.com', 1, 'priv', 'priv', 'priv');
INSERT INTO `users` VALUES(7, 'magdaleno', '9583', 'magpalencia@gmail.com', 1, 'priv', 'priv', 'priv');
INSERT INTO `users` VALUES(8, 'Jose Sergio Magdaleno Palencia', '1234', 'jmagdaleno@tectijuana.edu.mx', 1, 'priv', 'priv', 'priv');
INSERT INTO `users` VALUES(9, 'jsergioo', '1234', 'sergio.magdaleno@uabc.edu.mx', 1, 'priv', 'priv', 'priv');
