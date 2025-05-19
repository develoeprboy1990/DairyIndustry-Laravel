-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- হোষ্ট: localhost:3306
-- তৈরী করতে ব্যবহৃত সময়: ডিসে 29, 2024 at 10:21 AM
-- সার্ভার সংস্করন: 10.6.20-MariaDB
-- পিএইছপির সংস্করন: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- ডাটাবেইজ: `sohabagc_dbdelevery`
--

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `addresses`
--

CREATE TABLE `addresses` (
  `id` char(36) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `block_number` varchar(191) DEFAULT NULL,
  `floor_number` varchar(191) DEFAULT NULL,
  `flat_number` varchar(191) DEFAULT NULL,
  `street_name` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `address_description` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `area` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `city_id` char(36) DEFAULT NULL,
  `country_id` char(36) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `zoom` varchar(191) DEFAULT NULL,
  `owner_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `addresses`
--

INSERT INTO `addresses` (`id`, `type`, `postal_code`, `block_number`, `floor_number`, `flat_number`, `street_name`, `address`, `address_description`, `country`, `area`, `country_code`, `city`, `city_id`, `country_id`, `is_default`, `longitude`, `latitude`, `zoom`, `owner_id`, `created_at`, `updated_at`) VALUES
('3dded66b-a32a-4bd1-8b78-a0726d495631', 'home', NULL, NULL, NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Oman', 'Sib', 'OM', 'Muscat Governorate', NULL, NULL, 0, '58.1198183', '23.619914', NULL, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '2023-11-03 22:18:47', '2023-11-03 22:18:47'),
('5c05ea7a-5606-467a-9056-045bb9ef89e0', 'home', NULL, NULL, NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Oman', 'Kahanat', 'OM', 'Ad Dhahirah Governorate', NULL, NULL, 0, '56.7818132', '23.5520596', NULL, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '2023-07-10 23:46:16', '2023-07-10 23:46:16'),
('76b2bf89-3e8b-452a-ac9e-67e9cdc9735b', 'home', NULL, NULL, NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Oman', 'Seeb', 'OM', 'Muscat Governorate', NULL, NULL, 0, '58.12295101583', '23.637432678503', NULL, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '2023-12-14 02:30:12', '2023-12-14 02:30:12'),
('c042eba7-9cf5-4174-9b66-7cc4413db70c', 'HOME', NULL, NULL, NULL, NULL, NULL, 'Amar ebn yaser ,cairo ,egypt', NULL, 'egypt', 'Heliopolies', 'EG', 'cairo', NULL, NULL, 1, '2.2222', '3.1111', NULL, 'f7dce302-652b-4950-b225-e80c69236f80', '2023-08-02 02:47:32', '2023-08-02 02:47:32');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `banners`
--

CREATE TABLE `banners` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `position` enum('home_main_slider','home_second_slider','home_third_slider','home_middle_banner') NOT NULL DEFAULT 'home_main_slider',
  `show_title` enum('active','disable') NOT NULL DEFAULT 'disable',
  `creator_id` char(36) DEFAULT NULL,
  `data_country_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `banners`
--

INSERT INTO `banners` (`id`, `en_name`, `ar_name`, `url`, `position`, `show_title`, `creator_id`, `data_country_id`, `deleted_at`, `created_at`, `updated_at`, `store_id`) VALUES
('036bc796-d639-4260-90f3-fee758c7969d', 'vvvv', 'vvv', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 19:00:11', '2024-09-30 18:57:08', '2024-09-30 19:00:11', '481b7b0f-ff7b-4585-abdf-e02efb8bd891'),
('246c176e-bc82-40a2-9e4c-24ab3b5d9fc4', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-04 21:21:51', '2023-06-04 21:21:51', NULL),
('2969f6c8-b25c-43e8-82a2-c5be3e7f5e73', 'tgdhfj', 'fjhjghj', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-24 19:17:34', '2024-12-24 08:54:58', '2024-12-24 19:17:34', '169925d3-d8a2-4b8c-9f1e-5871779e35b2'),
('2faa97c2-4d08-439c-a100-3158994272bf', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, NULL, '2023-06-03 23:12:50', '2023-06-03 23:12:50', NULL),
('323057ab-0136-46c9-9418-5afced331ee7', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, NULL, '2023-06-03 23:12:21', '2023-06-03 23:12:21', NULL),
('427e8627-6e55-42f9-8b82-b781fb7477f1', 'tthd', 'jhghjjh', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-24 19:17:38', '2024-12-24 08:44:05', '2024-12-24 19:17:38', '481b7b0f-ff7b-4585-abdf-e02efb8bd891'),
('45f2cd68-8966-4ada-8bc1-edbd08d0f016', 'gggs', 'ييي', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2024-09-30 19:00:24', '2024-09-30 19:00:24', '481b7b0f-ff7b-4585-abdf-e02efb8bd891'),
('54efa848-9603-452b-aaf6-e89b34a14526', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-04 21:23:01', '2023-06-04 21:23:01', NULL),
('55bd7094-a3a8-467d-b730-4d1c71f7ce7c', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-04 21:22:13', '2023-06-04 21:22:13', NULL),
('598af912-23c9-49fa-b868-7f3eb5218028', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-04 21:22:39', '2023-06-04 21:22:39', NULL),
('606eb2d2-f935-4040-9bf7-cef1cde6f311', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, NULL, '2023-06-03 23:11:59', '2023-06-03 23:11:59', NULL),
('64ea93d0-7393-4d46-bd67-0a8a7c440f55', 'title', 'title', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, NULL, '2023-06-03 23:11:31', '2023-06-03 23:11:31', NULL),
('72bf800b-819f-4ec7-b31c-c7c07249d2d8', 'ggg', 'للل', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 19:00:11', '2024-09-30 11:43:08', '2024-09-30 19:00:11', '0ba64045-8b10-41e9-bf3a-61cf538124ff'),
('7413c248-a5d6-4821-a583-68d62c95499d', 'Banner 2', 'Banner 2', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', NULL, '2024-12-24 20:58:36', '2024-12-24 20:58:36', '169925d3-d8a2-4b8c-9f1e-5871779e35b2'),
('b4c93eba-41b1-48e1-9b19-a704b2f600ef', 'Banner 1', 'Banner 1', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', NULL, '2024-12-24 18:58:57', '2024-12-24 18:58:57', '169925d3-d8a2-4b8c-9f1e-5871779e35b2'),
('c49b6429-a7d1-4a83-8ade-60ef9edba75f', '.', '.', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2024-12-24 08:43:38', '2023-07-06 14:03:16', '2024-12-24 08:43:38', NULL),
('dec63660-49e6-4ff6-ae0f-3ce70b5fb8d9', 'meat', 'لحوم', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 19:00:11', '2023-11-25 14:43:24', '2024-09-30 19:00:11', '0ba64045-8b10-41e9-bf3a-61cf538124ff'),
('e9d382ba-c759-48de-887b-c06236125465', 'فلسطين', 'فلسطين', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 19:00:11', '2023-11-26 02:48:00', '2024-09-30 19:00:11', '481b7b0f-ff7b-4585-abdf-e02efb8bd891'),
('eec7e800-7d80-4719-9f72-6c21bed960cd', 'ggg', 'للل', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 19:00:11', '2024-09-30 11:42:50', '2024-09-30 19:00:11', '0ba64045-8b10-41e9-bf3a-61cf538124ff'),
('f11e16ae-35eb-4be2-9c8d-651c13869c69', 'gggs', 'ييي', NULL, 'home_main_slider', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 19:00:11', '2024-09-30 11:55:31', '2024-09-30 19:00:11', '0ba64045-8b10-41e9-bf3a-61cf538124ff');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `brands`
--

CREATE TABLE `brands` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `canceled_orders`
--

CREATE TABLE `canceled_orders` (
  `id` char(36) NOT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `order_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `canceled_orders`
--

INSERT INTO `canceled_orders` (`id`, `driver_id`, `order_id`, `created_at`, `updated_at`) VALUES
('427ba19d-7167-4053-a3a3-9f229f28d18a', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', '4a60e4b3-7da1-441e-991b-969696650fdb', '2023-08-20 15:08:25', '2023-08-20 15:08:25'),
('4f9172c1-b7f0-491f-b99d-37051a15fab5', '489731f2-960b-4f66-a74f-73276b1aff4c', '55615f33-ea9f-4f1d-8f0b-529e613d8bd7', '2023-10-15 23:57:20', '2023-10-15 23:57:20'),
('bf94d910-75e6-4c97-b18b-192790ad531b', 'ebf3adb2-f4d7-4b86-bc45-4f0da3edebcd', '27aa92d7-671d-4e20-97e2-135d6cbb46a3', '2023-08-22 02:46:17', '2023-08-22 02:46:17');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `carts`
--

CREATE TABLE `carts` (
  `id` char(36) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `total_price` double(8,2) NOT NULL DEFAULT 0.00,
  `total_price_before_additions` double(8,2) NOT NULL DEFAULT 0.00,
  `total_additions_price` double(8,2) NOT NULL DEFAULT 0.00,
  `product_id` char(36) DEFAULT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `store_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `carts`
--

INSERT INTO `carts` (`id`, `quantity`, `price`, `total_price`, `total_price_before_additions`, `total_additions_price`, `product_id`, `customer_id`, `store_id`, `created_at`, `updated_at`) VALUES
('22bb6303-b71f-484a-97e7-8d194f97d301', 1, 20.00, 20.00, 20.00, 0.00, '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-08-06 13:21:17', '2023-08-06 13:21:17'),
('f78ee155-e929-4c54-8109-3b42ac659e94', 1, 366.00, 366.00, 366.00, 0.00, '0ce5bb80-c155-4ec8-9477-222f75b81de5', 'b6e8c4c8-ec2e-43b4-8af6-2c708b51288b', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-12 14:45:09', '2023-07-12 14:45:09');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `cart_additions`
--

CREATE TABLE `cart_additions` (
  `id` char(36) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `total_price` double(8,2) NOT NULL DEFAULT 0.00,
  `cart_id` char(36) DEFAULT NULL,
  `addition_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  `cart_group_addition_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `cart_additions`
--

INSERT INTO `cart_additions` (`id`, `quantity`, `price`, `total_price`, `cart_id`, `addition_id`, `group_id`, `cart_group_addition_id`, `created_at`, `updated_at`) VALUES
('6ccb23a3-76ae-4888-b112-504dfa431e49', 1, 200.00, 200.00, '95c2974c-26cd-4947-883e-d0a39bd9f885', '6597dba5-31a2-4df9-9cf7-2acb04742295', NULL, NULL, '2023-06-14 14:50:13', '2023-06-14 14:50:13');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `cart_group_additions`
--

CREATE TABLE `cart_group_additions` (
  `id` char(36) NOT NULL,
  `group_id` char(36) DEFAULT NULL,
  `cart_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `categories`
--

CREATE TABLE `categories` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `ar_slug` varchar(191) DEFAULT NULL,
  `en_slug` varchar(191) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `categorization_id` char(36) DEFAULT NULL,
  `status` enum('active','disable') NOT NULL DEFAULT 'disable',
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `categories`
--

INSERT INTO `categories` (`id`, `en_name`, `ar_name`, `ar_slug`, `en_slug`, `parent_id`, `categorization_id`, `status`, `creator_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('04cce9a2-eea8-48e5-a6d7-717cc834bef8', 'فواكه', 'فواكه', 'فواكه', 'foakh', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 20:17:49', '2023-12-08 20:17:49'),
('10e4a82b-a330-4158-80b9-f8a8323f8d7c', 'Fhone', 'فون', 'فون', 'fhone', NULL, '071964b7-d388-4033-a6eb-33414b1d8a50', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-09-05 13:04:58', '2023-09-05 13:04:58'),
('382298b0-a234-47f4-9a1f-faaeb5ca9825', 'عصير', 'عصير', 'عصير', 'aasyr', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-06 15:15:25', '2023-12-06 15:15:25'),
('3c11a0d7-3dff-4c75-9cd7-e319f08b4546', 'معجنات', 'معجنات', 'معجنات', 'maagnat', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-09-30 12:34:14', '2023-12-08 20:18:46', '2024-09-30 12:34:14'),
('5062a344-ee0f-4ec1-8e19-9ce5b3a1695c', 'مشاوي', 'مشاوي', 'مشاوي', 'mshaoy', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-04 22:00:19', '2023-12-04 22:07:15'),
('546e2776-239d-46f4-8c13-06e294ca9a42', 'سمك', 'سمك', 'سمك', 'smk', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 03:27:08', '2023-12-08 03:27:08'),
('5e754c1c-4727-49af-b0a7-e2130c1423d2', 'Fast food', 'وجبات سريعه', 'وجبات-سريعه', 'fast-food', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-09-30 12:19:37', '2023-05-30 21:34:23', '2024-09-30 12:19:37'),
('623dffcf-a769-498b-8db6-e118a1b7d93d', 'فطاير', 'فطاير', 'فطاير', 'ftayr', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 03:28:19', '2023-12-08 03:28:19'),
('6bf77526-ebbb-4c42-b7e7-5046d5501e44', 'معجنات', 'معجنات', 'معجنات', 'maagnat', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-09-30 12:34:19', '2023-12-08 03:27:42', '2024-09-30 12:34:19'),
('6ef350ee-908d-4705-9ea1-73888748cc53', 'Fast food', 'وجبات سريعه', 'وجبات-سريعه', 'fast-food', NULL, NULL, 'active', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-09-30 12:30:11', '2023-05-30 21:32:57', '2024-09-30 12:30:11'),
('6f12f592-7059-4352-91af-49f697583517', 'الالبان', 'الالبان', 'الالبان', 'alalban', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 20:12:17', '2023-12-08 20:12:17'),
('7d9605af-06c0-41bd-b281-2369f1796008', 'شاورما', 'شاورما', 'شاورما', 'shaorma', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-09-30 12:35:59', '2023-12-08 03:26:33', '2024-09-30 12:35:59'),
('a0cb6aaf-0eb3-4928-95d0-31a4a16df471', 'الحلويات', 'الحلويات', 'الحلويات', 'alhloyat', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 20:16:09', '2023-12-08 20:16:09'),
('ab18dda2-8ed7-4cee-86b1-04597f76558b', 'الحلويات', 'الحلويات', 'الحلويات', 'alhloyat', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 20:16:26', '2023-12-08 20:16:26'),
('b1dd8a2b-1b57-410e-b263-35a0e3127695', 'Fast food', 'وجبات سريعه', 'وجبات-سريعه', 'fast-food', NULL, NULL, 'active', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-09-30 12:30:15', '2023-05-30 21:32:26', '2024-09-30 12:30:15'),
('c56cc156-8df2-4bd7-ba9e-b25c9a305626', 'مخبوزات', 'مخبوزات', 'مخبوزات', 'mkhbozat', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-12-08 20:20:55', '2023-12-08 20:20:55'),
('d897ee02-db56-402b-9477-e045f92cf2c1', 'meat', 'لحوم', 'لحوم', 'meat', NULL, '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-09-05 02:29:05', '2023-09-05 02:29:05');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `categorizations`
--

CREATE TABLE `categorizations` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_field` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Say make it static'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `categorizations`
--

INSERT INTO `categorizations` (`id`, `en_name`, `ar_name`, `creator_id`, `deleted_at`, `created_at`, `updated_at`, `order_field`) VALUES
('071964b7-d388-4033-a6eb-33414b1d8a50', 'stores', 'متاجر', '146de26b-2521-4b4b-9002-6926d134ca36', '2024-10-20 21:00:00', '2023-06-24 15:05:48', '2024-09-30 18:21:51', 3),
('3ad6484f-2ec2-426f-a3a7-795f6cc7b6da', 'clothes', 'ملابس', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2024-10-01 08:02:18', '2024-10-01 08:02:18', NULL),
('48c5b450-47ce-4e44-917e-c844eaec5d65', 'restaurant', 'مطعم', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-05-30 21:33:50', '2024-09-30 18:26:16', 1),
('830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'Markets', 'ماركت', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-24 15:08:40', '2023-06-24 15:08:40', 2);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `cities`
--

CREATE TABLE `cities` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `status` enum('active','disable') NOT NULL DEFAULT 'disable',
  `country_id` char(36) DEFAULT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `classifications`
--

CREATE TABLE `classifications` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `categorization_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `contacts`
--

CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `country_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `countries`
--

CREATE TABLE `countries` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `ar_currency` varchar(191) DEFAULT NULL,
  `en_currency` varchar(191) DEFAULT NULL,
  `status` enum('active','disable') NOT NULL DEFAULT 'disable',
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `countries`
--

INSERT INTO `countries` (`id`, `en_name`, `ar_name`, `country_code`, `ar_currency`, `en_currency`, `status`, `creator_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('15d5dcd8-bd97-47e2-9700-6f6423b6698c', 'Lebanon', 'لُبْنان', 'LB', 'LBP', 'USD', 'active', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2024-12-23 12:52:01', '2024-12-24 08:52:35'),
('3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', 'Egypt', 'مصر', 'EG', 'EGP', 'EGP', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-04 00:08:55', '2024-12-24 08:52:47'),
('3cf40936-be5d-4475-9b95-0a0886ca4fd3', 'Bahrain', 'البحرين', '973+', 'دينار بحريني', 'Bahraini dinar', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('4e77c992-c68e-4ad6-bc5a-8b26878f0075', 'Oman', 'عمان', 'OM', 'ريال عماني', 'RO', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-04 20:50:42', '2024-12-24 08:52:05'),
('974f4fd5-bd27-47df-9117-6eb823bb339c', 'UAE', 'الامارت', '971 +', 'درهم إماراتي', 'AED', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'Saudi Arabia', 'السعوديه', '966+', 'ريال سعودي', 'SR', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('d87c537d-1d8c-49cd-a589-6bc47587a707', 'Qatar', 'قطر', '974+', 'ريال قطري', 'Qatari Ryal', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('eb3fbe83-f76d-4353-a059-c9e5796324e5', 'Kuwait', 'كويت', '965+', 'دينار الكويتي', 'Kuwaiti Dinar', 'disable', '146de26b-2521-4b4b-9002-6926d134ca36', NULL, '2023-06-23 16:15:05', '2023-06-23 16:15:05');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `discounts`
--

CREATE TABLE `discounts` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `discount` varchar(191) NOT NULL,
  `status` enum('publish','pending') NOT NULL DEFAULT 'publish',
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `faqs`
--

CREATE TABLE `faqs` (
  `id` char(36) NOT NULL,
  `en_question` varchar(191) NOT NULL,
  `ar_question` varchar(191) NOT NULL,
  `en_answer` text NOT NULL,
  `ar_answer` text NOT NULL,
  `status` enum('active','disable') NOT NULL DEFAULT 'disable',
  `creator_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `favorites`
--

CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `favorited_type` varchar(191) NOT NULL,
  `favorited_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `favorites`
--

INSERT INTO `favorites` (`id`, `favorited_type`, `favorited_id`, `user_id`, `created_at`, `updated_at`) VALUES
('31d5bcb1-7013-4c05-8482-efbf868626ea', 'MixCode\\Product', 'f692fc9c-9601-4712-8baa-1565ab065fd4', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', '2023-06-24 02:24:43', '2023-06-24 02:24:43'),
('6f0dd95c-eb03-46ba-a443-e9f1351d8e82', 'MixCode\\Product', '0ce5bb80-c155-4ec8-9477-222f75b81de5', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', '2023-07-08 00:48:58', '2023-07-08 00:48:58'),
('aa16d937-dcb1-46a2-9279-d8c6cb8f3747', 'MixCode\\Product', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '2023-09-20 23:49:23', '2023-09-20 23:49:23'),
('dc10167c-5974-45a7-80ba-d194115bfd1c', 'MixCode\\Product', '1846fda4-1922-4454-bc6d-a6c69f9379d6', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', '2023-06-16 16:45:31', '2023-06-16 16:45:31');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` char(36) NOT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` text NOT NULL,
  `custom_properties` text NOT NULL,
  `responsive_images` text NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'MixCode\\Category', 'b1dd8a2b-1b57-410e-b263-35a0e3127695', 'category_image_icon', '857f823abba8ee3ea12ac1aba3bd46da.png', '857f823abba8ee3ea12ac1aba3bd46da.png', 'image/png', 'public', 516834, '[]', '[]', '[]', 1, '2023-05-30 21:32:26', '2023-05-30 21:32:26'),
(2, 'MixCode\\Category', '6ef350ee-908d-4705-9ea1-73888748cc53', 'category_image_icon', '857f823abba8ee3ea12ac1aba3bd46da.png', '857f823abba8ee3ea12ac1aba3bd46da.png', 'image/png', 'public', 516834, '[]', '[]', '[]', 2, '2023-05-30 21:32:57', '2023-05-30 21:32:57'),
(3, 'MixCode\\Categorization', '48c5b450-47ce-4e44-917e-c844eaec5d65', 'categorization_image_icon', '857f823abba8ee3ea12ac1aba3bd46da.png', '857f823abba8ee3ea12ac1aba3bd46da.png', 'image/png', 'public', 516834, '[]', '[]', '[]', 3, '2023-05-30 21:33:50', '2023-05-30 21:33:50'),
(4, 'MixCode\\Category', '5e754c1c-4727-49af-b0a7-e2130c1423d2', 'category_image_icon', 'd477513e881f79a219f6b7547e3526c9.jpg', 'd477513e881f79a219f6b7547e3526c9.jpg', 'image/jpeg', 'public', 152896, '[]', '[]', '[]', 4, '2023-05-30 21:34:23', '2023-05-30 21:34:23'),
(5, 'MixCode\\Product', '931a815e-bbe6-41f4-a772-73e79f45e556', 'product_image', 'ff8745b49a7bbecd3ed4fd4921e2d936.jpg', 'ff8745b49a7bbecd3ed4fd4921e2d936.jpg', 'image/jpeg', 'public', 63503, '[]', '[]', '[]', 5, '2023-05-30 21:38:17', '2023-05-30 21:38:17'),
(6, 'MixCode\\Banner', '64ea93d0-7393-4d46-bd67-0a8a7c440f55', 'banner_image', '6d5645e6af8ba9d1b9e324c4cb453f50.jpg', '6d5645e6af8ba9d1b9e324c4cb453f50.jpg', 'image/jpeg', 'public', 2092746, '[]', '[]', '[]', 6, '2023-06-03 23:11:31', '2023-06-03 23:11:31'),
(7, 'MixCode\\Banner', '606eb2d2-f935-4040-9bf7-cef1cde6f311', 'banner_image', '2235febc6bf0b858287ff4732975413e.jpg', '2235febc6bf0b858287ff4732975413e.jpg', 'image/jpeg', 'public', 5351799, '[]', '[]', '[]', 7, '2023-06-03 23:11:59', '2023-06-03 23:11:59'),
(8, 'MixCode\\Banner', '323057ab-0136-46c9-9418-5afced331ee7', 'banner_image', '783d74d3322a0af52db0ba65103c183a.jpg', '783d74d3322a0af52db0ba65103c183a.jpg', 'image/jpeg', 'public', 3218731, '[]', '[]', '[]', 8, '2023-06-03 23:12:21', '2023-06-03 23:12:21'),
(9, 'MixCode\\Banner', '2faa97c2-4d08-439c-a100-3158994272bf', 'banner_image', '85346de220fadec2e025f0b7fee6732a.jpg', '85346de220fadec2e025f0b7fee6732a.jpg', 'image/jpeg', 'public', 3754795, '[]', '[]', '[]', 9, '2023-06-03 23:12:50', '2023-06-03 23:12:50'),
(10, 'MixCode\\User', '2ea627af-3622-407d-9d0d-366e8ecc8285', 'user_file_vehicle_license', 'fe4db5a3631f4aedc1f3be4dfe7be54a.jpg', 'fe4db5a3631f4aedc1f3be4dfe7be54a.jpg', 'image/jpeg', 'public', 3782638, '[]', '[]', '[]', 10, '2023-06-04 02:43:06', '2023-06-04 02:43:06'),
(11, 'MixCode\\User', '2ea627af-3622-407d-9d0d-366e8ecc8285', 'user_image', 'a5e4a96db09df1c54fc16a29ee959945.jpg', 'a5e4a96db09df1c54fc16a29ee959945.jpg', 'image/jpeg', 'public', 2605428, '[]', '[]', '[]', 11, '2023-06-04 02:43:06', '2023-06-04 02:43:06'),
(12, 'MixCode\\User', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 'user_image_logo', '1bb87d41d15fe27b500a4bfcde01bb0e.png', '1bb87d41d15fe27b500a4bfcde01bb0e.png', 'image/png', 'public', 36921, '[]', '[]', '[]', 12, '2023-06-04 15:43:32', '2023-06-04 15:43:32'),
(13, 'MixCode\\User', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 'user_file_commercial_license', 'fe4db5a3631f4aedc1f3be4dfe7be54a.jpg', 'fe4db5a3631f4aedc1f3be4dfe7be54a.jpg', 'image/jpeg', 'public', 3782638, '[]', '[]', '[]', 13, '2023-06-04 15:43:32', '2023-06-04 15:43:32'),
(14, 'MixCode\\Banner', '246c176e-bc82-40a2-9e4c-24ab3b5d9fc4', 'banner_image', 'efb2296d1d4f09d4e92ac445e0a6bbe4.jpg', 'efb2296d1d4f09d4e92ac445e0a6bbe4.jpg', 'image/jpeg', 'public', 3985576, '[]', '[]', '[]', 14, '2023-06-04 21:21:51', '2023-06-04 21:21:51'),
(15, 'MixCode\\Banner', '55bd7094-a3a8-467d-b730-4d1c71f7ce7c', 'banner_image', '6d5645e6af8ba9d1b9e324c4cb453f50.jpg', '6d5645e6af8ba9d1b9e324c4cb453f50.jpg', 'image/jpeg', 'public', 2092746, '[]', '[]', '[]', 15, '2023-06-04 21:22:13', '2023-06-04 21:22:13'),
(16, 'MixCode\\Banner', '598af912-23c9-49fa-b868-7f3eb5218028', 'banner_image', 'b08892ad74a199c79b457cea941bb4c1.jpg', 'b08892ad74a199c79b457cea941bb4c1.jpg', 'image/jpeg', 'public', 1035684, '[]', '[]', '[]', 16, '2023-06-04 21:22:39', '2023-06-04 21:22:39'),
(17, 'MixCode\\Banner', '54efa848-9603-452b-aaf6-e89b34a14526', 'banner_image', '2b24bad292bed9c3a453f666ccc56122.jpg', '2b24bad292bed9c3a453f666ccc56122.jpg', 'image/jpeg', 'public', 3532546, '[]', '[]', '[]', 17, '2023-06-04 21:23:01', '2023-06-04 21:23:01'),
(24, 'MixCode\\User', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 'user_image_logo', '9cd3aa73e921f0188481201024f618bc.jpg', '9cd3aa73e921f0188481201024f618bc.jpg', 'image/jpeg', 'public', 737667, '[]', '[]', '[]', 23, '2023-06-05 18:03:34', '2023-06-05 18:03:34'),
(25, 'MixCode\\Product', '1846fda4-1922-4454-bc6d-a6c69f9379d6', 'product_image', '4303763f9168eca3ab84839493b8b937.png', '4303763f9168eca3ab84839493b8b937.png', 'image/png', 'public', 214160, '[]', '[]', '[]', 24, '2023-06-12 19:00:54', '2023-06-12 19:00:54'),
(26, 'MixCode\\User', '466ee50d-041d-423c-9bfb-c3368a7590f6', 'user_image_logo', '2d806beca4e43a278e311f4fab74f28a.jpg', '2d806beca4e43a278e311f4fab74f28a.jpg', 'image/jpeg', 'public', 70347, '[]', '[]', '[]', 25, '2023-06-14 11:20:03', '2023-06-14 11:20:03'),
(27, 'MixCode\\User', '466ee50d-041d-423c-9bfb-c3368a7590f6', 'user_file_commercial_license', 'ce8567f6f90e35ca8dec4e6807f2cdbb.jpg', 'ce8567f6f90e35ca8dec4e6807f2cdbb.jpg', 'image/jpeg', 'public', 79816, '[]', '[]', '[]', 26, '2023-06-14 11:20:03', '2023-06-14 11:20:03'),
(28, 'MixCode\\Product', '320896db-67be-4d28-842a-ee3f82c25b9e', 'product_image', '1e21d5a47bd6c19f28cf08be53cccbe9.jpg', '1e21d5a47bd6c19f28cf08be53cccbe9.jpg', 'image/jpeg', 'public', 91316, '[]', '[]', '[]', 27, '2023-06-14 11:45:11', '2023-06-14 11:45:11'),
(30, 'MixCode\\User', '0d3639de-5470-46e4-931c-aee686676f9e', 'user_file_vehicle_license', '4303763f9168eca3ab84839493b8b937.png', '4303763f9168eca3ab84839493b8b937.png', 'image/png', 'public', 214160, '[]', '[]', '[]', 29, '2023-06-14 17:46:03', '2023-06-14 17:46:03'),
(31, 'MixCode\\User', '0d3639de-5470-46e4-931c-aee686676f9e', 'user_image', '4303763f9168eca3ab84839493b8b937.png', '4303763f9168eca3ab84839493b8b937.png', 'image/png', 'public', 214160, '[]', '[]', '[]', 30, '2023-06-14 17:46:03', '2023-06-14 17:46:03'),
(32, 'MixCode\\User', 'f719b327-49cf-4f24-a6f6-1c45fee81ec4', 'user_file_vehicle_license', '953a95c930ea6bd391be13858ac76420.png', '953a95c930ea6bd391be13858ac76420.png', 'image/png', 'public', 19405, '[]', '[]', '[]', 31, '2023-06-14 19:36:01', '2023-06-14 19:36:01'),
(33, 'MixCode\\User', 'f719b327-49cf-4f24-a6f6-1c45fee81ec4', 'user_image', 'b09d0315354416f37ab35d8787b71c2a.png', 'b09d0315354416f37ab35d8787b71c2a.png', 'image/png', 'public', 113131, '[]', '[]', '[]', 32, '2023-06-14 19:36:01', '2023-06-14 19:36:01'),
(34, 'MixCode\\User', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', 'user_image_logo', '326b828d900d697c10cc5e7a1c5494b1.jpg', '326b828d900d697c10cc5e7a1c5494b1.jpg', 'image/jpeg', 'public', 102864, '[]', '[]', '[]', 33, '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
(35, 'MixCode\\User', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', 'user_file_commercial_license', '326b828d900d697c10cc5e7a1c5494b1.jpg', '326b828d900d697c10cc5e7a1c5494b1.jpg', 'image/jpeg', 'public', 102864, '[]', '[]', '[]', 34, '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
(36, 'MixCode\\User', '8511ab31-ce79-4306-825c-8ff5552f80e4', 'user_image_logo', '59686b70cc7fc192515fd29eda8b0456.jpg', '59686b70cc7fc192515fd29eda8b0456.jpg', 'image/jpeg', 'public', 2003865, '[]', '[]', '[]', 35, '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
(37, 'MixCode\\User', '8511ab31-ce79-4306-825c-8ff5552f80e4', 'user_file_commercial_license', 'aa115ab0bd50e67543d24db350a0d123.jpg', 'aa115ab0bd50e67543d24db350a0d123.jpg', 'image/jpeg', 'public', 1455519, '[]', '[]', '[]', 36, '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
(38, 'MixCode\\Product', '1bdfb31a-72e6-4195-b608-028e4337c550', 'product_image', 'd478b8c2e9894e214e5bf60a8994d1eb.jpg', 'd478b8c2e9894e214e5bf60a8994d1eb.jpg', 'image/jpeg', 'public', 152029, '[]', '[]', '[]', 37, '2023-06-22 17:02:31', '2023-06-22 17:02:31'),
(39, 'MixCode\\User', '6c1dba27-037b-46fd-8004-04bf72e2eca4', 'user_file_vehicle_license', '1197c5f945e1f17206e20b1c4b97aaba.jpg', '1197c5f945e1f17206e20b1c4b97aaba.jpg', 'image/jpeg', 'public', 4051955, '[]', '[]', '[]', 38, '2023-06-23 01:11:15', '2023-06-23 01:11:15'),
(40, 'MixCode\\User', '6c1dba27-037b-46fd-8004-04bf72e2eca4', 'user_image', 'a2913a53f235e2dc533fc0be0eadd395.jpg', 'a2913a53f235e2dc533fc0be0eadd395.jpg', 'image/jpeg', 'public', 1128337, '[]', '[]', '[]', 39, '2023-06-23 01:11:15', '2023-06-23 01:11:15'),
(41, 'MixCode\\Product', 'f692fc9c-9601-4712-8baa-1565ab065fd4', 'product_image', 'dbfd933bc033b3df2598a6ebde75b3d4.png', 'dbfd933bc033b3df2598a6ebde75b3d4.png', 'image/png', 'public', 316354, '[]', '[]', '[]', 40, '2023-06-24 01:49:04', '2023-06-24 01:49:04'),
(42, 'MixCode\\User', '09b9e208-620e-4bee-8d52-17f528a1c7af', 'user_image_logo', '5061c6da2b23ff45ae4fb7128c419fd7.jpg', '5061c6da2b23ff45ae4fb7128c419fd7.jpg', 'image/jpeg', 'public', 1577593, '[]', '[]', '[]', 41, '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
(43, 'MixCode\\User', '09b9e208-620e-4bee-8d52-17f528a1c7af', 'user_file_commercial_license', '600d5720d231dade14a1f1005e7ba73f.jpg', '600d5720d231dade14a1f1005e7ba73f.jpg', 'image/jpeg', 'public', 1619085, '[]', '[]', '[]', 42, '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
(44, 'MixCode\\User', '600ae9df-1f17-405b-8a53-187924bb53a9', 'user_image_logo', '5061c6da2b23ff45ae4fb7128c419fd7.jpg', '5061c6da2b23ff45ae4fb7128c419fd7.jpg', 'image/jpeg', 'public', 1577593, '[]', '[]', '[]', 43, '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
(45, 'MixCode\\User', '600ae9df-1f17-405b-8a53-187924bb53a9', 'user_file_commercial_license', '600d5720d231dade14a1f1005e7ba73f.jpg', '600d5720d231dade14a1f1005e7ba73f.jpg', 'image/jpeg', 'public', 1619085, '[]', '[]', '[]', 44, '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
(46, 'MixCode\\User', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', 'user_image_logo', 'eba5a1d6ad9db6630ca60e68130e555b.jpg', 'eba5a1d6ad9db6630ca60e68130e555b.jpg', 'image/jpeg', 'public', 1594375, '[]', '[]', '[]', 45, '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
(47, 'MixCode\\User', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', 'user_file_commercial_license', '799a8b7f1286db369c3e349b9f2bf33d.jpg', '799a8b7f1286db369c3e349b9f2bf33d.jpg', 'image/jpeg', 'public', 1783956, '[]', '[]', '[]', 46, '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
(48, 'MixCode\\Categorization', '071964b7-d388-4033-a6eb-33414b1d8a50', 'categorization_image_icon', '97f86e728304485b9b1a2e27c898fabf.jpg', '97f86e728304485b9b1a2e27c898fabf.jpg', 'image/jpeg', 'public', 1798485, '[]', '[]', '[]', 47, '2023-06-24 15:05:48', '2023-06-24 15:05:48'),
(49, 'MixCode\\Categorization', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 'categorization_image_icon', 'ededb18d2c92b89bf09bd314bc7c4617.jpg', 'ededb18d2c92b89bf09bd314bc7c4617.jpg', 'image/jpeg', 'public', 544285, '[]', '[]', '[]', 48, '2023-06-24 15:08:40', '2023-06-24 15:08:40'),
(50, 'MixCode\\User', '8eddabad-9aae-46c3-b420-cb5275bf29b9', 'user_image_logo', 'f6d8612d46777ab59627d7d1f4fe2cea.jpg', 'f6d8612d46777ab59627d7d1f4fe2cea.jpg', 'image/jpeg', 'public', 905534, '[]', '[]', '[]', 49, '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
(51, 'MixCode\\User', '8eddabad-9aae-46c3-b420-cb5275bf29b9', 'user_file_commercial_license', '7df071575e9887b31aa9832e9f072674.jpg', '7df071575e9887b31aa9832e9f072674.jpg', 'image/jpeg', 'public', 880521, '[]', '[]', '[]', 50, '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
(52, 'MixCode\\User', '827b6dab-72e7-414c-a807-ec33ef212f9f', 'user_file_vehicle_license', 'cef721f7c2773d20129e7d7372f688e9.jpg', 'cef721f7c2773d20129e7d7372f688e9.jpg', 'image/jpeg', 'public', 1779495, '[]', '[]', '[]', 51, '2023-06-24 22:23:01', '2023-06-24 22:23:01'),
(53, 'MixCode\\User', '827b6dab-72e7-414c-a807-ec33ef212f9f', 'user_image', '2c62ca83e269dc2c786822abe48f2618.jpg', '2c62ca83e269dc2c786822abe48f2618.jpg', 'image/jpeg', 'public', 31543, '[]', '[]', '[]', 52, '2023-06-24 22:23:02', '2023-06-24 22:23:02'),
(54, 'MixCode\\User', '061cab1b-ae96-453b-b666-fbeece8c1432', 'user_image_logo', 'e0fc7a5354f05d3febca7a295f2707e3.jpg', 'e0fc7a5354f05d3febca7a295f2707e3.jpg', 'image/jpeg', 'public', 471621, '[]', '[]', '[]', 53, '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
(55, 'MixCode\\User', '061cab1b-ae96-453b-b666-fbeece8c1432', 'user_file_commercial_license', '5ef03ad57cd208bcd4b97b048010620c.jpg', '5ef03ad57cd208bcd4b97b048010620c.jpg', 'image/jpeg', 'public', 724278, '[]', '[]', '[]', 54, '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
(56, 'MixCode\\User', 'b7de0545-cc99-41f4-8007-f1be16701494', 'user_file_vehicle_license', 'c2bbf58141b7f837d32765b13fc223a0.jpg', 'c2bbf58141b7f837d32765b13fc223a0.jpg', 'image/jpeg', 'public', 795067, '[]', '[]', '[]', 55, '2023-06-24 23:39:45', '2023-06-24 23:39:45'),
(57, 'MixCode\\User', 'b7de0545-cc99-41f4-8007-f1be16701494', 'user_image', '208a3a00889046874bb2fea0757d3063.jpg', '208a3a00889046874bb2fea0757d3063.jpg', 'image/jpeg', 'public', 251714, '[]', '[]', '[]', 56, '2023-06-24 23:39:45', '2023-06-24 23:39:45'),
(58, 'MixCode\\User', '55185a4b-f018-427f-941d-f483d91a6545', 'user_image_logo', '2f2ce8bcf7913fba5bdcfa92bcf2f9a2.jpg', '2f2ce8bcf7913fba5bdcfa92bcf2f9a2.jpg', 'image/jpeg', 'public', 1695121, '[]', '[]', '[]', 57, '2023-06-25 13:59:04', '2023-06-25 13:59:04'),
(59, 'MixCode\\User', '55185a4b-f018-427f-941d-f483d91a6545', 'user_file_commercial_license', '5aaca9910aac07a29759dae8587f5ea8.jpg', '5aaca9910aac07a29759dae8587f5ea8.jpg', 'image/jpeg', 'public', 1675437, '[]', '[]', '[]', 58, '2023-06-25 13:59:04', '2023-06-25 13:59:04'),
(60, 'MixCode\\User', '90f8467d-3dd2-4c10-935c-60c40746eaee', 'user_image_logo', '17646f9fe5c6820a140dd9fcef8bff59.jpg', '17646f9fe5c6820a140dd9fcef8bff59.jpg', 'image/jpeg', 'public', 139382, '[]', '[]', '[]', 59, '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
(61, 'MixCode\\User', '90f8467d-3dd2-4c10-935c-60c40746eaee', 'user_file_commercial_license', '4cc30ce7ede63cd1847ff52b84e5506d.jpg', '4cc30ce7ede63cd1847ff52b84e5506d.jpg', 'image/jpeg', 'public', 175346, '[]', '[]', '[]', 60, '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
(62, 'MixCode\\User', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', 'user_image_logo', '4d3eb602bb3d2055119d5efe01a2a30e.jpg', '4d3eb602bb3d2055119d5efe01a2a30e.jpg', 'image/jpeg', 'public', 1387799, '[]', '[]', '[]', 61, '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
(63, 'MixCode\\User', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', 'user_file_commercial_license', '0e805dc57b8b28eac4feccfb4a30085a.jpg', '0e805dc57b8b28eac4feccfb4a30085a.jpg', 'image/jpeg', 'public', 1969926, '[]', '[]', '[]', 62, '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
(64, 'MixCode\\Product', '5321ae43-adc4-42e1-a5a3-79078cc7efc8', 'product_image', 'cadbd68afab9e764c970fd2b6c9b89b7.jpg', 'cadbd68afab9e764c970fd2b6c9b89b7.jpg', 'image/jpeg', 'public', 58674, '[]', '[]', '[]', 63, '2023-06-25 21:25:15', '2023-06-25 21:25:15'),
(65, 'MixCode\\Banner', '5763d232-d61c-434e-8589-a42ead0bfdb6', 'banner_image', '188c724174809e0241442a4089a48e7e.jpg', '188c724174809e0241442a4089a48e7e.jpg', 'image/jpeg', 'public', 191145, '[]', '[]', '[]', 64, '2023-06-26 21:46:06', '2023-06-26 21:46:06'),
(66, 'MixCode\\User', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', 'user_image_logo', '4303763f9168eca3ab84839493b8b937.png', '4303763f9168eca3ab84839493b8b937.png', 'image/png', 'public', 214160, '[]', '[]', '[]', 65, '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
(67, 'MixCode\\User', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', 'user_file_commercial_license', '4303763f9168eca3ab84839493b8b937.png', '4303763f9168eca3ab84839493b8b937.png', 'image/png', 'public', 214160, '[]', '[]', '[]', 66, '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
(68, 'MixCode\\Product', '613a9f66-ff09-4e62-b3b4-48102d80c124', 'product_image', '6d5645e6af8ba9d1b9e324c4cb453f50.jpg', '6d5645e6af8ba9d1b9e324c4cb453f50.jpg', 'image/jpeg', 'public', 2092746, '[]', '[]', '[]', 67, '2023-06-29 07:49:36', '2023-06-29 07:49:36'),
(69, 'MixCode\\User', '82fba06d-eac5-487e-9919-f261ec20667f', 'user_image_logo', '6611e5ddba4b58d1bc47b056d6f4b5c2.jpg', '6611e5ddba4b58d1bc47b056d6f4b5c2.jpg', 'image/jpeg', 'public', 1919809, '[]', '[]', '[]', 68, '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
(70, 'MixCode\\User', '82fba06d-eac5-487e-9919-f261ec20667f', 'user_file_commercial_license', 'dd36d17da80c87629017f690c0bf3965.jpg', 'dd36d17da80c87629017f690c0bf3965.jpg', 'image/jpeg', 'public', 1927307, '[]', '[]', '[]', 69, '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
(71, 'MixCode\\Product', '1e8b8141-3735-43ae-b5c0-d374ac487657', 'product_image', '02acd2edb39d08323415ba4b19e8e37d.jpg', '02acd2edb39d08323415ba4b19e8e37d.jpg', 'image/jpeg', 'public', 196306, '[]', '[]', '[]', 70, '2023-06-29 15:38:09', '2023-06-29 15:38:09'),
(72, 'MixCode\\Product', '77ed4473-580c-4279-9221-e2482c16e790', 'product_image', '02acd2edb39d08323415ba4b19e8e37d.jpg', '02acd2edb39d08323415ba4b19e8e37d.jpg', 'image/jpeg', 'public', 196306, '[]', '[]', '[]', 71, '2023-06-29 15:39:04', '2023-06-29 15:39:04'),
(75, 'MixCode\\Product', 'e6d05d75-0eb8-4ed5-ad66-a9c50e7dcbef', 'product_image', '6771b92c4e3a9898aeea8542bd6ede89.jpg', '6771b92c4e3a9898aeea8542bd6ede89.jpg', 'image/jpeg', 'public', 3285618, '[]', '[]', '[]', 74, '2023-06-29 17:21:08', '2023-06-29 17:21:08'),
(76, 'MixCode\\User', 'bb09984e-1c72-45a5-9641-249d25d70889', 'user_image_logo', 'aa04074514f92c50373b43eb1d6e1014.jpg', 'aa04074514f92c50373b43eb1d6e1014.jpg', 'image/jpeg', 'public', 1966299, '[]', '[]', '[]', 75, '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
(77, 'MixCode\\User', 'bb09984e-1c72-45a5-9641-249d25d70889', 'user_file_commercial_license', 'cc53642bd291af6e408ace194915ae31.jpg', 'cc53642bd291af6e408ace194915ae31.jpg', 'image/jpeg', 'public', 2069304, '[]', '[]', '[]', 76, '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
(78, 'MixCode\\Banner', 'fe200682-b254-433b-86e0-6b3d863dde5d', 'banner_image', '9d3e111e01a019ba9af5c9f90a7d89ea.png', '9d3e111e01a019ba9af5c9f90a7d89ea.png', 'image/png', 'public', 267898, '[]', '[]', '[]', 77, '2023-06-30 02:52:14', '2023-06-30 02:52:14'),
(79, 'MixCode\\User', '8bd84008-d2a6-4d2e-8cca-3ea9979943fd', 'user_file_vehicle_license', '590c57780411a4f73bde867a48825440.jpg', '590c57780411a4f73bde867a48825440.jpg', 'image/jpeg', 'public', 982217, '[]', '[]', '[]', 78, '2023-06-30 02:59:13', '2023-06-30 02:59:13'),
(80, 'MixCode\\User', '8bd84008-d2a6-4d2e-8cca-3ea9979943fd', 'user_image', 'a95b88f793f19cc30987935f7c2ce3e9.jpg', 'a95b88f793f19cc30987935f7c2ce3e9.jpg', 'image/jpeg', 'public', 147623, '[]', '[]', '[]', 79, '2023-06-30 02:59:13', '2023-06-30 02:59:13'),
(81, 'MixCode\\User', 'a8939a64-33ad-46ec-8937-4aa4cf389af4', 'user_file_vehicle_license', '0aa3ba843487c814c0f8c553fe2b57af.jpg', '0aa3ba843487c814c0f8c553fe2b57af.jpg', 'image/jpeg', 'public', 467584, '[]', '[]', '[]', 80, '2023-07-02 22:57:37', '2023-07-02 22:57:37'),
(82, 'MixCode\\User', 'a8939a64-33ad-46ec-8937-4aa4cf389af4', 'user_image', '574f7138805fbde3284c727c568f5b0a.jpg', '574f7138805fbde3284c727c568f5b0a.jpg', 'image/jpeg', 'public', 25748, '[]', '[]', '[]', 81, '2023-07-02 22:57:37', '2023-07-02 22:57:37'),
(83, 'MixCode\\User', 'a8939a64-33ad-46ec-8937-4aa4cf389af4', 'user_image_logo', 'accf81edb3e2ec15263bccec1ec92f40.jpg', 'accf81edb3e2ec15263bccec1ec92f40.jpg', 'image/jpeg', 'public', 813060, '[]', '[]', '[]', 82, '2023-07-02 23:10:10', '2023-07-02 23:10:10'),
(84, 'MixCode\\User', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', 'user_image_logo', '652801082962e6c2ce838fc8796dc50c.jpg', '652801082962e6c2ce838fc8796dc50c.jpg', 'image/jpeg', 'public', 1302187, '[]', '[]', '[]', 83, '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
(85, 'MixCode\\User', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', 'user_file_commercial_license', '43ce83d58a85ec8dfd9d993ccd6c2914.jpg', '43ce83d58a85ec8dfd9d993ccd6c2914.jpg', 'image/jpeg', 'public', 1356962, '[]', '[]', '[]', 84, '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
(86, 'MixCode\\Product', '39dc61dd-0f6b-40b6-94a7-66c4815699f1', 'product_image', '50a279afbe0252349c0c195f20bf63b2.jpg', '50a279afbe0252349c0c195f20bf63b2.jpg', 'image/jpeg', 'public', 152470, '[]', '[]', '[]', 85, '2023-07-04 13:32:00', '2023-07-04 13:32:00'),
(87, 'MixCode\\Banner', 'c49b6429-a7d1-4a83-8ade-60ef9edba75f', 'banner_image', 'bb2af1bc72a85bd82c10d825cac7d59f.png', 'bb2af1bc72a85bd82c10d825cac7d59f.png', 'image/png', 'public', 488550, '[]', '[]', '[]', 86, '2023-07-06 14:03:16', '2023-07-06 14:03:16'),
(88, 'MixCode\\User', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 'user_image_logo', 'fae7d073ebe2fdbe6bcc7431abb4557b.jpg', 'fae7d073ebe2fdbe6bcc7431abb4557b.jpg', 'image/jpeg', 'public', 1926620, '[]', '[]', '[]', 87, '2023-07-07 13:52:10', '2023-07-07 13:52:10'),
(89, 'MixCode\\User', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 'user_file_commercial_license', 'da2363e8b6e4800089ef5c0a73e31939.jpg', 'da2363e8b6e4800089ef5c0a73e31939.jpg', 'image/jpeg', 'public', 1571004, '[]', '[]', '[]', 88, '2023-07-07 13:52:10', '2023-07-07 13:52:10'),
(90, 'MixCode\\Product', '0ce5bb80-c155-4ec8-9477-222f75b81de5', 'product_image', '2309d2b8923a6a1a92e3afe0c127d0cf.jpg', '2309d2b8923a6a1a92e3afe0c127d0cf.jpg', 'image/jpeg', 'public', 1035692, '[]', '[]', '[]', 89, '2023-07-07 13:53:49', '2023-07-07 13:53:49'),
(91, 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', 'user_file_vehicle_license', 'bbaf7cf8e8e5a9f6b8d447a545cd013f.jpg', 'bbaf7cf8e8e5a9f6b8d447a545cd013f.jpg', 'image/jpeg', 'public', 2563958, '[]', '[]', '[]', 90, '2023-07-08 11:10:32', '2023-07-08 11:10:32'),
(92, 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', 'user_image', '508805629ff1ec51fcdb47321a440776.jpg', '508805629ff1ec51fcdb47321a440776.jpg', 'image/jpeg', 'public', 2563958, '[]', '[]', '[]', 91, '2023-07-08 11:10:32', '2023-07-08 11:10:32'),
(97, 'MixCode\\User', '642ef59f-9127-4799-a724-93de4af6c3d0', 'user_file_commercial_license', 'c8dade5f5731b837966849248816900e.jpg', 'c8dade5f5731b837966849248816900e.jpg', 'image/jpeg', 'public', 162369, '[]', '[]', '[]', 96, '2023-07-14 23:47:20', '2023-07-14 23:47:20'),
(98, 'MixCode\\Product', '12d3a5ba-8b7e-454f-b86b-6c4b6dddcd57', 'product_image', 'a2c3d8334155cd7b46a1e44893c7849b.jpg', 'a2c3d8334155cd7b46a1e44893c7849b.jpg', 'image/jpeg', 'public', 103595, '[]', '[]', '[]', 97, '2023-07-15 01:15:19', '2023-07-15 01:15:19'),
(99, 'MixCode\\Product', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', 'product_image', 'a2c3d8334155cd7b46a1e44893c7849b.jpg', 'a2c3d8334155cd7b46a1e44893c7849b.jpg', 'image/jpeg', 'public', 103595, '[]', '[]', '[]', 98, '2023-07-15 01:17:08', '2023-07-15 01:17:08'),
(100, 'MixCode\\Product', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', 'product_image', '1e39c15d6ce7c5bdd434db1678b5197e.jpg', '1e39c15d6ce7c5bdd434db1678b5197e.jpg', 'image/jpeg', 'public', 609999, '[]', '[]', '[]', 99, '2023-07-15 01:46:32', '2023-07-15 01:46:32'),
(101, 'MixCode\\Product', '47e309f0-1427-40ca-b3ad-45792c8419a7', 'product_image', '7c90a16ba5c5d5047767604e5fa0f56f.jpg', '7c90a16ba5c5d5047767604e5fa0f56f.jpg', 'image/jpeg', 'public', 786599, '[]', '[]', '[]', 100, '2023-07-15 01:47:42', '2023-07-15 01:47:42'),
(102, 'MixCode\\Product', '2767bad9-fced-4621-a584-110e80c7a37f', 'product_image', '2309d2b8923a6a1a92e3afe0c127d0cf.jpg', '2309d2b8923a6a1a92e3afe0c127d0cf.jpg', 'image/jpeg', 'public', 1035692, '[]', '[]', '[]', 101, '2023-07-15 01:49:36', '2023-07-15 01:49:36'),
(103, 'MixCode\\User', 'dde7f74c-0da5-45ec-830a-68ae09c15795', 'user_file_vehicle_license', 'cbaf8ab31ab4c652cc61d7b1b41ddf24.jpg', 'cbaf8ab31ab4c652cc61d7b1b41ddf24.jpg', 'image/jpeg', 'public', 2129903, '[]', '[]', '[]', 102, '2023-07-15 02:44:38', '2023-07-15 02:44:38'),
(104, 'MixCode\\User', 'dde7f74c-0da5-45ec-830a-68ae09c15795', 'user_image', '84c7fc82590de4f66bfcf47f97025504.jpg', '84c7fc82590de4f66bfcf47f97025504.jpg', 'image/jpeg', 'public', 1485301, '[]', '[]', '[]', 103, '2023-07-15 02:44:38', '2023-07-15 02:44:38'),
(105, 'MixCode\\User', '4741a263-154a-4f63-b75a-a358c6581398', 'user_image_logo', '96ab31abd066874e4ca4e325c3639abd.jpg', '96ab31abd066874e4ca4e325c3639abd.jpg', 'image/jpeg', 'public', 159438, '[]', '[]', '[]', 104, '2023-07-20 14:16:22', '2023-07-20 14:16:22'),
(106, 'MixCode\\User', '71a50ee7-7db9-466f-a46c-9d9a1ca05118', 'user_file_vehicle_license', 'ef58df11279369998354c4e4e2c8eed7.jpg', 'ef58df11279369998354c4e4e2c8eed7.jpg', 'image/jpeg', 'public', 1966070, '[]', '[]', '[]', 105, '2023-07-21 14:43:35', '2023-07-21 14:43:35'),
(109, 'MixCode\\User', '71a50ee7-7db9-466f-a46c-9d9a1ca05118', 'user_image_logo', '280f0137f9dfbb4b2aacc3eff1c7bcf8.jpg', '280f0137f9dfbb4b2aacc3eff1c7bcf8.jpg', 'image/jpeg', 'public', 543069, '[]', '[]', '[]', 108, '2023-07-21 14:47:47', '2023-07-21 14:47:47'),
(110, 'MixCode\\User', '642ef59f-9127-4799-a724-93de4af6c3d0', 'user_image_logo', '2cf95978489b0ce709686538976ac51b.jpg', '2cf95978489b0ce709686538976ac51b.jpg', 'image/jpeg', 'public', 141731, '[]', '[]', '[]', 109, '2023-07-22 17:49:31', '2023-07-22 17:49:31'),
(111, 'MixCode\\User', '1936d2aa-7372-4a68-86de-5863e861effc', 'user_file_vehicle_license', '96a7883d7c3e3df6a42349faaa9d53f1.jpg', '96a7883d7c3e3df6a42349faaa9d53f1.jpg', 'image/jpeg', 'public', 2003352, '[]', '[]', '[]', 110, '2023-07-24 15:33:20', '2023-07-24 15:33:20'),
(112, 'MixCode\\User', '1936d2aa-7372-4a68-86de-5863e861effc', 'user_image', '4e28eda6588d2b4f09f63023bf95d048.jpg', '4e28eda6588d2b4f09f63023bf95d048.jpg', 'image/jpeg', 'public', 225628, '[]', '[]', '[]', 111, '2023-07-24 15:33:20', '2023-07-24 15:33:20'),
(113, 'MixCode\\User', '74062592-eb3d-452b-bd1b-bc35ff497d9a', 'user_image_logo', '3f913870ab6cea1ab858f883d4d536a6.jpg', '3f913870ab6cea1ab858f883d4d536a6.jpg', 'image/jpeg', 'public', 53033, '[]', '[]', '[]', 112, '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
(114, 'MixCode\\User', '74062592-eb3d-452b-bd1b-bc35ff497d9a', 'user_file_commercial_license', '75c69c969f6614ac56fa5b147dab2749.jpg', '75c69c969f6614ac56fa5b147dab2749.jpg', 'image/jpeg', 'public', 1467586, '[]', '[]', '[]', 113, '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
(115, 'MixCode\\Product', 'ed238263-fd1f-4c67-8008-2bbbcfc303b6', 'product_image', 'fb90848258dbf073be5a73bf70f2566e.jpg', 'fb90848258dbf073be5a73bf70f2566e.jpg', 'image/jpeg', 'public', 66400, '[]', '[]', '[]', 114, '2023-07-24 18:20:44', '2023-07-24 18:20:44'),
(116, 'MixCode\\Product', 'ed238263-fd1f-4c67-8008-2bbbcfc303b6', 'product_image', '81117aca122e7f05d5b69fc81c646a17.jpg', '81117aca122e7f05d5b69fc81c646a17.jpg', 'image/jpeg', 'public', 82260, '[]', '[]', '[]', 115, '2023-07-24 18:20:44', '2023-07-24 18:20:44'),
(117, 'MixCode\\User', '3f9eb13e-98d2-4219-99d6-6dc6fda39a02', 'user_file_vehicle_license', '39bb984e72de3d522d27be66aeafd279.jpg', '39bb984e72de3d522d27be66aeafd279.jpg', 'image/jpeg', 'public', 1654242, '[]', '[]', '[]', 116, '2023-07-25 00:18:22', '2023-07-25 00:18:22'),
(118, 'MixCode\\User', '3f9eb13e-98d2-4219-99d6-6dc6fda39a02', 'user_image', '5871f95a5a644371a09c739ded65cea4.jpg', '5871f95a5a644371a09c739ded65cea4.jpg', 'image/jpeg', 'public', 31717, '[]', '[]', '[]', 117, '2023-07-25 00:18:22', '2023-07-25 00:18:22'),
(119, 'MixCode\\Product', 'cafd0959-f830-454b-b388-abe599594fa8', 'product_image', 'fb90848258dbf073be5a73bf70f2566e.jpg', 'fb90848258dbf073be5a73bf70f2566e.jpg', 'image/jpeg', 'public', 66400, '[]', '[]', '[]', 118, '2023-07-25 00:27:34', '2023-07-25 00:27:34'),
(120, 'MixCode\\User', '329b6a7b-c11a-4533-941a-7747b2615d9b', 'user_image_logo', 'fb90848258dbf073be5a73bf70f2566e.jpg', 'fb90848258dbf073be5a73bf70f2566e.jpg', 'image/jpeg', 'public', 66400, '[]', '[]', '[]', 119, '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
(121, 'MixCode\\User', '329b6a7b-c11a-4533-941a-7747b2615d9b', 'user_file_commercial_license', '86544e7b1dadbc96319d849fdc957a87.jpg', '86544e7b1dadbc96319d849fdc957a87.jpg', 'image/jpeg', 'public', 50351, '[]', '[]', '[]', 120, '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
(122, 'MixCode\\Product', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', 'product_image', '81117aca122e7f05d5b69fc81c646a17.jpg', '81117aca122e7f05d5b69fc81c646a17.jpg', 'image/jpeg', 'public', 82260, '[]', '[]', '[]', 121, '2023-07-25 00:34:02', '2023-07-25 00:34:02'),
(123, 'MixCode\\User', '50a3827b-db2f-4edf-bb48-0779dbf29410', 'user_file_vehicle_license', 'ac017788033f76010ae48d70857543c4.jpg', 'ac017788033f76010ae48d70857543c4.jpg', 'image/jpeg', 'public', 2092220, '[]', '[]', '[]', 122, '2023-07-25 01:26:03', '2023-07-25 01:26:03'),
(124, 'MixCode\\User', '50a3827b-db2f-4edf-bb48-0779dbf29410', 'user_image', '5871f95a5a644371a09c739ded65cea4.jpg', '5871f95a5a644371a09c739ded65cea4.jpg', 'image/jpeg', 'public', 31717, '[]', '[]', '[]', 123, '2023-07-25 01:26:03', '2023-07-25 01:26:03'),
(125, 'MixCode\\User', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'user_image_logo', '142a541b299efaa594d1235ec5206479.jpg', '142a541b299efaa594d1235ec5206479.jpg', 'image/jpeg', 'public', 767855, '[]', '[]', '[]', 124, '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
(126, 'MixCode\\User', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'user_file_commercial_license', '5e28751aef3114db0a65e0e06e92395c.jpg', '5e28751aef3114db0a65e0e06e92395c.jpg', 'image/jpeg', 'public', 4243394, '[]', '[]', '[]', 125, '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
(127, 'MixCode\\Product', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', 'product_image', '7274cd8179bdf1951f778a6531f81b3c.jpg', '7274cd8179bdf1951f778a6531f81b3c.jpg', 'image/jpeg', 'public', 1328644, '[]', '[]', '[]', 126, '2023-07-25 01:53:22', '2023-07-25 01:53:22'),
(128, 'MixCode\\User', '6af62f61-559e-4838-9c4c-706060c46bbb', 'user_file_vehicle_license', 'd29184cec8d32feee215a32ea1d3e10e.jpg', 'd29184cec8d32feee215a32ea1d3e10e.jpg', 'image/jpeg', 'public', 1580721, '[]', '[]', '[]', 127, '2023-07-25 01:56:51', '2023-07-25 01:56:51'),
(129, 'MixCode\\User', '6af62f61-559e-4838-9c4c-706060c46bbb', 'user_image', '5871f95a5a644371a09c739ded65cea4.jpg', '5871f95a5a644371a09c739ded65cea4.jpg', 'image/jpeg', 'public', 31717, '[]', '[]', '[]', 128, '2023-07-25 01:56:51', '2023-07-25 01:56:51'),
(130, 'MixCode\\User', '3369a308-6ee2-439e-b03a-37a62ca20974', 'user_image_logo', '6c63e9802c808ed30b027f3644cd08c4.jpg', '6c63e9802c808ed30b027f3644cd08c4.jpg', 'image/jpeg', 'public', 99737, '[]', '[]', '[]', 129, '2023-07-25 04:37:45', '2023-07-25 04:37:45'),
(131, 'MixCode\\User', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'user_image_logo', '57fd790c0bb1b621ba0b5ce7b65e0286.jpg', '57fd790c0bb1b621ba0b5ce7b65e0286.jpg', 'image/jpeg', 'public', 281073, '[]', '[]', '[]', 130, '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
(132, 'MixCode\\User', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'user_file_commercial_license', '0a0782bf1ef2a89c888441d16029d2f5.jpg', '0a0782bf1ef2a89c888441d16029d2f5.jpg', 'image/jpeg', 'public', 123076, '[]', '[]', '[]', 131, '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
(133, 'MixCode\\Product', '3e6e259a-3969-4168-a924-9dbf1f296f03', 'product_image', '92bf974bbc23d80c230bddf1666d7c55.jpg', '92bf974bbc23d80c230bddf1666d7c55.jpg', 'image/jpeg', 'public', 767835, '[]', '[]', '[]', 132, '2023-08-07 00:23:15', '2023-08-07 00:23:15'),
(134, 'MixCode\\Product', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', 'product_image', '7274cd8179bdf1951f778a6531f81b3c.jpg', '7274cd8179bdf1951f778a6531f81b3c.jpg', 'image/jpeg', 'public', 1328644, '[]', '[]', '[]', 133, '2023-08-07 00:25:43', '2023-08-07 00:25:43'),
(135, 'MixCode\\Product', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', 'product_image', '60c8aeb319250e34287020e09c0ab0fe.jpg', '60c8aeb319250e34287020e09c0ab0fe.jpg', 'image/jpeg', 'public', 727772, '[]', '[]', '[]', 134, '2023-08-07 00:25:43', '2023-08-07 00:25:43'),
(136, 'MixCode\\Product', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', 'product_image', 'dffdd57a87da1f7f16309e1ab6909739.jpg', 'dffdd57a87da1f7f16309e1ab6909739.jpg', 'image/jpeg', 'public', 658074, '[]', '[]', '[]', 135, '2023-08-07 00:25:43', '2023-08-07 00:25:43'),
(137, 'MixCode\\User', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', 'user_file_vehicle_license', '71b2d5f9b4a9e9eeeeb19667f108c952.jpg', '71b2d5f9b4a9e9eeeeb19667f108c952.jpg', 'image/jpeg', 'public', 1346514, '[]', '[]', '[]', 136, '2023-08-08 01:29:37', '2023-08-08 01:29:37'),
(138, 'MixCode\\User', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', 'user_image', 'ee3e7a2f2602f1e59523713db1735b19.jpg', 'ee3e7a2f2602f1e59523713db1735b19.jpg', 'image/jpeg', 'public', 478216, '[]', '[]', '[]', 137, '2023-08-08 01:29:37', '2023-08-08 01:29:37'),
(139, 'MixCode\\User', '350c0570-c215-47ed-a5e2-9004652b91b4', 'user_file_vehicle_license', '39de40edd1422f15b74fd1b1f0220dc9.jpg', '39de40edd1422f15b74fd1b1f0220dc9.jpg', 'image/jpeg', 'public', 431330, '[]', '[]', '[]', 138, '2023-08-16 03:48:45', '2023-08-16 03:48:45'),
(140, 'MixCode\\User', '350c0570-c215-47ed-a5e2-9004652b91b4', 'user_image', '7fdc1a630c238af0815181f9faa190f5.jpg', '7fdc1a630c238af0815181f9faa190f5.jpg', 'image/jpeg', 'public', 12572, '[]', '[]', '[]', 139, '2023-08-16 03:48:45', '2023-08-16 03:48:45'),
(141, 'MixCode\\User', 'fb751d69-9fe2-4017-948f-134a1117c41f', 'user_image_logo', '7274cd8179bdf1951f778a6531f81b3c.jpg', '7274cd8179bdf1951f778a6531f81b3c.jpg', 'image/jpeg', 'public', 1328644, '[]', '[]', '[]', 140, '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
(142, 'MixCode\\User', 'fb751d69-9fe2-4017-948f-134a1117c41f', 'user_file_commercial_license', '7ed5bd3a03988e0d6364e91e630c91ef.jpg', '7ed5bd3a03988e0d6364e91e630c91ef.jpg', 'image/jpeg', 'public', 3471373, '[]', '[]', '[]', 141, '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
(143, 'MixCode\\Product', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', 'product_image', '0a0782bf1ef2a89c888441d16029d2f5.jpg', '0a0782bf1ef2a89c888441d16029d2f5.jpg', 'image/jpeg', 'public', 123076, '[]', '[]', '[]', 142, '2023-08-20 14:12:29', '2023-08-20 14:12:29'),
(144, 'MixCode\\Product', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', 'product_image', '92bf974bbc23d80c230bddf1666d7c55.jpg', '92bf974bbc23d80c230bddf1666d7c55.jpg', 'image/jpeg', 'public', 767835, '[]', '[]', '[]', 143, '2023-08-20 14:12:29', '2023-08-20 14:12:29'),
(145, 'MixCode\\User', 'e483a3d0-e520-4709-baad-d7e500389c77', 'user_file_vehicle_license', '1b1df96e39f0731f7fd8bad2f2ecd4eb.jpg', '1b1df96e39f0731f7fd8bad2f2ecd4eb.jpg', 'image/jpeg', 'public', 1912729, '[]', '[]', '[]', 144, '2023-08-20 14:17:53', '2023-08-20 14:17:53'),
(146, 'MixCode\\User', 'e483a3d0-e520-4709-baad-d7e500389c77', 'user_image', '77f466a8e5e01378c997a8dbee0b568a.jpg', '77f466a8e5e01378c997a8dbee0b568a.jpg', 'image/jpeg', 'public', 197693, '[]', '[]', '[]', 145, '2023-08-20 14:17:53', '2023-08-20 14:17:53'),
(147, 'MixCode\\User', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', 'user_file_vehicle_license', '2c3477cbbd7a9f671153ff32106881fa.jpg', '2c3477cbbd7a9f671153ff32106881fa.jpg', 'image/jpeg', 'public', 1845541, '[]', '[]', '[]', 146, '2023-08-20 14:22:52', '2023-08-20 14:22:52'),
(148, 'MixCode\\User', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', 'user_image', '77f466a8e5e01378c997a8dbee0b568a.jpg', '77f466a8e5e01378c997a8dbee0b568a.jpg', 'image/jpeg', 'public', 197693, '[]', '[]', '[]', 147, '2023-08-20 14:22:52', '2023-08-20 14:22:52'),
(149, 'MixCode\\User', 'ebf3adb2-f4d7-4b86-bc45-4f0da3edebcd', 'user_file_vehicle_license', 'c09b076a42dff3102c8a80d312ef4892.jpg', 'c09b076a42dff3102c8a80d312ef4892.jpg', 'image/jpeg', 'public', 6043852, '[]', '[]', '[]', 148, '2023-08-22 02:43:53', '2023-08-22 02:43:53'),
(150, 'MixCode\\User', 'ebf3adb2-f4d7-4b86-bc45-4f0da3edebcd', 'user_image', 'ee7fc7ac14eb235b853799c07386e543.jpg', 'ee7fc7ac14eb235b853799c07386e543.jpg', 'image/jpeg', 'public', 228084, '[]', '[]', '[]', 149, '2023-08-22 02:43:54', '2023-08-22 02:43:54'),
(151, 'MixCode\\User', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'user_file_vehicle_license', '2e494f38d536c2f40f1fb41f8f30af0c.jpg', '2e494f38d536c2f40f1fb41f8f30af0c.jpg', 'image/jpeg', 'public', 4748856, '[]', '[]', '[]', 150, '2023-08-22 03:30:42', '2023-08-22 03:30:42'),
(152, 'MixCode\\User', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'user_image', 'ee7fc7ac14eb235b853799c07386e543.jpg', 'ee7fc7ac14eb235b853799c07386e543.jpg', 'image/jpeg', 'public', 228084, '[]', '[]', '[]', 151, '2023-08-22 03:30:42', '2023-08-22 03:30:42'),
(153, 'MixCode\\User', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', 'user_image_logo', '142a541b299efaa594d1235ec5206479.jpg', '142a541b299efaa594d1235ec5206479.jpg', 'image/jpeg', 'public', 767855, '[]', '[]', '[]', 152, '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
(154, 'MixCode\\User', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', 'user_file_commercial_license', 'fba434e7abf7b42493a3d060b4444a35.jpg', 'fba434e7abf7b42493a3d060b4444a35.jpg', 'image/jpeg', 'public', 227555, '[]', '[]', '[]', 153, '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
(155, 'MixCode\\User', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', 'user_image_logo', '142a541b299efaa594d1235ec5206479.jpg', '142a541b299efaa594d1235ec5206479.jpg', 'image/jpeg', 'public', 767855, '[]', '[]', '[]', 154, '2023-08-24 03:58:20', '2023-08-24 03:58:20'),
(156, 'MixCode\\User', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', 'user_file_commercial_license', 'ce3646745689f1ec99b25542dde6c7f8.jpg', 'ce3646745689f1ec99b25542dde6c7f8.jpg', 'image/jpeg', 'public', 5750344, '[]', '[]', '[]', 155, '2023-08-24 03:58:20', '2023-08-24 03:58:20'),
(157, 'MixCode\\User', 'f63ba367-6a3c-486b-8181-5e474c6a6369', 'user_image_logo', '142a541b299efaa594d1235ec5206479.jpg', '142a541b299efaa594d1235ec5206479.jpg', 'image/jpeg', 'public', 767855, '[]', '[]', '[]', 156, '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
(158, 'MixCode\\User', 'f63ba367-6a3c-486b-8181-5e474c6a6369', 'user_file_commercial_license', 'b862b96b1f3ba02a3eff46c54de3f503.jpg', 'b862b96b1f3ba02a3eff46c54de3f503.jpg', 'image/jpeg', 'public', 158256, '[]', '[]', '[]', 157, '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
(159, 'MixCode\\Categorization', 'a7e7bd64-5ceb-4937-b013-e5927b9c56d7', 'categorization_image_icon', '4b992841372c7cc564b69cf5a4131528.jpg', '4b992841372c7cc564b69cf5a4131528.jpg', 'image/jpeg', 'public', 1754840, '[]', '[]', '[]', 158, '2023-09-05 02:26:38', '2023-09-05 02:26:38'),
(160, 'MixCode\\Category', 'd897ee02-db56-402b-9477-e045f92cf2c1', 'category_image_icon', 'd9612af5774ade22b3ff7d7e864c844e.jpg', 'd9612af5774ade22b3ff7d7e864c844e.jpg', 'image/jpeg', 'public', 1751995, '[]', '[]', '[]', 159, '2023-09-05 02:29:05', '2023-09-05 02:29:05'),
(161, 'MixCode\\Product', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', 'product_image', '0a0782bf1ef2a89c888441d16029d2f5.jpg', '0a0782bf1ef2a89c888441d16029d2f5.jpg', 'image/jpeg', 'public', 123076, '[]', '[]', '[]', 160, '2023-09-05 02:31:16', '2023-09-05 02:31:16'),
(162, 'MixCode\\User', '85922729-2c24-4638-afe2-db5cc99daeb5', 'user_image_logo', 'f169fd97fdfc9c4b132035f991a16270.jpg', 'f169fd97fdfc9c4b132035f991a16270.jpg', 'image/jpeg', 'public', 123363, '[]', '[]', '[]', 161, '2023-09-05 13:00:41', '2023-09-05 13:00:41'),
(164, 'MixCode\\Product', 'ea8bce24-d55c-402f-bd18-aea0afb11aa4', 'product_image', '7b65eb0288db2e3006ce17ec647dd930.jpg', '7b65eb0288db2e3006ce17ec647dd930.jpg', 'image/jpeg', 'public', 127937, '[]', '[]', '[]', 163, '2023-09-05 13:05:54', '2023-09-05 13:05:54'),
(165, 'MixCode\\User', 'aa5abc27-6e24-42b0-a770-a7addd3f31c4', 'user_image_logo', '21da7c8d779aa74c7469f562df15ae97.jpg', '21da7c8d779aa74c7469f562df15ae97.jpg', 'image/jpeg', 'public', 83457, '[]', '[]', '[]', 164, '2023-09-06 23:36:07', '2023-09-06 23:36:07'),
(166, 'MixCode\\User', '0c968939-7f0c-45b8-905d-3731d9a423b1', 'user_image_logo', '21da7c8d779aa74c7469f562df15ae97.jpg', '21da7c8d779aa74c7469f562df15ae97.jpg', 'image/jpeg', 'public', 83457, '[]', '[]', '[]', 165, '2023-09-06 23:45:47', '2023-09-06 23:45:47'),
(167, 'MixCode\\User', '0c968939-7f0c-45b8-905d-3731d9a423b1', 'user_file_commercial_license', 'c82c3585217275cc68aaa81f3139bcb2.jpg', 'c82c3585217275cc68aaa81f3139bcb2.jpg', 'image/jpeg', 'public', 9942464, '[]', '[]', '[]', 166, '2023-09-06 23:45:47', '2023-09-06 23:45:47'),
(168, 'MixCode\\User', 'ea2cfdfc-97e0-4444-9b57-51f68dd43dd1', 'user_file_vehicle_license', '0bdd65da74571b4e55fb48ec9236f3cd.jpg', '0bdd65da74571b4e55fb48ec9236f3cd.jpg', 'image/jpeg', 'public', 1725701, '[]', '[]', '[]', 167, '2023-09-07 02:30:15', '2023-09-07 02:30:15'),
(169, 'MixCode\\User', 'ea2cfdfc-97e0-4444-9b57-51f68dd43dd1', 'user_image', 'eb889e180adbf0c620689c1b0bbbb327.jpg', 'eb889e180adbf0c620689c1b0bbbb327.jpg', 'image/jpeg', 'public', 61881, '[]', '[]', '[]', 168, '2023-09-07 02:30:15', '2023-09-07 02:30:15'),
(170, 'MixCode\\User', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', 'user_file_vehicle_license', 'b4b17b8da0d31247bf7f315cbf3157ce.jpg', 'b4b17b8da0d31247bf7f315cbf3157ce.jpg', 'image/jpeg', 'public', 1365035, '[]', '[]', '[]', 169, '2023-09-07 02:37:01', '2023-09-07 02:37:01'),
(171, 'MixCode\\User', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', 'user_image', 'd08b5757a9f91b4245e52cde7e1115cf.jpg', 'd08b5757a9f91b4245e52cde7e1115cf.jpg', 'image/jpeg', 'public', 136468, '[]', '[]', '[]', 170, '2023-09-07 02:37:01', '2023-09-07 02:37:01'),
(172, 'MixCode\\User', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 'user_image_logo', '74e0faba3cbe614b3407434e397c94ba.jpg', '74e0faba3cbe614b3407434e397c94ba.jpg', 'image/jpeg', 'public', 78696, '[]', '[]', '[]', 171, '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
(173, 'MixCode\\User', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 'user_file_commercial_license', 'a23f5a727746d51ddf3db9a7d41c3dad.jpg', 'a23f5a727746d51ddf3db9a7d41c3dad.jpg', 'image/jpeg', 'public', 1536480, '[]', '[]', '[]', 172, '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
(174, 'MixCode\\Product', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', 'product_image', '71db25379ecfe8785e77340e01d16887.jpg', '71db25379ecfe8785e77340e01d16887.jpg', 'image/jpeg', 'public', 31135, '[]', '[]', '[]', 173, '2023-10-11 13:21:12', '2023-10-11 13:21:12'),
(175, 'MixCode\\Product', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', 'product_image', '246f9636356f7948efc90f738971c85a.jpg', '246f9636356f7948efc90f738971c85a.jpg', 'image/jpeg', 'public', 83191, '[]', '[]', '[]', 174, '2023-10-11 13:21:12', '2023-10-11 13:21:12'),
(176, 'MixCode\\User', '489731f2-960b-4f66-a74f-73276b1aff4c', 'user_file_vehicle_license', '669fbabd8a1e4c0631f46e281a0ee14c.jpg', '669fbabd8a1e4c0631f46e281a0ee14c.jpg', 'image/jpeg', 'public', 4190026, '[]', '[]', '[]', 175, '2023-10-15 23:50:36', '2023-10-15 23:50:36'),
(177, 'MixCode\\User', '489731f2-960b-4f66-a74f-73276b1aff4c', 'user_image', 'a5ad459a3670e3812b87ac775e23815c.jpg', 'a5ad459a3670e3812b87ac775e23815c.jpg', 'image/jpeg', 'public', 139640, '[]', '[]', '[]', 176, '2023-10-15 23:50:38', '2023-10-15 23:50:38'),
(178, 'MixCode\\Banner', '23670c9f-d438-40f8-a5e1-4531cf60d29a', 'banner_image', 'fba285a909e211a513dd8896a2c7d447.mp4', 'fba285a909e211a513dd8896a2c7d447.mp4', 'video/mp4', 'public', 2922346, '[]', '[]', '[]', 177, '2023-10-16 02:44:15', '2023-10-16 02:44:15'),
(180, 'MixCode\\Banner', 'a564328a-8599-419e-8ba6-f8bd51f83ed5', 'banner_image', '56ff334734a74e082347dbf1a0a37c03.jpg', '56ff334734a74e082347dbf1a0a37c03.jpg', 'image/jpeg', 'public', 160261, '[]', '[]', '[]', 178, '2023-10-16 02:47:35', '2023-10-16 02:47:35'),
(181, 'MixCode\\Banner', '8f24ac75-1814-4e3f-8d1c-fb090c54777e', 'banner_image', 'da07f09f9eb4a63055a31e579df10416.jpg', 'da07f09f9eb4a63055a31e579df10416.jpg', 'image/jpeg', 'public', 138078, '[]', '[]', '[]', 179, '2023-10-16 02:49:39', '2023-10-16 02:49:39'),
(182, 'MixCode\\Banner', 'b0e3f196-51bc-4a01-a806-618653e871c3', 'banner_image', 'a342629153c5b56a53f4c97b5b9b0f0a.jpg', 'a342629153c5b56a53f4c97b5b9b0f0a.jpg', 'image/jpeg', 'public', 59238, '[]', '[]', '[]', 180, '2023-10-16 02:50:08', '2023-10-16 02:50:08'),
(183, 'MixCode\\User', 'ff4f1965-7068-4d8c-a7e4-b448830ccaed', 'user_file_vehicle_license', '0b1f2537fd75d591540b71d8363532cd.jpg', '0b1f2537fd75d591540b71d8363532cd.jpg', 'image/jpeg', 'public', 3816088, '[]', '[]', '[]', 181, '2023-10-27 18:30:14', '2023-10-27 18:30:14'),
(184, 'MixCode\\User', 'ff4f1965-7068-4d8c-a7e4-b448830ccaed', 'user_image', 'b5e8cd25e70634da72e2d839b638adc5.jpg', 'b5e8cd25e70634da72e2d839b638adc5.jpg', 'image/jpeg', 'public', 115027, '[]', '[]', '[]', 182, '2023-10-27 18:30:15', '2023-10-27 18:30:15'),
(185, 'MixCode\\User', '28b1178e-0380-4440-862c-96e27d2ad2d2', 'user_image_logo', 'e77f086d818ce192405b0b74d30301be.jpg', 'e77f086d818ce192405b0b74d30301be.jpg', 'image/jpeg', 'public', 728320, '[]', '[]', '[]', 183, '2023-10-30 02:42:15', '2023-10-30 02:42:15'),
(186, 'MixCode\\User', '28b1178e-0380-4440-862c-96e27d2ad2d2', 'user_file_commercial_license', '93bf82b6ed461ddadac13870212f9174.jpg', '93bf82b6ed461ddadac13870212f9174.jpg', 'image/jpeg', 'public', 6020994, '[]', '[]', '[]', 184, '2023-10-30 02:42:15', '2023-10-30 02:42:15'),
(187, 'MixCode\\Product', '247aff22-c120-4cad-8930-3efda6a906d2', 'product_image', 'ac7c17350cc6b8dc9bf1cfb29c12f104.jpg', 'ac7c17350cc6b8dc9bf1cfb29c12f104.jpg', 'image/jpeg', 'public', 882972, '[]', '[]', '[]', 185, '2023-10-30 02:44:39', '2023-10-30 02:44:39'),
(188, 'MixCode\\Product', '247aff22-c120-4cad-8930-3efda6a906d2', 'product_image', '39de40edd1422f15b74fd1b1f0220dc9.jpg', '39de40edd1422f15b74fd1b1f0220dc9.jpg', 'image/jpeg', 'public', 431330, '[]', '[]', '[]', 186, '2023-10-30 02:44:39', '2023-10-30 02:44:39'),
(189, 'MixCode\\User', '852d76b7-0396-484b-a1da-81e627069be0', 'user_file_vehicle_license', 'cbd798307f05c473d96926e3f8776d47.jpg', 'cbd798307f05c473d96926e3f8776d47.jpg', 'image/jpeg', 'public', 3878711, '[]', '[]', '[]', 187, '2023-10-30 02:52:22', '2023-10-30 02:52:22'),
(190, 'MixCode\\User', '852d76b7-0396-484b-a1da-81e627069be0', 'user_image', 'b5e8cd25e70634da72e2d839b638adc5.jpg', 'b5e8cd25e70634da72e2d839b638adc5.jpg', 'image/jpeg', 'public', 115027, '[]', '[]', '[]', 188, '2023-10-30 02:52:23', '2023-10-30 02:52:23'),
(191, 'MixCode\\User', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 'user_file_vehicle_license', '9b38bc8290f6250b944729b0d1914356.jpg', '9b38bc8290f6250b944729b0d1914356.jpg', 'image/jpeg', 'public', 4333720, '[]', '[]', '[]', 189, '2023-11-02 17:08:24', '2023-11-02 17:08:24'),
(192, 'MixCode\\User', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 'user_image', '13006bcd91917be383eb54f7e6107635.jpg', '13006bcd91917be383eb54f7e6107635.jpg', 'image/jpeg', 'public', 72456, '[]', '[]', '[]', 190, '2023-11-02 17:08:26', '2023-11-02 17:08:26'),
(193, 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'user_image_logo', 'ab91913d1228600434c1c5b2be17cc05.jpg', 'ab91913d1228600434c1c5b2be17cc05.jpg', 'image/jpeg', 'public', 385865, '[]', '[]', '[]', 191, '2023-11-03 22:06:11', '2023-11-03 22:06:11'),
(194, 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'user_file_commercial_license', 'f89b2f23d81edadef619e643f8b78265.jpg', 'f89b2f23d81edadef619e643f8b78265.jpg', 'image/jpeg', 'public', 5465981, '[]', '[]', '[]', 192, '2023-11-03 22:06:11', '2023-11-03 22:06:11'),
(195, 'MixCode\\Product', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', 'product_image', '1d68ba48f766606c7d52f26963a98556.jpg', '1d68ba48f766606c7d52f26963a98556.jpg', 'image/jpeg', 'public', 616759, '[]', '[]', '[]', 193, '2023-11-03 22:17:42', '2023-11-03 22:17:42'),
(197, 'MixCode\\Banner', 'dec63660-49e6-4ff6-ae0f-3ce70b5fb8d9', 'banner_image', 'f2ce09be91e3b85edc205f518bab9a2a.jpg', 'f2ce09be91e3b85edc205f518bab9a2a.jpg', 'image/jpeg', 'public', 137102, '[]', '[]', '[]', 194, '2023-11-25 14:43:24', '2023-11-25 14:43:24'),
(198, 'MixCode\\Banner', 'e9d382ba-c759-48de-887b-c06236125465', 'banner_image', '8debd5db580afda04fabc62fe5f7ea82.jpg', '8debd5db580afda04fabc62fe5f7ea82.jpg', 'image/jpeg', 'public', 12907, '[]', '[]', '[]', 195, '2023-11-26 02:48:00', '2023-11-26 02:48:00'),
(199, 'MixCode\\User', '5a651a52-d168-4549-b225-25ccdb3e1b23', 'user_file_vehicle_license', '0d2c3a83399d64247bd63cb32cad60ce.jpg', '0d2c3a83399d64247bd63cb32cad60ce.jpg', 'image/jpeg', 'public', 2352857, '[]', '[]', '[]', 196, '2023-11-27 21:01:19', '2023-11-27 21:01:19'),
(200, 'MixCode\\User', '5a651a52-d168-4549-b225-25ccdb3e1b23', 'user_image', 'eb0c1621e35ac458612f87b53af38685.jpg', 'eb0c1621e35ac458612f87b53af38685.jpg', 'image/jpeg', 'public', 471130, '[]', '[]', '[]', 197, '2023-11-27 21:01:20', '2023-11-27 21:01:20'),
(201, 'MixCode\\User', '3901e59b-89c7-4d6a-9544-ebc43571261b', 'user_image_logo', 'c0539970ae3bf70fd3de8f16c536fa4c.jpg', 'c0539970ae3bf70fd3de8f16c536fa4c.jpg', 'image/jpeg', 'public', 325286, '[]', '[]', '[]', 198, '2023-11-28 17:53:30', '2023-11-28 17:53:30'),
(202, 'MixCode\\User', '3901e59b-89c7-4d6a-9544-ebc43571261b', 'user_file_commercial_license', '5e346e4a5b8a12361ba416550b7c6869.jpg', '5e346e4a5b8a12361ba416550b7c6869.jpg', 'image/jpeg', 'public', 81772, '[]', '[]', '[]', 199, '2023-11-28 17:53:30', '2023-11-28 17:53:30'),
(203, 'MixCode\\Product', '7411e939-8c78-43ff-9f2e-b434e7ecbadd', 'product_image', 'd2ed846a0f8b93d5240762f4a11c5ad0.jpg', 'd2ed846a0f8b93d5240762f4a11c5ad0.jpg', 'image/jpeg', 'public', 26982, '[]', '[]', '[]', 200, '2023-11-28 17:55:21', '2023-11-28 17:55:21'),
(204, 'MixCode\\Product', '764bef8b-bbc8-4540-acf2-1da86a3b49e7', 'product_image', 'e28e643f99902122fe2d955ba39d277a.jpg', 'e28e643f99902122fe2d955ba39d277a.jpg', 'image/jpeg', 'public', 330017, '[]', '[]', '[]', 201, '2023-11-29 03:52:01', '2023-11-29 03:52:01'),
(205, 'MixCode\\Category', '5062a344-ee0f-4ec1-8e19-9ce5b3a1695c', 'category_image_icon', '4633fc71b9684873430b27b0765ff36f.jpg', '4633fc71b9684873430b27b0765ff36f.jpg', 'image/jpeg', 'public', 104302, '[]', '[]', '[]', 202, '2023-12-04 22:00:19', '2023-12-04 22:00:19');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(206, 'MixCode\\Product', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', 'product_image', '7274cd8179bdf1951f778a6531f81b3c.jpg', '7274cd8179bdf1951f778a6531f81b3c.jpg', 'image/jpeg', 'public', 1328644, '[]', '[]', '[]', 203, '2023-12-05 04:24:08', '2023-12-05 04:24:08'),
(207, 'MixCode\\Category', '382298b0-a234-47f4-9a1f-faaeb5ca9825', 'category_image_icon', '81a6032de5a95b6cfe2594d93f490e92.jpg', '81a6032de5a95b6cfe2594d93f490e92.jpg', 'image/jpeg', 'public', 252390, '[]', '[]', '[]', 204, '2023-12-06 15:15:25', '2023-12-06 15:15:25'),
(208, 'MixCode\\Product', '10219638-e508-40f2-8667-1cf70ba474ab', 'product_image', 'f3050e99644957c3ada6e6604d627330.jpg', 'f3050e99644957c3ada6e6604d627330.jpg', 'image/jpeg', 'public', 1276696, '[]', '[]', '[]', 205, '2023-12-06 19:15:08', '2023-12-06 19:15:08'),
(209, 'MixCode\\Product', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', 'product_image', 'ac7c17350cc6b8dc9bf1cfb29c12f104.jpg', 'ac7c17350cc6b8dc9bf1cfb29c12f104.jpg', 'image/jpeg', 'public', 882972, '[]', '[]', '[]', 206, '2023-12-06 19:27:12', '2023-12-06 19:27:12'),
(210, 'MixCode\\Product', '241d7615-c96e-4ce9-850c-21e7436d8a87', 'product_image', '7526a1ee36e28082c2a4ec86a0ea5fcf.jpg', '7526a1ee36e28082c2a4ec86a0ea5fcf.jpg', 'image/jpeg', 'public', 1530903, '[]', '[]', '[]', 207, '2023-12-07 02:01:50', '2023-12-07 02:01:50'),
(211, 'MixCode\\Category', '7d9605af-06c0-41bd-b281-2369f1796008', 'category_image_icon', '95b6228d6398fdcab66c21aeccc9604c.jpg', '95b6228d6398fdcab66c21aeccc9604c.jpg', 'image/jpeg', 'public', 100983, '[]', '[]', '[]', 208, '2023-12-08 03:26:33', '2023-12-08 03:26:33'),
(212, 'MixCode\\Category', '546e2776-239d-46f4-8c13-06e294ca9a42', 'category_image_icon', '5332e96679267cd0cd3dca96d6128824.jpg', '5332e96679267cd0cd3dca96d6128824.jpg', 'image/jpeg', 'public', 877977, '[]', '[]', '[]', 209, '2023-12-08 03:27:08', '2023-12-08 03:27:08'),
(213, 'MixCode\\Category', '6bf77526-ebbb-4c42-b7e7-5046d5501e44', 'category_image_icon', '7169d96c778589ceac2ba3ecdaa57a4a.jpg', '7169d96c778589ceac2ba3ecdaa57a4a.jpg', 'image/jpeg', 'public', 50539, '[]', '[]', '[]', 210, '2023-12-08 03:27:42', '2023-12-08 03:27:42'),
(214, 'MixCode\\Category', '623dffcf-a769-498b-8db6-e118a1b7d93d', 'category_image_icon', 'b6719ccd1f5ecfa81c44ef2141dc071a.jpg', 'b6719ccd1f5ecfa81c44ef2141dc071a.jpg', 'image/jpeg', 'public', 913466, '[]', '[]', '[]', 211, '2023-12-08 03:28:19', '2023-12-08 03:28:19'),
(215, 'MixCode\\Product', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', 'product_image', '5009d902553dc5fc6bda99e253b85835.jpg', '5009d902553dc5fc6bda99e253b85835.jpg', 'image/jpeg', 'public', 107182, '[]', '[]', '[]', 212, '2023-12-08 03:37:09', '2023-12-08 03:37:09'),
(216, 'MixCode\\Product', '44de3aef-296a-4db9-8027-ffbeb314b0d3', 'product_image', '1dc909c2d0b3634cdad79ed002488afc.jpg', '1dc909c2d0b3634cdad79ed002488afc.jpg', 'image/jpeg', 'public', 55669, '[]', '[]', '[]', 213, '2023-12-08 03:38:42', '2023-12-08 03:38:42'),
(217, 'MixCode\\User', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', 'user_image_logo', '0e4d4453d7f164a713fe86d9ab69e378.jpg', '0e4d4453d7f164a713fe86d9ab69e378.jpg', 'image/jpeg', 'public', 974488, '[]', '[]', '[]', 214, '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
(218, 'MixCode\\User', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', 'user_file_commercial_license', 'f53c37b2b93c2ea6cc3ef88219337616.jpg', 'f53c37b2b93c2ea6cc3ef88219337616.jpg', 'image/jpeg', 'public', 913466, '[]', '[]', '[]', 215, '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
(219, 'MixCode\\Category', '6f12f592-7059-4352-91af-49f697583517', 'category_image_icon', '922ffc22dbc09481a63d7c49b697872d.png', '922ffc22dbc09481a63d7c49b697872d.png', 'image/png', 'public', 100508, '[]', '[]', '[]', 216, '2023-12-08 20:12:17', '2023-12-08 20:12:17'),
(220, 'MixCode\\Category', 'a0cb6aaf-0eb3-4928-95d0-31a4a16df471', 'category_image_icon', 'afc15280e87237c5b90ac7a5b7489ebe.png', 'afc15280e87237c5b90ac7a5b7489ebe.png', 'image/png', 'public', 556429, '[]', '[]', '[]', 217, '2023-12-08 20:16:09', '2023-12-08 20:16:09'),
(221, 'MixCode\\Category', 'ab18dda2-8ed7-4cee-86b1-04597f76558b', 'category_image_icon', 'afc15280e87237c5b90ac7a5b7489ebe.png', 'afc15280e87237c5b90ac7a5b7489ebe.png', 'image/png', 'public', 556429, '[]', '[]', '[]', 218, '2023-12-08 20:16:26', '2023-12-08 20:16:26'),
(222, 'MixCode\\Category', '04cce9a2-eea8-48e5-a6d7-717cc834bef8', 'category_image_icon', '73ebec0f17f24cf183a52cb1c4505f90.jpg', '73ebec0f17f24cf183a52cb1c4505f90.jpg', 'image/jpeg', 'public', 56723, '[]', '[]', '[]', 219, '2023-12-08 20:17:49', '2023-12-08 20:17:49'),
(223, 'MixCode\\Category', '3c11a0d7-3dff-4c75-9cd7-e319f08b4546', 'category_image_icon', '7169d96c778589ceac2ba3ecdaa57a4a.jpg', '7169d96c778589ceac2ba3ecdaa57a4a.jpg', 'image/jpeg', 'public', 50539, '[]', '[]', '[]', 220, '2023-12-08 20:18:46', '2023-12-08 20:18:46'),
(224, 'MixCode\\Category', 'c56cc156-8df2-4bd7-ba9e-b25c9a305626', 'category_image_icon', 'ced58336eb37d184b91cc78bed16df70.jpg', 'ced58336eb37d184b91cc78bed16df70.jpg', 'image/jpeg', 'public', 112359, '[]', '[]', '[]', 221, '2023-12-08 20:20:55', '2023-12-08 20:20:55'),
(225, 'MixCode\\Product', 'bcd9b587-b666-4ce2-9021-4064c8720407', 'product_image', '261b3fb5a026264a375d8c64f8174395.png', '261b3fb5a026264a375d8c64f8174395.png', 'image/png', 'public', 100508, '[]', '[]', '[]', 222, '2023-12-08 21:48:35', '2023-12-08 21:48:35'),
(226, 'MixCode\\Product', '5fc5dc73-7159-4c15-b9ac-74d5edff72b0', 'product_image', 'b487d7f046c91ecb2365956939fa13ec.jpg', 'b487d7f046c91ecb2365956939fa13ec.jpg', 'image/jpeg', 'public', 112359, '[]', '[]', '[]', 223, '2023-12-08 21:49:36', '2023-12-08 21:49:36'),
(227, 'MixCode\\Product', 'b0f8aff2-767e-4f6e-aa8f-ec20a166434a', 'product_image', '0f27bede2ce684aa6e909e4edc08de6c.png', '0f27bede2ce684aa6e909e4edc08de6c.png', 'image/png', 'public', 556429, '[]', '[]', '[]', 224, '2023-12-08 21:51:27', '2023-12-08 21:51:27'),
(228, 'MixCode\\Product', '29851491-b8ae-4443-9dbe-8af21e1e4522', 'product_image', 'f53c37b2b93c2ea6cc3ef88219337616.jpg', 'f53c37b2b93c2ea6cc3ef88219337616.jpg', 'image/jpeg', 'public', 913466, '[]', '[]', '[]', 225, '2023-12-08 21:53:04', '2023-12-08 21:53:04'),
(229, 'MixCode\\Product', 'b3249b74-12a4-49ce-84b2-79e084e8df32', 'product_image', '6cbae7447371ed28a0396bde0d0343e1.jpg', '6cbae7447371ed28a0396bde0d0343e1.jpg', 'image/jpeg', 'public', 45383, '[]', '[]', '[]', 226, '2023-12-08 21:54:30', '2023-12-08 21:54:30'),
(232, 'MixCode\\User', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', 'user_file_vehicle_license', 'f117384353a4657c4b64045d2ef1f5f5.jpg', 'f117384353a4657c4b64045d2ef1f5f5.jpg', 'image/jpeg', 'public', 1709060, '[]', '[]', '[]', 229, '2023-12-13 13:18:20', '2023-12-13 13:18:20'),
(233, 'MixCode\\User', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', 'user_image', '687ed7b1d3842709024b6d4ef0e5b3d6.jpg', '687ed7b1d3842709024b6d4ef0e5b3d6.jpg', 'image/jpeg', 'public', 161514, '[]', '[]', '[]', 230, '2023-12-13 13:18:20', '2023-12-13 13:18:20'),
(234, 'MixCode\\User', 'da1a5e0f-b4fb-44b4-8fd8-8334f1c4d625', 'user_file_vehicle_license', 'c3dfcdc2a68e466061e52683a62fb57d.jpg', 'c3dfcdc2a68e466061e52683a62fb57d.jpg', 'image/jpeg', 'public', 5577930, '[]', '[]', '[]', 231, '2023-12-14 02:23:04', '2023-12-14 02:23:04'),
(235, 'MixCode\\User', 'da1a5e0f-b4fb-44b4-8fd8-8334f1c4d625', 'user_image', '1dc909c2d0b3634cdad79ed002488afc.jpg', '1dc909c2d0b3634cdad79ed002488afc.jpg', 'image/jpeg', 'public', 55669, '[]', '[]', '[]', 232, '2023-12-14 02:23:06', '2023-12-14 02:23:06'),
(236, 'MixCode\\User', 'e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366', 'user_file_vehicle_license', '1fc59468a060f8e433b19dc8d2fc3680.jpg', '1fc59468a060f8e433b19dc8d2fc3680.jpg', 'image/jpeg', 'public', 2149095, '[]', '[]', '[]', 233, '2023-12-14 02:44:36', '2023-12-14 02:44:36'),
(237, 'MixCode\\User', 'e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366', 'user_image', 'e4fe17a4af1c3d410b1c66001f8e120b.jpg', 'e4fe17a4af1c3d410b1c66001f8e120b.jpg', 'image/jpeg', 'public', 45323, '[]', '[]', '[]', 234, '2023-12-14 02:44:36', '2023-12-14 02:44:36'),
(238, 'MixCode\\Banner', '72bf800b-819f-4ec7-b31c-c7c07249d2d8', 'banner_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 235, '2024-09-30 11:43:08', '2024-09-30 11:43:08'),
(240, 'MixCode\\Product', '678b52f0-7df2-4d8d-b269-4d1b4f117b1c', 'product_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 236, '2024-09-30 16:43:30', '2024-09-30 16:43:30'),
(241, 'MixCode\\Product', '5796b732-9477-4ff1-999b-e608b5a21401', 'product_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 237, '2024-09-30 16:50:37', '2024-09-30 16:50:37'),
(242, 'MixCode\\Banner', '036bc796-d639-4260-90f3-fee758c7969d', 'banner_image', '5767b74f0c0da8259b36772a44e49ae8.png', '5767b74f0c0da8259b36772a44e49ae8.png', 'image/png', 'public', 634231, '[]', '[]', '[]', 238, '2024-09-30 18:57:08', '2024-09-30 18:57:08'),
(243, 'MixCode\\Banner', '45f2cd68-8966-4ada-8bc1-edbd08d0f016', 'banner_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 239, '2024-09-30 19:00:24', '2024-09-30 19:00:24'),
(244, 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 'user_image_logo', '0606db0a85057ed4f68e57be102408df.jpg', '0606db0a85057ed4f68e57be102408df.jpg', 'image/jpeg', 'public', 1063568, '[]', '[]', '[]', 240, '2024-09-30 19:39:53', '2024-09-30 19:39:53'),
(245, 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 'user_file_commercial_license', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 241, '2024-09-30 19:39:53', '2024-09-30 19:39:53'),
(246, 'MixCode\\User', '71a50ee7-7db9-466f-a46c-9d9a1ca05118', 'user_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 242, '2024-09-30 19:45:39', '2024-09-30 19:45:39'),
(247, 'MixCode\\User', '71a50ee7-7db9-466f-a46c-9d9a1ca05118', 'user_image', '0606db0a85057ed4f68e57be102408df.jpg', '0606db0a85057ed4f68e57be102408df.jpg', 'image/jpeg', 'public', 1063568, '[]', '[]', '[]', 243, '2024-09-30 19:46:22', '2024-09-30 19:46:22'),
(248, 'MixCode\\User', 'c0431474-5272-4ccd-9894-1a7533ea7a09', 'user_file_vehicle_license', '83475a63834dc1f9ca8f117c37d9684d.png', '83475a63834dc1f9ca8f117c37d9684d.png', 'image/png', 'public', 313930, '[]', '[]', '[]', 244, '2024-09-30 20:14:59', '2024-09-30 20:14:59'),
(249, 'MixCode\\User', 'c0431474-5272-4ccd-9894-1a7533ea7a09', 'user_image', 'aeb33eaf3e9066ef01a419fbf78a1e6e.png', 'aeb33eaf3e9066ef01a419fbf78a1e6e.png', 'image/png', 'public', 439835, '[]', '[]', '[]', 245, '2024-09-30 20:14:59', '2024-09-30 20:14:59'),
(250, 'MixCode\\Categorization', '3ad6484f-2ec2-426f-a3a7-795f6cc7b6da', 'categorization_image_icon', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 246, '2024-10-01 08:02:18', '2024-10-01 08:02:18'),
(251, 'MixCode\\Category', '10e4a82b-a330-4158-80b9-f8a8323f8d7c', 'category_image_icon', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 247, '2024-10-01 08:02:42', '2024-10-01 08:02:42'),
(252, 'MixCode\\User', '747a53ec-1108-4ac1-88c6-e77f8cc8dbbc', 'user_file_vehicle_license', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 248, '2024-10-01 08:21:38', '2024-10-01 08:21:38'),
(253, 'MixCode\\User', '747a53ec-1108-4ac1-88c6-e77f8cc8dbbc', 'user_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 249, '2024-10-01 08:21:38', '2024-10-01 08:21:38'),
(254, 'MixCode\\Product', '380e263e-99c7-4366-b4de-5b0c4d2d9cdb', 'product_image', '00c9f3026cc4f7840cee6e49e7b85d16.png', '00c9f3026cc4f7840cee6e49e7b85d16.png', 'image/png', 'public', 63107, '[]', '[]', '[]', 250, '2024-10-01 08:24:26', '2024-10-01 08:24:26'),
(255, 'MixCode\\User', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', 'user_image_logo', 'aeb33eaf3e9066ef01a419fbf78a1e6e.png', 'aeb33eaf3e9066ef01a419fbf78a1e6e.png', 'image/png', 'public', 439835, '[]', '[]', '[]', 251, '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
(256, 'MixCode\\User', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', 'user_file_commercial_license', '83475a63834dc1f9ca8f117c37d9684d.png', '83475a63834dc1f9ca8f117c37d9684d.png', 'image/png', 'public', 313930, '[]', '[]', '[]', 252, '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
(257, 'MixCode\\User', '8210c157-1925-46d5-8315-b04107f24b7b', 'user_file_vehicle_license', '83475a63834dc1f9ca8f117c37d9684d.png', '83475a63834dc1f9ca8f117c37d9684d.png', 'image/png', 'public', 313930, '[]', '[]', '[]', 253, '2024-10-01 12:47:19', '2024-10-01 12:47:19'),
(258, 'MixCode\\User', '8210c157-1925-46d5-8315-b04107f24b7b', 'user_image', 'aeb33eaf3e9066ef01a419fbf78a1e6e.png', 'aeb33eaf3e9066ef01a419fbf78a1e6e.png', 'image/png', 'public', 439835, '[]', '[]', '[]', 254, '2024-10-01 12:47:19', '2024-10-01 12:47:19'),
(259, 'MixCode\\Product', 'c3dd959c-a909-43cb-984e-2527e6f98b45', 'product_image', 'e21ed261bc3024ccb866135cc9b36824.png', 'e21ed261bc3024ccb866135cc9b36824.png', 'image/png', 'public', 25100, '[]', '[]', '[]', 255, '2024-12-23 14:06:00', '2024-12-23 14:06:00'),
(260, 'MixCode\\Banner', '427e8627-6e55-42f9-8b82-b781fb7477f1', 'banner_image', '20f54bac7aaafe438a5f81e50994b96a.png', '20f54bac7aaafe438a5f81e50994b96a.png', 'image/png', 'public', 95391, '[]', '[]', '[]', 256, '2024-12-24 08:44:05', '2024-12-24 08:44:05'),
(261, 'MixCode\\User', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', 'user_image_logo', '20f54bac7aaafe438a5f81e50994b96a.png', '20f54bac7aaafe438a5f81e50994b96a.png', 'image/png', 'public', 95391, '[]', '[]', '[]', 257, '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
(262, 'MixCode\\User', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', 'user_file_commercial_license', '0d328ca5e0a5a5819f019ef5372d2910.png', '0d328ca5e0a5a5819f019ef5372d2910.png', 'image/png', 'public', 106668, '[]', '[]', '[]', 258, '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
(263, 'MixCode\\Banner', '2969f6c8-b25c-43e8-82a2-c5be3e7f5e73', 'banner_image', 'e9c8541eb4c82e93d7821706f4831425.png', 'e9c8541eb4c82e93d7821706f4831425.png', 'image/png', 'public', 395651, '[]', '[]', '[]', 259, '2024-12-24 08:54:58', '2024-12-24 08:54:58'),
(264, 'MixCode\\Banner', 'b4c93eba-41b1-48e1-9b19-a704b2f600ef', 'banner_image', '6ed2d5ba4b2461b1a812115a1c994dcd.png', '6ed2d5ba4b2461b1a812115a1c994dcd.png', 'image/png', 'public', 141925, '[]', '[]', '[]', 260, '2024-12-24 18:58:57', '2024-12-24 18:58:57'),
(265, 'MixCode\\Banner', '7413c248-a5d6-4821-a583-68d62c95499d', 'banner_image', '6ed2d5ba4b2461b1a812115a1c994dcd.png', '6ed2d5ba4b2461b1a812115a1c994dcd.png', 'image/png', 'public', 141925, '[]', '[]', '[]', 261, '2024-12-24 20:58:36', '2024-12-24 20:58:36'),
(266, 'MixCode\\Product', '8279a72c-57d3-406f-b307-b2b3fb461605', 'product_image', '779b7513263ef185b6d094af290ef540.png', '779b7513263ef185b6d094af290ef540.png', 'image/png', 'public', 19293, '[]', '[]', '[]', 262, '2024-12-27 12:41:51', '2024-12-27 12:41:51'),
(267, 'MixCode\\User', 'a1ceba76-3589-4119-88c8-651982b9b21c', 'user_image_logo', '6ed2d5ba4b2461b1a812115a1c994dcd.png', '6ed2d5ba4b2461b1a812115a1c994dcd.png', 'image/png', 'public', 141925, '[]', '[]', '[]', 263, '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
(268, 'MixCode\\User', 'a1ceba76-3589-4119-88c8-651982b9b21c', 'user_file_commercial_license', '6ed2d5ba4b2461b1a812115a1c994dcd.png', '6ed2d5ba4b2461b1a812115a1c994dcd.png', 'image/png', 'public', 141925, '[]', '[]', '[]', 264, '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
(269, 'MixCode\\User', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', 'user_image_logo', 'c850ea38c6011f57b7aa5bb51370b9fd.png', 'c850ea38c6011f57b7aa5bb51370b9fd.png', 'image/png', 'public', 15205, '[]', '[]', '[]', 265, '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
(270, 'MixCode\\User', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', 'user_file_commercial_license', '45173a2c3e93596966cebf567a4875a1.jpg', '45173a2c3e93596966cebf567a4875a1.jpg', 'image/jpeg', 'public', 366709, '[]', '[]', '[]', 266, '2024-12-29 11:22:21', '2024-12-29 11:22:21');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2018_08_08_100000_create_telescope_entries_table', 1),
(9, '2019_08_02_151006_create_settings_table', 1),
(10, '2019_08_08_075830_create_media_table', 1),
(11, '2019_09_04_150209_create_contacts_table', 1),
(12, '2019_09_26_102718_create_notifications_table', 1),
(13, '2020_01_23_162307_create_brands_table', 1),
(14, '2020_04_01_142132_create_discounts_table', 1),
(15, '2020_04_01_155704_create_countries_table', 1),
(16, '2020_04_05_161023_create_cities_table', 1),
(17, '2020_04_07_145806_create_categories_table', 1),
(18, '2020_04_12_125322_create_products_table', 1),
(19, '2020_04_15_154742_create_product_categories_table', 1),
(20, '2020_04_20_160741_create_reviews_table', 1),
(21, '2020_04_26_104816_create_favorites_table', 1),
(22, '2020_05_03_085731_create_Product_views_table', 1),
(23, '2020_07_09_131905_create_product_colors_table', 1),
(24, '2020_07_12_183922_create_classifications_table', 1),
(25, '2020_07_13_131923_create_product_variations_table', 1),
(26, '2020_07_15_125006_create_categorizations_table', 1),
(27, '2020_09_22_144750_create_carts_table', 1),
(28, '2020_09_22_165618_create_promo_codes_table', 1),
(29, '2020_09_23_144749_create_cart_group_additions_table', 1),
(30, '2020_09_23_144750_create_cart_additions_table', 1),
(31, '2020_09_23_162307_create_addresses_table', 1),
(32, '2020_09_24_193308_create_orders_table', 1),
(33, '2020_09_27_155945_create_product_orders_table', 1),
(34, '2020_09_27_155946_create_product_order_additions_table', 1),
(35, '2020_11_25_072306_create_faqs_table', 1),
(36, '2020_12_13_162307_create_banners_table', 1),
(37, '2020_12_14_162307_create_wallets_table', 1),
(38, '2020_9_23_111000_create_user_promo_codes_table', 1),
(39, '2021_01_23_204745_create_subscribes_table', 1),
(40, '2021_08_28_193308_create_canceled_orders_table', 1),
(41, '2021_10_25_131923_create_product_additions_table', 1),
(42, '2021_10_25_131924_create_product_group_additions_table', 1),
(43, '2021_12_01_103917_create_work_times_table', 1),
(44, '2022_07_13_131923_create_user_categorizations_table', 1),
(45, '2022_09_27_155945_create_orders_reports_table', 1),
(46, '2023_04_04_155945_create_shipping_fee_per_distances_table', 1),
(47, '2023_06_13_155945_create_orders_requests_table', 2),
(48, '2023_06_23_145910_add_price_after_discount_field_to_products_table', 3),
(49, '2023_11_12_111009_add_store_id_to_banners_table', 4),
(50, '2023_11_30_114712_add_order_field_to_categorizations_table', 5),
(51, '2024_09_30_194904_update_products_overview_nullable', 6),
(52, '2024_09_30_211923_add_foreign_key_to_categorization_id_in_users_table', 7),
(53, '2024_09_30_212427_update_foreign_key_on_categorization_id_in_users_table', 8),
(54, '2024_12_17_183629_add_unit_code_to_products_table', 9),
(55, '2024_12_23_072408_add_package_fields_to_products_table', 9),
(56, '2024_12_27_071656_add_unit_value_to_products_table', 10);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` char(36) NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00222072-26f9-46b5-8877-beb5b0750f2e', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c20cc8bb-a9f4-4cbd-8f34-767034233ef4\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-12-14 02:14:37', '2023-12-14 02:08:45', '2023-12-14 02:14:37'),
('0031dcef-f211-498f-ae80-bf13433eb9c5', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:13', '2023-06-12 19:18:14', '2023-06-22 16:52:13'),
('00bd692e-cf54-4f2d-88ec-5db4c2d145ca', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/6bdbe144-56d0-43ae-b50f-e65d88d68787\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-11-27 20:55:29', '2023-11-02 17:08:26', '2023-11-27 20:55:29'),
('00e0d25f-5b4d-455f-8c03-d5c13912c523', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"e7d5ffb2-49cb-4bf9-9221-8a1a19c85853\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:22', '2023-07-10 20:25:46', '2023-07-24 16:45:22'),
('013cc18f-0a77-4457-8e76-3e30453ad58f', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/2d374451-3df3-4194-bdb0-c095a5af11d3\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:13:12', '2023-12-14 02:13:12'),
('02e099c9-02e0-48ae-886f-8b08fbc63677', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/da1a5e0f-b4fb-44b4-8fd8-8334f1c4d625\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2024-12-24 08:47:11', '2023-12-14 02:23:06', '2024-12-24 08:47:11'),
('03e05993-6957-45f2-ae70-3ab8c01fed8c', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/e522ee95-5e91-49e1-9d42-0157996cd856\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 01:41:45', '2023-11-10 15:34:34', '2023-11-15 01:41:45'),
('057fd380-d842-4333-a31b-fc9388e700ba', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/a7b6ceda-e829-4e67-b731-ccf3119bc47e\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-03 23:22:29', '2023-11-03 22:18:51', '2023-11-03 23:22:29'),
('05b18d23-195c-403d-85fa-f94a839630bb', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/a7b6ceda-e829-4e67-b731-ccf3119bc47e\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-03 23:17:09', '2023-11-03 22:19:19', '2023-11-03 23:17:09'),
('06321036-9c89-46aa-9c5a-cd3cc9488afc', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"069f7174-8996-4a37-a9f9-0e7aeeadd294\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:12', '2023-07-11 21:21:33', '2023-07-24 16:45:12'),
('07bb0803-da79-48f1-8e35-d85e291702ea', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7af2ac1d-eec3-4022-af01-243f23b2165c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-15 15:22:49', '2023-11-15 15:20:42', '2023-11-15 15:22:49'),
('0843e876-1e78-4c1c-a799-9c7f6e1369d1', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"d16391ac-eb34-46c2-9a3b-059c06870ad9\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:21', '2023-07-10 20:45:53', '2023-07-24 16:45:21'),
('09a6d602-25d9-45a6-b6c5-e573ab2611e0', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"37f484e3-effb-469a-921d-050f91badcbe\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-24 20:35:19', '2023-10-24 20:35:19'),
('0b4a78f8-5bec-4bcf-bc7c-2c9449fefde6', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/aac4e447-3987-4a2b-b823-3bfb1bc6e907\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:44', '2023-12-08 03:37:09', '2023-12-13 01:54:44'),
('0bfa5a1b-9829-4a8e-a3f3-44f3b06b2742', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"cb0baa56-bc61-447d-97d1-0ff40d94e6a2\"}', '2023-11-27 21:41:53', '2023-11-27 21:08:41', '2023-11-27 21:41:53'),
('0f2634f4-1db8-45c9-85f3-7d5b32064b99', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/6a691507-ee69-4c2f-8d0e-b0179eff8d73\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-19 04:43:59', '2023-11-19 01:49:54', '2023-11-19 04:43:59'),
('0f5eb03f-041c-48c4-a7e1-96c22d0a310e', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/aa705632-93ff-411a-b450-35f42616115d\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-07-24 19:23:31', '2023-07-23 17:37:28', '2023-07-24 19:23:31'),
('107d7b65-fb15-4f87-9b9c-741799499a8b', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/312603c5-a830-4b15-921b-32a1b085bf5a\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-09-05 12:25:44', '2023-08-26 18:26:11', '2023-09-05 12:25:44'),
('10d14767-9fc3-408c-88ef-f42b8a937a36', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"c617c2e5-435a-4498-b7a8-418d89046b25\",\"description\":null,\"address\":\"Amar ebn yaser ,cairo ,egypt\"}', '2023-08-02 03:03:51', '2023-08-02 02:47:59', '2023-08-02 03:03:51'),
('126b9f23-750c-4202-a57e-2a93b35889e2', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/64504ba6-266d-4bfd-b703-96e359da977d\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-07-22 15:43:37', '2023-07-14 00:10:07', '2023-07-22 15:43:37'),
('1578c282-4d68-4a73-8ff1-30265b31cb39', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/852d76b7-0396-484b-a1da-81e627069be0\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-11-01 02:15:43', '2023-10-30 02:52:23', '2023-11-01 02:15:43'),
('1631d317-9da2-4cce-8243-3e3754e2f65c', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/b965f637-f06e-4076-90c7-f61f347aae04\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-19 01:42:38', '2023-11-19 01:34:43', '2023-11-19 01:42:38'),
('16dc98e0-5e58-4012-a5fe-5aeeb1c49f55', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/c30cfd3c-280f-45a6-8e4d-efaae17ddaed\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-08-05 02:48:54', '2023-07-25 01:53:22', '2023-08-05 02:48:54'),
('18c99313-d3b7-4158-92cc-7a0ca83d4977', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/349880c7-23f0-483f-9d83-7bd378784f2c\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 02:11:02', '2023-07-14 00:11:31', '2023-11-26 02:11:02'),
('193ea154-34da-450c-a8cd-cb9472e0e5ea', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c20cc8bb-a9f4-4cbd-8f34-767034233ef4\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-12-14 02:14:37', '2023-12-14 02:08:48', '2023-12-14 02:14:37'),
('19c1039f-0824-4000-823e-df65d1ff1c9f', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/39dc61dd-0f6b-40b6-94a7-66c4815699f1\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-06 12:52:24', '2023-07-04 13:32:00', '2023-07-06 12:52:24'),
('1a1ae075-ac0e-4a66-acbc-e595abe0f4f7', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-08-22 02:41:57', '2023-08-20 18:28:25', '2023-08-22 02:41:57'),
('1a9c83bd-68b6-4abc-94a7-877e5cebec89', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"5621ec74-5dba-4d46-a26c-447e4bb9ace6\",\"description\":null,\"address\":\", \\u0634\\u0627\\u0631\\u0639 \\u0627\\u0644\\u0646\\u0648\\u0631, \\u0627\\u0644\\u0633\\u064a\\u0628\\u200e, \\u0639\\u0645\\u0627\\u0646\"}', '2023-12-13 21:27:13', '2023-12-13 21:25:24', '2023-12-13 21:27:13'),
('1cc24eba-d8d5-43ff-a1de-ac57d5c7e4b6', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/ff4f1965-7068-4d8c-a7e4-b448830ccaed\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-10-30 02:29:27', '2023-10-27 18:30:23', '2023-10-30 02:29:27'),
('207a9f1b-99fb-42a6-9e60-6b9c0e4f7c32', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/ebf3adb2-f4d7-4b86-bc45-4f0da3edebcd\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-22 03:28:13', '2023-08-22 02:43:54', '2023-08-22 03:28:13'),
('20a37a96-b935-441c-8ebf-b2ad1df516eb', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1bdfb31a-72e6-4195-b608-028e4337c550\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 17:02:57', '2023-06-22 17:02:31', '2023-06-22 17:02:57'),
('20bc0a75-b89c-4e62-90dd-bac787abedc9', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/f681a723-64f0-4a3e-92d5-04dfd11a98a7\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-28 05:57:14', '2023-11-28 05:36:32', '2023-11-28 05:57:14'),
('21aadbe5-428f-4dcc-b815-ee3a5fb07a23', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/185263e6-7fc2-41c1-abaa-a4e4d6d82d76\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-10-15 16:59:15', '2023-10-11 17:18:04', '2023-10-15 16:59:15'),
('21b57a6f-333c-4a18-aa77-85ab66d59854', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/375f3156-547f-430e-814c-e6018de96fe6\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 15:23:48', '2023-11-26 15:21:12', '2023-11-26 15:23:48'),
('22bc2e00-2c72-4545-941b-a190f9422874', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/3e6e259a-3969-4168-a924-9dbf1f296f03\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-08-16 04:43:20', '2023-08-07 00:23:15', '2023-08-16 04:43:20'),
('2412fc8d-3414-4b38-b7e1-90cf124ea7a0', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"4995078b-8c0d-4f05-8493-53b4961104b0\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:26', '2023-07-08 22:08:53', '2023-07-24 16:45:26'),
('24c2fb78-be9f-43aa-9c07-8ab75aefccf6', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/a4ccdf93-e2a3-4e63-83cb-261e37655b61\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-09-05 12:25:46', '2023-08-24 03:58:21', '2023-09-05 12:25:46'),
('252498f2-3adc-4d81-aea2-afaadad66ead', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/f1a720ac-a505-4cfa-8c8b-de65fd43db61\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', NULL, '2023-08-11 03:24:16', '2023-08-11 03:24:16'),
('2569d92a-3f3b-4ef7-88d6-fb3c5a220319', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/45ce715f-c51c-4505-9849-fc1fae22f7f8\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-21 02:22:12', '2023-11-21 02:20:30', '2023-11-21 02:22:12'),
('25809ebb-0469-4b9a-9cbf-1765cacbee34', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/764bef8b-bbc8-4540-acf2-1da86a3b49e7\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-30 17:21:33', '2023-11-29 03:52:35', '2023-11-30 17:21:33'),
('259336cf-e871-4e95-9b19-76d435d72ff4', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/0c968939-7f0c-45b8-905d-3731d9a423b1\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-09-07 02:11:29', '2023-09-06 23:45:48', '2023-09-07 02:11:29'),
('259f7111-298d-4ce7-9345-ace40ee04196', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/6a691507-ee69-4c2f-8d0e-b0179eff8d73\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-21 02:09:11', '2023-11-20 17:03:52', '2023-11-21 02:09:11'),
('2609bc0b-0b5f-45ca-86a9-e45cd50acd17', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/6a691507-ee69-4c2f-8d0e-b0179eff8d73\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-19 01:51:14', '2023-11-19 01:49:33', '2023-11-19 01:51:14'),
('26fa5799-f624-422f-b495-baacda6fed03', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7af2ac1d-eec3-4022-af01-243f23b2165c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-15 16:50:46', '2023-11-15 16:48:10', '2023-11-15 16:50:46'),
('278cef33-5d6b-4770-b004-3345dcddeed8', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/47fc4048-3d4c-44ab-bf9c-f9e83ff77fff\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 02:08:21', '2023-07-24 14:55:41', '2023-11-26 02:08:21'),
('27dccaa6-95ac-4d45-a1e9-5a804a8092cd', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/b965f637-f06e-4076-90c7-f61f347aae04\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-18 01:52:26', '2023-11-18 01:51:11', '2023-11-18 01:52:26'),
('2a6722e6-9b92-4f16-a7ae-3c8ec3789fb4', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:51:35', '2023-06-13 02:55:07', '2023-06-22 16:51:35'),
('2ac984e3-5755-4062-aae6-c4ba47b4e3f2', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/489731f2-960b-4f66-a74f-73276b1aff4c\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-10-16 02:41:25', '2023-10-15 23:50:38', '2023-10-16 02:41:25'),
('2adf967a-5c48-4b15-941c-27f66b8d366f', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/4cdc59e3-ddf6-4219-8695-1246f1975de3\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-13 21:28:39', '2023-12-13 21:28:39'),
('2b9bb6cc-13b6-42a7-9031-c628a3b6507c', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"6cc3f8eb-1913-4dfe-a752-0cb8456aea88\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-27 18:31:08', '2023-10-27 18:31:08'),
('2c07aec0-50fe-4fd9-becf-061fb9a0e0c6', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/5621ec74-5dba-4d46-a26c-447e4bb9ace6\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-12-14 02:14:38', '2023-12-14 02:08:38', '2023-12-14 02:14:38'),
('2c62a213-da7d-4100-9cec-74fb458945f1', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7826dc2a-9734-4c4d-b14f-00673998af24\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 01:41:46', '2023-11-10 15:34:00', '2023-11-15 01:41:46'),
('2f8cf266-5be5-42a1-85a4-1a5ce6282ca6', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/185263e6-7fc2-41c1-abaa-a4e4d6d82d76\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-10-15 16:59:19', '2023-10-11 17:19:05', '2023-10-15 16:59:19'),
('2fd1f78b-a9ec-401a-99bb-e3080dbb5c14', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/ea2cfdfc-97e0-4444-9b57-51f68dd43dd1\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-09-22 17:02:36', '2023-09-07 02:30:23', '2023-09-22 17:02:36'),
('3034cc95-39bb-43a8-8c2f-93dee0df02d4', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/018205f3-93b8-4d8d-abce-916375e60cfb\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 15:23:47', '2023-11-26 15:22:34', '2023-11-26 15:23:47'),
('3057a730-bf85-4544-ba1a-46a89bd32b3e', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/9565daa6-2285-4d25-943d-35083e1b7db8\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 15:23:48', '2023-11-26 15:15:50', '2023-11-26 15:23:48'),
('30eb98fc-3cef-45f7-a46b-92acb438b503', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/47fc4048-3d4c-44ab-bf9c-f9e83ff77fff\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-07-24 19:23:31', '2023-07-24 16:47:59', '2023-07-24 19:23:31'),
('3315157b-951e-4477-9670-312fac1a3203', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ae639bb6-4de0-4ade-bcd0-d8e26c724711\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-04 00:47:47', '2023-11-04 00:47:00', '2023-11-04 00:47:47'),
('3358815a-b129-4af1-a440-21af07340b8c', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/e522ee95-5e91-49e1-9d42-0157996cd856\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-15 15:22:49', '2023-11-15 15:18:23', '2023-11-15 15:22:49'),
('33651d08-f2ca-4155-b12c-23b732c0d393', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/061cab1b-ae96-453b-b666-fbeece8c1432\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-24 22:31:16', '2023-06-24 22:28:22', '2023-06-24 22:31:16'),
('34baa5ef-22e0-4c05-9c13-1da8d4498143', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"7fbf7254-2551-4e27-8084-2974097684b1\"}', '2023-11-04 02:01:26', '2023-11-04 02:00:49', '2023-11-04 02:01:26'),
('34d503e2-d12d-4efe-80f7-c3d8d45b93c2', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/ea8bce24-d55c-402f-bd18-aea0afb11aa4\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-09-06 23:28:51', '2023-09-05 13:05:54', '2023-09-06 23:28:51'),
('35d81536-b1f1-4279-b66d-fee8272c37b1', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"f681a723-64f0-4a3e-92d5-04dfd11a98a7\"}', '2023-11-28 01:04:08', '2023-11-28 01:02:17', '2023-11-28 01:04:08'),
('3741383e-0c5b-4a94-8e92-9f0bb5ca0440', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/c573b04f-c38e-4bda-9ec7-a69c3d37fb53\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-09-05 12:25:48', '2023-08-24 03:38:40', '2023-09-05 12:25:48'),
('387ee512-d743-4494-b844-cd000c733982', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ab30285a-cf4d-45e7-807d-ad199deeb68c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', NULL, '2023-08-15 01:58:19', '2023-08-15 01:58:19'),
('3ac85441-deb0-47dc-910a-b27efa8dd61c', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"58d8452a-8d8f-4a4c-8ab6-137c1b38c093\",\"description\":null,\"address\":\", \\u0634\\u0627\\u0631\\u0639 \\u0627\\u0644\\u0646\\u0648\\u0631, \\u0627\\u0644\\u0633\\u064a\\u0628\\u200e, \\u0639\\u0645\\u0627\\u0646\"}', '2023-12-14 02:50:31', '2023-12-14 02:47:26', '2023-12-14 02:50:31'),
('3ae28093-fb42-4e38-8fbc-c6bf78f594b4', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/f63ba367-6a3c-486b-8181-5e474c6a6369\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-09-05 12:25:41', '2023-09-04 01:12:35', '2023-09-05 12:25:41'),
('3ceeff25-133b-4829-b0fd-6e44bfb03bd9', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/d69da9ad-8b8a-4f9c-a458-31033d731052\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 02:08:51', '2023-07-22 17:55:19', '2023-11-26 02:08:51'),
('3de31eeb-1c38-42d5-8a7c-72b2e97eb5a9', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/f681a723-64f0-4a3e-92d5-04dfd11a98a7\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-28 01:04:38', '2023-11-28 01:02:54', '2023-11-28 01:04:38'),
('3e55943b-983f-43b8-a599-47a3bfc5fb54', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"31ce363f-6aaf-41bd-ab37-67b9e1f75343\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:13', '2023-07-11 17:22:43', '2023-07-24 16:45:13'),
('3ef16cab-d68a-4eb0-a712-4365a700483c', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/44ccd6cc-bbb3-41a0-a42f-db7e1fae445c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-03 23:22:42', '2023-11-03 23:21:36', '2023-11-03 23:22:42'),
('4115175f-5042-4927-b747-223d8d135168', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/44de3aef-296a-4db9-8027-ffbeb314b0d3\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:47', '2023-12-08 03:38:42', '2023-12-13 01:54:47'),
('41c44b93-f792-4bbb-991f-0d2f3102df3d', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"113fb6ca-909f-4810-81d7-deaa70797630\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:19', '2023-07-11 00:52:22', '2023-07-24 16:45:19'),
('43a22103-0681-495d-b0ea-e4b6a0ce752a', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ac510889-b314-4fbc-ae3e-bd389cf9c590\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:26:40', '2023-12-14 02:26:40'),
('44eaf32e-27ad-45d2-ab4d-05287f1b8b46', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/71a50ee7-7db9-466f-a46c-9d9a1ca05118\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-24 15:25:02', '2023-07-21 14:43:36', '2023-07-24 15:25:02'),
('4a0b27a4-839a-4ff6-a4b2-5b8f37993b79', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/6003e427-ee5e-401e-82a4-fd73e2f0b49f\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:30:19', '2023-12-14 02:30:19'),
('4b11cd5f-ff57-4486-adad-79cdbcc70d91', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/b7de0545-cc99-41f4-8007-f1be16701494\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-25 14:03:50', '2023-06-24 23:39:45', '2023-06-25 14:03:50'),
('4b5e8d50-1f7b-42ad-b80e-2c6e2077fd2c', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7fbf7254-2551-4e27-8084-2974097684b1\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-04 02:01:26', '2023-11-04 01:59:57', '2023-11-04 02:01:26'),
('4d10f563-4386-47ea-8c3a-f385e6a49f39', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:57', '2023-12-05 04:24:08', '2023-12-13 01:54:57'),
('4d38e4de-e807-431d-aab4-8f2c1ee5d2fe', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/716fe201-5724-4a59-9cdc-9df3e403660b\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-07-21 04:04:45', '2023-07-21 04:04:45'),
('4e809bbd-e62c-4d42-b4d7-49b77b45a342', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/7411e939-8c78-43ff-9f2e-b434e7ecbadd\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-30 17:21:44', '2023-11-28 17:55:21', '2023-11-30 17:21:44'),
('4f678a5c-3475-4dcf-98d3-e527ef0f7d13', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/74062592-eb3d-452b-bd1b-bc35ff497d9a\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-24 18:24:07', '2023-07-24 18:18:45', '2023-07-24 18:24:07'),
('4f7f35ba-8548-4492-86d8-51aa121551e2', 'MixCode\\Notifications\\AccountStatusChanges', 'MixCode\\User', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', '{\"subject\":\"notifications.account_status\",\"message\":\"notifications.account_has_been_disabled\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"account\",\"action\":\"account_has_been_disabled\"}', '2023-12-14 02:40:54', '2023-12-14 02:35:06', '2023-12-14 02:40:54'),
('50d9077f-9ce0-4dc6-a592-7a63503d613a', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/e483a3d0-e520-4709-baad-d7e500389c77\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-22 02:42:02', '2023-08-20 14:17:53', '2023-08-22 02:42:02'),
('511f0546-350d-4bdb-a4a5-4eec250c88e5', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/185263e6-7fc2-41c1-abaa-a4e4d6d82d76\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-10-15 16:59:21', '2023-10-11 13:21:12', '2023-10-15 16:59:21'),
('5141b191-71f6-4630-a127-83d651dcaba0', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/4eda59cd-63a4-4042-bb6c-c752b6e3a476\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-25 01:15:42', '2023-07-25 00:34:02', '2023-07-25 01:15:42'),
('5173282d-c188-4ccb-90ce-227a7a6c13ee', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/f7dce302-652b-4950-b225-e80c69236f80\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-12 05:25:58', '2023-07-08 11:10:32', '2023-07-12 05:25:58'),
('51aa3a0b-4979-40cb-a07a-5520fdc05255', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/2926278f-3a9b-4c14-bcc0-5abb7396d95c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-07-17 14:05:45', '2023-07-17 14:05:45'),
('53bb0497-1029-433a-8896-f2ce61973251', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/f681a723-64f0-4a3e-92d5-04dfd11a98a7\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-28 01:04:09', '2023-11-28 01:01:06', '2023-11-28 01:04:09'),
('54a6ae41-6623-4e43-86e6-e0566b6dcea7', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c617c2e5-435a-4498-b7a8-418d89046b25\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-08-11 02:38:54', '2023-08-02 04:03:40', '2023-08-11 02:38:54'),
('55c1e91d-15ee-416e-aa01-1f3a4927d1a2', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:10', '2023-06-13 02:47:43', '2023-06-22 16:52:10'),
('5632744e-9261-48b6-bb49-587af73172ed', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/78dcf1d1-3b3e-4528-8081-a727d3c85bf1\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-21 02:22:15', '2023-11-20 22:32:30', '2023-11-21 02:22:15'),
('56ac7823-57a7-4f90-89ef-631859b8e5ce', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/247aff22-c120-4cad-8930-3efda6a906d2\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-01 02:15:48', '2023-10-30 02:44:39', '2023-11-01 02:15:48'),
('57e576a1-df23-44ed-96db-4375166d728a', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/44ccd6cc-bbb3-41a0-a42f-db7e1fae445c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-03 23:22:40', '2023-11-03 23:21:31', '2023-11-03 23:22:40'),
('590906dc-28e2-4df3-ba04-17ba6cb1e972', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:15', '2023-06-12 19:09:32', '2023-06-22 16:52:15'),
('5a1cdc25-cad3-4fd7-8146-01947d134920', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/355c29ea-d549-4baa-af43-f758e914fd1f\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:15:13', '2023-12-14 02:15:13'),
('5c3d8881-bc64-4f50-b230-1a0605ffde38', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"78dcf1d1-3b3e-4528-8081-a727d3c85bf1\"}', '2023-11-21 02:22:15', '2023-11-20 22:41:01', '2023-11-21 02:22:15'),
('5d42a912-6f14-4562-a1c1-f9841d7e8e12', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/764bef8b-bbc8-4540-acf2-1da86a3b49e7\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-30 17:21:36', '2023-11-29 03:52:25', '2023-11-30 17:21:36'),
('5dcf776d-fb75-4501-8154-e1b81e9cbec5', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"5621ec74-5dba-4d46-a26c-447e4bb9ace6\"}', NULL, '2023-12-13 21:25:57', '2023-12-13 21:25:57'),
('5eeaefcd-0f7c-4f5a-94b4-343aafce50d9', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/9565daa6-2285-4d25-943d-35083e1b7db8\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-26 15:18:42', '2023-11-26 15:16:58', '2023-11-26 15:18:42');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('5eefe09e-999c-419b-8052-04c054e07a93', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:23', '2023-06-12 19:00:54', '2023-06-22 16:52:23'),
('5efcc09d-6891-4fdc-8244-2d43310a0ef1', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/b3249b74-12a4-49ce-84b2-79e084e8df32\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:52', '2023-12-08 21:54:30', '2023-12-13 01:54:52'),
('624af0e9-f92d-49ac-acd9-b3213a3786fe', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/e6d05d75-0eb8-4ed5-ad66-a9c50e7dcbef\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-29 20:29:03', '2023-06-29 17:21:08', '2023-06-29 20:29:03'),
('636c43a8-4e1a-4455-8ced-c1a2174f1afb', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2024-12-24 08:47:08', '2023-12-14 02:44:37', '2024-12-24 08:47:08'),
('64a7d0c9-e0c8-4329-9eda-6d29fdfcca58', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/38d26890-9153-4ee9-be97-752b39e55351\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 15:22:11', '2023-11-15 01:52:05', '2023-11-15 15:22:11'),
('64ba7130-cae4-46f6-b8fd-ebf6d3354802', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/cafd0959-f830-454b-b388-abe599594fa8\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-25 00:28:37', '2023-07-25 00:27:34', '2023-07-25 00:28:37'),
('6561a129-dbef-4203-9b17-e8d01fc28855', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:08', '2023-06-13 02:53:38', '2023-06-22 16:52:08'),
('656fdb55-097c-4298-b792-7124a77691a5', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/e3404292-304e-4f87-b533-5b9a7a1966a7\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:24:13', '2023-12-14 02:24:13'),
('66a9ee5d-b524-4b00-b2d5-e5b264c9b0ac', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/dde7f74c-0da5-45ec-830a-68ae09c15795\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-20 15:45:18', '2023-07-15 02:44:38', '2023-07-20 15:45:18'),
('67df295b-d19d-4f5e-ade1-46e7c3871a50', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"85d41f87-4b2e-4cf3-b675-bc49e8dca33b\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-24 20:36:47', '2023-10-24 20:36:47'),
('68e39898-beed-4134-8f4e-6e972d3c8664', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/2c573a1e-f6a9-4a65-89f7-333d0fd97aa1\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-27 20:55:23', '2023-11-04 03:53:38', '2023-11-27 20:55:23'),
('690dd0e9-a204-4cc6-a3e9-eef52e99ecfc', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ae639bb6-4de0-4ade-bcd0-d8e26c724711\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-04 01:47:30', '2023-11-04 00:47:56', '2023-11-04 01:47:30'),
('69bfe7ff-c225-48ae-bf5e-364efb08e0a5', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/0170d0cb-cf11-40ae-a75e-bd56c0421827\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-21 02:22:15', '2023-11-20 22:25:21', '2023-11-21 02:22:15'),
('69c8be1e-fc9c-49bd-a96d-821035fb554b', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7fbf7254-2551-4e27-8084-2974097684b1\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-04 03:40:46', '2023-11-04 02:00:46', '2023-11-04 03:40:46'),
('69df6499-07ba-4401-aae7-5ab42f0e3df7', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/59893d46-2fc4-40f8-a3b1-1865767b6ee6\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-15 01:36:31', '2023-11-14 01:48:44', '2023-11-15 01:36:31'),
('69ed4f15-14d5-4620-bea4-cf1c17d8f7cc', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/a7b6ceda-e829-4e67-b731-ccf3119bc47e\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-03 23:17:10', '2023-11-03 22:19:15', '2023-11-03 23:17:10'),
('69fbd8f5-725c-4ccf-91d9-f9233bb7b425', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:19', '2023-06-12 19:07:56', '2023-06-22 16:52:19'),
('6a0c9fe5-e2f2-4fda-9be6-3c293e66a24d', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/4cdc59e3-ddf6-4219-8695-1246f1975de3\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-12-14 02:14:40', '2023-12-14 02:08:20', '2023-12-14 02:14:40'),
('6b7692b4-9c9e-4b01-a834-8d0e9a1866d9', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:27', '2023-06-10 22:58:35', '2023-06-22 16:52:27'),
('6c190245-7e7b-49f5-900a-d2d8315ddb19', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/edd71a5d-f4ed-49bb-9d13-23e21975642e\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-09-22 17:02:33', '2023-09-07 02:37:02', '2023-09-22 17:02:33'),
('6ccbb1dc-d0e8-4a4d-9ac4-57dd52677650', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/320896db-67be-4d28-842a-ee3f82c25b9e\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:50:31', '2023-06-14 11:45:11', '2023-06-22 16:50:31'),
('6cef2ecc-1023-404b-93d5-8270ea1ef879', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"44ccd6cc-bbb3-41a0-a42f-db7e1fae445c\"}', '2023-11-03 23:22:23', '2023-11-03 23:21:21', '2023-11-03 23:22:23'),
('6d4a64bc-10cf-4dc1-99b4-8c4175f6a8e1', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/71b087c3-4fc6-44f2-8539-fb9269f692c0\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 15:26:58', '2023-11-26 15:25:10', '2023-11-26 15:26:58'),
('6e4b93e2-eb1a-4c62-9294-93dbe9c823b6', 'MixCode\\Notifications\\ProductOrderCancelled', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.product_order_canceled\",\"message\":\"notifications.product_order_canceled\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/88474466-c1d8-495c-b993-26302cdcc864\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"customer_name\":\"Maichel Sameh\",\"customer_phone\":\"1226233679\"}', NULL, '2023-08-12 04:36:16', '2023-08-12 04:36:16'),
('6eded7c1-8baa-43c2-a2bc-5d3c5f70baae', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/185263e6-7fc2-41c1-abaa-a4e4d6d82d76\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-10-15 16:59:14', '2023-10-11 17:18:36', '2023-10-15 16:59:14'),
('6f188cf1-8817-4cb1-b992-4b182a58ea55', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-12-13 01:54:48', '2023-12-08 19:51:21', '2023-12-13 01:54:48'),
('71c3e032-5738-4082-b463-e5c3b96a1bca', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/5ab8193c-a58d-4bf8-9ee2-3b798fde48b7\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:42:02', '2023-12-14 02:42:02'),
('75736c98-c928-4b40-92dd-e1f5d575d5c3', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/f1a720ac-a505-4cfa-8c8b-de65fd43db61\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-08-11 03:24:13', '2023-08-11 03:24:13'),
('77a767bf-230c-47bd-b87d-8ff82ac09536', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/da35e30f-4423-44de-ac20-842e1a8734f3\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 15:22:09', '2023-11-15 01:54:34', '2023-11-15 15:22:09'),
('7885df57-e767-4d15-b3e2-52eb5a15ef84', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:28', '2023-06-10 22:52:14', '2023-06-22 16:52:28'),
('78e2c735-a523-4dd5-91b9-c016c121e6a7', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/29851491-b8ae-4443-9dbe-8af21e1e4522\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:50', '2023-12-08 21:53:04', '2023-12-13 01:54:50'),
('7a00f687-247b-4d29-8ed6-6eb6cfc4f58f', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:32', '2023-06-10 21:39:57', '2023-06-22 16:52:32'),
('7a2e0cb3-410a-48c6-a6a1-1ad70599e574', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"88e33f2a-44c3-4966-955c-3cc7c1ce8b9d\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-24 20:37:58', '2023-10-24 20:37:58'),
('7a33923b-4e64-432a-b2c9-b6ae126b3cbb', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"c1168d18-ed8a-478c-82f1-2af77b223043\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:25', '2023-07-10 05:28:49', '2023-07-24 16:45:25'),
('7a835209-d5eb-4fa6-bfb8-33a409159ab0', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/d52eab22-22c2-49de-ae2b-14cd52a000ee\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-05 02:49:11', '2023-07-25 01:52:20', '2023-08-05 02:49:11'),
('7b007b14-9a2b-453f-a95a-ac0b12b814f2', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/b0f8aff2-767e-4f6e-aa8f-ec20a166434a\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:40', '2023-12-08 21:51:27', '2023-12-13 01:54:40'),
('7cda6d7c-7302-4027-9ea1-9394310132ff', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"f3fea402-79b3-4e09-943d-0b2b1c10ca4e\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:11', '2023-07-12 15:39:48', '2023-07-24 16:45:11'),
('7ec4f816-622c-4a5b-ba3f-d5c3de0c6ce5', 'MixCode\\Notifications\\ProductOrderCancelled', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.product_order_canceled\",\"message\":\"notifications.product_order_canceled\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/a2397ce2-758e-47e1-a94f-f66c36afa66c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"customer_name\":\"Maichel Sameh\",\"customer_phone\":\"1226233678\"}', '2023-07-24 19:23:29', '2023-07-24 17:49:59', '2023-07-24 19:23:29'),
('7eda5dc2-cb21-4a4f-ab67-61491e3cdc5e', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"6b40854a-f919-4d7a-b3d2-245137214686\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:20', '2023-07-11 00:51:33', '2023-07-24 16:45:20'),
('7f458e7d-36cd-45c7-bed8-6990f30e36a5', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/b7a5e556-cedd-47f7-a52f-a622abbcb233\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-22 02:42:00', '2023-08-20 14:22:52', '2023-08-22 02:42:00'),
('7fb0d93f-c266-4d1b-a98d-1ab5f22d89d4', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/ed238263-fd1f-4c67-8008-2bbbcfc303b6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-24 18:24:20', '2023-07-24 18:20:44', '2023-07-24 18:24:20'),
('805625c5-d461-4e15-9d1c-08b4c6a0012e', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/827b6dab-72e7-414c-a807-ec33ef212f9f\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-24 22:31:49', '2023-06-24 22:23:02', '2023-06-24 22:31:49'),
('816bfc3f-4bbc-4470-8d51-2e080f0d1c27', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/50a3827b-db2f-4edf-bb48-0779dbf29410\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-25 01:46:00', '2023-07-25 01:26:03', '2023-07-25 01:46:00'),
('822525a6-7d3b-4727-a0c8-e5890b3bdc43', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/2c573a1e-f6a9-4a65-89f7-333d0fd97aa1\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-27 20:55:21', '2023-11-16 22:36:37', '2023-11-27 20:55:21'),
('8252d007-131c-4c26-bf9d-7d4afe3968d4', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/cb0baa56-bc61-447d-97d1-0ff40d94e6a2\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-27 21:39:41', '2023-11-27 21:38:46', '2023-11-27 21:39:41'),
('84396c3f-6071-4c11-9dfb-d1fdbd066dd3', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/09b9e208-620e-4bee-8d52-17f528a1c7af\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-24 15:04:30', '2023-06-24 11:32:44', '2023-06-24 15:04:30'),
('8502ffb5-e782-4c51-86b4-0faaf59403d0', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/59893d46-2fc4-40f8-a3b1-1865767b6ee6\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-15 01:36:32', '2023-11-10 15:30:04', '2023-11-15 01:36:32'),
('863fce1a-5770-46ca-bceb-114158ff682c', 'MixCode\\Notifications\\AccountStatusChanges', 'MixCode\\User', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', '{\"subject\":\"notifications.account_status\",\"message\":\"notifications.account_has_been_disabled\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"account\",\"action\":\"account_has_been_disabled\"}', '2023-12-14 02:40:55', '2023-12-14 02:35:05', '2023-12-14 02:40:55'),
('868e882a-4893-4ad7-8c7b-16894f3b6f7b', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"e522ee95-5e91-49e1-9d42-0157996cd856\"}', '2023-11-15 01:41:44', '2023-11-14 01:49:25', '2023-11-15 01:41:44'),
('87325e2b-c087-4cd1-bb48-eb8ec81377ef', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/38d26890-9153-4ee9-be97-752b39e55351\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-16 14:25:22', '2023-11-15 16:56:50', '2023-11-16 14:25:22'),
('87b9309b-78b7-439e-890f-863b1af970a6', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"58ba6e8a-db9d-473d-b235-22d90d4b7a1f\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:14', '2023-07-11 15:40:50', '2023-07-24 16:45:14'),
('88a1d1e6-bf6a-4dee-9632-c529be1f1548', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/481b7b0f-ff7b-4585-abdf-e02efb8bd891\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-29 20:29:10', '2023-06-29 17:01:43', '2023-06-29 20:29:10'),
('8b9b6a9c-d7ed-424d-93d0-93a630a05332', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/0cc9bc1e-83e6-4d68-95f9-e32a833d3b06\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-24 03:33:44', '2023-08-22 03:30:42', '2023-08-24 03:33:44'),
('8bb19762-0490-4e61-ad4f-17e180c6d43b', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/4d151a3e-3e63-4c2f-b851-1e0241b26c1c\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-16 04:43:15', '2023-08-08 01:29:37', '2023-08-16 04:43:15'),
('8c1cef01-9ea9-4311-bdc4-3e9ce6963817', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/64504ba6-266d-4bfd-b703-96e359da977d\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-07-14 00:01:30', '2023-07-14 00:01:30'),
('8e292bb0-401d-4657-8ad8-d85197719fd9', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/312603c5-a830-4b15-921b-32a1b085bf5a\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-09-05 12:25:53', '2023-08-26 18:25:36', '2023-09-05 12:25:53'),
('8e2bcee6-4305-4412-9724-6b39a608fcf9', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/f87edbf2-8bfd-46f9-aff5-a245ac03f1aa\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-22 16:49:43', '2023-06-16 23:54:20', '2023-06-22 16:49:43'),
('903122d5-8cd6-4e6f-9a8e-2d19b15cb906', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c617c2e5-435a-4498-b7a8-418d89046b25\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-26 02:06:39', '2023-08-02 02:47:59', '2023-11-26 02:06:39'),
('903fc78b-c3cd-418f-aca5-1fbc2cc4775d', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/9dea2bbb-3004-40b6-92d2-d11fce843558\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:52:33', '2023-12-14 02:52:33'),
('925e738a-2a93-4f65-9723-50ee076d117a', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/da35e30f-4423-44de-ac20-842e1a8734f3\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-16 14:25:23', '2023-11-15 16:56:27', '2023-11-16 14:25:23'),
('931b7c26-66ec-4503-8b61-cf2805176548', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/47e309f0-1427-40ca-b3ad-45792c8419a7\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-20 15:45:21', '2023-07-15 01:47:42', '2023-07-20 15:45:21'),
('93da67c5-3a31-4066-8898-5378ac3e0acd', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"ae639bb6-4de0-4ade-bcd0-d8e26c724711\"}', '2023-11-04 00:55:46', '2023-11-04 00:48:23', '2023-11-04 00:55:46'),
('942c5603-f4fc-467a-ad11-de0a561e696f', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/73896f13-fee7-4f6f-b50e-20571f7235b3\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:36:32', '2023-12-14 02:36:32'),
('94320e3f-c10c-4961-8f98-3880a4dbb5d7', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/af6476cc-dd15-447b-9c3e-244d006e3458\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 15:22:12', '2023-11-15 01:48:58', '2023-11-15 15:22:12'),
('952e8f01-8865-4090-a7fd-f7efa2562d82', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/2767bad9-fced-4621-a584-110e80c7a37f\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-20 15:45:20', '2023-07-15 01:49:36', '2023-07-20 15:45:20'),
('95c68b7c-9300-4689-9663-c015cab713ec', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/28b1178e-0380-4440-862c-96e27d2ad2d2\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-11-01 02:15:51', '2023-10-30 02:42:18', '2023-11-01 02:15:51'),
('97125d4e-fc40-4a3d-9430-053605e635f6', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"32eaca7f-95b1-4909-8791-f9e2a4eeb3d9\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-27 18:17:49', '2023-10-27 18:17:49'),
('97385f02-2f89-42d5-b8cd-b73a64db9d41', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/fb751d69-9fe2-4017-948f-134a1117c41f\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-22 02:42:07', '2023-08-20 14:11:05', '2023-08-22 02:42:07'),
('975ade43-72e6-4c0a-ba40-5467ecc4a08e', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"f48cedd3-f7b0-4bc2-851c-ee407ea6851d\",\"description\":null,\"address\":\", \\u0647\\u062c\\u064a\\u0631\\u0645\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-08-15 00:16:05', '2023-08-12 16:30:02', '2023-08-15 00:16:05'),
('9834477f-d4d9-4f77-9674-68f515b1f295', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/5a651a52-d168-4549-b225-25ccdb3e1b23\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-11-30 17:21:47', '2023-11-27 21:01:21', '2023-11-30 17:21:47'),
('984f4dad-c56e-4129-af03-d38d09aeacff', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/642ef59f-9127-4799-a724-93de4af6c3d0\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-20 15:45:27', '2023-07-14 23:47:20', '2023-07-20 15:45:27'),
('9925901f-ef69-450a-8e1e-a874fd1f2a38', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/e522ee95-5e91-49e1-9d42-0157996cd856\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-15 15:22:50', '2023-11-15 15:18:22', '2023-11-15 15:22:50'),
('9a7b1709-2cfb-4ae1-873e-4fb9152b7f8b', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/1e1bdcc2-791e-4bf7-9e1c-70a7e864c728\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:50:02', '2023-12-14 02:50:02'),
('9af57e5f-cd1c-4203-80db-436c078aa258', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/1936d2aa-7372-4a68-86de-5863e861effc\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-24 15:36:30', '2023-07-24 15:33:20', '2023-07-24 15:36:30'),
('9c46ed07-4648-4916-b06f-37f63517c018', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"b965f637-f06e-4076-90c7-f61f347aae04\"}', '2023-11-18 01:51:55', '2023-11-18 01:51:34', '2023-11-18 01:51:55'),
('9cb288c1-67c6-4887-b454-2554f209ef63', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/764bef8b-bbc8-4540-acf2-1da86a3b49e7\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-30 17:21:39', '2023-11-29 03:52:01', '2023-11-30 17:21:39'),
('9ccc5b9a-3403-43db-b957-8cc4a1fc0b2f', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/55185a4b-f018-427f-941d-f483d91a6545\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-25 14:03:45', '2023-06-25 13:59:05', '2023-06-25 14:03:45'),
('9cd7e2b1-7a12-4680-b505-79d3d4739028', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/08805a4f-a132-4d4e-8073-aa02d1f254b6\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-07-24 19:23:32', '2023-07-22 18:04:38', '2023-07-24 19:23:32'),
('9cfc6c02-5c26-4afa-9a61-ad992d1842c9', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1e8b8141-3735-43ae-b5c0-d374ac487657\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-29 20:29:28', '2023-06-29 15:38:09', '2023-06-29 20:29:28'),
('9d6124d8-2bba-4154-990d-e5581694c079', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/b965f637-f06e-4076-90c7-f61f347aae04\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-18 01:51:57', '2023-11-18 01:50:36', '2023-11-18 01:51:57'),
('9dbc9cfb-7521-41ba-9e44-9c178546d836', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/7411e939-8c78-43ff-9f2e-b434e7ecbadd\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-30 17:21:41', '2023-11-29 03:49:56', '2023-11-30 17:21:41'),
('9e3a51fa-542d-4403-a50a-e8da968120c7', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"912332c6-18d7-470a-ad16-e5be8d7c45cc\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:14', '2023-07-11 14:48:08', '2023-07-24 16:45:14'),
('9f36ccc3-6736-4905-8839-e33cac567146', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/3901e59b-89c7-4d6a-9544-ebc43571261b\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-11-30 17:21:45', '2023-11-28 17:53:30', '2023-11-30 17:21:45'),
('a26fbbf7-1459-483b-8f4c-c3adcc87df52', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/e522ee95-5e91-49e1-9d42-0157996cd856\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-15 15:22:50', '2023-11-15 15:18:22', '2023-11-15 15:22:50'),
('a3147286-7b2d-4aa7-a6ea-f525ddcad6f5', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/b31f4cf8-5962-4e8e-ac49-3ac865e96fab\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-10-15 16:59:22', '2023-10-11 13:17:07', '2023-10-15 16:59:22'),
('a3550531-aee9-45f4-8575-993596cacfd1', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/08805a4f-a132-4d4e-8073-aa02d1f254b6\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-07-24 05:15:37', '2023-07-22 18:04:14', '2023-07-24 05:15:37'),
('a384a3ac-f162-4e5a-9938-ee0d64786443', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/bcd9b587-b666-4ce2-9021-4064c8720407\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:41', '2023-12-08 21:48:35', '2023-12-13 01:54:41'),
('a53336e5-2e45-48a0-9bff-c041c8427d1f', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/716fe201-5724-4a59-9cdc-9df3e403660b\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-07-22 15:20:20', '2023-07-21 04:04:48', '2023-07-22 15:20:20'),
('a65a2fe5-e56f-4dbe-8cf7-f541432ac0d3', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c617c2e5-435a-4498-b7a8-418d89046b25\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-08-11 02:38:54', '2023-08-02 04:03:39', '2023-08-11 02:38:54'),
('a6cd9082-4dd6-4af5-bdd7-79993255edd5', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/349880c7-23f0-483f-9d83-7bd378784f2c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-07-14 00:11:51', '2023-07-14 00:11:51'),
('a7e4f538-c072-4d3d-887d-e9432e357511', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"7af2ac1d-eec3-4022-af01-243f23b2165c\"}', '2023-11-15 15:22:07', '2023-11-15 15:20:26', '2023-11-15 15:22:07'),
('a93ccfab-c090-4044-95ac-85db6cc9db02', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7fbf7254-2551-4e27-8084-2974097684b1\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-15 01:36:33', '2023-11-14 01:47:10', '2023-11-15 01:36:33'),
('aa5811d4-a5c5-403c-9032-7c0b0ff074ca', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/097c090c-3ddc-49e0-8bcf-29f8b7fc8e95\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:45', '2023-12-06 19:27:12', '2023-12-13 01:54:45'),
('ab0bf038-0602-4578-87ff-2042f9a798ab', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/f681a723-64f0-4a3e-92d5-04dfd11a98a7\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-28 01:04:39', '2023-11-28 01:02:31', '2023-11-28 01:04:39'),
('ab5b6227-bac8-4424-bb1f-455a4f32405b', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/64504ba6-266d-4bfd-b703-96e359da977d\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-07-14 00:01:01', '2023-07-14 00:01:01'),
('ab7b3d80-b872-4a0c-ad50-052af30eba72', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/6eab7b35-bd10-45c4-96bf-de45b852c519\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:28:30', '2023-12-14 02:28:30'),
('abab7696-28f4-498e-86ab-9728ac637a79', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/19320fe5-ceb3-40a0-858b-9c54a13177d2\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:51:19', '2023-12-14 02:51:19'),
('abaebeb5-53ab-4476-ba81-61f7145df2c7', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:25', '2023-06-10 23:05:37', '2023-06-22 16:52:25'),
('abf4e975-acbc-447e-b53b-f0b2cd255be2', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/bc752484-1b34-4046-a0a7-b7c6e3172d8c\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-20 15:45:24', '2023-07-15 01:17:08', '2023-07-20 15:45:24'),
('ac6dda8b-519c-4124-826b-37813d7a325d', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"4cdc59e3-ddf6-4219-8695-1246f1975de3\"}', NULL, '2023-12-13 21:28:55', '2023-12-13 21:28:55'),
('ac94582a-fb7e-4f37-ac46-430cc73bc640', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"d153c9e3-65d8-4fb5-b25f-5bab4728c0b9\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:10', '2023-07-12 15:41:23', '2023-07-24 16:45:10');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('adaa856a-c683-4b65-8fb3-e0a66b589233', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/82fba06d-eac5-487e-9919-f261ec20667f\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-29 20:29:34', '2023-06-29 15:35:36', '2023-06-29 20:29:34'),
('b0317f81-8baf-494b-9d74-0e4ea7ed92d9', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/59893d46-2fc4-40f8-a3b1-1865767b6ee6\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 01:41:46', '2023-11-10 15:29:45', '2023-11-15 01:41:46'),
('b07bf56d-cbfb-47ec-9772-7341ea493d2d', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/0ba64045-8b10-41e9-bf3a-61cf538124ff\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-11-27 20:55:28', '2023-11-03 22:06:14', '2023-11-27 20:55:28'),
('b15270bd-fbc6-49c0-bdba-82d529409d5d', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7af2ac1d-eec3-4022-af01-243f23b2165c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-15 15:22:49', '2023-11-15 15:20:39', '2023-11-15 15:22:49'),
('b181693e-c8ef-47eb-9b68-ec66d9d7a3ce', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/6af62f61-559e-4838-9c4c-706060c46bbb\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-05 02:49:13', '2023-07-25 01:56:51', '2023-08-05 02:49:13'),
('b4ebd0f9-9018-444f-97d4-4397c769fc84', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:12', '2023-06-13 02:47:23', '2023-06-22 16:52:12'),
('b568ea45-3ed5-4544-9c0b-f6e0046b8b4b', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"92debff2-236b-432d-bd93-94a7d14c5a15\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-27 18:14:33', '2023-10-27 18:14:33'),
('b5bc2508-75fe-413b-9045-254149cc8b78', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"ad38cd9b-89be-4592-9965-a2fd57c3c992\",\"description\":null,\"address\":\", Kahanat, Oman\"}', NULL, '2023-10-23 20:07:37', '2023-10-23 20:07:37'),
('ba79bc11-78fc-4548-9683-ba3ea86bdc56', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/2c573a1e-f6a9-4a65-89f7-333d0fd97aa1\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-27 20:55:24', '2023-11-03 23:27:37', '2023-11-27 20:55:24'),
('bc31f2c3-a5a8-45d2-990a-7dae9e7104e1', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"3fd85eaa-9635-4678-8752-4a6549d01d25\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:16', '2023-07-11 14:31:31', '2023-07-24 16:45:16'),
('bc46d509-b17e-4e91-a1e8-3f34509383c5', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ae639bb6-4de0-4ade-bcd0-d8e26c724711\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-04 01:47:30', '2023-11-04 00:48:01', '2023-11-04 01:47:30'),
('be596b51-becf-4380-a91f-3915d913b571', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/cb0baa56-bc61-447d-97d1-0ff40d94e6a2\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-27 21:09:21', '2023-11-27 21:09:08', '2023-11-27 21:09:21'),
('bf10982f-6b4b-4634-97ce-e3ab8e87d732', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-08-22 02:42:05', '2023-08-20 14:12:29', '2023-08-22 02:42:05'),
('bfeec441-6470-4f12-aa7e-918fd2e7a7fd', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/47fc4048-3d4c-44ab-bf9c-f9e83ff77fff\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-07-24 19:23:30', '2023-07-24 16:48:02', '2023-07-24 19:23:30'),
('c00fdb4c-8add-42a0-b43d-aa35b4464a74', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7fbf7254-2551-4e27-8084-2974097684b1\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-04 03:40:46', '2023-11-04 02:01:01', '2023-11-04 03:40:46'),
('c2b65cf7-9c90-4838-9a0b-8af57e9aa289', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/77ed4473-580c-4279-9221-e2482c16e790\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-29 20:29:15', '2023-06-29 15:39:04', '2023-06-29 20:29:15'),
('c3497e3d-1a63-4c24-bee7-e4295ecb224f', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/4cdc59e3-ddf6-4219-8695-1246f1975de3\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-12-14 02:14:40', '2023-12-14 02:08:17', '2023-12-14 02:14:40'),
('c4eb7b59-b6f6-4e2e-b893-e081a7a207d6', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"6a691507-ee69-4c2f-8d0e-b0179eff8d73\"}', '2023-11-19 01:51:13', '2023-11-19 01:50:08', '2023-11-19 01:51:13'),
('c52364b5-21e4-43f7-a5dd-99d5f927a6a2', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/349880c7-23f0-483f-9d83-7bd378784f2c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-07-24 19:23:33', '2023-07-22 15:49:07', '2023-07-24 19:23:33'),
('c6350c81-efe4-41b8-9a68-eca2a840ab85', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/5621ec74-5dba-4d46-a26c-447e4bb9ace6\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-13 21:25:24', '2023-12-13 21:25:24'),
('c760daba-41fa-4b16-9438-511e64d37941', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/b965f637-f06e-4076-90c7-f61f347aae04\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-18 01:52:25', '2023-11-18 01:51:14', '2023-11-18 01:52:25'),
('c7ee7bb6-5014-453d-8478-4f09256399d1', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/5321ae43-adc4-42e1-a5a3-79078cc7efc8\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-26 21:40:28', '2023-06-25 21:25:15', '2023-06-26 21:40:28'),
('c897640e-ccaf-4ad0-9e07-238013789e1e', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ab30285a-cf4d-45e7-807d-ad199deeb68c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', NULL, '2023-10-23 20:04:16', '2023-10-23 20:04:16'),
('c8bd2192-6156-4069-af2a-c522e80cc8c4', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/0d3639de-5470-46e4-931c-aee686676f9e\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-22 16:49:58', '2023-06-14 17:46:03', '2023-06-22 16:49:58'),
('c93571be-3153-4ae6-9001-8181bb57e278', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/6a691507-ee69-4c2f-8d0e-b0179eff8d73\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-19 04:43:59', '2023-11-19 01:50:21', '2023-11-19 04:43:59'),
('c97a49cf-c765-45f1-9627-c9282f9c89e7', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/591c91ac-5ee7-4a16-80d1-241a76455a28\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-07-24 19:23:33', '2023-07-22 17:56:28', '2023-07-24 19:23:33'),
('cb3d75dc-c314-4bed-9acd-1e60212852a7', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/da35e30f-4423-44de-ac20-842e1a8734f3\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-16 14:25:22', '2023-11-15 16:56:30', '2023-11-16 14:25:22'),
('cc5175f2-655f-4028-baae-8dff32b1cfe9', 'MixCode\\Notifications\\AccountStatusChanges', 'MixCode\\User', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', '{\"subject\":\"notifications.account_status\",\"message\":\"notifications.account_activated_successfully\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"account\",\"action\":\"account_activated_successfully\"}', '2023-12-14 02:40:54', '2023-12-14 02:39:14', '2023-12-14 02:40:54'),
('cca30bf5-9b94-4e45-88a4-798d416b3ead', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"565db297-5c25-4228-a1ba-254ecc73b916\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:11', '2023-07-12 14:50:45', '2023-07-24 16:45:11'),
('cd0f9593-3fb0-4df4-91f2-95fc7664e194', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/44ccd6cc-bbb3-41a0-a42f-db7e1fae445c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-04 00:40:01', '2023-11-04 00:26:13', '2023-11-04 00:40:01'),
('cdacb877-27ab-4f6c-babe-462d4ff7bd6a', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"ddc716c7-9e1c-4c19-8de1-b01282d80d80\",\"description\":null,\"address\":\", Kahanat, Oman\"}', '2023-07-24 16:45:21', '2023-07-10 23:47:24', '2023-07-24 16:45:21'),
('ce229150-f341-4bed-912c-f9545ee84050', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/90f8467d-3dd2-4c10-935c-60c40746eaee\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-26 21:40:46', '2023-06-25 20:13:53', '2023-06-26 21:40:46'),
('cf80312e-5ede-4d8e-a2bc-f7ddcc0dca50', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/58d8452a-8d8f-4a4c-8ab6-137c1b38c093\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:47:26', '2023-12-14 02:47:26'),
('cf8a222f-eb7f-4b17-99ef-413daf18c48f', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/972d2dbc-7fef-43d4-b15d-6eb80e9c27be\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-26 21:40:44', '2023-06-25 21:24:03', '2023-06-26 21:40:44'),
('cf934118-47e0-429c-b8ff-4b387055ab65', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/31396bf8-8edd-47be-b0d3-1d2af4ff630e\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:45:37', '2023-12-14 02:45:37'),
('cfde23a3-336e-49b3-8092-8950cbab5df4', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/600ae9df-1f17-405b-8a53-187924bb53a9\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-24 15:04:13', '2023-06-24 11:35:34', '2023-06-24 15:04:13'),
('d16372c5-a838-4680-849c-3ffed6b3404f', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/3f9eb13e-98d2-4219-99d6-6dc6fda39a02\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-25 00:28:42', '2023-07-25 00:18:22', '2023-07-25 00:28:42'),
('d2496b19-bb7a-4a2d-8d61-976cefb3ebfb', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/cb0baa56-bc61-447d-97d1-0ff40d94e6a2\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-11-27 21:09:22', '2023-11-27 21:09:01', '2023-11-27 21:09:22'),
('d372afad-6d4b-48fc-9828-8394cd026ced', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/79f5ed4e-b6b4-4328-b6df-034e3108d9c9\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-06 12:52:33', '2023-07-04 13:26:54', '2023-07-06 12:52:33'),
('d504a20a-9090-4f7b-bf43-7e1f21126f1b', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/38d26890-9153-4ee9-be97-752b39e55351\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-16 14:25:22', '2023-11-15 16:56:54', '2023-11-16 14:25:22'),
('d5fc9c44-17b5-4963-9269-bc78267b2d3d', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/185263e6-7fc2-41c1-abaa-a4e4d6d82d76\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-10-15 16:59:18', '2023-10-11 17:18:21', '2023-10-15 16:59:18'),
('d6a1c1c7-c243-4ac4-8e33-4b6e387b37a3', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:18', '2023-06-12 19:08:19', '2023-06-22 16:52:18'),
('d837f22d-ded6-400c-a774-527e4c1f976c', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c20cc8bb-a9f4-4cbd-8f34-767034233ef4\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-13 21:22:26', '2023-12-13 21:22:26'),
('d84e6aae-51f8-4307-b906-990fb1be5637', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/6c1dba27-037b-46fd-8004-04bf72e2eca4\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-23 01:14:17', '2023-06-23 01:11:16', '2023-06-23 01:14:17'),
('da6c5c04-2c6f-46d2-8925-dec588203a80', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/10219638-e508-40f2-8667-1cf70ba474ab\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:54', '2023-12-06 19:15:08', '2023-12-13 01:54:54'),
('dcfcac7d-2e80-45f0-b507-ab9a02401e6d', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/7411e939-8c78-43ff-9f2e-b434e7ecbadd\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-30 17:21:43', '2023-11-29 03:49:28', '2023-11-30 17:21:43'),
('dd29ffa3-13e2-46b9-9a5c-0d93c75e6560', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"3aa9e20b-2705-4ccd-89fa-89e6d9e12650\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-24 20:33:52', '2023-10-24 20:33:52'),
('dd981a27-11e1-469a-b0fc-e07195792045', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"780f79bd-2419-4f03-908a-ae9864cddc21\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:23', '2023-07-10 20:21:47', '2023-07-24 16:45:23'),
('dd9dfef3-1f63-4da5-a706-7f4fca6862e9', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/185263e6-7fc2-41c1-abaa-a4e4d6d82d76\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-10-15 16:59:11', '2023-10-14 06:30:56', '2023-10-15 16:59:11'),
('e10dc6dd-a36a-4ab2-beb5-98cbb32a4a4a', 'MixCode\\Notifications\\OrderIsDelivered', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_is_delivered\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ae639bb6-4de0-4ade-bcd0-d8e26c724711\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_is_delivered\"}', '2023-11-04 01:53:31', '2023-11-04 01:52:19', '2023-11-04 01:53:31'),
('e27e450d-b599-42b3-a6e4-1bf234764704', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/8f758e07-3dce-470d-bd38-6c1e1eab7cc8\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-24 11:38:51', '2023-06-24 11:37:17', '2023-06-24 11:38:51'),
('e3d1e2d0-d14e-4ef8-9e0a-f7467c7f823d', 'MixCode\\Notifications\\ProductOrderCancelled', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.product_order_canceled\",\"message\":\"notifications.product_order_canceled\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/dc2a4700-5a90-4eae-977b-c8a44713069b\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"customer_name\":\"Maichel Sameh\",\"customer_phone\":\"1226233679\"}', NULL, '2023-08-12 04:36:24', '2023-08-12 04:36:24'),
('e4f63041-8e48-465b-8515-6fc81ae1facd', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/99c9cb82-c19e-43df-889b-98c4d8f8f2a8\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-09-05 12:25:39', '2023-09-05 02:31:16', '2023-09-05 12:25:39'),
('e5381e4c-8496-4892-846c-695569957f87', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"372121c2-6739-474b-8f23-9530438ade28\",\"description\":null,\"address\":\", \\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', '2023-07-24 16:45:17', '2023-07-11 14:32:14', '2023-07-24 16:45:17'),
('e586dbbf-1f27-4d33-bd7d-1c14cd991497', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/350c0570-c215-47ed-a5e2-9004652b91b4\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-16 04:43:13', '2023-08-16 03:48:46', '2023-08-16 04:43:13'),
('e6be5231-8eec-47df-a32b-fad7f4380702', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/d69da9ad-8b8a-4f9c-a458-31033d731052\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-08-02 02:29:54', '2023-08-02 02:29:54'),
('e6f802a4-2569-4ce2-b36c-221a8604a63e', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/329b6a7b-c11a-4533-941a-7747b2615d9b\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-25 01:15:37', '2023-07-25 00:32:57', '2023-07-25 01:15:37'),
('e71ba649-1562-4cf7-a877-42c2d0d66c37', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7b272c3a-7b51-4154-b6d5-0fb6836669b4\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:18:36', '2023-12-14 02:18:36'),
('e72e45ec-4c92-43d0-abac-29d17ca044e9', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/2c573a1e-f6a9-4a65-89f7-333d0fd97aa1\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-11-27 20:55:27', '2023-11-03 22:17:42', '2023-11-27 20:55:27'),
('e735829a-c5d4-4ece-a82e-15147c60f011', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/bf0ee2a1-1803-4f9d-8902-03d418d3ab04\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-21 02:22:14', '2023-11-21 02:18:19', '2023-11-21 02:22:14'),
('e7c4cdf8-0359-4169-8ab2-5dbd456db677', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"59893d46-2fc4-40f8-a3b1-1865767b6ee6\"}', '2023-11-15 01:41:45', '2023-11-14 01:48:13', '2023-11-15 01:41:45'),
('e8dcc297-5ed1-402e-8c6b-744016333071', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/288a98f5-e5c1-4983-96e7-a71838903b86\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-12-13 01:54:38', '2023-12-13 01:53:22', '2023-12-13 01:54:38'),
('ea8cd862-c824-41c6-8a09-eb2ac56a68fd', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/b20aa422-0935-468c-98b7-1f6fde6b8a1d\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-08-16 04:43:16', '2023-08-07 00:25:43', '2023-08-16 04:43:16'),
('ea9f9285-4660-4f81-9819-c6aa3f466985', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/12d3a5ba-8b7e-454f-b86b-6c4b6dddcd57\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-20 15:45:25', '2023-07-15 01:15:19', '2023-07-20 15:45:25'),
('eac3d3cf-8103-488a-ba74-fbf7effb1b63', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:21', '2023-06-12 19:06:43', '2023-06-22 16:52:21'),
('eb86979d-2547-4327-8559-f82cdd5b8074', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/591c91ac-5ee7-4a16-80d1-241a76455a28\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-07-24 05:16:12', '2023-07-22 17:56:11', '2023-07-24 05:16:12'),
('ebc320d5-a9ba-4c05-897a-3e4f9bd41b61', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/ab30285a-cf4d-45e7-807d-ad199deeb68c\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', NULL, '2023-08-15 01:58:13', '2023-08-15 01:58:13'),
('ebfea7dd-e598-47e0-86b2-dcdd9ad9d599', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"ab30285a-cf4d-45e7-807d-ad199deeb68c\",\"description\":null,\"address\":\", Kahanat, Oman\"}', '2023-10-23 20:02:56', '2023-08-15 00:21:27', '2023-10-23 20:02:56'),
('ec562767-c184-4b1c-b3ff-36b878922afe', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/44ccd6cc-bbb3-41a0-a42f-db7e1fae445c\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-03 23:22:26', '2023-11-03 23:18:57', '2023-11-03 23:22:26'),
('ee1d8559-4fbe-4863-99ae-d74fe6aa856e', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/aa705632-93ff-411a-b450-35f42616115d\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-07-24 19:23:31', '2023-07-23 17:37:33', '2023-07-24 19:23:31'),
('ee34f0a5-f3fc-421f-be24-aaf67a8a06c3', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/83cda510-0304-479b-a98f-7b7c8140fd0f\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-08-16 04:43:21', '2023-08-07 00:21:38', '2023-08-16 04:43:21'),
('ef565eb4-4c22-41f0-9f8a-333c4cc15bcb', 'MixCode\\Notifications\\NewOrderHasBeenCreatedForDrivers', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"New Request\",\"message\":\"You Have New Request\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"0c4c09bf-77ed-4c75-a61c-5a55895a3889\",\"description\":null,\"address\":\"\\u0643\\u0647\\u0646\\u0627\\u062a, \\u0639\\u0645\\u0627\\u0646\"}', NULL, '2023-10-27 18:23:16', '2023-10-27 18:23:16'),
('f0060db0-90fa-4463-a9d1-f66d0cc53bcc', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/7af2ac1d-eec3-4022-af01-243f23b2165c\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-15 15:22:08', '2023-11-15 15:19:40', '2023-11-15 15:22:08'),
('f1104081-0b69-4900-8fe3-b774d3fc703c', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/5621ec74-5dba-4d46-a26c-447e4bb9ace6\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-12-14 02:14:39', '2023-12-14 02:08:35', '2023-12-14 02:14:39'),
('f16a8e84-9089-4089-b514-b422d096cd2c', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/241d7615-c96e-4ce9-850c-21e7436d8a87\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:59', '2023-12-07 02:01:50', '2023-12-13 01:54:59'),
('f21bf530-e6fd-49fb-9bcf-c676777c37f2', 'MixCode\\Notifications\\OrderHasBeenAcceptedForProvider', 'MixCode\\User', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '{\"subject\":\"Order Status\",\"message\":\"order accepted successfully , the driver is on his way\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\",\"item_id\":\"c617c2e5-435a-4498-b7a8-418d89046b25\"}', '2023-11-26 02:04:47', '2023-08-02 02:51:45', '2023-11-26 02:04:47'),
('f236e400-2adb-43bc-b77e-24985f4b51d5', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/281f2541-4f6e-461f-a410-36e849d49435\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', NULL, '2023-12-14 02:49:24', '2023-12-14 02:49:24'),
('f32afe6d-2c1f-47df-a057-393ceb04c528', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/29ef5a1f-5f3e-42c8-850d-0216fc14bab9\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-07-20 15:45:23', '2023-07-15 01:46:32', '2023-07-20 15:45:23'),
('f3a2922f-86f0-4270-b510-7f07867fc2fd', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:51:53', '2023-06-04 22:42:28', '2023-06-22 16:51:53'),
('f48d2e14-ecae-4ee0-a213-c58819a33d58', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.product_Has_been_update\",\"message\":\"notifications.product_Has_been_updated_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/1846fda4-1922-4454-bc6d-a6c69f9379d6\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-06-22 16:52:30', '2023-06-10 21:42:42', '2023-06-22 16:52:30'),
('f7258afe-746b-4bcf-a66e-210abe67d86a', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/59893d46-2fc4-40f8-a3b1-1865767b6ee6\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-15 01:36:31', '2023-11-14 01:48:44', '2023-11-15 01:36:31'),
('f7a73883-3252-464f-80d6-8bf47127af0b', 'MixCode\\Notifications\\NewProductHasBeenCreated', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_product_Has_been_released\",\"message\":\"notifications.new_product_Has_been_released_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/products\\/5fc5dc73-7159-4c15-b9ac-74d5edff72b0\",\"color\":\"bg-info\",\"icon\":\"fas fa-store\"}', '2023-12-13 01:54:56', '2023-12-08 21:49:36', '2023-12-13 01:54:56'),
('f8de4a94-cc64-49d5-ba55-39e6e2e4b5dd', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/cb0baa56-bc61-447d-97d1-0ff40d94e6a2\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-27 21:41:54', '2023-11-27 21:08:17', '2023-11-27 21:41:54'),
('f9552b90-ca21-4087-961b-2554454158e4', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/8bd84008-d2a6-4d2e-8cca-3ea9979943fd\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-02 22:42:38', '2023-06-30 02:59:13', '2023-07-02 22:42:38'),
('f982c826-bfc6-40be-8bf6-e027e7237c24', 'MixCode\\Notifications\\NewOrderHasBeenCreated', 'MixCode\\User', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '{\"subject\":\"notifications.new_order\",\"message\":\"notifications.new_order_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/dd3f0a1b-9328-4b88-9e34-29a53b485584\",\"color\":\"bg-info\",\"icon\":\"fas fa-ticket-alt\"}', '2023-11-21 02:22:17', '2023-11-20 22:21:41', '2023-11-21 02:22:17'),
('f9d5d902-5b82-4698-9015-8876c5098b98', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/a8939a64-33ad-46ec-8937-4aa4cf389af4\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-07-02 23:12:16', '2023-07-02 22:57:37', '2023-07-02 23:12:16'),
('fa2921c6-f757-4f2f-80e3-fa389936526b', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/5fb024a2-c01e-490d-affd-6c18d8fc64a2\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', NULL, '2023-12-13 13:18:21', '2023-12-13 13:18:21'),
('fa9b8769-5f8e-4ca9-b110-b9264fbfd036', 'MixCode\\Notifications\\OrderActivated', 'MixCode\\User', 'f7dce302-652b-4950-b225-e80c69236f80', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_activated_successfully\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/c617c2e5-435a-4498-b7a8-418d89046b25\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_activated\"}', '2023-08-11 02:38:56', '2023-08-02 04:03:39', '2023-08-11 02:38:56'),
('fbfecf2a-5a13-48e5-a1a1-878d165da11c', 'MixCode\\Notifications\\OrderInShipping', 'MixCode\\User', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '{\"subject\":\"notifications.order_status\",\"message\":\"notifications.order_in_shipping\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/orders\\/9565daa6-2285-4d25-943d-35083e1b7db8\",\"color\":\"bg-success\",\"icon\":\"fas fa-receipt\",\"for\":\"order\",\"action\":\"order_in_shipping\"}', '2023-11-26 15:18:39', '2023-11-26 15:18:19', '2023-11-26 15:18:39'),
('fed9b828-dfcd-4b6f-a00e-f35ac2aa12d3', 'MixCode\\Notifications\\NewUserHasBeenRegistered', 'MixCode\\User', '146de26b-2521-4b4b-9002-6926d134ca36', '{\"subject\":\"notifications.new_account\",\"message\":\"notifications.new_account_message\",\"review_link\":\"https:\\/\\/popeyedelivery.net\\/dashboard\\/users\\/bb09984e-1c72-45a5-9641-249d25d70889\",\"color\":\"bg-warning\",\"icon\":\"fas fa-user-plus\"}', '2023-06-30 02:53:25', '2023-06-30 01:01:47', '2023-06-30 02:53:25');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('004d0acb27874a741c48267186ad8fdaab950e947398167de2882fa87cae76c24e1509a1b18a812a', 'aec07b76-43d5-4226-aedc-74b22b812895', 1, 'User Token', '[]', 0, '2023-06-29 15:43:10', '2023-06-29 15:43:10', '2024-06-29 11:43:10'),
('00c7d61a1d4fe57469aa3680717de7a28c79607bf1722583d8c5b90e43923cd2b0d7359f6497b403', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-09-27 12:31:08', '2023-09-27 12:31:08', '2024-09-27 08:31:08'),
('01ac03573821e76419781da81fb9ec1821d7308edce1eda29e07a53392db0d13ffdbe7a00c91061d', '8eddabad-9aae-46c3-b420-cb5275bf29b9', 1, 'User Token', '[]', 0, '2023-06-24 22:07:56', '2023-06-24 22:07:56', '2024-06-24 18:07:56'),
('01fd3afca17855bc55ce9fd7edb52901c1006409a4b08f97adab4998ab9732b3326ecfa428419066', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-09-27 12:32:15', '2023-09-27 12:32:15', '2024-09-27 08:32:15'),
('0253be9119026e51774ddf17398a217ea071ed55d7b97366ff3fa8a29b17cbee64c1d2f385f64e7d', '83cda510-0304-479b-a98f-7b7c8140fd0f', 1, 'User Token', '[]', 1, '2023-08-11 01:46:28', '2023-08-11 01:46:28', '2024-08-10 21:46:28'),
('02839ee7a9aaf21883e6abc094ece070c56e1bbe693507b29e08877b08bd3f92c5efee40cb003046', '9ff0d858-fa9a-4d6d-b7ce-547ba7315ade', 1, 'User Token', '[]', 0, '2023-08-02 16:10:30', '2023-08-02 16:10:30', '2024-08-02 12:10:30'),
('03230446529dbec7932eb4e267767be7116fa71611308db65a5e76894a36071f83a2e39697d43837', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-10 23:44:07', '2023-06-10 23:44:07', '2024-06-10 19:44:07'),
('0496e15c7aa676020923a1a342e762345984f1baa8cd243a3412f39da058071d6865051d2c4e998c', '04feadb4-0db4-4f89-b0d5-1204fb2f6b78', 1, 'User Token', '[]', 0, '2023-07-04 20:57:04', '2023-07-04 20:57:04', '2024-07-04 16:57:04'),
('04b3276169d97ac556c4e62d898224bd034ab944c2f1b8163575d045e0373edbe7982a0b34a4c282', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-15 01:35:31', '2023-11-15 01:35:31', '2024-11-14 20:35:31'),
('05330d105b134b79698b1e0cefc553bf0520badec464f46fe31a2a03da16bfd92a6f482759e00632', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-06 21:04:11', '2023-06-06 21:04:11', '2024-06-06 17:04:11'),
('053c58094875a79eb71e79fe1097a71ec6d9fd84b43be7aaa2c4116e45dac39fbd5ca022e01d4aaf', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', 1, 'User Token', '[]', 1, '2023-09-07 02:37:02', '2023-09-07 02:37:02', '2024-09-06 22:37:02'),
('055117efdf0f987aa34d24ea3e9e306a4e7ef790f7199be79e7a95556c3539febd1a708bd1828475', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-03 23:09:44', '2023-11-03 23:09:44', '2024-11-03 19:09:44'),
('0715967a375b3745c35097d947f68dded387dc90577f06779510753130b325e9c8be47a2196c0746', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-06-29 17:01:43', '2023-06-29 17:01:43', '2024-06-29 13:01:43'),
('077eca277ed5c0777fd02201e9aaf8a24b11ceee9f039dd8842617bec82bea7bb7d6d01bf3af6ee1', '3901e59b-89c7-4d6a-9544-ebc43571261b', 1, 'User Token', '[]', 1, '2023-12-11 17:56:27', '2023-12-11 17:56:27', '2024-12-11 12:56:27'),
('081f2bcef3c2713dc7319d74e2afa7a28efd69171e99f4c6a47e8ef24179cf45f578f3ed88a6721e', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 0, '2023-10-15 23:50:38', '2023-10-15 23:50:38', '2024-10-15 19:50:38'),
('084c645eed3842d1a9c3563b24dba30c683de0110a2d927ec5ea6ad2c4e5d4eea1b5c0db6b221361', '50a3827b-db2f-4edf-bb48-0779dbf29410', 1, 'User Token', '[]', 0, '2023-07-25 01:26:03', '2023-07-25 01:26:03', '2024-07-24 21:26:03'),
('085dc10d978cbbd9777ae324854d45f4101c98d60f6b3c834881ad54689a5712f32813ccdcc33276', 'abec914d-1de9-4e27-ba19-a2725a4e7de1', 1, 'User Token', '[]', 0, '2023-12-21 23:29:09', '2023-12-21 23:29:09', '2024-12-21 18:29:09'),
('0937272d5c099b5a7b2baeb0197a60bc85802bb8e59494508ab7dc7bd97206b4ec6d8f2b3955bf91', '3f9eb13e-98d2-4219-99d6-6dc6fda39a02', 1, 'User Token', '[]', 0, '2023-07-25 00:18:22', '2023-07-25 00:18:22', '2024-07-24 20:18:22'),
('096b48be527af5123234324fc24e67e79cbfb848bd3305158783b424d46c32851808acb21762fd13', '600ae9df-1f17-405b-8a53-187924bb53a9', 1, 'User Token', '[]', 0, '2023-06-24 11:36:00', '2023-06-24 11:36:00', '2024-06-24 07:36:00'),
('09b87589a7bc6993dd2821e13b9db9146f81120dbacb81e10bafd0b46c72427f1710838ae558e728', '0d3639de-5470-46e4-931c-aee686676f9e', 1, 'User Token', '[]', 0, '2023-06-23 23:18:44', '2023-06-23 23:18:44', '2024-06-23 19:18:44'),
('0a0644fe213ca82fb954d90b3b117b68e7a5ce236c6ba109693de482073e1afa60eeb22c98c8596d', '83cda510-0304-479b-a98f-7b7c8140fd0f', 1, 'User Token', '[]', 0, '2023-08-11 01:49:17', '2023-08-11 01:49:17', '2024-08-10 21:49:17'),
('0aa6f7ec1caa1a857b1d21ae392de2d6bc24a51720375e0cde760d546aacd7ef218f4de075057517', 'a48b0478-25ed-403d-bd3f-f4f299b7ec2c', 1, 'User Token', '[]', 1, '2023-07-01 00:49:18', '2023-07-01 00:49:18', '2024-06-30 20:49:18'),
('0aea6798ff2cc85e48bce97912b54740da12d20d2a464364d15b91e74eea99c0a74da6fc23d266e2', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-02 04:03:15', '2023-08-02 04:03:15', '2024-08-02 00:03:15'),
('0af4f5d095cdea1264a528c3cb7ebde586fd8fd8c51c0418649e757df9296d3b217180625f6f44af', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-12-11 17:55:09', '2023-12-11 17:55:09', '2024-12-11 12:55:09'),
('0b7601689f9eb57048bdb0bd70a2e5b2da11271fbd1f2acf035fecf03b7ddd97bd4c8d3865643039', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 1, 'User Token', '[]', 0, '2023-07-11 19:53:11', '2023-07-11 19:53:11', '2024-07-11 15:53:11'),
('0bfb16ed48bba1d8a414a793eed23aaa91c365cbb8368f5f22f6e3331e5558636cdc1f85a4affcb6', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-14 09:54:03', '2023-07-14 09:54:03', '2024-07-14 05:54:03'),
('0c05a5025f033fe9ecea0a1e0e661229c427437b099c5772e502990864a061926f2a2e40cd982a0a', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 0, '2023-10-23 20:00:25', '2023-10-23 20:00:25', '2024-10-23 16:00:25'),
('0c3de9eee4a0c99c919570b17f284e35bd9d6635468840415be8eec860a30709624e23bfbf83cd38', '0c968939-7f0c-45b8-905d-3731d9a423b1', 1, 'User Token', '[]', 0, '2023-09-06 23:45:48', '2023-09-06 23:45:48', '2024-09-06 19:45:48'),
('0c8b004386be16a13aa3b2c9d7be4419d678b66678230c481b80006a8d2b6696cc11bbe5b11f2c49', 'ebf3adb2-f4d7-4b86-bc45-4f0da3edebcd', 1, 'User Token', '[]', 0, '2023-08-22 02:43:54', '2023-08-22 02:43:54', '2024-08-21 22:43:54'),
('0cdbef863adeee97aa9d39fdb5d2c137e406a5db9bedbd70136781cee8f43065a81974b2942c64eb', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-02 16:52:37', '2023-11-02 16:52:37', '2024-11-02 12:52:37'),
('0d3efa80c1ff385d4c25dae936daadfe44dab82e437d7c22d519a101c8afe1154d7549e8cac05d91', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-07-31 16:21:18', '2023-07-31 16:21:18', '2024-07-31 12:21:18'),
('0d4abff205c6fee2cdef426bf19295bde6f33868066717ccef920ca103d2244841cff0d5a3960421', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 0, '2023-06-05 16:39:48', '2023-06-05 16:39:48', '2024-06-05 12:39:48'),
('0d5e67b018c85d7f3ae58ea123a6098e34fd0bd6ecae7718ca262deeae50fb8b9c77357c18c6f0d9', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 1, 'User Token', '[]', 1, '2023-07-11 15:56:40', '2023-07-11 15:56:40', '2024-07-11 11:56:40'),
('0eb681ea5269ec9ed60be9eb6cc13d1c70525f99b3cccf8fd3ada67b2a69e37b8252b3d9f39eb74f', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 1, '2023-10-16 16:09:36', '2023-10-16 16:09:36', '2024-10-16 12:09:36'),
('0efbdc37b528022ddc89a42664c780fa9adb7c1a6b3002c227ed23c3598f1514e5bd3c825d2999e9', '5a651a52-d168-4549-b225-25ccdb3e1b23', 1, 'User Token', '[]', 1, '2023-11-27 21:01:20', '2023-11-27 21:01:20', '2024-11-27 16:01:20'),
('0f22049fe4951f28fc1237c5aff4b72acd34aa49d8b207d1419ec8b009a9d6605d6c4b8b5d5d0009', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-04 15:40:32', '2023-06-04 15:40:32', '2024-06-04 11:40:32'),
('109349c1f253a1e4ff236edff48f58fffa8ef874757d0c0d1c967ff230c6913e34e5d799dec428bc', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-16 16:05:08', '2023-10-16 16:05:08', '2024-10-16 12:05:08'),
('10d4d9f015309f6c5fe9507c7f60ac380b4d4b9a41fbc307aa2e0640156ae45bc72afc7a9ed3848f', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-20 22:25:00', '2023-11-20 22:25:00', '2024-11-20 17:25:00'),
('1143e625a0d99322b63264a4b6ca338b6b592b0a9c902c82052222476380583aa7e04ef48744b1ce', 'da1a5e0f-b4fb-44b4-8fd8-8334f1c4d625', 1, 'User Token', '[]', 0, '2023-12-14 02:40:24', '2023-12-14 02:40:24', '2024-12-13 21:40:24'),
('12808dfa0958d72c035b5fdeb105112b109711e2e6190fe3c464b439a450cfd6f724c5bf11cccad2', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 0, '2023-07-11 21:19:25', '2023-07-11 21:19:25', '2024-07-11 17:19:25'),
('12b27fc35f022351b2b8f9bf67c6063b70836810a4fcae3796183f43f368978f87ba4d1b5bd7f4b0', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', 1, 'User Token', '[]', 1, '2023-07-04 13:26:53', '2023-07-04 13:26:53', '2024-07-04 09:26:53'),
('13649746088d5ac8235664d8269f44d1096dc65d8319f317a4942b64d816b7ed11fc055b21ff4fc9', 'b2492ed1-3049-497b-a249-e0f816625f31', 1, 'User Token', '[]', 1, '2023-07-25 01:01:15', '2023-07-25 01:01:15', '2024-07-24 21:01:15'),
('1460a2214e5ce7c4e3fcc31ed4466bffb599f664817523c05e4b8f637ad089365e858723f1f4a922', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 0, '2023-06-23 23:22:18', '2023-06-23 23:22:18', '2024-06-23 19:22:18'),
('157efc467c90770421650ca64b6607968b43603fdc736fc50a60e4cd31695a68e8e67a32b2bc0a7a', '84d7d2f6-dd3a-41c4-9ba8-9113e32dbb85', 1, 'User Token', '[]', 1, '2023-06-14 11:15:03', '2023-06-14 11:15:03', '2024-06-14 07:15:03'),
('160fb38759ea500fc7b487a7cff432b9501905f431c73f195ccb6fb71c2592657ed1e73c1f6ee41f', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-07-30 18:42:35', '2023-07-30 18:42:35', '2024-07-30 14:42:35'),
('162a522f21efe51da41c388d2b72eb70c12722d9ec69e21ac058aa4e93ed6cc384f0e763d2e48b92', '04feadb4-0db4-4f89-b0d5-1204fb2f6b78', 1, 'User Token', '[]', 0, '2023-07-04 18:52:09', '2023-07-04 18:52:09', '2024-07-04 14:52:09'),
('1669221a97274be06723ce87ee4bc7b3bd6fa42c81c2e72ee99d87792bcac311e78a35e8513394c9', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 1, '2023-10-17 22:42:41', '2023-10-17 22:42:41', '2024-10-17 18:42:41'),
('168892823176f6130fd8e7bff44afe0ac86a30fe0ae5435bd310854fbc0218390643bdb12c7a1ddc', 'da7ade6b-ab3a-4b18-b24b-f18878f5f352', 1, 'User Token', '[]', 1, '2023-07-06 14:26:02', '2023-07-06 14:26:02', '2024-07-06 10:26:02'),
('16aa287d91093b42b24d155afbdb87d6e01b813f7d9ce7519aed08eae4d5a72718d6009109144e73', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-09-16 17:41:11', '2023-09-16 17:41:11', '2024-09-16 13:41:11'),
('16e25adffbbd34a9f09f064aa64f3cc51ff56991f7b3af359e66b073195fdff544b82a7057901f18', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-07 00:11:58', '2023-07-07 00:11:58', '2024-07-06 20:11:58'),
('1726cd382c37bdc76c8c71e2ce18341d7efe6e93df36fb007e648d948547067f21169dd5a9737b65', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-11 17:30:58', '2023-10-11 17:30:58', '2024-10-11 13:30:58'),
('17bee75f64b210e4e85009babf24aa1f9b4200f884615943e8b24e2acfe166f943cb14d29c333bc5', 'fb751d69-9fe2-4017-948f-134a1117c41f', 1, 'User Token', '[]', 0, '2023-08-20 14:11:04', '2023-08-20 14:11:04', '2024-08-20 10:11:04'),
('18118216f4aaa1ed38f166e9c3904f420469c0696a12e811bf72be92da8b5ebc8cfad509d91ddb97', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 0, '2023-07-14 17:03:46', '2023-07-14 17:03:46', '2024-07-14 13:03:46'),
('18335539566dee60b40071a400d6b0bac61522d84091802409ccaf62751f1369075a8a261a2557bf', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-14 09:55:54', '2023-07-14 09:55:54', '2024-07-14 05:55:54'),
('18a6fd7b489a4bb4801bf027978403135945b95c65cc0a848608213ae7175cdb3bac511428e5f57c', '061cab1b-ae96-453b-b666-fbeece8c1432', 1, 'User Token', '[]', 0, '2023-06-24 22:28:22', '2023-06-24 22:28:22', '2024-06-24 18:28:22'),
('18cea8d17d81cda5e073ebe558a49ac6d80bdf0dded306ad50ea5557456003a3e441a99bcdf960e5', '47cd326b-df6f-4d48-b921-467c9153b255', 1, 'User Token', '[]', 0, '2023-06-30 02:50:14', '2023-06-30 02:50:14', '2024-06-29 22:50:14'),
('1a0189b40ef6c61edc762cd47c3fba809e12ce44ace96e5555b3617943df2361d3c833454cffa0f6', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-09-22 17:03:50', '2023-09-22 17:03:50', '2024-09-22 13:03:50'),
('1a1e4e980634778298b4bba2e51a987efcae5c84fc8dad3e652b3bb42f536fd836191317cafe5c4c', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-30 20:43:00', '2023-07-30 20:43:00', '2024-07-30 16:43:00'),
('1a310bab9eebeded99b803b72fcf4e9b5679a72417b5f3e220922a7d8aeb22e3a0a024233fbb23ef', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-11-26 02:31:08', '2023-11-26 02:31:08', '2024-11-25 21:31:08'),
('1c178b10b1d2e1d5198dda2d9a09d3cbabf66bc8bdcfefb49a378c244d8f892ec7f1aaa0d824d066', 'b746381e-8335-4180-ba01-dee614d88da2', 1, 'User Token', '[]', 0, '2023-08-06 21:53:14', '2023-08-06 21:53:14', '2024-08-06 17:53:14'),
('1c8d36cd8ec49cd067e55371bfb5e32cca5405aa49c7e087edb18a1e67709730b80392272cfd4783', '90f8467d-3dd2-4c10-935c-60c40746eaee', 1, 'User Token', '[]', 0, '2023-06-25 20:13:52', '2023-06-25 20:13:52', '2024-06-25 16:13:52'),
('1dadc27742c668d5394a922d2abc73cac4c04bf5ce4eca5321feab21cece6414b794c6e36a09dc26', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-08 10:07:50', '2023-07-08 10:07:50', '2024-07-08 06:07:50'),
('1e3aefcb57b8855718c6adad7da7c6c6269584bead19c6a57826ce565cefca86071092ab04cb31ee', '765799f3-6f69-4152-a11a-09d55012cf02', 1, 'User Token', '[]', 0, '2023-07-25 01:18:46', '2023-07-25 01:18:46', '2024-07-24 21:18:46'),
('1f7c8d1e452310a08459af81971cd5ec943eb1926052e0c248c8d048bd4e1c2e4c65929796b96c07', '90af975f-722e-4625-b63b-8d23f47efba9', 1, 'User Token', '[]', 1, '2023-08-02 15:27:50', '2023-08-02 15:27:50', '2024-08-02 11:27:50'),
('1fb1023ec5c8469b6b0547b4e77cabbfbe24092a43f9cee6ed2153bc40a105bc28fb6761242641b3', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-10-28 22:00:01', '2023-10-28 22:00:01', '2024-10-28 18:00:01'),
('2153a1b206d2a474825767f979224ec6f20eb0bbcc4f23a8b9c57a72dca6e8afb5dd4b0650b476dc', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-15 00:15:36', '2023-08-15 00:15:36', '2024-08-14 20:15:36'),
('23686be44a4f7a7644c0ac128f6a224b9a3c8bee98354d39b8f33b248523660ee61285a827f44714', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-08-11 02:51:40', '2023-08-11 02:51:40', '2024-08-10 22:51:40'),
('2462cf9fa0b70dc52ca5d2bf61336178bf17abcab8b0a1f73c90e8afb6e96e15c75d540702f84a76', '3369a308-6ee2-439e-b03a-37a62ca20974', 1, 'User Token', '[]', 0, '2023-07-25 04:32:11', '2023-07-25 04:32:11', '2024-07-25 00:32:11'),
('260ebd38f8fa345960e0ee2f1672ab79d5d04707dfe8bfe9d66ec9d010f0fc29e535848eec4e99a3', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-22 15:48:54', '2023-07-22 15:48:54', '2024-07-22 11:48:54'),
('269c2b6c5ab26feddb0540e610eff54ceeb953e163150bccd464b38e74c3a20ec29270182b2f4a3d', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 0, '2023-11-15 01:44:59', '2023-11-15 01:44:59', '2024-11-14 20:44:59'),
('26cad6d3cd0280cbfed011dfe71a1654f151c0e3ca07f6b7176acd2022875e66d028b2e35dbf2f7c', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-08-02 02:30:44', '2023-08-02 02:30:44', '2024-08-01 22:30:44'),
('26fd2abe49eb96479a8137b79f24ab918138c98dfc48b11722488bc752f09fc43d3cdcef614c9dbb', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-13 02:45:18', '2023-06-13 02:45:18', '2024-06-12 22:45:18'),
('2703eb5ef05eececd6884937dad0835e26a7d1663d20685fcb7bd08738400e5e3a7058c93173383f', 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', 1, 'User Token', '[]', 0, '2023-09-02 10:35:59', '2023-09-02 10:35:59', '2024-09-02 06:35:59'),
('277c1f2cc870b67a3593a69fd01079416b7617f795ce2711b11480bd27e4e43e66964425a62cab0f', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-21 16:31:29', '2023-06-21 16:31:29', '2024-06-21 12:31:29'),
('27891c99f886e50a6b35d4385dae2b844f4a7c92e768c395e19965a4f95a501feae308cbdf496c63', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 0, '2023-10-27 18:13:59', '2023-10-27 18:13:59', '2024-10-27 14:13:59'),
('289f87311daddb2ccf6cf3a7fd3a2bdb24e669d1ca94b85780b5dbf44f84325cdd2cfc24ac386314', 'edba9357-71c6-48e9-ba9c-205e97f80769', 1, 'User Token', '[]', 0, '2023-09-15 17:46:10', '2023-09-15 17:46:10', '2024-09-15 13:46:10'),
('291aaaacee5d0f733cf5e110c8b31c2b79c34eaedbd1b0e90cad68d61254ca0713d8c6f1627df0ac', '6b2c1f80-45d0-4e43-986b-aa913d3bb99f', 1, 'User Token', '[]', 0, '2023-06-29 19:29:45', '2023-06-29 19:29:45', '2024-06-29 15:29:45'),
('29498a080d8541f95497039a1a0f7be040a85420f2ba1c696431e8cccd07e6f6b053541d220aa210', 'a29c133e-7190-4bf5-9f15-8632d1ea4609', 1, 'User Token', '[]', 0, '2023-07-15 02:07:17', '2023-07-15 02:07:17', '2024-07-14 22:07:17'),
('29f418ce978421d1a3153fb196cfc3a25ca6e226ae83014a36cbd7ed417499039d48c2b28de899c1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-14 01:42:10', '2023-11-14 01:42:10', '2024-11-13 20:42:10'),
('2a7e60826be38c8907987032b4fd53eaad6bfdcec565fedec4c66e8ba4b40a323ef8a0f3ee2b8e9a', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-13 23:56:03', '2023-07-13 23:56:03', '2024-07-13 19:56:03'),
('2b24b2a78915e71c22728a546716520605b883faec7124d0167f086901a35d8dee322ff2ec0213ca', '71a50ee7-7db9-466f-a46c-9d9a1ca05118', 1, 'User Token', '[]', 0, '2023-07-21 14:43:36', '2023-07-21 14:43:36', '2024-07-21 10:43:36'),
('2b5407a52a930bc507f437900a3e8fae9942217e8be84ed6249f427d312339907565c7bd1eb64d6f', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-30 18:45:30', '2023-07-30 18:45:30', '2024-07-30 14:45:30'),
('2f786e8654eb72fa9987adf371f89d8ac5a6423e281250cf12d48194c70e6976d60f13eb4dc97bab', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-14 09:48:24', '2023-07-14 09:48:24', '2024-07-14 05:48:24'),
('2fb7d4e3947c390371e522aa5f3856efc4cd3fb1b1d71d5768ef2746894c80dceef9ed43c9ffcbea', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-10-23 20:01:58', '2023-10-23 20:01:58', '2024-10-23 16:01:58'),
('30704b3bcf103bf489de74f8da7b4be7574c047ea720ee50230035b73621d109be68a95eb367ce6a', '6c1dba27-037b-46fd-8004-04bf72e2eca4', 1, 'User Token', '[]', 0, '2023-06-23 01:11:15', '2023-06-23 01:11:15', '2024-06-22 21:11:15'),
('3134cd2d992aa0901906cf9d172bcd926418466803a49d270da14bb7524ed26b88997e72c39e4215', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 0, '2023-06-10 01:42:43', '2023-06-10 01:42:43', '2024-06-09 21:42:43'),
('3198e33e8f839b41fb1f91d083ccd6287ee6b3dec7eb78f90fb74d15662cf41bbf034e8be671933b', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 0, '2023-07-22 21:32:37', '2023-07-22 21:32:37', '2024-07-22 17:32:37'),
('31a87170b4742521eef87163aa04875f56c318300684bc33507e6b679f0ddb05ff3c230523ef96ee', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-12 13:10:31', '2023-07-12 13:10:31', '2024-07-12 09:10:31'),
('32277327c16971aed72dd798b83a54fde4d27b8e4f2c032987f76941c7750f57b9ef494f60b6b36d', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-11-26 02:24:11', '2023-11-26 02:24:11', '2024-11-25 21:24:11'),
('3333129ff62f79c5046ea32597ae8c6d9f2960725af54a16a2654714839338a7d1758035257c331e', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 0, '2023-06-13 02:47:15', '2023-06-13 02:47:15', '2024-06-12 22:47:15'),
('341e1b1f7297f923e8509fc33c61f2e7fc33cba15a96c1bf2e8cb681290ecbaf816a182d95e00046', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-04 15:56:43', '2023-06-04 15:56:43', '2024-06-04 11:56:43'),
('34caba9cadf767586d8c82b1bbe7a94698c105699c2d44ef6c1237d03db73c423777b70545b1394c', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-06-29 07:29:25', '2023-06-29 07:29:25', '2024-06-29 03:29:25'),
('34cbfdc3836772074f76f6fdc039117b7d98a44e4a96c2265ee43e656ab814809dc8ce370fdae0a7', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 0, '2023-07-14 17:02:35', '2023-07-14 17:02:35', '2024-07-14 13:02:35'),
('37d90e136ec344aa42114c61874b09902371a7d617c7903587c892c76ba7bf134c2446d3aaa012fd', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-10-17 22:35:08', '2023-10-17 22:35:08', '2024-10-17 18:35:08'),
('3830cec56f2857efa409d74ed4db8fa8727bc27d48f459164154e51a41d63cf5187129ab91a1fb1a', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 1, 'User Token', '[]', 0, '2023-07-25 02:01:14', '2023-07-25 02:01:14', '2024-07-24 22:01:14'),
('3892d78078d0ecab73bd2d51ae1b139376d7a4c2ecd2005cd1ca261087d6f05a502b8e20772a5aad', 'b746381e-8335-4180-ba01-dee614d88da2', 1, 'User Token', '[]', 0, '2023-07-25 02:00:32', '2023-07-25 02:00:32', '2024-07-24 22:00:32'),
('395327e0dc27c329e3c3b26de50945aadd9752b2051e51f0b0f461dad83595e963e5b396f0c1d7c8', 'c48bc76f-7c19-4891-88ce-a448fc0b79a3', 1, 'User Token', '[]', 0, '2023-08-12 20:25:23', '2023-08-12 20:25:23', '2024-08-12 16:25:23'),
('3982e75f6fe9116455ed5ef9d363892d43194daf8e42c5ff976eb39f9827631c156bcb314b64e8fa', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-12 12:57:13', '2023-07-12 12:57:13', '2024-07-12 08:57:13'),
('3c1d613b396fbd24a30d330d3cbe896ccf97e2fe822804e233805231598fca84fb1f57557f7018a6', '84962899-97bf-4efd-bcb0-d8bafe56723b', 1, 'User Token', '[]', 0, '2023-06-23 01:04:12', '2023-06-23 01:04:12', '2024-06-22 21:04:12'),
('3c3b0c01798ab74040e20ab6d4465bbbfc9fb6525b5154e03b1596d16beb8447952f927657dc8039', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-02 02:34:08', '2023-08-02 02:34:08', '2024-08-01 22:34:08'),
('3c4cbedc5f0fa8ed0d3e606540a8fb98f7bbf71128172043b6dbbb666ab3ea7175f4aa5cfdcd235c', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-11-14 01:30:39', '2023-11-14 01:30:39', '2024-11-13 20:30:39'),
('3d3b5e2e281bc2ea01880ce3196cbd0d5abb3a38574fccb89a4ac76847db2185d818a02ea362acb3', '8bd84008-d2a6-4d2e-8cca-3ea9979943fd', 1, 'User Token', '[]', 1, '2023-07-02 22:41:42', '2023-07-02 22:41:42', '2024-07-02 18:41:42'),
('3d66305669fe65f4cef16c728ef2e52ec920f161342afb8e1f68f9a30caa1fb7b6e984aad915878b', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-11-30 17:30:04', '2023-11-30 17:30:04', '2024-11-30 12:30:04'),
('3db412ea3c596eafe82631d11cc358c8a2b723c4160108d0eb014e00355ab98d8815499da38b4b15', 'bf362079-b520-494e-9d26-513dbcddbf4a', 1, 'User Token', '[]', 0, '2023-06-24 21:52:02', '2023-06-24 21:52:02', '2024-06-24 17:52:02'),
('3de311b2e1b53f3c1db783bff8843b90503003068a4b1074c6e837b8a4018486764edff65c21f245', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-27 14:51:09', '2023-11-27 14:51:09', '2024-11-27 09:51:09'),
('3df30e6a9ca81b54c996e6f3106d6f0c64377c1656b486d75b79b9954916cbb88bec80dfe5b9cf23', '83cda510-0304-479b-a98f-7b7c8140fd0f', 1, 'User Token', '[]', 0, '2023-08-07 21:40:27', '2023-08-07 21:40:27', '2024-08-07 17:40:27'),
('3ea951027b455aca219b3a7355b7bbad1ba9bc20dd50ac4219b852b68b004cdde36e503b2977dfba', '47cd326b-df6f-4d48-b921-467c9153b255', 1, 'User Token', '[]', 0, '2023-06-30 02:45:14', '2023-06-30 02:45:14', '2024-06-29 22:45:14'),
('401aab9a18f9572e89c6e7ee68680c8d2f28fab92005fc89ab66a3fb2158ce118761a3d73a583296', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 1, '2023-10-18 02:44:18', '2023-10-18 02:44:18', '2024-10-17 22:44:18'),
('4032d0c72a1a3ae2dfd595679efbfdd8f6fabda3a357062e768b7f19b2c03e5a1bb19e7ea6522877', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-10 14:48:51', '2023-11-10 14:48:51', '2024-11-10 09:48:51'),
('4047806f7d4e2187766356718134fac7816b1d4287f3d33ee491b12239ecb0c72c495b0543e80c56', '1e265d30-b8db-480f-a20b-7bdfeee904e4', 1, 'User Token', '[]', 0, '2023-07-07 00:09:27', '2023-07-07 00:09:27', '2024-07-06 20:09:27'),
('413348dabaf7073b939715291f210ce611d706ed8ab45666064cb97e076f723cc7922fe2f29311d6', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-08-11 02:38:10', '2023-08-11 02:38:10', '2024-08-10 22:38:10'),
('416925ad525a273758ef123f1153dce64570f4a8da50022e84adc393f241e0ca9862e9d02084950a', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 0, '2023-07-11 16:01:12', '2023-07-11 16:01:12', '2024-07-11 12:01:12'),
('4201308a892f8501c5e65b5b79e310ec37cfe69affccc6667fba9d3e65dd42e16fb6646e52cd4a45', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-11-26 02:36:58', '2023-11-26 02:36:58', '2024-11-25 21:36:58'),
('434dda6d06feab9bfc31f580a91b3dd748c35ea652f8f0459e7c548fdcc42a98bb553bcbb2e4962c', 'c2055934-7124-4315-9e2c-903cbe60138c', 1, 'User Token', '[]', 0, '2023-11-25 14:18:25', '2023-11-25 14:18:25', '2024-11-25 09:18:25'),
('435d795b3bc116dc217f1bb6c18ba8b9e4cdc99f9e48aeeb0af24ea92c928ec7a6c3bb501eb6963c', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 0, '2023-10-22 01:05:43', '2023-10-22 01:05:43', '2024-10-21 21:05:43'),
('44064eea53999f1f1a717debe9467cd05020c4e17e1d97655b0a088d50c670cbac1357730783076e', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 1, 'User Token', '[]', 0, '2023-07-07 13:52:10', '2023-07-07 13:52:10', '2024-07-07 09:52:10'),
('44c2665c76b50449c6fd863945f7c894afb22e149a2e8d1cdc9595b92963344a9539d192754e9ee8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-23 17:30:03', '2023-07-23 17:30:03', '2024-07-23 13:30:03'),
('46491b01fb8a43297f254f6c0f6237b90a961c07f433bafc84040d5b29d506ac64e664d0dc7aa416', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 1, 'User Token', '[]', 1, '2023-07-25 01:52:19', '2023-07-25 01:52:19', '2024-07-24 21:52:19'),
('46f8dbbddb8b1e841785e53d56c47ebd6343bd15cfcdba8064b27b147fafda5ca9ff038ab2c058c2', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-21 02:09:42', '2023-11-21 02:09:42', '2024-11-20 21:09:42'),
('4727657c2712c257924f34a7fcce94fdbebf6d2ed5e1a06598eec8d05052691b304dae4f0088140b', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-15 12:46:15', '2023-11-15 12:46:15', '2024-11-15 07:46:15'),
('474998b72a3e2b6f24fed9c36471d7be1119c608ed11a4260a87d06681c521f3d0fb8d5bdc587086', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-07-14 09:55:12', '2023-07-14 09:55:12', '2024-07-14 05:55:12'),
('474f5ae7c669c77eddd9b989ac1f7dd49168d93ca9c5cba0171f86755a75fa6d3c77ded682a1e3de', '85922729-2c24-4638-afe2-db5cc99daeb5', 1, 'User Token', '[]', 1, '2023-09-05 13:02:45', '2023-09-05 13:02:45', '2024-09-05 09:02:45'),
('48754ec64231310d7f9ac8e4970a20c8d2343959b52b6b0917bcc046e09bb5421bd93105d9ea2d93', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', 1, 'User Token', '[]', 1, '2023-12-08 19:51:20', '2023-12-08 19:51:20', '2024-12-08 14:51:20'),
('4ab7353de5e6cb7ad27403902a4fc5be2300aec3a8a829b57ff9284a3f69cdec9587cb62011e6218', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 1, '2023-07-12 15:37:38', '2023-07-12 15:37:38', '2024-07-12 11:37:38'),
('4f5366b702a7eb5c3b10ccdd9df2f9180ff8c58dee35d8f8573aee0e2ff15148df17b2503f7fabf6', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 1, '2023-06-14 03:12:00', '2023-06-14 03:12:00', '2024-06-13 23:12:00'),
('4f63f3a477168ef79d6e1a7f8c25ff631c5cbc476ebd1a80b5af9119585eb9c2ee2b1eb53217ea9e', '5a651a52-d168-4549-b225-25ccdb3e1b23', 1, 'User Token', '[]', 1, '2023-11-27 21:07:35', '2023-11-27 21:07:35', '2024-11-27 16:07:35'),
('4f9295ab433cc984bc0eebccf442812a2d2f7c49d6ac41bdbcf8f0e4ed44c281d6ae39c42c34ae3e', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 1, '2023-06-12 19:45:59', '2023-06-12 19:45:59', '2024-06-12 15:45:59'),
('502f2a631b870e205aa122109bff8df6e2c89eb0815d32b538eed0c0704a5e26b0c3222c3b697b6f', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-10 22:11:48', '2023-07-10 22:11:48', '2024-07-10 18:11:48'),
('5096ed38445f7c21cd5d6803aef49c8582b8e1740178e7ffffef8bfa2ac2d610e8b245fd6b8f763e', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-12-11 17:57:55', '2023-12-11 17:57:55', '2024-12-11 12:57:55'),
('510477576ccd397c46bcf6d1717e1d2a0b3c30f8885cc4b96b6c4666e5bd90d8740865868b417586', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-07-24 16:48:33', '2023-07-24 16:48:33', '2024-07-24 12:48:33'),
('5142073a9fa6062fc587b1167834882ea84b6e964cca9d5773449dcdd598453051f0901629b8b9ed', '26d5ef4e-5a40-486a-8543-545bab6a316c', 1, 'User Token', '[]', 0, '2023-07-16 17:00:13', '2023-07-16 17:00:13', '2024-07-16 13:00:13'),
('51bdbf5dd5b4136a3daff6655baf34a7b0eb992b0460f8c6e332641e050fb903af83b3576bf542ef', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-26 04:21:42', '2023-07-26 04:21:42', '2024-07-26 00:21:42'),
('51dedfdca7ae3b9acd38dc0e5aae47d7d05012fad5199189a05eefdf064911550ff76eaaf7a8709a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-11-01 18:42:44', '2023-11-01 18:42:44', '2024-11-01 14:42:44'),
('529a1c510e2c50dda4c581e8d8338eb8875b1c92b87791193cad7ca3f067b519f3c2be635eebbaa6', '095e992d-6ede-460a-b640-301d3465faf2', 1, 'User Token', '[]', 0, '2024-12-27 01:45:43', '2024-12-27 01:45:43', '2025-12-26 20:45:43'),
('52e069d7acff25f857733de6cdf2a002d7f4d9d304284de1a50eb0824731806b7dd88f7c16b44600', '2002a982-550c-4a6e-9956-8d4c79b1e98e', 1, 'User Token', '[]', 0, '2023-07-10 04:05:28', '2023-07-10 04:05:28', '2024-07-10 00:05:28'),
('5432adc7c6e7fb393c5658b19bda3a7a3120e5b081c6c619ca1ec6b3921808e66f7fd115ade0d8d6', 'dde7f74c-0da5-45ec-830a-68ae09c15795', 1, 'User Token', '[]', 0, '2023-07-15 02:44:38', '2023-07-15 02:44:38', '2024-07-14 22:44:38'),
('54967fa18700f37ff0d76f15e7b2fb6a956df7cc90dcd0cd9047eb28f1f704e9bcbba5112882e70c', '329b6a7b-c11a-4533-941a-7747b2615d9b', 1, 'User Token', '[]', 0, '2023-07-25 00:32:57', '2023-07-25 00:32:57', '2024-07-24 20:32:57'),
('5516bda0208fd0e0e17dbfa24ae98db024329ef60423c7e02cfb60781838c5904a376eb864aa2985', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', 1, 'User Token', '[]', 1, '2023-12-13 13:18:20', '2023-12-13 13:18:20', '2024-12-13 08:18:20'),
('55882c41267d20c0607ef27dc186f915d3794e44f16be36790eab06a26daf7efd7dacf61cd5728cd', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 0, '2023-06-23 23:18:27', '2023-06-23 23:18:27', '2024-06-23 19:18:27'),
('55b5976f4d4794142c61e0f59b1e1ac27538d2e11434df08ed445782a68ca9fb307ea70f58f0715c', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-12-15 15:12:29', '2023-12-15 15:12:29', '2024-12-15 10:12:29'),
('56efeb9e30283b3ce01fc1d84a429ad4b8ced2abf6be1cf75edeb3b11195256802556f97899a3a39', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-08-11 01:30:31', '2023-08-11 01:30:31', '2024-08-10 21:30:31'),
('579e9303374e240eede21142e6b94d1aa633c28c28ade1c7c64a553e7c3c061b219fa46915032958', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-04 18:03:34', '2023-06-04 18:03:34', '2024-06-04 14:03:34'),
('59115ec7d1504c168bf3f51a12034d47bcf17143b5ef38e2df559aeb3999b72054f8285f43211e3a', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 1, '2023-07-11 14:30:09', '2023-07-11 14:30:09', '2024-07-11 10:30:09'),
('592a196b4293d275dc6ea7ad52650c591aade3a16c6ef21f94212a07a2af5b92496dcb7ca53e1ef0', 'aa5abc27-6e24-42b0-a770-a7addd3f31c4', 1, 'User Token', '[]', 0, '2023-09-06 23:37:48', '2023-09-06 23:37:48', '2024-09-06 19:37:48'),
('5970166acd0abe561c52bd9543c3164e8d7bc11d5c5ffde9eb85dd187d9d35fcc8c3284820c489ec', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-10-23 20:05:08', '2023-10-23 20:05:08', '2024-10-23 16:05:08'),
('59959da01df866adae9eefa96c66f900655d4c1aef2a17c18836900e3af611f3beb27cccfda73574', '6af62f61-559e-4838-9c4c-706060c46bbb', 1, 'User Token', '[]', 0, '2023-07-25 01:56:51', '2023-07-25 01:56:51', '2024-07-24 21:56:51'),
('5a77dbc7b9c7efec116ef755f4ff54b3b3300f194e36b140991b4082748610fe9ebd95dcee7fb19e', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 0, '2023-06-12 19:51:56', '2023-06-12 19:51:56', '2024-06-12 15:51:56'),
('5bf6659bc0a8f646a8a32f569189d145446fc3a2eecc8685f8706172c2cadba00ede2511f31ba817', '086d731e-cef8-42a6-9edd-49fd0df790ce', 1, 'User Token', '[]', 0, '2023-07-20 15:55:23', '2023-07-20 15:55:23', '2024-07-20 11:55:23'),
('5d24777e273ade0b66292fd57ca2121ea1b1258b5bcffb7e19b18f322d49fef95f068553f160254a', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-12-14 02:07:58', '2023-12-14 02:07:58', '2024-12-13 21:07:58'),
('5dfb30339628049e44d45ebaac95e6b6f09acaa1bebc08040e2c7cfd15d109952284431f70e819e2', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-15 10:48:08', '2023-07-15 10:48:08', '2024-07-15 06:48:08'),
('5f114d7a914aee7e30d2b334380a5cff46fecb222eee946db22385c72f3fca443f7b0370bef8ed85', '38b22377-d4bb-4a02-876c-b67f46a0f0dd', 1, 'User Token', '[]', 0, '2023-06-26 02:39:40', '2023-06-26 02:39:40', '2024-06-25 22:39:40'),
('5f6c61e53643d4f472316d1cd9b39b4b8c4b524afceb8ce09e55cb4d7c4de1535cdbccc7748310e0', 'ff775f7b-851e-41eb-aacf-dc4bef3a28ab', 1, 'User Token', '[]', 0, '2023-07-17 03:15:04', '2023-07-17 03:15:04', '2024-07-16 23:15:04'),
('5f8873f27de52f911687936f24332bfb8ed0e7382951d9af13b57a0ff7ad33db0dbadb4dfc7ae2c4', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 0, '2023-06-08 14:56:46', '2023-06-08 14:56:46', '2024-06-08 10:56:46'),
('5fe9aedce72797c11fcb2590eaf36b09512310a7b495e742e783269e2785e3d3d369abf2cb357b52', '3901e59b-89c7-4d6a-9544-ebc43571261b', 1, 'User Token', '[]', 1, '2023-11-28 17:53:30', '2023-11-28 17:53:30', '2024-11-28 12:53:30'),
('607d04dd10d0c94a295543b2916425d115de2efff49f70bdca8ffa8d9a1cb72f98a23b8a21c413f5', '3901e59b-89c7-4d6a-9544-ebc43571261b', 1, 'User Token', '[]', 1, '2023-12-05 04:21:18', '2023-12-05 04:21:18', '2024-12-04 23:21:18'),
('6113f1e792091cbfb05e39fba9ef727de02df4b45a2c19b9e1a475ecaaf467d99cafdcb17f29c5c3', '8bd84008-d2a6-4d2e-8cca-3ea9979943fd', 1, 'User Token', '[]', 1, '2023-06-30 02:59:13', '2023-06-30 02:59:13', '2024-06-29 22:59:13'),
('6158b877cb099c0fb519b5558d7bb3348adee6c155f18aec717160a5fe5b183bb44efdcc7886197f', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 1, '2023-11-14 01:28:06', '2023-11-14 01:28:06', '2024-11-13 20:28:06'),
('6173674c5af50d0368a6eca02f2178ee783c0368533dadcbf63a351080a808bd381203fce291dfa5', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 0, '2023-06-24 02:22:48', '2023-06-24 02:22:48', '2024-06-23 22:22:48'),
('627b269a87bfcfe845f308b4586852f49e58956790cf433525d380980dd3cf0a68bd15475397c124', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-24 05:19:28', '2023-07-24 05:19:28', '2024-07-24 01:19:28'),
('63537491f985739523da3f8da35bad9fbedad28eaff74c9484dcd6c18ead20e700c3609933c47fae', 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', 1, 'User Token', '[]', 1, '2023-11-01 18:41:06', '2023-11-01 18:41:06', '2024-11-01 14:41:06'),
('635ed92cdb8158386a720a95a04fa839d55ac87ee5f83e77a751a8cd4af9b2a1d9786a21c7170bb1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-20 22:15:01', '2023-11-20 22:15:01', '2024-11-20 17:15:01'),
('647e36bc134349f61d3d353689eb63be8d67d58f862bccf4b2c3df04d037446455f8085dca097d77', '9946f718-9765-47e6-b716-71bd677ca3d4', 1, 'User Token', '[]', 0, '2023-06-22 04:20:58', '2023-06-22 04:20:58', '2024-06-22 00:20:58'),
('647e7d8847503f00130d3c30555b1c74da1a5dbb1fb572ef190d30022d5301eb5c788ade2b249dee', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-04 16:31:20', '2023-07-04 16:31:20', '2024-07-04 12:31:20'),
('650f02a253e3803a736f88742e2146e7dec8030bbe65a97aad2a94a8341a9f1693670bf2626c3eda', 'e005cc7a-2d12-41f9-b023-ac6048c13721', 1, 'User Token', '[]', 0, '2023-08-18 07:43:51', '2023-08-18 07:43:51', '2024-08-18 03:43:51'),
('65c3c2b2318cd409636f912ba18e591f5931bc3b3e746377b3f2fabafa22c41b19829c8edd3732ba', '2ece5ce3-07aa-4232-8be0-46b1b663648b', 1, 'User Token', '[]', 1, '2023-06-24 22:04:18', '2023-06-24 22:04:18', '2024-06-24 18:04:18'),
('66cadda78dd48ecf66fbe8b99b4c88caea1515ddf741407678bbf36a7a5fd102309619323e7a081c', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-10 22:11:52', '2023-07-10 22:11:52', '2024-07-10 18:11:52'),
('695c0f25c1239026922228f40a97707a9a1ce6da8a616c195d74db1d0e2a8835c872f1f47a60439f', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-11 22:05:31', '2023-07-11 22:05:31', '2024-07-11 18:05:31'),
('6b0988ae48e11130033e102e6eac80c32a394f7759d0976a8577fbeef78736e0870a01cc24a8eb22', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-23 17:24:51', '2023-07-23 17:24:51', '2024-07-23 13:24:51'),
('6b41c9f0793238f1fa0bfb90b33ad3e6b18c4158483f8ea5c4c6c77d2370a5618ba8bc26daa02d04', 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', 1, 'User Token', '[]', 1, '2023-08-20 14:08:16', '2023-08-20 14:08:16', '2024-08-20 10:08:16'),
('6bddd4e813c1ff28527e82b9b8b06a68cd72f77937f6c2d4d09d06e6359fa7a19a0d2d787792b925', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 0, '2023-11-21 02:12:44', '2023-11-21 02:12:44', '2024-11-20 21:12:44'),
('6e41b83dbfbae0ef3355b56badfd01c8fc544867934f03f6f5a16e2dca51af072b00252142ed05c5', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', 1, 'User Token', '[]', 0, '2023-08-08 16:13:05', '2023-08-08 16:13:05', '2024-08-08 12:13:05'),
('6f598e62a0bb9e13d685fc2d1f8801f071800f28a9cb277d32f13372c3dd5acdbbc0019ee1b3e6d0', 'da7ade6b-ab3a-4b18-b24b-f18878f5f352', 1, 'User Token', '[]', 0, '2023-07-06 14:02:32', '2023-07-06 14:02:32', '2024-07-06 10:02:32'),
('7017d9c87c816f24c36d5ab6e06a1fef7a53f82e8af075b089d7eacf9d214aa4748f3dfe5915e849', 'a29c133e-7190-4bf5-9f15-8632d1ea4609', 1, 'User Token', '[]', 0, '2023-07-22 21:49:57', '2023-07-22 21:49:57', '2024-07-22 17:49:57'),
('705fcc4df49625d244776b3d2b2cfb6b4ce0f963feebcaf107af83f979d0e96411cfc8a50ba6322a', 'e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366', 1, 'User Token', '[]', 1, '2023-12-14 02:44:36', '2023-12-14 02:44:36', '2024-12-13 21:44:36'),
('71cfb87eb9d62c71b7f95f92f0d1a5bad251191b48c6dfd3e6f7233ba7e3378f65d466415683e0b1', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-15 23:47:29', '2023-10-15 23:47:29', '2024-10-15 19:47:29'),
('728ca4130b3c15708017ed106285f1a1f8ce5e56f87e79ecb16016b6d3e67615144171dc86dd2ac2', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 1, '2023-10-16 16:06:41', '2023-10-16 16:06:41', '2024-10-16 12:06:41'),
('729acec28dda68acca8a86cbf66d077d7a196a9952da6558d899e28f3731f56ce220e43d7769b786', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-11-26 02:36:07', '2023-11-26 02:36:07', '2024-11-25 21:36:07'),
('72e580deed239e03fd9bc490d8eff754b111ef52180f6b07127ab7f0a31f88b8abc2ceae0e762753', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-27 14:29:45', '2023-11-27 14:29:45', '2024-11-27 09:29:45'),
('739546d81d07d315c5c5c66b066451a9d937bde30a4a29fa5d19d522a94352f08776b58e9af213cd', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 0, '2023-07-14 23:47:20', '2023-07-14 23:47:20', '2024-07-14 19:47:20'),
('740e56d949d946646341ae89fc830cb58e6fa35005616a12acfc0f3cc8273faa9fe844064d54f66f', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 1, '2023-07-17 13:49:38', '2023-07-17 13:49:38', '2024-07-17 09:49:38'),
('764e307ed031e7c6741c1a63c2cef6015469ed9f50bd78706f63a9109d43559d75daccc4dfbee256', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-11-26 02:13:31', '2023-11-26 02:13:31', '2024-11-25 21:13:31'),
('7708a3144f53bdad07c99320f70b4ba3fb6a4f777ecbabf0939064c2a7e70ad6f32bdb0b9263473d', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-24 16:41:33', '2023-07-24 16:41:33', '2024-07-24 12:41:33'),
('7857818155cebbb695ff8c563fe5cecb5bf1b5b09c5e6464bb6de91e45dc00311a664233aeee1827', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 1, '2023-06-04 22:38:01', '2023-06-04 22:38:01', '2024-06-04 18:38:01'),
('788ea1f4a13a3d4b4461ae35144721ee75bd9c0db6af630ee89efc795d54225ae94246a1dd57ffdb', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-10-23 20:04:29', '2023-10-23 20:04:29', '2024-10-23 16:04:29'),
('7986ecc98e4e1fccb4264bbbb596546688d92faa843ba1aad812a17be16b1dc940df003f18ff24d8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-08-11 01:22:56', '2023-08-11 01:22:56', '2024-08-10 21:22:56'),
('7ae7c22cfe6e351db6d5b97089c52b27675501ce928f5a81139f05c36583f7358f15c26e2e5734cd', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-14 03:07:56', '2023-06-14 03:07:56', '2024-06-13 23:07:56'),
('7b4f951408feed310258017489a2c66896a648b8c9b0c361e298b4722f488d302fadcc1b4a761311', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 0, '2023-10-17 16:23:33', '2023-10-17 16:23:33', '2024-10-17 12:23:33'),
('7b5f2874d69df518ea8443969287816f569719406f0849bacabf1674f87e1c04b93932dba153856d', '09b9e208-620e-4bee-8d52-17f528a1c7af', 1, 'User Token', '[]', 0, '2023-06-24 11:32:44', '2023-06-24 11:32:44', '2024-06-24 07:32:44'),
('7b665a08f7b47a6c6e18e26fe7e43f9ad22181f9d743f9b4385ada94e68f59fbaa2e5625dab2a1e4', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 0, '2023-07-07 15:37:25', '2023-07-07 15:37:25', '2024-07-07 11:37:25'),
('7bdcfd3706de5d327a7ef73f39e62a5649a91241d65505eb3500a99db778789c054bb51ab69ae724', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 0, '2023-10-22 00:57:16', '2023-10-22 00:57:16', '2024-10-21 20:57:16'),
('7d0b2afad0ee3fd4db273d7c8ff771133e59d005c0e48057243f306498da922381c2f561003473ee', 'b698ed42-287d-4374-93d6-fc04fe8b0dd2', 1, 'User Token', '[]', 0, '2024-12-26 02:05:20', '2024-12-26 02:05:20', '2025-12-25 21:05:20'),
('7d72ad09e5e379daab11aa851e5ef9b23531eaac4a3fa72b54281aea395052c0d791d1260d5ab619', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-21 13:23:20', '2023-11-21 13:23:20', '2024-11-21 08:23:20'),
('7dd280c06b3f7186b3c5034136516c6c6d85fbc1b9a36b7b19ed7d5b00823a2931938c852382e7e6', 'bf362079-b520-494e-9d26-513dbcddbf4a', 1, 'User Token', '[]', 0, '2023-06-24 21:41:50', '2023-06-24 21:41:50', '2024-06-24 17:41:50'),
('7e1463eeae7c0dc9fb1ac58c97ae271fe6c5a0fc3cb55342dff3acd04d7f38f939c441d4987b1b0a', '466ee50d-041d-423c-9bfb-c3368a7590f6', 1, 'User Token', '[]', 1, '2023-06-14 11:20:03', '2023-06-14 11:20:03', '2024-06-14 07:20:03'),
('7e3c09f4724d83e13568a92d9b5210262744b58587f03657e1c9b8bf58ccff66cab8be72ab9b7dda', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-08-11 01:16:45', '2023-08-11 01:16:45', '2024-08-10 21:16:45'),
('7ee219691fe58ce10564e8aadcdc5a09770db8e639e129e9c4ddc2ff60796ee0cb912581bbdb02a8', 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', 1, 'User Token', '[]', 0, '2023-07-11 00:50:55', '2023-07-11 00:50:55', '2024-07-10 20:50:55'),
('7f435ae3b445876edc4582ff4d78fded1fe94d56bdcc3c1f8ab06ffacb691e1f1aa1bcdac520a484', 'b746381e-8335-4180-ba01-dee614d88da2', 1, 'User Token', '[]', 0, '2023-08-09 18:49:08', '2023-08-09 18:49:08', '2024-08-09 14:49:08'),
('8051e7d561011b08d6dbeb0ccef18701429e363a057272bd18049ce68d7938e554317d2066c3140f', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-11 02:40:10', '2023-08-11 02:40:10', '2024-08-10 22:40:10'),
('80c0c84f1bd2603284b43974bd4ad1f21b037f5551551ed860d981c815b0cd95bd63748ad77a9e86', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-11-01 18:45:57', '2023-11-01 18:45:57', '2024-11-01 14:45:57'),
('80e6d70a693f6c8c4f1e7f57532953540accfc552248503730baed16fba1cdf63aef68067d5ca2fd', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 1, 'User Token', '[]', 0, '2023-07-14 17:04:44', '2023-07-14 17:04:44', '2024-07-14 13:04:44'),
('81486f31a4130c89a566a71e56f808174c49b4109f5ae40627d3c7c72fa022ea05a0750c9b34dafc', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 1, '2023-06-14 03:02:50', '2023-06-14 03:02:50', '2024-06-13 23:02:50'),
('818bba43c904552d552aa3009967795be3d4b4328a7990f6a3d6995d536047186adb983f79302e1a', '74062592-eb3d-452b-bd1b-bc35ff497d9a', 1, 'User Token', '[]', 0, '2023-07-24 18:18:45', '2023-07-24 18:18:45', '2024-07-24 14:18:45'),
('82379d71d7f35cd214b9c4be5b44c557ccb822596979880dc3fa8628dd38181c81965aae248f8de7', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-08 10:58:10', '2023-07-08 10:58:10', '2024-07-08 06:58:10'),
('826ea88558e1f67439edee9240c922c07066cfa3d561dfe5cf70a272c1175e743e7c7853dda22452', 'b746381e-8335-4180-ba01-dee614d88da2', 1, 'User Token', '[]', 0, '2023-08-12 16:16:47', '2023-08-12 16:16:47', '2024-08-12 12:16:47'),
('83b917714579c8dd4f2f95d02f6375a215855ccf3451e95b55e7c80f1109e2e26e51166500e02cf5', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-27 17:11:03', '2023-11-27 17:11:03', '2024-11-27 12:11:03'),
('83be1a4827bd5828b4cb75967ee2fa0bfb2923a12ae0274a77816e78cfca469396f9d4167bcab1b4', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 02:03:22', '2023-06-24 02:03:22', '2024-06-23 22:03:22'),
('83c95934486d9a7c0460da68f408ecc1bee6eee159873d07520a1264c85d9ead0a11299d2e50b1b6', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-23 16:42:58', '2023-07-23 16:42:58', '2024-07-23 12:42:58'),
('84aba828dc43feff20e0e8e50b6e3584a06936ad413780ac2feced0898b586ae23ea10fd5d0ab538', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-21 11:16:29', '2023-11-21 11:16:29', '2024-11-21 06:16:29'),
('84dbbbf03f891d00fbf143899291dede1a848575c5747a0865b758794b15ffa769b9ab28ea216f97', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-16 16:27:01', '2023-06-16 16:27:01', '2024-06-16 12:27:01'),
('85eed9dc420a5dbcde08e7f0a299e4afe7bae5d1265a22fda6145911c930404181add6fa1133fe1d', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-11-26 02:22:31', '2023-11-26 02:22:31', '2024-11-25 21:22:31'),
('8610372373c2b36c444f4a4cf78a84bed9d862d181a713b6f4eb9d7e16536ed84b1c0d76f44a66e8', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 0, '2023-10-11 13:17:06', '2023-10-11 13:17:06', '2024-10-11 09:17:06'),
('8698d3c22314276d4ac1a7ef2d2f7c771dbd6648977d6f1cde6d93ecf6af2914863c14a09a3925ef', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', 1, 'User Token', '[]', 0, '2023-06-25 21:24:03', '2023-06-25 21:24:03', '2024-06-25 17:24:03'),
('86ab9a7c74d8db0c06d48708b2b45875371c7709c93b32946689ab4dfaf384d69d1a29a6f6b0473c', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-14 12:12:46', '2023-11-14 12:12:46', '2024-11-14 07:12:46'),
('87cf1b29cd1d3ca19eee64c718bc33ca62bf61b54eb44253d0778119bc76924894884f0db387675d', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-20 21:53:07', '2023-11-20 21:53:07', '2024-11-20 16:53:07'),
('884b6aecc2ecc15250008205ebab5be69e6110862bf36fe7ea451993e7f784d5a509ada34da7ef70', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-10-23 20:01:38', '2023-10-23 20:01:38', '2024-10-23 16:01:38'),
('88ee308a530ec81ef6e080f2ff36219073534fd501166461733dd76da8f8802d4a8f7f4212f03db8', 'b6e8c4c8-ec2e-43b4-8af6-2c708b51288b', 1, 'User Token', '[]', 0, '2023-07-12 14:44:06', '2023-07-12 14:44:06', '2024-07-12 10:44:06'),
('8974eae2b2804b99e598ee8168ed0e4ce71d1ab1aa4cd88147c34c9e3d5f8a968b534e0c533cc19a', '827b6dab-72e7-414c-a807-ec33ef212f9f', 1, 'User Token', '[]', 0, '2023-06-24 22:26:11', '2023-06-24 22:26:11', '2024-06-24 18:26:11'),
('89f5874218c7e4ab029073d3d143b93f63081c9aa54a983a1c1de4d93b0514beefcd5f04eefc2347', 'ec3a1226-1ad5-452b-9634-f6281256c5a1', 1, 'User Token', '[]', 0, '2023-06-24 21:32:35', '2023-06-24 21:32:35', '2024-06-24 17:32:35'),
('8a2cb08c1a210929f44211582a5dd387cb314ef064ad6b70752dccc1144fb70a9cb06756279cce53', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-15 01:38:20', '2023-11-15 01:38:20', '2024-11-14 20:38:20'),
('8b76d7942842b653b8682f1b6ecfa6f1e7e55f3634f7278341667bd68289ee53ce9b2e94726c033c', '350c0570-c215-47ed-a5e2-9004652b91b4', 1, 'User Token', '[]', 0, '2023-08-16 03:48:45', '2023-08-16 03:48:45', '2024-08-15 23:48:45'),
('8bac642974538e3608d8b464a98e7a69161c92efbc226ea67d40b50850b8e89e25d5cf1e1317bda5', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 1, '2023-11-26 15:06:09', '2023-11-26 15:06:09', '2024-11-26 10:06:09'),
('8c38b05a53c06139ca97153a9b942fdd2a0f03d569d81250dda63bc8178a816e30b3b05a8653077d', '9762b102-139b-42a4-b2cf-4c24ebec507d', 1, 'User Token', '[]', 0, '2023-07-18 21:43:13', '2023-07-18 21:43:13', '2024-07-18 17:43:13'),
('8cdc1fdef3d31550f04eb14847ccb1d4f129a47d5e421639c21b1656725d1e08b9f1fccd14ff7455', '90af975f-722e-4625-b63b-8d23f47efba9', 1, 'User Token', '[]', 0, '2023-08-02 04:07:33', '2023-08-02 04:07:33', '2024-08-02 00:07:33'),
('8d60b11fc1291ebe9ed7cbe6ee299e8bffe9680f14681e004221ce5e3eb3ec6d226fcb8ffd0922ba', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 0, '2023-10-27 18:22:31', '2023-10-27 18:22:31', '2024-10-27 14:22:31'),
('8e614adeebedd4127b6e1bff219b9a64113d42e557a064daa8a2fabedea46df3a91e5eb4d53bf2d4', 'c0b5e8ab-e4df-4825-b1dd-e9a090f090f4', 1, 'User Token', '[]', 1, '2023-07-02 22:57:13', '2023-07-02 22:57:13', '2024-07-02 18:57:13'),
('8f5f8be13ae3a33e65a5a54a80d1db603db8fb1a465d1c540f3103e77241e73e45e768f011a3ccfa', 'ba302590-fe65-4203-a5f6-4193fa655469', 1, 'User Token', '[]', 0, '2023-07-20 15:39:43', '2023-07-20 15:39:43', '2024-07-20 11:39:43'),
('900dabf3bf9831a5c05c2f558d0ff52913821e41d76f2a8b71ac9a081883e5095e51acbc94fbeb1e', '55185a4b-f018-427f-941d-f483d91a6545', 1, 'User Token', '[]', 0, '2023-06-25 13:59:05', '2023-06-25 13:59:05', '2024-06-25 09:59:05');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('90b631bb31d40e75a5dc606b84d2d0839b06a2f553b1e41dfe580bf939ad29fb197ed14be6c25a18', '81c1488a-1800-46fc-883f-070edc63dd29', 1, 'User Token', '[]', 0, '2023-08-02 21:33:40', '2023-08-02 21:33:40', '2024-08-02 17:33:40'),
('91f10a6506da84c5f777f9455e6b04b9d1b072533dfec2032a09788eb64840306e7b0fb87c7ef645', '3901e59b-89c7-4d6a-9544-ebc43571261b', 1, 'User Token', '[]', 1, '2023-12-11 17:53:56', '2023-12-11 17:53:56', '2024-12-11 12:53:56'),
('91fbfc7dd03eb3f45f17f4ab7b3eac5a30a213311e2191ba8958bbb47ebe4aa38322e94333f49888', '6b2c1f80-45d0-4e43-986b-aa913d3bb99f', 1, 'User Token', '[]', 0, '2023-07-05 17:52:58', '2023-07-05 17:52:58', '2024-07-05 13:52:58'),
('921b9ea5cabfde5ba2fa1b5d91aad95b6bb70f062caaf37a852ae518e41e69aaff7b77fbaefaa01b', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 0, '2023-06-04 15:40:00', '2023-06-04 15:40:00', '2024-06-04 11:40:00'),
('92d3e3bbdfc5cfeb9cfff7602deb3b9aa9a786f8aa070a918f323fc5ebef81693644b01a3ea7f722', 'c0b5e8ab-e4df-4825-b1dd-e9a090f090f4', 1, 'User Token', '[]', 1, '2023-07-02 22:55:04', '2023-07-02 22:55:04', '2024-07-02 18:55:04'),
('9356cab5e97ea936002c2be857dc1e9b4d19dc07c38a91d71973e5b5a72f9c36de9626556368a9ec', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-12-04 22:02:04', '2023-12-04 22:02:04', '2024-12-04 17:02:04'),
('93756a277d9985f97da4fa0813179359cec53894250588a276dcb2324a6440886b0b28b0cbcdc7b9', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-08 10:22:31', '2023-07-08 10:22:31', '2024-07-08 06:22:31'),
('943118db80ce9f6d3903da256eafad1d6822951a7d6eba646c85a54ed60817fc76cd5307a417180c', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 1, '2023-07-24 17:48:13', '2023-07-24 17:48:13', '2024-07-24 13:48:13'),
('948ce3a7d70cf3108eec1be6930ae4c2454e500861d0fc362deb08f483036e85f62de644be538b30', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 0, '2023-07-22 17:22:19', '2023-07-22 17:22:19', '2024-07-22 13:22:19'),
('94a37c120e040e8b78f3944baf9f3b20c942cdb4f62695c1a2d387cf63cba1de8c42cc118c19530c', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-02 21:26:12', '2023-11-02 21:26:12', '2024-11-02 17:26:12'),
('94b426eea21f3521edc36e7c6124db0662bcd1db2036bc0c1e01fbf12578b319b4dddf759d545e6c', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-21 16:21:38', '2023-06-21 16:21:38', '2024-06-21 12:21:38'),
('94b48d27486adb2b9e268599133f71dd1b6d6c660324aef07160c5f1c7f9945c019035377dd36d11', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', 1, 'User Token', '[]', 0, '2023-06-24 15:01:10', '2023-06-24 15:01:10', '2024-06-24 11:01:10'),
('96f349dd2f7b91f347bb66aa6c9903509a3113cc0032b36d71becfd9b747b3e8788fc8dba4e71642', '37fb4bc8-57aa-444f-931a-5cf2e9df2cb0', 1, 'User Token', '[]', 1, '2023-08-27 01:25:46', '2023-08-27 01:25:46', '2024-08-26 21:25:46'),
('96f8fc6eef2189e6160343ba4c79b37759840bd38f00a411381dff6358173c7fec6b3e1532bcdf08', 'e3628adf-c9f0-4b9e-aba9-6d4a8d68ac8a', 1, 'User Token', '[]', 0, '2023-10-30 02:53:44', '2023-10-30 02:53:44', '2024-10-29 22:53:44'),
('97c1ec0c53d19666f661da9b0b2dda4a20e456a0bf0ba6241d8a614117766c4f2fdcada6b213a325', 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', 1, 'User Token', '[]', 0, '2023-11-01 23:17:10', '2023-11-01 23:17:10', '2024-11-01 19:17:10'),
('9895792106cd65a3b0e9f73a8bc234d24f3f6c27355786ea791199059e051bb9e398166b3532e42f', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-08-02 02:36:30', '2023-08-02 02:36:30', '2024-08-01 22:36:30'),
('996098c41a222a3d21f0b5b282fd5801f00760f49f3922877f5cff6dedf648f8d71c591b776b6338', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-02 02:39:25', '2023-08-02 02:39:25', '2024-08-01 22:39:25'),
('99eef1e236851862202c4eb6c10c451d8cb4ed3482698a6520da2e045b7864b97fa6113b75e48e23', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-11-26 15:12:10', '2023-11-26 15:12:10', '2024-11-26 10:12:10'),
('9a5e8c49a812ab5552206375165d8c3c3d9dc421253309cb90f1c742fadaa634b0efc66e5abbfc5f', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 0, '2023-06-04 15:43:32', '2023-06-04 15:43:32', '2024-06-04 11:43:32'),
('9b9ce0da185142ad719903c6d7b1ff9d4c1fc853041cba50b32f2ff5ab172cbbe48f2bfd58d34a59', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 0, '2023-06-06 23:17:53', '2023-06-06 23:17:53', '2024-06-06 19:17:53'),
('9c8fac5ce76a4fd1abb47fe8e0cfb915a7a8d34a8563bb7195f2add842f7b44e3c264a2b3174528f', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-02 17:20:59', '2023-11-02 17:20:59', '2024-11-02 13:20:59'),
('a0135a6da10a43ec8c478bbd226242e024d686ab52dc6c9deb77ef9972ae1cbcc06a0677c79d0650', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-28 17:47:50', '2023-11-28 17:47:50', '2024-11-28 12:47:50'),
('a0b919d5f336649e53f18a49dab925e0920ead90dd1d8ea0d2af0cdf277dab226ccb6a7ec08c71e7', 'e483a3d0-e520-4709-baad-d7e500389c77', 1, 'User Token', '[]', 0, '2023-08-20 14:17:53', '2023-08-20 14:17:53', '2024-08-20 10:17:53'),
('a0c40460284dcbf5adc466bdc04d212db3495cdde0e2dcef785b1329a818c95002638e254ca25e1e', '1936d2aa-7372-4a68-86de-5863e861effc', 1, 'User Token', '[]', 0, '2023-07-24 15:33:20', '2023-07-24 15:33:20', '2024-07-24 11:33:20'),
('a19395fbe33126d571d5a497afc8744e85a1aac62c2904c8f3d9156735988c7619854b8af3558991', '28b1178e-0380-4440-862c-96e27d2ad2d2', 1, 'User Token', '[]', 0, '2023-10-30 02:42:17', '2023-10-30 02:42:17', '2024-10-29 22:42:17'),
('a1d434e0005c657cdb51b4d93d0cb667dde0ad9a1ca1168d08eefb6292d735a4fbc64b14d043f6e5', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 0, '2023-07-17 14:10:38', '2023-07-17 14:10:38', '2024-07-17 10:10:38'),
('a2032fe6d775431df034eb637ad9a7dc672f0543296732898b570900877839cba8ec3c6a4e623940', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-08 17:44:12', '2023-06-08 17:44:12', '2024-06-08 13:44:12'),
('a25a16076674afc2e2a3c7b4eec7917baa3e0034adb76d6216698921ea9676980364ef31a6b7ec14', '1522698a-4178-4f28-9afe-3f75e6710684', 1, 'User Token', '[]', 0, '2023-08-18 18:40:48', '2023-08-18 18:40:48', '2024-08-18 14:40:48'),
('a307c502f262d3c8affdfc5eda7742cf799b978e8a07dd22d1317ce6288cb2ae53361f685e41ff61', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-22 00:34:23', '2023-10-22 00:34:23', '2024-10-21 20:34:23'),
('a3e4d53b7d92d96e92e203ad431bb166f62bac270131ebe55db6ca742ec89bda4ea73c79f8980a03', '01457cd9-144f-4eb2-988e-18e55d035361', 1, 'User Token', '[]', 0, '2023-08-28 22:02:08', '2023-08-28 22:02:08', '2024-08-28 18:02:08'),
('a42b12682cf92932c01c7c76c6e4b486269e37adceb7ab112fcac1847982a6a5df2760c28964e243', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', 1, 'User Token', '[]', 0, '2023-12-26 21:22:44', '2023-12-26 21:22:44', '2024-12-26 16:22:44'),
('a52b68f7115afca1c7c5d1bd6d343cc26f2364ae2e11b589c19673a8dd32fb7dedb5cdca68c73799', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-22 01:16:50', '2023-10-22 01:16:50', '2024-10-21 21:16:50'),
('a5bbf96d46d4aae4f6c12fcec188addc5ecaee898e59111de56ed7f333eef17988f97f006c8f32a7', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-08 10:03:04', '2023-07-08 10:03:04', '2024-07-08 06:03:04'),
('a60b03c03b0bea803aa718dfbddf8058d39da442628c8d665a466cb0575d76d3e8bdaa5309e70846', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-21 13:31:03', '2023-11-21 13:31:03', '2024-11-21 08:31:03'),
('a672f4204cec5f17ff4eb2c9d4a9022e9d86b98da9e49e10c56ebb1c375d2e2e8a1374b3fbba6f2f', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', 1, 'User Token', '[]', 0, '2023-12-14 02:38:55', '2023-12-14 02:38:55', '2024-12-13 21:38:55'),
('a7f89e12531c2ff243582e9460d47eee7770b9966727af38177c8bace6acea348ab44418f30aecf1', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 0, '2023-06-24 02:10:48', '2023-06-24 02:10:48', '2024-06-23 22:10:48'),
('a80564afa54f0677bde5396d4dde39bb6276871064a8aa5a8ba3a451056a8e4e5d159d31f1517f7a', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-12-14 02:37:54', '2023-12-14 02:37:54', '2024-12-13 21:37:54'),
('a8e6aa40b059ef0ee9e6a255736e83cc6d6778456099aa040b2ef302501eb2b919c45d882c2c7130', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', 1, 'User Token', '[]', 1, '2023-12-14 02:10:45', '2023-12-14 02:10:45', '2024-12-13 21:10:45'),
('a90532c49258af7eeadc25f6b33e9e93f822f02e10f55a26282feb372981d9a49d0948161d3065bb', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-15 01:53:42', '2023-11-15 01:53:42', '2024-11-14 20:53:42'),
('a9e6f2e41261c541c8bbe610c186e4669108b501cd82600c91e6b8df3d31e79c758d755f687635ea', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-11 02:53:06', '2023-08-11 02:53:06', '2024-08-10 22:53:06'),
('aaeabc5129fc305882d9f0056843a1cab6b58828afe002be1fd726a04e7e51c8de0c44fa5bb969c5', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-08 10:50:57', '2023-07-08 10:50:57', '2024-07-08 06:50:57'),
('ac3b420639afb31d9708a3c3e6774820036c71ae3793d3d2138cb90d57de309b15fbcc3ecaf3b857', 'ea2cfdfc-97e0-4444-9b57-51f68dd43dd1', 1, 'User Token', '[]', 0, '2023-09-07 02:30:15', '2023-09-07 02:30:15', '2024-09-06 22:30:15'),
('ac8caab45f88c581bc0762f6613dcb6b1db20a6a67896b1cfbe939aedced6f2757ecb368b689e6ed', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-23 14:46:09', '2023-06-23 14:46:09', '2024-06-23 10:46:09'),
('ad9e063fd23aa3464267ef84e8e8e7bedbd31e1e7b45d73a065f6ecb28e2827930bc910b7970e9ba', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 0, '2023-10-22 01:19:02', '2023-10-22 01:19:02', '2024-10-21 21:19:02'),
('add283422f7099a4d9a89da902a475012bb8e5293f61f18cd79895d4b6d119f15ce58a8ae4a2ffb6', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-24 16:56:11', '2023-07-24 16:56:11', '2024-07-24 12:56:11'),
('b0083a3f53c2e3924ef9fb636fdbd372ca2aa066ee25508a5fdbe90d099045cf0f9e12dadd3c6738', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-17 13:55:32', '2023-07-17 13:55:32', '2024-07-17 09:55:32'),
('b1ac1afd9116b9f25796a547afe6fbed88c04a5303dddad12d3aadbc4601398a034b5f054c7cf887', 'f63ba367-6a3c-486b-8181-5e474c6a6369', 1, 'User Token', '[]', 1, '2023-09-04 01:12:35', '2023-09-04 01:12:35', '2024-09-03 21:12:35'),
('b22686e84f2427132b87f5d0c83381bf5d69fca4ef1f43f8b1af520e94f99d53a8c621e4a2321b5a', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 1, '2023-10-14 06:25:01', '2023-10-14 06:25:01', '2024-10-14 02:25:01'),
('b2d2255a333183469361478360a4a7df4955d9e16bcdb6b6f2b3c399864f40720bb34e1f7a853e65', '2ea627af-3622-407d-9d0d-366e8ecc8285', 1, 'User Token', '[]', 0, '2023-06-14 03:10:30', '2023-06-14 03:10:30', '2024-06-13 23:10:30'),
('b3d25ead87b6af6ebb4114fa9d0e975218c2474c95bd5c6cfd4123fd3fa3b06f98a87d23183164c8', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-13 02:56:17', '2023-06-13 02:56:17', '2024-06-12 22:56:17'),
('b4dace30ca8626c34b43b3fbaccaff3e20e8a3f5490f3036f5c0664811807ee4b579ee09518091bd', '827b6dab-72e7-414c-a807-ec33ef212f9f', 1, 'User Token', '[]', 0, '2023-06-24 22:23:02', '2023-06-24 22:23:02', '2024-06-24 18:23:02'),
('b5da17c814e58fa8fb27aa405859ae838e95e74259f97094e667657c33e9ba2449071bf5fae2b985', '82fba06d-eac5-487e-9919-f261ec20667f', 1, 'User Token', '[]', 1, '2023-06-29 15:35:36', '2023-06-29 15:35:36', '2024-06-29 11:35:36'),
('b701775a2c68475992df31b5f2fc51571216f878f34789876d87e18a700628238d08af8dc0f1493c', 'b7de0545-cc99-41f4-8007-f1be16701494', 1, 'User Token', '[]', 0, '2023-06-24 23:39:45', '2023-06-24 23:39:45', '2024-06-24 19:39:45'),
('b7e2a619331a6e34c5a127441b4af09a2e6cd35d551ff0281598a32dcf8b42782151364da71ba4b3', 'f719b327-49cf-4f24-a6f6-1c45fee81ec4', 1, 'User Token', '[]', 0, '2023-06-14 19:36:01', '2023-06-14 19:36:01', '2024-06-14 15:36:01'),
('b806f5fd2c9e1e411ed0decaa1a95f6e7325a856890e44abfe2daf3df3fe976024cfc97359decd4d', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-07-30 18:35:21', '2023-07-30 18:35:21', '2024-07-30 14:35:21'),
('b870c92497484bbd8259e701b8b2dd5010a324dbac7601b30e8227a21e118871bbd0b4e2c4ab28bc', '1476a3f4-3a68-4619-ae2d-443109fbac8d', 1, 'User Token', '[]', 0, '2023-11-05 04:21:12', '2023-11-05 04:21:12', '2024-11-05 00:21:12'),
('b936bc89d220a061aed6729b6b9f7c14981e45ad0569f2403c1e04981c655ce570762affe6cf86e5', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 0, '2023-08-11 02:51:20', '2023-08-11 02:51:20', '2024-08-10 22:51:20'),
('b98ff333d3b918c2a42c753d0474deb91c847d55f3b14f2f663c9adb0e14092888c1913373214714', 'da7ade6b-ab3a-4b18-b24b-f18878f5f352', 1, 'User Token', '[]', 0, '2023-07-07 14:04:04', '2023-07-07 14:04:04', '2024-07-07 10:04:04'),
('b99159a165cf6676d2c33103b944c4376a31ae4fe3b5d433db07efc38d76f6d4c7fc8540c878a09d', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 1, '2023-06-14 03:02:16', '2023-06-14 03:02:16', '2024-06-13 23:02:16'),
('b9c0e518283c345fd6d56f8cbdbc57eda9d812a19640e558929ec4ba1ab764a92acf8112f9aff5ca', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-10-23 20:06:12', '2023-10-23 20:06:12', '2024-10-23 16:06:12'),
('b9d5362f3e18a011853104880d8586d3f6f9ec4eedcda1470cdbebb37e41ac25dcdf3e30be5452a0', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-03 22:16:33', '2023-11-03 22:16:33', '2024-11-03 18:16:33'),
('bb9437effe83a47ff9eabf7417108f423a8bf3be70189175a34f89115599e45f4d074682bfa158a1', 'b3efe98b-5d55-4788-910b-fc2c4178d88b', 1, 'User Token', '[]', 0, '2023-08-27 00:17:10', '2023-08-27 00:17:10', '2024-08-26 20:17:10'),
('bbcb42fa80bf29d556baadff5dbc1594f8522ea7f51a811771164b515444e3cc6df4b6176a1963eb', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-12-05 04:22:10', '2023-12-05 04:22:10', '2024-12-04 23:22:10'),
('bbf0e72931403b09346342817578e35773c3e678c14f2dfd3d0600d782c98b12b974dbadc6a832c7', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 1, 'User Token', '[]', 0, '2023-07-14 17:06:24', '2023-07-14 17:06:24', '2024-07-14 13:06:24'),
('bca55211670120bb4eb47f9f1086a4029833978d92691ab907497b891e4b58f09ec2d720dc366d67', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', 1, 'User Token', '[]', 0, '2023-06-29 07:36:14', '2023-06-29 07:36:14', '2024-06-29 03:36:14'),
('bd2c8c83ddc1a299bcfac5f56458bcd03ae11d2d09181d339e1478923372d4fe5b0e188096d73ef8', '90af975f-722e-4625-b63b-8d23f47efba9', 1, 'User Token', '[]', 1, '2023-08-02 13:28:10', '2023-08-02 13:28:10', '2024-08-02 09:28:10'),
('bf8f4fd437d4af62c04910f61b70a05251786aca897432fe3be254f82d59b727d081f5e15cee9981', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-07-30 18:46:13', '2023-07-30 18:46:13', '2024-07-30 14:46:13'),
('bfd6735b2c07893c1fd8957ff6c086a8d9b2dc7a34eea28d0fd334e1ea70785c673c0cc0809db30b', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 01:58:43', '2023-06-24 01:58:43', '2024-06-23 21:58:43'),
('c0623c0482ddfbc3c5b2d484951502da0b8bbab153933d859ce43383e4841d423ac8cf450c0cd1d8', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', 1, 'User Token', '[]', 0, '2023-08-24 03:38:39', '2023-08-24 03:38:39', '2024-08-23 23:38:39'),
('c06687ba452c15e2f8553e3139a955669177927ae1d3689f5c68172aab54ecb6be00971185a558bf', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-08-15 00:20:30', '2023-08-15 00:20:30', '2024-08-14 20:20:30'),
('c0843acd5bd367bcf8d5cbcd23ab560519fcbcda4f37af45914b6d3d5fa9c0e008c2bca2a922503a', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 0, '2023-07-17 14:02:20', '2023-07-17 14:02:20', '2024-07-17 10:02:20'),
('c107ae88945c7463d265057dc968df685f7497c3bd695525a548f720d8c75714e3626f807a9c06f2', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-14 09:28:03', '2023-07-14 09:28:03', '2024-07-14 05:28:03'),
('c17a843b22399ae80f814cc5660fb1076562665161e10a269358b756e7775a82ff83f66c06f2480d', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-11-26 02:30:06', '2023-11-26 02:30:06', '2024-11-25 21:30:06'),
('c1b816afd6261c054ba3468fe63113f99534db72368f690bb6ebb8ec3d663c05a4aa79f6eb2789ee', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-08 10:05:59', '2023-07-08 10:05:59', '2024-07-08 06:05:59'),
('c1bb5fa115c39564c4ff646a1715e1d4eb2bca8556d7102db03395c14614210acdb52df7c7fd13d7', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 1, '2023-06-04 15:47:24', '2023-06-04 15:47:24', '2024-06-04 11:47:24'),
('c2ee4c76957a3477650391b5c0785394f3ece54ae6892c4247099464f56436e8058529929796f55e', 'bb09984e-1c72-45a5-9641-249d25d70889', 1, 'User Token', '[]', 0, '2023-06-30 01:01:47', '2023-06-30 01:01:47', '2024-06-29 21:01:47'),
('c3e5479875b308723f71d53e0d5a810f5b0173a699bccf64c1d02a887a4784e0d67f0394635f382f', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-05 03:01:59', '2023-06-05 03:01:59', '2024-06-04 23:01:59'),
('c45187a8ca816a57cf80ba0c89919298bd255233fe254052595f01112ecb09aa1a2e25244a745f5f', '6237ba45-cd42-4709-bc32-7184efcdb949', 1, 'User Token', '[]', 0, '2023-06-14 11:43:21', '2023-06-14 11:43:21', '2024-06-14 07:43:21'),
('c49020d9c0ab0040a7ec4c9597bc7dc6e915da871965e8382947eae9d4e7c9d83c86ef9ecfeef38b', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-13 23:58:35', '2023-07-13 23:58:35', '2024-07-13 19:58:35'),
('c524ea78a24f54631409b3a1b9d964f2c92ecb087ebdd9b06cae76b9dd0253345af5d1a9678a043a', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 1, '2023-11-14 01:40:14', '2023-11-14 01:40:14', '2024-11-13 20:40:14'),
('c59cc0effb9e753a561e30f49cd7b202c214e7dc03249a7554d2c11d9deb0e64b36888aac92e93b7', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-12-13 21:16:41', '2023-12-13 21:16:41', '2024-12-13 16:16:41'),
('c6af1f8cca6a87d4d22298ac1828a0fa98cb71241f852a66213c9d6b545b778eea630574d0b2cebe', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-07-10 13:04:45', '2023-07-10 13:04:45', '2024-07-10 09:04:45'),
('c6f584deeb75c0b16b1489febd25e01bd39a1baf50c73df5db5830479a290c5cccf451f825c85138', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-17 13:54:49', '2023-07-17 13:54:49', '2024-07-17 09:54:49'),
('c9d6c3d7fc7fcf951c4f9ffbf727e09230f408fe5087a58fc85799768491b94c52cf00b801e2f2e6', '0d3639de-5470-46e4-931c-aee686676f9e', 1, 'User Token', '[]', 1, '2023-06-14 17:46:03', '2023-06-14 17:46:03', '2024-06-14 13:46:03'),
('ca2259dfc301bfdd240443d0114dfa0553b142dbdf0b737d3420a60cc1cdfbf06d7fd74854fd49ad', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 02:06:54', '2023-06-24 02:06:54', '2024-06-23 22:06:54'),
('ca40ad46ab9314dd95358694f448e8f87e46927cfb2266b97ff091d1ad7d09d9fc4da19469634f4b', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-30 18:40:08', '2023-07-30 18:40:08', '2024-07-30 14:40:08'),
('ca7286900e7ebd8ba5277ce7ce310727156bab42a9abee5fa8afd847087d3e83f971e20794cb64af', '642ef59f-9127-4799-a724-93de4af6c3d0', 1, 'User Token', '[]', 0, '2023-07-24 17:51:06', '2023-07-24 17:51:06', '2024-07-24 13:51:06'),
('caf19645ddf492c6d74c91ecdb60f30b47d87b470fad28fb66c99d06a66bf492ab6d47dca4a0dbe8', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 0, '2023-06-24 02:14:24', '2023-06-24 02:14:24', '2024-06-23 22:14:24'),
('caf8d1aff62eacbbab300fef9729a8ee3f16c920c75ecfe6e236083a65ed2547390d0b0c15b3757f', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', 1, 'User Token', '[]', 0, '2023-06-24 16:56:00', '2023-06-24 16:56:00', '2024-06-24 12:56:00'),
('cbfbe117be3b7c6438a4712c65c18b805167732365634839cd5b4238aac0b0c1af6bcd25bfaea1bf', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 0, '2023-06-10 01:58:58', '2023-06-10 01:58:58', '2024-06-09 21:58:58'),
('cce54b4e03e5d98cfe55be60e724a679e2182e268b90eba1b22aa629cfe4b64c491a4e04dfb18ee8', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-11-14 01:29:39', '2023-11-14 01:29:39', '2024-11-13 20:29:39'),
('cce66ed98e9af7dbee6992e41fc72fae25bcc2e5b739dedb5bb6f4871da97fe8ac13130c086d1940', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 02:08:29', '2023-06-24 02:08:29', '2024-06-23 22:08:29'),
('ccff3149044858f60c6b20ed92bcf37b511c57909ceb0aa9ea98b3d9ea1453c0ac18be9c1bdca55b', 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', 1, 'User Token', '[]', 0, '2023-11-01 02:17:48', '2023-11-01 02:17:48', '2024-10-31 22:17:48'),
('ccffa758c62168862a089e4532aad5ab761d4ccfcd0f700071a14fe722b9f1de2baa007c2c38dd9d', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', 1, 'User Token', '[]', 0, '2023-08-24 03:46:53', '2023-08-24 03:46:53', '2024-08-23 23:46:53'),
('cd12088534bdd3cb6f7d30ac6d691096a35db33f25525b635918d8fa68c024878df8e249e4326fad', 'ff4f1965-7068-4d8c-a7e4-b448830ccaed', 1, 'User Token', '[]', 0, '2023-10-27 18:30:15', '2023-10-27 18:30:15', '2024-10-27 14:30:15'),
('cd1f1b14fa6ab342b52f1cb37d4eec6aa86f43bc8d95e9243b9468c05e9eff2bf1fd5b644a54090e', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-22 17:52:26', '2023-07-22 17:52:26', '2024-07-22 13:52:26'),
('cf1e3ab55e2be70d551a60747944935376b92c1b19438b8e45caceb21103c9ace84818cb3ffacf78', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 0, '2023-10-28 21:55:05', '2023-10-28 21:55:05', '2024-10-28 17:55:05'),
('cf424ea4726cda2954826dffa96936c4c770722d248e7a7aea73ff4fd7c51b8eb1ea91b045b76cd3', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-07-08 10:04:45', '2023-07-08 10:04:45', '2024-07-08 06:04:45'),
('cfa772a8d2710bc7416cd3fd470529f1ab9354c7ab1c76fcbbce301ae78a6ddad8aab5a174fa72ff', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-21 13:30:46', '2023-11-21 13:30:46', '2024-11-21 08:30:46'),
('cfe3bed814f3ff54e748229388adfc1c8363b7a0a97d3f3d72f0077e88af28f024754a3e05b7a360', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-10 23:44:36', '2023-07-10 23:44:36', '2024-07-10 19:44:36'),
('d0c87bfcd912b1b831455cdeb31c0846af5ef0a356d6a6603f9657e31acd2c73ed54c0524658dab7', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 0, '2023-10-22 01:08:51', '2023-10-22 01:08:51', '2024-10-21 21:08:51'),
('d25223cafa54cbcfc73c4226457843a7fba56b54345d4755c8ce9aac897605455f327e3441a7ae96', '476ff7ad-7d9d-4207-a02d-6d35f375730b', 1, 'User Token', '[]', 0, '2023-08-22 16:56:42', '2023-08-22 16:56:42', '2024-08-22 12:56:42'),
('d2bd951a3f20cbe57bc4bcad22d0b1a662c9f4be7e079451cf35adf69b9f1b587b5ddc89540f9b8f', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-05 18:28:55', '2023-06-05 18:28:55', '2024-06-05 14:28:55'),
('d2cce20e40e9f89a8a7ccfd5102e760578fd5f19347294a5be5543b7c5dfbd1484ff59b74fcb70e1', 'a48b0478-25ed-403d-bd3f-f4f299b7ec2c', 1, 'User Token', '[]', 1, '2023-07-01 14:48:26', '2023-07-01 14:48:26', '2024-07-01 10:48:26'),
('d2d0a4bab10bc3855c55961bc577ac6c89cc22662886eb0c11f577fdf40ca9ebd7a8f49f87f90b5e', '489731f2-960b-4f66-a74f-73276b1aff4c', 1, 'User Token', '[]', 1, '2023-10-23 19:58:31', '2023-10-23 19:58:31', '2024-10-23 15:58:31'),
('d32179e81b7e5256124be6209902f29cfe760521ccff1d3c304e71d5624cfed86f89937b2a134679', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-16 23:56:32', '2023-10-16 23:56:32', '2024-10-16 19:56:32'),
('d3afd6a2e15de895185adf902a79cefea7d70328ea1944767da7f520e84799b04bd9f5d289595809', 'b6e8c4c8-ec2e-43b4-8af6-2c708b51288b', 1, 'User Token', '[]', 0, '2023-07-25 16:10:02', '2023-07-25 16:10:02', '2024-07-25 12:10:02'),
('d4a461773d6e85ec5a7a330871910ee70c3d7fd0273bc65dc7b4431db322222d81e19f2079ece303', 'b746381e-8335-4180-ba01-dee614d88da2', 1, 'User Token', '[]', 1, '2023-07-25 01:47:08', '2023-07-25 01:47:08', '2024-07-24 21:47:08'),
('d4e29729c889d43911ad9f741100024b47b427b3f73689a97fc6c405e43c2f01860c62ba4ab95dc7', '28b1178e-0380-4440-862c-96e27d2ad2d2', 1, 'User Token', '[]', 0, '2023-11-01 23:22:28', '2023-11-01 23:22:28', '2024-11-01 19:22:28'),
('d62beef6a6f697d208fa98d3db7369c88326b1a1bd09fdcd422d3f8a5f8d94a5ce12be097c7c761f', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 1, '2023-10-13 16:59:57', '2023-10-13 16:59:57', '2024-10-13 12:59:57'),
('d6e170895cd96aa7c1263fe79bcfe897d9b19cc8518f1aa50d80f80150fdc92dc0d94eac01061204', '602a8778-15c5-4ba3-bad2-726aaff5bb13', 1, 'User Token', '[]', 0, '2023-06-15 15:09:34', '2023-06-15 15:09:34', '2024-06-15 11:09:34'),
('d7f694934b4dcf4564717f44cae5212d9c6c5ce74c383ef9ce217b816e11cb016a8e6a5889a7adfb', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-11-14 01:39:24', '2023-11-14 01:39:24', '2024-11-13 20:39:24'),
('d857d178ab8f074942e3644d9ffdbc61fc2a94d5d1e6bea1683d912c8b9ae4463a65c131671584f9', 'b698ed42-287d-4374-93d6-fc04fe8b0dd2', 1, 'User Token', '[]', 0, '2024-12-24 08:42:04', '2024-12-24 08:42:04', '2025-12-24 03:42:04'),
('d8877b193d7036373209460f77779863afeeb8df82f88aeac4b953068b3a5c2e7d6ff6c324959597', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-11-14 01:28:59', '2023-11-14 01:28:59', '2024-11-13 20:28:59'),
('d9127b0f8b209763f5817533bd02583b6a276c527edb61b96a6b0b8ad4d9bd4d3f878d77b8dc7bf1', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 02:09:28', '2023-06-24 02:09:28', '2024-06-23 22:09:28'),
('d9ee1ac5f381fe5688025c7bc9207e56b9b607fe8a2dda6386fcfba92c6088d909852dc2a7cbdbd0', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 1, '2023-06-24 00:40:20', '2023-06-24 00:40:20', '2024-06-23 20:40:20'),
('da4c51ac4d47bb7058bdb024fb24b87dc83ad9a9febd50f7d38444c14cbda680f32313d8a045e8b9', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 02:01:07', '2023-06-24 02:01:07', '2024-06-23 22:01:07'),
('db0403fb5fbcbe32aedfc8a15fdabdd979c517669c34da12b6b1d5f94033ef5d1f4dd64b11b6cbd3', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', 1, 'User Token', '[]', 0, '2023-08-08 01:29:37', '2023-08-08 01:29:37', '2024-08-07 21:29:37'),
('db080e4795e3e50bf9494af3374130fdaabd41e1f4e28b80e9a70dc82c0a9ea640f2f97dbd7de81a', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-02 21:28:06', '2023-11-02 21:28:06', '2024-11-02 17:28:06'),
('db7322bac5243da4bfce6aa4ab8f3dcd29ebb58ec7ea8a2e99fa4a158d0ee181b8bbb3ad5217c0ee', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-20 22:13:22', '2023-11-20 22:13:22', '2024-11-20 17:13:22'),
('dcdabcd91011b1d5a6ccc183add9749bdb856e569378c794fbed890a5c2b71f52a565ea8ba3e9e3e', '83cda510-0304-479b-a98f-7b7c8140fd0f', 1, 'User Token', '[]', 0, '2023-08-07 00:21:37', '2023-08-07 00:21:37', '2024-08-06 20:21:37'),
('dd4ff07f47105f6a6be11c84858a6971221abb25e77a9d0d02be17016be60d3d9a7313bd7d75b91d', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-10-23 20:02:42', '2023-10-23 20:02:42', '2024-10-23 16:02:42'),
('dfe9cba9c7e3d62cde1f1057ef0879752a7dac65ba45fcde06a3952c1a99357375e66ed1b03a9703', '288a98f5-e5c1-4983-96e7-a71838903b86', 1, 'User Token', '[]', 0, '2023-12-13 01:53:21', '2023-12-13 01:53:21', '2024-12-12 20:53:21'),
('e00f54270b0105e33201f3802baacd49fd730a0749b3f5fd1a1e6b229291cd244f76898af5a2f423', '59d76e96-8b5e-4300-b85e-f6d465fc928f', 1, 'User Token', '[]', 0, '2023-07-12 15:38:49', '2023-07-12 15:38:49', '2024-07-12 11:38:49'),
('e1da37ddfd9d0a113bb5e392836738c62dde107a1992caa6f51430d0629fa2521d23676086955f44', 'a29c133e-7190-4bf5-9f15-8632d1ea4609', 1, 'User Token', '[]', 0, '2023-07-24 17:52:59', '2023-07-24 17:52:59', '2024-07-24 13:52:59'),
('e28ce3f2f28e0e3d2037e174aba998d930ee51d6dbfe2a98038bf920d0b13d94b5ee0b89e8c93275', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-14 02:44:14', '2023-06-14 02:44:14', '2024-06-13 22:44:14'),
('e2a005d96ee1914bf33e11b950c507ff5fd3bc0069403d74ea8c9c86b2f3f2eae62bedc406b6a5df', 'a8939a64-33ad-46ec-8937-4aa4cf389af4', 1, 'User Token', '[]', 0, '2023-07-02 22:57:37', '2023-07-02 22:57:37', '2024-07-02 18:57:37'),
('e2bf35fc7653028099d2d4140b700aac93c2836f67c6f8e37b54f2aa17b0ebd453b2748ecce7f7fb', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 0, '2023-11-03 22:06:13', '2023-11-03 22:06:13', '2024-11-03 18:06:13'),
('e2cf0f8d57c8dd4e89e7cc3e0545b6b9ad04bfda893a6f40bf63e09ec3ff259644466dd58bb8a170', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-11-26 15:30:43', '2023-11-26 15:30:43', '2024-11-26 10:30:43'),
('e33511fa0ffb38ec9f1777287bdc823aae935c971dbe48e1974817df12d56e38a7d87708e3125808', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-07-24 16:47:00', '2023-07-24 16:47:00', '2024-07-24 12:47:00'),
('e384e60de39ccbfbd34889e923e0ee7e80a471c4d9bb1e08fc200a249b99b4c83c877564d413ca0b', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-16 16:44:44', '2023-06-16 16:44:44', '2024-06-16 12:44:44'),
('e41770a80a892d41bedea655bcd57dd4a43fa8a1ac3b7341cc567a65f97cc20fa39b23e0ef00265e', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-12-05 04:22:47', '2023-12-05 04:22:47', '2024-12-04 23:22:47'),
('e47f94f3fa61f06db6b7543afe16c4d0d895f06edbf884cbadca562fdd1caa0ab78ddff3d21d0647', '852d76b7-0396-484b-a1da-81e627069be0', 1, 'User Token', '[]', 0, '2023-11-01 23:18:19', '2023-11-01 23:18:19', '2024-11-01 19:18:19'),
('e4c0092201742492356e81216fe40da0322424ad5715dbf553d6ed48000e86f18b2d1f66f63055ad', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', 1, 'User Token', '[]', 0, '2023-06-24 11:39:21', '2023-06-24 11:39:21', '2024-06-24 07:39:21'),
('e5bcf749fd2ed2cacdc885ae199fdfb551e1c0b6e5de05a7fefda3c56d9695604add4dc9d9b1b170', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-12-08 21:56:54', '2023-12-08 21:56:54', '2024-12-08 16:56:54'),
('e6286f5496ea830aa4e82b0e9ef86c0c1f251596fd89fb0ae1a371f1d1a1fcec8680512159ce9a18', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 1, '2023-11-21 11:11:20', '2023-11-21 11:11:20', '2024-11-21 06:11:20'),
('e73b355ba4f758b1e394a3474a228496c05784a3f3bc774eea4649ead41fc3c084785dadcdb2e66b', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-14 01:44:15', '2023-11-14 01:44:15', '2024-11-13 20:44:15'),
('e7fc360fe8a0fbd39ff42c692df96de4459f51797cf2e15b0206c2b9ddfff0a8e0c73e93c23f239b', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 1, 'User Token', '[]', 0, '2023-08-22 03:30:42', '2023-08-22 03:30:42', '2024-08-21 23:30:42'),
('e85e7b855922a82222eda19053d898c64aea39c29e644e525a904e1745cdc35ef2e6556bb2f7f570', '420215b6-8012-477e-81a1-f6f195def15a', 1, 'User Token', '[]', 0, '2023-10-28 21:57:09', '2023-10-28 21:57:09', '2024-10-28 17:57:09'),
('e885f071e946f875484500fff80c5927a5238da5d145dd85c37ebd1c8ec3558553c9ea282aabe497', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 0, '2023-07-14 22:55:42', '2023-07-14 22:55:42', '2024-07-14 18:55:42'),
('e8c6b8dcb139d77aad889af238d1efca59a7c703a13c2777a99483936381befc2fe681de250d4c01', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-09-21 23:07:52', '2023-09-21 23:07:52', '2024-09-21 19:07:52'),
('eb1f6b761a29ffd22aca2dc5fcedb8b506eb1a43a716cdef816237e6537122a990969be792af23e0', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', 1, 'User Token', '[]', 0, '2023-08-24 03:58:21', '2023-08-24 03:58:21', '2024-08-23 23:58:21'),
('eba0106039860fdf629c6593f0a7fb5e6d7d1f91ff0de4c8e056629b61abd9b5cb9bd9f14a651b7a', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 1, '2023-06-09 23:48:04', '2023-06-09 23:48:04', '2024-06-09 19:48:04'),
('ecc271ae98e08fbfa53ee9639f7e777273a6ce1e4d1cb5674bab292edf049d7b923e7bb8bf391d70', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-11 01:48:30', '2023-08-11 01:48:30', '2024-08-10 21:48:30'),
('ed0e42d52e838dd45306fa7c279d92e3687353c983f68ace370e0c956742ebaa50fac70f9658e5cf', 'a29c133e-7190-4bf5-9f15-8632d1ea4609', 1, 'User Token', '[]', 0, '2023-07-22 17:28:09', '2023-07-22 17:28:09', '2024-07-22 13:28:09'),
('ed12855ece25976d513f3e4949618296033804c0fb53a2ad3f6b3a2c9e8f798f293043381a23f592', 'b746381e-8335-4180-ba01-dee614d88da2', 1, 'User Token', '[]', 1, '2023-08-07 21:32:58', '2023-08-07 21:32:58', '2024-08-07 17:32:58'),
('ed6727c1bf64d7fc19dad43d5ea77f031573a79c073ab96e964ce697f7a3d563aa303d78802d1d4a', 'a48b0478-25ed-403d-bd3f-f4f299b7ec2c', 1, 'User Token', '[]', 0, '2023-07-01 00:44:58', '2023-07-01 00:44:58', '2024-06-30 20:44:58'),
('ee3f664d078e11a1c25a5c5d17ddd7f644bdc33aad50926a42784d1b480902ed12493d821e2edda6', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-09-22 04:01:59', '2023-09-22 04:01:59', '2024-09-22 00:01:59'),
('ee69d735981f52f9216ee67c832643c24db36ab1f6c62818f726b4d7cfd92a1ec1717cf4f7dc963e', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-21 02:10:20', '2023-11-21 02:10:20', '2024-11-20 21:10:20'),
('eebe556de8c32913f4618d6352563f8c1c5a934b8e71debb6c495bae7521c1a43b3bf127a2e55f77', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-20 22:39:17', '2023-11-20 22:39:17', '2024-11-20 17:39:17'),
('eec83bd9107997e232bbfbc546997105aed980298bf77fe3ca286d3080c46ebe1aa7f165a567ea66', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-08-26 18:23:14', '2023-08-26 18:23:14', '2024-08-26 14:23:14'),
('ef417c613738bc8eb6bae8339146e801e677a3ad464ca26c5421a5e233849263ba0677a7553f01c4', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', 1, 'User Token', '[]', 0, '2023-08-20 14:22:52', '2023-08-20 14:22:52', '2024-08-20 10:22:52'),
('ef9827138acff20a56e888e623cf97e0fc96248c60ffb177d054bf4d20695568af99c82e6e11bdd3', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 1, '2023-06-13 02:53:21', '2023-06-13 02:53:21', '2024-06-12 22:53:21'),
('efead55a3be7329af9404cc8ca9e05430b8871fa24ba17b9d233fe5bab0d9f3c07ed1cc743f42056', '4741a263-154a-4f63-b75a-a358c6581398', 1, 'User Token', '[]', 1, '2023-07-20 14:15:06', '2023-07-20 14:15:06', '2024-07-20 10:15:06'),
('efef87c2e876cc44008b1a1294a64316cc349b0ba04e77ea2aff635d9f719df239a0517b3d62a632', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 1, 'User Token', '[]', 0, '2023-06-06 23:18:49', '2023-06-06 23:18:49', '2024-06-06 19:18:49'),
('f15f0eb8281c89d10b393ef238442f094ba0c100364baa2359e85eb29ad3982e75e4bc2bcffec06e', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', 1, 'User Token', '[]', 1, '2023-10-22 00:54:17', '2023-10-22 00:54:17', '2024-10-21 20:54:17'),
('f197f56f37883d1f390df5297f364f11bedca2106fc47c51473255eb9025cd54c4f34e526769304a', '1e8ee0b2-0c15-4add-b63c-471ab713a68b', 1, 'User Token', '[]', 1, '2023-06-24 01:57:54', '2023-06-24 01:57:54', '2024-06-23 21:57:54'),
('f34c5eccce9eb1931ff656986bbbb8209d579a5c89353eead73ecf9639aa6b5f01ca991fe49b0983', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-08-15 00:22:54', '2023-08-15 00:22:54', '2024-08-14 20:22:54'),
('f368556cb1fb6a2239f3abf186ce1fa4a184f319a83f904a5ae3305bdcd61eaca1ade5fb42397401', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-11-26 02:19:48', '2023-11-26 02:19:48', '2024-11-25 21:19:48'),
('f3d38ad7c54f18b9272e4141fc58cadcf3155c1c7d11c5269c8764a7ff1ce16b0c200419cad05d51', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 0, '2023-07-08 11:10:32', '2023-07-08 11:10:32', '2024-07-08 07:10:32'),
('f48f1ecadb1c361ae91a99e3f870f2a985b6020cf3b36496ffd1f590b7396709f8bac427eaf3f57a', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', 1, 'User Token', '[]', 0, '2023-06-24 11:37:17', '2023-06-24 11:37:17', '2024-06-24 07:37:17'),
('f4b47cfd37f0c0cd0f1ebd2ef344f749e0b9e86ded51f4bd2f72bae750f0b93aeee91caf33852db4', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 1, 'User Token', '[]', 1, '2023-08-11 01:50:21', '2023-08-11 01:50:21', '2024-08-10 21:50:21'),
('f574ae378860f911e8da25ffdf4a0e788356690104fd50eb86002dcdd76b3c75b2d4188199b8a935', '852d76b7-0396-484b-a1da-81e627069be0', 1, 'User Token', '[]', 0, '2023-10-30 02:52:23', '2023-10-30 02:52:23', '2024-10-29 22:52:23'),
('f60c4ae276613e8505ce0f3b47622bb5298d7ea73bdb8a8ebb14e12c2e558d98cdfacaba9838208f', '600ae9df-1f17-405b-8a53-187924bb53a9', 1, 'User Token', '[]', 0, '2023-06-24 11:35:34', '2023-06-24 11:35:34', '2024-06-24 07:35:34'),
('f638f4d3672ce8c940cd5717c717dc8f754d2506f8f5a71a59cd92e123be7383fa825dbeeb4860f2', '105b4a16-fe05-4e17-a786-d5a124bcdcf8', 1, 'User Token', '[]', 0, '2023-06-04 22:43:54', '2023-06-04 22:43:54', '2024-06-04 18:43:54'),
('f63d2a0cf6e3292e055060eda58e16e2b5cde4a117a3383ffcd11f67ab99d55c0d7ca274e3405457', '6ff6741e-41af-464d-bf70-56c3fdf362c7', 1, 'User Token', '[]', 0, '2023-09-17 22:22:07', '2023-09-17 22:22:07', '2024-09-17 18:22:07'),
('f77a1edffb218cdede0cb66687974225c0c3ce69c026c1c9ecc64e3fbfc9ccd4ae0374983edbcad9', '8511ab31-ce79-4306-825c-8ff5552f80e4', 1, 'User Token', '[]', 0, '2023-06-22 16:39:45', '2023-06-22 16:39:45', '2024-06-22 12:39:45'),
('f79da0e3c410e9003a56de0c4d3499ba30eb7e728e6feccafa6234ea7929c2c43af8b83ab574b4b2', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 1, 'User Token', '[]', 1, '2023-11-26 02:04:29', '2023-11-26 02:04:29', '2024-11-25 21:04:29'),
('f8e4f3476520d076655a1f49102932086ac985bac6787310e4821c207836560fce8b5529002f80d2', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 1, '2023-11-27 21:06:09', '2023-11-27 21:06:09', '2024-11-27 16:06:09'),
('f910e99caa5b645fd6ee6e0d8999428bdecd659101ab4ba33eb1f695fcf831f8c0768b58022aa21d', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', 1, 'User Token', '[]', 0, '2023-06-16 23:54:19', '2023-06-16 23:54:19', '2024-06-16 19:54:19'),
('f970f218b5f472e20a39961fb45ccffc63f206d5a8357ecbba08e513fdfca3f2256585903c371860', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 1, 'User Token', '[]', 1, '2023-11-10 15:29:25', '2023-11-10 15:29:25', '2024-11-10 10:29:25'),
('fb27105d5b44a979ef73260d0ca96e87c7809e24b156fba4c2b606c360b857e64e5c1e8da7bb3fff', '6bdbe144-56d0-43ae-b50f-e65d88d68787', 1, 'User Token', '[]', 0, '2023-11-02 17:08:26', '2023-11-02 17:08:26', '2024-11-02 13:08:26'),
('fb99535a217adb4d31373da6c72fc27771c1a5b9357db6cfbd5e56ebc95db216c7b7a862d46cd421', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 1, 'User Token', '[]', 0, '2023-11-21 13:29:59', '2023-11-21 13:29:59', '2024-11-21 08:29:59'),
('fbabc1e5ebde4d403978cf0f331b4564a9971722eb33b1dc2668796f943ea8134ba0f9c058834e6e', '1ef1ab55-4f60-45cb-b663-e7310c4ece60', 1, 'User Token', '[]', 0, '2023-07-21 20:00:53', '2023-07-21 20:00:53', '2024-07-21 16:00:53'),
('fc122e8de6eb75e5a841f84ec06b3e14ab322f6917918c3c41c25ceda000ecaba70ad83c4f38a0dd', 'daea3b81-e22c-4109-ac48-137840e8a53e', 1, 'User Token', '[]', 0, '2023-07-15 21:33:14', '2023-07-15 21:33:14', '2024-07-15 17:33:14'),
('fd270477b8979cf0eacb001a2b08c48460e6966fc8fa6ab1d5ae1f3bfa275b779bcfe9f5fcf6f8c2', '852d76b7-0396-484b-a1da-81e627069be0', 1, 'User Token', '[]', 0, '2023-11-01 23:31:14', '2023-11-01 23:31:14', '2024-11-01 19:31:14'),
('fd8991b160274cc38e6b9be03dec69a8a324a24c26a96bfb68f9548dc8b0e6aa45e04f42dc2477e2', '6a527751-31bd-4b21-9392-c00cf807b005', 1, 'User Token', '[]', 0, '2023-10-24 02:07:09', '2023-10-24 02:07:09', '2024-10-23 22:07:09'),
('fdc18d44f89c678353992aca917afe91d1780f1e43a62c2693d49de31cd720352eb29d75db29ac56', '28b1178e-0380-4440-862c-96e27d2ad2d2', 1, 'User Token', '[]', 0, '2023-11-01 23:14:21', '2023-11-01 23:14:21', '2024-11-01 19:14:21'),
('fddbea622a5e21c58e3b17c932e4cc3500aba44d24454badcdd6505cf1e2005572725eac80e0eedb', '09ef3f34-5e3d-45c9-8e49-032dd2798e3f', 1, 'User Token', '[]', 0, '2023-07-30 13:33:10', '2023-07-30 13:33:10', '2024-07-30 09:33:10'),
('ff16744ac9496ae2438eba8874c1275b5f40ec55aeacbcd59cca360d6192360bfb961859f42f2468', 'f7dce302-652b-4950-b225-e80c69236f80', 1, 'User Token', '[]', 1, '2023-07-24 16:43:40', '2023-07-24 16:43:40', '2024-07-24 12:43:40'),
('ff933a88eb01e24b507736a22b2d5b26e3c26523083d09de751e4cdbc60ea1f94dd5afdfd03d493b', 'da1a5e0f-b4fb-44b4-8fd8-8334f1c4d625', 1, 'User Token', '[]', 1, '2023-12-14 02:23:06', '2023-12-14 02:23:06', '2024-12-13 21:23:06'),
('ffc058397ef0a9181f52acd270772cda135a8033e78327a1662bfb2d722fcf433857519dd593f244', '6237ba45-cd42-4709-bc32-7184efcdb949', 1, 'User Token', '[]', 0, '2023-06-14 11:42:32', '2023-06-14 11:42:32', '2024-06-14 07:42:32');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` char(36) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'popeye Personal Access Client', 'r3tZIpNwOmNJpZlrucHyhNWkjZg3DKYdYI2SN3vi', NULL, 'http://localhost', 1, 0, 0, '2023-06-04 13:51:32', '2023-06-04 13:51:32'),
(2, NULL, 'popeye Password Grant Client', 'GUP6ynUoZdpbq3KFRjutnSveZeoqYwKEAtO7uHC3', 'users', 'http://localhost', 0, 1, 0, '2023-06-04 13:51:32', '2023-06-04 13:51:32');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-06-04 13:51:32', '2023-06-04 13:51:32');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `orders`
--

CREATE TABLE `orders` (
  `id` char(36) NOT NULL,
  `total` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `total_before_fees` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `invoice_id` varchar(191) DEFAULT NULL,
  `promo_code` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `full_name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `shipping_fee` varchar(191) NOT NULL DEFAULT '0',
  `commission_percentage` varchar(191) DEFAULT NULL,
  `tax_fee` varchar(191) NOT NULL DEFAULT '0',
  `block_number` varchar(191) DEFAULT NULL,
  `floor_number` varchar(191) DEFAULT NULL,
  `flat_number` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `area` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country_id` char(36) DEFAULT NULL,
  `data_country_id` char(36) DEFAULT NULL,
  `city_id` char(36) DEFAULT NULL,
  `accept_time` timestamp NULL DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `in_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `is_delivered` tinyint(1) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `marked_as_deleted_for_customer` tinyint(1) NOT NULL DEFAULT 0,
  `marked_as_deleted_for_provider` tinyint(1) NOT NULL DEFAULT 0,
  `marked_as_deleted_for_driver` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` char(36) DEFAULT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `provider_id` char(36) DEFAULT NULL,
  `address_id` char(36) DEFAULT NULL,
  `platform` enum('web','android','ios') DEFAULT NULL,
  `payment_method` enum('cash','visa') DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `refund_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `orders`
--

INSERT INTO `orders` (`id`, `total`, `total_before_fees`, `invoice_id`, `promo_code`, `date`, `time`, `comment`, `full_name`, `phone`, `email`, `postal_code`, `shipping_fee`, `commission_percentage`, `tax_fee`, `block_number`, `floor_number`, `flat_number`, `address`, `country`, `area`, `longitude`, `latitude`, `city`, `country_id`, `data_country_id`, `city_id`, `accept_time`, `is_paid`, `is_cancelled`, `is_approved`, `in_shipping`, `is_delivered`, `is_accepted`, `marked_as_deleted_for_customer`, `marked_as_deleted_for_provider`, `marked_as_deleted_for_driver`, `customer_id`, `driver_id`, `provider_id`, `address_id`, `platform`, `payment_method`, `payment_id`, `refund_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('0170d0cb-cf11-40ae-a75e-bd56c0421827', 36.00, 36.00, 'INV-1b7b773', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-20 22:25:21', '2023-11-28 01:03:34', NULL),
('018205f3-93b8-4d8d-abce-916375e60cfb', 72.00, 72.00, 'INV-ea527cd', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-26 15:22:34', '2023-11-28 01:03:31', NULL),
('02086be3-6f82-433e-a069-b577d8f63e36', 50.00, 50.00, 'INV-1777c30', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-21 13:35:43', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('052ad607-a446-44db-a49d-ae7f3bbdbf65', 36.00, 36.00, 'INV-89290f0', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'f63ba367-6a3c-486b-8181-5e474c6a6369', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-09-05 02:38:13', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('055a70f3-f761-4777-99e6-3cc1e5d9ead9', 300.00, 300.00, 'INV-03cfe49', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 21:22:44', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('069f7174-8996-4a37-a9f9-0e7aeeadd294', 1098.00, 1098.00, 'INV-7978a22', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 21:21:33', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('08048cb2-8808-4e6c-a8f5-66f8f4af932a', 50.00, 50.00, 'INV-327c0eb', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-08 02:26:02', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('08805a4f-a132-4d4e-8073-aa02d1f254b6', 20.00, 20.00, 'INV-fa60446', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-22 18:04:13', '2023-09-22 04:32:30', NULL),
('08dd24e5-f3b1-4b62-8787-3123f035996e', 50.00, 50.00, 'INV-06fbd92', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-07 21:43:14', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('08fc5d19-7234-40bd-90f5-15fe402d0f7f', 33.00, 33.00, 'INV-62a7382', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 03:35:42', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('0c4c09bf-77ed-4c75-a61c-5a55895a3889', 18.00, 18.00, 'INV-4098e47', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-27 18:23:15', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('0dbd56c3-f6fd-42d2-8967-68ea0e476203', 100.00, 100.00, 'INV-530a3ac', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-21 13:30:35', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('10b7e92c-fb1d-444b-8f88-912cd76ad0b1', 20.00, 20.00, 'INV-e596ae3', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1205082038', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, 'Amar ebn yaser ,cairo ,egypt', NULL, 'Heliopolies', '2.2222', '3.1111', 'cairo', NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '105b4a16-fe05-4e17-a786-d5a124bcdcf8', NULL, 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 'ce1d5200-ce15-44bd-816d-d5cd9bcc7308', NULL, 'cash', NULL, NULL, '2023-06-05 03:42:22', '2023-06-16 16:41:49', '2023-06-16 16:41:49'),
('113fb6ca-909f-4810-81d7-deaa70797630', 2562.00, 2562.00, 'INV-b57923a', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 00:52:22', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('125ea0f9-5fd7-466a-b3b6-07e2e3c1fac3', 36.00, 36.00, 'INV-7647d15', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'f7028d8c-5005-4bfa-a1ac-09a181de148e', NULL, 'cash', NULL, NULL, '2023-07-15 05:34:22', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('19320fe5-ceb3-40a0-858b-9c54a13177d2', 40.00, 40.00, 'INV-844b509', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.12295101583', '23.637432678503', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '76b2bf89-3e8b-452a-ac9e-67e9cdc9735b', NULL, 'cash', NULL, NULL, '2023-12-14 02:51:19', '2023-12-14 02:51:19', NULL),
('19ed2cf9-4c37-48c0-898d-743bce7a2e46', 36.00, 36.00, 'INV-6c37e58', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'مسقط, عمان', NULL, 'مسقط', '58.382987827063', '23.58317072138', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '765799f3-6f69-4152-a11a-09d55012cf02', NULL, '329b6a7b-c11a-4533-941a-7747b2615d9b', '23716b95-613b-4993-be55-c6fad98d388f', NULL, 'cash', NULL, NULL, '2023-07-25 01:40:38', '2023-07-25 01:44:52', '2023-07-25 01:44:52'),
('1d39686e-1739-436c-8b57-3135d5ee2121', 120.00, 120.00, 'INV-d88723b', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1205082038', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, 'Amar ebn yaser ,cairo ,egypt', NULL, 'Heliopolies', '2.2222', '3.1111', 'cairo', NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '105b4a16-fe05-4e17-a786-d5a124bcdcf8', NULL, 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 'ce1d5200-ce15-44bd-816d-d5cd9bcc7308', NULL, 'cash', NULL, NULL, '2023-06-09 22:43:41', '2023-06-16 16:41:49', '2023-06-16 16:41:49'),
('1e1bdcc2-791e-4bf7-9e1c-70a7e864c728', 72.00, 72.00, 'INV-3216d6a', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:50:02', '2023-12-14 02:50:02', NULL),
('1e782c87-7f62-4634-9a19-b370d5011bf2', 138.00, 138.00, 'INV-9c94df2', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.78', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-14 06:26:51', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('21e8b824-5c07-4555-9bbe-b6a8673f096f', 33.00, 33.00, 'INV-0b3f5b5', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-22 17:44:00', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('25bfe287-1a90-4666-b2e8-323f62daa653', 72.00, 72.00, 'INV-a57a37b', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'مسقط, عمان', NULL, 'مسقط', '58.382987827063', '23.58317072138', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '765799f3-6f69-4152-a11a-09d55012cf02', NULL, '329b6a7b-c11a-4533-941a-7747b2615d9b', '23716b95-613b-4993-be55-c6fad98d388f', NULL, 'cash', NULL, NULL, '2023-07-25 01:35:59', '2023-07-25 01:44:52', '2023-07-25 01:44:52'),
('27aa92d7-671d-4e20-97e2-135d6cbb46a3', 150.00, 150.00, 'INV-167e6fd', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 02:45:06', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('27daf66d-c799-4da9-b018-5f6a4c085483', 50.00, 50.00, 'INV-ed2e178', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-08-07 06:31:55', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('281f2541-4f6e-461f-a410-36e849d49435', 40.00, 40.00, 'INV-c37d71c', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:49:24', '2023-12-14 02:49:24', NULL),
('28ec548e-ba76-42de-888c-a785ea78a146', 36.00, 36.00, 'INV-05220a8', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-07-25 02:09:53', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('2926278f-3a9b-4c14-bcc0-5abb7396d95c', 33.00, 33.00, 'INV-6c4d119', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-17 14:00:06', '2023-09-22 04:32:32', NULL),
('2d374451-3df3-4194-bdb0-c095a5af11d3', 64.00, 64.00, 'INV-6f09bfc', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:13:12', '2023-12-14 02:13:12', NULL),
('2d7b8114-5496-469e-893a-e97a10cc5b45', 99.00, 99.00, 'INV-11c26b6', NULL, NULL, NULL, NULL, 'Popeyedelivery Services', '77444721', 'popeyedeliveryservices@gmail.com', NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.144595772028', '23.647110823105', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', NULL, '28b1178e-0380-4440-862c-96e27d2ad2d2', '4b178b9c-8239-40dd-98cd-2171b8f90d4b', NULL, 'cash', NULL, NULL, '2023-11-01 23:34:53', '2023-11-02 16:49:17', '2023-11-02 16:49:17'),
('2f770e45-9549-4b0c-a8a3-691ac0b5cce8', 36.00, 36.00, 'INV-504f7a5', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-07 05:06:04', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('31396bf8-8edd-47be-b0d3-1d2af4ff630e', 20.00, 20.00, 'INV-9046711', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:45:37', '2023-12-14 02:45:37', NULL),
('31ce363f-6aaf-41bd-ab37-67b9e1f75343', 1464.00, 1464.00, 'INV-929a97d', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 17:22:42', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('32eaca7f-95b1-4909-8791-f9e2a4eeb3d9', 36.00, 36.00, 'INV-0edfa5e', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-27 18:17:48', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('33d4fdf7-a6db-4edc-96da-1b8fbaa15b90', 36.00, 36.00, 'INV-0b95aa9', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '10', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-07-28 03:32:17', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('33f90a79-8e58-4c49-b93b-86ad1813b075', 36.00, 36.00, 'INV-8bf9e2e', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-22 17:33:48', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('349880c7-23f0-483f-9d83-7bd378784f2c', 20.00, 20.00, 'INV-e4556cc', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-14 00:11:31', '2023-07-22 15:49:07', NULL),
('355c29ea-d549-4baa-af43-f758e914fd1f', 160.00, 160.00, 'INV-8375b15', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:15:13', '2023-12-14 02:15:13', NULL),
('35d9e242-6e09-4cba-b851-8cec8f3650be', 86.00, 86.00, 'INV-d2d620e', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, ', هجيرمات, عمان', NULL, 'هجيرمات', '56.725838631392', '23.422925686234', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '918d096a-cf16-4ba7-9974-96f29035322c', NULL, 'cash', NULL, NULL, '2023-08-08 01:30:54', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('372121c2-6739-474b-8f23-9530438ade28', 1098.00, 1098.00, 'INV-a731e50', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', 'f37f0fce-f5f3-4e1c-9995-bfae4d3521fc', NULL, 'cash', NULL, NULL, '2023-07-11 14:32:14', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('375f3156-547f-430e-814c-e6018de96fe6', 36.00, 36.00, 'INV-62cb3f4', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-26 15:21:12', '2023-11-28 01:03:32', NULL),
('37f484e3-effb-469a-921d-050f91badcbe', 18.00, 18.00, 'INV-f840575', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-24 20:35:19', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('38d26890-9153-4ee9-be97-752b39e55351', 114.00, 114.00, 'INV-f70ffcf', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-15 01:52:05', '2023-11-15 16:56:54', NULL),
('3911067b-da6c-4982-a385-2c96ce4a6ea1', 33.00, 33.00, 'INV-0f5b1b2', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 03:04:26', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('3963a708-7aa6-4b9e-ac66-f819abc0ee53', 50.00, 50.00, 'INV-22c067f', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-08 01:45:12', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('3a78ec03-35cb-4b14-b4b8-25b8bc737528', 36.00, 36.00, 'INV-eba0b1d', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-25 02:02:33', 0, 0, 1, 1, 0, 1, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', '6af62f61-559e-4838-9c4c-706060c46bbb', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-07-25 02:01:56', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('3a9eb6aa-2142-46c7-b32b-91276feb8eb8', 36.00, 36.00, 'INV-d9c7212', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'مسقط, عمان', NULL, 'مسقط', '58.382987827063', '23.58317072138', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '765799f3-6f69-4152-a11a-09d55012cf02', NULL, '329b6a7b-c11a-4533-941a-7747b2615d9b', '23716b95-613b-4993-be55-c6fad98d388f', NULL, 'cash', NULL, NULL, '2023-07-25 01:38:27', '2023-07-25 01:44:52', '2023-07-25 01:44:52'),
('3aa9e20b-2705-4ccd-89fa-89e6d9e12650', 54.00, 54.00, 'INV-a5f352d', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-24 20:33:52', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('3ca46586-183b-4453-83fc-77a47bbf1c92', 36.00, 36.00, 'INV-2cdec8c', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, 'f63ba367-6a3c-486b-8181-5e474c6a6369', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-09-22 04:32:51', '2023-09-22 04:32:51', NULL),
('3e311070-f76d-4ea1-bdd5-ffd085b46d28', 36.00, 36.00, 'INV-d790c61', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 02:55:05', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('3ee92fb0-0249-4140-97d4-0162621061c0', 150.00, 150.00, 'INV-d0a93c1', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-09-05 02:34:03', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('3fd85eaa-9635-4678-8752-4a6549d01d25', 1830.00, 1830.00, 'INV-44cf5f6', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 14:31:31', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('40500b50-7c83-4f1d-858f-270decd2f9ef', 50.00, 50.00, 'INV-90e3279', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 17:02:24', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '476ff7ad-7d9d-4207-a02d-6d35f375730b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 16:57:34', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('410e2669-63fb-4e33-b91f-c93603432e2f', 35.00, 35.00, 'INV-7aace18', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-15 02:48:27', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('415c5823-5620-4917-9d32-5097e259dfa9', 50.00, 50.00, 'INV-6fda6fa', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 02:48:21', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('43b65d89-f9e6-48de-8bd2-cbab7adb55a2', 36.00, 36.00, 'INV-bfcb097', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-21 04:10:09', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('44ccd6cc-bbb3-41a0-a42f-db7e1fae445c', 81.00, 81.00, 'INV-5e0c777', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-03 23:21:21', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-03 23:18:57', '2023-11-04 00:26:13', NULL),
('4505031b-5094-4a68-93da-40daf514d915', 650.00, 650.00, 'INV-9ffab1e', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-23 16:05:59', 0, 1, 0, 0, 0, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '476ff7ad-7d9d-4207-a02d-6d35f375730b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-23 16:05:29', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('45ce715f-c51c-4505-9849-fc1fae22f7f8', 432.00, 432.00, 'INV-e7bc114', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-21 02:20:30', '2023-11-28 01:03:32', NULL),
('474514b9-76c0-4d3f-a7e3-fe252bbb05b8', 66.00, 66.00, 'INV-e276ae5', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-15 23:15:15', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('47fc4048-3d4c-44ab-bf9c-f9e83ff77fff', 60.00, 60.00, 'INV-c5231a5', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '30', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-24 14:55:41', '2023-07-24 16:48:02', NULL),
('48a34035-dcbe-4e5b-9f29-853e15b9f1a2', 50.00, 50.00, 'INV-28cdef9', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 04:05:50', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 04:05:12', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('4995078b-8c0d-4f05-8493-53b4961104b0', 7686.00, 7686.00, 'INV-8cc307f', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-08 22:08:52', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('4a60e4b3-7da1-441e-991b-969696650fdb', 35.00, 35.00, 'INV-e4091c8', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-20 15:06:58', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('4aaa49a2-baea-4943-a577-2b92fedb7a7d', 50.00, 50.00, 'INV-1d3fff5', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, ', هجيرمات, عمان', NULL, 'هجيرمات', '56.730093620718', '23.413167657471', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '27ab6afb-6176-449c-80ac-d2dfe37a7ab8', NULL, 'cash', NULL, NULL, '2023-08-08 20:10:02', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('4cdc59e3-ddf6-4219-8695-1246f1975de3', 123.00, 123.00, 'INV-26093fa', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-13 21:28:55', 0, 0, 1, 1, 0, 1, 1, 0, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '288a98f5-e5c1-4983-96e7-a71838903b86', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-13 21:28:39', '2023-12-14 02:08:20', NULL),
('4ebce9f9-2721-46ba-9776-1e771aec87e2', 36.00, 36.00, 'INV-b054fef', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-22 16:59:44', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('525ae5a7-2543-488e-bee1-a4d2c735f28e', 50.00, 50.00, 'INV-5fb1ff3', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 17:01:07', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('55615f33-ea9f-4f1d-8f0b-529e613d8bd7', 18.00, 18.00, 'INV-1e23c27', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.78', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-15 23:54:58', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('556c1b2a-0e45-4dff-b3d8-6d56573f78f3', 36.00, 36.00, 'INV-59d1a32', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 03:26:10', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('5621ec74-5dba-4d46-a26c-447e4bb9ace6', 92.00, 92.00, 'INV-dce4cf6', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-13 21:25:57', 0, 0, 1, 1, 0, 1, 0, 0, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-13 21:25:24', '2023-12-14 02:08:38', NULL),
('565db297-5c25-4228-a1ba-254ecc73b916', 732.00, 732.00, 'INV-0247cef', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-12 14:50:45', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('58ba6e8a-db9d-473d-b235-22d90d4b7a1f', 1464.00, 1464.00, 'INV-72a956a', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 15:40:50', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('58d8452a-8d8f-4a4c-8ab6-137c1b38c093', 26.00, 26.00, 'INV-259c41b', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:47:26', '2023-12-14 02:50:26', NULL),
('591c91ac-5ee7-4a16-80d1-241a76455a28', 20.00, 20.00, 'INV-876b7e9', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-22 17:56:11', '2023-09-22 04:32:31', NULL),
('59893d46-2fc4-40f8-a3b1-1865767b6ee6', 108.00, 108.00, 'INV-74eabe8', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-14 01:48:13', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-10 15:29:45', '2023-11-14 01:48:44', NULL),
('5ab8193c-a58d-4bf8-9ee2-3b798fde48b7', 30.00, 30.00, 'INV-3f1f8d6', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:42:02', '2023-12-14 02:42:02', NULL),
('5b11b9a9-922b-471a-b4a0-1b3fed4b1057', 32.00, 32.00, 'INV-54b19c0', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-21 04:14:17', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('5e29099a-4787-4273-bd80-6dd99dcbd076', 36.00, 36.00, 'INV-d4f48e1', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '20', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-24 18:10:39', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('6003e427-ee5e-401e-82a4-fd73e2f0b49f', 30.00, 30.00, 'INV-be13819', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.12295101583', '23.637432678503', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '76b2bf89-3e8b-452a-ac9e-67e9cdc9735b', NULL, 'cash', NULL, NULL, '2023-12-14 02:30:19', '2023-12-14 02:30:19', NULL),
('60b656b1-b013-4dbe-a9f1-1e8de2cfa2c8', 78.00, 78.00, 'INV-85841e8', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.78', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-14 23:39:28', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('62807d93-b7b7-4781-bb5a-0b38c717eae8', 99.00, 99.00, 'INV-7643e00', NULL, NULL, NULL, NULL, 'Popeyedelivery Services', '77444721', 'popeyedeliveryservices@gmail.com', NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.144595772028', '23.647110823105', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', NULL, '28b1178e-0380-4440-862c-96e27d2ad2d2', '4b178b9c-8239-40dd-98cd-2171b8f90d4b', NULL, 'cash', NULL, NULL, '2023-11-01 23:25:47', '2023-11-02 16:49:17', '2023-11-02 16:49:17'),
('63351183-b2ab-4808-bcbd-9658519d8ffa', 50.00, 50.00, 'INV-22316cd', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-21 13:40:40', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('64504ba6-266d-4bfd-b703-96e359da977d', 20.00, 20.00, 'INV-b5325e7', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-14 00:01:01', '2023-07-14 00:10:07', NULL),
('67498ee6-21e4-4431-8f87-22ac9ccad069', 33.00, 33.00, 'INV-4b82e29', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'f7028d8c-5005-4bfa-a1ac-09a181de148e', NULL, 'cash', NULL, NULL, '2023-07-22 17:09:03', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('6a691507-ee69-4c2f-8d0e-b0179eff8d73', 291.00, 291.00, 'INV-ee99849', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-19 01:50:08', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-19 01:49:33', '2023-11-20 17:03:52', NULL),
('6b40854a-f919-4d7a-b3d2-245137214686', 1830.00, 1830.00, 'INV-f9bc164', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 00:51:33', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('6cc3f8eb-1913-4dfe-a752-0cb8456aea88', 36.00, 36.00, 'INV-b2a62b2', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-10-27 18:31:31', 0, 0, 1, 1, 1, 1, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', 'ff4f1965-7068-4d8c-a7e4-b448830ccaed', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-27 18:31:07', '2023-10-30 02:30:57', '2023-10-30 02:30:57');
INSERT INTO `orders` (`id`, `total`, `total_before_fees`, `invoice_id`, `promo_code`, `date`, `time`, `comment`, `full_name`, `phone`, `email`, `postal_code`, `shipping_fee`, `commission_percentage`, `tax_fee`, `block_number`, `floor_number`, `flat_number`, `address`, `country`, `area`, `longitude`, `latitude`, `city`, `country_id`, `data_country_id`, `city_id`, `accept_time`, `is_paid`, `is_cancelled`, `is_approved`, `in_shipping`, `is_delivered`, `is_accepted`, `marked_as_deleted_for_customer`, `marked_as_deleted_for_provider`, `marked_as_deleted_for_driver`, `customer_id`, `driver_id`, `provider_id`, `address_id`, `platform`, `payment_method`, `payment_id`, `refund_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('6d100686-085b-44ea-b330-5dc5513b1225', 70.00, 70.00, 'INV-e921038', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-20 14:28:56', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-20 14:27:56', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('6d51d906-1ec7-448d-8263-9ea8b5e12bbb', 36.00, 36.00, 'INV-ac26889', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'f7028d8c-5005-4bfa-a1ac-09a181de148e', NULL, 'cash', NULL, NULL, '2023-07-22 17:05:19', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('6eab7b35-bd10-45c4-96bf-de45b852c519', 52.00, 52.00, 'INV-d6055f0', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:28:30', '2023-12-14 02:28:30', NULL),
('716fe201-5724-4a59-9cdc-9df3e403660b', 32.00, 32.00, 'INV-053947e', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-17 14:01:15', '2023-07-21 04:04:48', NULL),
('71b087c3-4fc6-44f2-8539-fb9269f692c0', 108.00, 108.00, 'INV-a5db2ef', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-26 15:25:10', '2023-11-28 01:03:34', NULL),
('73896f13-fee7-4f6f-b50e-20571f7235b3', 52.00, 52.00, 'INV-df51de1', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.12295101583', '23.637432678503', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '76b2bf89-3e8b-452a-ac9e-67e9cdc9735b', NULL, 'cash', NULL, NULL, '2023-12-14 02:36:32', '2023-12-14 02:36:32', NULL),
('77345082-f275-47e8-a5be-a43e481084e0', 36.00, 36.00, 'INV-40a5d84', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '1.6', '0', '0', NULL, NULL, NULL, 'هجيرمات, عمان', NULL, 'Hujayrimat', '56.730022877455', '23.406190119501', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-09-07 02:47:27', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '8cc771ad-f0b0-4bc9-8e48-965f57d3e909', NULL, 'cash', NULL, NULL, '2023-09-07 02:46:29', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('780f79bd-2419-4f03-908a-ae9864cddc21', 1098.00, 1098.00, 'INV-ed861a4', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-10 20:21:47', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('7826dc2a-9734-4c4d-b14f-00673998af24', 36.00, 36.00, 'INV-4e030e4', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-10 15:34:00', '2023-11-25 15:08:44', NULL),
('786546be-a47f-45b5-a5c6-ff7298e2f1ba', 36.00, 36.00, 'INV-9472f10', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-22 17:34:36', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('78dcf1d1-3b3e-4528-8081-a727d3c85bf1', 36.00, 36.00, 'INV-4f4bc8f', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-20 22:41:01', 0, 0, 1, 0, 0, 1, 1, 1, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-20 22:32:30', '2023-11-26 15:31:13', NULL),
('7af2ac1d-eec3-4022-af01-243f23b2165c', 186.00, 186.00, 'INV-650b8c2', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-15 15:20:26', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-15 15:19:40', '2023-11-15 16:48:10', NULL),
('7b272c3a-7b51-4154-b6d5-0fb6836669b4', 70.00, 70.00, 'INV-e1a66c6', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:18:36', '2023-12-14 02:18:36', NULL),
('7bc4ef43-3415-46df-8e46-62c61f22bba1', 50.00, 50.00, 'INV-c744364', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 14:47:16', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 14:46:53', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('7c13580c-6967-4f66-aebc-fa61f5c25d17', 1464.00, 1464.00, 'INV-fdb36a2', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', 'f37f0fce-f5f3-4e1c-9995-bfae4d3521fc', NULL, 'cash', NULL, NULL, '2023-07-07 16:13:38', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('7ceb1b85-2b15-4af5-a1f5-48584fcee416', 35.00, 35.00, 'INV-c2371c0', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 02:59:37', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('7dad48e8-055e-4a2c-9f6c-489fc2fd4c1b', 18.00, 18.00, 'INV-8ace105', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-10-28 22:00:18', 0, 0, 1, 1, 1, 1, 0, 1, 0, '420215b6-8012-477e-81a1-f6f195def15a', 'f7dce302-652b-4950-b225-e80c69236f80', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-22 01:17:14', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('7f39a83b-5794-49e0-878d-6fe2678fb87b', 50.00, 50.00, 'INV-eba8667', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-21 13:37:34', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('7fbf7254-2551-4e27-8084-2974097684b1', 36.00, 36.00, 'INV-c584f2a', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-04 02:00:49', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-04 01:59:57', '2023-11-14 01:47:10', NULL),
('8163aee3-c221-457a-be61-f403c54e340b', 50.00, 50.00, 'INV-ad3faf9', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 14:44:49', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('83cbbf35-c713-4b09-a399-6b7c557b4d44', 400.00, 400.00, 'INV-2267b73', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 21:26:48', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '476ff7ad-7d9d-4207-a02d-6d35f375730b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 21:25:37', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('85d41f87-4b2e-4cf3-b675-bc49e8dca33b', 18.00, 18.00, 'INV-5e7069c', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 1, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-24 20:36:47', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('8618c39b-a317-4647-819e-bd0ec3350453', 18.00, 18.00, 'INV-a77efaf', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.78', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-15 23:59:35', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('863f4f05-7ba7-49f4-a3fd-dbea2d5a6470', 36.00, 36.00, 'INV-9e98b99', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-09 01:47:08', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('88474466-c1d8-495c-b993-26302cdcc864', 36.00, 36.00, 'INV-7154c4c', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-08-11 01:50:44', '2023-09-22 04:32:20', NULL),
('8854e3f8-be05-4c3a-8fca-b88b74d847f7', 36.00, 36.00, 'INV-d41d386', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', مسقط, عمان', NULL, 'مسقط', '58.494195230305', '23.612092152853', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '765799f3-6f69-4152-a11a-09d55012cf02', NULL, '329b6a7b-c11a-4533-941a-7747b2615d9b', '0d816ff9-0f39-4d91-9c65-5e929fff0fbb', NULL, 'cash', NULL, NULL, '2023-07-25 01:43:40', '2023-07-25 01:44:52', '2023-07-25 01:44:52'),
('88e33f2a-44c3-4966-955c-3cc7c1ce8b9d', 18.00, 18.00, 'INV-6a090f1', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 1, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-24 20:37:58', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('89c72b26-c1e0-4245-a7f5-0849977fca18', 50.00, 50.00, 'INV-5ed93ba', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-08 02:27:25', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('89dc2f51-91c3-453d-9827-3043a9f2d221', 32.00, 32.00, 'INV-e2308b0', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-15 23:17:31', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('8cd4bb11-e47b-4655-affa-217702aabd53', 3500.00, 3500.00, 'INV-af73202', NULL, NULL, NULL, NULL, 'مايكل سامح', '1205082038', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', قسم أول 6 أكتوبر, الجيزة , مصر', NULL, 'قسم أول 6 أكتوبر', '30.920255', '29.965939', 'الجيزة', NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1e8ee0b2-0c15-4add-b63c-471ab713a68b', NULL, 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 'aff84e3f-06bc-4f60-a4e6-c22ccd3b9f66', NULL, 'cash', NULL, NULL, '2023-06-16 16:45:22', '2023-06-24 16:59:15', '2023-06-24 16:59:15'),
('8d5ddeac-e2fd-4744-8736-be3eed190441', 50.00, 50.00, 'INV-4e26078', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, ', هجيرمات, عمان', NULL, 'هجيرمات', '56.730093620718', '23.413167657471', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '27ab6afb-6176-449c-80ac-d2dfe37a7ab8', NULL, 'cash', NULL, NULL, '2023-08-08 01:47:06', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('8e2db63f-83c3-43be-8e25-6d3a9190a6ed', 18.00, 18.00, 'INV-784db29', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-22 00:46:24', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('8fc76380-2ef9-4f4b-aad5-79d2497a5aac', 108.00, 108.00, 'INV-f3e60a2', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'مسقط, عمان', NULL, 'مسقط', '58.382987827063', '23.58317072138', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '765799f3-6f69-4152-a11a-09d55012cf02', NULL, '329b6a7b-c11a-4533-941a-7747b2615d9b', '23716b95-613b-4993-be55-c6fad98d388f', NULL, 'cash', NULL, NULL, '2023-07-25 01:32:56', '2023-07-25 01:44:52', '2023-07-25 01:44:52'),
('8fe0a91d-95b2-482d-b20b-0bb190555c67', 99.00, 99.00, 'INV-50a257d', NULL, NULL, NULL, NULL, 'Popeyedelivery Services', '77444721', 'popeyedeliveryservices@gmail.com', NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.144595772028', '23.647110823105', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', NULL, '28b1178e-0380-4440-862c-96e27d2ad2d2', '4b178b9c-8239-40dd-98cd-2171b8f90d4b', NULL, 'cash', NULL, NULL, '2023-11-01 23:33:49', '2023-11-02 16:49:17', '2023-11-02 16:49:17'),
('912332c6-18d7-470a-ad16-e5be8d7c45cc', 1098.00, 1098.00, 'INV-243cd38', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-11 14:48:08', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('926ec7ed-a9b6-4c19-88e0-10100090174e', 50.00, 50.00, 'INV-42ccb23', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 03:32:49', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 03:31:47', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('92af38c0-cb3e-427c-956f-58e345eb9d09', 36.00, 36.00, 'INV-54a4fae', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '20', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-24 18:02:01', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('92debff2-236b-432d-bd93-94a7d14c5a15', 18.00, 18.00, 'INV-403c178', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-27 18:14:32', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('942264a7-3c0c-4b0f-89b8-af9da18b7bad', 144.00, 144.00, 'INV-487d9d4', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, ', هجيرمات, عمان', NULL, 'هجيرمات', '56.725838631392', '23.422925686234', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '918d096a-cf16-4ba7-9974-96f29035322c', NULL, 'cash', NULL, NULL, '2023-08-07 21:47:09', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('94e5609a-c06c-422e-aceb-d9854e6fe6ec', 1200.00, 1200.00, 'INV-76b3b51', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1205082038', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', First 6th of October, Giza Governorate , Egypt', NULL, 'First 6th of October', '30.9201267', '29.9659233', 'Giza Governorate', NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-14 04:47:34', 0, 1, 1, 1, 1, 1, 0, 0, 0, '105b4a16-fe05-4e17-a786-d5a124bcdcf8', '2ea627af-3622-407d-9d0d-366e8ecc8285', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', 'e2291a33-c64b-49e9-85ce-9f3471221e26', NULL, 'cash', NULL, NULL, '2023-06-14 03:08:10', '2023-06-16 16:41:49', '2023-06-16 16:41:49'),
('9565daa6-2285-4d25-943d-35083e1b7db8', 477.00, 477.00, 'INV-11376cd', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-26 15:15:50', '2023-11-26 15:18:19', NULL),
('9c8cf34c-a95b-4b08-8b5c-0f0198271656', 32.00, 32.00, 'INV-414902c', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 03:17:10', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('9d1a9936-657b-425d-b5d2-dd76b422ad80', 35.00, 35.00, 'INV-b4f58f6', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-20 14:40:16', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('9dea2bbb-3004-40b6-92d2-d11fce843558', 15.00, 15.00, 'INV-b1fcb1c', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:52:33', '2023-12-14 02:52:33', NULL),
('9e0e272f-3a55-4462-96a4-d33ed1ebf2a3', 18.00, 18.00, 'INV-f6fb475', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.78', '0', '0', NULL, NULL, NULL, 'كهنات, عمان', NULL, 'Kahanat', '56.765218488872', '23.538330260929', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '420215b6-8012-477e-81a1-f6f195def15a', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '98fbcd03-4218-475d-afbc-dbd0494e3d9d', NULL, 'cash', NULL, NULL, '2023-10-15 05:02:17', '2023-10-30 02:30:57', '2023-10-30 02:30:57'),
('9e988203-b661-40ed-bfad-c25d17d53625', 732.00, 732.00, 'INV-2dc7ab3', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-07 21:32:34', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('9f4a8e1d-90bd-4de0-a8f1-aa2ccd283a0a', 36.00, 36.00, 'INV-bd2a9d0', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, 'مسقط, عمان', NULL, 'مسقط', '58.382987827063', '23.58317072138', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-25 01:28:15', 0, 0, 1, 1, 0, 1, 0, 0, 0, '765799f3-6f69-4152-a11a-09d55012cf02', '50a3827b-db2f-4edf-bb48-0779dbf29410', '329b6a7b-c11a-4533-941a-7747b2615d9b', '23716b95-613b-4993-be55-c6fad98d388f', NULL, 'cash', NULL, NULL, '2023-07-25 01:27:22', '2023-07-25 01:44:52', '2023-07-25 01:44:52'),
('a1437909-6fe4-4c7e-8863-902ded68f84b', 36.00, 36.00, 'INV-c874fce', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-21 09:01:33', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('a16180b8-4215-468c-bef3-f3fcf9e9ff8d', 50.00, 50.00, 'INV-cb71909', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 16:47:21', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('a1ff1560-8661-4d56-ae96-b6ce999b7a0a', 32.00, 32.00, 'INV-ee4f69e', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 03:13:01', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('a2397ce2-758e-47e1-a94f-f66c36afa66c', 35.00, 35.00, 'INV-7409371', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-17 14:00:33', '2023-09-22 04:32:24', NULL),
('a36d592e-3c77-4985-ba26-6e1d68fc5f2c', 288.00, 288.00, 'INV-04461b7', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'f63ba367-6a3c-486b-8181-5e474c6a6369', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-09-05 02:43:16', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('a3eb5241-3b5e-46be-a837-ad3574d51967', 100.00, 100.00, 'INV-e5a8be7', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-21 13:42:07', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('a6911e1d-caeb-4ea9-a9ea-4d4fc84aee46', 35.00, 35.00, 'INV-5faf728', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-15 05:36:39', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('a7b6ceda-e829-4e67-b731-ccf3119bc47e', 42.00, 42.00, 'INV-40803a0', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-03 22:18:51', '2023-11-03 22:19:19', NULL),
('a8a7cbe0-a775-45fb-9eda-ee468c5d310c', 33.00, 33.00, 'INV-5aa0834', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'f7028d8c-5005-4bfa-a1ac-09a181de148e', NULL, 'cash', NULL, NULL, '2023-07-15 05:32:50', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('aa705632-93ff-411a-b450-35f42616115d', 36.00, 36.00, 'INV-f96d6a2', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-17 13:59:43', '2023-07-23 17:37:33', NULL),
('ab30285a-cf4d-45e7-807d-ad199deeb68c', 36.00, 36.00, 'INV-15ca03d', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-15 00:23:02', 0, 0, 1, 1, 1, 1, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 'f7dce302-652b-4950-b225-e80c69236f80', '83cda510-0304-479b-a98f-7b7c8140fd0f', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-08-15 00:21:27', '2023-10-23 20:04:16', NULL),
('ac510889-b314-4fbc-ae3e-bd389cf9c590', 40.00, 40.00, 'INV-3406007', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:26:40', '2023-12-14 02:26:40', NULL),
('acc8afa7-63dd-4bb7-871b-cfe2c771d8da', 15.00, 15.00, 'INV-d8a655d', NULL, NULL, NULL, NULL, 'Abdulrahman Abdullah', '121212', 'adamin@example.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', سعيد درويش, قسم الفيوم, الفيوم, , مصر', NULL, 'الفيوم', '30.8549039', '29.3119619', 'الفيوم', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6237ba45-cd42-4709-bc32-7184efcdb949', NULL, '466ee50d-041d-423c-9bfb-c3368a7590f6', '3c50aaee-f6ac-4fa9-b636-795188b606a9', NULL, 'cash', NULL, NULL, '2023-06-14 11:52:38', '2023-06-24 11:34:09', '2023-06-24 11:34:09'),
('ad38cd9b-89be-4592-9965-a2fd57c3c992', 36.00, 36.00, 'INV-5ec163e', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-10-23 20:07:37', '2023-11-14 01:38:22', NULL),
('ae639bb6-4de0-4ade-bcd0-d8e26c724711', 18.00, 18.00, 'INV-2a900d3', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-04 00:48:23', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-04 00:47:00', '2023-11-04 01:52:19', NULL),
('af6476cc-dd15-447b-9c3e-244d006e3458', 81.00, 81.00, 'INV-123e647', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-15 01:48:58', '2023-11-28 01:03:38', NULL),
('afa57deb-d61b-4c5a-9e4c-a3b649d51bbe', 100.00, 100.00, 'INV-efddb26', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '20', '0', '0', NULL, NULL, NULL, 'هجيرمات, عمان', NULL, 'Hujayrimat', '56.730022877455', '23.406190119501', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '8cc771ad-f0b0-4bc9-8e48-965f57d3e909', NULL, 'cash', NULL, NULL, '2023-08-21 13:39:28', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('b27fd88a-9277-4dbe-a599-ca57a53dd37a', 108.00, 108.00, 'INV-448a6a1', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'f7028d8c-5005-4bfa-a1ac-09a181de148e', NULL, 'cash', NULL, NULL, '2023-07-15 02:10:05', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('b92fd6c6-5206-41be-9b68-d10a6ff90351', 36.00, 36.00, 'INV-e4cffc2', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-08 20:27:04', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('b965f637-f06e-4076-90c7-f61f347aae04', 222.00, 222.00, 'INV-41bab5c', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-18 01:51:34', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-18 01:50:36', '2023-11-19 01:34:43', NULL),
('b9977bdb-5cb3-4144-a8a5-698fb18e46e7', 108.00, 108.00, 'INV-a3abf24', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'f7028d8c-5005-4bfa-a1ac-09a181de148e', NULL, 'cash', NULL, NULL, '2023-07-15 02:46:07', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('bc9f000a-6616-46fd-a14d-60d137de001b', 36.00, 36.00, 'INV-b4db622', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-22 21:57:42', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('bf0ee2a1-1803-4f9d-8902-03d418d3ab04', 366.00, 366.00, 'INV-e38d7c5', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-21 02:18:19', '2023-11-28 01:03:33', NULL),
('bf94bae6-e9ce-4aaf-8083-fbd3fc14d9f3', 72.00, 72.00, 'INV-58005db', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '20', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-24 18:05:34', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('c025676a-0e46-4e32-9f50-f15b621db20d', 50.00, 50.00, 'INV-ea47c11', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-07 21:44:26', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('c1168d18-ed8a-478c-82f1-2af77b223043', 366.00, 366.00, 'INV-05a07ba', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', 'f37f0fce-f5f3-4e1c-9995-bfae4d3521fc', NULL, 'cash', NULL, NULL, '2023-07-10 05:28:49', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('c118eda2-7660-4d6b-9033-ebc2217b4e23', 69.00, 69.00, 'INV-3861f76', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '20', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-24 17:55:14', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('c20cc8bb-a9f4-4cbd-8f34-767034233ef4', 122.00, 122.00, 'INV-0e4ac02', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-13 21:22:26', '2023-12-14 02:08:48', NULL),
('c21db79d-16f1-4e79-922d-e3bab35fe7ab', 50.00, 50.00, 'INV-23a3c5f', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 02:46:58', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('c617c2e5-435a-4498-b7a8-418d89046b25', 40.00, 40.00, 'INV-71529c6', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1205082038', 'maichelsameh@driver.com', NULL, '1', '0', '0', NULL, NULL, NULL, 'Amar ebn yaser ,cairo ,egypt', NULL, 'Heliopolies', '2.2222', '3.1111', 'cairo', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-02 02:51:45', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'f7dce302-652b-4950-b225-e80c69236f80', 'f7dce302-652b-4950-b225-e80c69236f80', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', 'c042eba7-9cf5-4174-9b66-7cc4413db70c', NULL, 'cash', NULL, NULL, '2023-08-02 02:47:59', '2023-08-02 04:03:40', NULL),
('caa38285-95e0-4aed-9675-64f0f1946785', 50.00, 50.00, 'INV-449bd4f', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, ', هجيرمات, عمان', NULL, 'هجيرمات', '56.730093620718', '23.413167657471', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '27ab6afb-6176-449c-80ac-d2dfe37a7ab8', NULL, 'cash', NULL, NULL, '2023-08-08 01:43:01', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('cb0baa56-bc61-447d-97d1-0ff40d94e6a2', 39.00, 39.00, 'INV-0c3e752', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-27 21:08:41', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '5a651a52-d168-4549-b225-25ccdb3e1b23', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-27 21:08:17', '2023-11-27 21:38:46', NULL),
('cb600771-7ef4-47e9-b5ff-d12ad7e5da7b', 50.00, 50.00, 'INV-c08ef91', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'Kahanat', '56.777795031667', '23.547208291762', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', 'c9d91f7f-70cb-485b-9876-4750b84a5e28', NULL, 'cash', NULL, NULL, '2023-08-21 13:31:40', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('ccc7f265-3b26-47fa-b756-391d92fbe390', 50.00, 50.00, 'INV-3a2d659', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 04:42:52', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 04:42:04', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('cf359b4e-fbdb-439a-84f8-7f9946d9702a', 36.00, 36.00, 'INV-9d3bd5b', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-07-25 02:05:23', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('d153c9e3-65d8-4fb5-b25f-5bab4728c0b9', 1098.00, 1098.00, 'INV-ffbb720', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', 'f37f0fce-f5f3-4e1c-9995-bfae4d3521fc', NULL, 'cash', NULL, NULL, '2023-07-12 15:41:23', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('d16391ac-eb34-46c2-9a3b-059c06870ad9', 1464.00, 1464.00, 'INV-1166a34', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-10 20:45:53', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('d1f11221-38fc-46b3-a439-8e4c7c6de389', 36.00, 36.00, 'INV-2155433', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-09-07 02:43:19', 0, 0, 0, 0, 0, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', 'ea2cfdfc-97e0-4444-9b57-51f68dd43dd1', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-09-07 02:40:49', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('d47fd691-674e-4206-b479-95952a094b1b', 36.00, 36.00, 'INV-5e0cf81', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-07-25 02:07:08', '2023-08-16 01:49:58', '2023-08-16 01:49:58');
INSERT INTO `orders` (`id`, `total`, `total_before_fees`, `invoice_id`, `promo_code`, `date`, `time`, `comment`, `full_name`, `phone`, `email`, `postal_code`, `shipping_fee`, `commission_percentage`, `tax_fee`, `block_number`, `floor_number`, `flat_number`, `address`, `country`, `area`, `longitude`, `latitude`, `city`, `country_id`, `data_country_id`, `city_id`, `accept_time`, `is_paid`, `is_cancelled`, `is_approved`, `in_shipping`, `is_delivered`, `is_accepted`, `marked_as_deleted_for_customer`, `marked_as_deleted_for_provider`, `marked_as_deleted_for_driver`, `customer_id`, `driver_id`, `provider_id`, `address_id`, `platform`, `payment_method`, `payment_id`, `refund_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('d516a056-23dc-4ebf-87ac-4dd8b7ba8b0b', 50.00, 50.00, 'INV-41755b4', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 03:25:06', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('d69da9ad-8b8a-4f9c-a458-31033d731052', 20.00, 20.00, 'INV-d7003d6', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-22 17:55:19', '2023-09-22 04:32:32', NULL),
('da35e30f-4423-44de-ac20-842e1a8734f3', 144.00, 144.00, 'INV-14c0ca6', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-15 01:54:34', '2023-11-15 16:56:30', NULL),
('dc2a4700-5a90-4eae-977b-c8a44713069b', 36.00, 36.00, 'INV-d55f5d2', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-08-11 02:36:27', '2023-09-22 04:32:22', NULL),
('dd2b048c-4b9a-4824-bb70-219490cfbc38', 36.00, 36.00, 'INV-55513a9', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-23 16:57:19', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('dd3f0a1b-9328-4b88-9e34-29a53b485584', 36.00, 36.00, 'INV-dfafb8a', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 1, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-20 22:21:41', '2023-11-28 01:03:34', NULL),
('ddc716c7-9e1c-4c19-8de1-b01282d80d80', 732.00, 732.00, 'INV-d88af60', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233678', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-10 23:47:24', '2023-09-22 04:32:20', NULL),
('dfb1543a-1465-4cc4-a9e4-e1e0c0b9729e', 228.03, 228.03, 'INV-7ed2da4', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, '6 شارع الخوض, السيب‎, عمان', NULL, 'Sib', '58.145416527987', '23.592732124127', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-10-30 03:02:06', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'e3628adf-c9f0-4b9e-aba9-6d4a8d68ac8a', '852d76b7-0396-484b-a1da-81e627069be0', '28b1178e-0380-4440-862c-96e27d2ad2d2', 'b9e07678-d502-4b06-879a-297f28cd0edc', NULL, 'cash', NULL, NULL, '2023-10-30 02:59:09', '2023-11-01 02:15:28', '2023-11-01 02:15:28'),
('e3404292-304e-4f87-b533-5b9a7a1966a7', 132.00, 132.00, 'INV-adb21c4', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-12-14 02:24:13', '2023-12-14 02:24:13', NULL),
('e522ee95-5e91-49e1-9d42-0157996cd856', 36.00, 36.00, 'INV-a0f6ae7', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-14 01:49:25', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-10 15:34:33', '2023-11-15 15:18:23', NULL),
('e64d0914-3f3c-4671-86a6-71d05d107e2d', 50.00, 50.00, 'INV-fe56755', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'غبرة المنيصف, عمان', NULL, 'غبرة المنيصف', '56.747424043715', '23.492517001248', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-08 01:36:18', 0, 0, 1, 1, 0, 1, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', '83cda510-0304-479b-a98f-7b7c8140fd0f', '7b15de4a-1da1-4e40-ad7d-03ce20d70d11', NULL, 'cash', NULL, NULL, '2023-08-08 01:33:58', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('e7d5ffb2-49cb-4bf9-9221-8a1a19c85853', 732.00, 732.00, 'INV-e09e51b', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-10 20:25:46', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('e8f0be03-9bdc-47b1-b376-5b6c813f9acf', 33.00, 33.00, 'INV-598f7af', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-22 17:32:28', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('ea345bd3-f7eb-4267-b73e-1e0a5dfae4a6', 36.00, 36.00, 'INV-61950e7', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '5', '0', '0', NULL, NULL, NULL, ', Muscat, عمان', NULL, 'Muscat', '58.397048301995', '23.584203465096', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'b166d9e4-7a22-492a-8ed4-329dff8f5180', NULL, 'cash', NULL, NULL, '2023-07-25 02:04:16', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('ef58b231-0052-45f5-8cb9-9e836a7aef6e', 99.00, 99.00, 'INV-1c20158', NULL, NULL, NULL, NULL, 'Popeyedelivery Services', '77444721', 'popeyedeliveryservices@gmail.com', NULL, '0.89', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'Seeb', '58.144595772028', '23.647110823105', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'aedc3945-3eb4-43bb-aff2-3a6ffd2ec8bf', NULL, '28b1178e-0380-4440-862c-96e27d2ad2d2', '4b178b9c-8239-40dd-98cd-2171b8f90d4b', NULL, 'cash', NULL, NULL, '2023-11-01 23:29:00', '2023-11-02 16:49:17', '2023-11-02 16:49:17'),
('f141d485-1a43-4da5-8747-a0e629b3bcda', 36.00, 36.00, 'INV-dbf2f9c', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-16 03:03:37', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('f1a720ac-a505-4cfa-8c8b-de65fd43db61', 36.00, 36.00, 'INV-dd3f560', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '0', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-08-11 01:27:14', '2023-08-11 03:24:16', NULL),
('f22f5860-b05c-4649-b637-cc0a4b53e20f', 36.00, 36.00, 'INV-3e09968', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-22 17:30:13', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('f3fea402-79b3-4e09-943d-0b2b1c10ca4e', 366.00, 366.00, 'INV-5440cfe', NULL, NULL, NULL, NULL, 'Oman', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', كهنات, عمان', NULL, 'كهنات', '56.7817538', '23.5519976', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ce0fd88d-f6e7-4222-baf7-6209fb87bc7c', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0008fe8d-d8ca-47d9-8f28-064a95672fbc', NULL, 'cash', NULL, NULL, '2023-07-12 15:39:48', '2023-07-14 17:10:16', '2023-07-14 17:10:16'),
('f44bd5bf-3980-45cd-8526-aa4b20b00d86', 36.00, 36.00, 'INV-6ff4c2d', NULL, NULL, NULL, NULL, 'Maichel Sameh', '1226233679', 'maichelsameh@user.com', NULL, '20', '0', '0', NULL, NULL, NULL, ', Kahanat, Oman', NULL, 'Kahanat', '56.7818132', '23.5520596', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 0, '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '5c05ea7a-5606-467a-9056-045bb9ef89e0', NULL, 'cash', NULL, NULL, '2023-07-30 18:42:00', '2023-09-21 23:50:30', NULL),
('f48cedd3-f7b0-4bc2-851c-ee407ea6851d', 72.00, 72.00, 'INV-9102880', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '1', '0', '0', NULL, NULL, NULL, ', هجيرمات, عمان', NULL, 'هجيرمات', '56.730093620718', '23.413167657471', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '27ab6afb-6176-449c-80ac-d2dfe37a7ab8', NULL, 'cash', NULL, NULL, '2023-08-12 16:30:01', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('f5092b07-04ba-4843-93c5-75567082d416', 36.00, 36.00, 'INV-bc9877c', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'f63ba367-6a3c-486b-8181-5e474c6a6369', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-09-07 02:09:55', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('f534e13e-97fd-42bf-97a3-25bc73d80d96', 32.00, 32.00, 'INV-66e41ba', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', السيب‎, عمان', NULL, 'السيب‎', '58.2516135', '23.5855281', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', 'af67efe7-77a9-405d-bdd8-dec940838bcf', NULL, 'cash', NULL, NULL, '2023-07-15 05:28:49', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('f65e50cb-794f-400b-b8c8-a6c707c6eb79', 72.00, 72.00, 'INV-0ed1bb3', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 0, 1, 1, 0, 0, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', NULL, 'f63ba367-6a3c-486b-8181-5e474c6a6369', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-09-05 02:36:29', '2023-09-22 17:02:12', '2023-09-22 17:02:12'),
('f681a723-64f0-4a3e-92d5-04dfd11a98a7', 78.00, 78.00, 'INV-6defb56', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '0.89', '0', '0', NULL, NULL, NULL, ', شارع النور, السيب‎, عمان', NULL, 'Sib', '58.1198183', '23.619914', 'Muscat Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-28 01:02:17', 0, 0, 1, 1, 1, 1, 0, 0, 0, '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', '5a651a52-d168-4549-b225-25ccdb3e1b23', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '3dded66b-a32a-4bd1-8b78-a0726d495631', NULL, 'cash', NULL, NULL, '2023-11-28 01:01:06', '2023-11-28 05:36:32', NULL),
('f9afe7f6-a3b4-4de1-abef-f1b543e4ba21', 36.00, 36.00, 'INV-78ded6d', NULL, NULL, NULL, NULL, 'خالد', '77444721', NULL, NULL, '15', '0', '0', NULL, NULL, NULL, 'قرن الكبش, عمان', NULL, 'قرن الكبش', '56.68422114104', '23.375171347001', 'محافظة الظاهرة', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'b746381e-8335-4180-ba01-dee614d88da2', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', 'd6ef95b7-06b6-48c0-971e-ed359cb2d072', NULL, 'cash', NULL, NULL, '2023-08-08 01:41:11', '2023-08-16 01:49:58', '2023-08-16 01:49:58'),
('fb269919-3c3d-43c0-8864-44198032ffb0', 36.00, 36.00, 'INV-5c376a3', NULL, NULL, NULL, NULL, 'محمد', '77585895', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, ', شارع السلطان قابوس, مسقط, عمان', NULL, 'مسقط', '58.379147239029', '23.590578580192', 'محافظة مسقط', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'a29c133e-7190-4bf5-9f15-8632d1ea4609', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '37daa21b-9d1e-4384-938b-57a4c8741ea8', NULL, 'cash', NULL, NULL, '2023-07-22 21:55:23', '2023-07-25 01:16:19', '2023-07-25 01:16:19'),
('fbd227d9-0fcf-4ae3-a58c-955be51b1110', 50.00, 50.00, 'INV-d430ede', NULL, NULL, NULL, NULL, 'بقاله', '77444721', NULL, NULL, '0', '0', '0', NULL, NULL, NULL, 'HQ2H+RJ2, كهنات, كهنات, عمان', NULL, 'Kahanat', '56.779533773661', '23.553197027776', 'Ad Dhahirah Governorate', NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-22 17:03:07', 0, 0, 1, 1, 1, 1, 0, 0, 0, 'b8ed5220-460b-4e74-a27c-41fa1b4ac85e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', 'fb751d69-9fe2-4017-948f-134a1117c41f', '1922eab3-6bbf-46f2-97f4-0bb9ca4c30e1', NULL, 'cash', NULL, NULL, '2023-08-22 16:49:36', '2023-09-22 17:02:12', '2023-09-22 17:02:12');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `orders_reports`
--

CREATE TABLE `orders_reports` (
  `id` char(36) NOT NULL,
  `commission_percentage` varchar(191) NOT NULL DEFAULT '0',
  `total_before_commission` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `total_after_commission` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `status` enum('not_paid','paid') NOT NULL DEFAULT 'not_paid',
  `order_id` char(36) DEFAULT NULL,
  `company_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `orders_reports`
--

INSERT INTO `orders_reports` (`id`, `commission_percentage`, `total_before_commission`, `total_after_commission`, `status`, `order_id`, `company_id`, `created_at`, `updated_at`) VALUES
('00d28d84-f467-49fd-9fa7-2d10c2f6be4c', '0', 50.00, 50.00, 'not_paid', '7f39a83b-5794-49e0-878d-6fe2678fb87b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:37:34', '2023-08-21 13:37:34'),
('01bdec41-399f-4aab-ad26-7a766647e2f1', '0', 40.00, 40.00, 'not_paid', '281f2541-4f6e-461f-a410-36e849d49435', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:49:24', '2023-12-14 02:49:24'),
('03bf68c3-2eb7-4873-95ae-f37938c964e5', '0', 360.00, 360.00, 'not_paid', 'bf0ee2a1-1803-4f9d-8902-03d418d3ab04', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-21 02:18:19', '2023-11-21 02:18:19'),
('045523ff-7aac-445e-aee9-5c148b5357c1', '0', 86.00, 86.00, 'not_paid', '35d9e242-6e09-4cba-b851-8cec8f3650be', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 01:30:54', '2023-08-08 01:30:54'),
('06dbc76d-17fa-4b3b-a773-2e783d835b2d', '0', 122.00, 122.00, 'not_paid', 'c20cc8bb-a9f4-4cbd-8f34-767034233ef4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-13 21:22:26', '2023-12-13 21:22:26'),
('0964f72b-cea3-494b-a3b3-7c6ab4ec0e63', '0', 36.00, 36.00, 'not_paid', '8854e3f8-be05-4c3a-8fca-b88b74d847f7', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 01:43:40', '2023-07-25 01:43:40'),
('0a8f5c45-927f-447a-aabe-b184a9bbbfd9', '0', 300.00, 300.00, 'not_paid', '055a70f3-f761-4777-99e6-3cc1e5d9ead9', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 21:22:44', '2023-08-22 21:22:44'),
('0b138089-d037-4f43-b203-1219fde7967b', '0', 36.00, 36.00, 'not_paid', '9f4a8e1d-90bd-4de0-a8f1-aa2ccd283a0a', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 01:27:22', '2023-07-25 01:27:22'),
('12119524-1c9e-41b7-94e0-9ca58ebb366f', '0', 36.00, 36.00, 'not_paid', 'a1437909-6fe4-4c7e-8863-902ded68f84b', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-21 09:01:33', '2023-07-21 09:01:33'),
('131eb677-23b7-4725-b1fc-5b5a0a783577', '0', 33.00, 33.00, 'not_paid', '2926278f-3a9b-4c14-bcc0-5abb7396d95c', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-17 14:00:06', '2023-07-17 14:00:06'),
('136d975e-5597-4c4e-8e56-8ca84203cec0', '0', 36.00, 36.00, 'not_paid', '6cc3f8eb-1913-4dfe-a752-0cb8456aea88', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-27 18:31:07', '2023-10-27 18:31:07'),
('1476ff24-e224-4f18-ad97-d54b07f997f5', '0', 35.00, 35.00, 'not_paid', '4a60e4b3-7da1-441e-991b-969696650fdb', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 15:06:58', '2023-08-20 15:06:58'),
('16c6a84b-0725-47e3-8b62-53bcd2442556', '0', 33.00, 33.00, 'not_paid', '08fc5d19-7234-40bd-90f5-15fe402d0f7f', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 03:35:42', '2023-07-16 03:35:42'),
('16c78ea1-0d79-499f-8c7d-3c9da147da23', '0', 50.00, 50.00, 'not_paid', 'cb600771-7ef4-47e9-b5ff-d12ad7e5da7b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:31:40', '2023-08-21 13:31:40'),
('1bb21a75-24b2-4172-b614-42822aef42f3', '0', 36.00, 36.00, 'not_paid', 'f1a720ac-a505-4cfa-8c8b-de65fd43db61', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-11 01:27:14', '2023-08-11 01:27:14'),
('1bb2890f-4dda-4adc-84c2-98a077b4b427', '0', 36.00, 36.00, 'not_paid', '0170d0cb-cf11-40ae-a75e-bd56c0421827', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-20 22:25:21', '2023-11-20 22:25:21'),
('1e67e4ee-b0ce-48a9-9fdd-79aabb166e98', '0', 18.00, 18.00, 'not_paid', 'ae639bb6-4de0-4ade-bcd0-d8e26c724711', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-04 00:47:00', '2023-11-04 00:47:00'),
('206235d3-8e49-4820-a672-e0742e7c7635', '0', 32.00, 32.00, 'not_paid', '9c8cf34c-a95b-4b08-8b5c-0f0198271656', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 03:17:10', '2023-07-16 03:17:10'),
('2181bfb8-79e4-44a2-a698-bbf0dc1d638b', '0', 72.00, 72.00, 'not_paid', 'f65e50cb-794f-400b-b8c8-a6c707c6eb79', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-05 02:36:29', '2023-09-05 02:36:29'),
('2184944f-69a7-4134-a4c4-5c83761154e6', '0', 36.00, 36.00, 'not_paid', '125ea0f9-5fd7-466a-b3b6-07e2e3c1fac3', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 05:34:22', '2023-07-15 05:34:22'),
('22428142-c6db-4236-ac6a-26e05c161e26', '0', 36.00, 36.00, 'not_paid', '556c1b2a-0e45-4dff-b3d8-6d56573f78f3', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 03:26:10', '2023-07-16 03:26:10'),
('236a3210-375c-42a1-81d9-feed4bbf77e3', '0', 72.00, 72.00, 'not_paid', '1e1bdcc2-791e-4bf7-9e1c-70a7e864c728', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:50:02', '2023-12-14 02:50:02'),
('252b1df8-8b27-4abb-8a6f-c6a429d0c9a6', '0', 40.00, 40.00, 'not_paid', '19320fe5-ceb3-40a0-858b-9c54a13177d2', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:51:19', '2023-12-14 02:51:19'),
('25e66251-8095-4b06-884b-b758a2ca67df', '0', 1098.00, 1098.00, 'not_paid', '069f7174-8996-4a37-a9f9-0e7aeeadd294', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 21:21:33', '2023-07-11 21:21:33'),
('260cd2dc-86d3-4350-b9e0-63a62ac4ffca', '0', 36.00, 36.00, 'not_paid', 'b92fd6c6-5206-41be-9b68-d10a6ff90351', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 20:27:04', '2023-08-08 20:27:04'),
('26976309-026b-4b55-855b-76adabb08447', '0', 20.00, 20.00, 'not_paid', '64504ba6-266d-4bfd-b703-96e359da977d', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-07-14 00:01:01', '2023-07-14 00:01:01'),
('271d2f96-ae56-40d4-b01d-81a221cf364d', '0', 18.00, 18.00, 'not_paid', '88e33f2a-44c3-4966-955c-3cc7c1ce8b9d', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-24 20:37:58', '2023-10-24 20:37:58'),
('27ca773f-957a-4f21-83e8-0fbd0e28921c', '0', 50.00, 50.00, 'not_paid', '8d5ddeac-e2fd-4744-8736-be3eed190441', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 01:47:06', '2023-08-08 01:47:06'),
('2ac2f7c3-f1d5-4b16-a104-466136eb75ef', '0', 36.00, 36.00, 'not_paid', '4ebce9f9-2721-46ba-9776-1e771aec87e2', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 16:59:44', '2023-07-22 16:59:44'),
('2bf2bb98-85d6-4441-8747-c92d44c552df', '0', 50.00, 50.00, 'not_paid', '63351183-b2ab-4808-bcbd-9658519d8ffa', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:40:40', '2023-08-21 13:40:40'),
('2c02d15f-e0b1-499c-8bd6-dcabedc4c2e6', '0', 36.00, 36.00, 'not_paid', 'f141d485-1a43-4da5-8747-a0e629b3bcda', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 03:03:37', '2023-07-16 03:03:37'),
('2c0d26c4-8156-4e5e-b49c-bca2381dfebf', '0', 288.00, 288.00, 'not_paid', 'a36d592e-3c77-4985-ba26-6e1d68fc5f2c', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-05 02:43:16', '2023-09-05 02:43:16'),
('2f40afa9-87fd-42c0-b684-5e46b2aa6b87', '0', 92.00, 92.00, 'not_paid', '5621ec74-5dba-4d46-a26c-447e4bb9ace6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-13 21:25:24', '2023-12-13 21:25:24'),
('2f83e78d-1eeb-41f9-9390-88d4663498d8', '0', 36.00, 36.00, 'not_paid', '2f770e45-9549-4b0c-a8a3-691ac0b5cce8', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 05:06:04', '2023-08-07 05:06:04'),
('303dd5f8-8048-4c63-be80-8556da0dceef', '0', 36.00, 36.00, 'not_paid', '33f90a79-8e58-4c49-b93b-86ad1813b075', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:33:48', '2023-07-22 17:33:48'),
('309e9574-7c3a-45a5-906a-9b3706340bae', '0', 1464.00, 1464.00, 'not_paid', '31ce363f-6aaf-41bd-ab37-67b9e1f75343', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 17:22:42', '2023-07-11 17:22:42'),
('36bc7f16-5e12-4d50-a829-2b04dfabb41a', '0', 108.00, 108.00, 'not_paid', '71b087c3-4fc6-44f2-8539-fb9269f692c0', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-26 15:25:10', '2023-11-26 15:25:10'),
('37611b0f-d741-4e42-a4b6-ff57b372d071', '0', 20.00, 20.00, 'not_paid', '349880c7-23f0-483f-9d83-7bd378784f2c', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-07-14 00:11:31', '2023-07-14 00:11:31'),
('37e27934-7fd5-4892-ba5b-ecd6b58939fd', '0', 288.00, 288.00, 'not_paid', '6a691507-ee69-4c2f-8d0e-b0179eff8d73', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-19 01:49:33', '2023-11-19 01:49:33'),
('3956fe2a-c5f4-4e8d-8faa-c898ec3dea48', '0', 50.00, 50.00, 'not_paid', 'c21db79d-16f1-4e79-922d-e3bab35fe7ab', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 02:46:58', '2023-08-22 02:46:58'),
('3a78f8c0-7e61-45f2-9711-b0cd37fb7b11', '0', 2562.00, 2562.00, 'not_paid', '113fb6ca-909f-4810-81d7-deaa70797630', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 00:52:22', '2023-07-11 00:52:22'),
('3aca9aaa-0d9a-40cd-9e03-65cdcc289fc9', '0', 36.00, 36.00, 'not_paid', '28ec548e-ba76-42de-888c-a785ea78a146', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 02:09:53', '2023-07-25 02:09:53'),
('3b208ed7-137a-4cfb-aef7-e03e2455c7be', '0', 30.00, 30.00, 'not_paid', '6003e427-ee5e-401e-82a4-fd73e2f0b49f', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:30:19', '2023-12-14 02:30:19'),
('3e15ecc8-7d31-4b97-b146-74bb5521ae73', '0', 36.00, 36.00, 'not_paid', '3a78ec03-35cb-4b14-b4b8-25b8bc737528', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 02:01:56', '2023-07-25 02:01:56'),
('3e79aa4c-a019-45e1-a15e-b505bd6b112f', '0', 36.00, 36.00, 'not_paid', 'd1f11221-38fc-46b3-a439-8e4c7c6de389', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-07 02:40:49', '2023-09-07 02:40:49'),
('3ff3d325-a005-433e-a513-e5394d34414a', '0', 100.00, 100.00, 'not_paid', 'afa57deb-d61b-4c5a-9e4c-a3b649d51bbe', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:39:28', '2023-08-21 13:39:28'),
('41b9c039-2ea6-4b40-a0f7-8f165815fe6b', '0', 33.00, 33.00, 'not_paid', '3911067b-da6c-4982-a385-2c96ce4a6ea1', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 03:04:26', '2023-07-16 03:04:26'),
('42056a81-e00b-41b5-b70c-0c6094e87d0a', '0', 468.00, 468.00, 'not_paid', '9565daa6-2285-4d25-943d-35083e1b7db8', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-26 15:15:50', '2023-11-26 15:15:50'),
('42103928-5a0c-4a5e-8855-6361f1d98e8b', '0', 64.00, 64.00, 'not_paid', '2d374451-3df3-4194-bdb0-c095a5af11d3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:13:12', '2023-12-14 02:13:12'),
('43038c95-046a-47e3-999b-3e5e42ecd070', '0', 36.00, 36.00, 'not_paid', '19ed2cf9-4c37-48c0-898d-743bce7a2e46', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 01:40:38', '2023-07-25 01:40:38'),
('4337fa6c-a1d6-4f56-bf23-c4fdb4298e97', '0', 108.00, 108.00, 'not_paid', '1e782c87-7f62-4634-9a19-b370d5011bf2', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-14 06:26:51', '2023-10-14 06:26:51'),
('448349ff-d29a-47d8-9f76-3790b1e21893', '0', 36.00, 36.00, 'not_paid', '33d4fdf7-a6db-4edc-96da-1b8fbaa15b90', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-28 03:32:17', '2023-07-28 03:32:17'),
('459e15e9-9ed1-42d6-b620-7d6dedd0033a', '0', 52.00, 52.00, 'not_paid', '6eab7b35-bd10-45c4-96bf-de45b852c519', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:28:30', '2023-12-14 02:28:30'),
('46e0d59a-17d5-4b2b-9636-bb71885baa2a', '0', 35.00, 35.00, 'not_paid', 'a2397ce2-758e-47e1-a94f-f66c36afa66c', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-17 14:00:33', '2023-07-17 14:00:33'),
('4797423c-29d1-44ad-9f9b-7baa465abd22', '0', 36.00, 36.00, 'not_paid', '6d51d906-1ec7-448d-8263-9ea8b5e12bbb', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:05:19', '2023-07-22 17:05:19'),
('4b1c9fcf-2cdc-4a6e-b2e9-c41e96d3d327', '0', 36.00, 36.00, 'not_paid', 'e522ee95-5e91-49e1-9d42-0157996cd856', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-10 15:34:34', '2023-11-10 15:34:34'),
('4badf1ea-a801-4332-a9ca-8cd4af8df51b', '0', 1830.00, 1830.00, 'not_paid', '3fd85eaa-9635-4678-8752-4a6549d01d25', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 14:31:31', '2023-07-11 14:31:31'),
('4bddeec5-16c2-4e3b-843c-22f3d9dea4ff', '0', 40.00, 40.00, 'not_paid', 'c617c2e5-435a-4498-b7a8-418d89046b25', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-08-02 02:47:59', '2023-08-02 02:47:59'),
('4d16140e-9ca6-4ce0-9d9c-e15190aefddf', '0', 18.00, 18.00, 'not_paid', '7dad48e8-055e-4a2c-9f6c-489fc2fd4c1b', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-22 01:17:14', '2023-10-22 01:17:14'),
('50387bcc-e0e6-4968-8e74-3fe423c41cea', '0', 1464.00, 1464.00, 'not_paid', '7c13580c-6967-4f66-aebc-fa61f5c25d17', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 16:13:38', '2023-07-07 16:13:38'),
('50564174-f127-4bd5-83a7-55833364c18e', '0', 36.00, 36.00, 'not_paid', 'ea345bd3-f7eb-4267-b73e-1e0a5dfae4a6', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 02:04:16', '2023-07-25 02:04:16'),
('532c0793-9cab-4b3e-8766-eea58244d10f', '0', 33.00, 33.00, 'not_paid', 'a8a7cbe0-a775-45fb-9eda-ee468c5d310c', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 05:32:50', '2023-07-15 05:32:50'),
('552dcfa5-5dd4-4d23-bf0b-46301cb90223', '0', 108.00, 108.00, 'not_paid', 'b27fd88a-9277-4dbe-a599-ca57a53dd37a', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 02:10:05', '2023-07-15 02:10:05'),
('5ac3c392-c231-4b5f-bb05-fb36713e4ac0', '0', 72.00, 72.00, 'not_paid', 'af6476cc-dd15-447b-9c3e-244d006e3458', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-15 01:48:58', '2023-11-15 01:48:58'),
('5c079496-afbe-44a1-bd85-054508fdb383', '0', 69.00, 69.00, 'not_paid', 'c118eda2-7660-4d6b-9033-ebc2217b4e23', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-24 17:55:14', '2023-07-24 17:55:14'),
('5c564900-9f22-4471-bace-a5f8ea65f7a9', '0', 30.00, 30.00, 'not_paid', '5ab8193c-a58d-4bf8-9ee2-3b798fde48b7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:42:02', '2023-12-14 02:42:02'),
('5c7007c0-bb2f-454b-b037-755f61342d50', '0', 72.00, 72.00, 'not_paid', 'f681a723-64f0-4a3e-92d5-04dfd11a98a7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-28 01:01:06', '2023-11-28 01:01:06'),
('5eb38baa-65fe-4459-9e6d-3041f1d1f107', '0', 1098.00, 1098.00, 'not_paid', '912332c6-18d7-470a-ad16-e5be8d7c45cc', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 14:48:08', '2023-07-11 14:48:08'),
('5f153844-fe4f-4b3c-bc4b-fb348bd1a5d2', '0', 72.00, 72.00, 'not_paid', '44ccd6cc-bbb3-41a0-a42f-db7e1fae445c', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-03 23:18:57', '2023-11-03 23:18:57'),
('5fcf8ce7-8a46-4675-8ef1-29a826693af6', '0', 18.00, 18.00, 'not_paid', '85d41f87-4b2e-4cf3-b675-bc49e8dca33b', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-24 20:36:47', '2023-10-24 20:36:47'),
('6185d63c-5387-40e8-8dd8-c6e79cd784d5', '0', 36.00, 36.00, 'not_paid', 'f9afe7f6-a3b4-4de1-abef-f1b543e4ba21', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 01:41:11', '2023-08-08 01:41:11'),
('64611b7c-0274-47b2-be83-04e9a0e37f32', '0', 36.00, 36.00, 'not_paid', 'bc9f000a-6616-46fd-a14d-60d137de001b', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 21:57:42', '2023-07-22 21:57:42'),
('64d2458a-14f1-4da3-8fc1-b38217b01a85', '0', 36.00, 36.00, 'not_paid', 'aa705632-93ff-411a-b450-35f42616115d', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-17 13:59:44', '2023-07-17 13:59:44'),
('64e845cb-7e30-4a2f-afaf-088ce04f2fa2', '0', 18.00, 18.00, 'not_paid', '37f484e3-effb-469a-921d-050f91badcbe', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-24 20:35:19', '2023-10-24 20:35:19'),
('664c310a-7e5d-41e7-8704-687f36bc0fa2', '0', 66.00, 66.00, 'not_paid', '474514b9-76c0-4d3f-a7e3-fe252bbb05b8', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 23:15:15', '2023-07-15 23:15:15'),
('67e2570e-5c56-4152-a68b-ce8d03f9cdba', '0', 99.00, 99.00, 'not_paid', 'ef58b231-0052-45f5-8cb9-9e836a7aef6e', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-11-01 23:29:00', '2023-11-01 23:29:00'),
('6a74e636-a696-4fdd-aba2-1f67849690e9', '0', 36.00, 36.00, 'not_paid', 'd47fd691-674e-4206-b479-95952a094b1b', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 02:07:08', '2023-07-25 02:07:08'),
('6b3d77aa-c881-4ae0-a0b9-584465e8b8e5', '0', 50.00, 50.00, 'not_paid', 'ccc7f265-3b26-47fa-b756-391d92fbe390', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 04:42:04', '2023-08-22 04:42:04'),
('6be1253a-cc1e-4543-8d83-e6e630d2a2bd', '0', 33.00, 33.00, 'not_paid', 'e8f0be03-9bdc-47b1-b376-5b6c813f9acf', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:32:28', '2023-07-22 17:32:28'),
('6d90dec0-e27c-4596-aa4a-4f78badf95dc', '0', 54.00, 54.00, 'not_paid', '3aa9e20b-2705-4ccd-89fa-89e6d9e12650', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-24 20:33:52', '2023-10-24 20:33:52'),
('6dce25ee-8f1a-464c-876a-39c1c5eb13b6', '0', 36.00, 36.00, 'not_paid', 'f44bd5bf-3980-45cd-8526-aa4b20b00d86', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-30 18:42:00', '2023-07-30 18:42:00'),
('6ec75e94-5f5d-419a-ada1-371dc613fef3', '0', 36.00, 36.00, 'not_paid', '786546be-a47f-45b5-a5c6-ff7298e2f1ba', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:34:36', '2023-07-22 17:34:36'),
('6f18d28b-7b7a-48be-9bf4-939c59f32b27', '0', 100.00, 100.00, 'not_paid', '0dbd56c3-f6fd-42d2-8967-68ea0e476203', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:30:35', '2023-08-21 13:30:35'),
('7480cbdf-2973-4a37-b343-5e548cd67114', '0', 36.00, 36.00, 'not_paid', '3a9eb6aa-2142-46c7-b32b-91276feb8eb8', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 01:38:27', '2023-07-25 01:38:27'),
('761a4ccb-d6af-4ced-bff9-7359144cb3d4', '0', 400.00, 400.00, 'not_paid', '83cbbf35-c713-4b09-a399-6b7c557b4d44', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 21:25:37', '2023-08-22 21:25:37'),
('76be155d-e4c6-4ba2-a50a-77dfe859a467', '0', 18.00, 18.00, 'not_paid', '9e0e272f-3a55-4462-96a4-d33ed1ebf2a3', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-15 05:02:17', '2023-10-15 05:02:17'),
('7804dc4c-9b48-491d-826c-df326d144e96', '0', 32.00, 32.00, 'not_paid', '89dc2f51-91c3-453d-9827-3043a9f2d221', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 23:17:31', '2023-07-15 23:17:31'),
('78e6d0ae-b6ca-429d-bcce-4acd3c725433', '0', 60.00, 60.00, 'not_paid', '47fc4048-3d4c-44ab-bf9c-f9e83ff77fff', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-07-24 14:55:41', '2023-07-24 14:55:41'),
('78f014df-e645-440a-8660-e7af1a60019a', '0', 1098.00, 1098.00, 'not_paid', 'd153c9e3-65d8-4fb5-b25f-5bab4728c0b9', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-12 15:41:23', '2023-07-12 15:41:23'),
('799f04e5-97c6-47e7-a232-72af6a720f50', '0', 160.00, 160.00, 'not_paid', '355c29ea-d549-4baa-af43-f758e914fd1f', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:15:13', '2023-12-14 02:15:13'),
('79f5fb11-19aa-4f2b-88d7-188f31dafcb5', '0', 50.00, 50.00, 'not_paid', 'caa38285-95e0-4aed-9675-64f0f1946785', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 01:43:01', '2023-08-08 01:43:01'),
('7a26a41f-03d1-4e7e-9cc4-dd2b7b762919', '0', 36.00, 36.00, 'not_paid', '78dcf1d1-3b3e-4528-8081-a727d3c85bf1', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-20 22:32:30', '2023-11-20 22:32:30'),
('7ed303a6-17c2-41a6-acee-1f876938ac7e', '0', 36.00, 36.00, 'not_paid', 'a7b6ceda-e829-4e67-b731-ccf3119bc47e', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-03 22:18:51', '2023-11-03 22:18:51'),
('7fb274fd-0fea-46b7-b0de-59e523be3f75', '0', 36.00, 36.00, 'not_paid', '5e29099a-4787-4273-bd80-6dd99dcbd076', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-24 18:10:39', '2023-07-24 18:10:39'),
('809e7420-75e9-40d0-a814-95eb55a5d3c1', '0', 150.00, 150.00, 'not_paid', '27aa92d7-671d-4e20-97e2-135d6cbb46a3', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 02:45:06', '2023-08-22 02:45:06'),
('812cda84-0a04-4314-a29f-6490d400808b', '0', 732.00, 732.00, 'not_paid', 'e7d5ffb2-49cb-4bf9-9221-8a1a19c85853', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-10 20:25:46', '2023-07-10 20:25:46'),
('81f52db2-4358-4abc-a02e-0870eb0645b1', '0', 50.00, 50.00, 'not_paid', 'a16180b8-4215-468c-bef3-f3fcf9e9ff8d', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 16:47:21', '2023-08-22 16:47:21'),
('823f832f-19e0-477a-aed4-ebd6d2d77564', '0', 366.00, 366.00, 'not_paid', 'c1168d18-ed8a-478c-82f1-2af77b223043', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-10 05:28:49', '2023-07-10 05:28:49'),
('8521354a-d295-4314-bded-69b06f9b9da7', '0', 50.00, 50.00, 'not_paid', '27daf66d-c799-4da9-b018-5f6a4c085483', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 06:31:55', '2023-08-07 06:31:55'),
('8599b660-125a-4e1e-85f0-399c9637eca4', '0', 18.00, 18.00, 'not_paid', '60b656b1-b013-4dbe-a9f1-1e8de2cfa2c8', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-14 23:39:28', '2023-10-14 23:39:28'),
('864bb683-920a-40c4-8b07-7612f10c0f37', '0', 50.00, 50.00, 'not_paid', '89c72b26-c1e0-4245-a7f5-0849977fca18', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 02:27:25', '2023-08-08 02:27:25'),
('89676286-43eb-4578-9df6-5f009a91ccc8', '0', 50.00, 50.00, 'not_paid', '525ae5a7-2543-488e-bee1-a4d2c735f28e', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 17:01:07', '2023-08-22 17:01:07'),
('8a17f8ec-e87c-44f7-8834-e01d679577da', '0', 15.00, 15.00, 'not_paid', '9dea2bbb-3004-40b6-92d2-d11fce843558', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:52:33', '2023-12-14 02:52:33'),
('8cddd199-bdf6-4969-8ec6-b2f635951858', '0', 36.00, 36.00, 'not_paid', '43b65d89-f9e6-48de-8bd2-cbab7adb55a2', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-21 04:10:09', '2023-07-21 04:10:09'),
('8d226022-2dca-4159-b234-0fdaaeeaf6fb', '0', 50.00, 50.00, 'not_paid', '4aaa49a2-baea-4943-a577-2b92fedb7a7d', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 20:10:02', '2023-08-08 20:10:02'),
('8dfc4bdc-0bba-47e3-b8ab-ff6dc277535f', '0', 3500.00, 3500.00, 'not_paid', '8cd4bb11-e47b-4655-affa-217702aabd53', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-16 16:45:22', '2023-06-16 16:45:22'),
('8e7f9040-4000-4339-a73d-cb17502c3d79', '0', 18.00, 18.00, 'not_paid', '8e2db63f-83c3-43be-8e25-6d3a9190a6ed', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-22 00:46:24', '2023-10-22 00:46:24'),
('8e985783-b3d8-446e-b5c3-be0e87c82a4e', '0', 20.00, 20.00, 'not_paid', '31396bf8-8edd-47be-b0d3-1d2af4ff630e', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:45:37', '2023-12-14 02:45:37'),
('8f2b1700-dfb5-49a0-97fd-32bd41cebfdb', '0', 36.00, 36.00, 'not_paid', 'f22f5860-b05c-4649-b637-cc0a4b53e20f', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:30:13', '2023-07-22 17:30:13'),
('8fb0a106-8e1c-4979-a9e6-76cafb3bb42a', '0', 150.00, 150.00, 'not_paid', '3ee92fb0-0249-4140-97d4-0162621061c0', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-09-05 02:34:03', '2023-09-05 02:34:03'),
('907322b3-fbe8-4768-80b0-28ed7603d8bc', '0', 1098.00, 1098.00, 'not_paid', '372121c2-6739-474b-8f23-9530438ade28', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 14:32:14', '2023-07-11 14:32:14'),
('92bbc079-2fa8-485f-9ce7-e64693c82d67', '0', 120.00, 120.00, 'not_paid', '1d39686e-1739-436c-8b57-3135d5ee2121', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-09 22:43:41', '2023-06-09 22:43:41'),
('93b58dae-ec2a-4a7b-8060-af8e1edfd04e', '0', 366.00, 366.00, 'not_paid', 'f3fea402-79b3-4e09-943d-0b2b1c10ca4e', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-12 15:39:48', '2023-07-12 15:39:48'),
('95bf4e59-cdff-4ece-9643-761fee797fd8', '0', 50.00, 50.00, 'not_paid', 'e64d0914-3f3c-4671-86a6-71d05d107e2d', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 01:33:58', '2023-08-08 01:33:58'),
('97817a3d-d65c-4db4-9247-c32705687e64', '0', 1464.00, 1464.00, 'not_paid', 'd16391ac-eb34-46c2-9a3b-059c06870ad9', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-10 20:45:53', '2023-07-10 20:45:53'),
('9844eca2-34e5-4e1f-963e-3691bfa362ba', '0', 198.00, 198.00, 'not_paid', 'dfb1543a-1465-4cc4-a9e4-e1e0c0b9729e', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:59:09', '2023-10-30 02:59:09'),
('99b0509f-3879-4eb0-8f12-fdafc92ca0d4', '0', 1098.00, 1098.00, 'not_paid', '780f79bd-2419-4f03-908a-ae9864cddc21', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-10 20:21:47', '2023-07-10 20:21:47'),
('9a884613-64cd-4276-afc6-fbd04f5b8172', '0', 36.00, 36.00, 'not_paid', '32eaca7f-95b1-4909-8791-f9e2a4eeb3d9', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-27 18:17:48', '2023-10-27 18:17:48'),
('9acc0a35-ffe1-4353-b5d2-e76148f5a502', '0', 18.00, 18.00, 'not_paid', '8618c39b-a317-4647-819e-bd0ec3350453', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-15 23:59:35', '2023-10-15 23:59:35'),
('9bdb58be-f6d3-48ff-9acf-e3cae32895f6', '0', 180.00, 180.00, 'not_paid', '7af2ac1d-eec3-4022-af01-243f23b2165c', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-15 15:19:40', '2023-11-15 15:19:40'),
('9c64aab8-48db-4084-ac04-d878a67a0bd4', '0', 36.00, 36.00, 'not_paid', 'fb269919-3c3d-43c0-8864-44198032ffb0', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 21:55:23', '2023-07-22 21:55:23'),
('9e037c2b-a076-419b-bef4-fbd305c3dd95', '0', 50.00, 50.00, 'not_paid', '08dd24e5-f3b1-4b62-8787-3123f035996e', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 21:43:14', '2023-08-07 21:43:14'),
('9e9f6581-6684-4e3c-b95b-a5e1a4abb4f2', '0', 50.00, 50.00, 'not_paid', '8163aee3-c221-457a-be61-f403c54e340b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 14:44:49', '2023-08-22 14:44:49'),
('9f9e1a74-afe5-434b-bf6d-29b90717a596', '0', 35.00, 35.00, 'not_paid', '9d1a9936-657b-425d-b5d2-dd76b422ad80', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:40:16', '2023-08-20 14:40:16'),
('a0d7a844-97d2-4a62-a065-d6159d2b9f00', '0', 33.00, 33.00, 'not_paid', '67498ee6-21e4-4431-8f87-22ac9ccad069', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:09:03', '2023-07-22 17:09:03'),
('a1116bb5-9881-4134-961e-c946426d7f8b', '0', 144.00, 144.00, 'not_paid', '942264a7-3c0c-4b0f-89b8-af9da18b7bad', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 21:47:09', '2023-08-07 21:47:09'),
('a4b92b67-21cb-4c49-80ac-e4ce3504fdfc', '0', 40.00, 40.00, 'not_paid', 'ac510889-b314-4fbc-ae3e-bd389cf9c590', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:26:40', '2023-12-14 02:26:40'),
('a531010b-7a6d-4675-9dfb-5c8dae6fef8a', '0', 50.00, 50.00, 'not_paid', '926ec7ed-a9b6-4c19-88e0-10100090174e', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 03:31:47', '2023-08-22 03:31:47'),
('a6c75fd9-a50a-4d7e-9657-d28d1fb0c6c8', '0', 20.00, 20.00, 'not_paid', '10b7e92c-fb1d-444b-8f88-912cd76ad0b1', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-05 03:42:22', '2023-06-05 03:42:22'),
('a851ae5f-cfc3-4495-bc47-b6c41fc09695', '0', 50.00, 50.00, 'not_paid', '48a34035-dcbe-4e5b-9f29-853e15b9f1a2', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 04:05:12', '2023-08-22 04:05:12'),
('a9362e58-027a-4af0-a004-3325210bdcb0', '0', 15.00, 15.00, 'not_paid', 'acc8afa7-63dd-4bb7-871b-cfe2c771d8da', '466ee50d-041d-423c-9bfb-c3368a7590f6', '2023-06-14 11:52:38', '2023-06-14 11:52:38'),
('aa81cefa-8b08-4ce3-9938-a4303b4ac808', '0', 144.00, 144.00, 'not_paid', 'da35e30f-4423-44de-ac20-842e1a8734f3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-15 01:54:34', '2023-11-15 01:54:34'),
('ac04bb0a-1137-43c3-95d8-ab0961c634a4', '0', 36.00, 36.00, 'not_paid', '3ca46586-183b-4453-83fc-77a47bbf1c92', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-22 04:32:51', '2023-09-22 04:32:51'),
('ada57652-cfd1-435e-be22-65c4b2c16d89', '0', 36.00, 36.00, 'not_paid', '92af38c0-cb3e-427c-956f-58e345eb9d09', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-24 18:02:01', '2023-07-24 18:02:01'),
('ae9e6030-88b8-4d1e-bd18-b228835ef03a', '0', 432.00, 432.00, 'not_paid', '45ce715f-c51c-4505-9849-fc1fae22f7f8', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-21 02:20:30', '2023-11-21 02:20:30'),
('af256dba-12a7-4bed-9480-8238aa434517', '0', 100.00, 100.00, 'not_paid', 'a3eb5241-3b5e-46be-a837-ad3574d51967', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:42:07', '2023-08-21 13:42:07'),
('afb0c91c-ab69-4e4b-ad32-1035ffe090e5', '0', 33.00, 33.00, 'not_paid', '21e8b824-5c07-4555-9bbe-b6a8673f096f', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-22 17:44:00', '2023-07-22 17:44:00'),
('b0199d1e-c844-4cd4-bfd5-2c69e7ecc40d', '0', 50.00, 50.00, 'not_paid', '3963a708-7aa6-4b9e-ac66-f819abc0ee53', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 01:45:12', '2023-08-08 01:45:12'),
('b18b2304-6cb2-4b57-bb02-a6bc73bcfeeb', '0', 20.00, 20.00, 'not_paid', '591c91ac-5ee7-4a16-80d1-241a76455a28', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-07-22 17:56:11', '2023-07-22 17:56:11'),
('b1ce672c-fc38-4af8-9b74-08b5bfd26c59', '0', 50.00, 50.00, 'not_paid', 'c025676a-0e46-4e32-9f50-f15b621db20d', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 21:44:26', '2023-08-07 21:44:26'),
('b215fbad-0320-4a07-bb69-88bb72e0ee19', '0', 50.00, 50.00, 'not_paid', 'fbd227d9-0fcf-4ae3-a58c-955be51b1110', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 16:49:36', '2023-08-22 16:49:36'),
('b2274d4c-1e03-44fd-8050-2fd37b5e60af', '0', 732.00, 732.00, 'not_paid', '9e988203-b661-40ed-bfad-c25d17d53625', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 21:32:34', '2023-07-07 21:32:34'),
('b2df7fc4-6e61-4ae7-887a-78a1bab79984', '0', 1830.00, 1830.00, 'not_paid', '6b40854a-f919-4d7a-b3d2-245137214686', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 00:51:33', '2023-07-11 00:51:33'),
('b4dcbd36-cef1-409d-b9cc-3dbd9f7ed7db', '0', 36.00, 36.00, 'not_paid', '863f4f05-7ba7-49f4-a3fd-dbea2d5a6470', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-09 01:47:08', '2023-08-09 01:47:08'),
('bb4d6c7c-53e5-460c-ab02-dec8ee691ff5', '0', 20.00, 20.00, 'not_paid', '08805a4f-a132-4d4e-8073-aa02d1f254b6', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-07-22 18:04:13', '2023-07-22 18:04:13'),
('be1b5dde-51ee-4795-bcc5-2045f8baa717', '0', 36.00, 36.00, 'not_paid', 'dd2b048c-4b9a-4824-bb70-219490cfbc38', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-23 16:57:19', '2023-07-23 16:57:19'),
('bf26b0d9-4470-4cd5-91d2-db0a931a2b05', '0', 72.00, 72.00, 'not_paid', 'f48cedd3-f7b0-4bc2-851c-ee407ea6851d', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-12 16:30:01', '2023-08-12 16:30:01'),
('bf711fa1-a11d-47b5-b537-fb077c4baeff', '0', 20.00, 20.00, 'not_paid', 'd69da9ad-8b8a-4f9c-a458-31033d731052', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-07-22 17:55:19', '2023-07-22 17:55:19'),
('bff606f3-492c-4866-8df4-1e516685be9e', '0', 132.00, 132.00, 'not_paid', 'e3404292-304e-4f87-b533-5b9a7a1966a7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:24:13', '2023-12-14 02:24:13'),
('c17353f3-d3ed-4bfc-9b8d-72bb8777309e', '0', 36.00, 36.00, 'not_paid', 'ad38cd9b-89be-4592-9965-a2fd57c3c992', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-23 20:07:37', '2023-10-23 20:07:37'),
('c2935b31-e84a-41b3-93b4-c2c73b343089', '0', 108.00, 108.00, 'not_paid', '38d26890-9153-4ee9-be97-752b39e55351', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-15 01:52:05', '2023-11-15 01:52:05'),
('c3a99236-4cfb-42ff-b2ad-a8321cea58fc', '0', 36.00, 36.00, 'not_paid', '052ad607-a446-44db-a49d-ae7f3bbdbf65', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-05 02:38:13', '2023-09-05 02:38:13'),
('c41bb4a9-a4f0-4440-ac2b-db068045d0c5', '0', 1464.00, 1464.00, 'not_paid', '58ba6e8a-db9d-473d-b235-22d90d4b7a1f', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-11 15:40:50', '2023-07-11 15:40:50'),
('c57a2d72-0f6c-46cd-802d-99517478ab2b', '0', 36.00, 36.00, 'not_paid', 'dd3f0a1b-9328-4b88-9e34-29a53b485584', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-20 22:21:41', '2023-11-20 22:21:41'),
('c599f354-f602-49e1-9fc1-1f6d7d6bd879', '0', 32.00, 32.00, 'not_paid', '716fe201-5724-4a59-9cdc-9df3e403660b', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-17 14:01:15', '2023-07-17 14:01:15'),
('c7085899-9e09-4369-bd8b-4ff28da7831b', '0', 36.00, 36.00, 'not_paid', '3e311070-f76d-4ea1-bdd5-ffd085b46d28', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 02:55:05', '2023-07-16 02:55:05'),
('c72fb48b-0c6c-4639-8aa5-8d8742dc889e', '0', 32.00, 32.00, 'not_paid', 'a1ff1560-8661-4d56-ae96-b6ce999b7a0a', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 03:13:01', '2023-07-16 03:13:01'),
('ca84a813-0fef-45b0-9eb3-3a981fe7709b', '0', 1000.00, 1000.00, 'not_paid', '94e5609a-c06c-422e-aceb-d9854e6fe6ec', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-14 03:08:10', '2023-06-14 03:08:10'),
('caba887e-e64a-477e-85f8-42c9c93b4c45', '0', 18.00, 18.00, 'not_paid', '55615f33-ea9f-4f1d-8f0b-529e613d8bd7', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-15 23:54:58', '2023-10-15 23:54:58'),
('ce912091-ab75-48ca-9729-451f8f219507', '0', 99.00, 99.00, 'not_paid', '2d7b8114-5496-469e-893a-e97a10cc5b45', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-11-01 23:34:53', '2023-11-01 23:34:53'),
('d07ccdba-1813-4909-8c39-9185cab41caa', '0', 70.00, 70.00, 'not_paid', '7b272c3a-7b51-4154-b6d5-0fb6836669b4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:18:36', '2023-12-14 02:18:36'),
('d0896731-b0a2-484e-a3f8-799a55709dc4', '0', 732.00, 732.00, 'not_paid', 'ddc716c7-9e1c-4c19-8de1-b01282d80d80', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-10 23:47:24', '2023-07-10 23:47:24'),
('d30abed8-4e32-40d0-9771-ab8c07e5db14', '0', 36.00, 36.00, 'not_paid', '77345082-f275-47e8-a5be-a43e481084e0', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-07 02:46:29', '2023-09-07 02:46:29'),
('d4516a77-a6f1-4aa5-be63-57b784ba93ea', '0', 50.00, 50.00, 'not_paid', '08048cb2-8808-4e6c-a8f5-66f8f4af932a', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-08 02:26:02', '2023-08-08 02:26:02'),
('d9b3d249-c3eb-4b45-8de3-d5835e3fbd38', '0', 99.00, 99.00, 'not_paid', '62807d93-b7b7-4781-bb5a-0b38c717eae8', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-11-01 23:25:47', '2023-11-01 23:25:47'),
('da282df8-9715-4104-bf1e-02451c1e2b1a', '0', 50.00, 50.00, 'not_paid', 'd516a056-23dc-4ebf-87ac-4dd8b7ba8b0b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 03:25:06', '2023-08-22 03:25:06'),
('da4b968c-1859-4c8d-8b78-b2e1d99396df', '0', 52.00, 52.00, 'not_paid', '73896f13-fee7-4f6f-b50e-20571f7235b3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:36:32', '2023-12-14 02:36:32'),
('dd0f86f6-be28-46d6-b2ee-1d6aba369849', '0', 36.00, 36.00, 'not_paid', '7826dc2a-9734-4c4d-b14f-00673998af24', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-10 15:34:00', '2023-11-10 15:34:00'),
('dd97df38-1380-48b1-86a5-fccd2927515c', '0', 35.00, 35.00, 'not_paid', 'a6911e1d-caeb-4ea9-a9ea-4d4fc84aee46', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 05:36:39', '2023-07-15 05:36:39'),
('de37466e-566b-444d-a8aa-5929f77f71a6', '0', 732.00, 732.00, 'not_paid', '565db297-5c25-4228-a1ba-254ecc73b916', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-12 14:50:45', '2023-07-12 14:50:45'),
('df3b3fba-eb90-4efb-a30a-ba5bc088a3cc', '0', 99.00, 99.00, 'not_paid', '8fe0a91d-95b2-482d-b20b-0bb190555c67', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-11-01 23:33:49', '2023-11-01 23:33:49'),
('df4c1d68-7d71-4cb9-a89a-3b30e8d32bc6', '0', 7686.00, 7686.00, 'not_paid', '4995078b-8c0d-4f05-8493-53b4961104b0', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-08 22:08:53', '2023-07-08 22:08:53'),
('df6fa7ab-62b6-4b2a-a848-2dd6dd1ee206', '0', 36.00, 36.00, 'not_paid', '88474466-c1d8-495c-b993-26302cdcc864', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-11 01:50:44', '2023-08-11 01:50:44'),
('df837399-5625-4fcf-bae8-7acb4bd3434e', '0', 72.00, 72.00, 'not_paid', 'bf94bae6-e9ce-4aaf-8083-fbd3fc14d9f3', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-24 18:05:34', '2023-07-24 18:05:34'),
('e19e955f-5d09-4137-a2cc-3f0b22dee30a', '0', 32.00, 32.00, 'not_paid', '5b11b9a9-922b-471a-b4a0-1b3fed4b1057', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-21 04:14:17', '2023-07-21 04:14:17'),
('e37785ac-609f-4a02-a163-e81ab4df5375', '0', 216.00, 216.00, 'not_paid', 'b965f637-f06e-4076-90c7-f61f347aae04', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-18 01:50:36', '2023-11-18 01:50:36'),
('e4fcb11c-59d8-49c6-ab88-cd53d724d4a6', '0', 26.00, 26.00, 'not_paid', '58d8452a-8d8f-4a4c-8ab6-137c1b38c093', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-14 02:47:26', '2023-12-14 02:47:26'),
('e54314f4-8cfe-46bf-b1b9-1fcb1ee2e780', '0', 36.00, 36.00, 'not_paid', 'dc2a4700-5a90-4eae-977b-c8a44713069b', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-11 02:36:27', '2023-08-11 02:36:27'),
('e75ae408-391b-410a-9ce5-afe11ab44883', '0', 18.00, 18.00, 'not_paid', '92debff2-236b-432d-bd93-94a7d14c5a15', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-27 18:14:32', '2023-10-27 18:14:32'),
('e7ac1d27-2a12-4bd0-853e-9e0f1c4fb08b', '0', 108.00, 108.00, 'not_paid', '59893d46-2fc4-40f8-a3b1-1865767b6ee6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-10 15:29:45', '2023-11-10 15:29:45'),
('e7e4e4b7-4c21-4fdf-8ea6-1f57031d9dab', '0', 35.00, 35.00, 'not_paid', '7ceb1b85-2b15-4af5-a1f5-48584fcee416', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-16 02:59:37', '2023-07-16 02:59:37'),
('e8ecad98-2f16-43f7-b477-621286ac0fed', '0', 35.00, 35.00, 'not_paid', '410e2669-63fb-4e33-b91f-c93603432e2f', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 02:48:27', '2023-07-15 02:48:27'),
('eabe168e-b3c3-4034-b905-c395c0841a3e', '0', 108.00, 108.00, 'not_paid', 'b9977bdb-5cb3-4144-a8a5-698fb18e46e7', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 02:46:07', '2023-07-15 02:46:07'),
('ed3521ae-6cc6-4abf-a6c1-fe0993637b5e', '0', 70.00, 70.00, 'not_paid', '6d100686-085b-44ea-b330-5dc5513b1225', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:27:56', '2023-08-20 14:27:56'),
('ee133c0f-5326-4f8a-8752-6df3d695a844', '0', 108.00, 108.00, 'not_paid', '8fc76380-2ef9-4f4b-aad5-79d2497a5aac', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 01:32:56', '2023-07-25 01:32:56'),
('ef0f51ad-0a72-4727-be0a-aa7a24231103', '0', 123.00, 123.00, 'not_paid', '4cdc59e3-ddf6-4219-8695-1246f1975de3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-13 21:28:39', '2023-12-13 21:28:39'),
('ef6039fa-c912-4783-9bf7-43d67e643e9d', '0', 36.00, 36.00, 'not_paid', 'f5092b07-04ba-4843-93c5-75567082d416', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-07 02:09:55', '2023-09-07 02:09:55'),
('ef71d65e-c678-449e-8407-f37f02a05574', '0', 36.00, 36.00, 'not_paid', '7fbf7254-2551-4e27-8084-2974097684b1', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-04 01:59:57', '2023-11-04 01:59:57'),
('f03d789e-daac-4f60-804e-96e958318a6f', '0', 72.00, 72.00, 'not_paid', '018205f3-93b8-4d8d-abce-916375e60cfb', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-26 15:22:34', '2023-11-26 15:22:34'),
('f044437a-be46-47b5-b00a-8a7d3c94a4ea', '0', 36.00, 36.00, 'not_paid', 'ab30285a-cf4d-45e7-807d-ad199deeb68c', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-15 00:21:27', '2023-08-15 00:21:27'),
('f1cd9222-c0a8-4bd2-ba00-86b3295d2981', '0', 36.00, 36.00, 'not_paid', '375f3156-547f-430e-814c-e6018de96fe6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-26 15:21:12', '2023-11-26 15:21:12'),
('f2e7f9e3-cea9-467b-a50e-074fc4c0a07b', '0', 36.00, 36.00, 'not_paid', 'cb0baa56-bc61-447d-97d1-0ff40d94e6a2', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-11-27 21:08:17', '2023-11-27 21:08:17'),
('f39c4c82-1a56-40c5-ac2c-c354f95e1bdc', '0', 50.00, 50.00, 'not_paid', '40500b50-7c83-4f1d-858f-270decd2f9ef', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 16:57:34', '2023-08-22 16:57:34'),
('f4c8b314-3a9d-42e0-b3b6-32ce404d1d2f', '0', 18.00, 18.00, 'not_paid', '0c4c09bf-77ed-4c75-a61c-5a55895a3889', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-27 18:23:15', '2023-10-27 18:23:15'),
('f5344f9c-a3fc-40cd-9d12-68583a16fedc', '0', 50.00, 50.00, 'not_paid', '415c5823-5620-4917-9d32-5097e259dfa9', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 02:48:21', '2023-08-22 02:48:21'),
('f61f57fb-6b75-4713-b65d-32788181f423', '0', 32.00, 32.00, 'not_paid', 'f534e13e-97fd-42bf-97a3-25bc73d80d96', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 05:28:49', '2023-07-15 05:28:49'),
('f79abd08-a84e-4af8-bee3-9519e6766401', '0', 650.00, 650.00, 'not_paid', '4505031b-5094-4a68-93da-40daf514d915', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-23 16:05:29', '2023-08-23 16:05:29'),
('f95bb58d-c6ad-4420-acc9-fe43ac855577', '0', 36.00, 36.00, 'not_paid', 'cf359b4e-fbdb-439a-84f8-7f9946d9702a', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 02:05:23', '2023-07-25 02:05:23'),
('f9e06e73-dc43-4247-8551-e5a7d50ffb96', '0', 72.00, 72.00, 'not_paid', '25bfe287-1a90-4666-b2e8-323f62daa653', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 01:35:59', '2023-07-25 01:35:59'),
('fb557ba0-3d75-44fc-a98c-19cedbd060ad', '0', 50.00, 50.00, 'not_paid', '02086be3-6f82-433e-a069-b577d8f63e36', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-21 13:35:43', '2023-08-21 13:35:43'),
('fe0efa70-131d-4836-aa05-5bc1a03bbfa8', '0', 50.00, 50.00, 'not_paid', '7bc4ef43-3415-46df-8e46-62c61f22bba1', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-22 14:46:53', '2023-08-22 14:46:53');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `orders_requests`
--

CREATE TABLE `orders_requests` (
  `id` char(36) NOT NULL,
  `status` enum('accepted','not_accepted') NOT NULL DEFAULT 'not_accepted',
  `order_id` char(36) DEFAULT NULL,
  `driver_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `orders_requests`
--

INSERT INTO `orders_requests` (`id`, `status`, `order_id`, `driver_id`, `created_at`, `updated_at`) VALUES
('0044bd19-009f-4830-aaad-2b0d27ac59d0', 'not_accepted', 'ab30285a-cf4d-45e7-807d-ad199deeb68c', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', '2023-08-15 00:21:27', '2023-08-15 00:21:27'),
('0293bf77-a022-4b4f-9837-99b6ef806c67', 'accepted', 'fbd227d9-0fcf-4ae3-a58c-955be51b1110', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 16:49:37', '2023-08-22 17:03:07'),
('03620b7a-076a-4570-98c6-f2ce2f632318', 'not_accepted', '6d100686-085b-44ea-b330-5dc5513b1225', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-20 14:27:56', '2023-08-20 14:27:56'),
('059a435b-884f-4067-a13a-4a0c6826c367', 'not_accepted', 'd1f11221-38fc-46b3-a439-8e4c7c6de389', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', '2023-09-07 02:40:49', '2023-09-07 02:40:49'),
('0818d9d8-e2d0-458e-994f-f429ce444729', 'accepted', 'f681a723-64f0-4a3e-92d5-04dfd11a98a7', '5a651a52-d168-4549-b225-25ccdb3e1b23', '2023-11-28 01:01:06', '2023-11-28 01:02:17'),
('086190a2-4e0a-454e-ac6c-23df37152e65', 'accepted', '77345082-f275-47e8-a5be-a43e481084e0', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', '2023-09-07 02:46:29', '2023-09-07 02:47:27'),
('0e53d59b-e8da-4248-94fa-881a27fe50a0', 'not_accepted', '9e0e272f-3a55-4462-96a4-d33ed1ebf2a3', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', '2023-10-15 05:02:18', '2023-10-15 05:02:18'),
('133c4ff6-1b9d-4e5e-8040-b6a9e977cd85', 'not_accepted', '1e782c87-7f62-4634-9a19-b370d5011bf2', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', '2023-10-14 06:26:51', '2023-10-14 06:26:51'),
('14bc4e88-bcec-4417-97c5-3914d3aa62e1', 'accepted', '4cdc59e3-ddf6-4219-8695-1246f1975de3', '288a98f5-e5c1-4983-96e7-a71838903b86', '2023-12-13 21:28:39', '2023-12-13 21:28:55'),
('16236da7-6fe8-4243-8367-9f1ffae4d28c', 'not_accepted', '92debff2-236b-432d-bd93-94a7d14c5a15', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-27 18:14:33', '2023-10-27 18:14:33'),
('1c85a9f6-514f-4f2e-bd6b-46a2a7bbaae2', 'accepted', '78dcf1d1-3b3e-4528-8081-a727d3c85bf1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-20 22:32:30', '2023-11-20 22:41:01'),
('23c30ff8-f7af-4914-ae39-740dbf0b31b9', 'accepted', '48a34035-dcbe-4e5b-9f29-853e15b9f1a2', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 04:05:13', '2023-08-22 04:05:50'),
('26682f32-ad8d-4977-aa72-2cb472a5890f', 'accepted', '55615f33-ea9f-4f1d-8f0b-529e613d8bd7', '489731f2-960b-4f66-a74f-73276b1aff4c', '2023-10-15 23:54:59', '2023-10-15 23:56:01'),
('278266d4-bdc5-4579-91ea-923b18c0dfd6', 'not_accepted', 'cb600771-7ef4-47e9-b5ff-d12ad7e5da7b', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:31:40', '2023-08-21 13:31:40'),
('2ab60a54-4150-4a75-9847-287459b0ab54', 'accepted', '6d100686-085b-44ea-b330-5dc5513b1225', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', '2023-08-20 14:27:56', '2023-08-20 14:28:56'),
('37a5d180-2cb8-49d7-a087-3b9eb2dffa01', 'accepted', '83cbbf35-c713-4b09-a399-6b7c557b4d44', '476ff7ad-7d9d-4207-a02d-6d35f375730b', '2023-08-22 21:25:38', '2023-08-22 21:26:48'),
('43bfc91c-195a-418e-bd26-36971428b6ee', 'not_accepted', 'c20cc8bb-a9f4-4cbd-8f34-767034233ef4', '288a98f5-e5c1-4983-96e7-a71838903b86', '2023-12-13 21:22:26', '2023-12-13 21:22:26'),
('48a497a7-0757-41fd-aa6d-fb8e065dcab5', 'not_accepted', '7f39a83b-5794-49e0-878d-6fe2678fb87b', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:37:34', '2023-08-21 13:37:34'),
('4ca2a70b-de0c-487d-ab97-621064584cd6', 'not_accepted', '4505031b-5094-4a68-93da-40daf514d915', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-23 16:05:30', '2023-08-23 16:05:30'),
('4d0052ee-de65-4d1a-93cc-c08047d0e94b', 'not_accepted', 'a3eb5241-3b5e-46be-a837-ad3574d51967', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:42:08', '2023-08-21 13:42:08'),
('4e85f840-b5b5-40c9-9635-bc385c0bca45', 'not_accepted', '055a70f3-f761-4777-99e6-3cc1e5d9ead9', '476ff7ad-7d9d-4207-a02d-6d35f375730b', '2023-08-22 21:22:45', '2023-08-22 21:22:45'),
('50054cf4-a3f6-40cb-820c-147fec7e1631', 'not_accepted', '88e33f2a-44c3-4966-955c-3cc7c1ce8b9d', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-24 20:37:58', '2023-10-24 20:37:58'),
('51a8db9d-603c-434d-ad21-1a9dfa44a6f1', 'not_accepted', 'a16180b8-4215-468c-bef3-f3fcf9e9ff8d', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 16:47:22', '2023-08-22 16:47:22'),
('52457aa4-629b-49eb-abe9-66b85c79f04d', 'not_accepted', '0170d0cb-cf11-40ae-a75e-bd56c0421827', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-20 22:25:22', '2023-11-20 22:25:22'),
('55226dc0-5cbe-49fb-95d6-2fe4cb278da2', 'accepted', '926ec7ed-a9b6-4c19-88e0-10100090174e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 03:31:52', '2023-08-22 03:32:49'),
('55762961-dac9-4463-8a6e-c78a52607cb9', 'accepted', '40500b50-7c83-4f1d-858f-270decd2f9ef', '476ff7ad-7d9d-4207-a02d-6d35f375730b', '2023-08-22 16:57:34', '2023-08-22 17:02:24'),
('558ce821-9cbe-4c94-a037-2cb1dbbec527', 'not_accepted', 'f48cedd3-f7b0-4bc2-851c-ee407ea6851d', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-08-12 16:30:01', '2023-08-12 16:30:01'),
('59034098-9d46-48ab-a7d1-86d4c8ace16c', 'not_accepted', '85d41f87-4b2e-4cf3-b675-bc49e8dca33b', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-24 20:36:47', '2023-10-24 20:36:47'),
('594c4495-4e92-484e-a1d0-d3eddac8dda8', 'accepted', '44ccd6cc-bbb3-41a0-a42f-db7e1fae445c', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-03 23:18:58', '2023-11-03 23:21:21'),
('66b7a9f7-75d3-44b5-a35d-337b48b0d9fa', 'not_accepted', '9d1a9936-657b-425d-b5d2-dd76b422ad80', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-20 14:40:17', '2023-08-20 14:40:17'),
('6a287afd-63d0-4b84-8435-2f9681106f5f', 'not_accepted', '4a60e4b3-7da1-441e-991b-969696650fdb', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-20 15:06:58', '2023-08-20 15:06:58'),
('70a3c434-211b-42a4-97aa-67264aed6320', 'not_accepted', '5621ec74-5dba-4d46-a26c-447e4bb9ace6', '288a98f5-e5c1-4983-96e7-a71838903b86', '2023-12-13 21:25:24', '2023-12-13 21:25:24'),
('71e6b087-f67a-4506-b1f6-e9416b4a8a3a', 'accepted', 'b965f637-f06e-4076-90c7-f61f347aae04', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-18 01:50:36', '2023-11-18 01:51:34'),
('790689b7-75f1-411c-bb18-e800001f5e00', 'not_accepted', 'afa57deb-d61b-4c5a-9e4c-a3b649d51bbe', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:39:28', '2023-08-21 13:39:28'),
('79bd6c6b-080e-4d0d-ac54-814d938e8e06', 'not_accepted', '37f484e3-effb-469a-921d-050f91badcbe', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-24 20:35:19', '2023-10-24 20:35:19'),
('85e1debe-f667-458b-8ed3-a2b02497de16', 'accepted', '7fbf7254-2551-4e27-8084-2974097684b1', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-04 01:59:57', '2023-11-04 02:00:49'),
('8f5ab296-de19-4861-9370-fac7a6ebc77c', 'not_accepted', '0dbd56c3-f6fd-42d2-8967-68ea0e476203', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:30:36', '2023-08-21 13:30:36'),
('8f84cde4-b2c7-4081-9d48-26ba711fc956', 'not_accepted', '83cbbf35-c713-4b09-a399-6b7c557b4d44', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 21:25:38', '2023-08-22 21:25:38'),
('900c84d7-0973-408f-87cb-2208ce12e441', 'accepted', 'd1f11221-38fc-46b3-a439-8e4c7c6de389', 'ea2cfdfc-97e0-4444-9b57-51f68dd43dd1', '2023-09-07 02:40:49', '2023-09-07 02:43:19'),
('90357094-b1a7-4302-a010-ae62f68f0f6e', 'not_accepted', '63351183-b2ab-4808-bcbd-9658519d8ffa', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:40:40', '2023-08-21 13:40:40'),
('9524f986-e731-43c8-89b2-db9a09f3c2b9', 'accepted', '7af2ac1d-eec3-4022-af01-243f23b2165c', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-15 15:19:40', '2023-11-15 15:20:26'),
('963ecbf9-42f9-48a8-aedd-07e292c87e25', 'not_accepted', '58d8452a-8d8f-4a4c-8ab6-137c1b38c093', 'e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366', '2023-12-14 02:47:26', '2023-12-14 02:47:26'),
('980a4b2a-5433-4ec9-a5e7-86c3ee76a9fd', 'not_accepted', '60b656b1-b013-4dbe-a9f1-1e8de2cfa2c8', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', '2023-10-14 23:39:28', '2023-10-14 23:39:28'),
('9f1d9cc6-8c39-43fe-b7fc-47a0458a42ad', 'not_accepted', '02086be3-6f82-433e-a069-b577d8f63e36', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-21 13:35:44', '2023-08-21 13:35:44'),
('a0be7553-0f47-406b-8fb9-b473aaea1381', 'accepted', 'cb0baa56-bc61-447d-97d1-0ff40d94e6a2', '5a651a52-d168-4549-b225-25ccdb3e1b23', '2023-11-27 21:08:18', '2023-11-27 21:08:41'),
('a4c60c81-3e4d-416d-907d-54bed180dd76', 'not_accepted', 'f48cedd3-f7b0-4bc2-851c-ee407ea6851d', '4d151a3e-3e63-4c2f-b851-1e0241b26c1c', '2023-08-12 16:30:01', '2023-08-12 16:30:01'),
('a50a9774-62c4-47ec-aac2-8f70d6385a38', 'not_accepted', '6cc3f8eb-1913-4dfe-a752-0cb8456aea88', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-27 18:31:08', '2023-10-27 18:31:08'),
('a85c8549-3946-49e2-a6e7-50f8d2e67683', 'accepted', 'ae639bb6-4de0-4ade-bcd0-d8e26c724711', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-04 00:47:00', '2023-11-04 00:48:23'),
('abda86fa-cfe5-48a5-a588-4bd3537e0093', 'not_accepted', '40500b50-7c83-4f1d-858f-270decd2f9ef', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 16:57:34', '2023-08-22 16:57:34'),
('b19b635f-d1d5-4ec4-98fe-c01499e5fbba', 'not_accepted', '32eaca7f-95b1-4909-8791-f9e2a4eeb3d9', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-27 18:17:49', '2023-10-27 18:17:49'),
('b3538a41-647e-4624-929d-e73465150e1c', 'accepted', '4505031b-5094-4a68-93da-40daf514d915', '476ff7ad-7d9d-4207-a02d-6d35f375730b', '2023-08-23 16:05:30', '2023-08-23 16:05:59'),
('b78c53d9-b558-4f41-98ae-abb348910759', 'accepted', 'ab30285a-cf4d-45e7-807d-ad199deeb68c', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-08-15 00:21:27', '2023-08-15 00:23:02'),
('b7d73460-8494-4169-9d03-9f021206f506', 'accepted', 'dfb1543a-1465-4cc4-a9e4-e1e0c0b9729e', '852d76b7-0396-484b-a1da-81e627069be0', '2023-10-30 02:59:09', '2023-10-30 03:02:06'),
('b8295d6a-f9e3-4e5f-b21a-ab72b6baee57', 'accepted', '6a691507-ee69-4c2f-8d0e-b0179eff8d73', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-19 01:49:34', '2023-11-19 01:50:08'),
('c250408d-febb-4182-88a6-89b5fb5fcf24', 'accepted', 'ccc7f265-3b26-47fa-b756-391d92fbe390', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 04:42:05', '2023-08-22 04:42:52'),
('c8479638-7a8b-42e1-afb0-ffe2b8df85bb', 'accepted', '4a60e4b3-7da1-441e-991b-969696650fdb', 'b7a5e556-cedd-47f7-a52f-a622abbcb233', '2023-08-20 15:06:58', '2023-08-20 15:07:21'),
('c8f6cc51-0a61-4e06-9f51-921e4c61d78e', 'not_accepted', 'dd3f0a1b-9328-4b88-9e34-29a53b485584', '6bdbe144-56d0-43ae-b50f-e65d88d68787', '2023-11-20 22:21:42', '2023-11-20 22:21:42'),
('d013d574-2ab7-4587-a56f-4bb0fe4725ef', 'not_accepted', '4a60e4b3-7da1-441e-991b-969696650fdb', 'e483a3d0-e520-4709-baad-d7e500389c77', '2023-08-20 15:08:26', '2023-08-20 15:08:26'),
('d32a3d9f-76ca-4f2b-bf41-5a0e399fc69b', 'not_accepted', '525ae5a7-2543-488e-bee1-a4d2c735f28e', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 17:01:09', '2023-08-22 17:01:09'),
('d76ade7e-0b9c-4b86-8dcc-1319d022b969', 'not_accepted', '3ca46586-183b-4453-83fc-77a47bbf1c92', 'edd71a5d-f4ed-49bb-9d13-23e21975642e', '2023-09-22 04:32:51', '2023-09-22 04:32:51'),
('e24cfb8e-b852-4cb4-a3ce-61946ebf7833', 'accepted', '5621ec74-5dba-4d46-a26c-447e4bb9ace6', '5fb024a2-c01e-490d-affd-6c18d8fc64a2', '2023-12-13 21:25:24', '2023-12-13 21:25:57'),
('ea11d2c0-d3c3-432b-bb51-317e3e722e6a', 'not_accepted', '525ae5a7-2543-488e-bee1-a4d2c735f28e', '476ff7ad-7d9d-4207-a02d-6d35f375730b', '2023-08-22 17:01:09', '2023-08-22 17:01:09'),
('f07ad94d-54f2-4023-a5fa-0fe8ca247aa6', 'not_accepted', '0c4c09bf-77ed-4c75-a61c-5a55895a3889', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-27 18:23:15', '2023-10-27 18:23:15'),
('f206e806-e12e-46bc-a899-8b9dfcbb7d9e', 'not_accepted', '3aa9e20b-2705-4ccd-89fa-89e6d9e12650', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-24 20:33:52', '2023-10-24 20:33:52'),
('f44df7d0-807f-4749-abee-3fcb867a92c7', 'accepted', '6cc3f8eb-1913-4dfe-a752-0cb8456aea88', 'ff4f1965-7068-4d8c-a7e4-b448830ccaed', '2023-10-27 18:31:08', '2023-10-27 18:31:31'),
('f4d76cde-3fdd-4209-9a6a-509f3c09e268', 'accepted', '27aa92d7-671d-4e20-97e2-135d6cbb46a3', 'ebf3adb2-f4d7-4b86-bc45-4f0da3edebcd', '2023-08-22 02:45:07', '2023-08-22 02:46:13'),
('f8725cb7-d145-480c-9455-79f9fc5c2ba8', 'accepted', '7bc4ef43-3415-46df-8e46-62c61f22bba1', '0cc9bc1e-83e6-4d68-95f9-e32a833d3b06', '2023-08-22 14:46:53', '2023-08-22 14:47:16'),
('fcc5ad83-349d-4a05-93ad-5fb7e7f0fff5', 'not_accepted', 'ad38cd9b-89be-4592-9965-a2fd57c3c992', 'f7dce302-652b-4950-b225-e80c69236f80', '2023-10-23 20:07:37', '2023-10-23 20:07:37');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `products`
--

CREATE TABLE `products` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `ar_slug` varchar(191) DEFAULT NULL,
  `en_slug` varchar(191) DEFAULT NULL,
  `en_overview` longtext DEFAULT NULL,
  `ar_overview` longtext DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `price_after_discount` double(8,2) DEFAULT NULL,
  `discount_percentage` int(11) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `categorization_id` char(36) DEFAULT NULL,
  `views_count` int(11) NOT NULL DEFAULT 0,
  `average_rate` int(11) NOT NULL DEFAULT 0,
  `type` enum('one_option','multiple_options') NOT NULL DEFAULT 'one_option',
  `status` enum('publish','pending') NOT NULL DEFAULT 'publish',
  `discount_id` char(36) DEFAULT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `data_country_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_code` varchar(191) DEFAULT NULL,
  `unit_value` decimal(8,2) NOT NULL DEFAULT 1.00,
  `package_amount` double(10,2) DEFAULT NULL,
  `package_price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `products`
--

INSERT INTO `products` (`id`, `en_name`, `ar_name`, `ar_slug`, `en_slug`, `en_overview`, `ar_overview`, `price`, `price_after_discount`, `discount_percentage`, `category_id`, `categorization_id`, `views_count`, `average_rate`, `type`, `status`, `discount_id`, `creator_id`, `data_country_id`, `deleted_at`, `created_at`, `updated_at`, `unit_code`, `unit_value`, `package_amount`, `package_price`) VALUES
('097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', 'تكه', 'صاروخ تكه', 'صاروخ-تكه', 'tkh', 'لق', 'ستر', 20.00, 20.00, 0, '5062a344-ee0f-4ec1-8e19-9ce5b3a1695c', '48c5b450-47ce-4e44-917e-c844eaec5d65', 15, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-06 19:27:12', '2023-12-14 02:14:48', NULL, 1.00, NULL, NULL),
('0ce5bb80-c155-4ec8-9477-222f75b81de5', 'Oman', 'Oman', 'Oman', 'oman', 'Hello brother Shahzad from muscat mabelah want', 'Hello brother Shahzad', 366.00, 366.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 46, 0, 'one_option', 'publish', NULL, '59d76e96-8b5e-4300-b85e-f6d465fc928f', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-07 13:53:48', '2023-07-13 23:59:46', NULL, 1.00, NULL, NULL),
('10219638-e508-40f2-8667-1cf70ba474ab', 'رمان', 'عصير رمان', 'عصير-رمان', 'rman', 'غريب', 'عبدالله العثيم', 15.00, 15.00, 0, '382298b0-a234-47f4-9a1f-faaeb5ca9825', '48c5b450-47ce-4e44-917e-c844eaec5d65', 22, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-06 19:15:03', '2023-12-29 05:46:18', NULL, 1.00, NULL, NULL),
('12d3a5ba-8b7e-454f-b86b-6c4b6dddcd57', 'جروب', 'بقاله', 'بقاله', 'grob', 'ما شي فايده', 'هلا الشيخ حمود', 965.00, 965.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-07-15 01:16:26', '2023-07-15 01:15:11', '2023-07-15 01:16:26', NULL, 1.00, NULL, NULL),
('1846fda4-1922-4454-bc6d-a6c69f9379d6', 'Pizza role', 'بيتزا رول', 'بيتزا-رول', 'pizza-role', 'Pizza role', 'بيتزا رول', 500.00, NULL, NULL, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 9, 4, 'one_option', 'publish', NULL, 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-04 22:42:27', '2023-06-16 16:44:56', NULL, 1.00, NULL, NULL),
('185263e6-7fc2-41c1-abaa-a4e4d6d82d76', 'بقاله', 'جروب', 'جروب', 'bkalh', 'هلا', 'هلا وعليكم السلام ورحمة الله وبركاته', 36.00, 18.00, 50, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 85, 0, 'one_option', 'publish', NULL, 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-10-11 13:21:12', '2023-10-27 18:31:02', NULL, 1.00, NULL, NULL),
('1bdfb31a-72e6-4195-b608-028e4337c550', 'Oman', 'جروب', 'جروب', 'oman', 'Hello brother', 'هلا والله', 3655.00, NULL, NULL, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '8511ab31-ce79-4306-825c-8ff5552f80e4', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-06-22 17:02:31', '2023-06-22 17:03:13', NULL, 1.00, NULL, NULL),
('1e8b8141-3735-43ae-b5c0-d374ac487657', 'Oman', 'Oman', 'Oman', 'oman', 'Hello brother Shahzad Flow SwiftKey', 'Hello sister SwiftKey Flow SwiftKey', 366.00, 366.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '82fba06d-eac5-487e-9919-f261ec20667f', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-29 15:38:25', '2023-06-29 15:38:09', '2023-06-29 15:38:25', NULL, 1.00, NULL, NULL),
('241d7615-c96e-4ce9-850c-21e7436d8a87', 'كروسون', 'كروسون', 'كروسون', 'kroson', 'شكرا', 'غريب', 12.00, 12.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 7, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-07 02:01:50', '2023-12-14 02:12:34', NULL, 1.00, NULL, NULL),
('247aff22-c120-4cad-8930-3efda6a906d2', 'عبدالله', 'عبدالرحمن', 'عبدالرحمن', 'aabdallh', 'عبدالله العثيم', 'عبدالله العثيم', 99.00, 99.00, 0, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 21, 0, 'one_option', 'publish', NULL, '28b1178e-0380-4440-862c-96e27d2ad2d2', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-10-30 02:44:39', '2023-11-01 23:34:49', NULL, 1.00, NULL, NULL),
('2767bad9-fced-4621-a584-110e80c7a37f', 'ليالي', 'ليالي', 'ليالي', 'lyaly', 'ما اعرف', 'نوره من الربح', 36.00, 36.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 43, 0, 'one_option', 'publish', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-15 01:49:36', '2023-07-24 18:11:31', NULL, 1.00, NULL, NULL),
('29851491-b8ae-4443-9dbe-8af21e1e4522', 'كيك', 'كيك', 'كيك', 'kyk', 'كيك', 'كيك', 0.80, 0.80, 0, '3c11a0d7-3dff-4c75-9cd7-e319f08b4546', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 12:34:14', '2023-12-08 21:53:04', '2024-09-30 12:34:14', NULL, 1.00, NULL, NULL),
('29ef5a1f-5f3e-42c8-850d-0216fc14bab9', 'جروب', 'جروب', 'جروب', 'grob', 'هلا الشيخ علي', 'عندي تطبيق مثل طلبات', 33.00, 33.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 14, 0, 'one_option', 'publish', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-15 01:46:32', '2023-07-24 17:55:08', NULL, 1.00, NULL, NULL),
('2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', 'خ', 'خدمه', 'خدمه', 'kh', 'ا', '<p>ت</p>', 36.00, 36.00, 0, '6bf77526-ebbb-4c42-b7e7-5046d5501e44', '48c5b450-47ce-4e44-917e-c844eaec5d65', 101, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 12:34:19', '2023-11-03 22:17:41', '2024-09-30 12:34:19', NULL, 1.00, NULL, NULL),
('312603c5-a830-4b15-921b-32a1b085bf5a', 'service', 'خدمه', 'خدمه', 'service', 'Description', 'وصف', 20.00, 10.00, 50, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 38, 0, 'one_option', 'publish', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-13 23:57:15', '2023-12-29 16:40:53', NULL, 1.00, NULL, NULL),
('320896db-67be-4d28-842a-ee3f82c25b9e', 'Food Service Arbic', 'ماكولات عرييه', 'ماكولات-عرييه', 'food-service-arbic', 'Food service director of the year', '<p>مأكولات ومشروبات وصفات طبخ عربيه</p>', 15.00, NULL, NULL, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 4, 2, 'one_option', 'pending', NULL, '466ee50d-041d-423c-9bfb-c3368a7590f6', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-06-14 11:45:07', '2023-06-22 16:51:23', NULL, 1.00, NULL, NULL),
('380e263e-99c7-4366-b4de-5b0c4d2d9cdb', 'عندي', 'عندي', 'عندي', 'aandy', '<p>اقولك ما فيه مشكله </p>', '<p>اقولك ما فيه مشكله </p>', 654.00, 654.00, 0, '5062a344-ee0f-4ec1-8e19-9ce5b3a1695c', '48c5b450-47ce-4e44-917e-c844eaec5d65', 4, 0, 'one_option', 'publish', NULL, '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-12 05:34:29', '2024-10-01 08:24:09', NULL, 1.00, NULL, NULL),
('39dc61dd-0f6b-40b6-94a7-66c4815699f1', 'بقاله', 'بقاله مسقط', 'بقاله-مسقط', 'bkalh', 'هلا اخي الكريم', 'هلا اخي شهزاد انت', 3588.00, 3588.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 1, 0, 'one_option', 'publish', NULL, '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-04 13:32:00', '2023-07-05 13:42:52', NULL, 1.00, NULL, NULL),
('3e6e259a-3969-4168-a924-9dbf1f296f03', 'حلو', 'حلو', 'حلو', 'hlo', 'حلو', 'حلو', 36.00, 36.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 44, 0, 'one_option', 'publish', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-07 00:23:15', '2023-08-15 00:21:18', NULL, 1.00, NULL, NULL),
('44de3aef-296a-4db9-8027-ffbeb314b0d3', 'شاورما', 'شاورما عربي', 'شاورما-عربي', 'shaorma', 'شاورما', 'شاورما', 16.00, 16.00, 0, '7d9605af-06c0-41bd-b281-2369f1796008', '48c5b450-47ce-4e44-917e-c844eaec5d65', 8, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-09-30 12:35:59', '2023-12-08 03:38:42', '2024-09-30 12:35:59', NULL, 1.00, NULL, NULL),
('47e309f0-1427-40ca-b3ad-45792c8419a7', 'بقاله', 'علي', 'علي', 'bkalh', 'وووووينك', 'زين طيب', 35.00, 35.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 3, 0, 'one_option', 'publish', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-15 01:47:42', '2023-07-16 02:59:14', NULL, 1.00, NULL, NULL),
('4eda59cd-63a4-4042-bb6c-c752b6e3a476', 'جروب', 'جروب', 'جروب', 'grob', 'هلا', 'هلا', 36.00, 36.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 16, 0, 'one_option', 'publish', NULL, '329b6a7b-c11a-4533-941a-7747b2615d9b', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-25 00:34:02', '2023-07-25 01:43:33', NULL, 1.00, NULL, NULL),
('5321ae43-adc4-42e1-a5a3-79078cc7efc8', 'Oman', 'Oman', 'Oman', 'oman', 'Hello sister', 'Hello brother', 3658.00, 2560.60, 30, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 2, 0, 'one_option', 'publish', NULL, '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-06-25 21:25:15', '2023-06-26 02:46:06', NULL, 1.00, NULL, NULL),
('5796b732-9477-4ff1-999b-e608b5a21401', 'mtv', 'mtv', 'mtv', 'mtv', NULL, NULL, 222.00, 222.00, 0, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 0, 0, 'one_option', 'publish', NULL, '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-10-01 08:22:51', '2024-09-30 16:50:37', '2024-10-01 08:22:51', NULL, 1.00, NULL, NULL),
('5fc5dc73-7159-4c15-b9ac-74d5edff72b0', 'خبز', 'خبز', 'خبز', 'khbz', 'خبز', 'خبز', 0.10, 0.10, 0, 'c56cc156-8df2-4bd7-ba9e-b25c9a305626', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-08 21:49:36', '2023-12-08 21:49:36', NULL, 1.00, NULL, NULL),
('613a9f66-ff09-4e62-b3b4-48102d80c124', 'Name', 'Name', 'Name', 'name', 'description', 'description', 100.00, 100.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-29 07:49:36', '2023-06-29 07:49:36', NULL, 1.00, NULL, NULL),
('678b52f0-7df2-4d8d-b269-4d1b4f117b1c', 'rrr', 'rrr', 'rrr', 'rrr', '<p>aa</p>', '<p>aa</p>', 1223.00, 1223.00, 0, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 0, 0, 'one_option', 'publish', NULL, '146de26b-2521-4b4b-9002-6926d134ca36', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2024-10-01 08:23:12', '2024-09-30 16:43:30', '2024-10-01 08:23:12', NULL, 1.00, NULL, NULL),
('6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', 'ريم', 'ريم', 'ريم', 'rym', 'هلا وغلا', 'هلا وغلا', 50.00, 50.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 106, 0, 'one_option', 'publish', NULL, 'fb751d69-9fe2-4017-948f-134a1117c41f', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-20 14:12:29', '2023-09-05 02:33:57', NULL, 1.00, NULL, NULL),
('7411e939-8c78-43ff-9f2e-b434e7ecbadd', 'حليب', 'حليب', 'حليب', 'hlyb', 'حليب', 'حليب', 25.00, 25.00, 0, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 2, 0, 'one_option', 'publish', NULL, '3901e59b-89c7-4d6a-9544-ebc43571261b', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-28 17:55:21', '2023-12-11 21:35:23', NULL, 1.00, NULL, NULL),
('764bef8b-bbc8-4540-acf2-1da86a3b49e7', 'بقاله', 'بقاله', 'بقاله', 'bkalh', 'هلا اخي', 'هلا اخي', 15.00, 15.00, 0, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 0, 0, 'one_option', 'publish', NULL, '3901e59b-89c7-4d6a-9544-ebc43571261b', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-11-29 03:52:01', '2023-11-29 03:52:35', NULL, 1.00, NULL, NULL),
('77ed4473-580c-4279-9221-e2482c16e790', 'Oman', 'Oman', 'Oman', 'oman', 'Hello brother Shehzad Flow SwiftKey Flow', 'Hello sister SwiftKey evening SwiftKey Flow 1', 369.00, 369.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '82fba06d-eac5-487e-9919-f261ec20667f', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-06-29 15:39:04', '2023-06-29 15:39:04', NULL, 1.00, NULL, NULL),
('8279a72c-57d3-406f-b307-b2b3fb461605', 'djkhdfsjh', 'djkhdfsjh', 'djkhdfsjh', 'djkhdfsjh', '<p>dfjhjkawhkofh kpd</p>', '<p>dfjhjkawhkofh kpd</p>', 553.00, 541.94, 2, '6f12f592-7059-4352-91af-49f697583517', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, '146de26b-2521-4b4b-9002-6926d134ca36', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', NULL, '2024-12-27 12:41:51', '2024-12-27 12:41:51', 'KG', 0.98, 53.00, 34.00),
('931a815e-bbe6-41f4-a772-73e79f45e556', 'وجبه بروست', 'وجبه بروست', 'وجبه-بروست', 'ogbh-brost', '<p>وجبة بروست 3 قطع حار</p>', '<p>وجبة بروست 3 قطع حار</p>', 5.00, NULL, NULL, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '146de26b-2521-4b4b-9002-6926d134ca36', NULL, NULL, '2023-05-30 21:38:17', '2023-05-30 21:38:17', NULL, 1.00, NULL, NULL),
('99c9cb82-c19e-43df-889b-98c4d8f8f2a8', 'قاصد', 'هلا', 'هلا', 'kasd', 'ياخي', 'اخبارك', 36.00, 36.00, 0, 'd897ee02-db56-402b-9477-e045f92cf2c1', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 70, 0, 'one_option', 'publish', NULL, 'f63ba367-6a3c-486b-8181-5e474c6a6369', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-09-05 02:31:15', '2023-09-22 14:59:37', NULL, 1.00, NULL, NULL),
('aac4e447-3987-4a2b-b823-3bfb1bc6e907', 'سمك', 'سمك مشوي', 'سمك-مشوي', 'smk', 'سمك', 'سمك', 26.00, 26.00, 0, '546e2776-239d-46f4-8c13-06e294ca9a42', '48c5b450-47ce-4e44-917e-c844eaec5d65', 30, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-08 03:37:08', '2023-12-29 16:41:29', NULL, 1.00, NULL, NULL),
('b0f8aff2-767e-4f6e-aa8f-ec20a166434a', 'حلاوه', 'حلاوه', 'حلاوه', 'hlaoh', 'حلوه', 'حلوه', 55.00, 55.00, 0, 'ab18dda2-8ed7-4cee-86b1-04597f76558b', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-08 21:51:27', '2023-12-08 21:51:27', NULL, 1.00, NULL, NULL),
('b20aa422-0935-468c-98b7-1f6fde6b8a1d', 'جميل', 'جميل', 'جميل', 'gmyl', 'جميله', 'جميل', 50.00, 50.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 37, 0, 'one_option', 'publish', NULL, '83cda510-0304-479b-a98f-7b7c8140fd0f', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-08-07 00:25:43', '2023-08-08 20:09:56', NULL, 1.00, NULL, NULL),
('b3249b74-12a4-49ce-84b2-79e084e8df32', 'جح', 'جح', 'جح', 'gh', 'جح', 'جح', 0.96, 0.96, 0, '04cce9a2-eea8-48e5-a6d7-717cc834bef8', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-08 21:54:30', '2023-12-08 21:54:30', NULL, 1.00, NULL, NULL),
('bc752484-1b34-4046-a0a7-b7c6e3172d8c', 'بقاله مسقط', 'بقاله مسقط', 'بقاله-مسقط', 'bkalh-mskt', 'هت مرحبا', 'قلت لك', 32.00, 32.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 9, 0, 'one_option', 'publish', NULL, '642ef59f-9127-4799-a724-93de4af6c3d0', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-15 01:17:08', '2023-07-22 21:54:02', NULL, 1.00, NULL, NULL),
('bcd9b587-b666-4ce2-9021-4064c8720407', 'لبن', 'لبن', 'لبن', 'lbn', 'لبن', 'لبن', 0.75, 0.75, 0, '6f12f592-7059-4352-91af-49f697583517', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-08 21:48:35', '2023-12-08 21:48:35', NULL, 1.00, NULL, NULL),
('c30cfd3c-280f-45a6-8e4d-efaae17ddaed', 'جابر', 'حسين', 'حسين', 'gabr', 'سالم', 'علي', 36.00, 36.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 29, 0, 'one_option', 'publish', NULL, 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-25 01:53:22', '2023-07-30 18:41:56', NULL, 1.00, NULL, NULL),
('c3dd959c-a909-43cb-984e-2527e6f98b45', 'Testing Product', 'Testing Product', 'Testing-Product', 'testing-product', '<p>Special Product</p>', '<p>Special Product</p>', 30.00, 27.60, 8, 'd897ee02-db56-402b-9477-e045f92cf2c1', '830caf4a-faaf-445b-aa0c-bf5836e8ae10', 0, 0, 'one_option', 'publish', NULL, '146de26b-2521-4b4b-9002-6926d134ca36', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', NULL, '2024-12-23 14:06:00', '2024-12-23 14:23:48', 'KG', 1.00, 12.00, 250.00),
('cafd0959-f830-454b-b388-abe599594fa8', 'جروب', 'بقاله مسقط', 'بقاله-مسقط', 'grob', 'هلا', 'ماليي', 36.00, 36.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 1, 0, 'one_option', 'publish', NULL, '74062592-eb3d-452b-bd1b-bc35ff497d9a', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-07-25 00:27:34', '2023-07-25 00:27:51', NULL, 1.00, NULL, NULL),
('e6d05d75-0eb8-4ed5-ad66-a9c50e7dcbef', 'nname', 'name', 'name', 'nname', 'description', 'description', 100.00, 100.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 0, 0, 'one_option', 'publish', NULL, '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-07-08 10:06:55', '2023-06-29 17:21:07', '2023-07-08 10:06:55', NULL, 1.00, NULL, NULL),
('ea8bce24-d55c-402f-bd18-aea0afb11aa4', 'عايش', 'خالد', 'خالد', 'aaaysh', 'صل', 'تمام', 96.00, 96.00, 0, '10e4a82b-a330-4158-80b9-f8a8323f8d7c', '071964b7-d388-4033-a6eb-33414b1d8a50', 1, 0, 'one_option', 'publish', NULL, '85922729-2c24-4638-afe2-db5cc99daeb5', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-09-05 13:05:54', '2023-09-07 02:08:19', NULL, 1.00, NULL, NULL),
('ed238263-fd1f-4c67-8008-2bbbcfc303b6', 'كبسه', 'كباب', 'كباب', 'kbsh', 'هلا', 'الذ واشهى', 36.00, 36.00, 0, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 7, 0, 'one_option', 'publish', NULL, '74062592-eb3d-452b-bd1b-bc35ff497d9a', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-07-25 00:26:27', '2023-07-24 18:20:43', '2023-07-25 00:26:27', NULL, 1.00, NULL, NULL),
('f692fc9c-9601-4712-8baa-1565ab065fd4', 'name', 'name', 'name', 'name', 'Desc', 'Desc', 100.00, 75.00, 25, '5e754c1c-4727-49af-b0a7-e2130c1423d2', '48c5b450-47ce-4e44-917e-c844eaec5d65', 3, 0, 'one_option', 'publish', NULL, 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '2023-06-24 01:49:04', '2023-06-24 02:24:41', NULL, 1.00, NULL, NULL),
('fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', 'كباب', 'كباب', 'كباب', 'kbab', 'عبدالله بالخير', 'عبدالله بالخير', 20.00, 20.00, 0, '5062a344-ee0f-4ec1-8e19-9ce5b3a1695c', '48c5b450-47ce-4e44-917e-c844eaec5d65', 35, 0, 'one_option', 'publish', NULL, '0ba64045-8b10-41e9-bf3a-61cf538124ff', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '2023-12-05 04:24:08', '2023-12-29 17:34:42', NULL, 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_additions`
--

CREATE TABLE `product_additions` (
  `id` char(36) NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `product_additions`
--

INSERT INTO `product_additions` (`id`, `price`, `en_name`, `ar_name`, `product_id`, `group_id`, `created_at`, `updated_at`) VALUES
('24cbe5f9-422a-4be5-8e85-995aa51f9fcc', 0.20, 'نزين', 'نزين', '241d7615-c96e-4ce9-850c-21e7436d8a87', NULL, '2023-12-07 02:01:50', '2023-12-07 02:01:50'),
('396f1e5d-de60-4b77-af64-ea154150419c', 30.00, 'واير', 'واير', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-14 06:30:55', '2023-10-14 06:30:55'),
('6597dba5-31a2-4df9-9cf7-2acb04742295', 200.00, 'كاتشب', 'كاتشب', '1846fda4-1922-4454-bc6d-a6c69f9379d6', NULL, '2023-06-13 02:55:07', '2023-06-13 02:55:07'),
('6b8ae4a2-fcf5-4cb8-aca0-3e5cbae24f0d', 30.03, 'ثوم', 'ثوم', '247aff22-c120-4cad-8930-3efda6a906d2', NULL, '2023-10-30 02:44:39', '2023-10-30 02:44:39'),
('8124ecf1-bfe5-48b6-836c-f27192a815da', 3.00, 'مكتب', 'مكتب', '764bef8b-bbc8-4540-acf2-1da86a3b49e7', NULL, '2023-11-29 03:52:35', '2023-11-29 03:52:35'),
('b30539e7-0141-400f-9c94-137c9260e8b4', 6.00, 'حليب', 'حليب', '7411e939-8c78-43ff-9f2e-b434e7ecbadd', NULL, '2023-11-29 03:49:56', '2023-11-29 03:49:56');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_categories`
--

CREATE TABLE `product_categories` (
  `id` char(36) NOT NULL,
  `product_id` char(36) DEFAULT NULL,
  `category_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_colors`
--

CREATE TABLE `product_colors` (
  `id` char(36) NOT NULL,
  `product_id` char(36) DEFAULT NULL,
  `color_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_group_additions`
--

CREATE TABLE `product_group_additions` (
  `id` char(36) NOT NULL,
  `en_name` varchar(191) NOT NULL,
  `ar_name` varchar(191) NOT NULL,
  `type` enum('multiple_options_group_type','one_option_group_type','options_with_counter_group_type') NOT NULL DEFAULT 'one_option_group_type',
  `product_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_orders`
--

CREATE TABLE `product_orders` (
  `id` char(36) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `final_price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `order_id` char(36) DEFAULT NULL,
  `creator_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `variation_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `product_orders`
--

INSERT INTO `product_orders` (`id`, `quantity`, `price`, `final_price`, `order_id`, `creator_id`, `product_id`, `variation_id`, `created_at`, `updated_at`) VALUES
('00c7c4c0-2027-477b-9432-5a909dd3add4', 1, 50.00, 50.00, 'c025676a-0e46-4e32-9f50-f15b621db20d', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-07 21:44:26', '2023-08-07 21:44:26'),
('01ad205e-a5c2-4625-b245-6b6d6ad4c3c6', 1, 36.00, 36.00, '9f4a8e1d-90bd-4de0-a8f1-aa2ccd283a0a', '329b6a7b-c11a-4533-941a-7747b2615d9b', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', NULL, '2023-07-25 01:27:22', '2023-07-25 01:27:22'),
('032604c0-b60c-4258-be60-73d86848d0fb', 1, 36.00, 36.00, 'dd2b048c-4b9a-4824-bb70-219490cfbc38', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-23 16:57:19', '2023-07-23 16:57:19'),
('04b94ded-dcac-444d-b3b6-7eb135fa2965', 2, 20.00, 40.00, 'ac510889-b314-4fbc-ae3e-bd389cf9c590', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:26:40', '2023-12-14 02:26:40'),
('04c5371e-62b7-4edb-84da-a11fdc3eda2e', 1, 36.00, 36.00, '3ca46586-183b-4453-83fc-77a47bbf1c92', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-22 04:32:51', '2023-09-22 04:32:51'),
('06e86b19-3701-4b38-bcd2-d2c54eba2c77', 1, 50.00, 50.00, 'e64d0914-3f3c-4671-86a6-71d05d107e2d', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 01:33:58', '2023-08-08 01:33:58'),
('0b0562de-ebf2-4e85-9d09-8b320a070ba4', 1, 35.00, 35.00, '7ceb1b85-2b15-4af5-a1f5-48584fcee416', '642ef59f-9127-4799-a724-93de4af6c3d0', '47e309f0-1427-40ca-b3ad-45792c8419a7', NULL, '2023-07-16 02:59:37', '2023-07-16 02:59:37'),
('0cf4cf45-ff83-4d01-9789-fb4f68655a6a', 2, 36.00, 72.00, '018205f3-93b8-4d8d-abce-916375e60cfb', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-26 15:22:34', '2023-11-26 15:22:34'),
('0d9b1862-00c5-4262-8e22-5535975d3f39', 1, 32.00, 32.00, '89dc2f51-91c3-453d-9827-3043a9f2d221', '642ef59f-9127-4799-a724-93de4af6c3d0', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', NULL, '2023-07-15 23:17:31', '2023-07-15 23:17:31'),
('12a1130e-7c83-4075-b503-d3be17a4f8c3', 1, 35.00, 35.00, 'a2397ce2-758e-47e1-a94f-f66c36afa66c', '642ef59f-9127-4799-a724-93de4af6c3d0', '47e309f0-1427-40ca-b3ad-45792c8419a7', NULL, '2023-07-17 14:00:33', '2023-07-17 14:00:33'),
('12b9ed56-9757-4089-8dca-edb6c61a7d68', 1, 18.00, 18.00, '7dad48e8-055e-4a2c-9f6c-489fc2fd4c1b', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-22 01:17:14', '2023-10-22 01:17:14'),
('14bdcc41-03da-4122-bc6f-b73e60d686df', 1, 36.00, 36.00, '77345082-f275-47e8-a5be-a43e481084e0', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-07 02:46:29', '2023-09-07 02:46:29'),
('16023f0f-31dd-4158-a1fa-5da290b010a1', 2, 15.00, 30.00, '6003e427-ee5e-401e-82a4-fd73e2f0b49f', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '10219638-e508-40f2-8667-1cf70ba474ab', NULL, '2023-12-14 02:30:19', '2023-12-14 02:30:19'),
('1af2a17a-48ba-497b-bad3-b4a2c0413e34', 1, 18.00, 18.00, '0c4c09bf-77ed-4c75-a61c-5a55895a3889', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-27 18:23:15', '2023-10-27 18:23:15'),
('1dbcae2a-e706-4f5a-a681-db3613784ded', 1, 36.00, 36.00, '375f3156-547f-430e-814c-e6018de96fe6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-26 15:21:12', '2023-11-26 15:21:12'),
('1f07f624-e464-4665-a5e3-d9fbb435cd5f', 3, 20.00, 60.00, '47fc4048-3d4c-44ab-bf9c-f9e83ff77fff', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-07-24 14:55:41', '2023-07-24 14:55:41'),
('1f9ac457-1a71-4d33-b961-1762713672c9', 1, 50.00, 50.00, '40500b50-7c83-4f1d-858f-270decd2f9ef', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 16:57:34', '2023-08-22 16:57:34'),
('1fd0bb03-1cf0-4a82-a516-5f9af8419363', 1, 36.00, 36.00, '33f90a79-8e58-4c49-b93b-86ad1813b075', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 17:33:48', '2023-07-22 17:33:48'),
('20661e26-ca92-4193-8f7f-4ff53f96085e', 1, 36.00, 36.00, 'ad38cd9b-89be-4592-9965-a2fd57c3c992', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-23 20:07:37', '2023-10-23 20:07:37'),
('23f2c591-0487-4645-970d-4fe496b8640e', 3, 36.00, 108.00, '71b087c3-4fc6-44f2-8539-fb9269f692c0', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-26 15:25:10', '2023-11-26 15:25:10'),
('250f83d9-fe7f-4ddb-a52d-5727674c9245', 3, 18.00, 54.00, '3aa9e20b-2705-4ccd-89fa-89e6d9e12650', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-24 20:33:52', '2023-10-24 20:33:52'),
('25be0605-d2a5-427e-82c2-f75b0b7aae5d', 3, 50.00, 150.00, '27aa92d7-671d-4e20-97e2-135d6cbb46a3', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 02:45:06', '2023-08-22 02:45:06'),
('286e58c9-33b8-411b-89e7-e4390bb89099', 1, 50.00, 50.00, '89c72b26-c1e0-4245-a7f5-0849977fca18', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 02:27:25', '2023-08-08 02:27:25'),
('2ac2de2c-6331-4dbb-afee-981cccbca178', 1, 36.00, 36.00, 'f141d485-1a43-4da5-8747-a0e629b3bcda', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-16 03:03:37', '2023-07-16 03:03:37'),
('2d7d185d-9638-49ca-bc59-5b2624967cf1', 1, 33.00, 33.00, '67498ee6-21e4-4431-8f87-22ac9ccad069', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-22 17:09:03', '2023-07-22 17:09:03'),
('2fd10f76-91f5-4dd9-b422-4d4704c8b1a5', 1, 18.00, 18.00, '8e2db63f-83c3-43be-8e25-6d3a9190a6ed', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-22 00:46:24', '2023-10-22 00:46:24'),
('3452dd1a-3df9-419b-8e32-86127b5f74e8', 8, 36.00, 288.00, 'a36d592e-3c77-4985-ba26-6e1d68fc5f2c', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-05 02:43:16', '2023-09-05 02:43:16'),
('3686a104-fe0c-4b06-91e6-9559d779d643', 1, 36.00, 36.00, '052ad607-a446-44db-a49d-ae7f3bbdbf65', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-05 02:38:13', '2023-09-05 02:38:13'),
('36c94906-8db3-4a6a-926d-04529faa58c5', 1, 50.00, 50.00, '27daf66d-c799-4da9-b018-5f6a4c085483', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-07 06:31:55', '2023-08-07 06:31:55'),
('3853e24a-a574-49e3-94c4-b756ca31b90a', 1, 18.00, 18.00, '85d41f87-4b2e-4cf3-b675-bc49e8dca33b', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-24 20:36:47', '2023-10-24 20:36:47'),
('391caecb-dd12-45b7-8eaf-672e66edbba4', 1, 50.00, 50.00, 'c21db79d-16f1-4e79-922d-e3bab35fe7ab', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 02:46:58', '2023-08-22 02:46:58'),
('39f591ed-11b8-4595-8241-8b2513f0c746', 1, 50.00, 50.00, '8d5ddeac-e2fd-4744-8736-be3eed190441', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 01:47:06', '2023-08-08 01:47:06'),
('3abf3452-b276-45be-b6fb-d41c9cc1f3e5', 1, 36.00, 36.00, 'ab30285a-cf4d-45e7-807d-ad199deeb68c', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-15 00:21:27', '2023-08-15 00:21:27'),
('3e2c8287-3073-4d07-bf2d-163ae8348d59', 1, 18.00, 18.00, '60b656b1-b013-4dbe-a9f1-1e8de2cfa2c8', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-14 23:39:28', '2023-10-14 23:39:28'),
('3f4a5fff-2a67-45db-8d98-5a8592a50198', 2, 99.00, 198.00, 'dfb1543a-1465-4cc4-a9e4-e1e0c0b9729e', '28b1178e-0380-4440-862c-96e27d2ad2d2', '247aff22-c120-4cad-8930-3efda6a906d2', NULL, '2023-10-30 02:59:09', '2023-10-30 02:59:09'),
('3f9c5979-3c04-400b-8f50-f537860b2c82', 4, 36.00, 144.00, '942264a7-3c0c-4b0f-89b8-af9da18b7bad', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-07 21:47:09', '2023-08-07 21:47:09'),
('4128164a-0c41-4fd7-985e-b9f6ea9bc64c', 13, 50.00, 650.00, '4505031b-5094-4a68-93da-40daf514d915', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-23 16:05:29', '2023-08-23 16:05:29'),
('42841448-2141-4e29-80be-083906ae79df', 1, 50.00, 50.00, '7bc4ef43-3415-46df-8e46-62c61f22bba1', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 14:46:53', '2023-08-22 14:46:53'),
('42f442fd-34a9-48f1-9534-a8e06991de4e', 1, 15.00, 15.00, '9dea2bbb-3004-40b6-92d2-d11fce843558', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '10219638-e508-40f2-8667-1cf70ba474ab', NULL, '2023-12-14 02:52:33', '2023-12-14 02:52:33'),
('433d13c2-6afc-4df9-9c62-ed564cc54807', 1, 36.00, 36.00, 'b92fd6c6-5206-41be-9b68-d10a6ff90351', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-08 20:27:04', '2023-08-08 20:27:04'),
('4398f87c-3682-457e-a71c-ce0f6fb294b3', 1, 36.00, 36.00, '3e311070-f76d-4ea1-bdd5-ffd085b46d28', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-16 02:55:05', '2023-07-16 02:55:05'),
('43e751a7-c0b2-4e12-86b1-929354ebd887', 1, 36.00, 36.00, 'f22f5860-b05c-4649-b637-cc0a4b53e20f', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 17:30:13', '2023-07-22 17:30:13'),
('44694a12-2df1-4480-9f01-8d4aa233dd66', 1, 20.00, 20.00, '591c91ac-5ee7-4a16-80d1-241a76455a28', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-07-22 17:56:11', '2023-07-22 17:56:11'),
('44c4dca0-bd5a-477b-99e7-ce1053b39436', 1, 20.00, 20.00, 'd69da9ad-8b8a-4f9c-a458-31033d731052', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-07-22 17:55:19', '2023-07-22 17:55:19'),
('44c83bb9-6489-4b56-aa85-d3e3cc3b120d', 21, 366.00, 7686.00, '4995078b-8c0d-4f05-8493-53b4961104b0', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-08 22:08:52', '2023-07-08 22:08:52'),
('450fa3da-1699-4651-8c9d-d523f5f9a744', 1, 36.00, 36.00, 'f5092b07-04ba-4843-93c5-75567082d416', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-07 02:09:55', '2023-09-07 02:09:55'),
('467ce2e6-18e5-4f3b-a9bd-5477cf7491e3', 1, 99.00, 99.00, 'ef58b231-0052-45f5-8cb9-9e836a7aef6e', '28b1178e-0380-4440-862c-96e27d2ad2d2', '247aff22-c120-4cad-8930-3efda6a906d2', NULL, '2023-11-01 23:29:00', '2023-11-01 23:29:00'),
('479eae35-9f16-48a9-bab7-d61598be8dd2', 1, 36.00, 36.00, '0170d0cb-cf11-40ae-a75e-bd56c0421827', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-20 22:25:21', '2023-11-20 22:25:21'),
('4851c0b9-55be-4041-b6d6-f226ece4149e', 2, 36.00, 72.00, '44ccd6cc-bbb3-41a0-a42f-db7e1fae445c', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-03 23:18:57', '2023-11-03 23:18:57'),
('48b39e8a-b0e4-4587-93b5-9eefcbf6d777', 1, 36.00, 36.00, 'cf359b4e-fbdb-439a-84f8-7f9946d9702a', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-25 02:05:23', '2023-07-25 02:05:23'),
('494bddb8-0c56-4cf8-9937-b8e6352c0f92', 1, 20.00, 20.00, '31396bf8-8edd-47be-b0d3-1d2af4ff630e', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:45:37', '2023-12-14 02:45:37'),
('4b77c001-1dc9-4ea1-abc4-63b4084a4a9c', 3, 366.00, 1098.00, '780f79bd-2419-4f03-908a-ae9864cddc21', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-10 20:21:47', '2023-07-10 20:21:47'),
('4e404abc-5577-4eb5-b105-bd0ae6da494f', 2, 50.00, 100.00, 'afa57deb-d61b-4c5a-9e4c-a3b649d51bbe', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:39:28', '2023-08-21 13:39:28'),
('4e6d8529-d29e-4146-97c3-e5a18a5b2d31', 1, 36.00, 36.00, 'd47fd691-674e-4206-b479-95952a094b1b', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-25 02:07:08', '2023-07-25 02:07:08'),
('537196d6-d4bb-4dbe-99e8-da3ff3b53432', 1, 50.00, 50.00, 'd516a056-23dc-4ebf-87ac-4dd8b7ba8b0b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 03:25:06', '2023-08-22 03:25:06'),
('550cb9b7-8116-4920-87ce-2387f9ac9e08', 1, 366.00, 366.00, 'c1168d18-ed8a-478c-82f1-2af77b223043', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-10 05:28:49', '2023-07-10 05:28:49'),
('55fdd290-9ae3-434e-ba94-05cbe2310ce2', 2, 366.00, 732.00, '565db297-5c25-4228-a1ba-254ecc73b916', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-12 14:50:45', '2023-07-12 14:50:45'),
('569eda18-685b-40ee-9e79-04201e50c626', 2, 36.00, 72.00, 'bf94bae6-e9ce-4aaf-8083-fbd3fc14d9f3', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-24 18:05:34', '2023-07-24 18:05:34'),
('579546e0-547e-4391-a54a-fd07f0309e91', 2, 500.00, 1000.00, '94e5609a-c06c-422e-aceb-d9854e6fe6ec', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '1846fda4-1922-4454-bc6d-a6c69f9379d6', NULL, '2023-06-14 03:08:10', '2023-06-14 03:08:10'),
('57b2372c-c677-43ae-992a-d1f43d3e2e75', 1, 36.00, 36.00, '78dcf1d1-3b3e-4528-8081-a727d3c85bf1', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-20 22:32:30', '2023-11-20 22:32:30'),
('57b8018c-8082-4225-95da-fb4df69aaf59', 1, 33.00, 33.00, 'c118eda2-7660-4d6b-9033-ebc2217b4e23', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-24 17:55:14', '2023-07-24 17:55:14'),
('5874648e-37bf-4256-ac0c-81f00b7e3ec6', 1, 32.00, 32.00, 'a1ff1560-8661-4d56-ae96-b6ce999b7a0a', '642ef59f-9127-4799-a724-93de4af6c3d0', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', NULL, '2023-07-16 03:13:01', '2023-07-16 03:13:01'),
('587b51aa-8ad5-4779-920a-c9b6dadfa4f0', 1, 35.00, 35.00, 'a6911e1d-caeb-4ea9-a9ea-4d4fc84aee46', '642ef59f-9127-4799-a724-93de4af6c3d0', '47e309f0-1427-40ca-b3ad-45792c8419a7', NULL, '2023-07-15 05:36:39', '2023-07-15 05:36:39'),
('58b7f2bc-3091-47fe-a312-e9b4e1cd080a', 2, 26.00, 52.00, 'c20cc8bb-a9f4-4cbd-8f34-767034233ef4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-13 21:22:26', '2023-12-13 21:22:26'),
('5a7c99b7-7307-42e2-9db9-40c19723a4bb', 4, 20.00, 80.00, '355c29ea-d549-4baa-af43-f758e914fd1f', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', NULL, '2023-12-14 02:15:13', '2023-12-14 02:15:13'),
('5b930470-4d0b-41ca-aea2-f4cf0654392e', 1, 50.00, 50.00, '08dd24e5-f3b1-4b62-8787-3123f035996e', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-07 21:43:14', '2023-08-07 21:43:14'),
('5f51f6b2-5289-4deb-a177-5e0ac2c685d1', 2, 366.00, 732.00, 'ddc716c7-9e1c-4c19-8de1-b01282d80d80', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-10 23:47:24', '2023-07-10 23:47:24'),
('5f6455c0-c734-4c6e-9067-3e32ea2f4b4c', 1, 18.00, 18.00, 'ae639bb6-4de0-4ade-bcd0-d8e26c724711', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-04 00:47:00', '2023-11-04 00:47:00'),
('600c5a94-4509-46f3-98b2-8c67d01a886b', 1, 36.00, 36.00, '33d4fdf7-a6db-4edc-96da-1b8fbaa15b90', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-28 03:32:17', '2023-07-28 03:32:17'),
('635957fd-a7dd-49b7-8ddb-56561941100f', 6, 36.00, 216.00, 'b965f637-f06e-4076-90c7-f61f347aae04', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-18 01:50:36', '2023-11-18 01:50:36'),
('63959114-fe60-47d6-97a4-445e70b7ccc0', 1, 36.00, 36.00, '3a78ec03-35cb-4b14-b4b8-25b8bc737528', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-25 02:01:56', '2023-07-25 02:01:56'),
('67588db8-9b92-4d02-90ba-f0f4c1b66358', 2, 26.00, 52.00, '73896f13-fee7-4f6f-b50e-20571f7235b3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-14 02:36:32', '2023-12-14 02:36:32'),
('67e6e1f0-7511-4498-9b27-b3c80693ede4', 1, 36.00, 36.00, 'c118eda2-7660-4d6b-9033-ebc2217b4e23', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-24 17:55:14', '2023-07-24 17:55:14'),
('68f0bb67-1d01-4150-83f5-de128b7121a8', 1, 20.00, 20.00, '10b7e92c-fb1d-444b-8f88-912cd76ad0b1', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '1846fda4-1922-4454-bc6d-a6c69f9379d6', NULL, '2023-06-05 03:42:22', '2023-06-05 03:42:22'),
('6dd13f56-3789-4249-9d9f-c8aaf5032892', 1, 18.00, 18.00, '92debff2-236b-432d-bd93-94a7d14c5a15', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-27 18:14:32', '2023-10-27 18:14:32'),
('6e33d9ea-a369-4de9-b2b9-bdedb85a531a', 1, 20.00, 20.00, '08805a4f-a132-4d4e-8073-aa02d1f254b6', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-07-22 18:04:13', '2023-07-22 18:04:13'),
('722d380a-e91f-4631-b585-0db9686d58f5', 1, 36.00, 36.00, '863f4f05-7ba7-49f4-a3fd-dbea2d5a6470', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-09 01:47:08', '2023-08-09 01:47:08'),
('72afd4c9-380d-4df9-966b-78231cc57a20', 1, 36.00, 36.00, '125ea0f9-5fd7-466a-b3b6-07e2e3c1fac3', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-15 05:34:22', '2023-07-15 05:34:22'),
('7656f79e-f374-426d-a687-ce1a56137fd7', 1, 99.00, 99.00, '8fe0a91d-95b2-482d-b20b-0bb190555c67', '28b1178e-0380-4440-862c-96e27d2ad2d2', '247aff22-c120-4cad-8930-3efda6a906d2', NULL, '2023-11-01 23:33:49', '2023-11-01 23:33:49'),
('76c08f1b-fed3-4ed2-acce-1845712ebb68', 3, 36.00, 108.00, 'b9977bdb-5cb3-4144-a8a5-698fb18e46e7', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-15 02:46:07', '2023-07-15 02:46:07'),
('796da7cb-9426-4387-bc09-c88b10cbf1a1', 2, 50.00, 100.00, 'a3eb5241-3b5e-46be-a837-ad3574d51967', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:42:07', '2023-08-21 13:42:07'),
('7a38bb60-3f38-4677-852f-22734dca051a', 8, 36.00, 288.00, '6a691507-ee69-4c2f-8d0e-b0179eff8d73', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-19 01:49:33', '2023-11-19 01:49:33'),
('7a3b5e34-c257-4628-85d4-4b941cbb5337', 3, 36.00, 108.00, '59893d46-2fc4-40f8-a3b1-1865767b6ee6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-10 15:29:45', '2023-11-10 15:29:45'),
('7b24267a-7a8a-4512-9743-f7ed9049d2e5', 4, 36.00, 144.00, 'da35e30f-4423-44de-ac20-842e1a8734f3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-15 01:54:34', '2023-11-15 01:54:34'),
('7b8ef396-bf27-4ae4-9ae8-0e3b5876f11c', 3, 366.00, 1098.00, '372121c2-6739-474b-8f23-9530438ade28', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 14:32:14', '2023-07-11 14:32:14'),
('7c1f21f7-800d-4fe1-9c55-83a85d904efd', 3, 366.00, 1098.00, 'd153c9e3-65d8-4fb5-b25f-5bab4728c0b9', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-12 15:41:23', '2023-07-12 15:41:23'),
('7ed5596a-34ab-416b-a3ae-07313ba52aef', 1, 18.00, 18.00, '37f484e3-effb-469a-921d-050f91badcbe', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-24 20:35:19', '2023-10-24 20:35:19'),
('7fb416c4-1923-4eb4-b31b-696d832358e1', 10, 36.00, 360.00, 'bf0ee2a1-1803-4f9d-8902-03d418d3ab04', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-21 02:18:19', '2023-11-21 02:18:19'),
('8202ba38-7738-4d32-9cbc-04a31c28471c', 1, 50.00, 50.00, '35d9e242-6e09-4cba-b851-8cec8f3650be', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 01:30:54', '2023-08-08 01:30:54'),
('825cc29d-3e4e-4c95-a9c2-d5012dfd82a8', 2, 20.00, 40.00, '281f2541-4f6e-461f-a410-36e849d49435', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:49:24', '2023-12-14 02:49:24'),
('829638e6-561e-4c6c-bab4-e93d71d54995', 1, 50.00, 50.00, '926ec7ed-a9b6-4c19-88e0-10100090174e', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 03:31:47', '2023-08-22 03:31:47'),
('836e0f41-533a-4cc5-a252-356b9d0c4262', 4, 366.00, 1464.00, '58ba6e8a-db9d-473d-b235-22d90d4b7a1f', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 15:40:50', '2023-07-11 15:40:50'),
('8461247c-e872-4687-b10c-dffc5333b193', 1, 18.00, 18.00, '55615f33-ea9f-4f1d-8f0b-529e613d8bd7', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-15 23:54:58', '2023-10-15 23:54:58'),
('84d97b20-43c0-4396-a5c1-e9280d2e11c3', 1, 18.00, 18.00, '88e33f2a-44c3-4966-955c-3cc7c1ce8b9d', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-24 20:37:58', '2023-10-24 20:37:58'),
('851ca216-d1f7-4fcf-b154-443a66a89941', 1, 36.00, 36.00, '556c1b2a-0e45-4dff-b3d8-6d56573f78f3', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-16 03:26:10', '2023-07-16 03:26:10'),
('86f28ce7-c357-44db-8a7e-3427879155a6', 1, 36.00, 36.00, '43b65d89-f9e6-48de-8bd2-cbab7adb55a2', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-21 04:10:09', '2023-07-21 04:10:09'),
('88138d62-aab1-4008-be43-f2cbc1f0c2ca', 2, 33.00, 66.00, '474514b9-76c0-4d3f-a7e3-fe252bbb05b8', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-15 23:15:15', '2023-07-15 23:15:15'),
('8975487a-eb7e-413c-98a2-c6dd7e19bb9d', 4, 366.00, 1464.00, '7c13580c-6967-4f66-aebc-fa61f5c25d17', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-07 16:13:38', '2023-07-07 16:13:38'),
('89ed2280-02b5-4790-a815-58aad6a28865', 2, 366.00, 732.00, '9e988203-b661-40ed-bfad-c25d17d53625', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-07 21:32:34', '2023-07-07 21:32:34'),
('8a2228b9-baa8-4835-956d-7ff1734d00d6', 2, 18.00, 36.00, '7fbf7254-2551-4e27-8084-2974097684b1', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-04 01:59:57', '2023-11-04 01:59:57'),
('8b927ace-30d2-417a-9dae-706c312ec0b8', 13, 36.00, 468.00, '9565daa6-2285-4d25-943d-35083e1b7db8', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-26 15:15:50', '2023-11-26 15:15:50'),
('8bd70d46-0466-4153-98d4-adb753e10c94', 1, 36.00, 36.00, '4ebce9f9-2721-46ba-9776-1e771aec87e2', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 16:59:44', '2023-07-22 16:59:44'),
('8c4bae50-8ea2-419c-8568-33270ed15bb1', 2, 20.00, 40.00, '5621ec74-5dba-4d46-a26c-447e4bb9ace6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-13 21:25:24', '2023-12-13 21:25:24'),
('8e20aa26-94d2-492a-91f6-6b55d3bcf85f', 2, 15.00, 30.00, '7b272c3a-7b51-4154-b6d5-0fb6836669b4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '10219638-e508-40f2-8667-1cf70ba474ab', NULL, '2023-12-14 02:18:36', '2023-12-14 02:18:36'),
('9096cd22-2c82-4bf3-9467-a9543230e203', 1, 36.00, 36.00, 'ea345bd3-f7eb-4267-b73e-1e0a5dfae4a6', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-25 02:04:16', '2023-07-25 02:04:16'),
('91099101-f85d-470d-bcf5-b21315a62100', 1, 32.00, 32.00, 'f534e13e-97fd-42bf-97a3-25bc73d80d96', '642ef59f-9127-4799-a724-93de4af6c3d0', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', NULL, '2023-07-15 05:28:49', '2023-07-15 05:28:49'),
('914ba7b6-e70f-4b54-ade1-834efc898036', 3, 15.00, 45.00, '4cdc59e3-ddf6-4219-8695-1246f1975de3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '10219638-e508-40f2-8667-1cf70ba474ab', NULL, '2023-12-13 21:28:39', '2023-12-13 21:28:39'),
('91704c43-b9d7-4715-9fda-1661aa4cbf76', 1, 36.00, 36.00, 'f44bd5bf-3980-45cd-8526-aa4b20b00d86', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-30 18:42:00', '2023-07-30 18:42:00'),
('92d763fd-807d-4b04-88fd-74b6bab38dd9', 6, 20.00, 120.00, '1d39686e-1739-436c-8b57-3135d5ee2121', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '1846fda4-1922-4454-bc6d-a6c69f9379d6', NULL, '2023-06-09 22:43:41', '2023-06-09 22:43:41'),
('92dba46a-ee5a-4d1c-91dc-06af211c6767', 1, 36.00, 36.00, '88474466-c1d8-495c-b993-26302cdcc864', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-11 01:50:44', '2023-08-11 01:50:44'),
('92f3c3fc-4123-4be7-9eeb-b63301c133cd', 1, 36.00, 36.00, 'a1437909-6fe4-4c7e-8863-902ded68f84b', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-21 09:01:33', '2023-07-21 09:01:33'),
('952a87ac-61f8-455c-a33f-a0342f76cf81', 1, 36.00, 36.00, '35d9e242-6e09-4cba-b851-8cec8f3650be', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-08 01:30:54', '2023-08-08 01:30:54'),
('97232923-d1a9-44dd-a5e6-94adcfc4f5ad', 1, 36.00, 36.00, '786546be-a47f-45b5-a5c6-ff7298e2f1ba', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 17:34:36', '2023-07-22 17:34:36'),
('9769d120-9fa2-4f14-94df-499be511988a', 2, 20.00, 40.00, 'c20cc8bb-a9f4-4cbd-8f34-767034233ef4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', NULL, '2023-12-13 21:22:26', '2023-12-13 21:22:26'),
('9a1114c1-9253-4733-8086-4f0487020987', 2, 26.00, 52.00, 'e3404292-304e-4f87-b533-5b9a7a1966a7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-14 02:24:13', '2023-12-14 02:24:13'),
('9c1d572e-52d2-46bb-9274-43330e80b7e3', 3, 26.00, 78.00, '4cdc59e3-ddf6-4219-8695-1246f1975de3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-13 21:28:39', '2023-12-13 21:28:39'),
('9cd6f4e2-79c8-462d-8030-9123d9daf59d', 3, 36.00, 108.00, '8fc76380-2ef9-4f4b-aad5-79d2497a5aac', '329b6a7b-c11a-4533-941a-7747b2615d9b', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', NULL, '2023-07-25 01:32:56', '2023-07-25 01:32:56'),
('9d776cb7-52cd-435c-8073-2fab88c81acb', 2, 15.00, 30.00, '5ab8193c-a58d-4bf8-9ee2-3b798fde48b7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '10219638-e508-40f2-8667-1cf70ba474ab', NULL, '2023-12-14 02:42:02', '2023-12-14 02:42:02'),
('a1cd54ba-67fc-426e-a70f-d3638f021497', 1, 36.00, 36.00, 'fb269919-3c3d-43c0-8864-44198032ffb0', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 21:55:23', '2023-07-22 21:55:23'),
('a3009715-3e35-4dfd-bb3b-89c284dda547', 1, 36.00, 36.00, 'e522ee95-5e91-49e1-9d42-0157996cd856', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-10 15:34:33', '2023-11-10 15:34:33'),
('a43a02fd-b851-46d3-a777-d4d1662ce768', 2, 36.00, 72.00, 'f48cedd3-f7b0-4bc2-851c-ee407ea6851d', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-12 16:30:01', '2023-08-12 16:30:01'),
('a44ea96d-bf3a-4694-acaa-a9ddc485889f', 1, 36.00, 36.00, 'bc9f000a-6616-46fd-a14d-60d137de001b', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 21:57:42', '2023-07-22 21:57:42'),
('a65c5741-2085-4f97-aa4d-9f0b251d8849', 1, 15.00, 15.00, 'acc8afa7-63dd-4bb7-871b-cfe2c771d8da', '466ee50d-041d-423c-9bfb-c3368a7590f6', '320896db-67be-4d28-842a-ee3f82c25b9e', NULL, '2023-06-14 11:52:38', '2023-06-14 11:52:38'),
('a6848b62-3cd0-4d2c-b3f7-49f226379c72', 1, 36.00, 36.00, 'dd3f0a1b-9328-4b88-9e34-29a53b485584', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-20 22:21:41', '2023-11-20 22:21:41'),
('a7dbb55f-7469-4a33-a8cb-4fef786abacd', 5, 366.00, 1830.00, '6b40854a-f919-4d7a-b3d2-245137214686', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 00:51:33', '2023-07-11 00:51:33'),
('a9a3d7db-8fdc-4f87-8fcb-b06c24e5fdf7', 1, 36.00, 36.00, '6d51d906-1ec7-448d-8263-9ea8b5e12bbb', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-22 17:05:19', '2023-07-22 17:05:19'),
('ab192a0c-aaca-4550-9f5b-6cbab0f13256', 1, 50.00, 50.00, 'a16180b8-4215-468c-bef3-f3fcf9e9ff8d', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 16:47:21', '2023-08-22 16:47:21'),
('ace2465b-1c53-451c-9c4c-080f1ea7defc', 1, 50.00, 50.00, '4aaa49a2-baea-4943-a577-2b92fedb7a7d', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 20:10:02', '2023-08-08 20:10:02'),
('ad6ad9ce-1342-4a3d-8c24-b132f7adb394', 2, 12.00, 24.00, '2d374451-3df3-4194-bdb0-c095a5af11d3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '241d7615-c96e-4ce9-850c-21e7436d8a87', NULL, '2023-12-14 02:13:12', '2023-12-14 02:13:12'),
('add85a1f-0703-45d3-be89-34695c29a652', 1, 33.00, 33.00, '3911067b-da6c-4982-a385-2c96ce4a6ea1', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-16 03:04:26', '2023-07-16 03:04:26'),
('adf8e2d0-384d-42f5-8522-0a465f47fbe5', 2, 36.00, 72.00, 'f65e50cb-794f-400b-b8c8-a6c707c6eb79', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-05 02:36:29', '2023-09-05 02:36:29'),
('ae1ea001-f31f-4d15-b480-dd8e0add6de9', 2, 36.00, 72.00, 'f681a723-64f0-4a3e-92d5-04dfd11a98a7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-28 01:01:06', '2023-11-28 01:01:06'),
('af6323f6-2409-4380-876b-04915b277375', 1, 18.00, 18.00, '9e0e272f-3a55-4462-96a4-d33ed1ebf2a3', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-15 05:02:17', '2023-10-15 05:02:17'),
('afbdccae-1670-4ae6-a2ba-88a2d6991af0', 1, 35.00, 35.00, '9d1a9936-657b-425d-b5d2-dd76b422ad80', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-20 14:40:16', '2023-08-20 14:40:16'),
('b04c9158-70b3-43fe-8092-79ae1e95e792', 1, 36.00, 36.00, 'f1a720ac-a505-4cfa-8c8b-de65fd43db61', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-11 01:27:14', '2023-08-11 01:27:14'),
('b174795d-d41f-4d14-b709-ecaaaffed124', 2, 36.00, 72.00, '25bfe287-1a90-4666-b2e8-323f62daa653', '329b6a7b-c11a-4533-941a-7747b2615d9b', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', NULL, '2023-07-25 01:35:59', '2023-07-25 01:35:59'),
('b3f9f215-dcc4-412c-b4c8-4bd33ae5dd2f', 1, 36.00, 36.00, '8854e3f8-be05-4c3a-8fca-b88b74d847f7', '329b6a7b-c11a-4533-941a-7747b2615d9b', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', NULL, '2023-07-25 01:43:40', '2023-07-25 01:43:40'),
('b579819b-83e4-40da-a9b2-795039d6812f', 1, 20.00, 20.00, '349880c7-23f0-483f-9d83-7bd378784f2c', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-07-14 00:11:31', '2023-07-14 00:11:31'),
('b91406a2-555c-4793-ba12-0a4fe1e34ec1', 4, 366.00, 1464.00, '31ce363f-6aaf-41bd-ab37-67b9e1f75343', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 17:22:42', '2023-07-11 17:22:42'),
('b919fb65-8cfe-4c29-bd8f-63925bdea4de', 1, 33.00, 33.00, '2926278f-3a9b-4c14-bcc0-5abb7396d95c', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-17 14:00:06', '2023-07-17 14:00:06'),
('b9bf79f4-1e40-48e1-a4bf-6e945aabd699', 6, 50.00, 300.00, '055a70f3-f761-4777-99e6-3cc1e5d9ead9', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 21:22:44', '2023-08-22 21:22:44'),
('bb246d71-c7ea-4b8a-a580-f919d0d00085', 1, 50.00, 50.00, '3963a708-7aa6-4b9e-ac66-f819abc0ee53', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 01:45:12', '2023-08-08 01:45:12'),
('bc1be37d-bdef-4477-9e54-62eacd7d00a0', 1, 99.00, 99.00, '62807d93-b7b7-4781-bb5a-0b38c717eae8', '28b1178e-0380-4440-862c-96e27d2ad2d2', '247aff22-c120-4cad-8930-3efda6a906d2', NULL, '2023-11-01 23:25:47', '2023-11-01 23:25:47'),
('bd5ae46c-f096-474f-afb2-d7ae7d5a7fba', 2, 26.00, 52.00, '5621ec74-5dba-4d46-a26c-447e4bb9ace6', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-13 21:25:24', '2023-12-13 21:25:24'),
('bdea3f96-1b34-4ce5-ac87-39096e5158b0', 1, 36.00, 36.00, '3a9eb6aa-2142-46c7-b32b-91276feb8eb8', '329b6a7b-c11a-4533-941a-7747b2615d9b', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', NULL, '2023-07-25 01:38:27', '2023-07-25 01:38:27'),
('be6251fe-6f1a-4dc3-8c16-a28f899ce513', 1, 36.00, 36.00, 'a7b6ceda-e829-4e67-b731-ccf3119bc47e', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-03 22:18:51', '2023-11-03 22:18:51'),
('be867c9f-64c6-4458-b207-ca3e65062c40', 1, 35.00, 35.00, '4a60e4b3-7da1-441e-991b-969696650fdb', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-20 15:06:58', '2023-08-20 15:06:58'),
('bf6ec786-45d1-4492-9a54-1eea220ea956', 2, 18.00, 36.00, '6cc3f8eb-1913-4dfe-a752-0cb8456aea88', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-27 18:31:07', '2023-10-27 18:31:07'),
('c028a7ed-3650-4dbe-8636-7a385c3bb17e', 1, 36.00, 36.00, 'aa705632-93ff-411a-b450-35f42616115d', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-17 13:59:44', '2023-07-17 13:59:44'),
('c03bd1ff-c7e4-4cdf-9e88-4eab7eeb7360', 2, 15.00, 30.00, 'c20cc8bb-a9f4-4cbd-8f34-767034233ef4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '10219638-e508-40f2-8667-1cf70ba474ab', NULL, '2023-12-13 21:22:26', '2023-12-13 21:22:26'),
('c37f4c74-5e59-4fdb-a4d6-9cf7e9d6e7d8', 3, 36.00, 108.00, 'b27fd88a-9277-4dbe-a599-ca57a53dd37a', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-15 02:10:05', '2023-07-15 02:10:05'),
('c3b5d861-8002-4dd0-9385-1a82effe6855', 2, 36.00, 72.00, 'af6476cc-dd15-447b-9c3e-244d006e3458', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-15 01:48:58', '2023-11-15 01:48:58'),
('c49176db-cbfd-4198-a4e7-09ec112774b2', 1, 50.00, 50.00, '8163aee3-c221-457a-be61-f403c54e340b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 14:44:49', '2023-08-22 14:44:49'),
('c68b28d9-af95-4d53-bca4-6a3bbbf4735e', 1, 366.00, 366.00, 'f3fea402-79b3-4e09-943d-0b2b1c10ca4e', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-12 15:39:48', '2023-07-12 15:39:48'),
('c68d1971-04b6-4dc5-8803-b9cf643db428', 1, 50.00, 50.00, 'ccc7f265-3b26-47fa-b756-391d92fbe390', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 04:42:04', '2023-08-22 04:42:04'),
('c713dca3-25fd-4bcd-8515-6e84090f1306', 1, 36.00, 36.00, '2f770e45-9549-4b0c-a8a3-691ac0b5cce8', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-07 05:06:04', '2023-08-07 05:06:04'),
('c7e75c70-b551-4240-be4d-9f8baab88a99', 4, 366.00, 1464.00, 'd16391ac-eb34-46c2-9a3b-059c06870ad9', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-10 20:45:53', '2023-07-10 20:45:53'),
('c8164c1a-0c86-4b7b-8186-1cf91dd4f2f9', 7, 500.00, 3500.00, '8cd4bb11-e47b-4655-affa-217702aabd53', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '1846fda4-1922-4454-bc6d-a6c69f9379d6', NULL, '2023-06-16 16:45:22', '2023-06-16 16:45:22'),
('c8d454a3-c667-45ab-8f9c-9c99ed8a59d9', 5, 366.00, 1830.00, '3fd85eaa-9635-4678-8752-4a6549d01d25', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 14:31:31', '2023-07-11 14:31:31'),
('c8e005a9-a897-4c1f-b2f8-d531800c1ff8', 1, 50.00, 50.00, '48a34035-dcbe-4e5b-9f29-853e15b9f1a2', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 04:05:12', '2023-08-22 04:05:12'),
('c8eb5b04-bf16-4bad-98b8-e0a89f36b10d', 1, 99.00, 99.00, '2d7b8114-5496-469e-893a-e97a10cc5b45', '28b1178e-0380-4440-862c-96e27d2ad2d2', '247aff22-c120-4cad-8930-3efda6a906d2', NULL, '2023-11-01 23:34:53', '2023-11-01 23:34:53'),
('ca284f17-15a5-4dda-a3c2-f86c51ac1f3e', 1, 50.00, 50.00, '7f39a83b-5794-49e0-878d-6fe2678fb87b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:37:34', '2023-08-21 13:37:34'),
('cc83af65-21ca-4a3a-9fec-d0b60b7828e7', 1, 50.00, 50.00, 'fbd227d9-0fcf-4ae3-a58c-955be51b1110', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 16:49:36', '2023-08-22 16:49:36'),
('cf6f3566-a755-4d70-892e-dbc3f697f93d', 1, 32.00, 32.00, '716fe201-5724-4a59-9cdc-9df3e403660b', '642ef59f-9127-4799-a724-93de4af6c3d0', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', NULL, '2023-07-17 14:01:15', '2023-07-17 14:01:15'),
('cf71d7b2-3517-482a-a3db-9a1532e17023', 3, 366.00, 1098.00, '069f7174-8996-4a37-a9f9-0e7aeeadd294', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 21:21:33', '2023-07-11 21:21:33'),
('cfb43703-643f-4819-bf9e-da34eadfb48b', 1, 36.00, 36.00, 'cb0baa56-bc61-447d-97d1-0ff40d94e6a2', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-27 21:08:17', '2023-11-27 21:08:17'),
('d1ca905e-c31c-4328-854e-0ed6f662e546', 1, 50.00, 50.00, '08048cb2-8808-4e6c-a8f5-66f8f4af932a', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 02:26:02', '2023-08-08 02:26:02'),
('d6084d14-e736-4ea6-bc3d-c93b82404b50', 1, 32.00, 32.00, '5b11b9a9-922b-471a-b4a0-1b3fed4b1057', '642ef59f-9127-4799-a724-93de4af6c3d0', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', NULL, '2023-07-21 04:14:17', '2023-07-21 04:14:17'),
('d842ed0a-28cc-44e5-8080-1e5dc5f65511', 1, 36.00, 36.00, '7826dc2a-9734-4c4d-b14f-00673998af24', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-10 15:34:00', '2023-11-10 15:34:00'),
('d86f2178-3593-493a-b011-f2ff3e964735', 1, 50.00, 50.00, '415c5823-5620-4917-9d32-5097e259dfa9', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 02:48:21', '2023-08-22 02:48:21'),
('d89025c4-4cfa-4768-8db3-9ebbcae1b428', 2, 35.00, 70.00, '6d100686-085b-44ea-b330-5dc5513b1225', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-20 14:27:56', '2023-08-20 14:27:56'),
('d8994580-0251-4c2a-a22d-7b8b2d731c18', 1, 36.00, 36.00, '19ed2cf9-4c37-48c0-898d-743bce7a2e46', '329b6a7b-c11a-4533-941a-7747b2615d9b', '4eda59cd-63a4-4042-bb6c-c752b6e3a476', NULL, '2023-07-25 01:40:38', '2023-07-25 01:40:38'),
('d91ff726-2695-4dae-a3e4-d0cf945f5515', 1, 33.00, 33.00, 'e8f0be03-9bdc-47b1-b376-5b6c813f9acf', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-22 17:32:28', '2023-07-22 17:32:28'),
('db1cd3a2-b79a-4766-ab3f-b06eb8d6d1ce', 3, 50.00, 150.00, '3ee92fb0-0249-4140-97d4-0162621061c0', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-09-05 02:34:03', '2023-09-05 02:34:03'),
('dbd42177-0a5b-4ec1-96a2-71386f5c5862', 1, 26.00, 26.00, '58d8452a-8d8f-4a4c-8ab6-137c1b38c093', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-14 02:47:26', '2023-12-14 02:47:26'),
('dc676b9e-f557-4a4c-80db-35cb33cf46d4', 1, 33.00, 33.00, '08fc5d19-7234-40bd-90f5-15fe402d0f7f', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-16 03:35:42', '2023-07-16 03:35:42'),
('dd46e553-1d19-4604-9d55-d2c01f0e73d2', 7, 366.00, 2562.00, '113fb6ca-909f-4810-81d7-deaa70797630', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 00:52:22', '2023-07-11 00:52:22'),
('df3604b5-062f-41a2-891e-60fad948839d', 2, 20.00, 40.00, '19320fe5-ceb3-40a0-858b-9c54a13177d2', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:51:19', '2023-12-14 02:51:19'),
('e0d92332-65e8-40fa-8f39-9dee2ab9da30', 3, 36.00, 108.00, '38d26890-9153-4ee9-be97-752b39e55351', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-15 01:52:05', '2023-11-15 01:52:05'),
('e16b3606-9060-4d5f-9c11-efe17dfc11c9', 12, 36.00, 432.00, '45ce715f-c51c-4505-9849-fc1fae22f7f8', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-21 02:20:30', '2023-11-21 02:20:30'),
('e2459012-b1d2-42a4-b9aa-60a6374581ca', 2, 20.00, 40.00, '7b272c3a-7b51-4154-b6d5-0fb6836669b4', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:18:36', '2023-12-14 02:18:36'),
('e36fc00d-4c0d-43f1-89df-1be36131088e', 1, 36.00, 36.00, 'dc2a4700-5a90-4eae-977b-c8a44713069b', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-11 02:36:27', '2023-08-11 02:36:27'),
('e37a47bc-759b-4e9e-93f9-2dfc8e83b0aa', 1, 50.00, 50.00, '02086be3-6f82-433e-a069-b577d8f63e36', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:35:43', '2023-08-21 13:35:43'),
('e400f871-0591-492a-aaaa-8d8a6a65d5ae', 1, 20.00, 20.00, '64504ba6-266d-4bfd-b703-96e359da977d', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-07-14 00:01:01', '2023-07-14 00:01:01'),
('e418e310-9744-46c4-ab6b-a34612bd3e36', 1, 50.00, 50.00, '63351183-b2ab-4808-bcbd-9658519d8ffa', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:40:40', '2023-08-21 13:40:40'),
('e44cb4cd-b80a-4029-92f3-8a7f0461db2f', 3, 36.00, 108.00, '1e782c87-7f62-4634-9a19-b370d5011bf2', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-14 06:26:51', '2023-10-14 06:26:51'),
('e4b9fca6-bda1-464d-a9e7-470c64c46120', 4, 20.00, 80.00, '355c29ea-d549-4baa-af43-f758e914fd1f', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:15:13', '2023-12-14 02:15:13'),
('e88fd468-40fe-47b3-a51e-4d417f11711e', 1, 50.00, 50.00, '525ae5a7-2543-488e-bee1-a4d2c735f28e', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 17:01:07', '2023-08-22 17:01:07'),
('e911d830-ce58-4731-9240-1fad39aa7dfe', 2, 26.00, 52.00, '6eab7b35-bd10-45c4-96bf-de45b852c519', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', NULL, '2023-12-14 02:28:30', '2023-12-14 02:28:30'),
('eb01c4a6-c82d-410d-816a-d21910c6d99e', 1, 32.00, 32.00, '9c8cf34c-a95b-4b08-8b5c-0f0198271656', '642ef59f-9127-4799-a724-93de4af6c3d0', 'bc752484-1b34-4046-a0a7-b7c6e3172d8c', NULL, '2023-07-16 03:17:10', '2023-07-16 03:17:10'),
('eb28e54d-4f4a-409a-957f-addc3d4698dc', 1, 18.00, 18.00, '8618c39b-a317-4647-819e-bd0ec3350453', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-15 23:59:35', '2023-10-15 23:59:35'),
('eb7939ee-4163-4b48-bac2-3c15a227560a', 4, 20.00, 80.00, 'e3404292-304e-4f87-b533-5b9a7a1966a7', '0ba64045-8b10-41e9-bf3a-61cf538124ff', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', NULL, '2023-12-14 02:24:13', '2023-12-14 02:24:13'),
('ee016577-f215-49a5-97fe-23de0a39f7d2', 1, 50.00, 50.00, 'cb600771-7ef4-47e9-b5ff-d12ad7e5da7b', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:31:40', '2023-08-21 13:31:40'),
('ee3d8950-67af-41f3-9318-d8735f88059e', 8, 50.00, 400.00, '83cbbf35-c713-4b09-a399-6b7c557b4d44', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-22 21:25:37', '2023-08-22 21:25:37'),
('eea890e4-3aea-4519-9904-e6d00edef5b3', 1, 36.00, 36.00, '5e29099a-4787-4273-bd80-6dd99dcbd076', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-24 18:10:39', '2023-07-24 18:10:39'),
('ef615f7e-67e4-42cc-a3c4-e430f7116da4', 2, 20.00, 40.00, 'c617c2e5-435a-4498-b7a8-418d89046b25', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '312603c5-a830-4b15-921b-32a1b085bf5a', NULL, '2023-08-02 02:47:59', '2023-08-02 02:47:59'),
('f1e9af83-7fe3-4a80-9b95-3b0cc77a0280', 2, 366.00, 732.00, 'e7d5ffb2-49cb-4bf9-9221-8a1a19c85853', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-10 20:25:46', '2023-07-10 20:25:46'),
('f21c3aec-c849-4473-b6d5-35e6fcc8502a', 3, 366.00, 1098.00, '912332c6-18d7-470a-ad16-e5be8d7c45cc', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '0ce5bb80-c155-4ec8-9477-222f75b81de5', NULL, '2023-07-11 14:48:08', '2023-07-11 14:48:08'),
('f4aa0884-83fa-4bc1-b4fb-e1ca02eb1a49', 2, 18.00, 36.00, '32eaca7f-95b1-4909-8791-f9e2a4eeb3d9', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', NULL, '2023-10-27 18:17:48', '2023-10-27 18:17:48'),
('f51f62d7-0a45-4464-a466-3852dd7021d3', 2, 36.00, 72.00, '1e1bdcc2-791e-4bf7-9e1c-70a7e864c728', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-12-14 02:50:02', '2023-12-14 02:50:02'),
('f52feb97-aaf2-4532-96ae-3a479b4fc18b', 2, 20.00, 40.00, '2d374451-3df3-4194-bdb0-c095a5af11d3', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', NULL, '2023-12-14 02:13:12', '2023-12-14 02:13:12'),
('f578b76c-9d05-46c4-93ba-cb939c4e86e9', 1, 36.00, 36.00, 'd1f11221-38fc-46b3-a439-8e4c7c6de389', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', NULL, '2023-09-07 02:40:49', '2023-09-07 02:40:49'),
('f68888b7-0b78-4f02-a927-1e7e0f8e7e53', 1, 33.00, 33.00, 'a8a7cbe0-a775-45fb-9eda-ee468c5d310c', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-15 05:32:50', '2023-07-15 05:32:50'),
('f691b0ec-2f7f-4ef7-b7b2-7a21c32af298', 1, 35.00, 35.00, '410e2669-63fb-4e33-b91f-c93603432e2f', '642ef59f-9127-4799-a724-93de4af6c3d0', '47e309f0-1427-40ca-b3ad-45792c8419a7', NULL, '2023-07-15 02:48:27', '2023-07-15 02:48:27'),
('f6eef575-90ae-4a31-85c3-c98900afda22', 5, 36.00, 180.00, '7af2ac1d-eec3-4022-af01-243f23b2165c', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', NULL, '2023-11-15 15:19:40', '2023-11-15 15:19:40'),
('f79778f7-8eb6-4a07-b208-9c13471fc75d', 2, 50.00, 100.00, '0dbd56c3-f6fd-42d2-8967-68ea0e476203', 'fb751d69-9fe2-4017-948f-134a1117c41f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', NULL, '2023-08-21 13:30:35', '2023-08-21 13:30:35'),
('f8057645-e4ad-421e-829f-609748cdeac6', 1, 36.00, 36.00, '92af38c0-cb3e-427c-956f-58e345eb9d09', '642ef59f-9127-4799-a724-93de4af6c3d0', '2767bad9-fced-4621-a584-110e80c7a37f', NULL, '2023-07-24 18:02:01', '2023-07-24 18:02:01'),
('f8ec3aa8-3465-4118-9fce-5425798d0513', 1, 33.00, 33.00, '21e8b824-5c07-4555-9bbe-b6a8673f096f', '642ef59f-9127-4799-a724-93de4af6c3d0', '29ef5a1f-5f3e-42c8-850d-0216fc14bab9', NULL, '2023-07-22 17:44:00', '2023-07-22 17:44:00'),
('fabfa0d0-e4f3-4b28-aee6-ac9b8049fbb4', 1, 36.00, 36.00, 'f9afe7f6-a3b4-4de1-abef-f1b543e4ba21', '83cda510-0304-479b-a98f-7b7c8140fd0f', '3e6e259a-3969-4168-a924-9dbf1f296f03', NULL, '2023-08-08 01:41:11', '2023-08-08 01:41:11'),
('fbe6594a-ba5e-447e-bfe1-580d50e1a5c5', 1, 36.00, 36.00, '28ec548e-ba76-42de-888c-a785ea78a146', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', NULL, '2023-07-25 02:09:53', '2023-07-25 02:09:53'),
('fc3bff3a-f460-47dc-beb6-e7a5fabcb5d7', 1, 50.00, 50.00, 'caa38285-95e0-4aed-9675-64f0f1946785', '83cda510-0304-479b-a98f-7b7c8140fd0f', 'b20aa422-0935-468c-98b7-1f6fde6b8a1d', NULL, '2023-08-08 01:43:01', '2023-08-08 01:43:01');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_order_additions`
--

CREATE TABLE `product_order_additions` (
  `id` char(36) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `final_price` double(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `product_order_id` char(36) DEFAULT NULL,
  `addition_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `product_order_additions`
--

INSERT INTO `product_order_additions` (`id`, `quantity`, `price`, `final_price`, `product_order_id`, `addition_id`, `created_at`, `updated_at`) VALUES
('0d1b0ef4-f757-437a-b4f0-c963d5c36095', 2, 3.00, 6.00, 'f6eef575-90ae-4a31-85c3-c98900afda22', 'decdcf2b-c4e7-4aa4-90da-d96963a3d8d8', '2023-11-15 15:19:40', '2023-11-15 15:19:40'),
('17a487ec-924b-438a-9858-1952f06b606b', 2, 3.00, 6.00, 'ae1ea001-f31f-4d15-b480-dd8e0add6de9', '021fde5c-08b6-4456-b2c4-970af7bb2899', '2023-11-28 01:01:06', '2023-11-28 01:01:06'),
('2b550113-ab26-43c7-a30d-f7d475bd25ab', 1, 30.03, 30.03, '3f4a5fff-2a67-45db-8d98-5a8592a50198', '6b8ae4a2-fcf5-4cb8-aca0-3e5cbae24f0d', '2023-10-30 02:59:09', '2023-10-30 02:59:09'),
('365b32dd-4e23-46ec-b04d-6f10af99dde5', 2, 3.00, 6.00, '635957fd-a7dd-49b7-8ddb-56561941100f', '021fde5c-08b6-4456-b2c4-970af7bb2899', '2023-11-18 01:50:36', '2023-11-18 01:50:36'),
('4df3f91e-8fba-43a1-bf48-1b798ae6f56e', 2, 3.00, 6.00, 'e0d92332-65e8-40fa-8f39-9dee2ab9da30', 'decdcf2b-c4e7-4aa4-90da-d96963a3d8d8', '2023-11-15 01:52:05', '2023-11-15 01:52:05'),
('53cceabf-664e-4854-8635-2432088a78c2', 1, 30.00, 30.00, 'e44cb4cd-b80a-4029-92f3-8a7f0461db2f', 'ccf206e2-6ab9-4ac1-9515-2a2333d905be', '2023-10-14 06:26:51', '2023-10-14 06:26:51'),
('6286376d-50a5-4ec4-b149-db90554db20d', 3, 3.00, 9.00, 'c3b5d861-8002-4dd0-9385-1a82effe6855', 'decdcf2b-c4e7-4aa4-90da-d96963a3d8d8', '2023-11-15 01:48:58', '2023-11-15 01:48:58'),
('75c6858c-d677-4dc8-833f-5e07a15df430', 1, 200.00, 200.00, '579546e0-547e-4391-a54a-fd07f0309e91', '6597dba5-31a2-4df9-9cf7-2acb04742295', '2023-06-14 03:08:10', '2023-06-14 03:08:10'),
('96ea3b33-a041-4ea3-a2d2-d6cc7684405b', 3, 3.00, 9.00, '8b927ace-30d2-417a-9dae-706c312ec0b8', '021fde5c-08b6-4456-b2c4-970af7bb2899', '2023-11-26 15:15:50', '2023-11-26 15:15:50'),
('9c1c9593-1672-45f0-bb53-fe41bf084025', 2, 3.00, 6.00, '7fb416c4-1923-4eb4-b31b-696d832358e1', '021fde5c-08b6-4456-b2c4-970af7bb2899', '2023-11-21 02:18:19', '2023-11-21 02:18:19'),
('a76ff678-b4a9-4d8d-accc-8e5b5642713f', 3, 3.00, 9.00, '4851c0b9-55be-4041-b6d6-f226ece4149e', 'e5937c93-e01a-4757-92cd-47a40f774239', '2023-11-03 23:18:57', '2023-11-03 23:18:57'),
('afd8c487-e44d-41c1-9ed5-774b4d9c436f', 2, 3.00, 6.00, 'be6251fe-6f1a-4dc3-8c16-a28f899ce513', 'e5937c93-e01a-4757-92cd-47a40f774239', '2023-11-03 22:18:51', '2023-11-03 22:18:51'),
('b24b9711-c5f9-4ded-95d7-c360ef220cce', 1, 3.00, 3.00, '7a38bb60-3f38-4677-852f-22734dca051a', '021fde5c-08b6-4456-b2c4-970af7bb2899', '2023-11-19 01:49:33', '2023-11-19 01:49:33'),
('ca2cf3a0-27a5-4998-9880-9f269f0b6fa2', 2, 30.00, 60.00, '3e2c8287-3073-4d07-bf2d-163ae8348d59', '396f1e5d-de60-4b77-af64-ea154150419c', '2023-10-14 23:39:28', '2023-10-14 23:39:28'),
('d63e9fa0-c304-4f12-b504-3437b9184a38', 1, 3.00, 3.00, 'cfb43703-643f-4819-bf9e-da34eadfb48b', '021fde5c-08b6-4456-b2c4-970af7bb2899', '2023-11-27 21:08:17', '2023-11-27 21:08:17');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_variations`
--

CREATE TABLE `product_variations` (
  `id` char(36) NOT NULL,
  `price` double(8,2) NOT NULL,
  `en_name` varchar(191) DEFAULT NULL,
  `ar_name` varchar(191) DEFAULT NULL,
  `type` enum('one_option','multiple_options') NOT NULL DEFAULT 'one_option',
  `is_primary` tinyint(1) NOT NULL DEFAULT 1,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `product_id` char(36) DEFAULT NULL,
  `classification_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `product_views`
--

CREATE TABLE `product_views` (
  `id` char(36) NOT NULL,
  `product_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `product_views`
--

INSERT INTO `product_views` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
('0078da01-b457-4bef-afa7-50be2353704c', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('00a6c4eb-8180-4c33-ae3b-88443a427ec4', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('023ed9ad-43a3-41b5-96f5-41e5d61dec7c', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('04521106-d0fc-4790-9eb7-da81ca7f316c', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('04a3bde2-e6be-4a09-b63e-10409925e003', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('052dd7b8-39cb-4b68-9174-9b66bbd5f3ed', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('06182f04-c696-4d5b-a92d-fb5f895640c7', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0772637a-b2a2-44cc-8533-6593267caed2', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('094d7496-07ab-47c4-bd08-602e8bdac4ce', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0a0ce3c2-bcc2-4c53-aa1c-ac20dac19aa2', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('0af2f08d-605a-4d16-9c8b-5c26358d5f9f', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0b943b4f-ca09-486a-aec3-01e0f53c4b66', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0b98eeed-1e26-4f04-81b4-173771501f62', '7411e939-8c78-43ff-9f2e-b434e7ecbadd', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0b999275-ae01-446a-8d93-5833807973bb', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0bcf6ea5-c25c-4f89-b41e-86761b5120d2', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0bdd72ad-94d2-41aa-a618-a93c9b145685', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0c553661-af21-44c3-8984-d8fda6281454', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0fa6da2f-c23a-4528-8610-95d4795d416d', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('0ff653d6-ea8b-43da-8337-4c85a7fb15ce', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('10151f98-e410-4932-96fe-6ad6c0a61f01', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('11cc8068-8869-4362-ab8b-83ca02e14ed3', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('1211e044-9cc7-4193-88ba-23f253ae82ac', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('148475c9-c42f-4093-ad1e-5f73645957ba', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('1609e6cb-bb98-4f99-bb5f-904f4e9b985a', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('16432a36-6f68-4e2b-a5c2-3a2fac785466', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('17162c52-820a-40ca-b0a3-79e9b4f59675', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('17d60f26-405e-45a1-b711-0e1f1899b805', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('18961340-5c5c-4f2c-8adc-7fe9cb3d7fd0', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('18ee768d-aacd-4e3a-ab19-33140c6894b4', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('18f25026-bfb8-451f-ad3f-a6f482b13d66', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('1d29cb5c-83a4-4459-8814-105135e97954', '0ce5bb80-c155-4ec8-9477-222f75b81de5', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('1de5d9cb-14d7-463f-a2b1-f0352d735cd6', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('1e301fd4-6f1f-4b95-89ab-f3ad561e9d51', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('1e892286-ce09-472c-a62e-4ab015252976', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('1ea70ba1-31f1-433b-8c73-250f6b5ab5c9', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('1fb59e16-8a7a-46c2-8fd1-551d5b0a8c9d', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('1fe429ef-2c00-4b01-9a3d-ca9da6f18578', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2086d66b-5e5f-48ed-bf0a-5010b0c72f2f', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('23d59c1f-da40-4d16-a0b1-37e99323ce71', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('24cbef6d-ffbf-44ee-8c03-ad5834fd903e', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('25dbbe62-7eeb-4aea-9fd0-991676bc1442', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2649fd93-8fea-476f-9be1-0d4b6983414d', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('26b54df0-088c-4770-9329-7fc7fada0354', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('26d6624e-8592-4bab-a046-12c4713eb3e6', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('26f9cebd-2910-49e1-95d4-8604b7032084', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('2a6d90b0-4dd1-47b2-acfb-da980ec1cf01', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('2a7901a7-b897-4d6c-84bd-f6f4a675c7d7', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2b7ee349-2326-42c6-8cc8-3122aa91f6bf', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('2bc27f5d-a4a3-45b4-9125-19ec0a13bfde', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2bef1246-308a-4a98-ba5f-ac6317c9f4c3', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2c8d3561-6803-4857-b98d-9047a5b76e93', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2c9afdda-6f43-4374-9703-27c5283da9f1', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2d43f83e-7ee2-41fa-9dfa-0ba122f4a519', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2e6f4963-bb27-48f5-b65e-f87352942af8', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2eacc50c-3a8b-4d93-abab-33093576c72b', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2eeebff1-3718-4f90-a8c2-b54311626a4f', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('2f334e79-1ed2-46f3-b19f-a6b34dee183a', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3097efd0-614e-4fc3-846f-13a3738f6ae0', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('3213b863-e433-4862-9dbc-827c50b24e1c', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('324e5120-06a6-422a-a243-38e5db9e8713', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3254aa90-35c3-4cb4-aa17-639b30f6298f', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('33f5e355-64d6-49cf-9728-dfdaadb73d2d', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('340b4ee6-7b97-4502-8d56-ea27e86efb38', '380e263e-99c7-4366-b4de-5b0c4d2d9cdb', '37fb4bc8-57aa-444f-931a-5cf2e9df2cb0', NULL, NULL),
('344af5e7-5fcd-4593-9108-e677ec245e48', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('34704e0d-4590-4e73-a615-4d30f31bcf36', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('34cbebd4-f552-4009-b357-95f3a8104e78', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('35361533-bd79-472c-82a8-9f2f4fc09541', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3644bee1-ee28-4440-a05f-4e07ce0bd829', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('37634b96-44ea-4f22-8ca9-a11f813b1837', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('38b5c15a-9bea-4b1a-ae59-a48518540a67', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('397c422c-aed9-4d05-8181-3055b0b13f09', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3a7e6ad9-6cf9-4bf2-a997-b100c0a3d53e', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3ae95193-f40b-4ec6-97f9-fc39493b22f4', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3b13b412-f0c8-4623-8542-d235c28c45b2', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3b903c0f-6243-4edf-a21a-38bdf9288757', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3bd70a97-fac6-40b8-8337-b00f6ea2988c', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3c47f249-0e48-4a42-8cb4-907b7f193474', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3d868dc5-2b3b-4e17-a24f-49278a139243', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3d8f3c86-1e29-401a-a2a4-ca7632d5e6a6', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3dd57c63-758e-4fd5-9957-d09dee6d8c21', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3dfc8e16-90fd-405c-bf95-8376df620e54', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('3e17186a-c620-44d0-b528-b810feeb3b9e', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3e95dafd-dfbd-4f66-9ec3-284731093d78', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('3f6a3c82-365a-48fa-bbbd-51d8c955f288', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('3fd8cc81-f58a-47a5-a07b-69f1552e13b4', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('40229620-fe66-473a-bc29-a292ad21aaab', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4038b2a4-9847-42bf-a22e-7ac6cdebf613', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('40465732-5e94-45dd-aa9f-269b7eea3b47', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('40bc02ea-9535-40e9-8c48-86b8e8a0f2b4', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('410b79df-e54f-4cf0-b550-26ca9f4562ca', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('41b11bd9-ca28-4af7-8f71-3a8fb12196ab', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4479d9d5-ebb5-4f43-b48b-e7bf7cf0a998', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('44e3df1e-96fa-421a-bee9-c30855b327e1', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('45180499-ff82-466e-a27a-c364cb09f28f', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('451a6ae7-d2c8-41cc-add0-b167ab266cd1', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4592de0f-a7ea-4db0-9462-77b313e9a72f', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('4642fd1d-e04f-40b8-a7ed-c8f1aeff9729', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('469709fa-d9eb-4af6-994b-6d894df5ca0e', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('48eb707a-034e-4384-9e2b-6be92aaee71c', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('49c297c0-0c76-4329-af3c-0fb1012cfe6e', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4bb354bb-d93d-4863-ad1e-199837afaf80', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('4bdeba6a-10f4-4f46-929b-ae630b82c2a9', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4cb030a4-c029-494e-8a5a-a4411c382de0', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('4cd160fd-20c1-4cc7-9cf2-b72b0cecd854', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4d41f91f-8832-4fe7-8991-fcab7972faa7', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4d90c36c-1d51-490a-8abf-565c11a61e62', 'c30cfd3c-280f-45a6-8e4d-efaae17ddaed', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('4e4dfda3-64a7-4c72-b8cc-6186a01f37ad', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('4ee94ed7-0951-4934-8150-cde280566a85', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('4fcffcb2-ecb5-4447-af26-8d75eb5efab7', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('525b7d66-4616-438d-b061-70f5d44d8392', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('532a0613-b0ea-4a2d-8093-99dbe3c699ce', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('533825e3-0f60-4c2e-a7d7-2eaaa26aeed8', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('54ac0975-c437-427f-a55b-a010378a56ac', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('54d3eb9e-e5c8-4608-8727-c84b1090858a', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('55aeb7b8-7ba8-43c7-aad3-99b133ed447d', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('56791cd4-b25e-49c0-9831-b65df2134dff', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('57980108-3010-4e91-8cdc-22eef3d93c78', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('59a831ad-7b67-4236-bea0-3d68519c8b1a', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('5b46ccbd-618a-427b-a52e-42f32d393869', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('5cbd4b0d-5799-492f-bd2f-cf574daa62de', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('5d4ac1a4-afa6-46b4-bb5b-766e9e3b3dda', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('5dcfd0eb-87fe-49cf-8938-13c92b78693d', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('5f88f202-9352-4cc1-8f27-fdc9f957ec86', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('610cba7c-e3d7-4780-ab89-d60c84904d28', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('63012309-3be1-467a-8f44-5b5d83f99934', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('64c59ab3-6bb3-4308-b930-d765d261e93d', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('65ca493e-16b6-42cc-a81a-0784a5e2e3f6', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('68806dc6-d44b-4b32-8cc3-ce45e3253388', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('68bdb5b6-b35e-4d82-918a-5d8e59572b4b', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('68cb10ba-8de3-497b-9e9d-1367f2c4a4a6', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6990acd6-e761-4610-9508-0574af4525b2', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('699e62ea-3890-48d7-8064-6feda2ffaa9f', '6a170cd7-9a3a-4e08-8dbb-1943fcb48dc5', '37fb4bc8-57aa-444f-931a-5cf2e9df2cb0', NULL, NULL),
('6b60b82d-8189-40c2-9862-0bdce3e7e119', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6b8d22f8-b827-4d25-8fa3-6c0bb1f34720', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6b93cd50-9b05-4f32-bd19-bede95ae8c5b', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('6bf42363-d0e8-4f71-a5df-8fd46c51f53c', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6cfc24b2-700f-4434-b0c8-5cec884291d2', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6dd72667-c15d-4485-aa7a-e8f7d3998503', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6ea2d02c-8589-4006-9724-d31645e2a11b', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('6fdd570b-f182-4eba-ad6a-b6fb9d76e2f6', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('71931801-914b-4639-8d87-5892e032c1cd', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('72b5acb1-b863-417e-bda1-145c56525343', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7379f338-f5e2-4edf-a891-5f0089c215c5', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('744a470e-9095-4727-90b5-0ce6b7907447', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('749dd7c4-3158-42cb-a14d-c1d56cf9b9dc', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('74b136db-df73-4c42-847a-64a7c81ad2ee', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('74e704e1-a9be-49a0-869e-917fbea9ade6', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('767e0d95-76f7-4368-97bf-fc2973b8e727', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7b360e9b-064e-42c7-a3c9-61cb2eaaba53', '0ce5bb80-c155-4ec8-9477-222f75b81de5', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('7bf7ef6f-d0d7-47a6-99c8-3fe68de3fc17', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7ced9a3f-f16f-4b41-b6dc-7e892139c988', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7d3010ce-40b1-406e-a4c1-fa28319b596f', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7e1711dc-f09d-4ee4-aa03-0bd64fe60c39', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7eaa7002-5745-4136-bc67-09bceb2e9b23', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7f4d8c70-870f-42a1-9832-f23710501012', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('7fe9aee5-337f-44e5-b65e-b669b412b7b1', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('819b2e0a-14d9-43de-8cfe-324b657559e8', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('84d2e1ed-fa87-4e77-b983-d35554545ba7', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('8579a7fe-51c9-4bbc-a28f-317698ae5af3', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('8587e474-3163-4410-9928-505ed276d650', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('85e13f7a-c613-4768-9f6e-cd152db04b53', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('88df6c89-659e-49d5-b635-78e9bea7e6cf', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('8b2a6b5e-9d1a-4883-af59-c32b50a14428', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('8de72028-0e68-4fb3-84b9-68affbca7ad6', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('8ecae522-00e9-4919-b325-64f16ccb7fd7', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('8f210138-9e83-4d42-b2e4-d59822112cc5', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('8f336cd6-5e27-4568-a79c-084949418f80', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('8f5cf4cb-671e-4906-bbea-e8de8b93f158', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('90525ffd-cb3c-467a-bf9c-1378fdb30d1f', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('91a15bd4-ec56-4791-9594-999479a39d88', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('91f45649-3093-4142-bb20-d0aadc9a371b', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('91f494f9-b2d1-4420-8ead-1e391c6c1aed', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('92ed34bd-5a89-4378-9521-d7f2cafa9e44', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('93774bb0-a8fb-48b3-bc4a-f3745f0741bd', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('9571eca1-5ad3-4e6d-9b98-d7b5623ae8b5', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('967f02b4-1865-49c9-b118-c9652295b33c', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('96e219ad-a428-471b-95dc-f3e11f4edec9', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('97965d44-a20a-4e13-8752-0a06056da61e', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('97aa17df-48a3-4cb4-b552-b54047df3b7f', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('984af1b8-7f5d-4236-9fc9-6a6ab8b7095e', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('985a137d-4b37-4bf1-8032-eee6b5c225f9', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('98f45c8b-a72d-4f61-8dad-6056c5ff8224', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('999fa8e3-473f-49e5-a319-b029952eb41d', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('9a22d7f7-a420-4dde-bc9b-6306f5c105c1', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('9c6913e5-62d1-41b7-bf2a-28581db6fe6e', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('9cc95bd0-c351-4de3-8a72-019bb4fbb5f3', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('9dcd9790-c61c-4aab-b7ec-65981f4daa85', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('9e5840c1-3230-4c26-ae93-ee56f9110129', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('9fe89da2-009d-4c6a-9c66-8da549472202', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a0150f56-c5d7-4dd7-90f4-f8ca4fe3d471', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a0d2fc92-ed6a-4c95-a837-b7970b6f3df2', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a12c12f6-a52b-489b-bb34-7414c59a3a53', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a18d4222-d922-4f07-8ff1-c7b5ce3fd61c', '312603c5-a830-4b15-921b-32a1b085bf5a', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a3e2123e-81ec-4448-b866-afdd2d49d5f5', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a3e26a9c-a544-47e6-863b-0ced74fb3787', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a5986f73-fc00-4b81-a5d1-4627a84cea8e', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a5a2ed11-b7a8-4225-addd-e4f59ff6b950', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a70a2e80-b66c-4227-b557-58f532e93859', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a7d5de00-b199-4ba1-9ab1-2dfa1c145d6b', '2767bad9-fced-4621-a584-110e80c7a37f', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('a7dc1c97-2f1f-4d3a-be69-c0510884814d', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a8807b19-87a4-4306-aacf-7c7f67377201', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('a9b8b808-585e-4302-9469-e7fe6169ecc0', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('abf36b8d-4ffd-4f10-a414-f117102b014e', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('ac4d20fa-1a4c-4e6d-89a3-29b92c549df1', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('ac4d6ae3-a6e2-43be-8712-39b0892493c3', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('ad137048-8dd7-41df-857d-1920780345b7', '7411e939-8c78-43ff-9f2e-b434e7ecbadd', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('ad746962-48cd-4e0c-af63-11eb62f893fb', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('aeecebc6-5a6c-44cb-ab53-c973ab5a4084', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('af2c527c-f96b-44c3-ae99-103c1fa7f0b6', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b2322256-6320-4c94-9f38-b42093f04f59', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b2641423-eb49-411e-8b5d-373d488197a1', '312603c5-a830-4b15-921b-32a1b085bf5a', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('b2e00330-4350-4978-9e2d-b4b4dd187bbc', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b32c1ff5-2f7a-4cb3-970e-fd17008418ac', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b55eb692-6573-41e2-9258-a26c423cf355', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b6f7e36d-0299-46a9-bd90-eeafc7677555', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b816f94b-59f9-4185-bfff-ac5ffa78b587', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('b8e794e9-7922-4090-b5e0-0813d72418ff', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('ba00ca76-243b-45ee-b596-83c66d2e13e4', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('babda11b-afff-4655-a2db-0a9d0de2e1ea', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('bd251eca-eff4-4601-a12d-7953bdce760a', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('be603114-d5f8-44ec-8978-895d9aca2647', '0ce5bb80-c155-4ec8-9477-222f75b81de5', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('bf41b7cb-2d07-4a6e-affa-340e582bfee4', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c05f5eeb-1441-48f4-ac6b-1de0ffb354f3', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c0812331-abf8-4630-bba4-a684de87325d', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c1312d6b-b3dc-4b77-9c58-45dfe86c5fa5', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c2173138-e8e0-4588-9925-9549f6782669', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c24a3142-d488-4f01-9fb4-5aee9b0b6a3b', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c2e6c4eb-af75-47b3-a469-e32300b7492a', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('c36166e1-a698-4eb0-b768-1a9945e78092', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c3739f4a-8c33-4e02-a177-5a96beb4b7c9', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c40b0be8-471e-4b00-9f1c-853f502e9678', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c41f1a1a-d2ce-4d20-b47d-506b9cff1855', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c46b355f-6184-4474-9d6e-7b86ae630802', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c722f890-9be2-4f0e-832d-1071c99b0a8f', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('c7c6780d-93f0-43f0-b145-4f7d60891cca', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('ca0b03ee-0df5-47e1-a814-a7638b52ef22', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('ca0b0936-6074-47dc-b395-2766a32cbc44', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('cdd287ae-f69a-484d-be1c-60e3fa2f0b5d', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('cea956a0-6dd7-4207-b406-734b6cca2f5f', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('cf242a9c-a8dd-4022-93c8-0eff0f4143d5', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d0b43b48-c57c-414b-a5f4-4bf3fc9541dd', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d1a76c25-48de-47af-af16-979963261c31', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d1b6354f-ca7b-4d69-9d5d-85adc08c9bb3', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d1f03566-a201-41a7-8ab3-01f9991ec25a', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d3906bbd-4f9e-4ea6-975d-2d1f632bd210', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d4863b58-91aa-4899-b51b-b36050f7fbf6', '312603c5-a830-4b15-921b-32a1b085bf5a', '90af975f-722e-4625-b63b-8d23f47efba9', NULL, NULL),
('d614c68b-77bd-4855-b4dd-7aacc409cbaa', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d6472d72-93db-4627-8626-d589eb3b6de0', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d6e9fb5c-8219-4ec4-975b-db86d4440cf1', '44de3aef-296a-4db9-8027-ffbeb314b0d3', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d7395eb7-56f2-4fa2-aaa3-60a807132099', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d7fdfee4-7a19-45f0-a168-996515419873', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('d913cb73-7880-46d1-97f5-dfd030462462', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('da268b4b-fbfe-4e45-aa9c-89a1df17f7ec', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('dbdbd883-393a-44f6-b821-ea1022e6c2b8', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dbfd6e7d-9c62-4753-ac2d-aeff3cdfdb8b', '241d7615-c96e-4ce9-850c-21e7436d8a87', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dc112116-c96d-486b-acf9-05d466bf701e', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dc2cd244-d55d-41ca-855b-3dd617a9509a', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dc80293e-584e-421c-b67d-e196d21d3f47', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dcda27f8-f092-427b-9337-f73e687c50a0', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dcfaeb5a-7084-4175-a05f-57519bb930b5', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dd803dbb-dd6e-41c2-bda4-e0413457084b', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('ddde079d-610c-4fbd-a856-ae9c842c2a6c', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('dfc78dbb-cdc4-411d-9a5b-e0f4266a122b', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e099b228-e8b8-418b-a238-8467a9a49425', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e0a53852-1577-4765-8f4b-55b940d04a2c', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e0b88bd4-516a-44e1-bcf2-4838cae664e1', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('e2197b3b-d469-4af6-8c7e-467640ed02ca', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e37c2a86-4f0a-476a-82ff-f2967c1c0e08', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e4266793-4f8a-419f-8546-53e3f4c6da32', '185263e6-7fc2-41c1-abaa-a4e4d6d82d76', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('e4e1a911-c342-4c5a-aee6-bdd1f477926c', '097c090c-3ddc-49e0-8bcf-29f8b7fc8e95', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e676c98a-5521-4654-879f-e9e22ce7d906', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('e78dd610-ab5b-4661-adb4-8cd2c9a4c03d', '99c9cb82-c19e-43df-889b-98c4d8f8f2a8', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('eb0b5211-d81f-4eab-bb89-b4202c6254b8', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('eee7b87d-d3d4-4b7b-bfa5-18ec33da8725', '10219638-e508-40f2-8667-1cf70ba474ab', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f080622d-7269-45de-9985-e80eeb2d9d66', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f1173252-90d2-4368-a2a6-77ec5b7e17bd', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f2cd1f60-de5c-42e9-800e-402fd44252ba', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f33e4784-a982-442c-b2f0-5ce857f90cba', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f7b7be71-6f5e-47e6-89aa-e428e057847e', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f8a63316-d19e-4b45-8b78-6145273f3253', 'aac4e447-3987-4a2b-b823-3bfb1bc6e907', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('f8e52758-79ac-4df3-be46-1a250b4d770a', '2c573a1e-f6a9-4a65-89f7-333d0fd97aa1', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('fb8c4d43-b11e-4b9e-bd3e-fd98b314dcf2', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL),
('fc2e1d06-b459-4d58-b379-b1b15995c718', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('fda05d29-c8b0-46bf-bfde-d52e449daf30', '3e6e259a-3969-4168-a924-9dbf1f296f03', '6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', NULL, NULL),
('ffa708ea-1688-43b7-9712-7617caf5170d', 'fc5c8ddd-b30b-46da-97bd-fbaa27e0bbfc', '4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', NULL, NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` char(36) NOT NULL,
  `code` varchar(191) NOT NULL,
  `discount` int(11) NOT NULL,
  `number_of_uses` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `status` enum('active','expired') NOT NULL DEFAULT 'active',
  `creator_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `reviews`
--

CREATE TABLE `reviews` (
  `id` char(36) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `review` text NOT NULL,
  `rate` int(11) NOT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `email`, `review`, `rate`, `customer_id`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('774f981f-98bf-4413-9c66-b4321f17a510', 'بقاله مسقط', 'popeyedeliveryservices@gmail.com', 'تالين. نافذ.', 2, '602a8778-15c5-4ba3-bad2-726aaff5bb13', '320896db-67be-4d28-842a-ee3f82c25b9e', '2023-06-23 01:07:04', '2023-06-15 16:11:33', '2023-06-23 01:07:04'),
('9cebcca0-a25a-4d4b-801d-faacfce89d6c', 'Maichel Sameh', 'maichelsameh@user.com', 'fff', 3, '105b4a16-fe05-4e17-a786-d5a124bcdcf8', '1846fda4-1922-4454-bc6d-a6c69f9379d6', '2023-06-16 16:41:49', '2023-06-14 02:28:56', '2023-06-16 16:41:49'),
('f8959402-e5ca-46e7-bc55-74a37287a045', 'MaichelSameh', 'maichelsameh@store.com', 'product is good', 5, 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '1846fda4-1922-4454-bc6d-a6c69f9379d6', '2023-06-24 16:57:48', '2023-06-14 01:48:31', '2023-06-24 16:57:48');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `settings`
--

CREATE TABLE `settings` (
  `id` char(36) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `map_url` longtext DEFAULT NULL,
  `commission_percentage` varchar(191) NOT NULL DEFAULT '0',
  `app_version` varchar(191) DEFAULT NULL,
  `android` varchar(191) DEFAULT NULL,
  `ios` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `snapchat` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `en_about_us` longtext DEFAULT NULL,
  `ar_about_us` longtext DEFAULT NULL,
  `en_mission` longtext DEFAULT NULL,
  `ar_mission` longtext DEFAULT NULL,
  `en_vision` longtext DEFAULT NULL,
  `ar_vision` longtext DEFAULT NULL,
  `ar_warning_message` varchar(191) DEFAULT NULL,
  `en_warning_message` varchar(191) DEFAULT NULL,
  `en_terms_and_conditions` longtext DEFAULT NULL,
  `ar_terms_and_conditions` longtext DEFAULT NULL,
  `en_privacy_policy` longtext DEFAULT NULL,
  `ar_privacy_policy` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `settings`
--

INSERT INTO `settings` (`id`, `name`, `email`, `phone`, `address`, `map_url`, `commission_percentage`, `app_version`, `android`, `ios`, `facebook`, `twitter`, `linkedin`, `instagram`, `snapchat`, `youtube`, `en_about_us`, `ar_about_us`, `en_mission`, `ar_mission`, `en_vision`, `ar_vision`, `ar_warning_message`, `en_warning_message`, `en_terms_and_conditions`, `ar_terms_and_conditions`, `en_privacy_policy`, `ar_privacy_policy`, `created_at`, `updated_at`) VALUES
('a3f25e1d-7672-4cba-b749-06c2ec799bc2', 'Fresh Fruitable', 'email@example.com', '00000000000', 'address', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>With Popeye , you can now shop easily and effortlessly. The application provides many stores with all the products you need (of all kinds and brands). The application also provides a delivery service to any place in order to save time and effort for users.</p>', '<p>مع باباي، يمكنك الآن التسوق بكل سهوله وبدون عناء . حيث يوفر التطبيق العديد من المتاجر بكل ما تحتاج اليه من منتجات ( بجميع انواعها وماركتها ) أيضا يوفر التطبيق خدمه التوصيل لأي مكان وذلك لتوفير الوقت والمجهود للمستخدمين</p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', NULL, NULL, NULL, NULL, NULL, NULL, '<p>With Popeye , you can now shop easily and effortlessly. The application provides many stores with all the products you need (of all kinds and brands). The application also provides a delivery service to any place in order to save time and effort for users.</p>', '<p>مع باباي، يمكنك الآن التسوق بكل سهوله وبدون عناء . حيث يوفر التطبيق العديد من المتاجر بكل ما تحتاج اليه من منتجات ( بجميع انواعها وماركتها ) أيضا يوفر التطبيق خدمه التوصيل لأي مكان وذلك لتوفير الوقت والمجهود للمستخدمين</p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', '<p><h1>Privacy Policy for Popeye</h1></p>\r\n\r\n<p><p>At Popeye, accessible from https://popeyedelivery.net/, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Popeye and how we use it.</p></p>\r\n\r\n<p><p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p></p>\r\n\r\n<p><p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Popeye. This policy is not applicable to any information collected offline or via channels other than this website.</p></p>\r\n\r\n<p><h2>Consent</h2></p>\r\n\r\n<p><p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p></p>\r\n\r\n<p><h2>Information we collect</h2></p>\r\n\r\n<p><p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p><br />\r\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p><br />\r\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p></p>\r\n\r\n<p><h2>How we use your information</h2></p>\r\n\r\n<p><p>We use the information we collect in various ways, including to:</p></p>\r\n\r\n<p><ul><br />\r\n<li>Provide, operate, and maintain our website</li><br />\r\n<li>Improve, personalize, and expand our website</li><br />\r\n<li>Understand and analyze how you use our website</li><br />\r\n<li>Develop new products, services, features, and functionality</li><br />\r\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</li><br />\r\n<li>Send you emails</li><br />\r\n<li>Find and prevent fraud</li><br />\r\n</ul></p>\r\n\r\n<p><h2>Log Files</h2></p>\r\n\r\n<p><p>Popeye follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.</p></p>\r\n\r\n<p><br />\r\n<h2>Advertising Partners Privacy Policies</h2></p>\r\n\r\n<p><P>You may consult this list to find the Privacy Policy for each of the advertising partners of Popeye.</p></p>\r\n\r\n<p><p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Popeye, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p></p>\r\n\r\n<p><p>Note that Popeye has no access to or control over these cookies that are used by third-party advertisers.</p></p>\r\n\r\n<p><h2>Third Party Privacy Policies</h2></p>\r\n\r\n<p><p>Popeye\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options. </p></p>\r\n\r\n<p><p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p></p>\r\n\r\n<p><h2>CCPA Privacy Rights (Do Not Sell My Personal Information)</h2></p>\r\n\r\n<p><p>Under the CCPA, among other rights, California consumers have the right to:</p><br />\r\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p><br />\r\n<p>Request that a business delete any personal data about the consumer that a business has collected.</p><br />\r\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</p><br />\r\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p></p>\r\n\r\n<p><h2>GDPR Data Protection Rights</h2></p>\r\n\r\n<p><p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p><br />\r\n<p>The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.</p><br />\r\n<p>The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p><br />\r\n<p>The right to erasure – You have the right to request that we erase your personal data, under certain conditions.</p><br />\r\n<p>The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.</p><br />\r\n<p>The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.</p><br />\r\n<p>The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p><br />\r\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p></p>\r\n\r\n<p><h2>Children\'s Information</h2></p>\r\n\r\n<p><p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p></p>\r\n\r\n<p><p>Popeye does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p></p>\r\n\r\n<p><h2>Changes to This Privacy Policy</h2></p>\r\n\r\n<p><p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p></p>\r\n\r\n<p><p>Our Privacy Policy was created with the help of the <a href=\"https://www.privacypolicygenerator.info\">Privacy Policy Generator</a>.</p></p>\r\n\r\n<p><h2>Contact Us</h2></p>\r\n\r\n<p><p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p></p>', '<p><h1>Privacy Policy for Popeye</h1></p>\r\n\r\n<p><p>At Popeye, accessible from https://popeyedelivery.net/, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Popeye and how we use it.</p></p>\r\n\r\n<p><p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p></p>\r\n\r\n<p><p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Popeye. This policy is not applicable to any information collected offline or via channels other than this website.</p></p>\r\n\r\n<p><h2>Consent</h2></p>\r\n\r\n<p><p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p></p>\r\n\r\n<p><h2>Information we collect</h2></p>\r\n\r\n<p><p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p><br />\r\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p><br />\r\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p></p>\r\n\r\n<p><h2>How we use your information</h2></p>\r\n\r\n<p><p>We use the information we collect in various ways, including to:</p></p>\r\n\r\n<p><ul><br />\r\n<li>Provide, operate, and maintain our website</li><br />\r\n<li>Improve, personalize, and expand our website</li><br />\r\n<li>Understand and analyze how you use our website</li><br />\r\n<li>Develop new products, services, features, and functionality</li><br />\r\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</li><br />\r\n<li>Send you emails</li><br />\r\n<li>Find and prevent fraud</li><br />\r\n</ul></p>\r\n\r\n<p><h2>Log Files</h2></p>\r\n\r\n<p><p>Popeye follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.</p></p>\r\n\r\n<p><br />\r\n<h2>Advertising Partners Privacy Policies</h2></p>\r\n\r\n<p><P>You may consult this list to find the Privacy Policy for each of the advertising partners of Popeye.</p></p>\r\n\r\n<p><p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Popeye, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p></p>\r\n\r\n<p><p>Note that Popeye has no access to or control over these cookies that are used by third-party advertisers.</p></p>\r\n\r\n<p><h2>Third Party Privacy Policies</h2></p>\r\n\r\n<p><p>Popeye\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options. </p></p>\r\n\r\n<p><p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p></p>\r\n\r\n<p><h2>CCPA Privacy Rights (Do Not Sell My Personal Information)</h2></p>\r\n\r\n<p><p>Under the CCPA, among other rights, California consumers have the right to:</p><br />\r\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p><br />\r\n<p>Request that a business delete any personal data about the consumer that a business has collected.</p><br />\r\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</p><br />\r\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p></p>\r\n\r\n<p><h2>GDPR Data Protection Rights</h2></p>\r\n\r\n<p><p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p><br />\r\n<p>The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.</p><br />\r\n<p>The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p><br />\r\n<p>The right to erasure – You have the right to request that we erase your personal data, under certain conditions.</p><br />\r\n<p>The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.</p><br />\r\n<p>The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.</p><br />\r\n<p>The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p><br />\r\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p></p>\r\n\r\n<p><h2>Children\'s Information</h2></p>\r\n\r\n<p><p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p></p>\r\n\r\n<p><p>Popeye does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p></p>\r\n\r\n<p><h2>Changes to This Privacy Policy</h2></p>\r\n\r\n<p><p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p></p>\r\n\r\n<p><p>Our Privacy Policy was created with the help of the <a href=\"https://www.privacypolicygenerator.info\">Privacy Policy Generator</a>.</p></p>\r\n\r\n<p><h2>Contact Us</h2></p>\r\n\r\n<p><p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p></p>', '2023-05-30 21:29:30', '2024-12-23 14:08:34');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `shipping_fee_per_distances`
--

CREATE TABLE `shipping_fee_per_distances` (
  `id` char(36) NOT NULL,
  `distance_from` double(8,2) NOT NULL DEFAULT 0.00,
  `distance_to` double(8,2) DEFAULT 0.00,
  `is_default_distance` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `unit` varchar(191) DEFAULT NULL,
  `country_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `shipping_fee_per_distances`
--

INSERT INTO `shipping_fee_per_distances` (`id`, `distance_from`, `distance_to`, `is_default_distance`, `shipping_fee`, `unit`, `country_id`, `created_at`, `updated_at`) VALUES
('09d6d586-2270-44c6-b4eb-d23dee369be4', 30.00, 40.00, 0, 90.00, 'km', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-23 12:52:01', '2024-12-23 12:52:01'),
('132ee596-1cef-4366-9da0-c4128e00d41f', 10.00, 15.00, 0, 0.00, 'km', '974f4fd5-bd27-47df-9117-6eb823bb339c', '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('187aedb2-c793-4132-8df9-49d2d56b1928', 10.00, 15.00, 0, 0.00, 'km', 'd87c537d-1d8c-49cd-a589-6bc47587a707', '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('1ef759c8-efb7-417b-a849-18205cc7b7a0', 15.00, 20.00, 0, 1.50, 'km', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-04 20:50:42', '2023-10-21 23:37:17'),
('2129fd4f-3349-40ce-bf03-0ce1b6239af3', 30.00, 40.00, 0, 0.00, 'km', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('28c222a7-c628-4641-96a7-311f827c0be8', 20.00, 30.00, 0, 2.00, 'km', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-04 20:50:42', '2023-10-21 23:37:17'),
('294d6086-6180-4a53-aa15-854b2bbd3304', 20.00, 30.00, 0, 0.00, 'km', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('2d9888a0-453a-413c-8a1a-f0352c1f5598', 1.00, 10.00, 0, 0.00, 'km', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', '2023-06-23 16:15:05', '2023-06-23 16:15:05'),
('2fa2c6ba-2418-450c-b7dd-e1a5f1a520ea', 30.00, 40.00, 0, 0.00, 'km', '3cf40936-be5d-4475-9b95-0a0886ca4fd3', '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('38777bf0-df39-4f4f-92fc-df2515dbbec0', 15.00, 20.00, 0, 0.00, 'km', 'd87c537d-1d8c-49cd-a589-6bc47587a707', '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('3fb9c1b3-00e1-4e24-9085-31d8b2a746e6', 15.00, 20.00, 0, 15.00, 'km', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-06-04 00:08:55', '2023-07-23 16:44:30'),
('4ad0244f-093d-4d15-9a1a-5679c3b8db37', 1.00, 10.00, 0, 10.00, 'km', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-23 12:52:01', '2024-12-23 12:52:01'),
('5283df5e-5d12-4bcd-a45a-d1181121e302', 40.00, NULL, 1, 120.00, 'km', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-23 12:52:01', '2024-12-23 12:52:01'),
('5313e494-0bb3-4a30-9665-17a21d92b3f1', 40.00, NULL, 1, 30.00, 'km', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-06-04 00:08:55', '2023-07-23 16:44:30'),
('55550d9b-f35c-4cff-ad96-f2d50f1b0bc6', 30.00, 40.00, 0, 0.00, 'km', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', '2023-06-23 16:15:05', '2023-06-23 16:15:05'),
('56839e4a-5d27-44e2-add7-18981a458e46', 20.00, 30.00, 0, 80.00, 'km', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-23 12:52:01', '2024-12-23 12:52:01'),
('58774177-f83d-4dfa-9cc0-b7adcbb4b7dd', 40.00, NULL, 1, 0.00, 'km', '3cf40936-be5d-4475-9b95-0a0886ca4fd3', '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('59abb32e-991b-4c9e-bf24-6c80062ae22a', 40.00, NULL, 1, 0.00, 'km', 'd87c537d-1d8c-49cd-a589-6bc47587a707', '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('5ee8889b-67cf-49f0-8f96-81585a8db96a', 40.00, NULL, 1, 0.00, 'km', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('61cd66a6-5c47-4932-94c8-0627ef6538ef', 30.00, 40.00, 0, 0.00, 'km', 'd87c537d-1d8c-49cd-a589-6bc47587a707', '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('66c620df-eb15-4d68-899b-68234863d0c3', 15.00, 20.00, 0, 0.00, 'km', '3cf40936-be5d-4475-9b95-0a0886ca4fd3', '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('6b9a8344-31b5-4f2d-a85c-bde4b1756980', 10.00, 15.00, 0, 1.20, 'km', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-04 20:50:42', '2023-10-21 23:37:17'),
('6c70dcae-0386-415b-b8c2-f3d574c7e948', 1.00, 10.00, 0, 0.00, 'km', '3cf40936-be5d-4475-9b95-0a0886ca4fd3', '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('79711dc4-0829-4b90-b085-64c1739906ef', 10.00, 15.00, 0, 0.00, 'km', '3cf40936-be5d-4475-9b95-0a0886ca4fd3', '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('802b8e7b-7a04-436e-baba-9151525dbcc8', 20.00, 30.00, 0, 0.00, 'km', '974f4fd5-bd27-47df-9117-6eb823bb339c', '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('81ebfa16-b539-45d9-93ee-72c0d7ef3e91', 1.00, 10.00, 0, 0.89, 'km', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-04 20:50:42', '2023-10-21 23:37:17'),
('836cf37b-341d-42e3-9c16-46c37ebf827d', 15.00, 20.00, 0, 0.00, 'km', '974f4fd5-bd27-47df-9117-6eb823bb339c', '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('86f65575-62a7-40ea-9609-f4d0e1bcec4b', 40.00, NULL, 1, 0.00, 'km', '974f4fd5-bd27-47df-9117-6eb823bb339c', '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('8a294660-4860-4afe-8b3b-97179062f6be', 20.00, 30.00, 0, 0.00, 'km', '3cf40936-be5d-4475-9b95-0a0886ca4fd3', '2023-06-23 16:16:57', '2023-06-23 16:16:57'),
('96b9fe73-ab9d-4fd5-8db3-bf9a30945bff', 20.00, 30.00, 0, 0.00, 'km', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', '2023-06-23 16:15:05', '2023-06-23 16:15:05'),
('97a6ba90-2da8-4f08-b326-a2f615b58768', 15.00, 20.00, 0, 70.00, 'km', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-23 12:52:01', '2024-12-23 12:52:01'),
('9bb7d13b-5dd0-49c4-b56b-c31eae246a8e', 30.00, 40.00, 0, 0.00, 'km', '974f4fd5-bd27-47df-9117-6eb823bb339c', '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('9d93db36-8b07-4800-91ed-bffa87a2a137', 30.00, 40.00, 0, 25.00, 'km', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-06-04 00:08:55', '2023-07-23 16:44:30'),
('9ff6430c-8ad5-42f4-8441-41ed6822c95b', 10.00, 15.00, 0, 0.00, 'km', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('a22a7871-07c1-454a-b12b-d7db64eb0010', 10.00, 15.00, 0, 0.00, 'km', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', '2023-06-23 16:15:05', '2023-06-23 16:15:05'),
('afad86e4-c879-4226-a18b-533b1bf20e28', 1.00, 10.00, 0, 0.00, 'km', '974f4fd5-bd27-47df-9117-6eb823bb339c', '2023-06-23 16:11:33', '2023-06-23 16:11:33'),
('b1e7abb0-f7cc-4d82-8edd-3a467fc2c3f7', 1.00, 10.00, 0, 0.00, 'km', 'd87c537d-1d8c-49cd-a589-6bc47587a707', '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('b65be9a4-5e6c-4068-97f7-cbad884f8e9a', 15.00, 20.00, 0, 0.00, 'km', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', '2023-06-23 16:15:05', '2023-06-23 16:15:05'),
('c4eae800-5644-42a3-83e2-cfebefe898c4', 1.00, 10.00, 0, 0.00, 'km', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('cc7ef645-4372-4be8-8322-d1b0a9beda79', 20.00, 30.00, 0, 0.00, 'km', 'd87c537d-1d8c-49cd-a589-6bc47587a707', '2023-06-23 16:13:15', '2023-06-23 16:13:15'),
('ce42abda-a3b1-4a90-a1fb-6030f70ba546', 15.00, 20.00, 0, 0.00, 'km', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', '2023-06-23 16:09:24', '2023-06-23 16:09:24'),
('ceeeeec2-f539-4aff-ad6e-2f9330d2021a', 30.00, 40.00, 0, 3.00, 'km', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-04 20:50:42', '2023-10-21 23:37:17'),
('d0ae3b8e-eda7-4430-b420-40bae7651365', 10.00, 15.00, 0, 10.00, 'km', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-06-04 00:08:55', '2023-07-23 16:44:30'),
('d82a95c5-caeb-4972-b1ff-1d715cfc3957', 40.00, NULL, 1, 0.00, 'km', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', '2023-06-23 16:15:05', '2023-06-23 16:15:05'),
('e45a10c9-f547-4df6-b5b8-92414ff89d87', 1.00, 10.00, 0, 5.00, 'km', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-06-04 00:08:55', '2023-07-23 16:44:30'),
('e618f9e2-0589-4a70-ba67-13d75f55cada', 40.00, NULL, 1, 4.00, 'km', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '2023-06-04 20:50:42', '2023-10-21 23:37:17'),
('f44ee6a4-00b2-4403-afb4-89c67655ee56', 20.00, 30.00, 0, 20.00, 'km', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '2023-06-04 00:08:55', '2023-07-23 16:44:30'),
('fd9d0084-8394-408d-8357-653226327748', 10.00, 15.00, 0, 60.00, 'km', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '2024-12-23 12:52:01', '2024-12-23 12:52:01');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `subscribes`
--

CREATE TABLE `subscribes` (
  `id` char(36) NOT NULL,
  `subscriber_email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(191) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `phone_code` varchar(191) DEFAULT NULL,
  `national_id` varchar(191) DEFAULT NULL,
  `verification_code` varchar(191) DEFAULT NULL,
  `shipping_fee` double(8,2) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `area` varchar(191) DEFAULT NULL,
  `lang` varchar(191) DEFAULT NULL,
  `total_current_wallet_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `type` enum('customer','admin','company','driver') NOT NULL DEFAULT 'customer',
  `status` enum('active','pending','disable') NOT NULL DEFAULT 'pending',
  `is_availability` tinyint(1) NOT NULL DEFAULT 1,
  `on_trip` tinyint(1) NOT NULL DEFAULT 0,
  `bio` longtext DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `active_country_id` char(36) DEFAULT NULL,
  `country_id` char(36) DEFAULT NULL,
  `city_id` char(36) DEFAULT NULL,
  `categorization_id` char(36) DEFAULT NULL,
  `zoom` varchar(191) DEFAULT NULL,
  `firebase_cloud_messaging_token` varchar(191) DEFAULT NULL,
  `account_social_provider` varchar(191) NOT NULL DEFAULT 'normal_account',
  `account_social_provider_id` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `instagram` varchar(191) DEFAULT NULL,
  `snapchat` varchar(191) DEFAULT NULL,
  `youtube` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `email`, `email_verified_at`, `password`, `phone`, `phone_code`, `national_id`, `verification_code`, `shipping_fee`, `longitude`, `latitude`, `address`, `country_code`, `country`, `city`, `area`, `lang`, `total_current_wallet_amount`, `type`, `status`, `is_availability`, `on_trip`, `bio`, `provider`, `provider_id`, `active_country_id`, `country_id`, `city_id`, `categorization_id`, `zoom`, `firebase_cloud_messaging_token`, `account_social_provider`, `account_social_provider_id`, `facebook`, `twitter`, `linkedin`, `instagram`, `snapchat`, `youtube`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
('01457cd9-144f-4eb2-988e-18e55d035361', 'Fud Nfjg', NULL, 'ugyy63@gmail.com', NULL, '$2y$10$R4lAFooakQAL/UDj9VoEneaajdkCihdtqs6ARleGBcgdALh5LcLwO', '0554458301', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', NULL, NULL, NULL, 'fJSyu0x6R6C5_QSnO4DkWr:APA91bF9GmFJPQAZY4YTLnRPNYnAKQGpl0vLiQIj4MI4l2yfjHPnP4JopacTLQa4ql8oagSMOj_IWOSuZjKLTuT2ZBzcumoAP8vpeK7qpmWxduqEseWkpZQyuF2DCeREqcCAHXzWZBHC', 'google', '116504048544469309562', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-28 22:02:08', '2023-08-28 22:02:57'),
('086d731e-cef8-42a6-9edd-49fd0df790ce', 'Mera Pakistan', NULL, 'mrsabir2469@gmail.com', NULL, '$2y$10$cnIaHr8TJek3o4Oa5JxiY.ZCFtVwU2J.gQyU7aol48YjmcLfEDQzm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'dIy-u8p7TNGq02dmSz-oab:APA91bHwdJZBtqLjoUrl4KxfScK2zyTL_epzrdtdxSkawB08IHWNI62B7sHPd4ftq5tUzYOzEpECygk0O596YjbbLM7P-Xath3ibPx3-Q5s6LDBeCUgC4FhowPFdywLm30GicP0aSnAe', 'google', '116883935853024242019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-20 15:55:34', '2023-07-20 15:55:23', '2023-07-20 15:55:34'),
('095e992d-6ede-460a-b640-301d3465faf2', 'Sayem Hossen', NULL, 'sayemhossen874@gmail.com', NULL, '$2y$10$cH5.iQc60iMI91ImIf03vOtWPmOC/W83zGfWbIxYGp4NmxND6an86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', NULL, NULL, NULL, 'egqizWnHRES89phetHCPgF:APA91bGENfEWNdX_7VkrHqxcROMvaSjuQtjNd3Ma2hKqELI4L97zglOkEzy5czUeahNmril5DGRVXL9gLPn24YrK2B6iGzRssmc9UsGwIqc0utpaLLXw5M0', 'google', '104193968332465536997', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-27 01:45:43', '2024-12-27 01:45:44'),
('09ef3f34-5e3d-45c9-8e49-032dd2798e3f', 'Am Em', NULL, 'ameera.teacher.2020@gmail.com', NULL, '$2y$10$4XCa/qy.5MfE9CF4LHlyXu6572C6qQ/nFnGLhraY4/qF1xqYeUVZe', '94453888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'dh77ft6YrkJsoZnvVEy9-d:APA91bFqaGXQPcXGuYzh8vhWBkhBv87cCs_2VFJyot_RPLv3xLOTMAbsS9zca_Cv1Cp3j6sKMGzHN7b6XwaiMypEwWZ6KSb9BlDZd5tFH8mbnEv-qCBlMfJa98URpJEvyal2Gt-dQi54', 'google', '112272676603846752925', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-30 13:33:09', '2023-07-30 13:33:37'),
('146de26b-2521-4b4b-9002-6926d134ca36', 'Admin User', 'Admin User', 'admin@example.com', '2023-05-30 20:12:16', '$2y$10$3AqfnQiPjMcCVd71YdNP1uOrOfmTCmq8y/HvaECRo8mKhCMLgxaeG', '12345678901', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'admin', 'active', 1, 0, NULL, NULL, NULL, '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-30 20:12:16', '2024-12-24 08:52:52'),
('1476a3f4-3a68-4619-ae2d-443109fbac8d', 'Popeyedelivery Services', NULL, 'popeyedeliveryservices@gmail.com', NULL, '$2y$10$rmSh9A/StRKgDvCdZaa6L.sZ2UCvjP34uAkqwiTqajU47RKRpAG8.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'evKmzkkoRya8gvWn9OUkk-:APA91bHilCZPzrG3FS2Dq-DUMS5ND4F0-0NpKGQCViIV-HBtfyCGOb9w8E62Ic11OAehvX_glW3JdLO5KV6MwfAN0t--mLqyoqXbf0_xAvrgMVxBj0e2f4rAqGcXOk4bHEeceDJAXhaq', 'google', '100705677129006563642', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-05 04:22:36', '2023-11-05 04:21:12', '2023-11-05 04:22:36'),
('1522698a-4178-4f28-9afe-3f75e6710684', 'Apple John', NULL, 'wtndmrj2s5@privaterelay.appleid.com', NULL, '$2y$10$WDvsXtpAGLqxyPQHVoU7wOcgIJ57QKkYrVqT4NGdCxL8InZIjutrC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'eb3fbe83-f76d-4353-a059-c9e5796324e5', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', NULL, NULL, NULL, 'euUw_cD7Nkpovn5ROYZNX0:APA91bFZstpaYh922oTVWRHnUdAk60qhx-BfFWXRt06AEv1pd0bidvj5AcfmCIaLJ1Pm-IFmol5hO2mTjwG7I0bqgYblHt3XohEmJ6aMLE8BWsf-NqY18S-jPDr6DxA2qLilBhXwIvFN', 'apple', '001944.f8daee8599454faf9daabc8c4fb78d3a.1440', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-18 18:40:48', '2023-08-18 18:40:48'),
('169925d3-d8a2-4b8c-9f1e-5871779e35b2', 'eturtujrt', 'admin', 'admin@360lims.com', NULL, '$2y$10$TNiCJFAJrLJTKyZdE.rfF.FOyawIZlChP1DcqwkeRsJxiJZ.PC4ce', '01882046404', NULL, NULL, NULL, NULL, '-180', '85.05112877980659', 'Chittagong', NULL, NULL, NULL, NULL, NULL, 0.00, 'company', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('1e265d30-b8db-480f-a20b-7bdfeee904e4', 'Apple John', NULL, 'xqp6d95q94@privaterelay.appleid.com', NULL, '$2y$10$ErrZxszgwbFI6RhAIa8jOetbcLN2oJSQN1sjvDMFNbhXLOX2rYV0S', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, NULL, NULL, 'apple', '001452.62503f3eaa5d471c871e1a1d32079883.2009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-07 00:09:27', '2023-07-07 00:10:45'),
('1ef1ab55-4f60-45cb-b663-e7310c4ece60', 'Samia Khan', NULL, 'samia.k55.sk@gmail.com', NULL, '$2y$10$1ohXFAZAdP5v7lRjtjJQVOM1rzRw2veP6p6kUcYChbYF5M5vneki2', '542988093', '971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '974f4fd5-bd27-47df-9117-6eb823bb339c', '974f4fd5-bd27-47df-9117-6eb823bb339c', NULL, NULL, NULL, 'dYmAZSvzjExQh-JDV05Xy8:APA91bGpH3LP84D8dbYaCY1U8KPHcDynr9eKgUre79GbkkCrG_ENwWt6CM1I7sFNS7iZ-Wm4pZiQR7bOaAKsV4-qaV2IH4aO4raPcN5lf8x5x-sB6WzEmFP3YdayeV_nj7WaoEyiHhjt', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-21 20:00:53', '2023-07-21 20:00:54'),
('2002a982-550c-4a6e-9956-8d4c79b1e98e', 'نوال العازمي', NULL, 'anwal4868@gmail.com', NULL, '$2y$10$paCDZZR7qcZBf1Mwxf6fu./UVfm3HajLOd9vMlN5/EwsPZ3SeEUdy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'eb3fbe83-f76d-4353-a059-c9e5796324e5', 'eb3fbe83-f76d-4353-a059-c9e5796324e5', NULL, NULL, NULL, NULL, 'google', '110805384963949573255', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-10 04:06:16', '2023-07-10 04:05:28', '2023-07-10 04:06:16'),
('26d5ef4e-5a40-486a-8543-545bab6a316c', 'Jeronette', NULL, 'jeronettethomas@gmail.com', NULL, '$2y$10$5RoWJW/yUJL9rgaGwS396eVPhp7x5QL8AeV2L3tJFs8yMps5aWKMW', '7186906458', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '974f4fd5-bd27-47df-9117-6eb823bb339c', '974f4fd5-bd27-47df-9117-6eb823bb339c', NULL, NULL, NULL, 'fDbp7BH6l0GKuzeArE8-_S:APA91bFcqrCUzPw5JzB_44FQiqEdPkHGjZzA-1bbbhSg8UUsnonnOBOZ7AUFxB_ElNPXtMktUq4jliPPL-U-3kg2UhozGaE6okMJ27reupUoiPM8-eBa0M46ZpibqLw-_Jn0PyZfNali', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-16 17:00:13', '2023-07-16 17:00:13'),
('3369a308-6ee2-439e-b03a-37a62ca20974', 'hadeel', NULL, 'sawsan_zaitone@yahoo.com', NULL, '$2y$10$wIrr6KygDabiurnH.y.WrONjxU1T1fxNt/mxdbbUzibhL/WqajHDS', '1091702302', '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, NULL, 'f-JcHm0_MEcDkU0sswuFDj:APA91bEEJvzcE8MyaEOJMrutU91QiTSnY47GFARyvb6fJysqNQAMTwK2DHBrR5dqr5TmLHHCvI8udCqccMcvR6CQdGxFkqyNpZpNlO9k75i54nu10FuNN-JbwVa5_mewtTwqOUGPOcef', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-25 04:32:11', '2023-07-25 04:39:41'),
('37fb4bc8-57aa-444f-931a-5cf2e9df2cb0', 'Tariq', NULL, 'tasaheel110@gmail.com', NULL, '$2y$10$VslLrDJR26vCv5Vny.J/kuNYx2vE39uIyeF2WVnevWpXSlq3zS6Ym', '94339445', '968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ar', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-27 01:25:46', '2023-08-27 01:25:46'),
('45fafc68-7a9d-4f73-b00d-c30ea38a7a07', 'jkdsfgj', 'hgkjhfdhjk', 'sdfg@gm.com', NULL, '$2y$10$SnCFM1t1eTfe19C03ZXQ.OTc94CrHIzjd23jBQa9nbf0Xm8os8bdS', '01882047414', NULL, NULL, NULL, NULL, '90.42241715921634', '23.748399765255886', 'jhkhfdghjn', NULL, NULL, NULL, NULL, NULL, 0.00, 'company', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '3ad6484f-2ec2-426f-a3a7-795f6cc7b6da', '15', NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('481b7b0f-ff7b-4585-abdf-e02efb8bd891', 'Maichel Sameh', 'maichelsameh', 'maichelsameh@store.com', NULL, '$2y$10$swKvOEoaefw2nkMa1Kgqae7j6J.t9d5maI54LYh0/BBTCd4reXYLi', '1276061810', '20', NULL, NULL, NULL, '56.7818132', '23.5520596', ', Kahanat, Oman', 'OM', 'عمان', 'Ad Dhahirah Governorate', 'Kahanat', 'en', 0.00, 'company', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', '15', 'dnguONFYTpy0dOwaR8BqOW:APA91bHV3vWsyCjPn2hynD8jkLWGMevZAFOtFGERN6KBAOVCkpsoU79qeoBSuM2Zdw4ybpjt1K0w0JLjRy0QjcP1oQ-YhBakD9jwQICoRfdT4kTUPD_mPaR6gDYAkfeqjhgR5eKBcLkW', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-29 17:01:43', '2024-09-30 19:39:53'),
('4cd38b10-1ec3-447f-86e8-25c4a1d5f2e1', 'خالد', NULL, NULL, NULL, '$2y$10$YxPZrSVgyfGVdZiYKdRHou3Ww4bXXS5ujl5j.I2IsfQGryiPydwK6', '77444721', '968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ar', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'cWplqUUERpu62fvWW7p88Z:APA91bF4-1BncExiRw003L5TFDmL25Rbj00Xp0pti0CbSlXL3Hc9MAbGSbhx-YaHB2t-YZ5HPMR53fQrj9qfRaAg3rXQWxpbjENBf20jpF4BKAjTpc9g0Wv-Tdq0Y6DgBSOA1Mx-EuEx', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-02 16:52:37', '2023-12-15 15:12:30'),
('5fb024a2-c01e-490d-affd-6c18d8fc64a2', 'سعيد', NULL, NULL, NULL, '$2y$10$zJ4XIxaSBTSr0Co4s9cuK.DMuDckZNqVPpYW/SbL3Cp1bc6fFCYwu', '77577158', '968', NULL, NULL, NULL, '58.115012347698', '23.638023320442', ', شارع الخير, السيب‎, عمان', 'OM', 'Oman', 'Muscat Governorate', 'Sib', 'en', 0.00, 'driver', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'd5GpCTYNTraVba_VGqNxpq:APA91bG5Um-3XxyBVMsjALnfjXDsrjhYKju4md4sIrZHICEGS92hPWAO7JdwbFLGtZDGXlkfdsBZ0eQHjLIZqs4TN34cLROX_sc1hXrynr1fUCrheFr1vskjiyI78hYZ-GvfkcVddR9o', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-13 13:18:20', '2023-12-26 21:22:51'),
('6a527751-31bd-4b21-9392-c00cf807b005', 'Cillian Neiland', NULL, 'cillianneiland2@gmail.com', NULL, '$2y$10$jIJB7qhOeF.G25GJ0N8tGOIu2YRGSWNg.LkJr1PDjb0WFYDylLIw2', '851294229', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'fcecQ0vSeUC4pH2QC4Lvlo:APA91bEstCGiuSsZ99evXuHzmGnMUds4E7X9GD70pvTcvR20-ZZT8k3u2Yr3k0OcZ0IFdXtXepFlIbjUZ_RsInyCedBKd33tpOk9vjn7jSMFbDr0PWe5ooJ8B6qu-HS0eEB2MEoTThZr', 'google', '102909918461047860222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-24 02:07:09', '2023-10-24 02:07:43'),
('6b29611a-13d2-40c1-adc8-9ccf9b6dacb5', 'Maichel Sameh', NULL, 'maichelsameh@user.com', NULL, '$2y$10$dVa51bbItjbhx2hLSbwE2eYj5UuXztmVOMmxhKf3Jm/t3vL6ikfpy', '1226233679', '20', NULL, NULL, NULL, '58.44299588352442', '23.596580086363556', NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-29 07:29:25', '2023-11-26 02:36:14'),
('6ff6741e-41af-464d-bf70-56c3fdf362c7', 'Aziz Awad', NULL, 'azizawad12345@gmail.com', NULL, '$2y$10$AdZNXKnVp8vag.tf27.dw.nf/t4vDNrnK9spKxX5hDuLR./hCPIKu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '974f4fd5-bd27-47df-9117-6eb823bb339c', '974f4fd5-bd27-47df-9117-6eb823bb339c', NULL, NULL, NULL, 'cJRLptZ5QlCKWa5fAMwQea:APA91bFCociuOxlcFlERlvlGBgl5cDoO5_3HylA4MmZKo2V8RLEoq2d3WgkpnZeqB2sr5DWeAfh_02DfnDZpxPVCcLxUr93ittt_xcCP8sDaQnJ87VpLSlnnJrrhk8-LAHReHbMVMJRu', 'google', '113543741969085592920', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-17 22:22:07', '2023-09-17 22:22:08'),
('71a50ee7-7db9-466f-a46c-9d9a1ca05118', 'Ghulam Sabir', NULL, 'Ghulamsabir2469@email.com', NULL, '$2y$10$V/n.g4xQw2c2X/WEUsqZkO4.dTWkM6aWiGRaTCkSEdmuvnZUQhgO.', '94322977', '968', NULL, NULL, NULL, '58.11518535018', '23.63788141919', ', Al Khair St, Sib, Oman', 'OM', 'Oman', 'Muscat Governorate', 'Sib', 'en', 0.00, 'driver', 'active', 0, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, '15', 'dIy-u8p7TNGq02dmSz-oab:APA91bHwdJZBtqLjoUrl4KxfScK2zyTL_epzrdtdxSkawB08IHWNI62B7sHPd4ftq5tUzYOzEpECygk0O596YjbbLM7P-Xath3ibPx3-Q5s6LDBeCUgC4FhowPFdywLm30GicP0aSnAe', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-21 14:43:35', '2024-09-30 19:45:39'),
('747a53ec-1108-4ac1-88c6-e77f8cc8dbbc', 'abd', NULL, 'abd@gmail.com', NULL, '$2y$10$y9AzO2DxtgbLRO8d8Ji2a.JFy8Ac9UsvEA0cEus9jF2D6PpeSwk8u', '0996479823', NULL, NULL, NULL, NULL, NULL, NULL, 'mazzeh', NULL, NULL, NULL, NULL, NULL, 0.00, 'driver', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 08:21:38', '2024-10-01 08:21:38'),
('7d4a4da6-1571-400c-ab21-aaf21807c1df', 'add', 'شششش', 'abood@gmail.com', NULL, '$2y$10$ckrFXTWFwoM33BgEvOTNeO./pYCdpZFwDljk8rP4RQsSikaMeBC.C', '0999042011', NULL, NULL, NULL, NULL, NULL, NULL, 'واهع', NULL, NULL, NULL, NULL, NULL, 0.00, 'company', 'pending', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '071964b7-d388-4033-a6eb-33414b1d8a50', NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('81c1488a-1800-46fc-883f-070edc63dd29', 'pinguino', NULL, 'antekjul@gmail.com', NULL, '$2y$10$MJC3Ty09Z9tT6lVqu5xdfO5r/q7yWC/wbCj.zBAnkOWuMowV.zM/G', '508519201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '974f4fd5-bd27-47df-9117-6eb823bb339c', '974f4fd5-bd27-47df-9117-6eb823bb339c', NULL, NULL, NULL, 'eaFmqb3anED_vjoF048ks7:APA91bG4ro0mL2IJdW30Xk0pI8td6WBwsT61RtXL3iFP3FvzGsw_PcuMaz-En61AqEsk_kkkXy3L4C2pzlo76G6GiBCNRRkH5djHQ53OR3XeEN0gMbTBnQegxYpfO-hHKxtTxeBt-D7t', 'google', '100874473574033864785', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-02 21:33:40', '2023-08-02 21:34:05'),
('8210c157-1925-46d5-8315-b04107f24b7b', 'abd', NULL, 'roro@gmail.com', NULL, '$2y$10$GwXXeSyKfPGGM6IJIIKX8.8K3ofIVvCfQJL2E89uV7DmpNA9B03M6', '0999088077', NULL, NULL, NULL, NULL, NULL, NULL, 'ssssss', NULL, NULL, NULL, NULL, NULL, 0.00, 'driver', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 12:47:19', '2024-10-01 12:47:19'),
('8eddabad-9aae-46c3-b420-cb5275bf29b9', 'مععط سليم', 'عبدالرحمن', 'abdox0224@gmail.com', NULL, '$2y$10$mjtjbbgQMzboGTJhygDlxOuLgYKQBGtETpYrYakOqD9WaTit0jp3O', '1503540405', '20', NULL, NULL, NULL, '30.859199278056625', '29.318150795667503', ', قسم الفيوم, الفيوم, , مصر', 'EG', 'مصر', 'الفيوم', 'الفيوم', 'ar', 0.00, 'company', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('90af975f-722e-4625-b63b-8d23f47efba9', 'Maichel Sameh', NULL, 'maichelsameh622@gmail.com', NULL, '$2y$10$YuTFzWUoqZQT.NlGOUCstubmTCmEbfQ8.JguKqMR8ZeHMHBkkb2Vq', '11111111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'apple', '001075.e99aa233578c4130902fe6f6ce3f415b.1415', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-02 04:07:32', '2023-08-26 18:22:53'),
('9762b102-139b-42a4-b2cf-4c24ebec507d', 'Brianne Bailey', NULL, '4662s6d7gf@privaterelay.appleid.com', NULL, '$2y$10$6ZWrSqpP7OviH3lDoeTZ6uyg1g.fiTAS1UnLKEr5MtS3Hoi8OELWy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', NULL, NULL, NULL, 'cqWJmyTAvE3_p4zZOxLpoZ:APA91bFlRKQclrNySwu-Qqfqe3k5De7gFhDjgfWiSywKa6d0vKPVmOXtvBOwcmZw5XHxyN6aILmDpa-sYQ7VrCN73mGNM9XTdIeDNHxb5czRsS5QznDdinPBRX5tTNTspNhSoKgIJC-O', 'apple', '001297.691c113201d94980b33a965d89f6fb93.1742', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-18 21:43:48', '2023-07-18 21:43:13', '2023-07-18 21:43:48'),
('9ff0d858-fa9a-4d6d-b7ce-547ba7315ade', 'مؤسسة خليج - انشاء تطبيق', NULL, 'abdulrhmanabdullh89@gmail.com', NULL, '$2y$10$tE3noM7sd2KWzBNABCx84OZnWyLTC4p4O2w9nL.MDeuL.360oB5ci', '056285288666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, NULL, 'dfRAW4w0SNatpPIrb62SRh:APA91bGMIBMG-qVOUTSuFPYykhrE3a3YT1HwZCg3Y3mjHh3NIzvassIdJSy54vjdJJUtM9wevNaDrBNdYOPQzPUOy8UN4zOC03bP3PEBxDMkojghRF4KMFxE6fmbIY4VA9Njfe-NY6eB', 'twitter', '1242875682306359296', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-02 16:10:30', '2023-08-02 16:10:47'),
('a1ceba76-3589-4119-88c8-651982b9b21c', 'jkdsfgj', 'hdjavfds', 'nishatara7799@gmail.com', NULL, '$2y$10$EmXRflYpoLT5xdNemMrfHu8.rt/gWwae6IeL4EkfhBSeMKlKA95PS', '01882047404', NULL, NULL, NULL, NULL, '90.42927851429444', '23.74464981974929', 'Lebanon', NULL, NULL, NULL, NULL, NULL, 0.00, 'company', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '3ad6484f-2ec2-426f-a3a7-795f6cc7b6da', '15', NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
('a48b0478-25ed-403d-bd3f-f4f299b7ec2c', 'M Waseem', NULL, 'waseemwahlawahla52@gmail.com', NULL, '$2y$10$2afKPDZCEM8zvPlHpV/TJOjuyIexVCm9f3hB8Jx1QjIq/xEgCHzOq', '97290322', '968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-01 00:44:58', '2023-07-01 00:44:58'),
('abec914d-1de9-4e27-ba19-a2725a4e7de1', 'بدر الخيبري', NULL, 'bad15015@gmail.com', NULL, '$2y$10$dXtzbPTPRI.e83YMrhmxBuSUtx2RJBpb8.hJPbV4dibKQQmXHfMb6', '595498888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', NULL, NULL, NULL, 'fyinoqGyTh-ip4okxqsBvQ:APA91bGfoFkrmtKvd_fNCg6szX2DPM8ii9PQqBbUXbeZNlsUDNzETBYY2jTnOqOXXCac6hv9EYTdN_rYstd0bbEY8XXh372udZ6Gwv-D4Jj0DEAI0tKIiDU3oDbyzBTe3pb0ljSVINTf', 'google', '107053737532856796970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-21 23:29:09', '2023-12-21 23:30:50'),
('b3efe98b-5d55-4788-910b-fc2c4178d88b', 'Fg Bb', NULL, 'fgbb6176@gmail.com', NULL, '$2y$10$fcnLagQkD12NQDSVairAWeBZOXE46w66WDmaliX1hVnu/iHNwZbEG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', NULL, NULL, NULL, 'cRdjABXPT6aiWlDk1AkvWP:APA91bG5Tl6ebmFklX8TncgmxkVVKEgyI8wdEefBq7CBAsDgROmqWGYMitJXIqM4BTAVOCoWj6W4ACcTm9Yya5QR5bkJ1kuCxHenB5re5aMTqjXDdjMADCkxZOzYwPE1HcFHKIOgM6SP', 'google', '100913843249865069850', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-27 00:17:10', '2023-08-27 00:17:10'),
('b698ed42-287d-4374-93d6-fc04fe8b0dd2', 'Sayem', NULL, 'sayemhossen873@gmail.com', NULL, '$2y$10$c2zKB3N8y1geV.m10hKT3uaqgRy.cavFUC0LfZQHt1ZC29Znz6pMa', '1882046404', '880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '15d5dcd8-bd97-47e2-9700-6f6423b6698c', '15d5dcd8-bd97-47e2-9700-6f6423b6698c', NULL, NULL, NULL, 'd0uBlCDHRImVAC-RhRspjo:APA91bEVWYeBwJDKAIqGtFb_BsxIMEZIWzrbAHD6qCMg2lvsCF2ELZI_Zja1HMS7CKlTM5sxe2lov-o8R7GZ6sl2FwWxKYTxoW-rbNX7lHjWFypyhI8_HtU', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 08:42:04', '2024-12-26 02:05:21'),
('b6e8c4c8-ec2e-43b4-8af6-2c708b51288b', 'Apple John', NULL, 'xby6zb5w9x@privaterelay.appleid.com', NULL, '$2y$10$EUh073kvm50WKTZhhL6sTOzK8SS99tZj61ARFTTHgrQ6.8ZJ.d136', '12345679', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, NULL, 'cwcLWutgbURsvdKJMOKmtM:APA91bFKq4AU5ERAEVjGogng1It91buHZgGJlqK--TZnXLed3_-BKv3dQn0fgE0B45uoPuhqFP4nHeYtazjeX3aNBNa99p0BOQjR38GuMnnlWCqc477Ok2yTEoskrmpghOCGmmPHZ5op', 'apple', '000789.5c9027ab4b9442f393eb61643d02ec34.1043', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-12 14:44:06', '2023-07-25 16:10:03'),
('c0431474-5272-4ccd-9894-1a7533ea7a09', 'سعيد', NULL, 'asssss@gmail.com', NULL, '$2y$10$H9582uSGn0XcgI0UUPWVTO7vX.w6egPx2O26Uo72/dZfPmClWzB02', '000000000', NULL, NULL, NULL, NULL, '-180', '85.05112877980659', 'aaaaa', NULL, NULL, NULL, NULL, NULL, 0.00, 'driver', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-30 20:14:59', '2024-09-30 20:14:59'),
('c0b5e8ab-e4df-4825-b1dd-e9a090f090f4', 'Sumon Ahmed', NULL, 'sumonahmedsa8891@gmail.com', NULL, '$2y$10$mw/adbPyW33ehPqSpKZo1OTjhyixev.JquNPuYXrmeN7q/2AEqs9O', '78227867', '968', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-02 22:55:04', '2023-07-02 22:55:04'),
('c2055934-7124-4315-9e2c-903cbe60138c', 'Ahmad Kadah', NULL, 'dj5ymxht9g@privaterelay.appleid.com', NULL, '$2y$10$2g6Q6YGFLFo.fZAkxC4fIeQ4oqqhJiJj6znjQeGvS1hL0z7Yg1jsi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '974f4fd5-bd27-47df-9117-6eb823bb339c', '974f4fd5-bd27-47df-9117-6eb823bb339c', NULL, NULL, NULL, 'cO6CgS1MB02yr5z0HwGKeS:APA91bHJCRhTOtN39vokqITz515blcOCSOoCQwA63bA9xZiv28Y5yKbQ8ia5Z8vXjAWJeylxtZiFTlklpsamx8QrLpfoyTU2jYy-cMFugqV7BCNYmlUIecH7qhq_YJ4eZoOzwwkKleAG', 'apple', '001352.0157284c615b4c63a5702b7db46b5fec.0918', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-25 14:18:52', '2023-11-25 14:18:25', '2023-11-25 14:18:52'),
('c48bc76f-7c19-4891-88ce-a448fc0b79a3', 'kuba', NULL, 'kubson_kamien@op.pl', NULL, '$2y$10$5NpnbcI6V1s.Wun2lA7v9uBE.7QpdKP85n2aEiQZ11/b6Gbdrwd7O', '510819385', '48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', NULL, NULL, NULL, 'dT0_L_ykkkbwgeRuHwyj1V:APA91bF2bSjfZnx-Bk6YVv_XD14KE3MBcAMgfNo6ygiGmOQ6LLbnVhn28_7O5xEHQt8WR4s558OZAvdcFLb1Wk749HT61aEAcjWCBRO90wNKeAYjQWVet1ovdzv1g8JxidyQaDrDihrG', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-12 20:25:23', '2023-08-12 20:25:24'),
('da7ade6b-ab3a-4b18-b24b-f18878f5f352', 'و', NULL, 'abdox2g082@gmail.com', NULL, '$2y$10$YU0ggBbFlEnqn/nUrVJBru/EuGQqorn6lkXIsF6PfbJ.YEa/Cj2Se', '1501566661', '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ar', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, NULL, 'c0Rzw03QQoivuLVbWvo9c-:APA91bGcuLzGH96vqSeLYhzlf314mIcsYeh0rZiiJ5mBF3g33kf2e_iWp7VXdUkn2xCqGOXtubPmuhFmkzgVXl7aSntiqWzMtFmz6aZa65meuH8-HJ_p5eEQxLkw8IIhVjKT22R21xx4', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-06 14:02:32', '2023-07-25 00:12:50'),
('daea3b81-e22c-4109-ac48-137840e8a53e', 'Leonique Sinclair', NULL, 'leoniquesinclair4@gmail.com', NULL, '$2y$10$cGO.3XktsEI7E/OlZoD6IuRj4ddkooew6Koklb/w09KeKkabR7Llq', '8768346853', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', '3a0b295c-e5b0-4bb1-9e5c-bbf992c2e1ea', NULL, NULL, NULL, 'csDRNHadbE5ggCDP-Qr5rM:APA91bGjgE1A_IjjxdvkpW4_52rsllYIHSEkB0VHhdJi7phVzCQ3MCll0LF6jjKJ6OUwOFR_QXGWD6AYWlMye5fH2QAdeIYB4FaZ-Qyw1uFORG10FKUKqolh3PwaypMj5P-OEGUznfNO', 'google', '108723313278488187944', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-15 21:33:14', '2023-07-15 21:33:45'),
('e005cc7a-2d12-41f9-b023-ac6048c13721', 'Santiago Guzman', NULL, 'santiagoguzman.83443@gmail.com', NULL, '$2y$10$e8y6ls8I9CC1RImkmw5R/OLjXmVIFTQw9fBSdaf5Lv/DGddXTGQUW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'google', '112785647531621315182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-18 07:43:51', '2023-08-18 07:43:51'),
('e3bb3dba-1aea-4951-bab2-144e7a417d83', 'the first company', 'cop', 'cop@gmail.com', NULL, '$2y$10$X6ybrOYb7saXdch8JJKp7OkWHliXZhG/wL8xWJpNxrEgamDjOeKqS', '0999001002', NULL, NULL, NULL, NULL, NULL, NULL, 'germany', NULL, NULL, NULL, NULL, NULL, 0.00, 'company', 'pending', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, '48c5b450-47ce-4e44-917e-c844eaec5d65', NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('e8ce2c2e-a2f4-4369-94fc-b9bc53ca0366', 'ناصر', NULL, NULL, NULL, '$2y$10$70w9idfmqMmFWyBMyS/3WON6g57w2cavPITb15ypT9.5yIlZG5UaW', '77585895', '968', NULL, NULL, NULL, '58.099426701665', '23.663127284523', 'stop 1, As-Salam St, السيب‎, عمان', 'OM', 'Oman', 'Muscat Governorate', 'Sib', 'en', 0.00, 'driver', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-14 02:44:36', '2023-12-15 15:12:09'),
('edba9357-71c6-48e9-ba9c-205e97f80769', 'CASA CUT', NULL, 'casacut@gmail.com', NULL, '$2y$10$vgQgkzoIpJ0/zYNP8AsDvODs1B3qDobSby83FhzgVKR9hersX/Z.u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', 'ce10fc19-888d-49b9-8bc3-72fe11537a4b', NULL, NULL, NULL, 'fj8gt4-dSDylDGr97z-RdD:APA91bG59TdSxMwjFNmtopAANfwFztkufApt8COJxNG_HYUu2CMIAduZJPRgzotFhSzyh4qfF-OGyxnEKrb2v9uokCHnPjHkRWca-_5GzjGJjrK-DTvKnAlSe4y7jlc6s3Q5nTj4qgz-', 'google', '110064482516121301021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-09-15 17:46:10', '2023-09-15 17:46:11'),
('f7dce302-652b-4950-b225-e80c69236f80', 'Maichel Sameh', NULL, 'maichelsameh@driver.com', NULL, '$2y$10$JuySxk/VN8nkEUKYuhn8Su94/stcOsfFKQzCxC0CZgNHqqA2nduH6', '1205082038', '20', NULL, NULL, NULL, '30.920190531405', '29.966096992035', 'XW8C+C3G, First 6th of October, Giza Governorate 3224710, Egypt', 'EG', 'Egypt', 'Giza Governorate', 'First 6th of October', 'en', 0.00, 'driver', 'active', 1, 1, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, NULL, 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-08 11:10:32', '2023-11-14 01:41:00'),
('ff775f7b-851e-41eb-aacf-dc4bef3a28ab', 'Yasmeen', NULL, 'yasmeenzehra@gmail.com', NULL, '$2y$10$oBPG0It9YXXu5QYnrWIKReFxLPv19lJfEhKlGFGCqat8mXfHH/zSq', '7826400043', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0.00, 'customer', 'active', 1, 0, NULL, NULL, NULL, '4e77c992-c68e-4ad6-bc5a-8b26878f0075', '4e77c992-c68e-4ad6-bc5a-8b26878f0075', NULL, NULL, NULL, 'cc326TABYE7LmC1nubL-Vf:APA91bH7TegFq68P3_eYZJY0RxT-YppdRHl6LLYgwfyh-HnUZc09ORgyx59JVBSXBH3l9Ij5ZupnOd9wWxALX_8IkpoifgzJ28iDyVLGZsa2kTvNJ3gCjvlX01nx1UiaBRD5leWeYZnl', 'normal_account', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-17 03:19:25', '2023-07-17 03:15:04', '2023-07-17 03:19:25');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_categorizations`
--

CREATE TABLE `user_categorizations` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `categorization_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_promo_codes`
--

CREATE TABLE `user_promo_codes` (
  `id` char(36) NOT NULL,
  `available_quantity` int(11) NOT NULL,
  `promo_code_id` char(36) DEFAULT NULL,
  `customer_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) NOT NULL,
  `balance` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `company_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `work_times`
--

CREATE TABLE `work_times` (
  `id` char(36) NOT NULL,
  `en_day_name` varchar(191) NOT NULL,
  `ar_day_name` varchar(191) NOT NULL,
  `day_order` int(10) UNSIGNED NOT NULL COMMENT 'Used to order days instead of created_at',
  `raw_order` int(10) UNSIGNED NOT NULL COMMENT 'Used to order days in OS ',
  `day_is_vacation` tinyint(1) NOT NULL DEFAULT 0,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `work_times`
--

INSERT INTO `work_times` (`id`, `en_day_name`, `ar_day_name`, `day_order`, `raw_order`, `day_is_vacation`, `open_time`, `close_time`, `user_id`, `created_at`, `updated_at`) VALUES
('013fe60a-b252-4fe1-83c7-d0dc696d01ae', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('0a44f2f1-0aca-4190-b505-076a26bd1392', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('0cb94ff6-f6fa-4815-8687-425bfb451caa', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('0cf1c5bc-2f66-483c-85e1-e0bc8771b7ce', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('0d13e64a-5ccd-48e8-aad0-93ab8be12ccb', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('0d56fecd-b547-47f6-995d-145fc303edeb', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('0da36712-8014-49c5-809c-3f37e39e7cc9', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('0efb2996-8d8a-4c2a-a5f0-04e92de40165', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('0f2c3a69-96f1-4faa-a9d3-30b4cd9ef7e9', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('10ad0a86-7ced-499e-a3a9-f605470e7dec', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('10d549f4-b9e4-4c75-85a3-c4b0edd1f9bc', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('11610917-6caa-4044-8cbd-4829b01f65d2', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('11709546-5bcb-4fd3-bc1e-bb40c5a063f0', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('11bf9bbc-2bc7-4c5a-99f2-5f887b647302', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('11eae4bb-e4ea-485d-91de-42bd50af03cb', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('1259765b-86f8-427f-a80e-aeb158a32a92', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('12775829-f070-413e-b439-d4089de9e5ce', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '18:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('154e6649-bb7b-4d60-882e-130d2f462d19', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('17be3fd9-c0f6-4f9b-9e08-8bf5f0ebcc2e', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('17da993d-e90b-4956-a821-da4a83c30b7c', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('1848a4bd-7e29-4c47-8fa5-8b6bf3ce30ff', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('19a1493a-454a-4660-8be3-367f0205e69c', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('19a6ad71-e0e2-469c-9cd8-0c32a11b9e62', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('1a277545-a8ec-4e28-b3df-d4eeff4ad823', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '23:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('1abf6317-ad81-4a1f-8342-627e370a23da', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('1d6cfc09-4900-4e02-8cc4-bc0fbea5df61', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('1e2ff0b6-98da-409b-b580-41e6a8653282', 'Sunday', 'الأحد', 1, 0, 0, '10:00:00', '11:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('1e9be8e6-5022-4a94-b9d2-6963033aa90d', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('1ebe60f3-440c-4570-8d8e-4ef732246c32', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('1f17741d-d02b-4949-ac1a-54887496eece', 'Friday', 'الجمعة', 6, 5, 1, '00:00:00', '00:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('1f29071b-ca86-45a2-b668-2c178909eb91', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('1fc6b650-6866-443e-9f7c-2297eb831e3a', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('1feca4a7-29d5-4fdf-b958-93ace62f65bd', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('2008ed73-8832-4b82-b0f5-f7b2ccfea140', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('201eef37-6c60-4563-9570-ae1ebf2063a6', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('259cd6ed-4014-4dca-b2aa-894a56abeda8', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('27431640-3d9a-47f4-a1e1-609683212c78', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('297af0bd-5bf2-460d-b162-d638b5bfb51b', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('2b43896b-10ec-4db1-90d7-b206174d1aa3', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('2bb02528-62a1-47b2-913a-dba9810b06b4', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('2c2faee2-f971-46b1-94d9-69bdf6871616', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('2ca827ae-4eec-47b1-a12a-f7f1c0c5d951', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('2d153194-9444-4ed5-8320-6ec8cbb386fb', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('2d1730a4-fd48-471c-bd0f-566a65e77287', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('2d403e2a-0424-43f8-859f-f16810b4a857', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('2d525273-e817-4d34-9af3-0b0a72175bda', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('2dacb822-68d5-462e-89fd-7a509bebe4a6', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('2dda7164-139b-4e84-a6a4-19073940a574', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('2f8bd763-f22a-407b-ad25-f04ec5239277', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('2fb487cf-4cee-4747-85f5-090c7191f134', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('302ca0d9-553e-4b06-a8b2-e89e506aa66a', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('3084067d-18cd-45d8-8120-fb5981a5db77', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('309cd93f-411a-4cb7-acdd-d55662bc2a7f', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('30bdc6de-b1c2-4387-97cb-5c259c94a286', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('31791761-3bea-466f-ab1c-7f646025c0f6', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
('3250a29e-e787-4644-bbe8-c7e615ed77d7', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('32f2fb3b-3591-4b4a-9473-ad5320c1fb5a', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('33313313-a794-48b9-affb-ca941a5031db', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('33e48931-98a1-4469-9ee3-087600408a8b', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('349a7fe9-0209-4033-b8c4-8f04f1cd7045', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('34bdfd46-fdc1-498a-a870-41779fef6566', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('362285a2-c42b-4abc-86da-5c35bf58312b', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('363d02ec-af26-4e19-9b4f-16b518a7106e', 'Sunday', 'الأحد', 1, 0, 1, '00:00:00', '12:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:20:31'),
('36576649-35ec-4504-93b2-0cd2501faeef', 'Tuesday', 'الثلاثاء', 3, 2, 0, '10:00:00', '18:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('36c25264-a74d-4c5f-9e63-f82cba14fbf4', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('37fab6c5-56ca-4c45-ac8f-54d04f684904', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('38d6c15f-48bc-4ece-ac3b-c54f6dca0ac7', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('399f67b7-246b-4a6d-94ac-fd5f6b482e1d', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('3af335a4-38a5-4d4b-895a-5b2fe3daf1d6', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('3b1f4c54-cbea-41ad-962d-2a43ff8e7f49', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('3b37dc8c-00cb-4a54-b776-f61c797a0243', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('3d1e9f65-46c7-4913-a87a-fa7f4ba29a65', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('3f5af540-0e47-4851-a448-3e78891665cc', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('400110ea-b519-4055-a7c4-c68a6bba26e4', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('403ecec5-03ad-4c53-bf58-6cf9068379bb', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('40bc4bc8-6e1d-410c-a4a8-89d562c01efa', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('428b5573-89bc-4c84-8308-3d696edc2954', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('44dbf401-ffb8-48bf-9038-78985acb022a', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('4588e697-1988-4528-82c7-a984430f0e74', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('474a261a-9443-4cbf-aecb-1553e1ffcf01', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('47b2e07e-67b3-4b7b-9006-56afeec6c63f', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('483ec664-ca90-4be0-8935-4ccdf1c611b0', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('49568ffc-eada-49c5-af05-4f6741a2073b', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('4a00968d-32ec-4353-9331-3d760b0259b7', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
('4a205f93-4f89-450c-98a7-0773a442eaa9', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('4ae9467a-6179-4173-86e1-b8c907f3a87c', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('4c1732d1-7f7c-4a07-ae7d-553ca3c812bb', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('4d9eea74-5d7a-46b4-830e-c684aeb1452a', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('4dce2ea8-36fb-4a2c-b2dd-3d0114a9596b', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('4eaca095-f040-49be-8c40-3564bd1683e8', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('4f4a2b2a-2f9c-4214-9cee-9aee4f299d2d', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('52699b9e-385f-46eb-84fe-bf93f1f8251f', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('559406bb-f730-49c5-9ab5-5df42cb7a77d', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('5621d9e8-cb6a-4407-996e-311cae8e6556', 'Monday', 'الأثنين', 2, 1, 0, '10:00:00', '18:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('5756a691-20fe-4320-bc6e-3f684fcabe70', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('580b4626-74dd-42ae-b785-1e79d8f5f4fb', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('5a278530-18c6-4879-b662-eb185b8bf746', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('5aa5f506-ca84-442e-913c-f4c1c789370c', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('5b4b5e1a-9583-4114-81df-6149a8ae2a51', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('5b4f8db8-c3f2-488c-b1ad-a74f7f52a89a', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('5b5a8168-bf67-4875-abfa-7f2649ddff54', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('5ce8b1a4-6bd4-4ecc-a5d9-f273e8687f7d', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('5cff5901-93bd-4d82-b1ee-57c123709161', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('5de6a414-7750-4ea6-9f54-d9b80dbadace', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('5ea525b0-6edb-4c8b-a075-0a1124df48f0', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('5fb74f92-1e19-4145-a1a4-2b9f014ca099', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('60e32040-8ec4-4ed3-9d1e-2cc306d66031', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('62c7cf6f-55bc-46f7-b9e9-69d3dd2a3b3e', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('63c9081c-2497-4692-9b14-e8a3a01740af', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('644b99eb-6a52-45a5-86da-10885d2f4eca', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('662887aa-de34-404a-9564-660aca224b49', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('6690c4c0-445c-4f74-ab5c-6cd2e9f262c8', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('66d91362-9885-46c8-9021-06adf128b600', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('67232c26-7832-40f7-be27-90aa363b2e77', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('67307dd3-d1ad-41f6-86c4-f4ad53248416', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('67deecea-ce26-40de-b99f-7725feb1fdd2', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('6820c772-f47c-46aa-8f33-6a8b233258da', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('693d7652-d289-48d0-a5a9-4f39096a5888', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('696bad24-10eb-4793-a6f6-08375ce93a6f', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('6bf05db9-cc55-4d85-8ffb-eec8472f69e2', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('6c6e3e20-1ce0-4c72-8fe1-844378b68a6b', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('6c78a517-3d45-454e-bc84-73f4269b4a6d', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('6e00090c-aed8-403f-a7d4-20fd2b2e3b5c', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('7054c08e-6905-4477-9cbc-dee0dd126cc2', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '12:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('706bd312-8627-4bbb-a622-41c94ac93aed', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('70922317-2bfd-4375-b088-acfc9d402347', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('71323706-d905-4a21-bc4a-350a2dcbb321', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('7196cf16-bbbc-408c-8930-8559bc45c2a0', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('7327ecf9-f7eb-492f-b884-2cf5bbc79a6c', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('75b2634c-b96d-4e2e-b20c-78a7830f4280', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('762e6713-88f4-4929-988c-e36bfbcc10f3', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('766cdd10-8071-45e4-a82c-4b08f9f92071', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('79809e58-b465-467c-b95e-24e402b2021f', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('79b5d63e-b684-4ddf-9d73-f70490d4d43a', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('7ef9d681-cb6d-4bb8-a3d3-734b33e5f6fe', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('7f169957-4f5c-42e7-aa26-b0e729e78ed4', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('81cb9515-29c5-45cb-986f-9f4ee76ac2ff', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('81f4ef7e-5791-41ef-adb8-5f69cd2c1b27', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('825794a0-59a2-4888-84c0-1f1cc8da756b', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('826dd98b-613d-4bc6-a9d1-710ed1bd0532', 'Sunday', 'الأحد', 1, 0, 0, '10:00:00', '18:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('838dfddc-ed05-43c5-8c8c-0c17fc659ffb', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('8b2d225e-b427-493d-bbd8-7727d8f79997', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('8b8cc511-b26c-45d3-97ba-c18a6c84d7c0', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('8cb58efb-17ec-4c2b-967d-90b3e7d36620', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('8e3bd4f0-72d9-4ee8-989a-5579e66d3027', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('8eab6e2f-2581-4b0f-b0d1-2abac97aed53', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('8f68a055-c22f-421d-b876-1c2c684f1e20', 'Tuesday', 'الثلاثاء', 3, 2, 1, '00:00:00', '00:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:20:31'),
('8fd28c38-db0c-40a5-ab45-5f69075f017f', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('9085368d-ecd5-428d-89a1-a3ae75982f49', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('90a6e902-7cd0-473c-a58e-74545f2c5028', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('90a7f622-8f1e-4593-9a3c-0680139e8b07', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('91112a55-a919-4de2-8e42-10394e6991e0', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('911e12f9-2277-48c3-9602-687e7291068a', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('912ad5ff-d4dc-4cbf-97be-4a317b51c7a7', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('91eddcf5-2d6c-4bf6-844f-92d64d6ee04b', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('928c469a-4990-4e20-9de3-0c19b83bd249', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('92ff2ca1-235d-4900-b257-e8cd87069760', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('94d269eb-c47a-41db-8ee0-09225e30f811', 'Wednesday', 'الأربعاء', 4, 3, 0, '07:00:00', '23:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('958c5176-0026-4e71-b04a-7a3135d96b2e', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '90f8467d-3dd2-4c10-935c-60c40746eaee', '2023-06-25 20:13:52', '2023-06-25 20:13:52'),
('982ffc62-2488-4965-809b-8c1f164e5a41', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('99b442fb-3802-40b6-8b4f-4a75910a5ede', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('9a36de00-b056-4bcc-b8db-4d8593420f80', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('9caa87b8-7fbb-4f3b-9a20-ee9262e47686', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('9d28f331-2100-426e-b79b-c20bd34987c7', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('9dfb7bd8-3bcb-426a-bab5-15cd7595af0d', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('9e7021f9-b244-434b-8219-3a37a2a16b6a', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('9fead241-cf78-47d0-8635-de60f2f05cf2', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('a062923c-0b83-4a15-9c62-6f3a3725ff52', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('a1437caf-a0a5-42a0-91f7-fadc8b8ed6df', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('a2468527-0ea7-46a2-a1e3-1e4892d4b8c5', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('a24872c4-de45-4a32-bb9c-15de3c7edde3', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('a2f82fba-5e23-4992-8766-f56ef202025d', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('a44a312b-815b-41e8-8a5e-eb98605971a3', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('a4a4320f-bd0d-4a6e-b8f6-b38201dc177f', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('a5e32fb5-7b5f-4268-89d6-e0612e108c6c', 'Monday', 'الأثنين', 2, 1, 1, '00:00:00', '00:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:20:31'),
('a5e3f3d9-954b-484f-8a3c-eaaeaccf8eea', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('a622d6ad-ff7a-4c80-9f91-27879f82c796', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('a62b0842-6545-4038-9e0e-f04765837f8d', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '22:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('a790beff-e26d-4ed5-8e9e-b846dc87ce2e', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('a79bffa9-6f82-4990-a247-73ee0a98cc7d', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
('aa02078a-f326-4db6-a668-ed3fe23139bd', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('aa083470-44d1-450e-b1e1-528d0595d0e9', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('ab279a2a-6932-44d3-aa96-9beb3a384b8d', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('ad8ed482-8069-4670-8781-e36a700971c7', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('ae048c58-e90b-4383-ac03-2aa8f0794a75', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('ae3786b2-85df-4f63-b821-537b86dfa3ca', 'Saturday', 'السبت', 7, 6, 1, '00:00:00', '00:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('aedf0726-9dbf-4a62-8f83-7de91d5e1c1e', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('afd4a695-9e9e-4bd7-a490-8a5e679ab96b', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('b08d0f76-4f1f-4da2-85bb-128da8247543', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'a1ceba76-3589-4119-88c8-651982b9b21c', '2024-12-29 11:17:58', '2024-12-29 11:17:58'),
('b138b2b6-79ab-40be-8145-a8ae7fe04d35', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'b1f3fc70-5598-41ac-9794-4dbdb6ae8ceb', '2023-12-08 19:51:20', '2023-12-08 19:51:20'),
('b52da8ff-9275-4ec0-b11b-abba4188b01d', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('b63c21c7-618d-43f3-b91b-fcbb37776dd7', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('b72ef13f-879f-4ffb-9b3d-87c9c75ba108', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '74062592-eb3d-452b-bd1b-bc35ff497d9a', '2023-07-24 18:18:45', '2023-07-24 18:18:45'),
('b97840bd-37c0-4ed0-9d04-c9a610126e9a', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('b9d1cfa9-cdc3-4bd3-a5cc-03c09f170533', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('bad1f1d8-0a0e-4498-8183-b42d6d8aeea2', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('bce0c8a1-e19a-4a1d-8eeb-1d8651b1e061', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('bcfa32b5-f2e6-4971-8a65-a5198af962c6', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '8f758e07-3dce-470d-bd38-6c1e1eab7cc8', '2023-06-24 11:37:17', '2023-06-24 11:37:17'),
('be2221ab-6d37-4e92-be2a-52eb5c72f2c7', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '09b9e208-620e-4bee-8d52-17f528a1c7af', '2023-06-24 11:32:44', '2023-06-24 11:32:44'),
('be2fe7f9-0bfb-4d66-ae00-f1dfa675a983', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'a4ccdf93-e2a3-4e63-83cb-261e37655b61', '2023-08-24 03:58:21', '2023-08-24 03:58:21'),
('bf0dc95d-3b15-4cb8-a4f2-b5ed0d2189c6', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '55185a4b-f018-427f-941d-f483d91a6545', '2023-06-25 14:01:55', '2023-06-25 14:01:55'),
('bf7c92b7-36d3-47f1-a38b-280b19514d9f', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('bfcd6b14-38aa-4f60-8d99-b609888c03ab', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('c1d2dbcf-5c29-4062-a115-129b69e2cf30', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('c4625cfa-5e6d-4572-83f2-d77dac2ca30e', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('c55932c7-6988-4228-beb2-ec7d9414df2b', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('c6494288-7159-4222-ad68-6a5fa9494fa2', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('c68adaad-3e06-4e83-ac46-3637c7416039', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('c793a8f6-e657-4094-a9db-c372f4ec5f4a', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('c97c95e8-c1e4-40ae-8e15-25f8550ab4f3', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('caa0bd63-8fae-45ca-83f9-0bffcca18c01', 'Wednesday', 'الأربعاء', 4, 3, 0, '10:00:00', '18:00:00', 'ed10cea8-5cfe-48ab-8a28-0af671be7bd0', '2023-06-10 04:30:26', '2023-06-10 04:30:26'),
('cac199da-8360-4937-bdff-eef08d66abc7', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '23:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('cbb94df6-9399-45b2-a1a7-0ca1b5226cef', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '11:00:00', '0ba64045-8b10-41e9-bf3a-61cf538124ff', '2023-12-11 05:38:36', '2023-12-11 05:38:36'),
('cc4e1b40-d6e1-431c-a49c-15bc5f798fc2', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '79f5ed4e-b6b4-4328-b6df-034e3108d9c9', '2023-07-04 13:26:53', '2023-07-04 13:26:53'),
('cde7ff3b-82d0-4cae-aa51-1196933b1621', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '45fafc68-7a9d-4f73-b00d-c30ea38a7a07', '2024-12-29 11:22:21', '2024-12-29 11:22:21'),
('cf325fb4-dfd5-4beb-8226-9a878f59414e', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('cfc591aa-89d5-49db-9291-d0a287cf86aa', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('cfca6179-92a5-41c8-944d-90eee0311964', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '82fba06d-eac5-487e-9919-f261ec20667f', '2023-06-29 15:35:36', '2023-06-29 15:35:36'),
('d1e35932-7972-48d9-bd7c-13e1a646f694', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'f63ba367-6a3c-486b-8181-5e474c6a6369', '2023-09-04 01:12:35', '2023-09-04 01:12:35'),
('d26c6bda-3a4e-46ed-a5a9-911677010758', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('d33d1db1-e8a4-4dce-b0c2-299ad7343883', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('d49c7e26-9ee3-4d15-9416-abca605b7514', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('d6c95216-c360-4214-be5c-cb69e52ef436', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('d774f35d-3a7b-42a5-8cc1-ae845de5afde', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('da6c4e6b-bbbb-4146-9da7-f1835dd917ff', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('da907275-7563-467f-8333-903ccb0671d2', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '80d82f89-b611-4ce9-b2a0-850dc36edd8d', '2023-06-29 07:36:14', '2023-06-29 07:36:14'),
('dabfcc87-a66a-4c6a-8300-e98e96a9fc78', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '28b1178e-0380-4440-862c-96e27d2ad2d2', '2023-10-30 02:42:17', '2023-10-30 02:42:17'),
('dadd8c32-f24d-4557-b324-c9ece45ea3b4', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('ddc0327e-77d0-4ed7-992f-dac2311a0f29', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '329b6a7b-c11a-4533-941a-7747b2615d9b', '2023-07-25 00:32:56', '2023-07-25 00:32:56'),
('de99a36a-fc28-415d-8f93-ffef6542b77a', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', 'e3bb3dba-1aea-4951-bab2-144e7a417d83', '2024-10-01 12:40:09', '2024-10-01 12:40:09'),
('df39e892-e62f-45ba-b1cf-f49ed98d6be2', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('e06b4899-13fc-49db-8c5a-8f0cf9befe6a', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '481b7b0f-ff7b-4585-abdf-e02efb8bd891', '2023-06-29 17:01:43', '2023-06-29 17:01:43'),
('e14fbb21-d1e4-4417-8cd6-f0afeeaead31', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'c573b04f-c38e-4bda-9ec7-a69c3d37fb53', '2023-08-24 03:38:39', '2023-08-24 03:38:39'),
('e1813618-88c5-4228-a2a7-5701add73087', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'fb751d69-9fe2-4017-948f-134a1117c41f', '2023-08-20 14:11:04', '2023-08-20 14:11:04'),
('e2659e5f-cc23-436d-a1ca-c390a86056f2', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('e4a8d7d1-f869-4314-9154-751158227873', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('e5f659f3-e1dc-43f7-9d9d-09bd4181d1be', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('e7c58fbc-2770-4f0c-8fc8-4b85ce64a253', 'Wednesday', 'الأربعاء', 4, 3, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('e9c4d3f4-565f-4f6c-93a1-3e2a6005651a', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', 'b31f4cf8-5962-4e8e-ac49-3ac865e96fab', '2023-10-11 13:17:06', '2023-10-11 13:17:06'),
('ea87b546-6f72-4115-95ac-2ae7f4a0d907', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('eb383177-402b-49d0-8026-019c154076d3', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('ebb777a0-d6b9-4657-903a-f0f14d6b6853', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '83cda510-0304-479b-a98f-7b7c8140fd0f', '2023-08-07 00:21:37', '2023-08-07 00:21:37'),
('ec11627f-2b1f-45db-b3bc-7f91f0b2734d', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '061cab1b-ae96-453b-b666-fbeece8c1432', '2023-06-24 22:28:22', '2023-06-24 22:28:22'),
('ec5645a9-7e25-4f81-a388-269fd4faed3d', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'f87edbf2-8bfd-46f9-aff5-a245ac03f1aa', '2023-06-16 23:54:19', '2023-06-16 23:54:19'),
('ed30d04c-f14c-4604-8425-489491d36a8c', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('ee24e647-69d9-467e-871f-ea5efa5278ee', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'bb09984e-1c72-45a5-9641-249d25d70889', '2023-06-30 01:01:47', '2023-06-30 01:01:47'),
('f0d705ab-25fc-4936-8eb2-883c259624a5', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('f0dc215a-3fa5-458f-8717-ee324cd15769', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', 'd52eab22-22c2-49de-ae2b-14cd52a000ee', '2023-07-25 01:52:19', '2023-07-25 01:52:19'),
('f1a6d434-c9bc-430d-b126-2c536964781e', 'Friday', 'الجمعة', 6, 5, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19'),
('f2822c81-5a10-4b90-980d-f262efd29a34', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '8511ab31-ce79-4306-825c-8ff5552f80e4', '2023-06-22 16:39:45', '2023-06-22 16:39:45'),
('f2ff6cb1-20a9-4cdc-85cb-32d280da8f9e', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '0c968939-7f0c-45b8-905d-3731d9a423b1', '2023-09-06 23:45:48', '2023-09-06 23:45:48'),
('f3d32e8b-4494-49ac-bb3f-8b8ac448bc15', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '23:00:00', '3901e59b-89c7-4d6a-9544-ebc43571261b', '2023-12-11 17:57:28', '2023-12-11 17:57:28'),
('f5aed4ba-fc8d-4942-9f2b-b720d6360c46', 'Sunday', 'الأحد', 1, 0, 0, '00:00:00', '00:00:00', '600ae9df-1f17-405b-8a53-187924bb53a9', '2023-06-24 11:35:34', '2023-06-24 11:35:34'),
('f79c0b38-a8a9-43f9-a1f8-ea6fe8539a1c', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '169925d3-d8a2-4b8c-9f1e-5871779e35b2', '2024-12-24 08:54:36', '2024-12-24 08:54:36'),
('f7f4e339-a0e2-4231-9eb0-e9200d554454', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '8eddabad-9aae-46c3-b420-cb5275bf29b9', '2023-06-24 22:07:56', '2023-06-24 22:07:56'),
('f8148017-3ecb-4b0d-84f8-0275bec95a5e', 'Tuesday', 'الثلاثاء', 3, 2, 0, '00:00:00', '00:00:00', '972d2dbc-7fef-43d4-b15d-6eb80e9c27be', '2023-06-25 21:24:03', '2023-06-25 21:24:03'),
('f8325839-5402-4d3c-97a8-db187cf5c501', 'Saturday', 'السبت', 7, 6, 0, '00:00:00', '00:00:00', '642ef59f-9127-4799-a724-93de4af6c3d0', '2023-07-15 01:48:28', '2023-07-15 01:48:28'),
('fa86c4d1-79a7-47ae-a171-37f56b5cf42b', 'Thursday', 'الخميس', 5, 4, 0, '00:00:00', '00:00:00', '59d76e96-8b5e-4300-b85e-f6d465fc928f', '2023-07-07 15:32:40', '2023-07-07 15:32:40'),
('fb86d289-43ee-4c4b-a3e6-d126df5ba628', 'Monday', 'الأثنين', 2, 1, 0, '00:00:00', '00:00:00', '7d4a4da6-1571-400c-ab21-aaf21807c1df', '2024-10-01 11:38:19', '2024-10-01 11:38:19');

--
-- স্তুপকৃত টেবলের ইনডেক্স
--

--
-- টেবিলের ইনডেক্সসমুহ `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_owner_id_index` (`owner_id`),
  ADD KEY `addresses_country_id_index` (`country_id`),
  ADD KEY `addresses_city_id_index` (`city_id`);

--
-- টেবিলের ইনডেক্সসমুহ `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_data_country_id_index` (`data_country_id`),
  ADD KEY `banners_creator_id_index` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_creator_id_index` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `canceled_orders`
--
ALTER TABLE `canceled_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canceled_orders_driver_id_index` (`driver_id`),
  ADD KEY `canceled_orders_order_id_index` (`order_id`);

--
-- টেবিলের ইনডেক্সসমুহ `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_index` (`product_id`),
  ADD KEY `carts_customer_id_index` (`customer_id`),
  ADD KEY `carts_store_id_index` (`store_id`);

--
-- টেবিলের ইনডেক্সসমুহ `cart_additions`
--
ALTER TABLE `cart_additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_additions_cart_id_index` (`cart_id`),
  ADD KEY `cart_additions_addition_id_index` (`addition_id`),
  ADD KEY `cart_additions_cart_group_addition_id_index` (`cart_group_addition_id`),
  ADD KEY `cart_additions_group_id_index` (`group_id`);

--
-- টেবিলের ইনডেক্সসমুহ `cart_group_additions`
--
ALTER TABLE `cart_group_additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_group_additions_cart_id_index` (`cart_id`),
  ADD KEY `cart_group_additions_group_id_index` (`group_id`);

--
-- টেবিলের ইনডেক্সসমুহ `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_creator_id_index` (`creator_id`),
  ADD KEY `categories_categorization_id_index` (`categorization_id`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- টেবিলের ইনডেক্সসমুহ `categorizations`
--
ALTER TABLE `categorizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorizations_creator_id_foreign` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_creator_id_foreign` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `classifications`
--
ALTER TABLE `classifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classifications_creator_id_index` (`creator_id`),
  ADD KEY `classifications_categorization_id_index` (`categorization_id`);

--
-- টেবিলের ইনডেক্সসমুহ `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_country_id_index` (`country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_creator_id_index` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_creator_id_foreign` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_creator_id_index` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_favorited_type_favorited_id_index` (`favorited_type`,`favorited_id`);

--
-- টেবিলের ইনডেক্সসমুহ `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- টেবিলের ইনডেক্সসমুহ `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- টেবিলের ইনডেক্সসমুহ `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_index` (`customer_id`),
  ADD KEY `orders_driver_id_index` (`driver_id`),
  ADD KEY `orders_provider_id_index` (`provider_id`),
  ADD KEY `orders_address_id_index` (`address_id`),
  ADD KEY `orders_payment_method_index` (`payment_method`),
  ADD KEY `orders_platform_index` (`platform`),
  ADD KEY `orders_payment_id_index` (`payment_id`),
  ADD KEY `orders_refund_id_index` (`refund_id`),
  ADD KEY `orders_country_id_index` (`country_id`),
  ADD KEY `orders_city_id_index` (`city_id`),
  ADD KEY `orders_data_country_id_index` (`data_country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `orders_reports`
--
ALTER TABLE `orders_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_reports_order_id_index` (`order_id`),
  ADD KEY `orders_reports_company_id_index` (`company_id`);

--
-- টেবিলের ইনডেক্সসমুহ `orders_requests`
--
ALTER TABLE `orders_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_requests_order_id_index` (`order_id`),
  ADD KEY `orders_requests_driver_id_index` (`driver_id`);

--
-- টেবিলের ইনডেক্সসমুহ `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- টেবিলের ইনডেক্সসমুহ `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_data_country_id_index` (`data_country_id`),
  ADD KEY `products_discount_id_index` (`discount_id`),
  ADD KEY `products_creator_id_index` (`creator_id`),
  ADD KEY `products_category_id_index` (`category_id`),
  ADD KEY `products_categorization_id_index` (`categorization_id`),
  ADD KEY `products_views_count_index` (`views_count`);

--
-- টেবিলের ইনডেক্সসমুহ `product_additions`
--
ALTER TABLE `product_additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_additions_group_id_index` (`group_id`),
  ADD KEY `product_additions_product_id_index` (`product_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_index` (`product_id`),
  ADD KEY `product_categories_category_id_index` (`category_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_index` (`product_id`),
  ADD KEY `product_colors_color_id_index` (`color_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_group_additions`
--
ALTER TABLE `product_group_additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_group_additions_product_id_index` (`product_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_variation_id_index` (`variation_id`),
  ADD KEY `product_orders_creator_id_index` (`creator_id`),
  ADD KEY `product_orders_product_id_index` (`product_id`),
  ADD KEY `product_orders_order_id_index` (`order_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_order_additions`
--
ALTER TABLE `product_order_additions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_order_additions_product_order_id_index` (`product_order_id`),
  ADD KEY `product_order_additions_addition_id_index` (`addition_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_classification_id_index` (`classification_id`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- টেবিলের ইনডেক্সসমুহ `product_views`
--
ALTER TABLE `product_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_views_product_id_index` (`product_id`),
  ADD KEY `product_views_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_codes_creator_id_foreign` (`creator_id`);

--
-- টেবিলের ইনডেক্সসমুহ `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_customer_id_index` (`customer_id`),
  ADD KEY `reviews_product_id_index` (`product_id`);

--
-- টেবিলের ইনডেক্সসমুহ `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `shipping_fee_per_distances`
--
ALTER TABLE `shipping_fee_per_distances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_fee_per_distances_country_id_index` (`country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribes_subscriber_email_unique` (`subscriber_email`);

--
-- টেবিলের ইনডেক্সসমুহ `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`);

--
-- টেবিলের ইনডেক্সসমুহ `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- টেবিলের ইনডেক্সসমুহ `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_categorization_id_index` (`categorization_id`),
  ADD KEY `users_active_country_id_index` (`active_country_id`),
  ADD KEY `users_country_id_index` (`country_id`),
  ADD KEY `users_full_name_index` (`full_name`),
  ADD KEY `users_type_index` (`type`),
  ADD KEY `users_status_index` (`status`);

--
-- টেবিলের ইনডেক্সসমুহ `user_categorizations`
--
ALTER TABLE `user_categorizations`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `user_promo_codes`
--
ALTER TABLE `user_promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_promo_codes_promo_code_id_foreign` (`promo_code_id`),
  ADD KEY `user_promo_codes_customer_id_foreign` (`customer_id`);

--
-- টেবিলের ইনডেক্সসমুহ `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_company_id_index` (`company_id`),
  ADD KEY `wallets_order_id_index` (`order_id`);

--
-- টেবিলের ইনডেক্সসমুহ `work_times`
--
ALTER TABLE `work_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_times_user_id_index` (`user_id`);

--
-- স্তুপকৃত টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT)
--

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- স্তুপকৃত টেবলের সীমবদ্ধতা
--

--
-- টেবলের সীমবদ্ধতা `categorizations`
--
ALTER TABLE `categorizations`
  ADD CONSTRAINT `categorizations_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- টেবলের সীমবদ্ধতা `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cities_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- টেবলের সীমবদ্ধতা `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- টেবলের সীমবদ্ধতা `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD CONSTRAINT `promo_codes_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- টেবলের সীমবদ্ধতা `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;

--
-- টেবলের সীমবদ্ধতা `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_categorization_id_foreign` FOREIGN KEY (`categorization_id`) REFERENCES `categorizations` (`id`) ON DELETE CASCADE;

--
-- টেবলের সীমবদ্ধতা `user_promo_codes`
--
ALTER TABLE `user_promo_codes`
  ADD CONSTRAINT `user_promo_codes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_promo_codes_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
