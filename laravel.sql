-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 05, 2023 at 02:47 PM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_03_080851_create_otps_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validity` int NOT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `no_times_generated` int NOT NULL DEFAULT '0',
  `no_times_attempted` int NOT NULL DEFAULT '0',
  `generated_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `identifier`, `token`, `validity`, `expired`, `no_times_generated`, `no_times_attempted`, `generated_at`, `created_at`, `updated_at`) VALUES
(1, '12345', '2857', 30, 0, 7, 2, '2023-10-04 09:09:38', '2023-10-04 09:05:02', '2023-10-04 09:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sc_services`
--

CREATE TABLE `sc_services` (
  `serviceId` bigint NOT NULL DEFAULT '0',
  `serviceEnName` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `serviceArDesc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `serviceEnDesc` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `serviceArName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `piclocation` varchar(255) DEFAULT '',
  `wapHeader` varchar(255) DEFAULT NULL,
  `servicelang` int NOT NULL DEFAULT '0',
  `series` int NOT NULL,
  `first_content` date DEFAULT NULL,
  `free_period` int NOT NULL,
  `serviceType` varchar(255) NOT NULL,
  `inactive` int DEFAULT '0',
  `you_sid` varchar(255) DEFAULT NULL,
  `you_prodID` varchar(255) DEFAULT NULL,
  `portalID` bigint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sc_services`
--

INSERT INTO `sc_services` (`serviceId`, `serviceEnName`, `serviceArDesc`, `serviceEnDesc`, `serviceArName`, `piclocation`, `wapHeader`, `servicelang`, `series`, `first_content`, `free_period`, `serviceType`, `inactive`, `you_sid`, `you_prodID`, `portalID`) VALUES
(20, 'spain legue', 'الدوري الاسباني', 'spain league', 'الدوري الاسباني', 'images/homepage/es.webp', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(21, 'english legue', 'الدوري الانجليزي', 'english league', 'الدوري الانجليزي', 'images/homepage/eng1.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(22, 'italy legue', 'الدوري الايطالي', 'italy league', 'الدوري الايطالي', 'images/homepage/ita1.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(23, 'sudai legue', 'الدوري السعودي', 'sudai league', 'الدوري السعودي', 'images/homepage/k1.2.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(24, 'egyption legue ', 'الدوري المصري ', 'egyption league ', 'الدوري المصري ', 'images/homepage/eg1.1.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(25, 'Champions League', 'دوري ابطال اوربا', 'Champions League', 'دوري ابطال اوربا', 'images/homepage/uf1.2.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(26, 'germany league', 'الدوري الالماني', 'germany league', 'الدوري الالماني', 'images/homepage/ger1.1.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(27, 'sport news', 'اخبار الرياضة', 'sport news', 'اخبار الرياضة', 'images/homepage/s1.webp', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(28, 'Historical goals', 'اهداف تاريخية', 'Historical goals', 'اهداف تاريخية', 'images/homepage/go1.webp', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(29, 'Caricature', 'كاركتير الرياضة', 'Caricature', 'كاركتير الرياضة', 'images/homepage/kar.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(30, 'sport stories', 'قصص كروية', 'sport stories', 'قصص كروية', 'images/homepage/fst.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(31, 'story everyweek', 'قصة كل اسبوع', 'story everyweek', 'قصة كل اسبوع', 'images/homepage/everyweek.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(32, 'football audience', 'جماهير كأس العالم', 'football audience', 'جماهير كأس العالم', 'images/homepage/fanclup.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(33, 'stad', 'ملاعب كأس العالم', 'stad', 'ملاعب كأس العالم', 'images/homepage/stad.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(34, 'mr kora', 'مستر كروي', 'mr kora', 'مستر كروي', 'images/homepage/mr.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(35, 'World Cup goals', 'اهداف كأس العالم', 'World Cup goals', 'اهداف كأس العالم', 'images/homepage/goal1.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(36, 'live', 'لايفات كاس العالم', 'live', 'لايفات كاس العالم', 'images/homepage/Live1.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(37, 'Match results', 'نتائج المباريات', 'Match results', 'نتائج المباريات', 'images/homepage/live.jpg', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1),
(38, 'usa legue', 'Ø§Ù„Ø¯ÙˆØ±ÙŠ Ø§Ù„Ù‡ÙˆÙ„Ù†Ø¯ÙŠ', 'usa legue', 'الدوري الهولندي', 'http://www.git-jo.net/git/worldcup/ca51.png', NULL, 0, 0, '0000-00-00', 0, 'SMS', 0, '0', '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sc_services_content_history`
--

CREATE TABLE `sc_services_content_history` (
  `cntnt_id` bigint NOT NULL,
  `service_Id` bigint NOT NULL,
  `lang` int NOT NULL,
  `en_cntnt` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ar_cntnt` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `publish_date` date NOT NULL,
  `publish_time` time NOT NULL,
  `creation_date` date NOT NULL,
  `creation_time` time NOT NULL,
  `user_id` int NOT NULL,
  `cntnt_type` int NOT NULL,
  `cntnt_state` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sc_services_content_history`
--

INSERT INTO `sc_services_content_history` (`cntnt_id`, `service_Id`, `lang`, `en_cntnt`, `ar_cntnt`, `publish_date`, `publish_time`, `creation_date`, `creation_time`, `user_id`, `cntnt_type`, `cntnt_state`) VALUES
(19, 20, 8, NULL, 'images/spain/e4.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(20, 20, 8, NULL, 'images/spain/e1.jpg', '2023-08-20', '12:00:00', '2023-08-20', '12:00:00', 1, 1, 2),
(21, 20, 8, NULL, 'images/spain/e3.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(22, 20, 8, NULL, 'images/spain/e2.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(23, 21, 8, NULL, 'images/english/en1.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(24, 21, 8, NULL, 'images/english/en2.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(25, 21, 8, NULL, 'images/english/en3.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(26, 21, 8, NULL, 'images/english/en4.jpg', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(27, 21, 8, NULL, 'images/english/en16.png', '2023-08-21', '12:00:00', '2023-08-21', '12:00:00', 1, 1, 2),
(28, 22, 8, NULL, 'images/italy/it1.jpg', '2023-08-21', '12:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(29, 22, 8, NULL, 'images/italy/it2.jpg', '2023-08-21', '12:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(30, 22, 8, NULL, 'images/italy/it3.jpg', '2023-08-21', '12:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(31, 22, 8, NULL, 'images/italy/it4.jpg', '2023-08-21', '12:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(32, 23, 8, NULL, 'images/ksa/k1.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(33, 23, 8, NULL, 'images/ksa/k2.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(34, 23, 8, NULL, 'images/ksa/k3.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(35, 23, 8, NULL, 'images/ksa/k4.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(36, 23, 8, NULL, 'images/ksa/k5.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(37, 24, 8, NULL, 'images/egypt/EG1.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(38, 24, 8, NULL, 'images/egypt/EG2.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(39, 25, 8, NULL, 'images/ufa/uf1.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(40, 25, 8, NULL, 'images/ufa/uf2.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(41, 25, 8, NULL, 'images/ufa/uf3.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(42, 25, 8, NULL, 'images/ufa/uf4.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(43, 26, 8, NULL, 'images/germany/ger4.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(44, 26, 8, NULL, 'images/germany/ger3.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(45, 26, 8, NULL, 'images/germany/ger2.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(46, 26, 8, NULL, 'images/germany/ger1.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(47, 27, 8, NULL, 'images/news/n4.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(48, 27, 8, NULL, 'images/news/n3.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(49, 27, 8, NULL, 'images/news/n2.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(50, 27, 8, NULL, 'images/news/n1.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(51, 27, 8, NULL, 'images/news/n5.jpg', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(52, 28, 8, NULL, 'http://git-jo.net/git/sport/goals3.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(53, 29, 8, NULL, 'images/kar/ka12.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(54, 29, 8, NULL, 'images/kar/ka11.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(55, 29, 8, NULL, 'images/kar/ka10.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(56, 29, 8, NULL, 'images/kar/ka9.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(57, 29, 8, NULL, 'images/kar/ka8.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(58, 29, 8, NULL, 'images/kar/ka7.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(59, 29, 8, NULL, 'images/kar/ka6.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(60, 29, 8, NULL, 'images/kar/ka5.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(61, 29, 8, NULL, 'images/kar/ka4.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(62, 29, 8, NULL, 'images/kar/ka3.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(63, 29, 8, NULL, 'images/kar/ka2.png', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(64, 28, 8, NULL, 'http://git-jo.net/git/sport/goals2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(65, 28, 8, NULL, 'http://git-jo.net/git/sport/goals1.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(66, 31, 8, NULL, 'http://git-jo.net/git/sport/First-Story.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(67, 31, 8, NULL, 'http://git-jo.net/git/sport/Second-Story.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(68, 31, 8, NULL, 'http://git-jo.net/git/sport/Third-Story.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(69, 30, 8, NULL, 'http://git-jo.net/git/sport/1.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(70, 30, 8, NULL, 'http://git-jo.net/git/sport/2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(71, 30, 8, NULL, 'http://git-jo.net/git/sport/3.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(72, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/ca58.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(73, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/ca57.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(74, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/ca56.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(75, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/ca55.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(76, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/cari48.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(77, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/cari47.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(78, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/cari46.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(79, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/cari45.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(80, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/cari44.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(81, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/cari43.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(82, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/ca32.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(83, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima5-2023/ca31.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(84, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima4-2023/ca19.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(85, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima4-2023/ca20.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(86, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima4-2023/ca21.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(87, 29, 8, NULL, 'http://git-jo.net/git/sport/Rima4-2023/ca22.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(88, 34, 8, NULL, 'http://git-jo.net/git/sport/karawi.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(89, 33, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_1.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(90, 33, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(91, 33, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(92, 32, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(93, 32, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(94, 32, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_1.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(95, 37, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_1.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(96, 37, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(97, 37, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(98, 35, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(99, 35, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(100, 35, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_1.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(101, 36, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '2023-08-21', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(102, 36, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_1.mp4', '0000-00-00', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(103, 36, 8, NULL, 'http://git-jo.net/git/sport/ComingSoon_2.mp4', '0000-00-00', '00:00:00', '2023-08-21', '00:00:00', 1, 1, 2),
(104, 38, 8, NULL, 'http://www.git-jo.net/git/worldcup/ca51.png', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 1, 1, 2),
(105, 38, 8, NULL, 'http://www.git-jo.net/git/worldcup/ca51.png', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sc_subscribers_73`
--

CREATE TABLE `sc_subscribers_73` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `serviceId` bigint NOT NULL DEFAULT '0',
  `msisdn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `subCommand` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lang` int NOT NULL DEFAULT '0',
  `sub_type` varchar(11) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `subDate` date NOT NULL DEFAULT '2000-02-02',
  `subTime` time NOT NULL DEFAULT '02:02:02',
  `opCode` int NOT NULL DEFAULT '0',
  `countryCode` int NOT NULL DEFAULT '0',
  `subWay` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'SMS',
  `serid_you` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `productid_you` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `chargingDate` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ischarged` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_valid_till` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `sub_type`, `sub_valid_till`, `phone_number`, `remember_token`, `created_at`, `updated_at`) VALUES
(14, 'test', '1', '2023-10-07 10:24:21', '967734111369', NULL, '2023-10-05 07:24:12', '2023-10-05 07:24:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sc_services`
--
ALTER TABLE `sc_services`
  ADD PRIMARY KEY (`serviceId`),
  ADD KEY `serviceId` (`serviceId`);

--
-- Indexes for table `sc_services_content_history`
--
ALTER TABLE `sc_services_content_history`
  ADD PRIMARY KEY (`cntnt_id`),
  ADD KEY `FK_Service_ID` (`service_Id`),
  ADD KEY `PK` (`cntnt_id`);

--
-- Indexes for table `sc_subscribers_73`
--
ALTER TABLE `sc_subscribers_73`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq` (`serviceId`,`msisdn`,`lang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sc_subscribers_73`
--
ALTER TABLE `sc_subscribers_73`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320647;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
