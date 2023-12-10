-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 02:19 PM
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
-- Database: `events`
--
CREATE DATABASE IF NOT EXISTS `events` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `events`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231208174549', '2023-12-08 18:46:12', 42),
('DoctrineMigrations\\Version20231208174800', '2023-12-08 18:48:08', 29),
('DoctrineMigrations\\Version20231208175353', '2023-12-08 18:54:03', 109);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_time` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `fk_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date_time`, `description`, `image`, `capacity`, `email`, `phone_number`, `address`, `url`, `fk_type_id`) VALUES
(9, 'Charity Gala', '2024-03-19', 'Fundraising gala for a local charity organization', 'gala-dinner-3884732-640-6574cb18693a4.jpg', 100, 'nfo@charitygala.com', '+12345678900', '987 Charity Avenue, County', 'http://www.charitygala.com', 9),
(10, 'Tech Conference', '2023-12-26', 'Conference focusing on emerging technologies and innovations', 'robot-2301646-640-6574cbdc05017.jpg', 250, 'nfo@techconf.com', '+98455661123', '456 Tech Avenue, Town', 'http://www.techconf.com', 11),
(11, 'Crime and punishment', '2024-04-27', '\"Crime and Punishment\" follows Raskolnikov\'s moral turmoil after committing murder, grappling with guilt and redemption in Dostoevsky\'s psychological exploration of crime\'s consequences.', 'movie-theater-4609877-640-6574ccad7b2c4.jpg', 150, 'moderntheater@mail.com', '+9998711091', 'Modern Theather', 'moderntheater.com', 2),
(12, 'Music Fest', '2024-06-16', 'Annual music festival showcasing various artists', 'concert-2527495-640-6574cd15a4e46.jpg', 500, 'info@musicfest.com', '+888776655110', '123 Music Street, City', 'http://www.musicfest.com', 1),
(13, 'Food Festival', '2024-04-07', 'Celebrating diverse cultures with food', 'market-3466906-640-6574cdbe6956d.jpg', 800, 'info@foodfest.com', '+999888666661', '321 Food Lane, District', 'http://www.foodfest.com', 5),
(14, 'Art Exhibition', '2024-03-06', 'Showcasing contemporary art installations', 'hands-1846428-640-6574ce52098ab.jpg', 1000, 'info@artexhibit.com', '+7777666661', '789 Art Boulevard, Village', 'http://www.artexhibit.com', 2),
(15, 'Liverpool vs Manchester United', '2024-03-28', 'Final match for the cup', 'soccer-488700-640-6574cedac0faf.jpg', 30000, 'match@match.com', '+665511222098', '1235 Stadium, Town', 'match.com', 6);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Music event'),
(2, 'Theater and performing arts'),
(3, 'Film and cinema'),
(4, 'Literature and writing'),
(5, 'Culinary events'),
(6, 'Sports events'),
(7, 'Educational and workshops'),
(8, 'Fashion events'),
(9, 'Charity and fundraising'),
(10, 'Business and networking'),
(11, 'Technology and innovation');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5387574A3563B1BF` (`fk_type_id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `FK_5387574A3563B1BF` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
