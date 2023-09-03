-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/09/2023 às 23:13
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rpgfinder`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accessory`
--

CREATE TABLE `accessory` (
  `acessory_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `accessory`
--

INSERT INTO `accessory` (`acessory_id`, `name`, `type`, `power`) VALUES
(1, 'Ring of Strength', 'Gold', 10),
(2, 'Amulet of Wisdom', 'Crystal', 12),
(3, 'Cloak of Invisibility', 'Silk', 15),
(4, 'Bracelet of Defense', 'Silver', 8),
(5, 'Elixir of Healing', 'Glass', 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `alliance`
--

CREATE TABLE `alliance` (
  `id_aliance` int(1) NOT NULL,
  `aliance_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alliance`
--

INSERT INTO `alliance` (`id_aliance`, `aliance_name`) VALUES
(1, 'Lion'),
(2, 'Crow');

-- --------------------------------------------------------

--
-- Estrutura para tabela `boots`
--

CREATE TABLE `boots` (
  `boots_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_material` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `boots`
--

INSERT INTO `boots` (`boots_id`, `name`, `type_material`, `power`) VALUES
(1, 'Iron Boots', 'Iron', 15),
(2, 'Steel Boots', 'Steel', 20),
(3, 'Leather Boots', 'Leather', 10),
(4, 'Gold Boots', 'Gold', 12),
(5, 'Diamond Boots', 'Diamond', 25),
(6, 'Chainmail Boots', 'Chainmail', 18),
(7, 'Bronze Boots', 'Bronze', 17),
(8, 'Silver Boots', 'Silver', 22),
(9, 'Wooden Shoes', 'Wood', 8),
(10, 'Platinum Boots', 'Platinum', 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `chest`
--

CREATE TABLE `chest` (
  `chest_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_material` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chest`
--

INSERT INTO `chest` (`chest_id`, `name`, `type_material`, `power`) VALUES
(1, 'Iron Chestplate', 'Iron', 35),
(2, 'Steel Breastplate', 'Steel', 40),
(3, 'Leather Tunic', 'Leather', 20),
(4, 'Gold Armor', 'Gold', 25),
(5, 'Diamond Chestplate', 'Diamond', 45),
(6, 'Chainmail Vest', 'Chainmail', 30),
(7, 'Bronze Cuirass', 'Bronze', 38),
(8, 'Silver Breastplate', 'Silver', 42),
(9, 'Wooden Armor', 'Wood', 15),
(10, 'Platinum Chestplate', 'Platinum', 50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `class`
--

CREATE TABLE `class` (
  `id_class` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `class`
--

INSERT INTO `class` (`id_class`, `name`) VALUES
(1, 'warrior'),
(2, 'mage'),
(3, 'assassin'),
(4, 'suport');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `combined_items`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `combined_items` (
`item_type` varchar(16)
,`item_id` int(11)
,`name` varchar(255)
,`type_material` varchar(50)
,`power` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `content`
--

CREATE TABLE `content` (
  `id_content` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `content`
--

INSERT INTO `content` (`id_content`, `description`) VALUES
(1, 'PvP'),
(2, 'Farm'),
(3, 'Dungeons'),
(4, 'Raid');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipment`
--

CREATE TABLE `equipment` (
  `id_equipment` int(11) NOT NULL,
  `char_id` int(11) NOT NULL,
  `helmet_id` int(11) DEFAULT NULL,
  `chest_id` int(11) DEFAULT NULL,
  `leggings_id` int(11) DEFAULT NULL,
  `boots_id` int(11) DEFAULT NULL,
  `weapon_id` int(11) DEFAULT NULL,
  `secweapon_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `equipment`
--

INSERT INTO `equipment` (`id_equipment`, `char_id`, `helmet_id`, `chest_id`, `leggings_id`, `boots_id`, `weapon_id`, `secweapon_id`, `accessory_id`) VALUES
(1, 1, 2, 2, 2, 2, 2, 1, 1),
(2, 2, 5, 5, 5, 5, 8, 4, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `gameserver`
--

CREATE TABLE `gameserver` (
  `id_server` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `coutry` varchar(50) DEFAULT NULL,
  `capacity` int(100) DEFAULT NULL,
  `ip_server` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gameserver`
--

INSERT INTO `gameserver` (`id_server`, `name`, `coutry`, `capacity`, `ip_server`) VALUES
(1, 'Desert Eagle', 'Canada', 200, '10.255.410.36'),
(2, 'City Lost', 'Europe', 800, '210.255.196.24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `helmet`
--

CREATE TABLE `helmet` (
  `helmet_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_material` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `helmet`
--

INSERT INTO `helmet` (`helmet_id`, `name`, `type_material`, `power`) VALUES
(1, 'Iron Helmet', 'Iron', 20),
(2, 'Steel Helmet', 'Steel', 25),
(3, 'Leather Cap', 'Leather', 10),
(4, 'Gold Crown', 'Gold', 15),
(5, 'Diamond Helmet', 'Diamond', 30),
(6, 'Chainmail Coif', 'Chainmail', 18),
(7, 'Bronze Helm', 'Bronze', 22),
(8, 'Silver Helm', 'Silver', 28),
(9, 'Wooden Helm', 'Wood', 8),
(10, 'Platinum Helmet', 'Platinum', 35);

-- --------------------------------------------------------

--
-- Estrutura para tabela `leggings`
--

CREATE TABLE `leggings` (
  `leggings_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_material` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `leggings`
--

INSERT INTO `leggings` (`leggings_id`, `name`, `type_material`, `power`) VALUES
(1, 'Iron Leggings', 'Iron', 25),
(2, 'Steel Legguards', 'Steel', 30),
(3, 'Leather Pants', 'Leather', 15),
(4, 'Gold Greaves', 'Gold', 20),
(5, 'Diamond Leggings', 'Diamond', 35),
(6, 'Chainmail Leggings', 'Chainmail', 22),
(7, 'Bronze Legplates', 'Bronze', 28),
(8, 'Silver Legguards', 'Silver', 32),
(9, 'Wooden Pants', 'Wood', 12),
(10, 'Platinum Leggings', 'Platinum', 40);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nickname_history`
--

CREATE TABLE `nickname_history` (
  `user_id` int(11) NOT NULL,
  `old_nickname` varchar(25) DEFAULT NULL,
  `new_nickname` varchar(25) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `nickname_history`
--

INSERT INTO `nickname_history` (`user_id`, `old_nickname`, `new_nickname`, `timestamp`) VALUES
(2, 'MariaaA', 'Black', '2023-09-03 15:24:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sec_weapon`
--

CREATE TABLE `sec_weapon` (
  `secweapon_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_material` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sec_weapon`
--

INSERT INTO `sec_weapon` (`secweapon_id`, `name`, `type_material`, `power`) VALUES
(1, 'Steel Shield', 'Steel', 20),
(2, 'Fireball Tome', 'Parchment', 15),
(3, 'Bronze Dagger', 'Bronze', 18),
(4, 'Ice Ward Amulet', 'Crystal', 25),
(5, 'Poison Dart Blowgun', 'Wood', 22);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`user_id`, `login`, `email`, `country`, `description`) VALUES
(1, 'joao_pvp', 'joao@example.com', 'Brasil', 'PvP Player'),
(2, 'maria_farmer', 'maria@example.com', 'Portugal', 'Farmer Player'),
(3, 'carlos_pvp', 'carlos@example.com', 'Espanha', 'PvP Player'),
(4, 'ana_generico', 'ana@example.com', 'México', 'Player'),
(5, 'lucas_pvp', 'lucas@example.com', 'Argentina', 'PvP Player'),
(20, 'gabrielmatador', 'gabriel@terra.com.br', 'brazil', 'pvp player'),
(30, 'luquinhas123', 'lucas.senai@fiergs.com.br', 'argentina', 'player casual'),
(40, 'cafeina kill', 'thomas@gmail.com.br', 'italia', 'pro player');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `usersummary`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `usersummary` (
`user_id` int(11)
,`login` varchar(25)
,`email` varchar(25)
,`country` varchar(50)
,`player_type` varchar(13)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users_characters`
--

CREATE TABLE `users_characters` (
  `char_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nickname` varchar(25) NOT NULL,
  `char_level` int(2) NOT NULL,
  `id_server` int(10) NOT NULL,
  `aliance_id` int(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id_equipment` int(11) DEFAULT NULL,
  `id_content` int(11) DEFAULT NULL,
  `id_class` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users_characters`
--

INSERT INTO `users_characters` (`char_id`, `user_id`, `nickname`, `char_level`, `id_server`, `aliance_id`, `description`, `id_equipment`, `id_content`, `id_class`) VALUES
(1, 30, 'Docelun', 15, 2, 1, 'Foco em pvp', 1, 1, 1),
(2, 2, 'Black', 20, 1, 2, 'farmer player', 2, 2, 4),
(3, 1, 'Joaozin', 15, 1, 2, 'Pvp', NULL, 1, 3);

--
-- Acionadores `users_characters`
--
DELIMITER $$
CREATE TRIGGER `updateNickname` BEFORE UPDATE ON `users_characters` FOR EACH ROW BEGIN
  IF NEW.nickname <> OLD.nickname THEN
    INSERT INTO nickname_history (user_id, old_nickname, new_nickname)
    VALUES (OLD.user_id, OLD.nickname, NEW.nickname);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `weapon`
--

CREATE TABLE `weapon` (
  `weapon_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_material` varchar(50) DEFAULT NULL,
  `power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `weapon`
--

INSERT INTO `weapon` (`weapon_id`, `name`, `type_material`, `power`) VALUES
(1, 'Iron Sword', 'Iron', 40),
(2, 'Steel Axe', 'Steel', 45),
(3, 'Wooden Staff', 'Wood', 30),
(4, 'Gold Dagger', 'Gold', 35),
(5, 'Diamond Bow', 'Diamond', 50),
(6, 'Silver Spear', 'Silver', 48),
(7, 'Bronze Mace', 'Bronze', 42),
(8, 'Crystal Wand', 'Crystal', 55),
(9, 'Obsidian Blade', 'Obsidian', 60),
(10, 'Platinum Hammer', 'Platinum', 65);

-- --------------------------------------------------------

--
-- Estrutura para view `combined_items`
--
DROP TABLE IF EXISTS `combined_items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `combined_items`  AS SELECT 'Helmet' AS `item_type`, `helmet`.`helmet_id` AS `item_id`, `helmet`.`name` AS `name`, `helmet`.`type_material` AS `type_material`, `helmet`.`power` AS `power` FROM `helmet`union all select 'Chestplate' AS `item_type`,`chest`.`chest_id` AS `item_id`,`chest`.`name` AS `name`,`chest`.`type_material` AS `type_material`,`chest`.`power` AS `power` from `chest` union all select 'Leggings' AS `item_type`,`leggings`.`leggings_id` AS `item_id`,`leggings`.`name` AS `name`,`leggings`.`type_material` AS `type_material`,`leggings`.`power` AS `power` from `leggings` union all select 'Boots' AS `item_type`,`boots`.`boots_id` AS `item_id`,`boots`.`name` AS `name`,`boots`.`type_material` AS `type_material`,`boots`.`power` AS `power` from `boots` union all select 'Weapon' AS `item_type`,`weapon`.`weapon_id` AS `item_id`,`weapon`.`name` AS `name`,`weapon`.`type_material` AS `type_material`,`weapon`.`power` AS `power` from `weapon` union all select 'Secondary Weapon' AS `item_type`,`sec_weapon`.`secweapon_id` AS `item_id`,`sec_weapon`.`name` AS `name`,`sec_weapon`.`type_material` AS `type_material`,`sec_weapon`.`power` AS `power` from `sec_weapon` union all select 'Accessory' AS `item_type`,`accessory`.`acessory_id` AS `item_id`,`accessory`.`name` AS `name`,`accessory`.`type` AS `type`,`accessory`.`power` AS `power` from `accessory`  ;

-- --------------------------------------------------------

--
-- Estrutura para view `usersummary`
--
DROP TABLE IF EXISTS `usersummary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersummary`  AS SELECT `users`.`user_id` AS `user_id`, `users`.`login` AS `login`, `users`.`email` AS `email`, `users`.`country` AS `country`, CASE WHEN `users`.`description` like '%PvP%' THEN 'PvP Player' ELSE 'Casual Player' END AS `player_type` FROM `users` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `accessory`
--
ALTER TABLE `accessory`
  ADD PRIMARY KEY (`acessory_id`);

--
-- Índices de tabela `alliance`
--
ALTER TABLE `alliance`
  ADD PRIMARY KEY (`id_aliance`);

--
-- Índices de tabela `boots`
--
ALTER TABLE `boots`
  ADD PRIMARY KEY (`boots_id`);

--
-- Índices de tabela `chest`
--
ALTER TABLE `chest`
  ADD PRIMARY KEY (`chest_id`);

--
-- Índices de tabela `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`);

--
-- Índices de tabela `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id_content`);

--
-- Índices de tabela `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id_equipment`),
  ADD KEY `fk_helmet_equipament` (`helmet_id`),
  ADD KEY `fk_cheast_equipament` (`chest_id`),
  ADD KEY `fk_weapom_equipament` (`weapon_id`),
  ADD KEY `fk_secweapom_equipament` (`secweapon_id`),
  ADD KEY `fk_accessory_equipament` (`accessory_id`),
  ADD KEY `fk_leggings_equipament` (`leggings_id`),
  ADD KEY `fk_boots_equipament` (`boots_id`),
  ADD KEY `fk_userscharacters_equipment` (`char_id`);

--
-- Índices de tabela `gameserver`
--
ALTER TABLE `gameserver`
  ADD PRIMARY KEY (`id_server`);

--
-- Índices de tabela `helmet`
--
ALTER TABLE `helmet`
  ADD PRIMARY KEY (`helmet_id`);

--
-- Índices de tabela `leggings`
--
ALTER TABLE `leggings`
  ADD PRIMARY KEY (`leggings_id`);

--
-- Índices de tabela `nickname_history`
--
ALTER TABLE `nickname_history`
  ADD KEY `fk_nicknameH_user` (`user_id`);

--
-- Índices de tabela `sec_weapon`
--
ALTER TABLE `sec_weapon`
  ADD PRIMARY KEY (`secweapon_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Índices de tabela `users_characters`
--
ALTER TABLE `users_characters`
  ADD PRIMARY KEY (`char_id`),
  ADD KEY `fk_equptment_userCharacters` (`id_equipment`),
  ADD KEY `fk_content_userCharacters` (`id_content`),
  ADD KEY `fk_user_userCharacters` (`user_id`),
  ADD KEY `fk_aliance_userCharacters` (`aliance_id`),
  ADD KEY `fk_GameServer_userCharacters` (`id_server`),
  ADD KEY `fk_class_usersCharacters` (`id_class`);

--
-- Índices de tabela `weapon`
--
ALTER TABLE `weapon`
  ADD PRIMARY KEY (`weapon_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alliance`
--
ALTER TABLE `alliance`
  MODIFY `id_aliance` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `users_characters`
--
ALTER TABLE `users_characters`
  MODIFY `char_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`chest_id`) REFERENCES `chest` (`chest_id`),
  ADD CONSTRAINT `equipment_ibfk_3` FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`weapon_id`),
  ADD CONSTRAINT `equipment_ibfk_4` FOREIGN KEY (`secweapon_id`) REFERENCES `sec_weapon` (`secweapon_id`),
  ADD CONSTRAINT `fk_accessory_equipament` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`acessory_id`),
  ADD CONSTRAINT `fk_boots_equipament` FOREIGN KEY (`boots_id`) REFERENCES `boots` (`boots_id`),
  ADD CONSTRAINT `fk_helmet_equipament` FOREIGN KEY (`helmet_id`) REFERENCES `helmet` (`helmet_id`),
  ADD CONSTRAINT `fk_leggings_equipament` FOREIGN KEY (`leggings_id`) REFERENCES `leggings` (`leggings_id`),
  ADD CONSTRAINT `fk_userscharacters_equipment` FOREIGN KEY (`char_id`) REFERENCES `users_characters` (`char_id`);

--
-- Restrições para tabelas `nickname_history`
--
ALTER TABLE `nickname_history`
  ADD CONSTRAINT `fk_nicknameH_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Restrições para tabelas `users_characters`
--
ALTER TABLE `users_characters`
  ADD CONSTRAINT `fk_GameServer_userCharacters` FOREIGN KEY (`id_server`) REFERENCES `gameserver` (`id_server`),
  ADD CONSTRAINT `fk_aliance_userCharacters` FOREIGN KEY (`aliance_id`) REFERENCES `alliance` (`id_aliance`),
  ADD CONSTRAINT `fk_class_usersCharacters` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`),
  ADD CONSTRAINT `fk_content_userCharacters` FOREIGN KEY (`id_content`) REFERENCES `content` (`id_content`),
  ADD CONSTRAINT `fk_user_userCharacters` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `users_characters_ibfk_1` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
