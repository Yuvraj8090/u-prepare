-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2025 at 07:55 AM
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
(1, 13, 1, 'Purola', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(2, 13, 1, 'Yamunotri', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(3, 13, 1, 'Gangotri', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(4, 3, 2, 'Badrinath', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(5, 3, 2, 'Tharali', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(6, 3, 2, 'Karnaprayag', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(7, 10, 2, 'Kedarnath', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(8, 10, 2, 'Rudraprayag', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(9, 11, 1, 'Ghansali', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(10, 11, 2, 'Devprayag', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(11, 11, 2, 'Narendranagar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(12, 11, 1, 'Pratapnagar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(13, 11, 1, 'Tehri', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(14, 11, 1, 'Dhanaulti', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(15, 5, 1, 'Chakrata', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(16, 5, 1, 'Vikasnagar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(17, 5, 1, 'Sahaspur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(18, 5, 3, 'Dharampur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(19, 5, 1, 'Raipur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(20, 5, 1, 'Rajpur Road', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(21, 5, 1, 'Dehradun Cantonment', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(22, 5, 1, 'Mussoorie', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(23, 5, 3, 'Doiwala', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(24, 5, 3, 'Rishikesh', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(25, 6, 3, 'Haridwar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(26, 6, 3, 'BHEL Ranipur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(27, 6, 3, 'Jwalapur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(28, 6, 3, 'Bhagwanpur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(29, 6, 3, 'Jhabrera', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(30, 6, 3, 'Piran Kaliyar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(31, 6, 3, 'Roorkee', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(32, 6, 3, 'Khanpur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(33, 6, 3, 'Manglaur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(34, 6, 3, 'Laksar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(35, 6, 3, 'Haridwar Rural', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(36, 8, 2, 'Yamkeshwar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(37, 8, 2, 'Pauri', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(38, 8, 2, 'Srinagar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(39, 8, 2, 'Chaubattakhal', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(40, 8, 2, 'Lansdowne', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(41, 8, 2, 'Kotdwar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(42, 9, 4, 'Dharchula', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(43, 9, 4, 'Didihat', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(44, 9, 4, 'Pithoragarh', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(45, 9, 4, 'Gangolihat', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(46, 2, 4, 'Kapkot', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(47, 2, 4, 'Bageshwar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(48, 1, 4, 'Dwarahat', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(49, 1, 4, 'Salt', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(50, 1, 4, 'Ranikhet', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(51, 1, 4, 'Someshwar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(52, 1, 4, 'Almora', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(53, 1, 4, 'Jageshwar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(54, 4, 4, 'Lohaghat', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(55, 4, 4, 'Champawat', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(56, 7, 5, 'Lalkuan', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(57, 7, 5, 'Bhimtal', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(58, 7, 5, 'Nainital', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(59, 7, 5, 'Haldwani', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(60, 7, 5, 'Kaladhungi', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(61, 7, 2, 'Ramnagar', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(62, 12, 5, 'Jaspur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(63, 12, 5, 'Kashipur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(64, 12, 5, 'Bajpur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(65, 12, 5, 'Gadarpur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(66, 12, 5, 'Rudrapur', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(67, 12, 5, 'Kichha', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(68, 12, 5, 'Sitarganj', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(69, 12, 5, 'Nanakmatta', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL),
(70, 12, 5, 'Khatima', 1, '2024-03-27 18:54:12', '2024-03-27 18:54:12', NULL);

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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('role_routes_1', 'a:217:{i:0;s:31:\"admin.already_define_epc.create\";i:1;s:32:\"admin.already_define_epc.destroy\";i:2;s:29:\"admin.already_define_epc.edit\";i:3;s:30:\"admin.already_define_epc.index\";i:4;s:29:\"admin.already_define_epc.show\";i:5;s:30:\"admin.already_define_epc.store\";i:6;s:31:\"admin.already_define_epc.update\";i:7;s:26:\"admin.boqentry.bulk-delete\";i:8;s:21:\"admin.boqentry.create\";i:9;s:22:\"admin.boqentry.destroy\";i:10;s:19:\"admin.boqentry.edit\";i:11;s:20:\"admin.boqentry.index\";i:12;s:32:\"admin.boqentry.physical-progress\";i:13;s:37:\"admin.boqentry.save-physical-progress\";i:14;s:20:\"admin.boqentry.store\";i:15;s:21:\"admin.boqentry.update\";i:16;s:21:\"admin.boqentry.upload\";i:17;s:31:\"admin.contraction-phases.create\";i:18;s:32:\"admin.contraction-phases.destroy\";i:19;s:29:\"admin.contraction-phases.edit\";i:20;s:30:\"admin.contraction-phases.index\";i:21;s:29:\"admin.contraction-phases.show\";i:22;s:30:\"admin.contraction-phases.store\";i:23;s:31:\"admin.contraction-phases.update\";i:24;s:24:\"admin.contractors.create\";i:25;s:25:\"admin.contractors.destroy\";i:26;s:22:\"admin.contractors.edit\";i:27;s:23:\"admin.contractors.index\";i:28;s:22:\"admin.contractors.show\";i:29;s:23:\"admin.contractors.store\";i:30;s:24:\"admin.contractors.update\";i:31;s:22:\"admin.contracts.create\";i:32;s:23:\"admin.contracts.destroy\";i:33;s:20:\"admin.contracts.edit\";i:34;s:21:\"admin.contracts.index\";i:35;s:20:\"admin.contracts.show\";i:36;s:21:\"admin.contracts.store\";i:37;s:22:\"admin.contracts.update\";i:38;s:15:\"admin.dashboard\";i:39;s:24:\"admin.departments.create\";i:40;s:25:\"admin.departments.destroy\";i:41;s:22:\"admin.departments.edit\";i:42;s:23:\"admin.departments.index\";i:43;s:22:\"admin.departments.show\";i:44;s:23:\"admin.departments.store\";i:45;s:24:\"admin.departments.update\";i:46;s:25:\"admin.designations.create\";i:47;s:26:\"admin.designations.destroy\";i:48;s:23:\"admin.designations.edit\";i:49;s:24:\"admin.designations.index\";i:50;s:23:\"admin.designations.show\";i:51;s:24:\"admin.designations.store\";i:52;s:25:\"admin.designations.update\";i:53;s:31:\"admin.epcentry_data.bulkDestroy\";i:54;s:26:\"admin.epcentry_data.create\";i:55;s:27:\"admin.epcentry_data.destroy\";i:56;s:24:\"admin.epcentry_data.edit\";i:57;s:25:\"admin.epcentry_data.index\";i:58;s:25:\"admin.epcentry_data.store\";i:59;s:36:\"admin.epcentry_data.storeFromDefined\";i:60;s:26:\"admin.epcentry_data.update\";i:61;s:39:\"admin.financial-progress-updates.create\";i:62;s:40:\"admin.financial-progress-updates.destroy\";i:63;s:37:\"admin.financial-progress-updates.edit\";i:64;s:38:\"admin.financial-progress-updates.index\";i:65;s:37:\"admin.financial-progress-updates.show\";i:66;s:38:\"admin.financial-progress-updates.store\";i:67;s:39:\"admin.financial-progress-updates.update\";i:68;s:31:\"admin.financial-progress.upload\";i:69;s:19:\"admin.media.gallery\";i:70;s:17:\"admin.media.index\";i:71;s:24:\"admin.media_files.upload\";i:72;s:25:\"admin.navbar-items.create\";i:73;s:26:\"admin.navbar-items.destroy\";i:74;s:23:\"admin.navbar-items.edit\";i:75;s:24:\"admin.navbar-items.index\";i:76;s:23:\"admin.navbar-items.show\";i:77;s:24:\"admin.navbar-items.store\";i:78;s:25:\"admin.navbar-items.update\";i:79;s:31:\"admin.navbar-items.update-order\";i:80;s:31:\"admin.package-components.create\";i:81;s:32:\"admin.package-components.destroy\";i:82;s:29:\"admin.package-components.edit\";i:83;s:30:\"admin.package-components.index\";i:84;s:29:\"admin.package-components.show\";i:85;s:30:\"admin.package-components.store\";i:86;s:31:\"admin.package-components.update\";i:87;s:40:\"admin.package-project-assignments.create\";i:88;s:41:\"admin.package-project-assignments.destroy\";i:89;s:38:\"admin.package-project-assignments.edit\";i:90;s:39:\"admin.package-project-assignments.index\";i:91;s:38:\"admin.package-project-assignments.show\";i:92;s:39:\"admin.package-project-assignments.store\";i:93;s:40:\"admin.package-project-assignments.update\";i:94;s:29:\"admin.package-projects.create\";i:95;s:30:\"admin.package-projects.destroy\";i:96;s:27:\"admin.package-projects.edit\";i:97;s:28:\"admin.package-projects.index\";i:98;s:27:\"admin.package-projects.show\";i:99;s:28:\"admin.package-projects.store\";i:100;s:29:\"admin.package-projects.update\";i:101;s:18:\"admin.pages.create\";i:102;s:23:\"admin.pages.create.form\";i:103;s:18:\"admin.pages.delete\";i:104;s:21:\"admin.pages.edit.form\";i:105;s:16:\"admin.pages.list\";i:106;s:18:\"admin.pages.update\";i:107;s:39:\"admin.physical_boq_progress.bulk-delete\";i:108;s:34:\"admin.physical_boq_progress.create\";i:109;s:35:\"admin.physical_boq_progress.destroy\";i:110;s:32:\"admin.physical_boq_progress.edit\";i:111;s:33:\"admin.physical_boq_progress.index\";i:112;s:33:\"admin.physical_boq_progress.store\";i:113;s:34:\"admin.physical_boq_progress.update\";i:114;s:39:\"admin.physical_epc_progress.bulkDestroy\";i:115;s:34:\"admin.physical_epc_progress.create\";i:116;s:35:\"admin.physical_epc_progress.destroy\";i:117;s:32:\"admin.physical_epc_progress.edit\";i:118;s:33:\"admin.physical_epc_progress.index\";i:119;s:32:\"admin.physical_epc_progress.show\";i:120;s:33:\"admin.physical_epc_progress.store\";i:121;s:34:\"admin.physical_epc_progress.update\";i:122;s:32:\"admin.procurement-details.create\";i:123;s:33:\"admin.procurement-details.destroy\";i:124;s:30:\"admin.procurement-details.edit\";i:125;s:31:\"admin.procurement-details.index\";i:126;s:30:\"admin.procurement-details.show\";i:127;s:31:\"admin.procurement-details.store\";i:128;s:32:\"admin.procurement-details.update\";i:129;s:38:\"admin.procurement-work-programs.create\";i:130;s:39:\"admin.procurement-work-programs.destroy\";i:131;s:36:\"admin.procurement-work-programs.edit\";i:132;s:47:\"admin.procurement-work-programs.edit-by-package\";i:133;s:37:\"admin.procurement-work-programs.index\";i:134;s:36:\"admin.procurement-work-programs.show\";i:135;s:41:\"admin.procurement-work-programs.show.pack\";i:136;s:37:\"admin.procurement-work-programs.store\";i:137;s:44:\"admin.procurement-work-programs.store-single\";i:138;s:38:\"admin.procurement-work-programs.update\";i:139;s:45:\"admin.procurement-work-programs.update-single\";i:140;s:48:\"admin.procurement-work-programs.upload-documents\";i:141;s:20:\"admin.project.create\";i:142;s:21:\"admin.project.destroy\";i:143;s:18:\"admin.project.edit\";i:144;s:19:\"admin.project.index\";i:145;s:18:\"admin.project.show\";i:146;s:19:\"admin.project.store\";i:147;s:20:\"admin.project.update\";i:148;s:30:\"admin.projects-category.create\";i:149;s:31:\"admin.projects-category.destroy\";i:150;s:28:\"admin.projects-category.edit\";i:151;s:29:\"admin.projects-category.index\";i:152;s:28:\"admin.projects-category.show\";i:153;s:29:\"admin.projects-category.store\";i:154;s:30:\"admin.projects-category.update\";i:155;s:24:\"admin.role_routes.create\";i:156;s:25:\"admin.role_routes.destroy\";i:157;s:22:\"admin.role_routes.edit\";i:158;s:23:\"admin.role_routes.index\";i:159;s:22:\"admin.role_routes.show\";i:160;s:23:\"admin.role_routes.store\";i:161;s:24:\"admin.role_routes.update\";i:162;s:18:\"admin.roles.create\";i:163;s:19:\"admin.roles.destroy\";i:164;s:16:\"admin.roles.edit\";i:165;s:17:\"admin.roles.index\";i:166;s:16:\"admin.roles.show\";i:167;s:17:\"admin.roles.store\";i:168;s:18:\"admin.roles.update\";i:169;s:34:\"admin.safeguard-compliances.create\";i:170;s:35:\"admin.safeguard-compliances.destroy\";i:171;s:32:\"admin.safeguard-compliances.edit\";i:172;s:33:\"admin.safeguard-compliances.index\";i:173;s:32:\"admin.safeguard-compliances.show\";i:174;s:33:\"admin.safeguard-compliances.store\";i:175;s:34:\"admin.safeguard-compliances.update\";i:176;s:35:\"admin.safeguard_entries.bulk-delete\";i:177;s:30:\"admin.safeguard_entries.create\";i:178;s:31:\"admin.safeguard_entries.destroy\";i:179;s:28:\"admin.safeguard_entries.edit\";i:180;s:30:\"admin.safeguard_entries.import\";i:181;s:29:\"admin.safeguard_entries.index\";i:182;s:28:\"admin.safeguard_entries.show\";i:183;s:29:\"admin.safeguard_entries.store\";i:184;s:30:\"admin.safeguard_entries.update\";i:185;s:36:\"admin.social_safeguard_entries.index\";i:186;s:53:\"admin.social_safeguard_entries.storeOrUpdateFromIndex\";i:187;s:28:\"admin.sub-departments.create\";i:188;s:29:\"admin.sub-departments.destroy\";i:189;s:26:\"admin.sub-departments.edit\";i:190;s:27:\"admin.sub-departments.index\";i:191;s:26:\"admin.sub-departments.show\";i:192;s:27:\"admin.sub-departments.store\";i:193;s:28:\"admin.sub-departments.update\";i:194;s:33:\"admin.type-of-procurements.create\";i:195;s:34:\"admin.type-of-procurements.destroy\";i:196;s:31:\"admin.type-of-procurements.edit\";i:197;s:32:\"admin.type-of-procurements.index\";i:198;s:34:\"admin.type-of-procurements.restore\";i:199;s:31:\"admin.type-of-procurements.show\";i:200;s:32:\"admin.type-of-procurements.store\";i:201;s:33:\"admin.type-of-procurements.update\";i:202;s:18:\"admin.users.create\";i:203;s:19:\"admin.users.destroy\";i:204;s:16:\"admin.users.edit\";i:205;s:17:\"admin.users.index\";i:206;s:16:\"admin.users.show\";i:207;s:17:\"admin.users.store\";i:208;s:18:\"admin.users.update\";i:209;s:26:\"admin.work_services.create\";i:210;s:27:\"admin.work_services.destroy\";i:211;s:24:\"admin.work_services.edit\";i:212;s:25:\"admin.work_services.index\";i:213;s:24:\"admin.work_services.show\";i:214;s:25:\"admin.work_services.store\";i:215;s:26:\"admin.work_services.update\";i:216;s:9:\"dashboard\";}', 1755756140);

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
(65, '2025_08_19_073941_drop_type_of_procurement_from_procurement_details_table', 48),
(66, '2025_08_19_121007_change_lok_sabha_fk_to_assembly', 49),
(67, '2025_08_20_054540_create_role_routes_table', 50),
(68, '2025_08_20_104756_create_package_project_assignments_table', 51),
(69, '2025_08_21_041813_create_sub_departments_table', 52);

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
(5, 1, 1, 1, 5, 1, 'Construction of 84 M Span Motor Bridge over Kotigaad in Km 01 of Tikochi-Duchanu-Kiranu- Sirtoli Motor Road in District Uttarkashi', '24/BR/RFB-EPC/UGRIDP/2023', 147751097.00, NULL, 18, 13, 2, 1, '2022-11-11', '1397/III(3)/2022', 'package-projects/dec-documents/yN1vq876nU0XAJDEj1xJw68S7Vw2TZRiorXbMt9x.pdf', 1, '2023-05-03', '103/UDRP-AF/2023', 'package-projects/hpc-documents/hKS6mA5a00jNUwa9lhrLLxy5gBRwMxdSBDS1wCja.pdf', '2025-08-17 02:55:37', '2025-08-19 06:40:28', NULL),
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
-- Table structure for table `package_project_assignments`
--

CREATE TABLE `package_project_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_project_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_project_assignments`
--

INSERT INTO `package_project_assignments` (`id`, `package_project_id`, `assigned_to`, `assigned_by`, `created_at`, `updated_at`) VALUES
(3, 5, 1, 3, '2025-08-20 23:27:47', '2025-08-20 23:27:47'),
(4, 5, 3, 3, '2025-08-20 23:27:47', '2025-08-20 23:27:47');

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
(9, 6, 'Request for Proposals ', NULL, NULL, 5000.00, 50000.00, 90, 180, '2025-08-18 00:54:50', '2025-08-18 00:54:50', NULL, 1),
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
(19, 5, 8, 'Preparation and Approval of Bid Document and Estimate', 20.00, 20, '2024-04-17', '2024-05-07', 'procurement_docs/Bo45zEnmNJbhz4PU0fFFz65j7Ptk8Hl8tY2gJVfT.pdf', 'procurement_docs/iEpsfwzWw1V39S03XddknWjZ4bIhRvvtMnCVHHKH.pdf', '2025-08-17 03:06:05', '2025-08-20 04:55:21', NULL),
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
(3, 'Senior-Manager', '2025-08-04 11:53:21', '2025-08-04 11:53:21'),
(4, 'It Admin', '2025-08-20 01:02:27', '2025-08-20 01:02:27'),
(5, 'Procurement', '2025-08-20 01:03:10', '2025-08-20 01:03:10'),
(6, 'Field Officer', '2025-08-20 01:03:23', '2025-08-20 01:03:23'),
(7, 'Social Officer', '2025-08-20 01:05:06', '2025-08-20 01:05:06'),
(8, 'Social Field  Officer', '2025-08-20 01:05:31', '2025-08-20 01:05:31'),
(9, 'Environmental Officer', '2025-08-20 01:14:57', '2025-08-20 01:14:57'),
(10, 'Environmental Field Officer', '2025-08-20 01:16:16', '2025-08-20 01:16:16'),
(11, 'Safeguard Officer', '2025-08-20 01:17:01', '2025-08-20 01:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_routes`
--

CREATE TABLE `role_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `route_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_routes`
--

INSERT INTO `role_routes` (`id`, `role_id`, `route_name`, `created_at`, `updated_at`) VALUES
(1825, 2, 'admin.already_define_epc.create', NULL, NULL),
(1826, 2, 'admin.already_define_epc.destroy', NULL, NULL),
(1827, 2, 'admin.already_define_epc.edit', NULL, NULL),
(1828, 2, 'admin.already_define_epc.index', NULL, NULL),
(1829, 2, 'admin.already_define_epc.show', NULL, NULL),
(1830, 2, 'admin.already_define_epc.store', NULL, NULL),
(1831, 2, 'admin.already_define_epc.update', NULL, NULL),
(1832, 2, 'admin.boqentry.bulk-delete', NULL, NULL),
(1833, 2, 'admin.boqentry.create', NULL, NULL),
(1834, 2, 'admin.boqentry.destroy', NULL, NULL),
(1835, 2, 'admin.boqentry.edit', NULL, NULL),
(1836, 2, 'admin.boqentry.index', NULL, NULL),
(1837, 2, 'admin.boqentry.physical-progress', NULL, NULL),
(1838, 2, 'admin.boqentry.save-physical-progress', NULL, NULL),
(1839, 2, 'admin.boqentry.store', NULL, NULL),
(1840, 2, 'admin.boqentry.update', NULL, NULL),
(1841, 2, 'admin.boqentry.upload', NULL, NULL),
(1842, 2, 'admin.contraction-phases.create', NULL, NULL),
(1843, 2, 'admin.contraction-phases.destroy', NULL, NULL),
(1844, 2, 'admin.contraction-phases.edit', NULL, NULL),
(1845, 2, 'admin.contraction-phases.index', NULL, NULL),
(1846, 2, 'admin.contraction-phases.show', NULL, NULL),
(1847, 2, 'admin.contraction-phases.store', NULL, NULL),
(1848, 2, 'admin.contraction-phases.update', NULL, NULL),
(1849, 2, 'admin.contractors.create', NULL, NULL),
(1850, 2, 'admin.contractors.destroy', NULL, NULL),
(1851, 2, 'admin.contractors.edit', NULL, NULL),
(1852, 2, 'admin.contractors.index', NULL, NULL),
(1853, 2, 'admin.contractors.show', NULL, NULL),
(1854, 2, 'admin.contractors.store', NULL, NULL),
(1855, 2, 'admin.contractors.update', NULL, NULL),
(1856, 2, 'admin.contracts.create', NULL, NULL),
(1857, 2, 'admin.contracts.destroy', NULL, NULL),
(1858, 2, 'admin.contracts.edit', NULL, NULL),
(1859, 2, 'admin.contracts.index', NULL, NULL),
(1860, 2, 'admin.contracts.show', NULL, NULL),
(1861, 2, 'admin.contracts.store', NULL, NULL),
(1862, 2, 'admin.contracts.update', NULL, NULL),
(1863, 2, 'admin.dashboard', NULL, NULL),
(1864, 2, 'admin.departments.create', NULL, NULL),
(1865, 2, 'admin.departments.destroy', NULL, NULL),
(1866, 2, 'admin.departments.edit', NULL, NULL),
(1867, 2, 'admin.departments.index', NULL, NULL),
(1868, 2, 'admin.departments.show', NULL, NULL),
(1869, 2, 'admin.departments.store', NULL, NULL),
(1870, 2, 'admin.departments.update', NULL, NULL),
(1871, 2, 'admin.designations.create', NULL, NULL),
(1872, 2, 'admin.designations.destroy', NULL, NULL),
(1873, 2, 'admin.designations.edit', NULL, NULL),
(1874, 2, 'admin.designations.index', NULL, NULL),
(1875, 2, 'admin.designations.show', NULL, NULL),
(1876, 2, 'admin.designations.store', NULL, NULL),
(1877, 2, 'admin.designations.update', NULL, NULL),
(1878, 2, 'admin.epcentry_data.bulkDestroy', NULL, NULL),
(1879, 2, 'admin.epcentry_data.create', NULL, NULL),
(1880, 2, 'admin.epcentry_data.destroy', NULL, NULL),
(1881, 2, 'admin.epcentry_data.edit', NULL, NULL),
(1882, 2, 'admin.epcentry_data.index', NULL, NULL),
(1883, 2, 'admin.epcentry_data.store', NULL, NULL),
(1884, 2, 'admin.epcentry_data.storeFromDefined', NULL, NULL),
(1885, 2, 'admin.epcentry_data.update', NULL, NULL),
(1886, 2, 'admin.financial-progress-updates.create', NULL, NULL),
(1887, 2, 'admin.financial-progress-updates.destroy', NULL, NULL),
(1888, 2, 'admin.financial-progress-updates.edit', NULL, NULL),
(1889, 2, 'admin.financial-progress-updates.index', NULL, NULL),
(1890, 2, 'admin.financial-progress-updates.show', NULL, NULL),
(1891, 2, 'admin.financial-progress-updates.store', NULL, NULL),
(1892, 2, 'admin.financial-progress-updates.update', NULL, NULL),
(1893, 2, 'admin.financial-progress.upload', NULL, NULL),
(1894, 2, 'admin.media.gallery', NULL, NULL),
(1895, 2, 'admin.media.index', NULL, NULL),
(1896, 2, 'admin.media_files.upload', NULL, NULL),
(1897, 2, 'admin.navbar-items.create', NULL, NULL),
(1898, 2, 'admin.navbar-items.destroy', NULL, NULL),
(1899, 2, 'admin.navbar-items.edit', NULL, NULL),
(1900, 2, 'admin.navbar-items.index', NULL, NULL),
(1901, 2, 'admin.navbar-items.show', NULL, NULL),
(1902, 2, 'admin.navbar-items.store', NULL, NULL),
(1903, 2, 'admin.navbar-items.update', NULL, NULL),
(1904, 2, 'admin.navbar-items.update-order', NULL, NULL),
(1905, 2, 'admin.package-components.create', NULL, NULL),
(1906, 2, 'admin.package-components.destroy', NULL, NULL),
(1907, 2, 'admin.package-components.edit', NULL, NULL),
(1908, 2, 'admin.package-components.index', NULL, NULL),
(1909, 2, 'admin.package-components.show', NULL, NULL),
(1910, 2, 'admin.package-components.store', NULL, NULL),
(1911, 2, 'admin.package-components.update', NULL, NULL),
(1912, 2, 'admin.package-project-assignments.create', NULL, NULL),
(1913, 2, 'admin.package-project-assignments.destroy', NULL, NULL),
(1914, 2, 'admin.package-project-assignments.edit', NULL, NULL),
(1915, 2, 'admin.package-project-assignments.index', NULL, NULL),
(1916, 2, 'admin.package-project-assignments.show', NULL, NULL),
(1917, 2, 'admin.package-project-assignments.store', NULL, NULL),
(1918, 2, 'admin.package-project-assignments.update', NULL, NULL),
(1919, 2, 'admin.package-projects.create', NULL, NULL),
(1920, 2, 'admin.package-projects.destroy', NULL, NULL),
(1921, 2, 'admin.package-projects.edit', NULL, NULL),
(1922, 2, 'admin.package-projects.index', NULL, NULL),
(1923, 2, 'admin.package-projects.show', NULL, NULL),
(1924, 2, 'admin.package-projects.store', NULL, NULL),
(1925, 2, 'admin.package-projects.update', NULL, NULL),
(1926, 2, 'admin.pages.create', NULL, NULL),
(1927, 2, 'admin.pages.create.form', NULL, NULL),
(1928, 2, 'admin.pages.delete', NULL, NULL),
(1929, 2, 'admin.pages.edit.form', NULL, NULL),
(1930, 2, 'admin.pages.list', NULL, NULL),
(1931, 2, 'admin.pages.update', NULL, NULL),
(1932, 2, 'admin.physical_boq_progress.bulk-delete', NULL, NULL),
(1933, 2, 'admin.physical_boq_progress.create', NULL, NULL),
(1934, 2, 'admin.physical_boq_progress.destroy', NULL, NULL),
(1935, 2, 'admin.physical_boq_progress.edit', NULL, NULL),
(1936, 2, 'admin.physical_boq_progress.index', NULL, NULL),
(1937, 2, 'admin.physical_boq_progress.store', NULL, NULL),
(1938, 2, 'admin.physical_boq_progress.update', NULL, NULL),
(1939, 2, 'admin.physical_epc_progress.bulkDestroy', NULL, NULL),
(1940, 2, 'admin.physical_epc_progress.create', NULL, NULL),
(1941, 2, 'admin.physical_epc_progress.destroy', NULL, NULL),
(1942, 2, 'admin.physical_epc_progress.edit', NULL, NULL),
(1943, 2, 'admin.physical_epc_progress.index', NULL, NULL),
(1944, 2, 'admin.physical_epc_progress.show', NULL, NULL),
(1945, 2, 'admin.physical_epc_progress.store', NULL, NULL),
(1946, 2, 'admin.physical_epc_progress.update', NULL, NULL),
(1947, 2, 'admin.procurement-details.create', NULL, NULL),
(1948, 2, 'admin.procurement-details.destroy', NULL, NULL),
(1949, 2, 'admin.procurement-details.edit', NULL, NULL),
(1950, 2, 'admin.procurement-details.index', NULL, NULL),
(1951, 2, 'admin.procurement-details.show', NULL, NULL),
(1952, 2, 'admin.procurement-details.store', NULL, NULL),
(1953, 2, 'admin.procurement-details.update', NULL, NULL),
(1954, 2, 'admin.procurement-work-programs.create', NULL, NULL),
(1955, 2, 'admin.procurement-work-programs.destroy', NULL, NULL),
(1956, 2, 'admin.procurement-work-programs.edit', NULL, NULL),
(1957, 2, 'admin.procurement-work-programs.edit-by-package', NULL, NULL),
(1958, 2, 'admin.procurement-work-programs.index', NULL, NULL),
(1959, 2, 'admin.procurement-work-programs.show', NULL, NULL),
(1960, 2, 'admin.procurement-work-programs.show.pack', NULL, NULL),
(1961, 2, 'admin.procurement-work-programs.store', NULL, NULL),
(1962, 2, 'admin.procurement-work-programs.store-single', NULL, NULL),
(1963, 2, 'admin.procurement-work-programs.update', NULL, NULL),
(1964, 2, 'admin.procurement-work-programs.update-single', NULL, NULL),
(1965, 2, 'admin.procurement-work-programs.upload-documents', NULL, NULL),
(1966, 2, 'admin.project.create', NULL, NULL),
(1967, 2, 'admin.project.destroy', NULL, NULL),
(1968, 2, 'admin.project.edit', NULL, NULL),
(1969, 2, 'admin.project.index', NULL, NULL),
(1970, 2, 'admin.project.show', NULL, NULL),
(1971, 2, 'admin.project.store', NULL, NULL),
(1972, 2, 'admin.project.update', NULL, NULL),
(1973, 2, 'admin.projects-category.create', NULL, NULL),
(1974, 2, 'admin.projects-category.destroy', NULL, NULL),
(1975, 2, 'admin.projects-category.edit', NULL, NULL),
(1976, 2, 'admin.projects-category.index', NULL, NULL),
(1977, 2, 'admin.projects-category.show', NULL, NULL),
(1978, 2, 'admin.projects-category.store', NULL, NULL),
(1979, 2, 'admin.projects-category.update', NULL, NULL),
(1980, 2, 'admin.role_routes.create', NULL, NULL),
(1981, 2, 'admin.role_routes.destroy', NULL, NULL),
(1982, 2, 'admin.role_routes.edit', NULL, NULL),
(1983, 2, 'admin.role_routes.index', NULL, NULL),
(1984, 2, 'admin.role_routes.show', NULL, NULL),
(1985, 2, 'admin.role_routes.store', NULL, NULL),
(1986, 2, 'admin.role_routes.update', NULL, NULL),
(1987, 2, 'admin.roles.create', NULL, NULL),
(1988, 2, 'admin.roles.destroy', NULL, NULL),
(1989, 2, 'admin.roles.edit', NULL, NULL),
(1990, 2, 'admin.roles.index', NULL, NULL),
(1991, 2, 'admin.roles.show', NULL, NULL),
(1992, 2, 'admin.roles.store', NULL, NULL),
(1993, 2, 'admin.roles.update', NULL, NULL),
(1994, 2, 'admin.safeguard-compliances.create', NULL, NULL),
(1995, 2, 'admin.safeguard-compliances.destroy', NULL, NULL),
(1996, 2, 'admin.safeguard-compliances.edit', NULL, NULL),
(1997, 2, 'admin.safeguard-compliances.index', NULL, NULL),
(1998, 2, 'admin.safeguard-compliances.show', NULL, NULL),
(1999, 2, 'admin.safeguard-compliances.store', NULL, NULL),
(2000, 2, 'admin.safeguard-compliances.update', NULL, NULL),
(2001, 2, 'admin.safeguard_entries.bulk-delete', NULL, NULL),
(2002, 2, 'admin.safeguard_entries.create', NULL, NULL),
(2003, 2, 'admin.safeguard_entries.destroy', NULL, NULL),
(2004, 2, 'admin.safeguard_entries.edit', NULL, NULL),
(2005, 2, 'admin.safeguard_entries.import', NULL, NULL),
(2006, 2, 'admin.safeguard_entries.index', NULL, NULL),
(2007, 2, 'admin.safeguard_entries.show', NULL, NULL),
(2008, 2, 'admin.safeguard_entries.store', NULL, NULL),
(2009, 2, 'admin.safeguard_entries.update', NULL, NULL),
(2010, 2, 'admin.social_safeguard_entries.index', NULL, NULL),
(2011, 2, 'admin.social_safeguard_entries.storeOrUpdateFromIndex', NULL, NULL),
(2012, 2, 'admin.type-of-procurements.create', NULL, NULL),
(2013, 2, 'admin.type-of-procurements.destroy', NULL, NULL),
(2014, 2, 'admin.type-of-procurements.edit', NULL, NULL),
(2015, 2, 'admin.type-of-procurements.index', NULL, NULL),
(2016, 2, 'admin.type-of-procurements.restore', NULL, NULL),
(2017, 2, 'admin.type-of-procurements.show', NULL, NULL),
(2018, 2, 'admin.type-of-procurements.store', NULL, NULL),
(2019, 2, 'admin.type-of-procurements.update', NULL, NULL),
(2020, 2, 'admin.users.create', NULL, NULL),
(2021, 2, 'admin.users.destroy', NULL, NULL),
(2022, 2, 'admin.users.edit', NULL, NULL),
(2023, 2, 'admin.users.index', NULL, NULL),
(2024, 2, 'admin.users.show', NULL, NULL),
(2025, 2, 'admin.users.store', NULL, NULL),
(2026, 2, 'admin.users.update', NULL, NULL),
(2027, 2, 'admin.work_services.create', NULL, NULL),
(2028, 2, 'admin.work_services.destroy', NULL, NULL),
(2029, 2, 'admin.work_services.edit', NULL, NULL),
(2030, 2, 'admin.work_services.index', NULL, NULL),
(2031, 2, 'admin.work_services.show', NULL, NULL),
(2032, 2, 'admin.work_services.store', NULL, NULL),
(2033, 2, 'admin.work_services.update', NULL, NULL),
(2034, 2, 'dashboard', NULL, NULL),
(2035, 1, 'admin.already_define_epc.create', NULL, NULL),
(2036, 1, 'admin.already_define_epc.destroy', NULL, NULL),
(2037, 1, 'admin.already_define_epc.edit', NULL, NULL),
(2038, 1, 'admin.already_define_epc.index', NULL, NULL),
(2039, 1, 'admin.already_define_epc.show', NULL, NULL),
(2040, 1, 'admin.already_define_epc.store', NULL, NULL),
(2041, 1, 'admin.already_define_epc.update', NULL, NULL),
(2042, 1, 'admin.boqentry.bulk-delete', NULL, NULL),
(2043, 1, 'admin.boqentry.create', NULL, NULL),
(2044, 1, 'admin.boqentry.destroy', NULL, NULL),
(2045, 1, 'admin.boqentry.edit', NULL, NULL),
(2046, 1, 'admin.boqentry.index', NULL, NULL),
(2047, 1, 'admin.boqentry.physical-progress', NULL, NULL),
(2048, 1, 'admin.boqentry.save-physical-progress', NULL, NULL),
(2049, 1, 'admin.boqentry.store', NULL, NULL),
(2050, 1, 'admin.boqentry.update', NULL, NULL),
(2051, 1, 'admin.boqentry.upload', NULL, NULL),
(2052, 1, 'admin.contraction-phases.create', NULL, NULL),
(2053, 1, 'admin.contraction-phases.destroy', NULL, NULL),
(2054, 1, 'admin.contraction-phases.edit', NULL, NULL),
(2055, 1, 'admin.contraction-phases.index', NULL, NULL),
(2056, 1, 'admin.contraction-phases.show', NULL, NULL),
(2057, 1, 'admin.contraction-phases.store', NULL, NULL),
(2058, 1, 'admin.contraction-phases.update', NULL, NULL),
(2059, 1, 'admin.contractors.create', NULL, NULL),
(2060, 1, 'admin.contractors.destroy', NULL, NULL),
(2061, 1, 'admin.contractors.edit', NULL, NULL),
(2062, 1, 'admin.contractors.index', NULL, NULL),
(2063, 1, 'admin.contractors.show', NULL, NULL),
(2064, 1, 'admin.contractors.store', NULL, NULL),
(2065, 1, 'admin.contractors.update', NULL, NULL),
(2066, 1, 'admin.contracts.create', NULL, NULL),
(2067, 1, 'admin.contracts.destroy', NULL, NULL),
(2068, 1, 'admin.contracts.edit', NULL, NULL),
(2069, 1, 'admin.contracts.index', NULL, NULL),
(2070, 1, 'admin.contracts.show', NULL, NULL),
(2071, 1, 'admin.contracts.store', NULL, NULL),
(2072, 1, 'admin.contracts.update', NULL, NULL),
(2073, 1, 'admin.dashboard', NULL, NULL),
(2074, 1, 'admin.departments.create', NULL, NULL),
(2075, 1, 'admin.departments.destroy', NULL, NULL),
(2076, 1, 'admin.departments.edit', NULL, NULL),
(2077, 1, 'admin.departments.index', NULL, NULL),
(2078, 1, 'admin.departments.show', NULL, NULL),
(2079, 1, 'admin.departments.store', NULL, NULL),
(2080, 1, 'admin.departments.update', NULL, NULL),
(2081, 1, 'admin.designations.create', NULL, NULL),
(2082, 1, 'admin.designations.destroy', NULL, NULL),
(2083, 1, 'admin.designations.edit', NULL, NULL),
(2084, 1, 'admin.designations.index', NULL, NULL),
(2085, 1, 'admin.designations.show', NULL, NULL),
(2086, 1, 'admin.designations.store', NULL, NULL),
(2087, 1, 'admin.designations.update', NULL, NULL),
(2088, 1, 'admin.epcentry_data.bulkDestroy', NULL, NULL),
(2089, 1, 'admin.epcentry_data.create', NULL, NULL),
(2090, 1, 'admin.epcentry_data.destroy', NULL, NULL),
(2091, 1, 'admin.epcentry_data.edit', NULL, NULL),
(2092, 1, 'admin.epcentry_data.index', NULL, NULL),
(2093, 1, 'admin.epcentry_data.store', NULL, NULL),
(2094, 1, 'admin.epcentry_data.storeFromDefined', NULL, NULL),
(2095, 1, 'admin.epcentry_data.update', NULL, NULL),
(2096, 1, 'admin.financial-progress-updates.create', NULL, NULL),
(2097, 1, 'admin.financial-progress-updates.destroy', NULL, NULL),
(2098, 1, 'admin.financial-progress-updates.edit', NULL, NULL),
(2099, 1, 'admin.financial-progress-updates.index', NULL, NULL),
(2100, 1, 'admin.financial-progress-updates.show', NULL, NULL),
(2101, 1, 'admin.financial-progress-updates.store', NULL, NULL),
(2102, 1, 'admin.financial-progress-updates.update', NULL, NULL),
(2103, 1, 'admin.financial-progress.upload', NULL, NULL),
(2104, 1, 'admin.media.gallery', NULL, NULL),
(2105, 1, 'admin.media.index', NULL, NULL),
(2106, 1, 'admin.media_files.upload', NULL, NULL),
(2107, 1, 'admin.navbar-items.create', NULL, NULL),
(2108, 1, 'admin.navbar-items.destroy', NULL, NULL),
(2109, 1, 'admin.navbar-items.edit', NULL, NULL),
(2110, 1, 'admin.navbar-items.index', NULL, NULL),
(2111, 1, 'admin.navbar-items.show', NULL, NULL),
(2112, 1, 'admin.navbar-items.store', NULL, NULL),
(2113, 1, 'admin.navbar-items.update', NULL, NULL),
(2114, 1, 'admin.navbar-items.update-order', NULL, NULL),
(2115, 1, 'admin.package-components.create', NULL, NULL),
(2116, 1, 'admin.package-components.destroy', NULL, NULL),
(2117, 1, 'admin.package-components.edit', NULL, NULL),
(2118, 1, 'admin.package-components.index', NULL, NULL),
(2119, 1, 'admin.package-components.show', NULL, NULL),
(2120, 1, 'admin.package-components.store', NULL, NULL),
(2121, 1, 'admin.package-components.update', NULL, NULL),
(2122, 1, 'admin.package-project-assignments.create', NULL, NULL),
(2123, 1, 'admin.package-project-assignments.destroy', NULL, NULL),
(2124, 1, 'admin.package-project-assignments.edit', NULL, NULL),
(2125, 1, 'admin.package-project-assignments.index', NULL, NULL),
(2126, 1, 'admin.package-project-assignments.show', NULL, NULL),
(2127, 1, 'admin.package-project-assignments.store', NULL, NULL),
(2128, 1, 'admin.package-project-assignments.update', NULL, NULL),
(2129, 1, 'admin.package-projects.create', NULL, NULL),
(2130, 1, 'admin.package-projects.destroy', NULL, NULL),
(2131, 1, 'admin.package-projects.edit', NULL, NULL),
(2132, 1, 'admin.package-projects.index', NULL, NULL),
(2133, 1, 'admin.package-projects.show', NULL, NULL),
(2134, 1, 'admin.package-projects.store', NULL, NULL),
(2135, 1, 'admin.package-projects.update', NULL, NULL),
(2136, 1, 'admin.pages.create', NULL, NULL),
(2137, 1, 'admin.pages.create.form', NULL, NULL),
(2138, 1, 'admin.pages.delete', NULL, NULL),
(2139, 1, 'admin.pages.edit.form', NULL, NULL),
(2140, 1, 'admin.pages.list', NULL, NULL),
(2141, 1, 'admin.pages.update', NULL, NULL),
(2142, 1, 'admin.physical_boq_progress.bulk-delete', NULL, NULL),
(2143, 1, 'admin.physical_boq_progress.create', NULL, NULL),
(2144, 1, 'admin.physical_boq_progress.destroy', NULL, NULL),
(2145, 1, 'admin.physical_boq_progress.edit', NULL, NULL),
(2146, 1, 'admin.physical_boq_progress.index', NULL, NULL),
(2147, 1, 'admin.physical_boq_progress.store', NULL, NULL),
(2148, 1, 'admin.physical_boq_progress.update', NULL, NULL),
(2149, 1, 'admin.physical_epc_progress.bulkDestroy', NULL, NULL),
(2150, 1, 'admin.physical_epc_progress.create', NULL, NULL),
(2151, 1, 'admin.physical_epc_progress.destroy', NULL, NULL),
(2152, 1, 'admin.physical_epc_progress.edit', NULL, NULL),
(2153, 1, 'admin.physical_epc_progress.index', NULL, NULL),
(2154, 1, 'admin.physical_epc_progress.show', NULL, NULL),
(2155, 1, 'admin.physical_epc_progress.store', NULL, NULL),
(2156, 1, 'admin.physical_epc_progress.update', NULL, NULL),
(2157, 1, 'admin.procurement-details.create', NULL, NULL),
(2158, 1, 'admin.procurement-details.destroy', NULL, NULL),
(2159, 1, 'admin.procurement-details.edit', NULL, NULL),
(2160, 1, 'admin.procurement-details.index', NULL, NULL),
(2161, 1, 'admin.procurement-details.show', NULL, NULL),
(2162, 1, 'admin.procurement-details.store', NULL, NULL),
(2163, 1, 'admin.procurement-details.update', NULL, NULL),
(2164, 1, 'admin.procurement-work-programs.create', NULL, NULL),
(2165, 1, 'admin.procurement-work-programs.destroy', NULL, NULL),
(2166, 1, 'admin.procurement-work-programs.edit', NULL, NULL),
(2167, 1, 'admin.procurement-work-programs.edit-by-package', NULL, NULL),
(2168, 1, 'admin.procurement-work-programs.index', NULL, NULL),
(2169, 1, 'admin.procurement-work-programs.show', NULL, NULL),
(2170, 1, 'admin.procurement-work-programs.show.pack', NULL, NULL),
(2171, 1, 'admin.procurement-work-programs.store', NULL, NULL),
(2172, 1, 'admin.procurement-work-programs.store-single', NULL, NULL),
(2173, 1, 'admin.procurement-work-programs.update', NULL, NULL),
(2174, 1, 'admin.procurement-work-programs.update-single', NULL, NULL),
(2175, 1, 'admin.procurement-work-programs.upload-documents', NULL, NULL),
(2176, 1, 'admin.project.create', NULL, NULL),
(2177, 1, 'admin.project.destroy', NULL, NULL),
(2178, 1, 'admin.project.edit', NULL, NULL),
(2179, 1, 'admin.project.index', NULL, NULL),
(2180, 1, 'admin.project.show', NULL, NULL),
(2181, 1, 'admin.project.store', NULL, NULL),
(2182, 1, 'admin.project.update', NULL, NULL),
(2183, 1, 'admin.projects-category.create', NULL, NULL),
(2184, 1, 'admin.projects-category.destroy', NULL, NULL),
(2185, 1, 'admin.projects-category.edit', NULL, NULL),
(2186, 1, 'admin.projects-category.index', NULL, NULL),
(2187, 1, 'admin.projects-category.show', NULL, NULL),
(2188, 1, 'admin.projects-category.store', NULL, NULL),
(2189, 1, 'admin.projects-category.update', NULL, NULL),
(2190, 1, 'admin.role_routes.create', NULL, NULL),
(2191, 1, 'admin.role_routes.destroy', NULL, NULL),
(2192, 1, 'admin.role_routes.edit', NULL, NULL),
(2193, 1, 'admin.role_routes.index', NULL, NULL),
(2194, 1, 'admin.role_routes.show', NULL, NULL),
(2195, 1, 'admin.role_routes.store', NULL, NULL),
(2196, 1, 'admin.role_routes.update', NULL, NULL),
(2197, 1, 'admin.roles.create', NULL, NULL),
(2198, 1, 'admin.roles.destroy', NULL, NULL),
(2199, 1, 'admin.roles.edit', NULL, NULL),
(2200, 1, 'admin.roles.index', NULL, NULL),
(2201, 1, 'admin.roles.show', NULL, NULL),
(2202, 1, 'admin.roles.store', NULL, NULL),
(2203, 1, 'admin.roles.update', NULL, NULL),
(2204, 1, 'admin.safeguard-compliances.create', NULL, NULL),
(2205, 1, 'admin.safeguard-compliances.destroy', NULL, NULL),
(2206, 1, 'admin.safeguard-compliances.edit', NULL, NULL),
(2207, 1, 'admin.safeguard-compliances.index', NULL, NULL),
(2208, 1, 'admin.safeguard-compliances.show', NULL, NULL),
(2209, 1, 'admin.safeguard-compliances.store', NULL, NULL),
(2210, 1, 'admin.safeguard-compliances.update', NULL, NULL),
(2211, 1, 'admin.safeguard_entries.bulk-delete', NULL, NULL),
(2212, 1, 'admin.safeguard_entries.create', NULL, NULL),
(2213, 1, 'admin.safeguard_entries.destroy', NULL, NULL),
(2214, 1, 'admin.safeguard_entries.edit', NULL, NULL),
(2215, 1, 'admin.safeguard_entries.import', NULL, NULL),
(2216, 1, 'admin.safeguard_entries.index', NULL, NULL),
(2217, 1, 'admin.safeguard_entries.show', NULL, NULL),
(2218, 1, 'admin.safeguard_entries.store', NULL, NULL),
(2219, 1, 'admin.safeguard_entries.update', NULL, NULL),
(2220, 1, 'admin.social_safeguard_entries.index', NULL, NULL),
(2221, 1, 'admin.social_safeguard_entries.storeOrUpdateFromIndex', NULL, NULL),
(2222, 1, 'admin.sub-departments.create', NULL, NULL),
(2223, 1, 'admin.sub-departments.destroy', NULL, NULL),
(2224, 1, 'admin.sub-departments.edit', NULL, NULL),
(2225, 1, 'admin.sub-departments.index', NULL, NULL),
(2226, 1, 'admin.sub-departments.show', NULL, NULL),
(2227, 1, 'admin.sub-departments.store', NULL, NULL),
(2228, 1, 'admin.sub-departments.update', NULL, NULL),
(2229, 1, 'admin.type-of-procurements.create', NULL, NULL),
(2230, 1, 'admin.type-of-procurements.destroy', NULL, NULL),
(2231, 1, 'admin.type-of-procurements.edit', NULL, NULL),
(2232, 1, 'admin.type-of-procurements.index', NULL, NULL),
(2233, 1, 'admin.type-of-procurements.restore', NULL, NULL),
(2234, 1, 'admin.type-of-procurements.show', NULL, NULL),
(2235, 1, 'admin.type-of-procurements.store', NULL, NULL),
(2236, 1, 'admin.type-of-procurements.update', NULL, NULL),
(2237, 1, 'admin.users.create', NULL, NULL),
(2238, 1, 'admin.users.destroy', NULL, NULL),
(2239, 1, 'admin.users.edit', NULL, NULL),
(2240, 1, 'admin.users.index', NULL, NULL),
(2241, 1, 'admin.users.show', NULL, NULL),
(2242, 1, 'admin.users.store', NULL, NULL),
(2243, 1, 'admin.users.update', NULL, NULL),
(2244, 1, 'admin.work_services.create', NULL, NULL),
(2245, 1, 'admin.work_services.destroy', NULL, NULL),
(2246, 1, 'admin.work_services.edit', NULL, NULL),
(2247, 1, 'admin.work_services.index', NULL, NULL),
(2248, 1, 'admin.work_services.show', NULL, NULL),
(2249, 1, 'admin.work_services.store', NULL, NULL),
(2250, 1, 'admin.work_services.update', NULL, NULL),
(2251, 1, 'dashboard', NULL, NULL);

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
('piDjmSEk35BzQZTtZBZFu8K7NtjaHHCRPnENgTvM', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMnRNVDhaNGR2WHhqZW5hREoyQXdST1NXQjFhaDdGQjNFU014MXBBVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zYWZlZ3VhcmQtY29tcGxpYW5jZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJEhhZzlvUzBiMjI2aXc5TGJvMkh2QWVlcFU5QU5NeE5McFIyanJjWG1uNXRxSEcvaDhuRnRpIjt9', 1755755568);

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
-- Table structure for table `sub_departments`
--

CREATE TABLE `sub_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_departments`
--

INSERT INTO `sub_departments` (`id`, `department_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'FPIU-Purola', 1, '2025-08-20 23:05:00', '2025-08-20 23:05:00');

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
  `sub_department_id` bigint(20) UNSIGNED DEFAULT NULL,
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

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `department_id`, `sub_department_id`, `designation_id`, `gender`, `phone_no`, `status`, `district`, `deleted_at`) VALUES
(1, 1, 'admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$VzxX3jmvEG/0dKL4w5jbWe3PLWtM8cIz7eU3YUh0MV4k1uTP8uAlu', NULL, NULL, NULL, NULL, NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 06:58:54', '2025-08-20 23:15:41', 1, 1, NULL, NULL, NULL, 'active', NULL, NULL),
(2, 1, 'Test User 1', 'testuser1@example.com', 'test_user_1', '2025-08-04 11:12:57', '$2y$12$VzxX3jmvEG/0dKL4w5jbWe3PLWtM8cIz7eU3YUh0MV4k1uTP8uAlu', NULL, NULL, NULL, 'OjPV8Rf3S1', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-04 12:31:58', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2025-08-04 12:31:58'),
(3, 1, 'Test User', 'testuser2@example.com', 'test_user_', '2025-08-04 11:12:58', '$2y$12$Hag9oS0b226iw9Lbo2HvAeepU9ANMxNLpR2jrcXmn5tqHG/h8nFti', NULL, NULL, NULL, 'SCTDuAjAPehsyxz5wuQRHaZ3aINJQAR94f1Acz6shWGu63vcSYzazHMlqhro', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-20 23:27:00', 1, 1, 10, 'male', '9090909090', 'active', 'Dehradun', NULL),
(4, 1, 'Test User 3', 'testuser3@example.com', 'test_user_3', '2025-08-04 11:12:58', '$2y$12$.WEudQx6rlE8IvXmtz3she.zKNd2NOA3FpF6.WGHv8QoqKV2yajUq', NULL, NULL, NULL, 'P7Kjy9dmBp', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-04 11:12:58', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(5, 1, 'Test User 4', 'testuser4@example.com', 'test_user_4', '2025-08-04 11:12:58', '$2y$12$OiQc5Mamqa0WO4SsmHzovOm520kqdi6hszqA6gXQYdycPHwsRJqYS', NULL, NULL, NULL, 'aI1TSgyKKG', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(6, 1, 'Test User 5', 'testuser5@example.com', 'test_user_5', '2025-08-04 11:12:59', '$2y$12$ArGPNhRO/EFR48OFxTVLPOpJgMl226X.RWfsAp.G6id8.JpKk8ege', NULL, NULL, NULL, 'XuV6KCkwjv', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(7, 1, 'Test User 6', 'testuser6@example.com', 'test_user_6', '2025-08-04 11:12:59', '$2y$12$YZ45SKbyL10z5A5XyZFTPe60mmOTibR4HId3pymwaVMClWYg88A5G', NULL, NULL, NULL, '8ngp7rVu02', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:59', '2025-08-04 11:12:59', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(8, 1, 'Test User 7', 'testuser7@example.com', 'test_user_7', '2025-08-04 11:12:59', '$2y$12$i6bgzn2YqV.7OS2t8BRXjOOPnOFpHLYDsvEFMriFw1zX.leIEX6MO', NULL, NULL, NULL, 'xWiPiMStdJ', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(9, 1, 'Test User 8', 'testuser8@example.com', 'test_user_8', '2025-08-04 11:13:00', '$2y$12$c/1QCkJxDRlvVUooKOxyweHPkqUKEfiakuD0IWppXOB6n6JImSFw2', NULL, NULL, NULL, 'otK0zoH0Vu', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(10, 1, 'Test User 9', 'testuser9@example.com', 'test_user_9', '2025-08-04 11:13:00', '$2y$12$xdV4G9bXXF6mMTEtMverAOCQ9s4Al9Ea9/6i8xXG8aB9yJaNimexy', NULL, NULL, NULL, 'x7TGbcrScH', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:00', '2025-08-04 11:13:00', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(11, 1, 'Test User 10', 'testuser10@example.com', 'test_user_10', '2025-08-04 11:13:00', '$2y$12$qeK4sCfVXGn5coHg89ugC.3ce6bJ1LtUamJCh6xpYW0flixugOnXK', NULL, NULL, NULL, 'w9pJVhbFHm', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(12, 1, 'Test User 11', 'testuser11@example.com', 'test_user_11', '2025-08-04 11:13:01', '$2y$12$/NK1WIc.AKqvBR9vo3.vSOa5apAKGLNNuwtnocj8btk59/xWQrF5C', NULL, NULL, NULL, 'RLsh78jbMz', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(13, 1, 'Test User 12', 'testuser12@example.com', 'test_user_12', '2025-08-04 11:13:01', '$2y$12$73TgswNaGJ9tBu/e8bwUN.rFHYExRL8pDZ0BpWYOA3dv0KzEZ8Zla', NULL, NULL, NULL, 'Tr9kUsqTzH', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:01', '2025-08-04 11:13:01', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(14, 1, 'Test User 13', 'testuser13@example.com', 'test_user_13', '2025-08-04 11:13:01', '$2y$12$hu6KuOHt.c6L/CDBc.1IN.YfwkXrn11AAocWIrRVvivtgNsXWwJwq', NULL, NULL, NULL, 'yzjgtmKSRD', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:02', '2025-08-04 11:13:02', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(15, 1, 'Test User 14', 'testuser14@example.com', 'test_user_14', '2025-08-04 11:13:02', '$2y$12$kih.JQHDJReUYfnjeyK1BuVeo7Y22QSigKgn/VVQMek/9W46j/mya', NULL, NULL, NULL, 'nfHFORKiB5', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:02', '2025-08-04 11:13:02', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(16, 1, 'Test User 15', 'testuser15@example.com', 'test_user_15', '2025-08-04 11:13:02', '$2y$12$6rPybpQhqCdYK5llA3OwFeAtd97zVnD7.WiOYfTsBht4.LgllsZFy', NULL, NULL, NULL, 'vFs9N8Yyy2', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(17, 1, 'Test User 16', 'testuser16@example.com', 'test_user_16', '2025-08-04 11:13:03', '$2y$12$XAEOAgA0cxFe/NHKPCQqOOvyPQRJBrfeMSEaXerjuYXAs3.zzwd/6', NULL, NULL, NULL, 'eolVR6m8WL', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(18, 1, 'Test User 17', 'testuser17@example.com', 'test_user_17', '2025-08-04 11:13:03', '$2y$12$8Q13ltV3i2bnzMFcDscO6e/NePTdNoB9iG3nZoQTfTWoMxoeibm7e', NULL, NULL, NULL, 'UdoGQTBXOX', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:03', '2025-08-04 11:13:03', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(19, 1, 'Test User 18', 'testuser18@example.com', 'test_user_18', '2025-08-04 11:13:03', '$2y$12$.eKZ5nXZa0AgKFoZUQcGz.1ty0UdtFMzIpagEHqktb97wzH4T1GXa', NULL, NULL, NULL, 'Y6UJup7WCQ', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:04', '2025-08-04 11:13:04', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(20, 1, 'Test User 19', 'testuser19@example.com', 'test_user_19', '2025-08-04 11:13:04', '$2y$12$h6SIIBevrKXQJYNhfY66kOfjTdSeMJsoAPcuKcQXHj3XdlCxJQZ6m', NULL, NULL, NULL, '5IpsstbcUO', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:04', '2025-08-04 11:13:04', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(21, 1, 'Test User 20', 'testuser20@example.com', 'test_user_20', '2025-08-04 11:13:04', '$2y$12$HWRaIBLDiIIpfh9QvRJkSOeRTXM0QwxZnPHO6dplb5IpbQKAybJyS', NULL, NULL, NULL, 'VJ7rV7iPwc', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(22, 1, 'Test User 21', 'testuser21@example.com', 'test_user_21', '2025-08-04 11:13:05', '$2y$12$VRbEn7gESRE4kd8YFT8wxO.UlRiuY/waljAQx7cXxssYeWnB2Uleq', NULL, NULL, NULL, 'wIIK1l5H5Z', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(23, 1, 'Test User 22', 'testuser22@example.com', 'test_user_22', '2025-08-04 11:13:05', '$2y$12$pucmDxQM2N1ci.w.tI86OOip9.F0D8PlIIiqIqlSEQtFfCxQzmOAS', NULL, NULL, NULL, 'YnKYhATwwO', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:05', '2025-08-04 11:13:05', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(24, 1, 'Test User 23', 'testuser23@example.com', 'test_user_23', '2025-08-04 11:13:05', '$2y$12$Orck/Rn2FWrpJyD/tfQgeuuxtj11R3jRwXjXi4PZqVpWeSXNhjiq.', NULL, NULL, NULL, 'KTYF2ZOoY1', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:06', '2025-08-04 11:13:06', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(25, 1, 'Test User 24', 'testuser24@example.com', 'test_user_24', '2025-08-04 11:13:06', '$2y$12$8UoekrmxzpROdM659cwU4eIORANM.h6YPuETOrIVM3ABUSILqVg2O', NULL, NULL, NULL, 'JDOhsK1q7f', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:06', '2025-08-04 11:13:06', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(26, 1, 'Test User 25', 'testuser25@example.com', 'test_user_25', '2025-08-04 11:13:06', '$2y$12$QunanTnLEZFSD9Xis/NYyeZP.U63nC0PjUlwQOehvqpRv584kOBMm', NULL, NULL, NULL, '7jt9nC3vIh', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(27, 1, 'Test User 26', 'testuser26@example.com', 'test_user_26', '2025-08-04 11:13:07', '$2y$12$fevbBEtcyc31fGOVeimHsupFxEx/zzUPJl/twenuuzfczOFTBi3qS', NULL, NULL, NULL, 'YKQczUSKYT', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(28, 1, 'Test User 27', 'testuser27@example.com', 'test_user_27', '2025-08-04 11:13:07', '$2y$12$.fDluNd8s2tA8pfdozh6vupvj18zyUlJuZTDJrVF98KJZpuNGOBpu', NULL, NULL, NULL, 'aKfaIR2b9Z', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:07', '2025-08-04 11:13:07', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(29, 1, 'Test User 28', 'testuser28@example.com', 'test_user_28', '2025-08-04 11:13:07', '$2y$12$fGkVjaT62x77WKFRB/9.HelSkLA08yX8OHtJ7QVO0Mh/V9iBTB.dK', NULL, NULL, NULL, 'xPilcRiC1D', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(30, 1, 'Test User 29', 'testuser29@example.com', 'test_user_29', '2025-08-04 11:13:08', '$2y$12$xFZCbuYY4AcayMYYIyutqew6MGDr1hZvcJ7gsX8Fe7bfpnHy3ER9K', NULL, NULL, NULL, 'oXRMO2xbZy', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(31, 1, 'Test User 30', 'testuser30@example.com', 'test_user_30', '2025-08-04 11:13:08', '$2y$12$Y37eb8s.TfJ77jRRAOeaROBNLI6wX9jDDFzdY5hUe6yy4ES1KS6ry', NULL, NULL, NULL, '4kU4YQZwfR', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:13:08', '2025-08-04 11:13:08', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(32, 2, 'Yuvraj Kohli', 'Yuvrajkohli8090ylt@gmail.com', 'yuvraj_kohli', NULL, '$2y$12$Cw97ve07IYTo3nIjcmR8TeeQNN85kAOFb8.qYZRhDlGT9F1eBoOGy', NULL, NULL, NULL, NULL, NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:55:58', '2025-08-04 11:55:58', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL),
(33, 2, 'Dr Anju Panwar', 'anju.panwar@gmail.com', 'env-pmu', NULL, '$2y$12$N6ItL5DqK9Zb85YnIEVyHetXPMwwkzUGc2EgXb83ehWVmyi13f6VK', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-20 02:46:07', '2025-08-20 02:46:07', 1, NULL, 1, 'female', '6397157703', 'active', 'test_user_', NULL);

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
  ADD KEY `package_projects_district_id_foreign` (`district_id`),
  ADD KEY `package_projects_block_id_foreign` (`block_id`),
  ADD KEY `package_projects_package_component_id_foreign` (`package_component_id`),
  ADD KEY `package_projects_lok_sabha_id_foreign` (`lok_sabha_id`);

--
-- Indexes for table `package_project_assignments`
--
ALTER TABLE `package_project_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_project_assignments_package_project_id_foreign` (`package_project_id`),
  ADD KEY `package_project_assignments_assigned_to_foreign` (`assigned_to`),
  ADD KEY `package_project_assignments_assigned_by_foreign` (`assigned_by`);

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
-- Indexes for table `role_routes`
--
ALTER TABLE `role_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_routes_role_id_foreign` (`role_id`);

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
-- Indexes for table `sub_departments`
--
ALTER TABLE `sub_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_departments_department_id_foreign` (`department_id`);

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
  ADD KEY `users_district_index` (`district`),
  ADD KEY `users_sub_department_id_foreign` (`sub_department_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
-- AUTO_INCREMENT for table `package_project_assignments`
--
ALTER TABLE `package_project_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role_routes`
--
ALTER TABLE `role_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2252;

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
-- AUTO_INCREMENT for table `sub_departments`
--
ALTER TABLE `sub_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  ADD CONSTRAINT `package_projects_lok_sabha_id_foreign` FOREIGN KEY (`lok_sabha_id`) REFERENCES `assembly` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_category_id_foreign` FOREIGN KEY (`package_category_id`) REFERENCES `projects_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_component_id_foreign` FOREIGN KEY (`package_component_id`) REFERENCES `package_components` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_package_sub_category_id_foreign` FOREIGN KEY (`package_sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_projects_vidhan_sabha_id_foreign` FOREIGN KEY (`vidhan_sabha_id`) REFERENCES `constituencies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `package_project_assignments`
--
ALTER TABLE `package_project_assignments`
  ADD CONSTRAINT `package_project_assignments_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_project_assignments_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_project_assignments_package_project_id_foreign` FOREIGN KEY (`package_project_id`) REFERENCES `package_projects` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `role_routes`
--
ALTER TABLE `role_routes`
  ADD CONSTRAINT `role_routes_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `sub_departments`
--
ALTER TABLE `sub_departments`
  ADD CONSTRAINT `sub_departments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_sub_department_id_foreign` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `work_service`
--
ALTER TABLE `work_service`
  ADD CONSTRAINT `work_service_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
