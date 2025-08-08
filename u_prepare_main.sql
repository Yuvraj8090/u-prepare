-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 01:31 PM
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
(1, 'USDMA', 'Ankit Sati Sir', '9258360243', 'admin@gmail.com', '29GGGGG1314R9Z6', 'Dehradun', '2025-08-08 05:18:39', '2025-08-08 05:18:39', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PIU-PWD', '2025-08-04 22:56:09', '2025-08-04 22:57:29'),
(2, 'PIU-RWD', '2025-08-04 22:56:19', '2025-08-04 22:57:41'),
(3, 'PIU-USDMA', '2025-08-04 22:57:50', '2025-08-04 22:57:50'),
(4, 'PIU-FOREST', '2025-08-04 22:58:01', '2025-08-04 22:58:01'),
(8, 'PMU', '2025-08-04 23:20:13', '2025-08-04 23:20:13');

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
(29, '2025_08_08_095338_create_contracts_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `package_projects`
--

CREATE TABLE `package_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `package_projects` (`id`, `project_id`, `package_category_id`, `package_sub_category_id`, `department_id`, `package_name`, `package_number`, `estimated_budget_incl_gst`, `vidhan_sabha_id`, `lok_sabha_id`, `district_id`, `block_id`, `dec_approved`, `dec_approval_date`, `dec_letter_number`, `dec_document_path`, `hpc_approved`, `hpc_approval_date`, `hpc_letter_number`, `hpc_document_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 5, 1, 'Demo First', '01/02/PWD', 14800000000.00, 1, NULL, 3, 1, 1, '2025-08-05', 'Demo TEST', 'package-projects/dec-documents/7dHMkLOe9qSEAdRRV6JMgWKVxJ4PgZpWv2PWBO72.pdf', 1, '2025-08-06', 'Demo Test 090', 'package-projects/hpc-documents/HOSWxddlNcgolzKxOtsJ9a0Ou4lFDtPhsJACVNPt.pdf', '2025-08-05 06:28:33', '2025-08-05 07:19:34', NULL),
(2, 1, 1, 5, 1, 'PWD 120Mtr. Bridge', '01/03/PWD', 9000000.00, 3, NULL, 4, 2, 1, '2025-08-07', 'Demo TESTw3', 'package-projects/dec-documents/J8YX2G4KdCZbDhKeQZbmuNSmuWE5i88vH0uUZ42Z.pdf', 1, '2025-08-07', 'Demo Test 090', 'package-projects/hpc-documents/QM0ihwlsbvJBxCzyfy4PeMOzEnylX86YUBNWLdsN.pdf', '2025-08-07 01:46:56', '2025-08-07 01:46:56', NULL),
(3, 1, 1, 5, 1, 'PWD 12230Mtr. Bridge', '01/04/PWD', 80.00, 3, NULL, 10, 2, 1, '2025-08-01', 'Demo TESTweq', 'package-projects/dec-documents/hpqCwHPBrT5WeUt5K9FFth28EpbU0MVai8sFLmKU.pdf', 1, '2025-08-02', 'Demo Test 0902we', 'package-projects/hpc-documents/XWY6Yl5cqAEwIWQUHCgf2xeKNdcX3JMzKcdpDj6S.pdf', '2025-08-08 04:40:59', '2025-08-08 04:41:08', '2025-08-08 04:41:08');

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
-- Table structure for table `procurement_details`
--

CREATE TABLE `procurement_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_project_id` bigint(20) UNSIGNED NOT NULL,
  `method_of_procurement` varchar(255) DEFAULT NULL,
  `type_of_procurement` varchar(255) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `publication_document_path` varchar(255) DEFAULT NULL,
  `tender_fee` decimal(12,2) DEFAULT NULL,
  `earnest_money_deposit` decimal(12,2) DEFAULT NULL,
  `bid_validity_days` int(11) DEFAULT NULL,
  `emd_validity_days` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `procurement_details`
--

INSERT INTO `procurement_details` (`id`, `package_project_id`, `method_of_procurement`, `type_of_procurement`, `publication_date`, `publication_document_path`, `tender_fee`, `earnest_money_deposit`, `bid_validity_days`, `emd_validity_days`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 2, 'Request for Proposals', 'EPC', '2025-08-01', 'procurement_docs/NnJYQEvv23ycKdI2C3h6m8cDoVvFhBG8XG0gcHvQ.pdf', 90.00, 90.00, 90, 120, '2025-08-08 01:21:35', '2025-08-08 01:21:35', NULL),
(6, 1, 'Request for Proposals', 'EPC', '2025-08-01', 'procurement_docs/5I89Jb7KQxHh9oGgRS8zXmec01369fwS4qVyANA8.pdf', 20.00, 30.00, 40, 120, '2025-08-08 02:15:42', '2025-08-08 02:15:42', NULL);

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
(1, 1, 6, 'Preparation and Approval of Bid Document and Estimate', 30.00, 20, '2025-08-01', '2025-08-21', 'procurement_docs/aM8ZJmwsovPVUTb7AQcbZuM9sLIPssG5f86NRdu7.pdf', 'procurement_docs/1ZbQv5fnteY2zwCINgWPGp7hl4UbnDZo6TDR5RnJ.pdf', '2025-08-08 02:35:48', '2025-08-08 04:14:46', NULL),
(2, 1, 6, 'Publication of Bids', 20.00, 20, '2025-08-01', '2025-09-10', 'procurement_docs/2oiY4U4kWBPSJvqbjpADx6eciYBxM2LflFZWdtmB.pdf', 'procurement_docs/1ZbQv5fnteY2zwCINgWPGp7hl4UbnDZo6TDR5RnJ.pdf', '2025-08-08 02:35:48', '2025-08-08 02:35:48', NULL),
(3, 1, 6, 'Opening of Technical Bids', 5.00, 20, '2025-08-21', '2025-09-30', 'procurement_docs/2oiY4U4kWBPSJvqbjpADx6eciYBxM2LflFZWdtmB.pdf', 'procurement_docs/1ZbQv5fnteY2zwCINgWPGp7hl4UbnDZo6TDR5RnJ.pdf', '2025-08-08 02:35:48', '2025-08-08 02:35:48', NULL),
(4, 1, 6, 'Technical Evaluation', 5.00, 20, '2025-09-10', '2025-10-20', 'procurement_docs/2oiY4U4kWBPSJvqbjpADx6eciYBxM2LflFZWdtmB.pdf', 'procurement_docs/1ZbQv5fnteY2zwCINgWPGp7hl4UbnDZo6TDR5RnJ.pdf', '2025-08-08 02:35:48', '2025-08-08 02:35:48', NULL),
(5, 1, 6, 'Notification of Award', 20.00, 20, '2025-09-30', '2025-11-09', 'procurement_docs/2oiY4U4kWBPSJvqbjpADx6eciYBxM2LflFZWdtmB.pdf', 'procurement_docs/1ZbQv5fnteY2zwCINgWPGp7hl4UbnDZo6TDR5RnJ.pdf', '2025-08-08 02:35:48', '2025-08-08 02:35:48', NULL),
(6, 1, 6, 'Contract', 20.00, 20, '2025-10-20', '2025-11-29', 'procurement_docs/2oiY4U4kWBPSJvqbjpADx6eciYBxM2LflFZWdtmB.pdf', 'procurement_docs/1ZbQv5fnteY2zwCINgWPGp7hl4UbnDZo6TDR5RnJ.pdf', '2025-08-08 02:35:48', '2025-08-08 02:35:48', NULL),
(7, 2, 5, 'Preparation and Approval of Bid Document and Estimate', 30.00, 30, '2025-08-01', '2025-08-31', 'procurement_docs/PhxMOep07sFURMUbBjfG8He7StTZN073P7AbBb2f.pdf', 'procurement_docs/XhAwwEa2ZDBOCO2WL3dOGZApt3SIXTgX7k5QX4Pg.pdf', '2025-08-08 04:19:30', '2025-08-08 04:19:30', NULL),
(8, 2, 5, 'Publication of Bids', 20.00, 30, '2025-08-01', '2025-09-30', 'procurement_docs/PhxMOep07sFURMUbBjfG8He7StTZN073P7AbBb2f.pdf', 'procurement_docs/XhAwwEa2ZDBOCO2WL3dOGZApt3SIXTgX7k5QX4Pg.pdf', '2025-08-08 04:19:30', '2025-08-08 04:19:30', NULL),
(9, 2, 5, 'Opening of Technical Bids', 10.00, 30, '2025-08-31', '2025-10-30', 'procurement_docs/PhxMOep07sFURMUbBjfG8He7StTZN073P7AbBb2f.pdf', 'procurement_docs/XhAwwEa2ZDBOCO2WL3dOGZApt3SIXTgX7k5QX4Pg.pdf', '2025-08-08 04:19:30', '2025-08-08 04:19:30', NULL),
(10, 2, 5, 'Technical Evaluation', 10.00, 30, '2025-09-30', '2025-11-29', 'procurement_docs/PhxMOep07sFURMUbBjfG8He7StTZN073P7AbBb2f.pdf', 'procurement_docs/XhAwwEa2ZDBOCO2WL3dOGZApt3SIXTgX7k5QX4Pg.pdf', '2025-08-08 04:19:30', '2025-08-08 04:19:30', NULL),
(11, 2, 5, 'Notification of Award', 10.00, 30, '2025-10-30', '2025-12-29', 'procurement_docs/PhxMOep07sFURMUbBjfG8He7StTZN073P7AbBb2f.pdf', 'procurement_docs/XhAwwEa2ZDBOCO2WL3dOGZApt3SIXTgX7k5QX4Pg.pdf', '2025-08-08 04:19:30', '2025-08-08 04:19:30', NULL),
(12, 2, 5, 'Contract', 20.00, 30, '2025-11-29', '2026-01-28', 'procurement_docs/PhxMOep07sFURMUbBjfG8He7StTZN073P7AbBb2f.pdf', 'procurement_docs/XhAwwEa2ZDBOCO2WL3dOGZApt3SIXTgX7k5QX4Pg.pdf', '2025-08-08 04:19:30', '2025-08-08 04:19:30', NULL);

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
('C8E9nXjxJykglXIXikjcr4H9oxCGs75hqaTzzGhE', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTnY3VnhXOWtiWE1FNzZacTNiY0R2R3BXTTZ2b3BBdTNrQWdqNXN6QSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vY29udHJhY3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiRIYWc5b1MwYjIyNml3OUxibzJIdkFlZXBVOUFOTXhOTHBSMmpyY1htbjV0cUhHL2g4bkZ0aSI7fQ==', 1754652504);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `department_id`, `designation_id`, `gender`, `phone_no`, `status`, `district`, `deleted_at`) VALUES
(1, 1, 'admin', 'admin@gmail.com', NULL, '$2y$12$kWxg7ssc6zidAC/DKu5.0e9cmmMFcLlBOOQiH1yFglFzNP.i9TLQi', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-04 06:58:54', '2025-08-04 06:58:54', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(2, 1, 'Test User 1', 'testuser1@example.com', '2025-08-04 11:12:57', '$2y$12$VzxX3jmvEG/0dKL4w5jbWe3PLWtM8cIz7eU3YUh0MV4k1uTP8uAlu', NULL, NULL, NULL, 'OjPV8Rf3S1', NULL, NULL, '2025-08-04 11:12:58', '2025-08-04 12:31:58', NULL, NULL, NULL, NULL, 'active', NULL, '2025-08-04 12:31:58'),
(3, 3, 'Test User 2', 'testuser2@example.com', '2025-08-04 11:12:58', '$2y$12$Hag9oS0b226iw9Lbo2HvAeepU9ANMxNLpR2jrcXmn5tqHG/h8nFti', NULL, NULL, NULL, 'EOhJLh6qklUu6IFvwY3FK5oDO2mwdwxUaIN55ExizOwutuIDbQM3rGn9twYN', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-04 23:34:32', 1, 10, 'male', '9090909090', 'active', 'Dehradun', NULL),
(4, 1, 'Test User 3', 'testuser3@example.com', '2025-08-04 11:12:58', '$2y$12$.WEudQx6rlE8IvXmtz3she.zKNd2NOA3FpF6.WGHv8QoqKV2yajUq', NULL, NULL, NULL, 'P7Kjy9dmBp', NULL, NULL, '2025-08-04 11:12:58', '2025-08-04 11:12:58', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(5, 1, 'Test User 4', 'testuser4@example.com', '2025-08-04 11:12:58', '$2y$12$OiQc5Mamqa0WO4SsmHzovOm520kqdi6hszqA6gXQYdycPHwsRJqYS', NULL, NULL, NULL, 'aI1TSgyKKG', NULL, NULL, '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(6, 1, 'Test User 5', 'testuser5@example.com', '2025-08-04 11:12:59', '$2y$12$ArGPNhRO/EFR48OFxTVLPOpJgMl226X.RWfsAp.G6id8.JpKk8ege', NULL, NULL, NULL, 'XuV6KCkwjv', NULL, NULL, '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(7, 1, 'Test User 6', 'testuser6@example.com', '2025-08-04 11:12:59', '$2y$12$YZ45SKbyL10z5A5XyZFTPe60mmOTibR4HId3pymwaVMClWYg88A5G', NULL, NULL, NULL, '8ngp7rVu02', NULL, NULL, '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(8, 1, 'Test User 7', 'testuser7@example.com', '2025-08-04 11:12:59', '$2y$12$i6bgzn2YqV.7OS2t8BRXjOOPnOFpHLYDsvEFMriFw1zX.leIEX6MO', NULL, NULL, NULL, 'xWiPiMStdJ', NULL, NULL, '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(9, 1, 'Test User 8', 'testuser8@example.com', '2025-08-04 11:13:00', '$2y$12$c/1QCkJxDRlvVUooKOxyweHPkqUKEfiakuD0IWppXOB6n6JImSFw2', NULL, NULL, NULL, 'otK0zoH0Vu', NULL, NULL, '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(10, 1, 'Test User 9', 'testuser9@example.com', '2025-08-04 11:13:00', '$2y$12$xdV4G9bXXF6mMTEtMverAOCQ9s4Al9Ea9/6i8xXG8aB9yJaNimexy', NULL, NULL, NULL, 'x7TGbcrScH', NULL, NULL, '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(11, 1, 'Test User 10', 'testuser10@example.com', '2025-08-04 11:13:00', '$2y$12$qeK4sCfVXGn5coHg89ugC.3ce6bJ1LtUamJCh6xpYW0flixugOnXK', NULL, NULL, NULL, 'w9pJVhbFHm', NULL, NULL, '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(12, 1, 'Test User 11', 'testuser11@example.com', '2025-08-04 11:13:01', '$2y$12$/NK1WIc.AKqvBR9vo3.vSOa5apAKGLNNuwtnocj8btk59/xWQrF5C', NULL, NULL, NULL, 'RLsh78jbMz', NULL, NULL, '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(13, 1, 'Test User 12', 'testuser12@example.com', '2025-08-04 11:13:01', '$2y$12$73TgswNaGJ9tBu/e8bwUN.rFHYExRL8pDZ0BpWYOA3dv0KzEZ8Zla', NULL, NULL, NULL, 'Tr9kUsqTzH', NULL, NULL, '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(14, 1, 'Test User 13', 'testuser13@example.com', '2025-08-04 11:13:01', '$2y$12$hu6KuOHt.c6L/CDBc.1IN.YfwkXrn11AAocWIrRVvivtgNsXWwJwq', NULL, NULL, NULL, 'yzjgtmKSRD', NULL, NULL, '2025-08-04 11:13:02', '2025-08-04 11:13:02', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(15, 1, 'Test User 14', 'testuser14@example.com', '2025-08-04 11:13:02', '$2y$12$kih.JQHDJReUYfnjeyK1BuVeo7Y22QSigKgn/VVQMek/9W46j/mya', NULL, NULL, NULL, 'nfHFORKiB5', NULL, NULL, '2025-08-04 11:13:02', '2025-08-04 11:13:02', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(16, 1, 'Test User 15', 'testuser15@example.com', '2025-08-04 11:13:02', '$2y$12$6rPybpQhqCdYK5llA3OwFeAtd97zVnD7.WiOYfTsBht4.LgllsZFy', NULL, NULL, NULL, 'vFs9N8Yyy2', NULL, NULL, '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(17, 1, 'Test User 16', 'testuser16@example.com', '2025-08-04 11:13:03', '$2y$12$XAEOAgA0cxFe/NHKPCQqOOvyPQRJBrfeMSEaXerjuYXAs3.zzwd/6', NULL, NULL, NULL, 'eolVR6m8WL', NULL, NULL, '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(18, 1, 'Test User 17', 'testuser17@example.com', '2025-08-04 11:13:03', '$2y$12$8Q13ltV3i2bnzMFcDscO6e/NePTdNoB9iG3nZoQTfTWoMxoeibm7e', NULL, NULL, NULL, 'UdoGQTBXOX', NULL, NULL, '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(19, 1, 'Test User 18', 'testuser18@example.com', '2025-08-04 11:13:03', '$2y$12$.eKZ5nXZa0AgKFoZUQcGz.1ty0UdtFMzIpagEHqktb97wzH4T1GXa', NULL, NULL, NULL, 'Y6UJup7WCQ', NULL, NULL, '2025-08-04 11:13:04', '2025-08-04 11:13:04', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(20, 1, 'Test User 19', 'testuser19@example.com', '2025-08-04 11:13:04', '$2y$12$h6SIIBevrKXQJYNhfY66kOfjTdSeMJsoAPcuKcQXHj3XdlCxJQZ6m', NULL, NULL, NULL, '5IpsstbcUO', NULL, NULL, '2025-08-04 11:13:04', '2025-08-04 11:13:04', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(21, 1, 'Test User 20', 'testuser20@example.com', '2025-08-04 11:13:04', '$2y$12$HWRaIBLDiIIpfh9QvRJkSOeRTXM0QwxZnPHO6dplb5IpbQKAybJyS', NULL, NULL, NULL, 'VJ7rV7iPwc', NULL, NULL, '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(22, 1, 'Test User 21', 'testuser21@example.com', '2025-08-04 11:13:05', '$2y$12$VRbEn7gESRE4kd8YFT8wxO.UlRiuY/waljAQx7cXxssYeWnB2Uleq', NULL, NULL, NULL, 'wIIK1l5H5Z', NULL, NULL, '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(23, 1, 'Test User 22', 'testuser22@example.com', '2025-08-04 11:13:05', '$2y$12$pucmDxQM2N1ci.w.tI86OOip9.F0D8PlIIiqIqlSEQtFfCxQzmOAS', NULL, NULL, NULL, 'YnKYhATwwO', NULL, NULL, '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(24, 1, 'Test User 23', 'testuser23@example.com', '2025-08-04 11:13:05', '$2y$12$Orck/Rn2FWrpJyD/tfQgeuuxtj11R3jRwXjXi4PZqVpWeSXNhjiq.', NULL, NULL, NULL, 'KTYF2ZOoY1', NULL, NULL, '2025-08-04 11:13:06', '2025-08-04 11:13:06', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(25, 1, 'Test User 24', 'testuser24@example.com', '2025-08-04 11:13:06', '$2y$12$8UoekrmxzpROdM659cwU4eIORANM.h6YPuETOrIVM3ABUSILqVg2O', NULL, NULL, NULL, 'JDOhsK1q7f', NULL, NULL, '2025-08-04 11:13:06', '2025-08-04 11:13:06', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(26, 1, 'Test User 25', 'testuser25@example.com', '2025-08-04 11:13:06', '$2y$12$QunanTnLEZFSD9Xis/NYyeZP.U63nC0PjUlwQOehvqpRv584kOBMm', NULL, NULL, NULL, '7jt9nC3vIh', NULL, NULL, '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(27, 1, 'Test User 26', 'testuser26@example.com', '2025-08-04 11:13:07', '$2y$12$fevbBEtcyc31fGOVeimHsupFxEx/zzUPJl/twenuuzfczOFTBi3qS', NULL, NULL, NULL, 'YKQczUSKYT', NULL, NULL, '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(28, 1, 'Test User 27', 'testuser27@example.com', '2025-08-04 11:13:07', '$2y$12$.fDluNd8s2tA8pfdozh6vupvj18zyUlJuZTDJrVF98KJZpuNGOBpu', NULL, NULL, NULL, 'aKfaIR2b9Z', NULL, NULL, '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(29, 1, 'Test User 28', 'testuser28@example.com', '2025-08-04 11:13:07', '$2y$12$fGkVjaT62x77WKFRB/9.HelSkLA08yX8OHtJ7QVO0Mh/V9iBTB.dK', NULL, NULL, NULL, 'xPilcRiC1D', NULL, NULL, '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(30, 1, 'Test User 29', 'testuser29@example.com', '2025-08-04 11:13:08', '$2y$12$xFZCbuYY4AcayMYYIyutqew6MGDr1hZvcJ7gsX8Fe7bfpnHy3ER9K', NULL, NULL, NULL, 'oXRMO2xbZy', NULL, NULL, '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(31, 1, 'Test User 30', 'testuser30@example.com', '2025-08-04 11:13:08', '$2y$12$Y37eb8s.TfJ77jRRAOeaROBNLI6wX9jDDFzdY5hUe6yy4ES1KS6ry', NULL, NULL, NULL, '4kU4YQZwfR', NULL, NULL, '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(32, 2, 'Yuvraj Kohli', 'Yuvrajkohli8090ylt@gmail.com', NULL, '$2y$12$Cw97ve07IYTo3nIjcmR8TeeQNN85kAOFb8.qYZRhDlGT9F1eBoOGy', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-04 11:55:58', '2025-08-04 11:55:58', NULL, NULL, NULL, NULL, 'active', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assembly`
--
ALTER TABLE `assembly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assembly_district_id_foreign` (`district_id`),
  ADD KEY `assembly_constituency_id_foreign` (`constituency_id`);

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
  ADD KEY `contracts_contractor_id_foreign` (`contractor_id`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD KEY `package_projects_block_id_foreign` (`block_id`);

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
-- Indexes for table `procurement_details`
--
ALTER TABLE `procurement_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_details_package_project_id_foreign` (`package_project_id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_category_id_index` (`category_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assembly`
--
ALTER TABLE `assembly`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `constituencies`
--
ALTER TABLE `constituencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contractors`
--
ALTER TABLE `contractors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `package_projects`
--
ALTER TABLE `package_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procurement_details`
--
ALTER TABLE `procurement_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `procurement_work_programs`
--
ALTER TABLE `procurement_work_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assembly`
--
ALTER TABLE `assembly`
  ADD CONSTRAINT `assembly_constituency_id_foreign` FOREIGN KEY (`constituency_id`) REFERENCES `constituencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assembly_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `geography_districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_contractor_id_foreign` FOREIGN KEY (`contractor_id`) REFERENCES `contractors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `package_projects`
--
ALTER TABLE `package_projects`
  ADD CONSTRAINT `package_projects_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `geography_blocks` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `geography_districts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_lok_sabha_id_foreign` FOREIGN KEY (`lok_sabha_id`) REFERENCES `constituencies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_category_id_foreign` FOREIGN KEY (`package_category_id`) REFERENCES `projects_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_sub_category_id_foreign` FOREIGN KEY (`package_sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_vidhan_sabha_id_foreign` FOREIGN KEY (`vidhan_sabha_id`) REFERENCES `constituencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `procurement_details`
--
ALTER TABLE `procurement_details`
  ADD CONSTRAINT `procurement_details_package_project_id_foreign` FOREIGN KEY (`package_project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurement_work_programs`
--
ALTER TABLE `procurement_work_programs`
  ADD CONSTRAINT `procurement_work_programs_package_project_id_foreign` FOREIGN KEY (`package_project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `procurement_work_programs_procurement_details_id_foreign` FOREIGN KEY (`procurement_details_id`) REFERENCES `procurement_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `projects_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
