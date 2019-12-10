-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Dez-2019 às 17:03
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_apuracaofator`
--

CREATE TABLE `tb_apuracaofator` (
  `idfator` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idTributacao` int(11) NOT NULL,
  `dtCompetencia` date NOT NULL,
  `fatorR` float NOT NULL,
  `vlrImposto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_empresa`
--

CREATE TABLE `tb_empresa` (
  `idEmpresa` int(11) NOT NULL,
  `idEnquadramento` int(11) NOT NULL,
  `razaoSocial` varchar(45) NOT NULL,
  `fantasia` varchar(45) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `cnae` varchar(9) NOT NULL,
  `ativo` tinyint(4) NOT NULL DEFAULT 1,
  `dtInicioAtividade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_empresa`
--

INSERT INTO `tb_empresa` (`idEmpresa`, `idEnquadramento`, `razaoSocial`, `fantasia`, `cnpj`, `cnae`, `ativo`, `dtInicioAtividade`) VALUES
(1, 2, 'RAZÃO SOCIAL', 'NOME FANTASIA', '99999999000191', '12345678', 1, '2018-01-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_enquadramento`
--

CREATE TABLE `tb_enquadramento` (
  `idEnquadramento` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `vlrIniFaturamento` double NOT NULL,
  `vlrFimFaturamento` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_enquadramento`
--

INSERT INTO `tb_enquadramento` (`idEnquadramento`, `nome`, `vlrIniFaturamento`, `vlrFimFaturamento`) VALUES
(1, 'MEI', 0, 81000),
(2, 'Micro Empresa - ME', 0, 360000),
(3, 'Empresa de Pequeno Porte - EPP', 360000.01, 4800000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_faturamento`
--

CREATE TABLE `tb_faturamento` (
  `idfaturamento` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `nrNota` int(11) NOT NULL,
  `dtEmissao` date NOT NULL,
  `serie` int(11) NOT NULL,
  `vlrButo` double NOT NULL,
  `cancelada` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: False\n1: True'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_folha`
--

CREATE TABLE `tb_folha` (
  `idfolha` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `dtCompetencia` date NOT NULL,
  `vlrContribuicaoINSS` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcoes`
--

CREATE TABLE `tb_funcoes` (
  `id_funcoes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_permissao`
--

CREATE TABLE `tb_permissao` (
  `idtb_permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tributacao`
--

CREATE TABLE `tb_tributacao` (
  `idTributacao` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `percImposto` float NOT NULL,
  `vlrDeduzir` double NOT NULL,
  `vlrMinReceita` double NOT NULL,
  `vlrMaxReceita` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_apuracaofator`
--
ALTER TABLE `tb_apuracaofator`
  ADD PRIMARY KEY (`idfator`),
  ADD KEY `fk_tb_apuracaoFator_tb_empresa_idx` (`idEmpresa`),
  ADD KEY `fk_tb_apuracaoFator_tb_tributacao1_idx` (`idTributacao`);

--
-- Índices para tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD UNIQUE KEY `cnpj_UNIQUE` (`cnpj`),
  ADD KEY `fk_tb_empresa_tb_enquadramento1_idx` (`idEnquadramento`);

--
-- Índices para tabela `tb_enquadramento`
--
ALTER TABLE `tb_enquadramento`
  ADD PRIMARY KEY (`idEnquadramento`);

--
-- Índices para tabela `tb_faturamento`
--
ALTER TABLE `tb_faturamento`
  ADD PRIMARY KEY (`idfaturamento`),
  ADD KEY `fk_tb_faturamento_tb_empresa1_idx` (`idEmpresa`);

--
-- Índices para tabela `tb_folha`
--
ALTER TABLE `tb_folha`
  ADD PRIMARY KEY (`idfolha`),
  ADD KEY `fk_tb_folha_tb_empresa1_idx` (`idEmpresa`);

--
-- Índices para tabela `tb_funcoes`
--
ALTER TABLE `tb_funcoes`
  ADD PRIMARY KEY (`id_funcoes`);

--
-- Índices para tabela `tb_permissao`
--
ALTER TABLE `tb_permissao`
  ADD PRIMARY KEY (`idtb_permissao`);

--
-- Índices para tabela `tb_tributacao`
--
ALTER TABLE `tb_tributacao`
  ADD PRIMARY KEY (`idTributacao`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_apuracaofator`
--
ALTER TABLE `tb_apuracaofator`
  MODIFY `idfator` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_enquadramento`
--
ALTER TABLE `tb_enquadramento`
  MODIFY `idEnquadramento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_faturamento`
--
ALTER TABLE `tb_faturamento`
  MODIFY `idfaturamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_folha`
--
ALTER TABLE `tb_folha`
  MODIFY `idfolha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcoes`
--
ALTER TABLE `tb_funcoes`
  MODIFY `id_funcoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_permissao`
--
ALTER TABLE `tb_permissao`
  MODIFY `idtb_permissao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tributacao`
--
ALTER TABLE `tb_tributacao`
  MODIFY `idTributacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_apuracaofator`
--
ALTER TABLE `tb_apuracaofator`
  ADD CONSTRAINT `fk_tb_apuracaoFator_tb_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_apuracaoFator_tb_tributacao1` FOREIGN KEY (`idTributacao`) REFERENCES `tb_tributacao` (`idTributacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD CONSTRAINT `fk_tb_empresa_tb_enquadramento1` FOREIGN KEY (`idEnquadramento`) REFERENCES `tb_enquadramento` (`idEnquadramento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_faturamento`
--
ALTER TABLE `tb_faturamento`
  ADD CONSTRAINT `fk_tb_faturamento_tb_empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_folha`
--
ALTER TABLE `tb_folha`
  ADD CONSTRAINT `fk_tb_folha_tb_empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
