-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2022 at 03:53 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_14_163446_create_products_table', 1);

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'dina@gmail.com_Token', '8bf7781e9d948001366b3fdfca2a0d3560702fe1f10a6c0cd640ed9c9e31691a', '[\"*\"]', NULL, '2022-02-18 19:42:29', '2022-02-18 19:42:29'),
(2, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'a901f68129a3dfbf2c8c029dca354f09eef68421ed726e68d91406f8c7cedaa4', '[\"*\"]', NULL, '2022-02-18 21:16:42', '2022-02-18 21:16:42'),
(3, 'App\\Models\\User', 3, 'dinaskar.arj@gmail.com_Token', 'f4d5f0f772694967898b353bd79cb0672c45a23f75ffc60eb84f6f8ad54b88b8', '[\"*\"]', NULL, '2022-02-18 21:48:49', '2022-02-18 21:48:49'),
(4, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'fdbae2d9daf4b812e22a0942271a3f500198889314b2b9e2a18a1106d3a37a95', '[\"*\"]', NULL, '2022-02-19 01:58:32', '2022-02-19 01:58:32'),
(5, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '2c9d820df65a11a43b4702e38a09b1c87cf8a41f305a84a11868cca6e1395ede', '[\"*\"]', NULL, '2022-02-19 02:10:03', '2022-02-19 02:10:03'),
(6, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '9bca795cc99ce5d7c3d07a0169807356c66e3d89dc40389e0369d1367a6cfad8', '[\"*\"]', NULL, '2022-02-19 02:10:29', '2022-02-19 02:10:29'),
(7, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '5332e54562d9364759d7fcd69f1afb13ccce711e2420cda598e90ff9996983f1', '[\"*\"]', NULL, '2022-02-19 02:10:34', '2022-02-19 02:10:34'),
(8, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '3d44988be36b015a796f41dea82614050930c716fbf86d0ad5769e9281ad4b4a', '[\"*\"]', NULL, '2022-02-19 02:10:36', '2022-02-19 02:10:36'),
(9, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'ace42fbb4b8d393e9c966631c4656cc7c2e4aad11b5f35d0672141230420837e', '[\"*\"]', NULL, '2022-02-19 02:12:09', '2022-02-19 02:12:09'),
(10, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '192101e5d2511da292b3b3c61eb78d4c86db87382b0a07d3abe6ca41e3df9989', '[\"*\"]', NULL, '2022-02-19 03:43:00', '2022-02-19 03:43:00'),
(11, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '85ead319ec20f5e1c60c64864d759b70f28e1081bf866653572c0d883ddf1372', '[\"*\"]', NULL, '2022-02-19 03:44:32', '2022-02-19 03:44:32'),
(12, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '4f1471af8bbb93f16a48a92a9a1e404c5cf3873dbe9ac942b3d5d46fe7bc5aaa', '[\"*\"]', NULL, '2022-02-19 03:47:13', '2022-02-19 03:47:13'),
(13, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'aedf055d1cf3c2f66ab62f9c6a01f03b4a0cd767bb4460deb0d8a26071179a7e', '[\"*\"]', NULL, '2022-02-19 03:48:39', '2022-02-19 03:48:39'),
(14, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '2be93472269e51c06745518f04ebb5bd96ecd0c1134e1f8780bcacc8d2b4613c', '[\"*\"]', NULL, '2022-02-19 03:53:33', '2022-02-19 03:53:33'),
(15, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'bbc12b3ef9e0d14c63f3d6dffd13617932db71344c0f155b3919a9afec23a216', '[\"*\"]', NULL, '2022-02-19 03:55:12', '2022-02-19 03:55:12'),
(16, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '761c9a6e46350a448bbf911f1690045fd5af9d4e6256c9fb5bce2070f89b3dc1', '[\"*\"]', NULL, '2022-02-19 03:55:16', '2022-02-19 03:55:16'),
(17, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'a38d7448021d4b86ebad911eaedcb4694002eecf0adcd488daf6b4abe3702946', '[\"*\"]', NULL, '2022-02-19 03:59:00', '2022-02-19 03:59:00'),
(18, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'dcc397e378d654150ffb7916c73b3accc571ae41484cccae49f5f1942ed23c63', '[\"*\"]', NULL, '2022-02-19 04:16:11', '2022-02-19 04:16:11'),
(19, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '82b5c1caab2f76516d2fe7f6c3eb29551cb1b8bebbae8f25be0730515415cd39', '[\"*\"]', NULL, '2022-02-19 04:17:47', '2022-02-19 04:17:47'),
(20, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '9ff24f6772056a024fd7d6bb300b73814d6cec1618c39b54a558351120750b15', '[\"*\"]', NULL, '2022-02-19 04:22:45', '2022-02-19 04:22:45'),
(21, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', 'f8e7a7a0fc75e8a8f94ce1443dfb9576565206c4c89845f0094f4f259efce0a1', '[\"*\"]', NULL, '2022-02-19 04:22:59', '2022-02-19 04:22:59'),
(22, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '39cc510e0439edd7d6767a647f63d90be37304a0cd54336baa4ed4e13d84b8b5', '[\"*\"]', NULL, '2022-02-19 05:16:04', '2022-02-19 05:16:04'),
(23, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '80412ad777619b951650a14235647680a85361b4c5fe7b567111fbfd4c8323e9', '[\"*\"]', NULL, '2022-02-19 05:16:09', '2022-02-19 05:16:09'),
(24, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '614116cf7a0cf5cbee6f1b72dc6810d4bd9291204924b8e910c9dd7400af8d42', '[\"*\"]', NULL, '2022-02-19 05:16:37', '2022-02-19 05:16:37'),
(25, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '955f2f0d78951a15061bb818f7d3f9a1e0e574080a24d7d276a459cd6dd95417', '[\"*\"]', NULL, '2022-02-19 05:17:09', '2022-02-19 05:17:09'),
(26, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '9f05ab3c6b7fceeae8f2bab0bc996a3e53605b1878fd00f8985237bdcfe0c60a', '[\"*\"]', NULL, '2022-02-19 06:02:42', '2022-02-19 06:02:42'),
(27, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '6577a57959dd6a71304994b9f60af772ed7c53e89da9a4c8684777b43bba11b6', '[\"*\"]', NULL, '2022-02-19 06:08:00', '2022-02-19 06:08:00'),
(28, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '0733856683e51b161a0fae3637438d1ccc6457868c4e7506f3be1f88c1acbb99', '[\"*\"]', NULL, '2022-02-19 07:24:08', '2022-02-19 07:24:08'),
(29, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '67fdf4f0e2924ccaeda3ee51623171a1de4b6091f0efa1c1e4e2a9c4f4247c70', '[\"*\"]', NULL, '2022-02-19 07:30:56', '2022-02-19 07:30:56'),
(30, 'App\\Models\\User', 2, 'dddd@gmail.com_Token', '5f0a093d7afb4b8739255dc06454150aa19b244c4105f5d820a31c518505ab64', '[\"*\"]', NULL, '2022-02-19 07:42:34', '2022-02-19 07:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `slug`, `price`, `created_at`, `updated_at`) VALUES
(1, 'product One', 'ssdfsdfsdf', 'product-one', '99.00', '2022-02-15 21:03:10', '2022-02-15 21:03:10'),
(2, 'product Two', 'asdasdasdsa', 'product-two', '55.99', '2022-02-15 21:40:57', '2022-02-15 22:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sandjjsm', 'dina@gmail.com', NULL, '$2y$10$.E0cJSrS0yuHTs8kNPeFLuvSC8VbozwbbhfygXA8uJwGo4Z5vY5N.', NULL, '2022-02-18 19:42:29', '2022-02-18 19:42:29'),
(2, 'sdfsdf', 'dddd@gmail.com', NULL, '$2y$10$fGfV4MXsNqEnQz86ygjvA.pcllj3jbhUJCkIMYl6ZAdKvMC8OpjXW', NULL, '2022-02-18 21:16:42', '2022-02-18 21:16:42'),
(3, 'dinns', 'dinaskar.arj@gmail.com', NULL, '$2y$10$Tm9qErM7LacRugHL2l1Ky.KaSCAe9wF8drTdx/blGB5Ob775Cay.6', NULL, '2022-02-18 21:48:49', '2022-02-18 21:48:49');

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
