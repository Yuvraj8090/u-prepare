-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2025 at 09:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u_prepare_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `already_define_epc`
--

CREATE TABLE `already_define_epc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_service` bigint(20) UNSIGNED NOT NULL,
  `sl_no` int(11) NOT NULL,
  `activity_id` bigint(20) UNSIGNED NOT NULL,
  `stage_name` varchar(255) NOT NULL,
  `item_description` text DEFAULT NULL,
  `percent` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `already_define_epc`
--

INSERT INTO `already_define_epc` (`id`, `work_service`, `sl_no`, `activity_id`, `stage_name`, `item_description`, `percent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'Foundation', NULL, 15.00, '2025-08-12 04:50:35', '2025-08-12 04:50:35', NULL),
(2, 1, 2, 1, 'Sub-structure', NULL, 15.00, '2025-08-12 04:51:10', '2025-08-12 04:51:10', NULL),
(3, 1, 3, 1, 'Super-structure', NULL, 40.00, '2025-08-12 04:51:56', '2025-08-12 04:51:56', NULL),
(4, 1, 4, 1, 'Miscellaneous Item', 'a.	 Expansion joints\r\nb.	drainage spouts,\r\nc. bearings, \r\nd.	 Protection of Abutments, \r\ne.	Painting,\r\nf.	 information boards etc.', 10.00, '2025-08-12 04:52:56', '2025-08-12 04:52:56', NULL),
(5, 1, 1, 2, 'Approach works', '(i)	Crust as per IRC \r\n(ii)	Road side drains\r\n(iii)	Road signs, markings, km stones, safety devices, etc.\r\n(iv)	 Road side plantation\r\n(v)	Protection works\r\n(vi)	Safety and traffic management during construction\r\n(vii)	Paved shoulder', 8.00, '2025-08-12 04:54:14', '2025-08-12 04:56:41', NULL),
(6, 1, 1, 3, 'Protection of the whole work, safety works, etc.', NULL, 8.00, '2025-08-12 04:56:21', '2025-08-12 04:56:21', NULL),
(7, 1, 1, 4, 'Miscellaneous Works', 'Other Miscellaneous works like island making, service road, access to site of works, Bridge Load Test, crash barrier, Social and Environmental compliances etc. And/ Or including any activity required for proper completion of the sub project and as directed by authority engineer.', 4.00, '2025-08-12 04:57:13', '2025-08-12 04:57:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assembly`
--

CREATE TABLE `assembly` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `constituency_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assembly`
--

INSERT INTO `assembly` (`id`, `district_id`, `constituency_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 1, 'Purola', 1, '2025-08-05 05:21:17', '2025-08-05 05:21:17', NULL),
(2, 13, 1, 'Yamunotri', 1, '2025-08-05 05:21:17', '2025-08-05 05:21:17', NULL),
(3, 13, 1, 'Gangotri', 1, '2025-08-05 05:21:17', '2025-08-05 05:21:17', NULL),
(70, 12, 5, 'Khatima', 1, '2025-08-05 05:21:17', '2025-08-05 05:21:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `boqentry_data`
--

CREATE TABLE `boqentry_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_package_project_id` bigint(20) UNSIGNED NOT NULL,
  `sl_no` varchar(1000) NOT NULL,
  `item_description` text NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `qty` decimal(12,3) DEFAULT NULL,
  `rate` decimal(12,2) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `constituencies`
--

CREATE TABLE `constituencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `constituencies`
--

INSERT INTO `constituencies` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tehri Garhwal', 1, '2024-03-27 01:17:45', '2024-03-27 01:17:45', NULL),
(2, 'Garhwal', 1, '2024-03-27 01:18:58', '2024-03-27 01:18:58', NULL),
(3, 'Haridwar', 1, '2024-03-27 01:18:58', '2024-03-27 01:18:58', NULL),
(4, 'Almora', 1, '2024-03-27 01:58:41', '2024-03-27 01:58:41', NULL),
(5, 'Nainital–Udhamsingh Nagar', 1, '2024-03-27 01:58:59', '2024-03-27 01:58:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contraction_phases`
--

CREATE TABLE `contraction_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contraction_phases`
--

INSERT INTO `contraction_phases` (`id`, `name`, `is_one_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pre Construction', 1, '2025-08-11 06:04:09', '2025-08-13 12:41:05', NULL),
(2, 'During Construction', 0, '2025-08-11 06:04:25', '2025-08-11 10:50:30', NULL),
(3, 'Post Construction', 1, '2025-08-11 06:04:37', '2025-08-13 12:41:19', NULL),
(4, 'demo', 0, '2025-08-11 06:05:32', '2025-08-11 06:05:36', '2025-08-11 06:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `contractors`
--

CREATE TABLE `contractors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `authorized_personnel_name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contractors`
--

INSERT INTO `contractors` (`id`, `company_name`, `authorized_personnel_name`, `phone`, `email`, `gst_no`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USDMA', 'Ankit Sati Sir', '9258360243', 'admin@gmail.com', '29GGGGG1314R9Z6', 'Dehradun', '2025-08-08 05:18:39', '2025-08-08 05:18:39', NULL),
(2, 'PWD (Vaibhav SIr)', 'Vaibhav SIr', '1234567890', 'vaibhav@gmail.com', '29GGGGG1314R9Z0', 'Ddemo', '2025-08-13 04:53:13', '2025-08-13 04:53:13', NULL),
(3, 'M/s Tons Builders', 'Chaman rawat', '7895086979', 'chaman.parkash1965@gmail.com', '29GGGGG1314R9Z4', 'Near Shiv Temple Jeevangarh, Vikas Nagar, Dehradun', '2025-08-17 02:57:02', '2025-08-17 02:57:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_number` varchar(255) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `contract_value` decimal(15,2) NOT NULL,
  `security` decimal(15,2) NOT NULL DEFAULT 0.00,
  `signing_date` date DEFAULT NULL,
  `commencement_date` date DEFAULT NULL,
  `initial_completion_date` date DEFAULT NULL,
  `revised_completion_date` date DEFAULT NULL,
  `actual_completion_date` date DEFAULT NULL,
  `contract_document` varchar(255) DEFAULT NULL,
  `contractor_id` bigint(20) UNSIGNED NOT NULL,
  `count_sub_project` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `contract_number`, `project_id`, `contract_value`, `security`, `signing_date`, `commencement_date`, `initial_completion_date`, `revised_completion_date`, `actual_completion_date`, `contract_document`, `contractor_id`, `count_sub_project`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '13/UPREPARE/24/BR/RFB-EPC/UGRIDP/2023', 5, 153539080.00, 15353908.00, '2024-09-18', '2024-10-04', '2026-04-03', NULL, '2026-04-03', NULL, 3, 1, '2025-08-17 02:59:16', '2025-08-17 02:59:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `budget` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `budget`, `created_at`, `updated_at`) VALUES
(1, 'PIU-PWD', 3900000000.00, '2025-08-04 22:56:09', '2025-08-18 02:26:39'),
(2, 'PIU-RWD', 3600000000.00, '2025-08-04 22:56:19', '2025-08-18 02:27:00'),
(3, 'PIU-USDMA', 4350000000.00, '2025-08-04 22:57:50', '2025-08-18 02:27:37'),
(4, 'PIU-FOREST', 830000000.00, '2025-08-04 22:58:01', '2025-08-18 02:25:51'),
(8, 'PMU', 2120000000.00, '2025-08-04 23:20:13', '2025-08-18 02:26:23');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'PMU MPCM 1', '2025-08-04 23:09:06', '2025-08-04 23:09:06'),
(2, 'PMU Officer 1', '2025-08-04 23:09:19', '2025-08-04 23:09:47'),
(3, 'Manager Procurement & Contract Management', '2025-08-04 23:09:34', '2025-08-04 23:09:34'),
(4, 'AE-RWD', '2025-08-04 23:09:58', '2025-08-04 23:09:58'),
(5, 'Forest officer 1', '2025-08-04 23:10:13', '2025-08-04 23:10:13'),
(6, 'USDMA Officer 1', '2025-08-04 23:10:25', '2025-08-04 23:10:25'),
(7, 'PWD-ENVIRONMENT-LEVEL-THREE', '2025-08-04 23:10:46', '2025-08-04 23:10:46'),
(8, 'Social Expert- PMU', '2025-08-04 23:11:02', '2025-08-04 23:11:02'),
(10, 'Senior Manager', '2025-08-04 23:25:00', '2025-08-04 23:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Almora', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(2, 'Bageshwar', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(3, 'Chamoli', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(4, 'Champawat', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(5, 'Dehradun', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(6, 'Haridwar', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(7, 'Nainital', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(8, 'Pauri Garhwal', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(9, 'Pithoragarh', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(10, 'Rudraprayag', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(11, 'Tehri Garhwal', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(12, 'Udham Singh Nagar', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(13, 'Uttarkashi', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL),
(14, 'All', 1, '2025-08-05 04:57:36', '2025-08-05 04:57:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `epcentry_data`
--

CREATE TABLE `epcentry_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_package_project_id` bigint(20) UNSIGNED NOT NULL,
  `sl_no` varchar(255) NOT NULL,
  `activity_name` text NOT NULL,
  `stage_name` varchar(255) DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `epcentry_data`
--

INSERT INTO `epcentry_data` (`id`, `sub_package_project_id`, `sl_no`, `activity_name`, `stage_name`, `item_description`, `percent`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(48, 10, '1', 'Bridge Works', 'Foundation', 'found', 15.00, 23030862.00, '2025-08-17 03:16:07', '2025-08-17 03:16:55', NULL),
(49, 10, '2', 'Bridge Works', 'Sub-structure', 'sub', 15.00, 23030862.00, '2025-08-17 03:16:07', '2025-08-17 03:17:30', NULL),
(50, 10, '3', 'Bridge Works', 'Super-structure', 'work', 40.00, 61415632.00, '2025-08-17 03:16:07', '2025-08-17 03:19:04', NULL),
(51, 10, '4', 'Bridge Works', 'Miscellaneous Item', 'a.	 Expansion joints\r\nb.	drainage spouts,\r\nc. bearings, \r\nd.	 Protection of Abutments, \r\ne.	Painting,\r\nf.	 information boards etc.', 10.00, 15353908.00, '2025-08-17 03:16:07', '2025-08-17 03:19:25', NULL),
(52, 10, '1', 'Approach works', 'Approach works', '(i)	Crust as per IRC \r\n(ii)	Road side drains\r\n(iii)	Road signs, markings, km stones, safety devices, etc.\r\n(iv)	 Road side plantation\r\n(v)	Protection works\r\n(vi)	Safety and traffic management during construction\r\n(vii)	Paved shoulder', 8.00, 12283126.40, '2025-08-17 03:16:07', '2025-08-17 03:17:58', NULL),
(53, 10, '1', 'Protection Work', 'Protection of the whole work, safety works, etc.', 'work', 8.00, 12283126.40, '2025-08-17 03:16:07', '2025-08-17 03:18:18', NULL),
(54, 10, '1', 'Miscellaneous Works', 'Miscellaneous Works', 'Other Miscellaneous works like island making, service road, access to site of works, Bridge Load Test, crash barrier, Social and Environmental compliances etc. And/ Or including any activity required for proper completion of the sub project and as directed by authority engineer.', 4.00, 6141563.20, '2025-08-17 03:16:07', '2025-08-17 03:18:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `epc_activity_names`
--

CREATE TABLE `epc_activity_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `epc_activity_names`
--

INSERT INTO `epc_activity_names` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bridge Works', '2025-08-12 04:48:31', '2025-08-12 04:48:31', NULL),
(2, 'Approach works', '2025-08-12 04:54:14', '2025-08-12 04:54:14', NULL),
(3, 'Protection Work', '2025-08-12 04:56:21', '2025-08-12 04:56:21', NULL),
(4, 'Miscellaneous Works', '2025-08-12 04:57:13', '2025-08-12 04:57:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_progress_updates`
--

CREATE TABLE `financial_progress_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `finance_amount` decimal(15,2) NOT NULL,
  `no_of_bills` int(11) NOT NULL,
  `bill_serial_no` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`bill_serial_no`)),
  `submit_date` date NOT NULL,
  `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`media`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_progress_updates`
--

INSERT INTO `financial_progress_updates` (`id`, `project_id`, `finance_amount`, `no_of_bills`, `bill_serial_no`, `submit_date`, `media`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 13011787.00, 1, '\"Mobilization Advance\"', '2025-01-29', '[]', '2025-08-17 03:23:26', '2025-08-17 03:23:26', NULL),
(2, 10, 21729683.00, 1, '\"RA Bill - 01\"', '2025-05-01', '[]', '2025-08-17 03:26:13', '2025-08-17 03:26:13', NULL),
(3, 10, 21079094.00, 1, '\"RA Bill - 02\"', '2025-06-20', '[]', '2025-08-17 03:26:49', '2025-08-17 03:26:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geography_blocks`
--

CREATE TABLE `geography_blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `geography_blocks`
--

INSERT INTO `geography_blocks` (`id`, `division_id`, `district_id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 10, 'Agastmuni', 'agastmuni', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(2, 2, 2, 'Bageshwar', 'bageshwar', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(3, 1, 6, 'Bahadrabad', 'bahadrabad', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(95, 1, 8, 'Yamkeshwar', 'yamkeshwar', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geography_districts`
--

CREATE TABLE `geography_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `geography_districts`
--

INSERT INTO `geography_districts` (`id`, `division_id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Almora', 'almora', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(2, 2, 'Bageshwar', 'bageshwar', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(3, 1, 'Chamoli', 'chamoli', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(4, 2, 'Champawat', 'champawat', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(5, 1, 'Dehradun', 'dehradun', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(6, 1, 'Haridwar', 'haridwar', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(7, 2, 'Nainital', 'nainital', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(8, 1, 'Pauri Garhwal', 'pauri-garhwal', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(9, 2, 'Pithoragarh', 'pithoragarh', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(10, 1, 'Rudraprayag', 'rudraprayag', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(11, 1, 'Tehri Garhwal', 'tehri-garhwal', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(12, 2, 'Udham Singh Nagar', 'udham-singh-nagar', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(13, 1, 'Uttarkashi', 'uttarkashi', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geography_divisions`
--

CREATE TABLE `geography_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `geography_divisions`
--

INSERT INTO `geography_divisions` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Garhwal', 'garhwal', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL),
(2, 'Kumaon', 'kumaon', '2025-08-05 05:18:01', '2025-08-05 05:18:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta_data`)),
  `lat` decimal(10,7) DEFAULT NULL,
  `long` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `path`, `type`, `meta_data`, `lat`, `long`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'uploads/SiQodGXQ97YJs2oD9IQKnpHrCNhLbcK8LqiMWAzO.png', 'image/png', '{\"name\":\"captured_image.png\"}', NULL, NULL, '2025-08-14 01:08:38', '2025-08-14 01:08:38', NULL),
(2, 'uploads/unksPisM4DZkfd3e3GQAQdxGFfi7y64sMix1QaPR.png', 'image/png', '{\"name\":\"captured_image.png\"}', NULL, NULL, '2025-08-14 01:14:01', '2025-08-14 01:14:01', NULL),
(3, 'uploads/jPBhDajIIWfalmL4pU1XGBcJI0O1JiXOLi51RXxX.png', 'image/png', '{\"name\":\"background.png\"}', NULL, NULL, '2025-08-14 01:14:28', '2025-08-14 01:14:28', NULL),
(4, 'uploads/muCkKt4XmbWi0SBrGl225QNiTVVmGEPDr7FzZQB7.png', 'image/png', '{\"name\":\"background.png\"}', NULL, NULL, '2025-08-14 01:17:02', '2025-08-14 01:17:02', NULL),
(5, 'uploads/oXO4fNapWPVqXOgjhaCMPG4CsOB3sDzG3GWpI4Tc.png', 'image/png', '{\"name\":\"captured_image.png\",\"project_name\":\"U-Prepare\",\"safeguard_compliance\":\"Environmental\",\"contraction_phase\":\"Post Construction\",\"yes_no\":\"1\",\"remarks\":\"done\",\"validity_date\":null,\"date_of_entry\":\"2025-08-14\"}', NULL, NULL, '2025-08-14 01:18:38', '2025-08-14 01:18:38', NULL),
(6, 'financial_progress/fQrTmeCmol6nMP4dB5Se4ENmjcNu74Hhzi8SXdde.png', 'image/png', '{\"name\":\"background.png\",\"size\":385403,\"mime\":\"image\\/png\",\"uploaded_at\":\"2025-08-15 10:26:01\",\"uploaded_by\":3}', NULL, NULL, '2025-08-15 04:56:01', '2025-08-15 04:56:01', NULL),
(7, 'financial_progress/QrS4zc9rMPM1b9DsmHwc5gSQDwFeBEL0MwBInjXO.png', 'image/png', '{\"name\":\"captured_image.png\",\"size\":345493,\"mime\":\"image\\/png\",\"uploaded_at\":\"2025-08-15 10:26:01\",\"uploaded_by\":3}', NULL, NULL, '2025-08-15 04:56:01', '2025-08-15 04:56:01', NULL),
(8, 'financial_progress/7ZTTpNTxikGeFYE9dldcCikGMcpgmHj91H2CfN09.png', 'image/png', '{\"name\":\"sunglasses.png\",\"size\":11716,\"mime\":\"image\\/png\",\"uploaded_at\":\"2025-08-15 11:17:37\",\"uploaded_by\":3}', NULL, NULL, '2025-08-15 05:47:37', '2025-08-15 05:47:37', NULL),
(9, 'financial_progress/gLCBvKrWE4eIxxyeOIagAgr9Ck3E5pUjRK6fKJ94.pdf', 'application/pdf', '{\"name\":\"sample-local-pdf.pdf\",\"size\":49672,\"mime\":\"application\\/pdf\",\"uploaded_at\":\"2025-08-15 11:18:11\",\"uploaded_by\":3}', NULL, NULL, '2025-08-15 05:48:11', '2025-08-15 05:48:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_04_113539_add_two_factor_columns_to_users_table', 1),
(5, '2025_08_04_113621_create_personal_access_tokens_table', 1),
(6, '2025_08_04_121635_create_roles_table', 1),
(7, '2025_08_04_121653_add_role_id_to_users_table', 1),
(8, '2025_08_04_174010_create_designations_table', 2),
(9, '2025_08_04_174336_create_departments_table', 2),
(10, '2025_08_04_174623_add_profile_and_meta_fields_to_users_table', 3),
(11, '2025_08_05_060743_create_projects_table', 4),
(12, '2025_08_05_081259_create_projects_category_table', 5),
(13, '2025_08_05_101356_create_sub_categories_table', 6),
(14, '2025_08_05_102634_create_districts_table', 7),
(15, '2025_08_05_103023_create_constituencies_table', 8),
(17, '2025_08_05_104351_create_geography_divisions_table', 9),
(18, '2025_08_05_104352_create_geography_districts_table', 9),
(19, '2025_08_05_104358_create_geography_blocks_table', 9),
(20, '2025_08_05_104955_create_assembly_table', 10),
(22, '2025_08_05_105357_create_package_project_table', 11),
(23, '2025_08_06_063443_create_procurement_details_table', 12),
(24, '2025_08_07_073336_create_procurement_work_programs_table', 13),
(25, '2025_08_08_071156_add_documents_to_procurement_work_programs_table', 14),
(28, '2025_08_08_095248_create_contractors_table', 15),
(29, '2025_08_08_095338_create_contracts_table', 15),
(30, '2025_08_10_105526_create_sub_package_projects_table', 16),
(31, '2025_08_10_105655_add_count_sub_project_to_contracts_table', 17),
(32, '2025_08_11_063922_create_boqentry_data_table', 18),
(33, '2025_08_11_095349_create_epcentry_data_table', 19),
(34, '2025_08_11_104749_create_contraction_phases_table', 20),
(35, '2025_08_11_104855_create_safeguard_compliances_table', 21),
(36, '2025_08_11_114614_create_safeguard_entries_table', 22),
(37, '2025_08_12_044432_add_username_to_users_table', 23),
(38, '2025_08_12_071155_update_epcentry_data_table', 24),
(39, '2025_08_12_071745_add_item_description_to_epcentry_data_table', 25),
(40, '2025_08_12_074826_create_work_service_table', 26),
(41, '2025_08_12_075726_create_already_define_epc_table', 27),
(44, '2025_08_12_100740_create_epc_activity_names_table', 28),
(45, '2025_08_12_100931_update_already_define_epc_change_activity_name_to_activity_id', 29),
(46, '2025_08_12_114811_create_physical_epc_progress_table', 30),
(47, '2025_08_12_174519_create_media_files_table', 31),
(48, '2025_08_13_053209_add_lat_long_to_media_files_and_sub_package_projects_tables', 32),
(50, '2025_08_13_063432_create_physical_boq_progress_table', 33),
(51, '2025_08_13_072135_add_sub_package_project_id_to_physical_boq_progress_table', 34),
(52, '2025_08_13_093656_add_is_validity_to_safeguard_entries_table', 35),
(53, '2025_08_13_115329_create_safeguard_custom_entries_table', 36),
(54, '2025_08_13_124535_add_safeguard_entry_id_to_social_safeguard_entries_table', 37),
(55, '2025_08_13_175135_add_is_one_time_to_contraction_phases_table', 38),
(56, '2025_08_14_095816_create_financial_progress_updates_table', 39),
(57, '2025_04_03_165953_create_navbar_items_table', 40),
(58, '2025_04_06_075536_create_pages_table', 41),
(59, '2025_08_18_045723_update_pages_table_add_softdeletes_and_title_hi', 42),
(60, '2025_08_18_070622_create_package_components_table', 43),
(61, '2025_08_18_070725_add_extra_columns_to_package_projects_table', 44),
(62, '2025_08_18_075053_create_departments_table', 45),
(63, '2025_08_19_070658_create_type_of_procurements_table', 46),
(64, '2025_08_19_072712_add_type_of_procurement_id_to_procurement_details_table', 47),
(65, '2025_08_19_073941_drop_type_of_procurement_from_procurement_details_table', 48);

-- --------------------------------------------------------

--
-- Table structure for table `navbar_items`
--

CREATE TABLE `navbar_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_dropdown` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `route` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navbar_items`
--

INSERT INTO `navbar_items` (`id`, `title`, `slug`, `parent_id`, `is_dropdown`, `order`, `is_active`, `route`, `url`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'About us', 'about-us', NULL, 1, 0, 1, NULL, '#', NULL, '2025-08-17 23:03:59', '2025-08-17 23:03:59'),
(2, 'About U-PREPARE', 'about-u-prepare', 1, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:04:38', '2025-08-17 23:04:38'),
(3, 'Mission and Vision', 'mission-and-vision', 1, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:04:52', '2025-08-17 23:04:52'),
(4, 'History', 'history', 1, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:05:05', '2025-08-17 23:05:05'),
(5, 'Objectives', 'objectives', 1, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:05:17', '2025-08-17 23:05:17'),
(6, 'Project Structure', 'project-structure', 1, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:05:31', '2025-08-17 23:05:31'),
(7, 'COMPONENTS', 'components', NULL, 1, 0, 1, NULL, '#', NULL, '2025-08-17 23:05:46', '2025-08-17 23:05:46'),
(8, 'Enhancing Infrastructure Resilience', 'enhancing-infrastructure-resilience', 7, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:06:01', '2025-08-17 23:06:01'),
(9, 'Improving Emergency Preparedness and Response', 'improving-emergency-preparedness-and-response', 7, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:06:14', '2025-08-17 23:06:14'),
(10, 'Preventing and Managing Forest and General Fires', 'preventing-and-managing-forest-and-general-fires', 7, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:07:03', '2025-08-17 23:07:03'),
(11, 'Project Management', 'project-management', 7, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:07:27', '2025-08-17 23:07:27'),
(12, 'RESOURCES', 'resources', NULL, 1, 0, 1, NULL, '#', NULL, '2025-08-17 23:07:44', '2025-08-17 23:07:44'),
(13, 'Blogs', 'blogs', 12, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:07:55', '2025-08-17 23:07:55'),
(14, 'Press releases', 'press-releases', 12, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:08:09', '2025-08-17 23:08:09'),
(15, 'News', 'news', 12, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:08:20', '2025-08-17 23:08:20'),
(16, 'Gallery', 'gallery', 12, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:08:30', '2025-08-17 23:08:30'),
(17, 'PROJECT STATUS', 'project-status', NULL, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:08:46', '2025-08-17 23:08:46'),
(18, 'GRIEVANCES', 'grievances', NULL, 1, 0, 1, NULL, '#', NULL, '2025-08-17 23:09:15', '2025-08-17 23:09:15'),
(19, 'Register', 'register', 18, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:09:28', '2025-08-17 23:09:28'),
(20, 'Status', 'status', 18, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:09:38', '2025-08-17 23:09:38'),
(21, 'MIS LOGIN', 'mis-login', NULL, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:10:00', '2025-08-17 23:10:00'),
(22, 'CONTACT US', 'contact-us', NULL, 0, 0, 1, NULL, '#', NULL, '2025-08-17 23:10:17', '2025-08-17 23:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `package_components`
--

CREATE TABLE `package_components` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `budget` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_components`
--

INSERT INTO `package_components` (`id`, `name`, `budget`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Enhancing Infrastructure Resilience', 4350000000.00, '2025-08-18 01:42:25', '2025-08-18 01:42:25', NULL),
(2, 'Improving Emergency Preparedness & Response', 5050000000.00, '2025-08-18 01:42:57', '2025-08-18 01:42:57', NULL),
(3, 'Preventing & Managing Forest & General Fires', 3730000000.00, '2025-08-18 01:43:20', '2025-08-18 01:43:20', NULL),
(4, 'Project Management', 1670000000.00, '2025-08-18 01:43:38', '2025-08-18 01:43:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_projects`
--

CREATE TABLE `package_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_component_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_name` text NOT NULL,
  `package_number` varchar(255) NOT NULL,
  `estimated_budget_incl_gst` decimal(15,2) NOT NULL,
  `vidhan_sabha_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lok_sabha_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `block_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dec_approved` tinyint(1) NOT NULL DEFAULT 0,
  `dec_approval_date` date DEFAULT NULL,
  `dec_letter_number` varchar(255) DEFAULT NULL,
  `dec_document_path` varchar(255) DEFAULT NULL,
  `hpc_approved` tinyint(1) NOT NULL DEFAULT 0,
  `hpc_approval_date` date DEFAULT NULL,
  `hpc_letter_number` varchar(255) DEFAULT NULL,
  `hpc_document_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_projects`
--

INSERT INTO `package_projects` (`id`, `package_component_id`, `project_id`, `package_category_id`, `package_sub_category_id`, `department_id`, `package_name`, `package_number`, `estimated_budget_incl_gst`, `vidhan_sabha_id`, `lok_sabha_id`, `district_id`, `block_id`, `dec_approved`, `dec_approval_date`, `dec_letter_number`, `dec_document_path`, `hpc_approved`, `hpc_approval_date`, `hpc_letter_number`, `hpc_document_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, 1, 1, 5, 1, 'Construction of 84 M Span Motor Bridge over Kotigaad in Km 01 of Tikochi-Duchanu-Kiranu- Sirtoli Motor Road in District Uttarkashi', '24/BR/RFB-EPC/UGRIDP/2023', 147751097.00, NULL, NULL, 13, NULL, 1, '2022-11-11', '1397/III(3)/2022', 'package-projects/dec-documents/yN1vq876nU0XAJDEj1xJw68S7Vw2TZRiorXbMt9x.pdf', 1, '2023-05-03', '103/UDRP-AF/2023', 'package-projects/hpc-documents/hKS6mA5a00jNUwa9lhrLLxy5gBRwMxdSBDS1wCja.pdf', '2025-08-17 02:55:37', '2025-08-17 02:55:37', NULL),
(6, 2, 1, 1, 5, 1, 'Construction of 60 M Pedestrian bridge over Kosi river at village- Bedgaun near Kathautiya Temple at Someshwar.', '20/pro/bridge/uprepare/2025', 40000000.00, NULL, NULL, 1, NULL, 1, '2023-06-14', '763/2023/PWD-III', 'package-projects/dec-documents/MZQIMFYKYiRZFfgarq1fRzECUiwKB9hWBm32oOTz.pdf', 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', 'package-projects/hpc-documents/tk1fzDTfgKRQaWTtRbNxhWPaW8wL39tvFgCAXv3j.pdf', '2025-08-18 00:53:17', '2025-08-18 00:53:17', NULL),
(7, 3, 1, 1, 5, 1, 'Construction of 100 M Pedestrian Bridge at Bhikiasan Near Thapli', '19/pro/bridge/uprepare/2025', 120000000.00, 4, NULL, 1, NULL, 1, '2023-06-14', '763/2023/PWD-III', 'package-projects/dec-documents/4IcgdAQnUupPN4LQjQ41PdHRcc2FDiJLFnwfIFRX.pdf', 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun,', 'package-projects/hpc-documents/VxxgPKz9aU9PxdsYSyxiSr99PQAtqMACYUjdMaH2.pdf', '2025-08-18 00:58:18', '2025-08-18 00:58:18', NULL),
(8, NULL, 1, 1, 5, 1, 'Construction of 30 M Pedestrian bridge at Devtoli inter college to village Simayal.', '18/pro/bridge/uprepare/2025', 30000000.00, 4, NULL, 2, NULL, 1, '2023-06-14', '763/2023/PWD-III', 'package-projects/dec-documents/8142UrwEEdfnSXfcvcxxZcj2dnaThcfBCpQ45ZFY.pdf', 1, '2023-06-30', '275/UDRP-AF/2023', 'package-projects/hpc-documents/i162nCMzPOjHtwEo3qRc7XXNbyoWU7L7GagTDCmX.pdf', '2025-08-18 01:00:59', '2025-08-18 01:00:59', NULL),
(50, NULL, 1, 3, 1, 1, 'Multipurpose Fire Tender', '01A/FIRE/RFB/UPREPARE/2024', 120750000.00, NULL, NULL, NULL, NULL, 1, '2022-11-17', 'HS3-MISC/MISC/91/2022-XX-3-Home Department (1/77143/2022)', NULL, 1, '2023-01-16', '523/UDRP-AF/2022-23', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(51, NULL, 1, 3, 1, 1, 'Supply of Fire Entry Suits', '02/FIRE/RFB/UGRIDP/2023', 28200000.00, NULL, NULL, NULL, NULL, 1, '2022-11-17', 'HS3-MISC/MISC/91/2022-XX-3-HomeDepartment (1/77143/2022)', NULL, 1, '2023-01-16', '523/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(52, NULL, 1, 3, 1, 1, 'Supply of Breathing Apparatus', '03/FIRE/RFB/UGRIDP/2023', 136850000.00, NULL, NULL, NULL, NULL, 1, '2022-11-17', 'HS3-MISC/MISC-91/2022-XX-3-HomeDpartment (1/77143/2022)', NULL, 1, '2023-01-16', '523/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(53, NULL, 1, 3, 1, 1, 'Supply of Thermal Imaging Camera', '04A/FIRE/RFB/PREPARE/2024', 10400000.00, NULL, NULL, NULL, NULL, 1, '2017-11-22', 'HS3-MSC/MISC-91/2022-XX-3-Home Department (1/77143/2022)', NULL, 1, '2023-01-16', '523/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(54, NULL, 1, 3, 1, 1, 'Supply of Victim Location Camera', '05/FIRE/RFB/UGRIDP/2023', 15500000.00, NULL, NULL, NULL, NULL, 1, '2022-11-17', 'HS3/MISC/MISC-91-2022-XX-3-HomeDepartment (1/77143/2022)', NULL, 1, '2023-01-16', '523/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(55, NULL, 1, 3, 1, 1, 'Supply and Installation of Victim Locating Equipment & Air Lifting Bag Equipment', '05/SDRF/USDMA/UGRIDP/2022', 36160000.00, NULL, NULL, NULL, NULL, 1, '2022-11-04', 'I/77144/2022', NULL, 1, '2023-01-16', '523/UDRP-AF/2022-23', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(56, NULL, 1, 2, 1, 1, 'Multipurpose Disaster Shelter', '01/1-A/PIU/USDMA', 18200000.00, NULL, NULL, NULL, NULL, 1, '2024-01-01', 'dec/1/1/2024', NULL, 1, '2024-02-01', 'hpc/1/1/2024', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(57, NULL, 1, 1, 1, 1, 'Multi hazard shelter', 'Multi hazard shelter/test/test', 1000000000.00, NULL, NULL, NULL, NULL, 1, '2025-01-01', 'test/101', NULL, 1, '2025-01-03', 'trest/1/125', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(58, NULL, 1, 1, 5, 1, 'Construction of 50 M Intermediate Lane Steel Truss Motor Bridge in Uttarkashi- Lambgaon Ghansali- Tilwara Motor Road KM-98 near Hanuman Temple, Block-Bhilangna, District Tehri', '01/BR/RFB/UGRIDP/2023', 65468476.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(59, NULL, 1, 1, 5, 1, 'Construction of 84M Span Intermediate Lane motor bridge over Pinder river in Kulsari to Sunau motor road & its approach in District Chamoli', '07/BR/RFB-EPC/UGRIDP/2023', 125644157.00, NULL, NULL, NULL, NULL, 1, '2011-11-20', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(60, NULL, 1, 1, 5, 1, 'Construction of 4 No. Intermediate Lane RCC Bridge & Steel Truss Bridge in KM-3, KM-7, KM-11 & KM-14 at Nandprayag Ghat Motor Road, Block-Ghat, District Chamoli', '06/BR/RFB/UGRIDP/2023', 71741185.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(61, NULL, 1, 1, 5, 1, 'Construction of 30 M Span Single Lane Steel Girder Pedestrian Bridge Near Charbag over Lwani Gadera at Silwani Tok, Block-Ghat, District Chamoli', '02/BR/RFB/UGRIDP/2023', 20852191.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(62, NULL, 1, 1, 5, 1, 'Construction of 60 M Span  Intermediate Lane Steel Truss Bridge over Jimba River at Km-01 of Seraghat-Golpha-Bona Motor Road, Block-Munsyari, District Pithoragarh', '05/BR/RFB/UGRIDP/2023', 56530324.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(63, NULL, 1, 1, 5, 1, 'Construction of 150M Span Double lane  Motor Bridge over Ratmau River in Daluwala- Lalwala-Dhanauri Motor Road in District Haridwar', '08/BR/RFB-EPC/UGRIDP/2023', 132804307.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(64, 1, 1, 1, 5, 1, '1. 24M Span Intermediate lane  motor bridge & its approach in Km-2 of Ujjawalpur to Gwad Dungri Jaspur Motor Road in Block Karnprayag; 2. Construction of 48M Span intermediate lane Motor Bridge & its approach over Meeng Gadera in Km-1 of Gadhani Motor Road in Block Narayanbagar and; 3.  Construction of 48M Span intermediate lane motor bridge & its approach in Km-2 of Gairsain to village Devalkot  Motor Road in Block Gairsain', '09/BR/RFB-EPC/UGRIDP/2023', 110969005.00, NULL, NULL, NULL, NULL, 1, NULL, '1397/III(3)/2022', NULL, 1, NULL, '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 02:09:14', NULL),
(65, NULL, 1, 1, 5, 1, 'Construction of 65M Span single lane Steel Truss Pedestrian Bridge at GandaKhali village to Ucholigoth village in District Champawat', '11/BR/RFB/UGRIDP/2023', 26374847.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(66, NULL, 1, 1, 5, 1, 'Construction of 75M Span  single lane Steel Truss Pedestrian Bridge at gram panchayat Chauramehta to Gurudwara in District Champawat', '12/BR/RFB/UGRIDP/2023', 52905965.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(67, NULL, 1, 1, 5, 1, 'Construction of 120M span double lane R.C.C. Prestress concrete bridge over Sher Nala in Km 82 of Ramnagar - Kaladhungi - Haldwani - Kathgodam - Chorgalia - Sitarganj - Bijti  Motor Road in  District Nainital', '13/BR/RFB/UGRIDP/2023', 81770772.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(68, NULL, 1, 1, 5, 1, 'Construction of 90m Span   Pedestrian Bridge & its approach road over Kotigaad near Tikochi Market in District Uttarkashi', '14/BR/RFB-EPC/UGRIDP/2023', 86336288.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(69, NULL, 1, 1, 5, 1, 'Construction of 125M Span Single lane Suspension Pedestrian  Bridge over Pinder River for Odar village in District Chamoli', '21/BR/RFB/UGRIDP/2023', 62269581.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(70, NULL, 1, 1, 5, 1, 'Construction of 84M span single lane Steel Truss Pedestrian Bridge over Alaknanda River in District Pauri', '16A/BR/RFB/UPREPARE/2023', 50477312.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(71, NULL, 1, 1, 5, 1, 'Construction of 105M span  Intermediate lane  Motor Bridge over Saryu River in Bankot- Badgari- Sapteshwar Motor Road in District Pithoragarh', '19/BR/RFB-EPC/UGRIDP/2023', 125230251.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(72, NULL, 1, 1, 5, 1, 'Construction of 100M span  intermediate lane motor bridge over Dholi river at Sela village in District Pithoragarh', '20/BR/RFB-EPC/UGRIDP/2023', 121571517.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(73, NULL, 1, 1, 5, 1, 'Construction of 152M Span double lane Motor bridge over Bhagirathi River near Tamakhani in District Uttarkashi', '18/BR/RFB-EPC/UGRIDP/2023', 253424667.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(74, NULL, 1, 1, 5, 1, 'Construction of 240M Span  Double lane motor bridge over Suswa river in Bullawala to Sattiwala motor road in District Dehradun', '23/BR/RFB-EPC/UGRIDP/2023', 156034054.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(75, NULL, 1, 1, 5, 1, 'Construction of 4 No. Intermediate lane Steel Truss Motor Bridge in KM-4,  KM-8 (HM 2-4 & HM 8-10) & KM-12 at Nandprayag Ghat Motor Road, Block-Ghat, District Chamoli', '25/BR/RFB/UGRIDP/2023', 71712061.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(76, NULL, 1, 1, 5, 1, 'Construction of 150M span Intermediate lane Motor Bridge & its approach road over Nayar River for Badkholu village in District Pauri', '15/BR/RFB-EPC/UGRIDP/2023', 147223720.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(77, NULL, 1, 1, 5, 1, 'Construction of 120M Span  Pedestrian  Bridge over Mainagad in Pipalkoti-Math-Syun-Bemru Bridle Road in District Chamoli', '22/BR/RFB-EPC/UGRIDP/2023', 101600.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(78, NULL, 1, 1, 5, 1, 'Test Bridge For PIU PWD By Sr', '12/testingbridge/123/tewst', 120000000.00, NULL, NULL, NULL, NULL, 1, '2023-08-08', '123/test/testing', NULL, 1, '2024-01-09', '123/test/testing/123', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(79, NULL, 1, 1, 5, 1, 'Construction of 90 M Span Pedestrian Bridge & its approach over Kel river at Supligad in District Chamoli.', '10(1)/BR/RFB-IR/UPREPARE/2024', 75400000.00, NULL, NULL, NULL, NULL, 1, '2022-11-11', '1397/III(3)/2022', NULL, 1, '2024-04-18', '205807/U-PREPARE/2024', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(80, NULL, 1, 1, 5, 1, 'Construction of 80M Span Pedestrian Bridge& its approach on Paithani Garkot Bridle Road in District Chamoli.', '10(2)/BR/RFB-IR/ UPREPARE/2024', 57000000.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/III(3)/36(Gen)2022', NULL, 1, '2024-04-18', '205807/U-PREPARE/2024', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(81, NULL, 1, 1, 5, 1, 'Construction of 100 M span Intermediate Lane Steel Truss Motor Bridge over Dholi river at Sela village in District Pithoragarh (EPC Mode)', '02A/BR/RFB-EPC/U-PREPARE/2024', 148000000.00, NULL, NULL, NULL, NULL, 1, '2022-12-23', '1515/III(3)/36/(Gen)2022', NULL, 1, '2023-05-03', '103/UDRP-AF/2023', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(82, NULL, 1, 1, 5, 1, 'Construction of 54 M Span Pedestrian bridge over Badiyaar River in Kimdar block Purola.', '01/pro/bridge/upreprare/2025', 22000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(83, NULL, 1, 1, 5, 1, 'Construction of 42M Span Motor Bridge at, Devigaad- Dantola, Motor Road.', '02/pro/bridge/upreprare/2025', 45000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun,', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(84, NULL, 1, 1, 5, 1, 'Construction of 30 M Span Motor Bridge  at Km-4 of Pokhal-Karnashram Motor Road.', '03/pro/bridge/upreprare/2025', 20600000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(85, NULL, 1, 1, 5, 1, 'Construction of 100M Span Pedestrian  Bridge over Gola river at Danijala.', '04/pro/bridge/uprepare/2025', 75000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(86, NULL, 1, 1, 5, 1, 'Construction of 110M Span Pedstrian Bridge over Ladhiya river near Chalthi', '05/pro/bridge/uprepare/2025', 60000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(87, NULL, 1, 1, 5, 1, 'Reconstruction of 110M Span Motor Bridge at Bhakuna Nachni Over Ramganga River', '06/pro/bridge/uprepare/2025', 150000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(88, NULL, 1, 1, 5, 1, 'Construction of  60M Span Steel Motor Bridge in Almora-Sainar-Chan Motor Road.', '07/pro/bridge/uprepare/2025', 105000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(89, NULL, 1, 1, 5, 1, 'Construction of 30 M Span Pedestrian Bridge over Kweerala river at Adisera-Chatkot to Chandpur Kuwarsingh Bridle Road.', '08/pro/bridge/uprepare/2025', 30000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(90, NULL, 1, 1, 5, 1, 'Construction of 95M Span Motor Bridge (Nagrashu) over Alaknanda river.', '09/pro/bridge/uprepare/2025', 197500000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradu', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(91, NULL, 1, 1, 5, 1, 'Construction of 24M Span Steel Motor Bridge at KM-1 of Bichkhali-Pathari Motor Road.', '10/pro/bridge/uprepare/2025', 21900000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(92, NULL, 1, 1, 5, 1, 'Construction of  42 M Span steel Motor bridge over Khurmola Gaad at Km. 1 Manjgaon Motor Road', '11/pro/bridge/uprepare/2025', 38000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(93, NULL, 1, 1, 5, 1, 'Construction of  40M Span Motor Bridge over Kweerala river at Syuli Tok of village- Lafda.', '12/pro/bridge/uprepare/2025', 40000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradu', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(94, NULL, 1, 1, 5, 1, 'Construction of 30M Span Pedestrian bridge at Tyakot near Kapuri-Taknar.', '13/pro/bridge/uprepare/2025', 30000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(95, NULL, 1, 1, 5, 1, 'Reconstruction of 60 M Span Steel Motor bridge in Km 1 of Jagta motor Road in Block Mori.', '14/pro/bridge/uprepare/2025', 48000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun,', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(96, NULL, 1, 1, 5, 1, 'Construction of 24 M Span Steel Motor Bridge at Langaasu-Niwadi-Khet-Silangi Motor Road, Km-4.', '15/pro/bridge/uprepare/2025', 22000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(97, NULL, 1, 1, 5, 1, 'Construction of 78 M Span steel  Motor  bridge over Alaknanda River   langsi-dwing-tapon-Lanji, Pokhni Motor Road.', '16/pro/bridge/uprepare/2025', 129700000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(98, NULL, 1, 1, 5, 1, 'Construction of 70 M Span Pedestrian Bridle Bridge on Dhami Gaon motor Road km 8 over Sukaligad near tok Purej.', '17/pro/bridge/uprepare/2025', 30000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023, Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(99, NULL, 1, 1, 5, 1, 'Test Bridge', '007/BR/PWD/PMU', 10000000.00, NULL, NULL, NULL, NULL, 1, '2025-01-02', '007/BR/PWD/PMU/DEC', NULL, 1, '2025-02-01', '007/BR/PWD/PMU/HPC', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(100, NULL, 1, 1, 5, 1, 'Test Bridge by MIS Tester', '0007/IT/Test/MIS', 90000000.00, NULL, NULL, NULL, NULL, 1, '2024-11-01', '007/DEC/IT/Test/MIS', NULL, 1, '2024-12-01', '007/HPC/IT/Test/MIS', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(101, NULL, 1, 1, 7, 1, 'Slabilization of a slope nead karanpriyag', '12/007/U-prepare/2025', 40000000.00, NULL, NULL, NULL, NULL, 1, '2025-01-01', '007/1010/DEC/2025', NULL, 1, '2025-01-28', '007/1010/HPC/2025', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(102, NULL, 1, 1, 7, 1, 'Road Protection Work of Uttarkashi Ghansali Tilwara Motor Road at KM. 10.', '01/pro/slope/upreprare/2025', 70000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2024-04-18', '205807/U-PREPARE/2024 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(103, NULL, 1, 1, 7, 1, 'Road Protection Work of Uttarkashi Ghansali Tilwara Motor Road at KM. 16.', '02/pro/slope/upreprare/2025', 70000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(104, NULL, 1, 1, 7, 1, 'Road Protection Work of Guptkashi Kalimath Jaal chaumasi Motor Road at KM.16.', '03/pro/slope/upreprare/2025', 70000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(105, NULL, 1, 1, 7, 1, 'Road Protection Work of Guptkashi Kalimath Jaal chaumasi Motor Road at KM.17.', '04/pro/slope/upreprare/2025', 80000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(106, NULL, 1, 1, 7, 1, 'Road Protection Work of Mayali Guptkashi Motor Road at KM. 11', '05/pro/slope/upreprare/2025', 60000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(107, NULL, 1, 1, 7, 1, 'Road Protection Work of Nainital-Bhowali Motor Road at Km.9', '06/pro/slope/upreprare/2025', 50000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(108, NULL, 1, 1, 7, 1, 'Road Protection Work of Fatehpur-Lansdowne Motor Road at KM.15.', '07/pro/slope/upreprare/2025', 50000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL),
(109, NULL, 1, 1, 7, 1, 'Road Protection Work of Fatehpur-Lansdowne Motor Road at KM.18.', '08/pro/slope/upreprare/2025', 50000000.00, NULL, NULL, NULL, NULL, 1, '2023-06-14', '763/2023/PWD-III', NULL, 1, '2023-06-30', '275/UDRP-AF/2023 Dehradun', NULL, '2025-08-18 06:49:11', '2025-08-18 06:49:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_hi` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `body_eng` longtext DEFAULT NULL,
  `body_hindi` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `title_hi`, `slug`, `body_eng`, `body_hindi`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'About U-PREPARE', 'हमारे बारे में', 'about-u-prepare', '<header id=\"header\" class=\"\">\r\n<section class=\"container-fluid d-flex align-items-center justify-content-between top-bar py-2\">\r\n<div class=\"left\">&nbsp;</div>\r\n</section>\r\n<section class=\"main-nav p-0\"><nav class=\"navbar\">\r\n<div class=\"container-xxl\">&nbsp;</div>\r\n</nav></section>\r\n</header><main id=\"main\" class=\"d-flex flex-column\">\r\n<section class=\"container-fluid p-0\">\r\n<div class=\"hero-img\"><img class=\"w-100 h-100\" src=\"https://u-prepare.com/assets/img/hero/about-u-prepare.webp\" alt=\"\">\r\n<div class=\"overlay\">&nbsp;</div>\r\n<h1 class=\"fw-bold m-0\">Uttarakhand Disaster Preparedness And Resilience Project</h1>\r\n</div>\r\n</section>\r\n<section class=\"about-content container-fluid py-5\">\r\n<div class=\"row\">\r\n<div class=\"col-12 text-center\">\r\n<h6>Driving Change in Disaster Management</h6>\r\n<h1 class=\"mb-3\">About&nbsp;U-Prepare</h1>\r\n<p class=\"text-justify\">The Uttarakhand Disaster Preparedness &amp; Resilience Project (U-PREPARE) is a critical initiative to bolster disaster resilience and preparedness in the state of Uttarakhand, typically supported by the World Bank. The project focuses on assessing and mitigating the unique risks posed by natural disasters, which are prevalent in the region, including floods, landslides, earthquakes, and more. The project typically involves a multi-faceted approach, including a thorough risk assessment to identify vulnerabilities and hazards specific to the region. One significant aspect is the development of resilient infrastructure, capable of withstanding the forces of nature or minimizing their adverse effects. Additionally, the implementation and improvement of early warning systems are crucial components, aiding in timely alerts and coordinated responses during emergencies. Capacity building and policy advocacy are integral parts of the project, empowering local authorities and communities to effectively manage disasters and advocate for policies prioritizing disaster resilience and preparedness at various levels. The project will support the recovery in terms of River protection works, Road Protection works (Slopes), Reconstruction of Bridges, and strengthening the State Disaster Response Force.</p>\r\n</div>\r\n</div>\r\n</section>\r\n</main>', '<header id=\"header\" class=\"\">\r\n<section class=\"container-fluid d-flex align-items-center justify-content-between top-bar py-2\">\r\n<div class=\"left\">&nbsp;</div>\r\n</section>\r\n<section class=\"main-nav p-0\"><nav class=\"navbar\">\r\n<div class=\"container-xxl\">&nbsp;</div>\r\n</nav></section>\r\n</header><main id=\"main\" class=\"d-flex flex-column\">\r\n<section class=\"container-fluid p-0\">\r\n<div class=\"hero-img\"><img class=\"w-100 h-100\" src=\"https://u-prepare.com/assets/img/hero/about-u-prepare.webp\" alt=\"\">\r\n<div class=\"overlay\">&nbsp;</div>\r\n<h1 class=\"fw-bold m-0\">Uttarakhand Disaster Preparedness And Resilience Project</h1>\r\n</div>\r\n</section>\r\n<section class=\"about-content container-fluid py-5\">\r\n<div class=\"row\">\r\n<div class=\"col-12 text-center\">\r\n<h6>Driving Change in Disaster Management</h6>\r\n<h1 class=\"mb-3\">About&nbsp;U-Prepare</h1>\r\n<p class=\"text-justify\">The Uttarakhand Disaster Preparedness &amp; Resilience Project (U-PREPARE) is a critical initiative to bolster disaster resilience and preparedness in the state of Uttarakhand, typically supported by the World Bank. The project focuses on assessing and mitigating the unique risks posed by natural disasters, which are prevalent in the region, including floods, landslides, earthquakes, and more. The project typically involves a multi-faceted approach, including a thorough risk assessment to identify vulnerabilities and hazards specific to the region. One significant aspect is the development of resilient infrastructure, capable of withstanding the forces of nature or minimizing their adverse effects. Additionally, the implementation and improvement of early warning systems are crucial components, aiding in timely alerts and coordinated responses during emergencies. Capacity building and policy advocacy are integral parts of the project, empowering local authorities and communities to effectively manage disasters and advocate for policies prioritizing disaster resilience and preparedness at various levels. The project will support the recovery in terms of River protection works, Road Protection works (Slopes), Reconstruction of Bridges, and strengthening the State Disaster Response Force.</p>\r\n</div>\r\n</div>\r\n</section>\r\n</main>', 'About U-PREPARE', NULL, NULL, 1, '2025-08-17 23:04:38', '2025-08-17 23:27:53', NULL),
(2, 'Mission and Vision', NULL, 'mission-and-vision', '', '', 'Mission and Vision', '', '', 1, '2025-08-17 23:04:52', '2025-08-17 23:04:52', NULL),
(3, 'History', NULL, 'history', '', '', 'History', '', '', 1, '2025-08-17 23:05:05', '2025-08-17 23:05:05', NULL),
(4, 'Objectives', NULL, 'objectives', '', '', 'Objectives', '', '', 1, '2025-08-17 23:05:17', '2025-08-17 23:05:17', NULL),
(5, 'Project Structure', NULL, 'project-structure', '', '', 'Project Structure', '', '', 1, '2025-08-17 23:05:31', '2025-08-17 23:05:31', NULL),
(6, 'Enhancing Infrastructure Resilience', NULL, 'enhancing-infrastructure-resilience', '', '', 'Enhancing Infrastructure Resilience', '', '', 1, '2025-08-17 23:06:01', '2025-08-17 23:06:01', NULL),
(7, 'Improving Emergency Preparedness and Response', NULL, 'improving-emergency-preparedness-and-response', '', '', 'Improving Emergency Preparedness and Response', '', '', 1, '2025-08-17 23:06:14', '2025-08-17 23:06:14', NULL),
(8, 'Preventing and Managing Forest and General Fires', NULL, 'preventing-and-managing-forest-and-general-fires', '', '', 'Preventing and Managing Forest and General Fires', '', '', 1, '2025-08-17 23:07:03', '2025-08-17 23:07:03', NULL),
(9, 'Project Management', NULL, 'project-management', '', '', 'Project Management', '', '', 1, '2025-08-17 23:07:27', '2025-08-17 23:07:27', NULL),
(10, 'Blogs', NULL, 'blogs', '', '', 'Blogs', '', '', 1, '2025-08-17 23:07:55', '2025-08-17 23:07:55', NULL),
(11, 'Press releases', NULL, 'press-releases', '', '', 'Press releases', '', '', 1, '2025-08-17 23:08:09', '2025-08-17 23:08:09', NULL),
(12, 'News', NULL, 'news', '', '', 'News', '', '', 1, '2025-08-17 23:08:20', '2025-08-17 23:08:20', NULL),
(13, 'Gallery', NULL, 'gallery', '', '', 'Gallery', '', '', 1, '2025-08-17 23:08:30', '2025-08-17 23:08:30', NULL),
(14, 'PROJECT STATUS', NULL, 'project-status', '', '', 'PROJECT STATUS', '', '', 1, '2025-08-17 23:08:46', '2025-08-17 23:08:46', NULL),
(15, 'Register', NULL, 'register', '', '', 'Register', '', '', 1, '2025-08-17 23:09:28', '2025-08-17 23:09:28', NULL),
(16, 'Status', NULL, 'status', '', '', 'Status', '', '', 1, '2025-08-17 23:09:38', '2025-08-17 23:09:38', NULL),
(17, 'MIS LOGIN', NULL, 'mis-login', '', '', 'MIS LOGIN', '', '', 1, '2025-08-17 23:10:00', '2025-08-17 23:10:00', NULL),
(18, 'CONTACT US', NULL, 'contact-us', '', '', 'CONTACT US', '', '', 1, '2025-08-17 23:10:17', '2025-08-17 23:10:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physical_boq_progress`
--

CREATE TABLE `physical_boq_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_package_project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `boq_entry_id` bigint(20) UNSIGNED NOT NULL,
  `qty` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `progress_submitted_date` date DEFAULT NULL,
  `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`media`)),
  `lat` decimal(10,7) DEFAULT NULL,
  `long` decimal(10,7) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physical_epc_progress`
--

CREATE TABLE `physical_epc_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `epcentry_data_id` bigint(20) UNSIGNED NOT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `progress_submitted_date` date DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `physical_epc_progress`
--

INSERT INTO `physical_epc_progress` (`id`, `epcentry_data_id`, `percent`, `amount`, `items`, `progress_submitted_date`, `images`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 48, 15.00, 23030862.00, 'all doen', '2025-04-28', '[]', '2025-08-17 03:20:34', '2025-08-17 03:20:34', NULL),
(5, 49, 15.00, 23030862.00, 'ed', '2025-06-08', '[]', '2025-08-17 03:21:08', '2025-08-17 03:21:08', NULL),
(6, 50, 15.00, 23030862.00, 'done', '2025-06-30', '[]', '2025-08-17 03:21:39', '2025-08-17 03:21:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_details`
--

CREATE TABLE `procurement_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_project_id` bigint(20) UNSIGNED NOT NULL,
  `method_of_procurement` varchar(255) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `publication_document_path` varchar(255) DEFAULT NULL,
  `tender_fee` decimal(12,2) DEFAULT NULL,
  `earnest_money_deposit` decimal(12,2) DEFAULT NULL,
  `bid_validity_days` int(11) DEFAULT NULL,
  `emd_validity_days` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type_of_procurement_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_details`
--

INSERT INTO `procurement_details` (`id`, `package_project_id`, `method_of_procurement`, `publication_date`, `publication_document_path`, `tender_fee`, `earnest_money_deposit`, `bid_validity_days`, `emd_validity_days`, `created_at`, `updated_at`, `deleted_at`, `type_of_procurement_id`) VALUES
(8, 5, 'Request for Bids', NULL, 'procurement_docs/0y4HThMFSp49q5pgWaGTulbWBSi1hX7A4bvYyGKz.pdf', 5000.00, 3000000.00, 120, 540, '2025-08-17 03:04:25', '2025-08-17 03:04:25', NULL, 1),
(9, 6, 'Request for Proposals', NULL, NULL, 5000.00, 50000.00, 90, 180, '2025-08-18 00:54:50', '2025-08-18 00:54:50', NULL, 1),
(10, 7, 'Request for Proposals', NULL, NULL, 5000.00, 100000.00, 90, 120, '2025-08-18 00:59:07', '2025-08-19 02:08:43', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `procurement_work_programs`
--

CREATE TABLE `procurement_work_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_project_id` bigint(20) UNSIGNED NOT NULL,
  `procurement_details_id` bigint(20) UNSIGNED NOT NULL,
  `name_work_program` varchar(255) NOT NULL,
  `weightage` decimal(5,2) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `planned_date` date DEFAULT NULL,
  `procurement_bid_document` varchar(255) DEFAULT NULL,
  `pre_bid_minutes_document` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_work_programs`
--

INSERT INTO `procurement_work_programs` (`id`, `package_project_id`, `procurement_details_id`, `name_work_program`, `weightage`, `days`, `start_date`, `planned_date`, `procurement_bid_document`, `pre_bid_minutes_document`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 5, 8, 'Preparation and Approval of Bid Document and Estimate', 20.00, 20, '2024-04-17', '2024-05-07', NULL, NULL, '2025-08-17 03:06:05', '2025-08-17 03:06:05', NULL),
(20, 5, 8, 'Publication of Bids', 10.00, 30, '2024-04-17', '2024-06-06', NULL, NULL, '2025-08-17 03:06:05', '2025-08-17 03:06:05', NULL),
(21, 5, 8, 'Opening of Technical Bids', 20.00, 0, '2024-05-07', '2024-06-06', NULL, NULL, '2025-08-17 03:06:05', '2025-08-17 03:06:05', NULL),
(22, 5, 8, 'Technical Evaluation', 30.00, 15, '2024-06-06', '2024-06-21', NULL, NULL, '2025-08-17 03:06:05', '2025-08-17 03:06:05', NULL),
(23, 5, 8, 'Notification of Award', 10.00, 10, '2024-06-06', '2024-07-01', NULL, NULL, '2025-08-17 03:06:05', '2025-08-17 03:06:05', NULL),
(24, 5, 8, 'Contract', 10.00, 15, '2024-06-21', '2024-07-16', NULL, NULL, '2025-08-17 03:06:05', '2025-08-17 03:06:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `budget` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `budget`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'U-Prepare', 14800000000.00, '2025-08-05 00:52:18', '2025-08-05 01:21:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects_category`
--

CREATE TABLE `projects_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `methods_of_procurement` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects_category`
--

INSERT INTO `projects_category` (`id`, `name`, `methods_of_procurement`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Works', '[\"Request for Proposals\",\"Request for Bids\",\"Request for Quotations\",\"Direct Selection\"]', '1', '2024-03-01 00:39:38', '2024-03-05 00:40:22', NULL),
(2, 'Consultancy Services', '[\"Quality and Cost-Budget Selection\",\"Fixed Budget Selection\",\"Least Cost Selection\",\"Quality Based Selection\",\"Consultant Qualification Selection\",\"Direct Selection\",\"Individual Consultant Selection\",\"Request for perposal\",\"EOI\"]', '0', '2024-03-02 00:40:03', '2025-08-05 04:36:13', NULL),
(3, 'Goods', '[\"Request for Proposals\",\"Request for Bids\",\"Request for Quotations\"]', '1', '2024-03-03 00:40:12', '2024-03-06 00:40:28', NULL),
(4, 'Others', '[\"Request for Proposals\",\"Request for Bids\",\"Request for Quotations\",\"Direct Selection\"]', '1', '2024-03-04 00:40:17', '2024-03-06 00:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, '2025-08-04 10:54:25'),
(2, 'PMU', '2025-08-04 11:53:03', '2025-08-04 11:53:03'),
(3, 'Senior-Manager', '2025-08-04 11:53:21', '2025-08-04 11:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `safeguard_compliances`
--

CREATE TABLE `safeguard_compliances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safeguard_compliances`
--

INSERT INTO `safeguard_compliances` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Environmental', '2025-08-11 06:04:56', '2025-08-11 06:04:56', NULL),
(2, 'Social', '2025-08-11 06:05:05', '2025-08-11 06:05:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `safeguard_entries`
--

CREATE TABLE `safeguard_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_package_project_id` bigint(20) UNSIGNED NOT NULL,
  `safeguard_compliance_id` bigint(20) UNSIGNED NOT NULL,
  `contraction_phase_id` bigint(20) UNSIGNED NOT NULL,
  `sl_no` varchar(1000) NOT NULL,
  `item_description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_validity` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safeguard_entries`
--

INSERT INTO `safeguard_entries` (`id`, `sub_package_project_id`, `safeguard_compliance_id`, `contraction_phase_id`, `sl_no`, `item_description`, `created_at`, `updated_at`, `deleted_at`, `is_validity`) VALUES
(15, 10, 1, 1, '1', 'Safety Helmet', '2025-08-18 04:54:24', '2025-08-18 04:54:24', NULL, 0),
(16, 10, 1, 1, '1.1', 'High-Visibility Jacket', '2025-08-18 04:54:24', '2025-08-18 04:54:24', NULL, 0),
(17, 10, 1, 1, '2', 'Protective Gloves', '2025-08-18 04:54:24', '2025-08-18 04:54:24', NULL, 0),
(18, 10, 1, 2, '1', 'Safety Helmet', '2025-08-18 04:56:38', '2025-08-18 04:56:38', NULL, 0),
(19, 10, 1, 2, '1.1', 'High-Visibility Jacket', '2025-08-18 04:56:38', '2025-08-18 04:56:38', NULL, 0),
(20, 10, 1, 2, '2', 'Protective Gloves', '2025-08-18 04:56:38', '2025-08-18 04:56:38', NULL, 0),
(21, 10, 1, 3, '1', 'Safety Helmet', '2025-08-18 04:56:55', '2025-08-18 04:56:55', NULL, 0),
(22, 10, 1, 3, '1.1', 'High-Visibility Jacket', '2025-08-18 04:56:56', '2025-08-18 04:56:56', NULL, 0),
(23, 10, 1, 3, '2', 'Protective Gloves', '2025-08-18 04:56:56', '2025-08-18 04:56:56', NULL, 0),
(24, 10, 2, 1, '1', 'Safety Helmet', '2025-08-18 04:57:09', '2025-08-18 04:57:09', NULL, 0),
(25, 10, 2, 1, '1.1', 'High-Visibility Jacket', '2025-08-18 04:57:09', '2025-08-18 04:57:09', NULL, 0),
(26, 10, 2, 1, '2', 'Protective Gloves', '2025-08-18 04:57:09', '2025-08-18 04:57:09', NULL, 0),
(27, 10, 2, 2, '1', 'Safety Helmet', '2025-08-18 04:57:19', '2025-08-18 04:57:19', NULL, 0),
(28, 10, 2, 2, '1.1', 'High-Visibility Jacket', '2025-08-18 04:57:19', '2025-08-18 04:57:19', NULL, 0),
(29, 10, 2, 2, '2', 'Protective Gloves', '2025-08-18 04:57:19', '2025-08-18 04:57:19', NULL, 0),
(30, 10, 2, 3, '1', 'Safety Helmet', '2025-08-18 04:57:29', '2025-08-18 04:57:29', NULL, 0),
(31, 10, 2, 3, '1.1', 'High-Visibility Jacket', '2025-08-18 04:57:29', '2025-08-18 04:57:29', NULL, 0),
(32, 10, 2, 3, '2', 'Protective Gloves', '2025-08-18 04:57:29', '2025-08-18 04:57:29', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('yDMR0XUG5jWwd7NaZNlxIA1VpkiOronoxbxCDzmD', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNU0zb3NmSWU0c0IxaXlTcVJEVkJNWnJqWkNQcVVOMTZuVXN0bkVMWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9jdXJlbWVudC1kZXRhaWxzLzEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRIYWc5b1MwYjIyNml3OUxibzJIdkFlZXBVOUFOTXhOTHBSMmpyY1htbjV0cUhHL2g4bkZ0aSI7fQ==', 1755589125);

-- --------------------------------------------------------

--
-- Table structure for table `social_safeguard_entries`
--

CREATE TABLE `social_safeguard_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `safeguard_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_package_project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `social_compliance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contraction_phase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `yes_no` tinyint(4) DEFAULT NULL,
  `photos_documents_case_studies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`photos_documents_case_studies`)),
  `remarks` text DEFAULT NULL,
  `validity_date` date DEFAULT NULL,
  `date_of_entry` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `category_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Others', 1, '2024-03-27 23:16:05', '2024-03-27 23:16:05', NULL),
(2, 2, 'Others', 1, '2024-03-27 23:16:21', '2024-03-27 23:16:21', NULL),
(3, 3, 'Others', 1, '2024-03-27 23:16:43', '2024-03-27 23:16:43', NULL),
(4, 4, 'Others', 1, '2024-03-27 23:17:13', '2024-03-27 23:18:33', NULL),
(5, 1, 'Bridge', 1, '2024-03-30 07:07:04', '2024-04-01 04:49:56', NULL),
(6, 1, 'Building', 1, '2024-03-30 07:07:17', '2024-04-01 04:54:56', NULL),
(7, 1, 'Slope Protection', 1, '2024-03-30 07:07:26', '2024-07-05 04:38:14', NULL),
(8, 3, 'Tent', 1, '2024-03-30 07:08:01', '2024-03-30 07:08:01', NULL),
(9, 3, 'Shelter', 1, '2024-03-30 07:08:07', '2024-03-30 07:08:07', NULL),
(10, 3, 'Fire-suit', 1, '2024-03-30 07:08:28', '2024-03-30 07:08:28', NULL),
(11, 2, 'Supervision Design', 1, '2024-03-30 07:08:48', '2024-07-05 03:22:00', NULL),
(12, 2, 'Supervision', 1, '2024-03-30 07:08:58', '2024-07-05 03:22:14', NULL),
(13, 2, 'Design', 1, '2024-07-05 03:20:51', '2024-07-05 03:22:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_package_projects`
--

CREATE TABLE `sub_package_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contract_value` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `long` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_package_projects`
--

INSERT INTO `sub_package_projects` (`id`, `project_id`, `name`, `contract_value`, `created_at`, `updated_at`, `deleted_at`, `lat`, `long`) VALUES
(10, 5, 'Construction of 84 M Span Motor Bridge over Kotigaad in Km 01 of Tikochi-Duchanu-Kiranu- Sirtoli Motor Road in District Uttarkashi', 153539080.00, '2025-08-17 02:59:16', '2025-08-17 02:59:16', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_of_procurements`
--

CREATE TABLE `type_of_procurements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_procurements`
--

INSERT INTO `type_of_procurements` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'EPC', 'In which We can define', '2025-08-19 01:43:35', '2025-08-19 01:43:35', NULL),
(2, 'Item-Wise', 'in Which BOQ sheet need to upload', '2025-08-19 01:44:05', '2025-08-19 01:44:05', NULL),
(3, 'Others', 'also same', '2025-08-19 01:44:21', '2025-08-19 01:44:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `district` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `department_id`, `designation_id`, `gender`, `phone_no`, `status`, `district`, `deleted_at`) VALUES
(1, 1, 'admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$VzxX3jmvEG/0dKL4w5jbWe3PLWtM8cIz7eU3YUh0MV4k1uTP8uAlu', NULL, NULL, NULL, NULL, NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 06:58:54', '2025-08-04 06:58:54', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(2, 1, 'Test User 1', 'testuser1@example.com', 'test_user_1', '2025-08-04 11:12:57', '$2y$12$VzxX3jmvEG/0dKL4w5jbWe3PLWtM8cIz7eU3YUh0MV4k1uTP8uAlu', NULL, NULL, NULL, 'OjPV8Rf3S1', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-04 12:31:58', NULL, NULL, NULL, NULL, 'active', NULL, '2025-08-04 12:31:58'),
(3, 3, 'Test User ', 'testuser2@example.com', 'test_user_', '2025-08-04 11:12:58', '$2y$12$Hag9oS0b226iw9Lbo2HvAeepU9ANMxNLpR2jrcXmn5tqHG/h8nFti', NULL, NULL, NULL, '24ThNUXznOexrqowtMpJSrJSIFkMpoAhPs0lTGbnMlpZ5FwE9rijC7xXzmcw', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-11 05:56:59', 1, 10, 'male', '9090909090', 'active', 'Dehradun', NULL),
(4, 1, 'Test User 3', 'testuser3@example.com', 'test_user_3', '2025-08-04 11:12:58', '$2y$12$.WEudQx6rlE8IvXmtz3she.zKNd2NOA3FpF6.WGHv8QoqKV2yajUq', NULL, NULL, NULL, 'P7Kjy9dmBp', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-04 11:12:58', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(5, 1, 'Test User 4', 'testuser4@example.com', 'test_user_4', '2025-08-04 11:12:58', '$2y$12$OiQc5Mamqa0WO4SsmHzovOm520kqdi6hszqA6gXQYdycPHwsRJqYS', NULL, NULL, NULL, 'aI1TSgyKKG', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(6, 1, 'Test User 5', 'testuser5@example.com', 'test_user_5', '2025-08-04 11:12:59', '$2y$12$ArGPNhRO/EFR48OFxTVLPOpJgMl226X.RWfsAp.G6id8.JpKk8ege', NULL, NULL, NULL, 'XuV6KCkwjv', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(7, 1, 'Test User 6', 'testuser6@example.com', 'test_user_6', '2025-08-04 11:12:59', '$2y$12$YZ45SKbyL10z5A5XyZFTPe60mmOTibR4HId3pymwaVMClWYg88A5G', NULL, NULL, NULL, '8ngp7rVu02', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(8, 1, 'Test User 7', 'testuser7@example.com', 'test_user_7', '2025-08-04 11:12:59', '$2y$12$i6bgzn2YqV.7OS2t8BRXjOOPnOFpHLYDsvEFMriFw1zX.leIEX6MO', NULL, NULL, NULL, 'xWiPiMStdJ', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(9, 1, 'Test User 8', 'testuser8@example.com', 'test_user_8', '2025-08-04 11:13:00', '$2y$12$c/1QCkJxDRlvVUooKOxyweHPkqUKEfiakuD0IWppXOB6n6JImSFw2', NULL, NULL, NULL, 'otK0zoH0Vu', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(10, 1, 'Test User 9', 'testuser9@example.com', 'test_user_9', '2025-08-04 11:13:00', '$2y$12$xdV4G9bXXF6mMTEtMverAOCQ9s4Al9Ea9/6i8xXG8aB9yJaNimexy', NULL, NULL, NULL, 'x7TGbcrScH', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(11, 1, 'Test User 10', 'testuser10@example.com', 'test_user_10', '2025-08-04 11:13:00', '$2y$12$qeK4sCfVXGn5coHg89ugC.3ce6bJ1LtUamJCh6xpYW0flixugOnXK', NULL, NULL, NULL, 'w9pJVhbFHm', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(12, 1, 'Test User 11', 'testuser11@example.com', 'test_user_11', '2025-08-04 11:13:01', '$2y$12$/NK1WIc.AKqvBR9vo3.vSOa5apAKGLNNuwtnocj8btk59/xWQrF5C', NULL, NULL, NULL, 'RLsh78jbMz', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(13, 1, 'Test User 12', 'testuser12@example.com', 'test_user_12', '2025-08-04 11:13:01', '$2y$12$73TgswNaGJ9tBu/e8bwUN.rFHYExRL8pDZ0BpWYOA3dv0KzEZ8Zla', NULL, NULL, NULL, 'Tr9kUsqTzH', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(14, 1, 'Test User 13', 'testuser13@example.com', 'test_user_13', '2025-08-04 11:13:01', '$2y$12$hu6KuOHt.c6L/CDBc.1IN.YfwkXrn11AAocWIrRVvivtgNsXWwJwq', NULL, NULL, NULL, 'yzjgtmKSRD', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:02', '2025-08-04 11:13:02', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(15, 1, 'Test User 14', 'testuser14@example.com', 'test_user_14', '2025-08-04 11:13:02', '$2y$12$kih.JQHDJReUYfnjeyK1BuVeo7Y22QSigKgn/VVQMek/9W46j/mya', NULL, NULL, NULL, 'nfHFORKiB5', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:02', '2025-08-04 11:13:02', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(16, 1, 'Test User 15', 'testuser15@example.com', 'test_user_15', '2025-08-04 11:13:02', '$2y$12$6rPybpQhqCdYK5llA3OwFeAtd97zVnD7.WiOYfTsBht4.LgllsZFy', NULL, NULL, NULL, 'vFs9N8Yyy2', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(17, 1, 'Test User 16', 'testuser16@example.com', 'test_user_16', '2025-08-04 11:13:03', '$2y$12$XAEOAgA0cxFe/NHKPCQqOOvyPQRJBrfeMSEaXerjuYXAs3.zzwd/6', NULL, NULL, NULL, 'eolVR6m8WL', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(18, 1, 'Test User 17', 'testuser17@example.com', 'test_user_17', '2025-08-04 11:13:03', '$2y$12$8Q13ltV3i2bnzMFcDscO6e/NePTdNoB9iG3nZoQTfTWoMxoeibm7e', NULL, NULL, NULL, 'UdoGQTBXOX', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(19, 1, 'Test User 18', 'testuser18@example.com', 'test_user_18', '2025-08-04 11:13:03', '$2y$12$.eKZ5nXZa0AgKFoZUQcGz.1ty0UdtFMzIpagEHqktb97wzH4T1GXa', NULL, NULL, NULL, 'Y6UJup7WCQ', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:04', '2025-08-04 11:13:04', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(20, 1, 'Test User 19', 'testuser19@example.com', 'test_user_19', '2025-08-04 11:13:04', '$2y$12$h6SIIBevrKXQJYNhfY66kOfjTdSeMJsoAPcuKcQXHj3XdlCxJQZ6m', NULL, NULL, NULL, '5IpsstbcUO', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:04', '2025-08-04 11:13:04', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(21, 1, 'Test User 20', 'testuser20@example.com', 'test_user_20', '2025-08-04 11:13:04', '$2y$12$HWRaIBLDiIIpfh9QvRJkSOeRTXM0QwxZnPHO6dplb5IpbQKAybJyS', NULL, NULL, NULL, 'VJ7rV7iPwc', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(22, 1, 'Test User 21', 'testuser21@example.com', 'test_user_21', '2025-08-04 11:13:05', '$2y$12$VRbEn7gESRE4kd8YFT8wxO.UlRiuY/waljAQx7cXxssYeWnB2Uleq', NULL, NULL, NULL, 'wIIK1l5H5Z', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(23, 1, 'Test User 22', 'testuser22@example.com', 'test_user_22', '2025-08-04 11:13:05', '$2y$12$pucmDxQM2N1ci.w.tI86OOip9.F0D8PlIIiqIqlSEQtFfCxQzmOAS', NULL, NULL, NULL, 'YnKYhATwwO', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(24, 1, 'Test User 23', 'testuser23@example.com', 'test_user_23', '2025-08-04 11:13:05', '$2y$12$Orck/Rn2FWrpJyD/tfQgeuuxtj11R3jRwXjXi4PZqVpWeSXNhjiq.', NULL, NULL, NULL, 'KTYF2ZOoY1', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:06', '2025-08-04 11:13:06', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(25, 1, 'Test User 24', 'testuser24@example.com', 'test_user_24', '2025-08-04 11:13:06', '$2y$12$8UoekrmxzpROdM659cwU4eIORANM.h6YPuETOrIVM3ABUSILqVg2O', NULL, NULL, NULL, 'JDOhsK1q7f', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:06', '2025-08-04 11:13:06', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(26, 1, 'Test User 25', 'testuser25@example.com', 'test_user_25', '2025-08-04 11:13:06', '$2y$12$QunanTnLEZFSD9Xis/NYyeZP.U63nC0PjUlwQOehvqpRv584kOBMm', NULL, NULL, NULL, '7jt9nC3vIh', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(27, 1, 'Test User 26', 'testuser26@example.com', 'test_user_26', '2025-08-04 11:13:07', '$2y$12$fevbBEtcyc31fGOVeimHsupFxEx/zzUPJl/twenuuzfczOFTBi3qS', NULL, NULL, NULL, 'YKQczUSKYT', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(28, 1, 'Test User 27', 'testuser27@example.com', 'test_user_27', '2025-08-04 11:13:07', '$2y$12$.fDluNd8s2tA8pfdozh6vupvj18zyUlJuZTDJrVF98KJZpuNGOBpu', NULL, NULL, NULL, 'aKfaIR2b9Z', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(29, 1, 'Test User 28', 'testuser28@example.com', 'test_user_28', '2025-08-04 11:13:07', '$2y$12$fGkVjaT62x77WKFRB/9.HelSkLA08yX8OHtJ7QVO0Mh/V9iBTB.dK', NULL, NULL, NULL, 'xPilcRiC1D', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(30, 1, 'Test User 29', 'testuser29@example.com', 'test_user_29', '2025-08-04 11:13:08', '$2y$12$xFZCbuYY4AcayMYYIyutqew6MGDr1hZvcJ7gsX8Fe7bfpnHy3ER9K', NULL, NULL, NULL, 'oXRMO2xbZy', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(31, 1, 'Test User 30', 'testuser30@example.com', 'test_user_30', '2025-08-04 11:13:08', '$2y$12$Y37eb8s.TfJ77jRRAOeaROBNLI6wX9jDDFzdY5hUe6yy4ES1KS6ry', NULL, NULL, NULL, '4kU4YQZwfR', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(32, 2, 'Yuvraj Kohli', 'Yuvrajkohli8090ylt@gmail.com', 'yuvraj_kohli', NULL, '$2y$12$Cw97ve07IYTo3nIjcmR8TeeQNN85kAOFb8.qYZRhDlGT9F1eBoOGy', NULL, NULL, NULL, NULL, NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:55:58', '2025-08-04 11:55:58', NULL, NULL, NULL, NULL, 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_service`
--

CREATE TABLE `work_service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name of the work service',
  `department_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Reference to department ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_service`
--

INSERT INTO `work_service` (`id`, `name`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 'Bridge', 1, '2025-08-12 02:21:53', '2025-08-12 04:51:21'),
(2, 'Road Works', 1, '2025-08-12 02:22:44', '2025-08-12 04:18:22'),
(3, 'Slope Protection', 1, '2025-08-12 02:23:01', '2025-08-12 02:23:01'),
(4, 'Consultancy Services', 8, '2025-08-12 02:23:21', '2025-08-18 02:48:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `already_define_epc`
--
ALTER TABLE `already_define_epc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `already_define_epc_work_service_foreign` (`work_service`),
  ADD KEY `fk_already_define_epc_activity` (`activity_id`);

--
-- Indexes for table `assembly`
--
ALTER TABLE `assembly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assembly_district_id_foreign` (`district_id`),
  ADD KEY `assembly_constituency_id_foreign` (`constituency_id`);

--
-- Indexes for table `boqentry_data`
--
ALTER TABLE `boqentry_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boqentry_data_sub_package_project_id_foreign` (`sub_package_project_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `constituencies`
--
ALTER TABLE `constituencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contraction_phases`
--
ALTER TABLE `contraction_phases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contractors`
--
ALTER TABLE `contractors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contractors_phone_unique` (`phone`),
  ADD UNIQUE KEY `contractors_email_unique` (`email`),
  ADD UNIQUE KEY `contractors_gst_no_unique` (`gst_no`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contracts_contract_number_unique` (`contract_number`),
  ADD KEY `contracts_project_id_foreign` (`project_id`),
  ADD KEY `contracts_contractor_id_foreign` (`contractor_id`),
  ADD KEY `contracts_count_sub_project_index` (`count_sub_project`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_title_unique` (`title`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epcentry_data`
--
ALTER TABLE `epcentry_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `epcentry_data_sub_package_project_id_foreign` (`sub_package_project_id`);

--
-- Indexes for table `epc_activity_names`
--
ALTER TABLE `epc_activity_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `financial_progress_updates`
--
ALTER TABLE `financial_progress_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_progress_updates_project_id_foreign` (`project_id`);

--
-- Indexes for table `geography_blocks`
--
ALTER TABLE `geography_blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `geography_blocks_slug_unique` (`slug`),
  ADD KEY `geography_blocks_division_id_foreign` (`division_id`),
  ADD KEY `geography_blocks_district_id_foreign` (`district_id`);

--
-- Indexes for table `geography_districts`
--
ALTER TABLE `geography_districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `geography_districts_slug_unique` (`slug`),
  ADD KEY `geography_districts_division_id_foreign` (`division_id`);

--
-- Indexes for table `geography_divisions`
--
ALTER TABLE `geography_divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `geography_divisions_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_type_index` (`type`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navbar_items`
--
ALTER TABLE `navbar_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navbar_items_slug_unique` (`slug`),
  ADD KEY `navbar_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `package_components`
--
ALTER TABLE `package_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_projects`
--
ALTER TABLE `package_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_projects_package_number_unique` (`package_number`),
  ADD KEY `package_projects_project_id_foreign` (`project_id`),
  ADD KEY `package_projects_package_category_id_foreign` (`package_category_id`),
  ADD KEY `package_projects_package_sub_category_id_foreign` (`package_sub_category_id`),
  ADD KEY `package_projects_department_id_foreign` (`department_id`),
  ADD KEY `package_projects_vidhan_sabha_id_foreign` (`vidhan_sabha_id`),
  ADD KEY `package_projects_lok_sabha_id_foreign` (`lok_sabha_id`),
  ADD KEY `package_projects_district_id_foreign` (`district_id`),
  ADD KEY `package_projects_block_id_foreign` (`block_id`),
  ADD KEY `package_projects_package_component_id_foreign` (`package_component_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `physical_boq_progress`
--
ALTER TABLE `physical_boq_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `physical_boq_progress_boq_entry_id_foreign` (`boq_entry_id`),
  ADD KEY `physical_boq_progress_sub_package_project_id_index` (`sub_package_project_id`);

--
-- Indexes for table `physical_epc_progress`
--
ALTER TABLE `physical_epc_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `physical_epc_progress_epcentry_data_id_foreign` (`epcentry_data_id`);

--
-- Indexes for table `procurement_details`
--
ALTER TABLE `procurement_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_details_package_project_id_foreign` (`package_project_id`),
  ADD KEY `procurement_details_type_of_procurement_id_foreign` (`type_of_procurement_id`);

--
-- Indexes for table `procurement_work_programs`
--
ALTER TABLE `procurement_work_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_work_programs_package_project_id_foreign` (`package_project_id`),
  ADD KEY `procurement_work_programs_procurement_details_id_foreign` (`procurement_details_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects_category`
--
ALTER TABLE `projects_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `safeguard_compliances`
--
ALTER TABLE `safeguard_compliances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safeguard_entries`
--
ALTER TABLE `safeguard_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `safeguard_entries_sub_package_project_id_foreign` (`sub_package_project_id`),
  ADD KEY `safeguard_entries_safeguard_compliance_id_foreign` (`safeguard_compliance_id`),
  ADD KEY `safeguard_entries_contraction_phase_id_foreign` (`contraction_phase_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `social_safeguard_entries`
--
ALTER TABLE `social_safeguard_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_safeguard_entries_sub_package_project_id_foreign` (`sub_package_project_id`),
  ADD KEY `social_safeguard_entries_social_compliance_id_foreign` (`social_compliance_id`),
  ADD KEY `social_safeguard_entries_contraction_phase_id_foreign` (`contraction_phase_id`),
  ADD KEY `social_safeguard_entries_safeguard_entry_id_foreign` (`safeguard_entry_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_category_id_index` (`category_id`);

--
-- Indexes for table `sub_package_projects`
--
ALTER TABLE `sub_package_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_package_projects_project_id_name_index` (`project_id`,`name`),
  ADD KEY `sub_package_projects_name_index` (`name`),
  ADD KEY `sub_package_projects_contract_value_index` (`contract_value`);

--
-- Indexes for table `type_of_procurements`
--
ALTER TABLE `type_of_procurements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_department_id_foreign` (`department_id`),
  ADD KEY `users_designation_id_foreign` (`designation_id`),
  ADD KEY `users_phone_no_index` (`phone_no`),
  ADD KEY `users_district_index` (`district`);

--
-- Indexes for table `work_service`
--
ALTER TABLE `work_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_service_department_id_foreign` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `already_define_epc`
--
ALTER TABLE `already_define_epc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `assembly`
--
ALTER TABLE `assembly`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `boqentry_data`
--
ALTER TABLE `boqentry_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1030;

--
-- AUTO_INCREMENT for table `constituencies`
--
ALTER TABLE `constituencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contraction_phases`
--
ALTER TABLE `contraction_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contractors`
--
ALTER TABLE `contractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `epcentry_data`
--
ALTER TABLE `epcentry_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `epc_activity_names`
--
ALTER TABLE `epc_activity_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_progress_updates`
--
ALTER TABLE `financial_progress_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `geography_blocks`
--
ALTER TABLE `geography_blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `geography_districts`
--
ALTER TABLE `geography_districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `geography_divisions`
--
ALTER TABLE `geography_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `navbar_items`
--
ALTER TABLE `navbar_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `package_components`
--
ALTER TABLE `package_components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package_projects`
--
ALTER TABLE `package_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physical_boq_progress`
--
ALTER TABLE `physical_boq_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `physical_epc_progress`
--
ALTER TABLE `physical_epc_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `procurement_details`
--
ALTER TABLE `procurement_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `procurement_work_programs`
--
ALTER TABLE `procurement_work_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects_category`
--
ALTER TABLE `projects_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `safeguard_compliances`
--
ALTER TABLE `safeguard_compliances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `safeguard_entries`
--
ALTER TABLE `safeguard_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `social_safeguard_entries`
--
ALTER TABLE `social_safeguard_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sub_package_projects`
--
ALTER TABLE `sub_package_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `type_of_procurements`
--
ALTER TABLE `type_of_procurements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `work_service`
--
ALTER TABLE `work_service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `already_define_epc`
--
ALTER TABLE `already_define_epc`
  ADD CONSTRAINT `already_define_epc_work_service_foreign` FOREIGN KEY (`work_service`) REFERENCES `work_service` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_already_define_epc_activity` FOREIGN KEY (`activity_id`) REFERENCES `epc_activity_names` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assembly`
--
ALTER TABLE `assembly`
  ADD CONSTRAINT `assembly_constituency_id_foreign` FOREIGN KEY (`constituency_id`) REFERENCES `constituencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assembly_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `geography_districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `boqentry_data`
--
ALTER TABLE `boqentry_data`
  ADD CONSTRAINT `boqentry_data_sub_package_project_id_foreign` FOREIGN KEY (`sub_package_project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_contractor_id_foreign` FOREIGN KEY (`contractor_id`) REFERENCES `contractors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `epcentry_data`
--
ALTER TABLE `epcentry_data`
  ADD CONSTRAINT `epcentry_data_sub_package_project_id_foreign` FOREIGN KEY (`sub_package_project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `financial_progress_updates`
--
ALTER TABLE `financial_progress_updates`
  ADD CONSTRAINT `financial_progress_updates_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `geography_blocks`
--
ALTER TABLE `geography_blocks`
  ADD CONSTRAINT `geography_blocks_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `geography_districts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `geography_blocks_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `geography_divisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `geography_districts`
--
ALTER TABLE `geography_districts`
  ADD CONSTRAINT `geography_districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `geography_divisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `navbar_items`
--
ALTER TABLE `navbar_items`
  ADD CONSTRAINT `navbar_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `navbar_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_projects`
--
ALTER TABLE `package_projects`
  ADD CONSTRAINT `package_projects_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `geography_blocks` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `geography_districts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_lok_sabha_id_foreign` FOREIGN KEY (`lok_sabha_id`) REFERENCES `constituencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_category_id_foreign` FOREIGN KEY (`package_category_id`) REFERENCES `projects_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_component_id_foreign` FOREIGN KEY (`package_component_id`) REFERENCES `package_components` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_sub_category_id_foreign` FOREIGN KEY (`package_sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_vidhan_sabha_id_foreign` FOREIGN KEY (`vidhan_sabha_id`) REFERENCES `constituencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `physical_boq_progress`
--
ALTER TABLE `physical_boq_progress`
  ADD CONSTRAINT `physical_boq_progress_boq_entry_id_foreign` FOREIGN KEY (`boq_entry_id`) REFERENCES `boqentry_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `physical_boq_progress_sub_package_project_id_foreign` FOREIGN KEY (`sub_package_project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `physical_epc_progress`
--
ALTER TABLE `physical_epc_progress`
  ADD CONSTRAINT `physical_epc_progress_epcentry_data_id_foreign` FOREIGN KEY (`epcentry_data_id`) REFERENCES `epcentry_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_details`
--
ALTER TABLE `procurement_details`
  ADD CONSTRAINT `procurement_details_package_project_id_foreign` FOREIGN KEY (`package_project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_details_type_of_procurement_id_foreign` FOREIGN KEY (`type_of_procurement_id`) REFERENCES `type_of_procurements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_work_programs`
--
ALTER TABLE `procurement_work_programs`
  ADD CONSTRAINT `procurement_work_programs_package_project_id_foreign` FOREIGN KEY (`package_project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_work_programs_procurement_details_id_foreign` FOREIGN KEY (`procurement_details_id`) REFERENCES `procurement_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `safeguard_entries`
--
ALTER TABLE `safeguard_entries`
  ADD CONSTRAINT `safeguard_entries_contraction_phase_id_foreign` FOREIGN KEY (`contraction_phase_id`) REFERENCES `contraction_phases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safeguard_entries_safeguard_compliance_id_foreign` FOREIGN KEY (`safeguard_compliance_id`) REFERENCES `safeguard_compliances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safeguard_entries_sub_package_project_id_foreign` FOREIGN KEY (`sub_package_project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_safeguard_entries`
--
ALTER TABLE `social_safeguard_entries`
  ADD CONSTRAINT `social_safeguard_entries_contraction_phase_id_foreign` FOREIGN KEY (`contraction_phase_id`) REFERENCES `contraction_phases` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `social_safeguard_entries_safeguard_entry_id_foreign` FOREIGN KEY (`safeguard_entry_id`) REFERENCES `safeguard_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_safeguard_entries_social_compliance_id_foreign` FOREIGN KEY (`social_compliance_id`) REFERENCES `safeguard_compliances` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `social_safeguard_entries_sub_package_project_id_foreign` FOREIGN KEY (`sub_package_project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `projects_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_package_projects`
--
ALTER TABLE `sub_package_projects`
  ADD CONSTRAINT `sub_package_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `work_service`
--
ALTER TABLE `work_service`
  ADD CONSTRAINT `work_service_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
