-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Ago-2020 às 22:50
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `devsbookoo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_07_16_155735_create_all_tables', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `postcomments`
--

CREATE TABLE `postcomments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `postcomments`
--

INSERT INTO `postcomments` (`id`, `id_post`, `id_user`, `created_at`, `body`) VALUES
(4, 2, 4, '2020-08-05 11:22:44', 'teste fake'),
(5, 2, 7, '2020-08-05 17:39:13', ' novo comentario'),
(6, 3, 7, '2020-08-05 17:40:57', 'Teste novo'),
(7, 9, 7, '2020-08-05 17:41:18', 'Outro teste'),
(8, 11, 7, '2020-08-05 17:41:25', 'Mais um');

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `type`, `created_at`, `body`) VALUES
(2, 7, 'text', '2020-07-21 15:57:03', 'Testando body...'),
(3, 7, 'text', '2020-07-21 16:14:54', 'Teste novo...'),
(5, 3, 'text', '2020-07-23 16:11:19', 'Teste de postagem...'),
(6, 4, 'text', '2020-07-23 16:12:50', 'Olá, sou a Maria...'),
(7, 5, 'text', '2020-07-23 16:14:35', 'Bom dia, sou o Vicente Leporace...'),
(9, 7, 'text', '2020-07-23 17:43:28', 'Teste com\r\nquebra de linha'),
(11, 7, 'text', '2020-07-28 20:33:14', 'Teste perfil'),
(19, 7, 'text', '2020-08-07 19:00:43', 'Teste'),
(21, 7, 'photo', '2020-08-08 22:20:26', 'fa4c103c78df1f89dcc614c033eb0515.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postslikes`
--

CREATE TABLE `postslikes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `postslikes`
--

INSERT INTO `postslikes` (`id`, `id_post`, `id_user`, `created_at`) VALUES
(22, 3, 5, '2020-08-04 18:59:13'),
(24, 2, 5, '2020-08-04 18:59:15'),
(25, 9, 5, '2020-08-04 18:59:18'),
(26, 11, 5, '2020-08-04 18:59:19'),
(30, 19, 7, '2020-08-07 14:00:48'),
(32, 18, 7, '2020-08-07 14:00:52'),
(33, 17, 7, '2020-08-07 14:00:55'),
(35, 16, 7, '2020-08-07 14:02:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `userrelations`
--

CREATE TABLE `userrelations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `userrelations`
--

INSERT INTO `userrelations` (`id`, `user_from`, `user_to`) VALUES
(20, 4, 5),
(21, 7, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.jpg',
  `cover` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cover.jpg',
  `token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `birthdate`, `city`, `work`, `avatar`, `cover`, `token`) VALUES
(3, 'jose@gmail.com', '$2y$10$JBKM9ur7yl56qDTkkab/yuxKQ/X4.Ft/V8NEt1BBzI2YwDV6QIv26', 'José Maria', '1956-03-30', '', 'Engraxate', 'jose.jpg', 'cover_jose.jpg', '47bea29aa1b7d2caf3f8ddd36f462416'),
(4, 'maria@gmail.com', '$2y$10$XLItUSR2XPCj6FhxT9zXB.Uduje/RxQiZgWSX5BdPd/bw42TlKZIq', 'Maria das Dores', '1945-02-25', '', '', 'maria.png', 'cover_maria.jpg', '72a4e4845b9f1b8bc9f348198268f8ee'),
(5, 'vicente@gmail.com', '$2y$10$AcAulZdnLSN53nX5KTMUhOQAU.xsjC7SSb91UN.m35slrSb56G7rO', 'Vicente Leporace', '1960-11-29', '', '', 'vicente.png', 'cover_vicente.jpg', 'dbb5a39ab88797dd43f3f31f956b4aab'),
(6, 'ademir@gmail.com', '$2y$10$u7.G70MZPTBLF01fJ39Sr.MLrFWVOmVU7tX1lkaoB9s41.cy5OFRi', 'Ademir dos Santos', '1962-06-11', '', '', 'ademir.png', 'cover_ademir.jpg', 'da0c3472a049b64410cb67c10512a697'),
(7, 'wagsilgms@gmail.com', '$2y$10$OtbwcvlbrQIkHjBj4ZBSoeTe4qrUHddI7LdlTU31eqs8J3DESq6Wy', 'Wagner G. Silva', '1963-11-29', 'São Paulo', 'BTF Midia', '5759e34ae6e6036897dc880e58563f7b.jpg', '69dc1dc661bc0221f20450355b4b47b6.jpg', '1bb95afd4cb9c2a994a347c0608d623f');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `postcomments`
--
ALTER TABLE `postcomments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `postslikes`
--
ALTER TABLE `postslikes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `userrelations`
--
ALTER TABLE `userrelations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `postcomments`
--
ALTER TABLE `postcomments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `postslikes`
--
ALTER TABLE `postslikes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `userrelations`
--
ALTER TABLE `userrelations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
