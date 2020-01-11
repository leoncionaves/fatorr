-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Jan-2020 às 13:02
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_fator`
--

--
-- Extraindo dados da tabela `tb_faturamento`
--

INSERT INTO `tb_faturamento` (`idfaturamento`, `idEmpresa`, `numNota`, `dtEmissao`, `serie`, `vlrBruto`, `cancelada`) VALUES
(29, 1, 1, '2018-06-01', 1, 3796.66, 0),
(30, 1, 2, '2018-07-01', 1, 1898.33, 0),
(31, 1, 0, '2018-08-01', 0, 0, 0),
(32, 1, 4, '2018-09-01', 1, 12197.5, 0),
(33, 1, 5, '2018-10-01', 1, 16202.51, 0),
(34, 1, 6, '2018-11-01', 1, 8147.5, 0),
(35, 1, 7, '2018-12-01', 1, 8143.33, 0),
(36, 1, 9, '2019-01-01', 1, 10512.5, 0),
(37, 1, 10, '2019-02-01', 1, 9739.16, 0),
(38, 1, 11, '2019-03-01', 1, 10321.67, 0),
(39, 1, 12, '2019-04-01', 1, 9472.5, 0),
(40, 1, 13, '2019-05-01', 1, 8926.67, 0),
(41, 1, 14, '2019-06-01', 1, 9673.74, 0),
(42, 1, 17, '2019-07-01', 1, 12038.4, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
