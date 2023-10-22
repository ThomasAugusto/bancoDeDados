-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Out-2023 às 01:52
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atividade_12`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `associado`
--

CREATE TABLE `associado` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(80) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cultura`
--

CREATE TABLE `cultura` (
  `id` int(11) NOT NULL,
  `tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `custeio`
--

CREATE TABLE `custeio` (
  `id` int(11) NOT NULL,
  `fk_tipo_custeio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estatus`
--

CREATE TABLE `estatus` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `estatus`
--

INSERT INTO `estatus` (`id`, `tipo`) VALUES
(1, 'Em analise'),
(2, 'Aprovado'),
(3, 'Concluído');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `funcao` varchar(30) NOT NULL,
  `data_admissao` date NOT NULL,
  `data_demissao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `investimento`
--

CREATE TABLE `investimento` (
  `id` int(11) NOT NULL,
  `fk_quem_autorizou` int(11) DEFAULT NULL,
  `data_aprovacao` date DEFAULT NULL,
  `feira` tinyint(1) NOT NULL,
  `informacoes_complementares` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_custeio`
--

CREATE TABLE `item_custeio` (
  `fk_custeio` int(11) NOT NULL,
  `qntd` int(11) NOT NULL,
  `item` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_investimento`
--

CREATE TABLE `item_investimento` (
  `fk_investimento` int(11) NOT NULL,
  `qntd` int(11) NOT NULL,
  `item` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proposta`
--

CREATE TABLE `proposta` (
  `id` int(11) NOT NULL,
  `valor_total` float NOT NULL,
  `valor_financiado` float NOT NULL,
  `fk_associado` int(11) NOT NULL,
  `fk_quem_fez` int(11) NOT NULL,
  `data_proposta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_custeio` int(11) DEFAULT NULL,
  `fk_investimento` int(11) DEFAULT NULL,
  `fk_cultura` int(11) NOT NULL,
  `fk_estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_custeio`
--

CREATE TABLE `tipo_custeio` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipo_custeio`
--

INSERT INTO `tipo_custeio` (`id`, `tipo`) VALUES
(1, 'Pecuaria'),
(2, 'Agricola');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `associado`
--
ALTER TABLE `associado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cultura`
--
ALTER TABLE `cultura`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `custeio`
--
ALTER TABLE `custeio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipo_custeio_custeio` (`fk_tipo_custeio`);

--
-- Índices para tabela `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `investimento`
--
ALTER TABLE `investimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_funcionarios_investimento` (`fk_quem_autorizou`);

--
-- Índices para tabela `item_custeio`
--
ALTER TABLE `item_custeio`
  ADD KEY `fk_custeio_item_custeio` (`fk_custeio`);

--
-- Índices para tabela `item_investimento`
--
ALTER TABLE `item_investimento`
  ADD KEY `fk_invetimento_item_investimento` (`fk_investimento`);

--
-- Índices para tabela `proposta`
--
ALTER TABLE `proposta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_investimeno_proposta` (`fk_investimento`),
  ADD KEY `fk_custeio_proposto` (`fk_custeio`),
  ADD KEY `fk_cultura_proposta` (`fk_cultura`),
  ADD KEY `fk_associado_proposta` (`fk_associado`),
  ADD KEY `fk_funcionarios_proposta` (`fk_quem_fez`),
  ADD KEY `fk_estatus_proposta` (`fk_estatus`);

--
-- Índices para tabela `tipo_custeio`
--
ALTER TABLE `tipo_custeio`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `associado`
--
ALTER TABLE `associado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cultura`
--
ALTER TABLE `cultura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `custeio`
--
ALTER TABLE `custeio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `investimento`
--
ALTER TABLE `investimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `proposta`
--
ALTER TABLE `proposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_custeio`
--
ALTER TABLE `tipo_custeio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `custeio`
--
ALTER TABLE `custeio`
  ADD CONSTRAINT `fk_tipo_custeio_custeio` FOREIGN KEY (`fk_tipo_custeio`) REFERENCES `tipo_custeio` (`id`);

--
-- Limitadores para a tabela `investimento`
--
ALTER TABLE `investimento`
  ADD CONSTRAINT `fk_funcionarios_investimento` FOREIGN KEY (`fk_quem_autorizou`) REFERENCES `funcionarios` (`id`);

--
-- Limitadores para a tabela `item_custeio`
--
ALTER TABLE `item_custeio`
  ADD CONSTRAINT `fk_custeio_item_custeio` FOREIGN KEY (`fk_custeio`) REFERENCES `custeio` (`id`);

--
-- Limitadores para a tabela `item_investimento`
--
ALTER TABLE `item_investimento`
  ADD CONSTRAINT `fk_invetimento_item_investimento` FOREIGN KEY (`fk_investimento`) REFERENCES `investimento` (`id`);

--
-- Limitadores para a tabela `proposta`
--
ALTER TABLE `proposta`
  ADD CONSTRAINT `fk_associado_proposta` FOREIGN KEY (`fk_associado`) REFERENCES `associado` (`id`),
  ADD CONSTRAINT `fk_cultura_proposta` FOREIGN KEY (`fk_cultura`) REFERENCES `cultura` (`id`),
  ADD CONSTRAINT `fk_custeio_proposto` FOREIGN KEY (`fk_custeio`) REFERENCES `custeio` (`id`),
  ADD CONSTRAINT `fk_estatus_proposta` FOREIGN KEY (`fk_estatus`) REFERENCES `estatus` (`id`),
  ADD CONSTRAINT `fk_funcionarios_proposta` FOREIGN KEY (`fk_quem_fez`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `fk_investimeno_proposta` FOREIGN KEY (`fk_investimento`) REFERENCES `investimento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
