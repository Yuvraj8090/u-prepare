-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 08:49 AM
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

--
-- Dumping data for table `boqentry_data`
--

INSERT INTO `boqentry_data` (`id`, `sub_package_project_id`, `sl_no`, `item_description`, `unit`, `qty`, `rate`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(344, 1, '1', '1- 18.00 M. Span R.C.C. Bridge  in KM 4 ', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(345, 1, '1.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and back filling with approved material as directed by engineer in-charge by  Manual Means.', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(346, 1, '1.02', 'Up to 3.0 M.                                                                     ', 'Cum', 405.000, 90.00, 36450.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(347, 1, '1.03', '3.0 to 6.0 M.                                                                     ', 'Cum', 343.350, 95.00, 32618.25, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(348, 1, '1.04', 'Above 6.0 M.                                                                     ', 'Cum', 196.200, 110.00, 21582.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(349, 1, '1.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'Cum', 21.020, 6000.00, 126120.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(350, 1, '1.06', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'Cum', 139.480, 8500.00, 1185580.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(351, 1, '1.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 13.020, 84000.00, 1093680.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(352, 1, '1.08', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(353, 1, '1.09', 'Up to 5.0 M.', 'Cum', 92.980, 8600.00, 799628.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(354, 1, '1.10', '5.0 to 10.0 M.', 'Cum', 58.800, 8800.00, 517440.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(355, 1, '1.11', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 24.080, 83000.00, 1998640.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(356, 1, '1.12', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'Cum', 61.060, 10000.00, 610600.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(357, 1, '1.13', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 12.450, 83000.00, 1033350.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(358, 1, '1.14', 'Reinforced Cement Concrete Crash Barrier\n(Provision of an Reinforced cement concrete crash barrier at the edges of the road, approaches to bridge structures and medians, constructed with M-40 grade concrete with HYSD reinforcement conforming to IRC:21 and dowel bars 25 mm dia, 450 mm long at expansion joints filled with pre-moulded asphalt filler board, keyed to the structure on which it is built and installed as per design given in the enclosure to MOST circular No. RW/NH - 33022/1/94-DO III dated 24 June 1994 as per dimensions in the approved drawing and at locations directed by the Engineer, all as specified) M 40 grade concrete and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'Rm', 51.960, 5000.00, 259800.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(359, 1, '1.15', 'Drainage Spouts complete as per drawing and Technical specification and as directed by engineer incharge.', 'No.', 8.000, 2800.00, 22400.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(360, 1, '1.16', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'Cum', 10.720, 14000.00, 150080.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(361, 1, '1.17', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'Cum', 6.830, 6000.00, 40980.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(362, 1, '1.18', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'Cum', 13.650, 8500.00, 116025.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(363, 1, '1.19', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'Rm', 13.000, 5800.00, 75400.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(364, 1, '1.20', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'Rm', 145.200, 200.00, 29040.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(365, 1, '1.21', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge.', 'Cum', 111.540, 1800.00, 200772.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(366, 1, '1.22', 'Painting Two Coats on New Concrete Surfaces\n(Painting two coats after filling the surface with synthetic enamel paint in all shades on new plastered concrete surfaces) and as per direction of engineer in charge.', 'Sqm', 51.960, 98.00, 5092.08, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(367, 1, '1.23', 'Providing and applying 2 coats of water based cement paint to unplastered concrete surface after cleaning the surface of dirt, dust, oil, grease, efflorescence and applying paint @ of 1 litre for 2 Sq.m and as per direction of engineer in charge.', 'Sqm', 501.860, 85.00, 42658.10, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(368, 1, '1.24', 'Supplying,Fitting and fixing in position true to line and level elastomeric bearing conforming to IRC: 83 (Part-II) section IX and clause 2005 of MoRTH specifications (Excluding Cost of Bearing) complete including all accessories as per drawing and Technical Specifications and as per direction of engineer in charge.  (Including the Cost of Bearing Assembly)', 'Cu. Cm', 32760.000, 0.76, 24897.60, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(369, 1, '1.25', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect and as per direction of engineer in charge.. ', 'Span', 1.000, 70000.00, 70000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(370, 1, '1.26', 'Protection Work', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(371, 1, '1.27', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material Mechanical Means as direction of engineer in-charge Depth upto 3 m.', 'CUM', 450.000, 380.00, 171000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(372, 1, '1.28', 'Providing and Laying of Mechanically Woven Double Twisted Hexagonal shaped Gabions (Zinc plus PVC coated), of size 3mX1mX1m with two diaphragms at 1m interval, having mesh opening 100mmx120 mm, mesh wire diameter 2.7mm/3.7mm, edge/selvedge wire diameter 3.4/4.4 mm and lacing wire diameter 2.2/3.2 mm as per direction of engineer in-charge. (The work includes filling boulders in the gabions).', 'CUM', 510.000, 2400.00, 1224000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(373, 1, '1.29', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(374, 1, '1.30', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(375, 1, '1.31', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 9000.00, 18000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(376, 1, '1.32', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(377, 1, '1.33', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(378, 1, '1.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(379, 1, '1.35', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(380, 1, '1.36', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 9000.00, 54000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(381, 1, '1.37', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(382, 1, '1.38', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(383, 1, '1.39', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(384, 1, '1.40', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 61.000, 330.00, 20130.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(385, 1, '2', '2- 30.0 M. Span Steel Truss Bridge  in KM 8 HM (8-10)', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(386, 1, '2.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material as directed by engineer in-charge by Mechanical Means', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(387, 1, '2.02', 'Up to 3.0 M.                                                                     ', 'CUM', 570.000, 90.00, 51300.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(388, 1, '2.03', '3.0 to 6.0 M.                                                                     ', 'CUM', 522.500, 95.00, 49637.50, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(389, 1, '2.04', 'Above 6.0 M.                                                                     ', 'CUM', 147.250, 110.00, 16197.50, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(390, 1, '2.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 29.840, 6000.00, 179040.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(391, 1, '2.06', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 194.560, 8500.00, 1653760.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(392, 1, '2.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 19.450, 83000.00, 1614350.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(393, 1, '2.08', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump. ', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(394, 1, '2.09', 'Up to 5.0 M.', 'CUM', 133.520, 8600.00, 1148272.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(395, 1, '2.10', '5.0 to 10.0 M.', 'CUM', 134.670, 8800.00, 1185096.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(396, 1, '2.11', 'Above to 10.0 M.', 'CUM', 16.270, 9200.00, 149684.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(397, 1, '2.12', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 38.800, 83000.00, 3220400.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(398, 1, '2.13', 'Supplying, fitting and fixing in position true to line and level POT-PTFE bearing tonne consisting of a metal piston supported by a disc or unreinforced elastomer confined within a metal cylinder, sealing rings, dust seals, PTFE surface sliding against stainless steel mating surface, complete assembly to be of cast steel/fabricated structural steel, metal and elastomer elements to be as per IRC: 83 part-I & II respectively and other parts conforming to BS: 5400, section 9.1 & 9.2 and clause 2006 of MoRTH Specifications complete as per drawing and approved Technical Specifications as per direction of engineer in-charge.  (Including the Cost of Bearing Assembly)', 'MT', 600.000, 240.00, 144000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(399, 1, '2.14', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 48.700, 10500.00, 511350.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(400, 1, '2.15', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 4.350, 83000.00, 361050.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(401, 1, '2.16', 'Supply and fabrication of steel truss bridge as per detailed drawing attached including supply of all structural steel E-250 confirming IS 226 - 1969 required for proper completion of the bridge including ground errection of the bridge and one coat of approved quality anticirrosive (red oxide) paint of confirming IS 5660, all T&P, nuts and bolts, washers and also including supply and fixing of shop rivets required as per drawing, required equipment shall be arranged by the contractor at his own cost which shall be taken back by the contractor after satisfactory execution of the job, the rates shall include ground errection in the workshop and its dismentling after inspection, approval and removing defects, match marking of all parts, numbering and proper stacking in the premises of workshop before cartage to site of work. The work shall be executed in accordance to IS - 1915. The rates shall include cost of all material, its wastage, cutting, bending if required, welding, making holes, shop riveting, labour, T&P etc. required for proper completion of the work. including cost of cartage from workshop to Bridge Site including safe stacking of parts as per direction of engineer in-charge.', 'MT', 46.670, 115000.00, 5367050.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(402, 1, '2.17', 'Erection of Steel Truss (Girder) Bridge (up to 60m span) as per drawing with required camber including cartage of fabricated parts from the place of stack near site including submission of launching plan by the contractor, (duly vetted by a recognised reputable institution/ consultant if required) and approved by the engineer-in-charge. Service bolts to used shall be of approved make. The rate including of cost of all labour, T&P, equipments, civil work and consumables, cost of arranging, fabricating, errecting and dismantling of erection scheme including the cost of its designing, revising, supervision by contractor\'s designeer at site during erection, also including cost of all safety measures and necessary insurances of bridge and labours for proper completion of the work as per MORTH specification no. 1905 with due regard of mansoon and as per directions of the engineer-incharge.', 'MT', 46.670, 29000.00, 1353430.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(403, 1, '2.18', 'Drainage Spouts complete as per drawing and Technical specification as per direction of engineer in-charge.', 'NO,', 10.000, 7800.00, 78000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(404, 1, '2.19', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 12.770, 14500.00, 185165.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(405, 1, '2.20', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 8.500, 6000.00, 51000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(406, 1, '2.21', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 17.010, 8400.00, 142884.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(407, 1, '2.22', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 12.000, 5800.00, 69600.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(408, 1, '2.23', 'Providing weep holes in Brick masonry/Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications as per direction of engineer in charge.', 'RM', 379.550, 200.00, 75910.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(409, 1, '2.24', 'Painting on Steel Surfaces \nProviding and applying two coats of readymix paint of approved brand on steel suface after through cleaning of surface to give an even as per direction of engineer in charge..', 'SQM', 1155.000, 86.00, 99330.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(410, 1, '2.25', 'Supply and Fixing of  20 mm dia P.F. make 8.8 grade HSFG High Strength Friction Grip Bolt to IS 3757:1985 latest to grade 10.9S with High Strength Friction Grip nut to IS 6623:2004 latest to grade 10S and high Strength Friction 2 No. washer including cost of all material, Labour, Fixing at site, all taxes, T&P etc required foe Proper completion of the work ( 20 X 120mm) as per direction of engineer in charge. ', 'NO', 4370.000, 280.00, 1223600.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(411, 1, '2.26', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge.', 'Cum', 157.020, 2000.00, 314040.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(412, 1, '2.27', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in charge.', 'Span', 1.000, 90000.00, 90000.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(413, 1, '2.28', 'APPROCH  ROAD', NULL, NULL, NULL, NULL, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(414, 1, '2.29', 'Excavation in Hilly Areas in Soil by mechanical means\nExcavation in soil in Hilly Area by mechanical means including cutting and ntrimming of side slopes and disposing of excavated earth with a lift upto 1.5 m and a lead upto 20 m as per Technical Specification Clause 1603.1 and as per direction of engineer incharge.', 'CUM', 78.350, 110.00, 8618.50, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(415, 1, '2.30', 'Excavation for Structures\nEarthwork in excavation for structures as per drawing and technical specifications Clause 305.1 including setting out, construction of shoring and bracing, removal of stumps and other deleterious material and disposal upto a lead of 50 m, dressing of sides and bottom and backfilling in trenches with excavated suitable material nd as per direction of engineer incharge.', 'CUM', 112.300, 400.00, 44920.00, '2025-08-11 02:57:01', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(416, 1, '2.31', 'Providing concrete for plain/ reinforced concrete in open foundations complete as per drawings and technical specifications Clause 802, 803, 1202 & 1203. PCC Grade M15 Nominal mix (1:2.5:5) as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth', 'CUM', 33.700, 6000.00, 202200.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(417, 1, '2.32', 'Random Rubble Stone Masonry laid in 1:6 cement and sand mortar, in breast walls, retaining walls, parapets, scuppers, etc. including supply of all material, labour, T&P and royaltiies etc. complete as per drawing and technical specifications Clauses 702, 704, 1202 & 1203 of MORD Specifiction as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'CUM', 499.040, 4000.00, 1996160.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(418, 1, '2.33', 'Hand Packed stone filling in back of wallls including cost of all materials, royality, T&P etc. complete as per direction of Engineer-in- charge. (As per PWD Uttarakhand specifications) and as per direction of engineer in charge.', 'CUM', 225.000, 950.00, 213750.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(419, 1, '2.34', 'Providing weepholes in brick masonry/stone masonry, plain/reinforced concrete abutment, wing wall, return wall with 100 mm dia AC pipe extending through the full width of the structures with slope of 1(V):20(H) towards drawing face complete as per drawing and technical specification Clauses 614, 709, 1204.3.7 and as per direction of engineer in charge.', 'RM', 447.050, 200.00, 89410.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(420, 1, '2.35', 'Construction of embankment with approved material obtained from borrow pits (including cost of compensation for earth taken from private land) with a lift upto 1.5 m, transporting to site, spreading, grading to required slope and compacting to meet requirement of Tables 300.1 and 300.2 as per Technical Specification Clause 301.5 and as per direction of engineer in charge.', 'CUM', 1716.930, 480.00, 824126.40, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(421, 1, '2.36', 'Providing concrete for plain/ reinforced concrete in open foundations complete as per drawings and technical specifications Clause 802, 803, 1202 & 1203 PCC Grade M 20 as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'CUM', 5.850, 6800.00, 39780.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(422, 1, '2.37', 'Type - A, \"W\" : Metal Beam Crash Barrier\nProviding and erecting a \"W\" metal beam crash barrier comprising of 3 mm thick corrugated sheet metal beam rail, 70 cm above road/ground level, fixed on ISMC series channel vertical post, 150 x 75 x 5 mm spaced 2 m centre to centre, 1.8 m high, 1.1 m below ground/road level, all steel parts and fitments to be galvanised by hot dip process, all fittings to conform to IS:1367 and IS:1364, metal beam rail to be fixed on the vertical post with a spacer of channel section 150 x 75 x 5 mm, 330 mm long complete as per clause 810 ( if Concrete Required for Vertical post Fixing will be paid extra) as directed by engineer in-charge.', 'Rm', 130.000, 3600.00, 468000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(423, 1, '2.38', 'PROTECTION WORK', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(424, 1, '2.39', 'Excavation for Structures\nEarthwork in excavation for structures as per drawing and technical specifications Clause 305.1 including setting out, construction of shoring and bracing, removal of stumps and other deleterious material and disposal upto a lead of 50 m, dressing of sides and bottom and backfilling in trenches with excavated suitable material as directed by engineer in-charge..', 'CUM', 500.000, 400.00, 200000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(425, 1, '2.40', 'Providing and Laying of Mechanically Woven Double Twisted Hexagonal shaped Gabions (Zinc plus PVC coated), of size 3mX1mX1m with two diaphragms at 1m interval, having mesh opening 100mmx120 mm, mesh wire diameter 2.7mm / 3.7mm , edge/selvedge wire diameter 3.4/4.4 mm and lacing wire diameter 2.2/3.2 mm. (The work includes filling boulders in the gabions) as directed by engineer in-charge.', 'CUM', 891.000, 2450.00, 2182950.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(426, 1, '2.41', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(427, 1, '2.42', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(428, 1, '2.43', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(429, 1, '2.44', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(430, 1, '2.45', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(431, 1, '2.46', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(432, 1, '2.47', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(433, 1, '2.48', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(434, 1, '2.49', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(435, 1, '2.50', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(436, 1, '2.51', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(437, 1, '2.52', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities.', 'Hrs.', 71.000, 330.00, 23430.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(438, 1, '3', '3- 15.0 M. Span R.C.C. Bridge  in KM  8 (HM 2-4)', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(439, 1, '3.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material and as per direction of engineer in-charge by Manual Means.', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(440, 1, '3.02', 'Hard rock ( blasting prohibited )', 'CUM', 113.700, 600.00, 68220.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(441, 1, '3.03', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 6.740, 6000.00, 40440.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(442, 1, '3.04', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 41.740, 8500.00, 354790.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(443, 1, '3.05', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 2.970, 83000.00, 246510.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(444, 1, '3.06', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump.', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(445, 1, '3.07', 'Up to 5.0 M.', 'CUM', 10.880, 8600.00, 93568.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(446, 1, '3.08', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 1.180, 83000.00, 97940.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(447, 1, '3.09', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 47.960, 10500.00, 503580.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(448, 1, '3.10', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 10.510, 83000.00, 872330.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(449, 1, '3.11', 'Reinforced Cement Concrete Crash Barrier\n(Provision of an Reinforced cement concrete crash barrier at the edges of the road, approaches to bridge structures and medians, constructed with M-40 grade concrete with HYSD reinforcement conforming to IRC:21 and dowel bars 25 mm dia, 450 mm long at expansion joints filled with pre-moulded asphalt filler board, keyed to the structure on which it is built and installed as per design given in the enclosure to MOST circular No. RW/NH - 33022/1/94-DO III dated 24 June 1994 as per dimensions in the approved drawing and at locations directed by the Engineer, all as specified) M 40 grade concrete and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'RM', 45.880, 5000.00, 229400.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(450, 1, '3.12', 'Drainage Spouts complete as per drawing and Technical specification as per direction engineer in-charge.', 'NO.', 6.000, 4000.00, 24000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(451, 1, '3.13', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 9.470, 14500.00, 137315.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(452, 1, '3.14', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 6.830, 6800.00, 46444.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(453, 1, '3.15', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 13.650, 8800.00, 120120.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(454, 1, '3.16', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 13.000, 6000.00, 78000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(455, 1, '3.17', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'RM', 1.800, 200.00, 360.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(456, 1, '3.18', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge..', 'CUM', 10.620, 1800.00, 19116.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(457, 1, '3.19', 'Painting Two Coats on New Concrete Surfaces\n(Painting two coats after filling the surface with synthetic enamel paint in all shades on new plastered concrete surfaces) and as per direction of engineer in charge.', 'SQM', 45.880, 98.00, 4496.24, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(458, 1, '3.20', 'Providing and applying 2 coats of water based cement paint to unplastered concrete surface after cleaning the surface of dirt, dust, oil, grease, efflorescence and applying paint @ of 1 litre for 2 Sq.m and as per direction of engineer in charge.', 'SQM', 253.960, 85.00, 21586.60, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(459, 1, '3.21', 'Supplying,Fitting and fixing in position true to line and level elastomeric bearing conforming to IRC: 83 (Part-II) section IX and clause 2005 of MoRTH specifications (Excluding Cost of Bearing) complete including all accessories as per drawing and Technical Specifications and as directed by engineer in-charge. (Including the Cost of Bearing Assembly)', 'Cu-Cm', 32760.000, 0.76, 24897.60, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(460, 1, '3.22', 'Providing & Fixing 25 mm dia 1.8 m. long rock anchoring including supply of all materials T & P etc Complete in all respect and as per direction of engineer in charge.', 'NO.', 16.000, 14000.00, 224000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(461, 1, '3.23', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in-charge. ', 'SPAN', 1.000, 90000.00, 90000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(462, 1, '3.24', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(463, 1, '3.25', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(464, 1, '3.26', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(465, 1, '3.27', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(466, 1, '3.28', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(467, 1, '3.29', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(468, 1, '3.30', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(469, 1, '3.31', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(470, 1, '3.32', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(471, 1, '3.33', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(472, 1, '3.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(473, 1, '3.35', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 60.000, 330.00, 19800.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(474, 1, '4', '4- 24.00 M. Span Steel Truss Bridge  in KM  12', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(475, 1, '4.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material as directed by engineer in-charge by Mechanical Means', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(476, 1, '4.02', 'Up to 3.0 M.                                                                     ', 'CUM', 611.100, 90.00, 54999.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(477, 1, '4.03', '3.0 to 6.0 M.                                                                     ', 'CUM', 611.100, 95.00, 58054.50, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(478, 1, '4.04', 'Above 6.0 M.                                                                     ', 'CUM', 906.760, 110.00, 99743.60, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(479, 1, '4.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 23.040, 6000.00, 138240.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(480, 1, '4.06', 'Reinforced cement concrete (RCC) Grade M 25 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 210.620, 8500.00, 1790270.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(481, 1, '4.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 18.020, 83000.00, 1495660.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(482, 1, '4.08', 'Reinforced cement concrete (RCC) M 25 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump.', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(483, 1, '4.09', 'Up to 5.0 M.', 'CUM', 143.300, 8600.00, 1232380.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(484, 1, '4.10', '5.0 to 10.0 M.', 'CUM', 157.280, 8800.00, 1384064.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(485, 1, '4.11', 'Above to 10.0 M.', 'CUM', 39.980, 9000.00, 359820.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(486, 1, '4.12', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 82.570, 83000.00, 6853310.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(487, 1, '4.13', 'Supplying, fitting and fixing in position true to line and level POT-PTFE bearing tonne consisting of a metal piston supported by a disc or unreinforced elastomer confined within a metal cylinder, sealing rings, dust seals, PTFE surface sliding against stainless steel mating surface, complete assembly to be of cast steel/fabricated structural steel, metal and elastomer elements to be as per IRC: 83 part-I & II respectively and other parts conforming to BS: 5400, section 9.1 & 9.2 and clause 2006 of MoRTH Specifications complete as per drawing and approved Technical Specifications and as per direction of engineer in-charge.  (Including the Cost of Bearing Assembly)', 'MT', 500.000, 240.00, 120000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(488, 1, '4.14', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-25 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 36.300, 10500.00, 381150.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(489, 1, '4.15', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 4.590, 83000.00, 380970.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(490, 1, '4.16', 'Supply and fabrication of steel truss bridge as per detailed drawing attached including supply of all structural steel E-250 confirming IS 226 - 1969 required for proper completion of the bridge including ground errection of the bridge and one coat of approved quality anticirrosive (red oxide) paint of confirming IS 5660, all T&P, nuts and bolts, washers and also including supply and fixing of shop rivets required as per drawing, required equipment shall be arranged by the contractor at his own cost which shall be taken back by the contractor after satisfactory execution of the job, the rates shall include ground errection in the workshop and its dismentling after inspection, approval and removing defects, match marking of all parts, numbering and proper stacking in the premises of workshop before cartage to site of work. The work shall be executed in accordance to IS - 1915. The rates shall include cost of all material, its wastage, cutting, bending if required, welding, making holes, shop riveting, labour, T&P etc. required for proper completion of the work. including cost of cartage from workshop to Bridge Site including safe stacking of parts as per direction of engineer in-charge.', 'MT', 40.090, 115000.00, 4610350.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07');
INSERT INTO `boqentry_data` (`id`, `sub_package_project_id`, `sl_no`, `item_description`, `unit`, `qty`, `rate`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(491, 1, '4.17', 'Erection of Steel Truss (Girder) Bridge (up to 60m span) as per drawing with required camber including cartage of fabricated parts from the place of stack near site including submission of launching plan by the contractor, (duly vetted by a recognised reputable institution/ consultant if required) and approved by the engineer-in-charge. Service bolts to used shall be of approved make. The rate including of cost of all labour, T&P, equipments, civil work and consumables, cost of arranging, fabricating, errecting and dismantling of erection scheme including the cost of its designing, revising, supervision by contractor\'s designeer at site during erection, also including cost of all safety measures and necessary insurances of bridge and labours for proper completion of the work as per MORTH specification no. 1905 with due regard of mansoon and as per directions of the engineer-incharge.', 'MT', 40.090, 29000.00, 1162610.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(492, 1, '4.18', 'Drainage Spouts complete as per drawing and Technical specification and as directed by engineer incharge.', 'NO', 10.000, 8000.00, 80000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(493, 1, '4.19', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 10.290, 14500.00, 149205.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(494, 1, '4.20', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 8.500, 6800.00, 57800.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(495, 1, '4.21', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 17.010, 8800.00, 149688.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(496, 1, '4.22', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 12.000, 6000.00, 72000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(497, 1, '4.23', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'RM', 472.000, 200.00, 94400.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(498, 1, '4.24', 'Painting on Steel Surfaces \nProviding and applying two coats of readymix paint of approved brand on steel suface after through cleaning of surface to give an even surface as per drawing , Technical specifications and as per direction of engineer in charge.', 'SQM', 945.000, 86.00, 81270.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(499, 1, '4.25', 'Supply and Fixing of  20 mm dia P.F. make 8.8 grade HSFG High Strength Friction Grip Bolt to IS 3757:1985 latest to grade 10.9S with High Strength Friction Grip nut to IS 6623:2004 latest to grade 10S and high Strength Friction 2 No. washer including cost of all material, Labour, Fixing at site, all taxes, T&P etc required foe Proper completion of the work ( 20 X 120mm) as per drawing , Technical specifications and as per direction of engineer in charge.', 'NO.', 3542.000, 290.00, 1027180.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(500, 1, '4.26', 'Hand Packed stone filling in back of wallls including cost of all materials, royality, T&P etc. complete as per direction of Engineer-in- charge. (As per PWD Uttarakhand specifications)', 'CUM', 167.260, 2000.00, 334520.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(501, 1, '4.27', 'Construction of embankment with approved material obtained from borrow pits (including cost of compensation for earth taken from private land) with a lift upto 1.5 m, transporting to site, spreading, grading to required slope and compacting to meet requirement of Tables 300.1 and 300.2 as per Technical Specification Clause 301.5 and as directed by engineer in-charge.', 'CUM', 328.040, 480.00, 157459.20, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(502, 1, '4.28', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in-charge. ', 'SPAN', 1.000, 90000.00, 90000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(503, 1, '4.29', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(504, 1, '4.30', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(505, 1, '4.31', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(506, 1, '4.32', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(507, 1, '4.33', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(508, 1, '4.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(509, 1, '4.35', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(510, 1, '4.36', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(511, 1, '4.37', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(512, 1, '4.38', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(513, 1, '4.39', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(514, 1, '4.40', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 60.000, 330.00, 19800.00, '2025-08-11 02:57:02', '2025-08-11 02:57:07', '2025-08-11 02:57:07'),
(515, 1, '1', '1- 18.00 M. Span R.C.C. Bridge  in KM 4 ', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(516, 1, '1.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and back filling with approved material as directed by engineer in-charge by  Manual Means.', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:37', '2025-08-11 02:58:37'),
(517, 1, '1.02', 'Up to 3.0 M.                                                                     ', 'Cum', 405.000, 90.00, 36450.00, '2025-08-11 02:58:30', '2025-08-11 02:58:43', '2025-08-11 02:58:43'),
(518, 1, '1.03', '3.0 to 6.0 M.                                                                     ', 'Cum', 343.350, 95.00, 32618.25, '2025-08-11 02:58:30', '2025-08-11 02:58:49', '2025-08-11 02:58:49'),
(519, 1, '1.04', 'Above 6.0 M.                                                                     ', 'Cum', 196.200, 110.00, 21582.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(520, 1, '1.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'Cum', 21.020, 6000.00, 126120.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(521, 1, '1.06', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'Cum', 139.480, 8500.00, 1185580.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(522, 1, '1.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 13.020, 84000.00, 1093680.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(523, 1, '1.08', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(524, 1, '1.09', 'Up to 5.0 M.', 'Cum', 92.980, 8600.00, 799628.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(525, 1, '1.10', '5.0 to 10.0 M.', 'Cum', 58.800, 8800.00, 517440.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(526, 1, '1.11', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 24.080, 83000.00, 1998640.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(527, 1, '1.12', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'Cum', 61.060, 10000.00, 610600.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(528, 1, '1.13', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 12.450, 83000.00, 1033350.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(529, 1, '1.14', 'Reinforced Cement Concrete Crash Barrier\n(Provision of an Reinforced cement concrete crash barrier at the edges of the road, approaches to bridge structures and medians, constructed with M-40 grade concrete with HYSD reinforcement conforming to IRC:21 and dowel bars 25 mm dia, 450 mm long at expansion joints filled with pre-moulded asphalt filler board, keyed to the structure on which it is built and installed as per design given in the enclosure to MOST circular No. RW/NH - 33022/1/94-DO III dated 24 June 1994 as per dimensions in the approved drawing and at locations directed by the Engineer, all as specified) M 40 grade concrete and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'Rm', 51.960, 5000.00, 259800.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(530, 1, '1.15', 'Drainage Spouts complete as per drawing and Technical specification and as directed by engineer incharge.', 'No.', 8.000, 2800.00, 22400.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(531, 1, '1.16', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'Cum', 10.720, 14000.00, 150080.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(532, 1, '1.17', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'Cum', 6.830, 6000.00, 40980.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(533, 1, '1.18', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'Cum', 13.650, 8500.00, 116025.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(534, 1, '1.19', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'Rm', 13.000, 5800.00, 75400.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(535, 1, '1.20', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'Rm', 145.200, 200.00, 29040.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(536, 1, '1.21', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge.', 'Cum', 111.540, 1800.00, 200772.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(537, 1, '1.22', 'Painting Two Coats on New Concrete Surfaces\n(Painting two coats after filling the surface with synthetic enamel paint in all shades on new plastered concrete surfaces) and as per direction of engineer in charge.', 'Sqm', 51.960, 98.00, 5092.08, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(538, 1, '1.23', 'Providing and applying 2 coats of water based cement paint to unplastered concrete surface after cleaning the surface of dirt, dust, oil, grease, efflorescence and applying paint @ of 1 litre for 2 Sq.m and as per direction of engineer in charge.', 'Sqm', 501.860, 85.00, 42658.10, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(539, 1, '1.24', 'Supplying,Fitting and fixing in position true to line and level elastomeric bearing conforming to IRC: 83 (Part-II) section IX and clause 2005 of MoRTH specifications (Excluding Cost of Bearing) complete including all accessories as per drawing and Technical Specifications and as per direction of engineer in charge.  (Including the Cost of Bearing Assembly)', 'Cu. Cm', 32760.000, 0.76, 24897.60, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(540, 1, '1.25', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect and as per direction of engineer in charge.. ', 'Span', 1.000, 70000.00, 70000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(541, 1, '1.26', 'Protection Work', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(542, 1, '1.27', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material Mechanical Means as direction of engineer in-charge Depth upto 3 m.', 'CUM', 450.000, 380.00, 171000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(543, 1, '1.28', 'Providing and Laying of Mechanically Woven Double Twisted Hexagonal shaped Gabions (Zinc plus PVC coated), of size 3mX1mX1m with two diaphragms at 1m interval, having mesh opening 100mmx120 mm, mesh wire diameter 2.7mm/3.7mm, edge/selvedge wire diameter 3.4/4.4 mm and lacing wire diameter 2.2/3.2 mm as per direction of engineer in-charge. (The work includes filling boulders in the gabions).', 'CUM', 510.000, 2400.00, 1224000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(544, 1, '1.29', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(545, 1, '1.30', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(546, 1, '1.31', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 9000.00, 18000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(547, 1, '1.32', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(548, 1, '1.33', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(549, 1, '1.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(550, 1, '1.35', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(551, 1, '1.36', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 9000.00, 54000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(552, 1, '1.37', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(553, 1, '1.38', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(554, 1, '1.39', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(555, 1, '1.40', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 61.000, 330.00, 20130.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(556, 1, '2', '2- 30.0 M. Span Steel Truss Bridge  in KM 8 HM (8-10)', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(557, 1, '2.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material as directed by engineer in-charge by Mechanical Means', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(558, 1, '2.02', 'Up to 3.0 M.                                                                     ', 'CUM', 570.000, 90.00, 51300.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(559, 1, '2.03', '3.0 to 6.0 M.                                                                     ', 'CUM', 522.500, 95.00, 49637.50, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(560, 1, '2.04', 'Above 6.0 M.                                                                     ', 'CUM', 147.250, 110.00, 16197.50, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(561, 1, '2.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 29.840, 6000.00, 179040.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(562, 1, '2.06', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 194.560, 8500.00, 1653760.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(563, 1, '2.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 19.450, 83000.00, 1614350.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(564, 1, '2.08', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump. ', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(565, 1, '2.09', 'Up to 5.0 M.', 'CUM', 133.520, 8600.00, 1148272.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(566, 1, '2.10', '5.0 to 10.0 M.', 'CUM', 134.670, 8800.00, 1185096.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(567, 1, '2.11', 'Above to 10.0 M.', 'CUM', 16.270, 9200.00, 149684.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(568, 1, '2.12', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 38.800, 83000.00, 3220400.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(569, 1, '2.13', 'Supplying, fitting and fixing in position true to line and level POT-PTFE bearing tonne consisting of a metal piston supported by a disc or unreinforced elastomer confined within a metal cylinder, sealing rings, dust seals, PTFE surface sliding against stainless steel mating surface, complete assembly to be of cast steel/fabricated structural steel, metal and elastomer elements to be as per IRC: 83 part-I & II respectively and other parts conforming to BS: 5400, section 9.1 & 9.2 and clause 2006 of MoRTH Specifications complete as per drawing and approved Technical Specifications as per direction of engineer in-charge.  (Including the Cost of Bearing Assembly)', 'MT', 600.000, 240.00, 144000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(570, 1, '2.14', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 48.700, 10500.00, 511350.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(571, 1, '2.15', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 4.350, 83000.00, 361050.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(572, 1, '2.16', 'Supply and fabrication of steel truss bridge as per detailed drawing attached including supply of all structural steel E-250 confirming IS 226 - 1969 required for proper completion of the bridge including ground errection of the bridge and one coat of approved quality anticirrosive (red oxide) paint of confirming IS 5660, all T&P, nuts and bolts, washers and also including supply and fixing of shop rivets required as per drawing, required equipment shall be arranged by the contractor at his own cost which shall be taken back by the contractor after satisfactory execution of the job, the rates shall include ground errection in the workshop and its dismentling after inspection, approval and removing defects, match marking of all parts, numbering and proper stacking in the premises of workshop before cartage to site of work. The work shall be executed in accordance to IS - 1915. The rates shall include cost of all material, its wastage, cutting, bending if required, welding, making holes, shop riveting, labour, T&P etc. required for proper completion of the work. including cost of cartage from workshop to Bridge Site including safe stacking of parts as per direction of engineer in-charge.', 'MT', 46.670, 115000.00, 5367050.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(573, 1, '2.17', 'Erection of Steel Truss (Girder) Bridge (up to 60m span) as per drawing with required camber including cartage of fabricated parts from the place of stack near site including submission of launching plan by the contractor, (duly vetted by a recognised reputable institution/ consultant if required) and approved by the engineer-in-charge. Service bolts to used shall be of approved make. The rate including of cost of all labour, T&P, equipments, civil work and consumables, cost of arranging, fabricating, errecting and dismantling of erection scheme including the cost of its designing, revising, supervision by contractor\'s designeer at site during erection, also including cost of all safety measures and necessary insurances of bridge and labours for proper completion of the work as per MORTH specification no. 1905 with due regard of mansoon and as per directions of the engineer-incharge.', 'MT', 46.670, 29000.00, 1353430.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(574, 1, '2.18', 'Drainage Spouts complete as per drawing and Technical specification as per direction of engineer in-charge.', 'NO,', 10.000, 7800.00, 78000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(575, 1, '2.19', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 12.770, 14500.00, 185165.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(576, 1, '2.20', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 8.500, 6000.00, 51000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(577, 1, '2.21', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 17.010, 8400.00, 142884.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(578, 1, '2.22', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 12.000, 5800.00, 69600.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(579, 1, '2.23', 'Providing weep holes in Brick masonry/Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications as per direction of engineer in charge.', 'RM', 379.550, 200.00, 75910.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(580, 1, '2.24', 'Painting on Steel Surfaces \nProviding and applying two coats of readymix paint of approved brand on steel suface after through cleaning of surface to give an even as per direction of engineer in charge..', 'SQM', 1155.000, 86.00, 99330.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(581, 1, '2.25', 'Supply and Fixing of  20 mm dia P.F. make 8.8 grade HSFG High Strength Friction Grip Bolt to IS 3757:1985 latest to grade 10.9S with High Strength Friction Grip nut to IS 6623:2004 latest to grade 10S and high Strength Friction 2 No. washer including cost of all material, Labour, Fixing at site, all taxes, T&P etc required foe Proper completion of the work ( 20 X 120mm) as per direction of engineer in charge. ', 'NO', 4370.000, 280.00, 1223600.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(582, 1, '2.26', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge.', 'Cum', 157.020, 2000.00, 314040.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(583, 1, '2.27', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in charge.', 'Span', 1.000, 90000.00, 90000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(584, 1, '2.28', 'APPROCH  ROAD', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(585, 1, '2.29', 'Excavation in Hilly Areas in Soil by mechanical means\nExcavation in soil in Hilly Area by mechanical means including cutting and ntrimming of side slopes and disposing of excavated earth with a lift upto 1.5 m and a lead upto 20 m as per Technical Specification Clause 1603.1 and as per direction of engineer incharge.', 'CUM', 78.350, 110.00, 8618.50, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(586, 1, '2.30', 'Excavation for Structures\nEarthwork in excavation for structures as per drawing and technical specifications Clause 305.1 including setting out, construction of shoring and bracing, removal of stumps and other deleterious material and disposal upto a lead of 50 m, dressing of sides and bottom and backfilling in trenches with excavated suitable material nd as per direction of engineer incharge.', 'CUM', 112.300, 400.00, 44920.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(587, 1, '2.31', 'Providing concrete for plain/ reinforced concrete in open foundations complete as per drawings and technical specifications Clause 802, 803, 1202 & 1203. PCC Grade M15 Nominal mix (1:2.5:5) as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth', 'CUM', 33.700, 6000.00, 202200.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(588, 1, '2.32', 'Random Rubble Stone Masonry laid in 1:6 cement and sand mortar, in breast walls, retaining walls, parapets, scuppers, etc. including supply of all material, labour, T&P and royaltiies etc. complete as per drawing and technical specifications Clauses 702, 704, 1202 & 1203 of MORD Specifiction as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'CUM', 499.040, 4000.00, 1996160.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(589, 1, '2.33', 'Hand Packed stone filling in back of wallls including cost of all materials, royality, T&P etc. complete as per direction of Engineer-in- charge. (As per PWD Uttarakhand specifications) and as per direction of engineer in charge.', 'CUM', 225.000, 950.00, 213750.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(590, 1, '2.34', 'Providing weepholes in brick masonry/stone masonry, plain/reinforced concrete abutment, wing wall, return wall with 100 mm dia AC pipe extending through the full width of the structures with slope of 1(V):20(H) towards drawing face complete as per drawing and technical specification Clauses 614, 709, 1204.3.7 and as per direction of engineer in charge.', 'RM', 447.050, 200.00, 89410.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(591, 1, '2.35', 'Construction of embankment with approved material obtained from borrow pits (including cost of compensation for earth taken from private land) with a lift upto 1.5 m, transporting to site, spreading, grading to required slope and compacting to meet requirement of Tables 300.1 and 300.2 as per Technical Specification Clause 301.5 and as per direction of engineer in charge.', 'CUM', 1716.930, 480.00, 824126.40, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(592, 1, '2.36', 'Providing concrete for plain/ reinforced concrete in open foundations complete as per drawings and technical specifications Clause 802, 803, 1202 & 1203 PCC Grade M 20 as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'CUM', 5.850, 6800.00, 39780.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(593, 1, '2.37', 'Type - A, \"W\" : Metal Beam Crash Barrier\nProviding and erecting a \"W\" metal beam crash barrier comprising of 3 mm thick corrugated sheet metal beam rail, 70 cm above road/ground level, fixed on ISMC series channel vertical post, 150 x 75 x 5 mm spaced 2 m centre to centre, 1.8 m high, 1.1 m below ground/road level, all steel parts and fitments to be galvanised by hot dip process, all fittings to conform to IS:1367 and IS:1364, metal beam rail to be fixed on the vertical post with a spacer of channel section 150 x 75 x 5 mm, 330 mm long complete as per clause 810 ( if Concrete Required for Vertical post Fixing will be paid extra) as directed by engineer in-charge.', 'Rm', 130.000, 3600.00, 468000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(594, 1, '2.38', 'PROTECTION WORK', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(595, 1, '2.39', 'Excavation for Structures\nEarthwork in excavation for structures as per drawing and technical specifications Clause 305.1 including setting out, construction of shoring and bracing, removal of stumps and other deleterious material and disposal upto a lead of 50 m, dressing of sides and bottom and backfilling in trenches with excavated suitable material as directed by engineer in-charge..', 'CUM', 500.000, 400.00, 200000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(596, 1, '2.40', 'Providing and Laying of Mechanically Woven Double Twisted Hexagonal shaped Gabions (Zinc plus PVC coated), of size 3mX1mX1m with two diaphragms at 1m interval, having mesh opening 100mmx120 mm, mesh wire diameter 2.7mm / 3.7mm , edge/selvedge wire diameter 3.4/4.4 mm and lacing wire diameter 2.2/3.2 mm. (The work includes filling boulders in the gabions) as directed by engineer in-charge.', 'CUM', 891.000, 2450.00, 2182950.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(597, 1, '2.41', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(598, 1, '2.42', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(599, 1, '2.43', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(600, 1, '2.44', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(601, 1, '2.45', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(602, 1, '2.46', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(603, 1, '2.47', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(604, 1, '2.48', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(605, 1, '2.49', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(606, 1, '2.50', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(607, 1, '2.51', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(608, 1, '2.52', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities.', 'Hrs.', 71.000, 330.00, 23430.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(609, 1, '3', '3- 15.0 M. Span R.C.C. Bridge  in KM  8 (HM 2-4)', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(610, 1, '3.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material and as per direction of engineer in-charge by Manual Means.', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(611, 1, '3.02', 'Hard rock ( blasting prohibited )', 'CUM', 113.700, 600.00, 68220.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(612, 1, '3.03', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 6.740, 6000.00, 40440.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(613, 1, '3.04', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 41.740, 8500.00, 354790.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(614, 1, '3.05', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 2.970, 83000.00, 246510.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(615, 1, '3.06', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump.', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(616, 1, '3.07', 'Up to 5.0 M.', 'CUM', 10.880, 8600.00, 93568.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(617, 1, '3.08', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 1.180, 83000.00, 97940.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(618, 1, '3.09', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 47.960, 10500.00, 503580.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(619, 1, '3.10', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 10.510, 83000.00, 872330.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(620, 1, '3.11', 'Reinforced Cement Concrete Crash Barrier\n(Provision of an Reinforced cement concrete crash barrier at the edges of the road, approaches to bridge structures and medians, constructed with M-40 grade concrete with HYSD reinforcement conforming to IRC:21 and dowel bars 25 mm dia, 450 mm long at expansion joints filled with pre-moulded asphalt filler board, keyed to the structure on which it is built and installed as per design given in the enclosure to MOST circular No. RW/NH - 33022/1/94-DO III dated 24 June 1994 as per dimensions in the approved drawing and at locations directed by the Engineer, all as specified) M 40 grade concrete and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'RM', 45.880, 5000.00, 229400.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(621, 1, '3.12', 'Drainage Spouts complete as per drawing and Technical specification as per direction engineer in-charge.', 'NO.', 6.000, 4000.00, 24000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(622, 1, '3.13', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 9.470, 14500.00, 137315.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(623, 1, '3.14', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 6.830, 6800.00, 46444.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(624, 1, '3.15', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 13.650, 8800.00, 120120.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(625, 1, '3.16', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 13.000, 6000.00, 78000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(626, 1, '3.17', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'RM', 1.800, 200.00, 360.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(627, 1, '3.18', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge..', 'CUM', 10.620, 1800.00, 19116.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(628, 1, '3.19', 'Painting Two Coats on New Concrete Surfaces\n(Painting two coats after filling the surface with synthetic enamel paint in all shades on new plastered concrete surfaces) and as per direction of engineer in charge.', 'SQM', 45.880, 98.00, 4496.24, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(629, 1, '3.20', 'Providing and applying 2 coats of water based cement paint to unplastered concrete surface after cleaning the surface of dirt, dust, oil, grease, efflorescence and applying paint @ of 1 litre for 2 Sq.m and as per direction of engineer in charge.', 'SQM', 253.960, 85.00, 21586.60, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(630, 1, '3.21', 'Supplying,Fitting and fixing in position true to line and level elastomeric bearing conforming to IRC: 83 (Part-II) section IX and clause 2005 of MoRTH specifications (Excluding Cost of Bearing) complete including all accessories as per drawing and Technical Specifications and as directed by engineer in-charge. (Including the Cost of Bearing Assembly)', 'Cu-Cm', 32760.000, 0.76, 24897.60, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(631, 1, '3.22', 'Providing & Fixing 25 mm dia 1.8 m. long rock anchoring including supply of all materials T & P etc Complete in all respect and as per direction of engineer in charge.', 'NO.', 16.000, 14000.00, 224000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(632, 1, '3.23', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in-charge. ', 'SPAN', 1.000, 90000.00, 90000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(633, 1, '3.24', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(634, 1, '3.25', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(635, 1, '3.26', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(636, 1, '3.27', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(637, 1, '3.28', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(638, 1, '3.29', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(639, 1, '3.30', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(640, 1, '3.31', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56');
INSERT INTO `boqentry_data` (`id`, `sub_package_project_id`, `sl_no`, `item_description`, `unit`, `qty`, `rate`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(641, 1, '3.32', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(642, 1, '3.33', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(643, 1, '3.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(644, 1, '3.35', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 60.000, 330.00, 19800.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(645, 1, '4', '4- 24.00 M. Span Steel Truss Bridge  in KM  12', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(646, 1, '4.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material as directed by engineer in-charge by Mechanical Means', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(647, 1, '4.02', 'Up to 3.0 M.                                                                     ', 'CUM', 611.100, 90.00, 54999.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(648, 1, '4.03', '3.0 to 6.0 M.                                                                     ', 'CUM', 611.100, 95.00, 58054.50, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(649, 1, '4.04', 'Above 6.0 M.                                                                     ', 'CUM', 906.760, 110.00, 99743.60, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(650, 1, '4.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 23.040, 6000.00, 138240.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(651, 1, '4.06', 'Reinforced cement concrete (RCC) Grade M 25 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 210.620, 8500.00, 1790270.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(652, 1, '4.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 18.020, 83000.00, 1495660.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(653, 1, '4.08', 'Reinforced cement concrete (RCC) M 25 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump.', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(654, 1, '4.09', 'Up to 5.0 M.', 'CUM', 143.300, 8600.00, 1232380.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(655, 1, '4.10', '5.0 to 10.0 M.', 'CUM', 157.280, 8800.00, 1384064.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(656, 1, '4.11', 'Above to 10.0 M.', 'CUM', 39.980, 9000.00, 359820.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(657, 1, '4.12', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 82.570, 83000.00, 6853310.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(658, 1, '4.13', 'Supplying, fitting and fixing in position true to line and level POT-PTFE bearing tonne consisting of a metal piston supported by a disc or unreinforced elastomer confined within a metal cylinder, sealing rings, dust seals, PTFE surface sliding against stainless steel mating surface, complete assembly to be of cast steel/fabricated structural steel, metal and elastomer elements to be as per IRC: 83 part-I & II respectively and other parts conforming to BS: 5400, section 9.1 & 9.2 and clause 2006 of MoRTH Specifications complete as per drawing and approved Technical Specifications and as per direction of engineer in-charge.  (Including the Cost of Bearing Assembly)', 'MT', 500.000, 240.00, 120000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(659, 1, '4.14', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-25 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 36.300, 10500.00, 381150.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(660, 1, '4.15', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 4.590, 83000.00, 380970.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(661, 1, '4.16', 'Supply and fabrication of steel truss bridge as per detailed drawing attached including supply of all structural steel E-250 confirming IS 226 - 1969 required for proper completion of the bridge including ground errection of the bridge and one coat of approved quality anticirrosive (red oxide) paint of confirming IS 5660, all T&P, nuts and bolts, washers and also including supply and fixing of shop rivets required as per drawing, required equipment shall be arranged by the contractor at his own cost which shall be taken back by the contractor after satisfactory execution of the job, the rates shall include ground errection in the workshop and its dismentling after inspection, approval and removing defects, match marking of all parts, numbering and proper stacking in the premises of workshop before cartage to site of work. The work shall be executed in accordance to IS - 1915. The rates shall include cost of all material, its wastage, cutting, bending if required, welding, making holes, shop riveting, labour, T&P etc. required for proper completion of the work. including cost of cartage from workshop to Bridge Site including safe stacking of parts as per direction of engineer in-charge.', 'MT', 40.090, 115000.00, 4610350.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(662, 1, '4.17', 'Erection of Steel Truss (Girder) Bridge (up to 60m span) as per drawing with required camber including cartage of fabricated parts from the place of stack near site including submission of launching plan by the contractor, (duly vetted by a recognised reputable institution/ consultant if required) and approved by the engineer-in-charge. Service bolts to used shall be of approved make. The rate including of cost of all labour, T&P, equipments, civil work and consumables, cost of arranging, fabricating, errecting and dismantling of erection scheme including the cost of its designing, revising, supervision by contractor\'s designeer at site during erection, also including cost of all safety measures and necessary insurances of bridge and labours for proper completion of the work as per MORTH specification no. 1905 with due regard of mansoon and as per directions of the engineer-incharge.', 'MT', 40.090, 29000.00, 1162610.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(663, 1, '4.18', 'Drainage Spouts complete as per drawing and Technical specification and as directed by engineer incharge.', 'NO', 10.000, 8000.00, 80000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(664, 1, '4.19', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 10.290, 14500.00, 149205.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(665, 1, '4.20', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 8.500, 6800.00, 57800.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(666, 1, '4.21', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 17.010, 8800.00, 149688.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(667, 1, '4.22', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 12.000, 6000.00, 72000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(668, 1, '4.23', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'RM', 472.000, 200.00, 94400.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(669, 1, '4.24', 'Painting on Steel Surfaces \nProviding and applying two coats of readymix paint of approved brand on steel suface after through cleaning of surface to give an even surface as per drawing , Technical specifications and as per direction of engineer in charge.', 'SQM', 945.000, 86.00, 81270.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(670, 1, '4.25', 'Supply and Fixing of  20 mm dia P.F. make 8.8 grade HSFG High Strength Friction Grip Bolt to IS 3757:1985 latest to grade 10.9S with High Strength Friction Grip nut to IS 6623:2004 latest to grade 10S and high Strength Friction 2 No. washer including cost of all material, Labour, Fixing at site, all taxes, T&P etc required foe Proper completion of the work ( 20 X 120mm) as per drawing , Technical specifications and as per direction of engineer in charge.', 'NO.', 3542.000, 290.00, 1027180.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(671, 1, '4.26', 'Hand Packed stone filling in back of wallls including cost of all materials, royality, T&P etc. complete as per direction of Engineer-in- charge. (As per PWD Uttarakhand specifications)', 'CUM', 167.260, 2000.00, 334520.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(672, 1, '4.27', 'Construction of embankment with approved material obtained from borrow pits (including cost of compensation for earth taken from private land) with a lift upto 1.5 m, transporting to site, spreading, grading to required slope and compacting to meet requirement of Tables 300.1 and 300.2 as per Technical Specification Clause 301.5 and as directed by engineer in-charge.', 'CUM', 328.040, 480.00, 157459.20, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(673, 1, '4.28', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in-charge. ', 'SPAN', 1.000, 90000.00, 90000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(674, 1, '4.29', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(675, 1, '4.30', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(676, 1, '4.31', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(677, 1, '4.32', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(678, 1, '4.33', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(679, 1, '4.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(680, 1, '4.35', 'During construction', NULL, NULL, NULL, NULL, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(681, 1, '4.36', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(682, 1, '4.37', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(683, 1, '4.38', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(684, 1, '4.39', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(685, 1, '4.40', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 60.000, 330.00, 19800.00, '2025-08-11 02:58:30', '2025-08-11 02:58:56', '2025-08-11 02:58:56'),
(686, 1, '1', '1- 18.00 M. Span R.C.C. Bridge  in KM 4 ', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(687, 1, '1.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and back filling with approved material as directed by engineer in-charge by  Manual Means.', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(688, 1, '1.02', 'Up to 3.0 M.                                                                     ', 'Cum', 405.000, 90.00, 36450.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(689, 1, '1.03', '3.0 to 6.0 M.                                                                     ', 'Cum', 343.350, 95.00, 32618.25, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(690, 1, '1.04', 'Above 6.0 M.                                                                     ', 'Cum', 196.200, 110.00, 21582.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(691, 1, '1.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'Cum', 21.020, 6000.00, 126120.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(692, 1, '1.06', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'Cum', 139.480, 8500.00, 1185580.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(693, 1, '1.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 13.020, 84000.00, 1093680.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(694, 1, '1.08', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(695, 1, '1.09', 'Up to 5.0 M.', 'Cum', 92.980, 8600.00, 799628.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(696, 1, '1.10', '5.0 to 10.0 M.', 'Cum', 58.800, 8800.00, 517440.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(697, 1, '1.11', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 24.080, 83000.00, 1998640.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(698, 1, '1.12', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'Cum', 61.060, 10000.00, 610600.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(699, 1, '1.13', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 12.450, 83000.00, 1033350.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(700, 1, '1.14', 'Reinforced Cement Concrete Crash Barrier\n(Provision of an Reinforced cement concrete crash barrier at the edges of the road, approaches to bridge structures and medians, constructed with M-40 grade concrete with HYSD reinforcement conforming to IRC:21 and dowel bars 25 mm dia, 450 mm long at expansion joints filled with pre-moulded asphalt filler board, keyed to the structure on which it is built and installed as per design given in the enclosure to MOST circular No. RW/NH - 33022/1/94-DO III dated 24 June 1994 as per dimensions in the approved drawing and at locations directed by the Engineer, all as specified) M 40 grade concrete and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'Rm', 51.960, 5000.00, 259800.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(701, 1, '1.15', 'Drainage Spouts complete as per drawing and Technical specification and as directed by engineer incharge.', 'No.', 8.000, 2800.00, 22400.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(702, 1, '1.16', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'Cum', 10.720, 14000.00, 150080.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(703, 1, '1.17', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'Cum', 6.830, 6000.00, 40980.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(704, 1, '1.18', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'Cum', 13.650, 8500.00, 116025.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(705, 1, '1.19', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'Rm', 13.000, 5800.00, 75400.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(706, 1, '1.20', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'Rm', 145.200, 200.00, 29040.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(707, 1, '1.21', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge.', 'Cum', 111.540, 1800.00, 200772.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(708, 1, '1.22', 'Painting Two Coats on New Concrete Surfaces\n(Painting two coats after filling the surface with synthetic enamel paint in all shades on new plastered concrete surfaces) and as per direction of engineer in charge.', 'Sqm', 51.960, 98.00, 5092.08, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(709, 1, '1.23', 'Providing and applying 2 coats of water based cement paint to unplastered concrete surface after cleaning the surface of dirt, dust, oil, grease, efflorescence and applying paint @ of 1 litre for 2 Sq.m and as per direction of engineer in charge.', 'Sqm', 501.860, 85.00, 42658.10, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(710, 1, '1.24', 'Supplying,Fitting and fixing in position true to line and level elastomeric bearing conforming to IRC: 83 (Part-II) section IX and clause 2005 of MoRTH specifications (Excluding Cost of Bearing) complete including all accessories as per drawing and Technical Specifications and as per direction of engineer in charge.  (Including the Cost of Bearing Assembly)', 'Cu. Cm', 32760.000, 0.76, 24897.60, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(711, 1, '1.25', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect and as per direction of engineer in charge.. ', 'Span', 1.000, 70000.00, 70000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(712, 1, '1.26', 'Protection Work', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(713, 1, '1.27', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material Mechanical Means as direction of engineer in-charge Depth upto 3 m.', 'CUM', 450.000, 380.00, 171000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(714, 1, '1.28', 'Providing and Laying of Mechanically Woven Double Twisted Hexagonal shaped Gabions (Zinc plus PVC coated), of size 3mX1mX1m with two diaphragms at 1m interval, having mesh opening 100mmx120 mm, mesh wire diameter 2.7mm/3.7mm, edge/selvedge wire diameter 3.4/4.4 mm and lacing wire diameter 2.2/3.2 mm as per direction of engineer in-charge. (The work includes filling boulders in the gabions).', 'CUM', 510.000, 2400.00, 1224000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(715, 1, '1.29', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(716, 1, '1.30', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(717, 1, '1.31', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 9000.00, 18000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(718, 1, '1.32', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(719, 1, '1.33', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(720, 1, '1.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(721, 1, '1.35', 'During construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(722, 1, '1.36', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 9000.00, 54000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(723, 1, '1.37', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(724, 1, '1.38', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(725, 1, '1.39', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(726, 1, '1.40', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 61.000, 330.00, 20130.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(727, 1, '2', '2- 30.0 M. Span Steel Truss Bridge  in KM 8 HM (8-10)', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(728, 1, '2.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material as directed by engineer in-charge by Mechanical Means', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(729, 1, '2.02', 'Up to 3.0 M.                                                                     ', 'CUM', 570.000, 90.00, 51300.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(730, 1, '2.03', '3.0 to 6.0 M.                                                                     ', 'CUM', 522.500, 95.00, 49637.50, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(731, 1, '2.04', 'Above 6.0 M.                                                                     ', 'CUM', 147.250, 110.00, 16197.50, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(732, 1, '2.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 29.840, 6000.00, 179040.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(733, 1, '2.06', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 194.560, 8500.00, 1653760.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(734, 1, '2.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 19.450, 83000.00, 1614350.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(735, 1, '2.08', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump. ', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(736, 1, '2.09', 'Up to 5.0 M.', 'CUM', 133.520, 8600.00, 1148272.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(737, 1, '2.10', '5.0 to 10.0 M.', 'CUM', 134.670, 8800.00, 1185096.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(738, 1, '2.11', 'Above to 10.0 M.', 'CUM', 16.270, 9200.00, 149684.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(739, 1, '2.12', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 38.800, 83000.00, 3220400.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(740, 1, '2.13', 'Supplying, fitting and fixing in position true to line and level POT-PTFE bearing tonne consisting of a metal piston supported by a disc or unreinforced elastomer confined within a metal cylinder, sealing rings, dust seals, PTFE surface sliding against stainless steel mating surface, complete assembly to be of cast steel/fabricated structural steel, metal and elastomer elements to be as per IRC: 83 part-I & II respectively and other parts conforming to BS: 5400, section 9.1 & 9.2 and clause 2006 of MoRTH Specifications complete as per drawing and approved Technical Specifications as per direction of engineer in-charge.  (Including the Cost of Bearing Assembly)', 'MT', 600.000, 240.00, 144000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(741, 1, '2.14', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 48.700, 10500.00, 511350.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(742, 1, '2.15', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 4.350, 83000.00, 361050.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(743, 1, '2.16', 'Supply and fabrication of steel truss bridge as per detailed drawing attached including supply of all structural steel E-250 confirming IS 226 - 1969 required for proper completion of the bridge including ground errection of the bridge and one coat of approved quality anticirrosive (red oxide) paint of confirming IS 5660, all T&P, nuts and bolts, washers and also including supply and fixing of shop rivets required as per drawing, required equipment shall be arranged by the contractor at his own cost which shall be taken back by the contractor after satisfactory execution of the job, the rates shall include ground errection in the workshop and its dismentling after inspection, approval and removing defects, match marking of all parts, numbering and proper stacking in the premises of workshop before cartage to site of work. The work shall be executed in accordance to IS - 1915. The rates shall include cost of all material, its wastage, cutting, bending if required, welding, making holes, shop riveting, labour, T&P etc. required for proper completion of the work. including cost of cartage from workshop to Bridge Site including safe stacking of parts as per direction of engineer in-charge.', 'MT', 46.670, 115000.00, 5367050.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(744, 1, '2.17', 'Erection of Steel Truss (Girder) Bridge (up to 60m span) as per drawing with required camber including cartage of fabricated parts from the place of stack near site including submission of launching plan by the contractor, (duly vetted by a recognised reputable institution/ consultant if required) and approved by the engineer-in-charge. Service bolts to used shall be of approved make. The rate including of cost of all labour, T&P, equipments, civil work and consumables, cost of arranging, fabricating, errecting and dismantling of erection scheme including the cost of its designing, revising, supervision by contractor\'s designeer at site during erection, also including cost of all safety measures and necessary insurances of bridge and labours for proper completion of the work as per MORTH specification no. 1905 with due regard of mansoon and as per directions of the engineer-incharge.', 'MT', 46.670, 29000.00, 1353430.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(745, 1, '2.18', 'Drainage Spouts complete as per drawing and Technical specification as per direction of engineer in-charge.', 'NO,', 10.000, 7800.00, 78000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(746, 1, '2.19', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 12.770, 14500.00, 185165.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(747, 1, '2.20', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 8.500, 6000.00, 51000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(748, 1, '2.21', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 17.010, 8400.00, 142884.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(749, 1, '2.22', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 12.000, 5800.00, 69600.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(750, 1, '2.23', 'Providing weep holes in Brick masonry/Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications as per direction of engineer in charge.', 'RM', 379.550, 200.00, 75910.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(751, 1, '2.24', 'Painting on Steel Surfaces \nProviding and applying two coats of readymix paint of approved brand on steel suface after through cleaning of surface to give an even as per direction of engineer in charge..', 'SQM', 1155.000, 86.00, 99330.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(752, 1, '2.25', 'Supply and Fixing of  20 mm dia P.F. make 8.8 grade HSFG High Strength Friction Grip Bolt to IS 3757:1985 latest to grade 10.9S with High Strength Friction Grip nut to IS 6623:2004 latest to grade 10S and high Strength Friction 2 No. washer including cost of all material, Labour, Fixing at site, all taxes, T&P etc required foe Proper completion of the work ( 20 X 120mm) as per direction of engineer in charge. ', 'NO', 4370.000, 280.00, 1223600.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(753, 1, '2.26', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge.', 'Cum', 157.020, 2000.00, 314040.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(754, 1, '2.27', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in charge.', 'Span', 1.000, 90000.00, 90000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(755, 1, '2.28', 'APPROCH  ROAD', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(756, 1, '2.29', 'Excavation in Hilly Areas in Soil by mechanical means\nExcavation in soil in Hilly Area by mechanical means including cutting and ntrimming of side slopes and disposing of excavated earth with a lift upto 1.5 m and a lead upto 20 m as per Technical Specification Clause 1603.1 and as per direction of engineer incharge.', 'CUM', 78.350, 110.00, 8618.50, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(757, 1, '2.30', 'Excavation for Structures\nEarthwork in excavation for structures as per drawing and technical specifications Clause 305.1 including setting out, construction of shoring and bracing, removal of stumps and other deleterious material and disposal upto a lead of 50 m, dressing of sides and bottom and backfilling in trenches with excavated suitable material nd as per direction of engineer incharge.', 'CUM', 112.300, 400.00, 44920.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(758, 1, '2.31', 'Providing concrete for plain/ reinforced concrete in open foundations complete as per drawings and technical specifications Clause 802, 803, 1202 & 1203. PCC Grade M15 Nominal mix (1:2.5:5) as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth', 'CUM', 33.700, 6000.00, 202200.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(759, 1, '2.32', 'Random Rubble Stone Masonry laid in 1:6 cement and sand mortar, in breast walls, retaining walls, parapets, scuppers, etc. including supply of all material, labour, T&P and royaltiies etc. complete as per drawing and technical specifications Clauses 702, 704, 1202 & 1203 of MORD Specifiction as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'CUM', 499.040, 4000.00, 1996160.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(760, 1, '2.33', 'Hand Packed stone filling in back of wallls including cost of all materials, royality, T&P etc. complete as per direction of Engineer-in- charge. (As per PWD Uttarakhand specifications) and as per direction of engineer in charge.', 'CUM', 225.000, 950.00, 213750.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(761, 1, '2.34', 'Providing weepholes in brick masonry/stone masonry, plain/reinforced concrete abutment, wing wall, return wall with 100 mm dia AC pipe extending through the full width of the structures with slope of 1(V):20(H) towards drawing face complete as per drawing and technical specification Clauses 614, 709, 1204.3.7 and as per direction of engineer in charge.', 'RM', 447.050, 200.00, 89410.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(762, 1, '2.35', 'Construction of embankment with approved material obtained from borrow pits (including cost of compensation for earth taken from private land) with a lift upto 1.5 m, transporting to site, spreading, grading to required slope and compacting to meet requirement of Tables 300.1 and 300.2 as per Technical Specification Clause 301.5 and as per direction of engineer in charge.', 'CUM', 1716.930, 480.00, 824126.40, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(763, 1, '2.36', 'Providing concrete for plain/ reinforced concrete in open foundations complete as per drawings and technical specifications Clause 802, 803, 1202 & 1203 PCC Grade M 20 as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'CUM', 5.850, 6800.00, 39780.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(764, 1, '2.37', 'Type - A, \"W\" : Metal Beam Crash Barrier\nProviding and erecting a \"W\" metal beam crash barrier comprising of 3 mm thick corrugated sheet metal beam rail, 70 cm above road/ground level, fixed on ISMC series channel vertical post, 150 x 75 x 5 mm spaced 2 m centre to centre, 1.8 m high, 1.1 m below ground/road level, all steel parts and fitments to be galvanised by hot dip process, all fittings to conform to IS:1367 and IS:1364, metal beam rail to be fixed on the vertical post with a spacer of channel section 150 x 75 x 5 mm, 330 mm long complete as per clause 810 ( if Concrete Required for Vertical post Fixing will be paid extra) as directed by engineer in-charge.', 'Rm', 130.000, 3600.00, 468000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(765, 1, '2.38', 'PROTECTION WORK', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(766, 1, '2.39', 'Excavation for Structures\nEarthwork in excavation for structures as per drawing and technical specifications Clause 305.1 including setting out, construction of shoring and bracing, removal of stumps and other deleterious material and disposal upto a lead of 50 m, dressing of sides and bottom and backfilling in trenches with excavated suitable material as directed by engineer in-charge..', 'CUM', 500.000, 400.00, 200000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(767, 1, '2.40', 'Providing and Laying of Mechanically Woven Double Twisted Hexagonal shaped Gabions (Zinc plus PVC coated), of size 3mX1mX1m with two diaphragms at 1m interval, having mesh opening 100mmx120 mm, mesh wire diameter 2.7mm / 3.7mm , edge/selvedge wire diameter 3.4/4.4 mm and lacing wire diameter 2.2/3.2 mm. (The work includes filling boulders in the gabions) as directed by engineer in-charge.', 'CUM', 891.000, 2450.00, 2182950.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(768, 1, '2.41', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(769, 1, '2.42', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(770, 1, '2.43', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(771, 1, '2.44', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(772, 1, '2.45', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(773, 1, '2.46', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(774, 1, '2.47', 'During construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(775, 1, '2.48', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(776, 1, '2.49', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(777, 1, '2.50', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(778, 1, '2.51', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(779, 1, '2.52', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities.', 'Hrs.', 71.000, 330.00, 23430.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(780, 1, '3', '3- 15.0 M. Span R.C.C. Bridge  in KM  8 (HM 2-4)', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(781, 1, '3.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material and as per direction of engineer in-charge by Manual Means.', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(782, 1, '3.02', 'Hard rock ( blasting prohibited )', 'CUM', 113.700, 600.00, 68220.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(783, 1, '3.03', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 6.740, 6000.00, 40440.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(784, 1, '3.04', 'Reinforced cement concrete (RCC) Grade M30 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 41.740, 8500.00, 354790.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(785, 1, '3.05', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 2.970, 83000.00, 246510.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(786, 1, '3.06', 'Reinforced cement concrete (RCC) M 30 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump.', NULL, NULL, NULL, NULL, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(787, 1, '3.07', 'Up to 5.0 M.', 'CUM', 10.880, 8600.00, 93568.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(788, 1, '3.08', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 1.180, 83000.00, 97940.00, '2025-08-12 00:13:55', '2025-08-12 00:13:55', NULL),
(789, 1, '3.09', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-30 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 47.960, 10500.00, 503580.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(790, 1, '3.10', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 10.510, 83000.00, 872330.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(791, 1, '3.11', 'Reinforced Cement Concrete Crash Barrier\n(Provision of an Reinforced cement concrete crash barrier at the edges of the road, approaches to bridge structures and medians, constructed with M-40 grade concrete with HYSD reinforcement conforming to IRC:21 and dowel bars 25 mm dia, 450 mm long at expansion joints filled with pre-moulded asphalt filler board, keyed to the structure on which it is built and installed as per design given in the enclosure to MOST circular No. RW/NH - 33022/1/94-DO III dated 24 June 1994 as per dimensions in the approved drawing and at locations directed by the Engineer, all as specified) M 40 grade concrete and must be continuous curing for at least 14 days must be done by laying Hessain cloth.', 'RM', 45.880, 5000.00, 229400.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(792, 1, '3.12', 'Drainage Spouts complete as per drawing and Technical specification as per direction engineer in-charge.', 'NO.', 6.000, 4000.00, 24000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(793, 1, '3.13', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 9.470, 14500.00, 137315.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL);
INSERT INTO `boqentry_data` (`id`, `sub_package_project_id`, `sl_no`, `item_description`, `unit`, `qty`, `rate`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(794, 1, '3.14', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 6.830, 6800.00, 46444.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(795, 1, '3.15', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 13.650, 8800.00, 120120.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(796, 1, '3.16', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 13.000, 6000.00, 78000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(797, 1, '3.17', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'RM', 1.800, 200.00, 360.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(798, 1, '3.18', 'Providing and laying of Filter media with granular materials/stone crushed aggregates satisfying the requirements laid down in clause 2504.2.2. of MoRTH specifications to a thickness of not less than 600 mm with smaller size towards the soil and bigger size towards the wall and provided over the entire surface behind abutment, wing wall and return wall to the full height compacted to a firm condition complete as per drawing and technical specification and as per direction of engineer in charge..', 'CUM', 10.620, 1800.00, 19116.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(799, 1, '3.19', 'Painting Two Coats on New Concrete Surfaces\n(Painting two coats after filling the surface with synthetic enamel paint in all shades on new plastered concrete surfaces) and as per direction of engineer in charge.', 'SQM', 45.880, 98.00, 4496.24, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(800, 1, '3.20', 'Providing and applying 2 coats of water based cement paint to unplastered concrete surface after cleaning the surface of dirt, dust, oil, grease, efflorescence and applying paint @ of 1 litre for 2 Sq.m and as per direction of engineer in charge.', 'SQM', 253.960, 85.00, 21586.60, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(801, 1, '3.21', 'Supplying,Fitting and fixing in position true to line and level elastomeric bearing conforming to IRC: 83 (Part-II) section IX and clause 2005 of MoRTH specifications (Excluding Cost of Bearing) complete including all accessories as per drawing and Technical Specifications and as directed by engineer in-charge. (Including the Cost of Bearing Assembly)', 'Cu-Cm', 32760.000, 0.76, 24897.60, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(802, 1, '3.22', 'Providing & Fixing 25 mm dia 1.8 m. long rock anchoring including supply of all materials T & P etc Complete in all respect and as per direction of engineer in charge.', 'NO.', 16.000, 14000.00, 224000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(803, 1, '3.23', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in-charge. ', 'SPAN', 1.000, 90000.00, 90000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(804, 1, '3.24', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(805, 1, '3.25', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(806, 1, '3.26', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(807, 1, '3.27', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(808, 1, '3.28', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(809, 1, '3.29', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(810, 1, '3.30', 'During construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(811, 1, '3.31', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(812, 1, '3.32', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(813, 1, '3.33', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(814, 1, '3.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(815, 1, '3.35', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 60.000, 330.00, 19800.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(816, 1, '4', '4- 24.00 M. Span Steel Truss Bridge  in KM  12', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(817, 1, '4.01', 'Excavation for Structures\nEarth work in excavation of foundation of structures as per drawing and technical specification, including setting out, construction of shoring and bracing, removal of stumps and other deleterious matter, dressing of sides and bottom and backfilling with approved material as directed by engineer in-charge by Mechanical Means', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(818, 1, '4.02', 'Up to 3.0 M.                                                                     ', 'CUM', 611.100, 90.00, 54999.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(819, 1, '4.03', '3.0 to 6.0 M.                                                                     ', 'CUM', 611.100, 95.00, 58054.50, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(820, 1, '4.04', 'Above 6.0 M.                                                                     ', 'CUM', 906.760, 110.00, 99743.60, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(821, 1, '4.05', 'Plain cement concrete (PCC) Grade M15 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth. ', 'CUM', 23.040, 6000.00, 138240.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(822, 1, '4.06', 'Reinforced cement concrete (RCC) Grade M 25 in open foundation complete as per drawing and technical specifications, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump.', 'CUM', 210.620, 8500.00, 1790270.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(823, 1, '4.07', 'Supplying, fitting and placing un-coated HYSD bar reinforcement in foundation complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 18.020, 83000.00, 1495660.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(824, 1, '4.08', 'Reinforced cement concrete (RCC) M 25 in sub-structure complete as per drawing and technical specifications Using concrete Mixer Height upto 5m, as directed by engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth.  Using Batching Plant, Transit Mixer and Concrete Pump.', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(825, 1, '4.09', 'Up to 5.0 M.', 'CUM', 143.300, 8600.00, 1232380.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(826, 1, '4.10', '5.0 to 10.0 M.', 'CUM', 157.280, 8800.00, 1384064.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(827, 1, '4.11', 'Above to 10.0 M.', 'CUM', 39.980, 9000.00, 359820.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(828, 1, '4.12', 'Supplying, fitting and placing HYSD bar reinforcement in sub-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 82.570, 83000.00, 6853310.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(829, 1, '4.13', 'Supplying, fitting and fixing in position true to line and level POT-PTFE bearing tonne consisting of a metal piston supported by a disc or unreinforced elastomer confined within a metal cylinder, sealing rings, dust seals, PTFE surface sliding against stainless steel mating surface, complete assembly to be of cast steel/fabricated structural steel, metal and elastomer elements to be as per IRC: 83 part-I & II respectively and other parts conforming to BS: 5400, section 9.1 & 9.2 and clause 2006 of MoRTH Specifications complete as per drawing and approved Technical Specifications and as per direction of engineer in-charge.  (Including the Cost of Bearing Assembly)', 'MT', 500.000, 240.00, 120000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(830, 1, '4.14', 'Furnishing and Placing Reinforced cement concrete in super-structure for deck slab as per drawing and Technical Specification Grade M-25 , as directed by engineer in-charge using Batching plant, Transit mixture and concrete pump for solid slab and must be continuous curing for at least 14 days must be done by laying Hessain cloth.Using Batching Plant, Transit Mixer and Concrete Pump For solid slab super-structure. Hight up to 5 m.', 'CUM', 36.300, 10500.00, 381150.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(831, 1, '4.15', 'Supplying, fitting and placing HYSD bar reinforcement in super-structure complete as per drawing and technical specifications and as per direction of engineer in-charge.', 'MT', 4.590, 83000.00, 380970.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(832, 1, '4.16', 'Supply and fabrication of steel truss bridge as per detailed drawing attached including supply of all structural steel E-250 confirming IS 226 - 1969 required for proper completion of the bridge including ground errection of the bridge and one coat of approved quality anticirrosive (red oxide) paint of confirming IS 5660, all T&P, nuts and bolts, washers and also including supply and fixing of shop rivets required as per drawing, required equipment shall be arranged by the contractor at his own cost which shall be taken back by the contractor after satisfactory execution of the job, the rates shall include ground errection in the workshop and its dismentling after inspection, approval and removing defects, match marking of all parts, numbering and proper stacking in the premises of workshop before cartage to site of work. The work shall be executed in accordance to IS - 1915. The rates shall include cost of all material, its wastage, cutting, bending if required, welding, making holes, shop riveting, labour, T&P etc. required for proper completion of the work. including cost of cartage from workshop to Bridge Site including safe stacking of parts as per direction of engineer in-charge.', 'MT', 40.090, 115000.00, 4610350.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(833, 1, '4.17', 'Erection of Steel Truss (Girder) Bridge (up to 60m span) as per drawing with required camber including cartage of fabricated parts from the place of stack near site including submission of launching plan by the contractor, (duly vetted by a recognised reputable institution/ consultant if required) and approved by the engineer-in-charge. Service bolts to used shall be of approved make. The rate including of cost of all labour, T&P, equipments, civil work and consumables, cost of arranging, fabricating, errecting and dismantling of erection scheme including the cost of its designing, revising, supervision by contractor\'s designeer at site during erection, also including cost of all safety measures and necessary insurances of bridge and labours for proper completion of the work as per MORTH specification no. 1905 with due regard of mansoon and as per directions of the engineer-incharge.', 'MT', 40.090, 29000.00, 1162610.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(834, 1, '4.18', 'Drainage Spouts complete as per drawing and Technical specification and as directed by engineer incharge.', 'NO', 10.000, 8000.00, 80000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(835, 1, '4.19', 'Providing and laying Cement concrete wearing coat M-30 grade including reinforcement complete as per drawing and Technical Specifications and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge.', 'CUM', 10.290, 14500.00, 149205.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(836, 1, '4.20', 'PCC M15 Grade leveling course below approach slab complete as per drawing and Technical specification as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 8.500, 6800.00, 57800.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(837, 1, '4.21', 'Reinforced cement concrete (M-30) approach slab including formwork but excluding reinforcement steel, complete as per drawing and Technical specification  as per direction of engineer in-charge and must be continuous curing for at least 14 days must be done by laying Hessain cloth as per direction of engineer in-charge..', 'CUM', 17.010, 8800.00, 149688.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(838, 1, '4.22', 'Providing and laying of strip seal expansion joint catering to maximum horizontal movement upto 70 mm ( complete as per approved drawings and standard specifications ) to be installed by the manufacturer / supplier or their authorised representative ensuring compliance to the manufacturer\'s instructions for installation and as per direction of engineer in charge.', 'RM', 12.000, 6000.00, 72000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(839, 1, '4.23', 'Providing weep holes in Brick masonry /Plain/Reinforced concrete abutment, wing wall/return wall with 100 mm dia AC pipe, extending through the full width of the structure with slope of 1V :20H towards drawing foce. Complete as per drawing and Technical specifications and as per direction of engineer in charge.', 'RM', 472.000, 200.00, 94400.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(840, 1, '4.24', 'Painting on Steel Surfaces \nProviding and applying two coats of readymix paint of approved brand on steel suface after through cleaning of surface to give an even surface as per drawing , Technical specifications and as per direction of engineer in charge.', 'SQM', 945.000, 86.00, 81270.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(841, 1, '4.25', 'Supply and Fixing of  20 mm dia P.F. make 8.8 grade HSFG High Strength Friction Grip Bolt to IS 3757:1985 latest to grade 10.9S with High Strength Friction Grip nut to IS 6623:2004 latest to grade 10S and high Strength Friction 2 No. washer including cost of all material, Labour, Fixing at site, all taxes, T&P etc required foe Proper completion of the work ( 20 X 120mm) as per drawing , Technical specifications and as per direction of engineer in charge.', 'NO.', 3542.000, 290.00, 1027180.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(842, 1, '4.26', 'Hand Packed stone filling in back of wallls including cost of all materials, royality, T&P etc. complete as per direction of Engineer-in- charge. (As per PWD Uttarakhand specifications)', 'CUM', 167.260, 2000.00, 334520.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(843, 1, '4.27', 'Construction of embankment with approved material obtained from borrow pits (including cost of compensation for earth taken from private land) with a lift upto 1.5 m, transporting to site, spreading, grading to required slope and compacting to meet requirement of Tables 300.1 and 300.2 as per Technical Specification Clause 301.5 and as directed by engineer in-charge.', 'CUM', 328.040, 480.00, 157459.20, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(844, 1, '4.28', 'Doing load test on bridge span as per IRC code provision, inclusive of mobilization, loading, field measurement & submission of report complete in all respect as per direction of engineer in-charge. ', 'SPAN', 1.000, 90000.00, 90000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(845, 1, '4.29', 'Environmental Monitoring Cost', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(846, 1, '4.30', 'Pre-Construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(847, 1, '4.31', 'Ambient Air Quality Monitoring', 'Nr.', 2.000, 8000.00, 16000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(848, 1, '4.32', 'Ambient noise level Monitoring', 'Nr.', 2.000, 4500.00, 9000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(849, 1, '4.33', 'Water quality monitoring of Surface Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(850, 1, '4.34', 'Water quality monitoring of Drinking Water ', 'Nr.', 1.000, 4000.00, 4000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(851, 1, '4.35', 'During construction', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(852, 1, '4.36', 'Ambient Air Quality Monitoring', 'Nr.', 6.000, 8000.00, 48000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(853, 1, '4.37', 'Ambient noise level Monitoring', 'Nr.', 6.000, 4500.00, 27000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(854, 1, '4.38', 'Water quality monitoring of river/Stream water (Upstream and Downstream) ', 'Nr.', 6.000, 4000.00, 24000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(855, 1, '4.39', 'Water quality monitoring of Drinking Water ', 'Nr.', 2.000, 4000.00, 8000.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(856, 1, '4.40', 'Water sprinkling by water tanker to minimize the dust pollution during construction activities. ', 'Hrs.', 60.000, 330.00, 19800.00, '2025-08-12 00:13:56', '2025-08-12 00:13:56', NULL),
(857, 1, '4.41', 'hasgdjhfgasjh', NULL, NULL, NULL, NULL, '2025-08-12 00:13:56', '2025-08-12 00:14:09', '2025-08-12 00:14:09');

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
('c6be2cf7c13d9a527ee2fe401bbae3c7', 'i:4;', 1754974680),
('c6be2cf7c13d9a527ee2fe401bbae3c7:timer', 'i:1754974680;', 1754974680);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contraction_phases`
--

INSERT INTO `contraction_phases` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pre Construction', '2025-08-11 06:04:09', '2025-08-11 10:50:20', NULL),
(2, 'During Construction', '2025-08-11 06:04:25', '2025-08-11 10:50:30', NULL),
(3, 'Post Construction', '2025-08-11 06:04:37', '2025-08-11 10:50:38', NULL),
(4, 'demo', '2025-08-11 06:05:32', '2025-08-11 06:05:36', '2025-08-11 06:05:36');

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
  `count_sub_project` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `contract_number`, `project_id`, `contract_value`, `security`, `signing_date`, `commencement_date`, `initial_completion_date`, `revised_completion_date`, `actual_completion_date`, `contract_document`, `contractor_id`, `count_sub_project`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'CT-2023-21', 1, 10000.00, 2100.00, '2025-08-11', '2025-08-11', '2025-08-11', NULL, '2025-08-11', NULL, 1, 5, '2025-08-11 00:56:57', '2025-08-11 00:56:57', NULL);

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
-- Table structure for table `epcentry_data`
--

CREATE TABLE `epcentry_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_package_project_id` bigint(20) UNSIGNED NOT NULL,
  `sl_no` varchar(255) NOT NULL,
  `item_description` text NOT NULL,
  `percent` decimal(5,2) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `epcentry_data`
--

INSERT INTO `epcentry_data` (`id`, `sub_package_project_id`, `sl_no`, `item_description`, `percent`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 1, '1', 'demo', 88.00, 10.00, '2025-08-11 04:55:45', '2025-08-11 04:55:45', NULL),
(9, 1, '2', 'demo', 12.00, 1990.00, '2025-08-11 04:55:59', '2025-08-11 04:55:59', NULL),
(10, 2, '1', 'demo', 100.00, 9.00, '2025-08-11 05:04:10', '2025-08-11 05:05:51', NULL),
(11, 5, '1', 'test', 55.00, 1000.00, '2025-08-11 23:49:59', '2025-08-11 23:49:59', NULL),
(12, 5, '2', 'test2', 60.00, 3000.00, '2025-08-11 23:50:18', '2025-08-11 23:50:18', NULL);

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
(29, '2025_08_08_095338_create_contracts_table', 15),
(30, '2025_08_10_105526_create_sub_package_projects_table', 16),
(31, '2025_08_10_105655_add_count_sub_project_to_contracts_table', 17),
(32, '2025_08_11_063922_create_boqentry_data_table', 18),
(33, '2025_08_11_095349_create_epcentry_data_table', 19),
(34, '2025_08_11_104749_create_contraction_phases_table', 20),
(35, '2025_08_11_104855_create_safeguard_compliances_table', 21),
(36, '2025_08_11_114614_create_safeguard_entries_table', 22),
(37, '2025_08_12_044432_add_username_to_users_table', 23);

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
(6, 1, 'Request for Proposals', 'EPC', '2025-08-01', 'procurement_docs/5I89Jb7KQxHh9oGgRS8zXmec01369fwS4qVyANA8.pdf', 20.00, 30.00, 40, 120, '2025-08-08 02:15:42', '2025-08-11 10:35:54', NULL);

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
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safeguard_entries`
--

INSERT INTO `safeguard_entries` (`id`, `sub_package_project_id`, `safeguard_compliance_id`, `contraction_phase_id`, `sl_no`, `item_description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '1', 'Safety Helmet', '2025-08-11 06:46:30', '2025-08-11 06:46:30', NULL),
(2, 1, 1, 1, '2.1', 'High-Visibility Jacket', '2025-08-11 06:46:30', '2025-08-11 06:46:30', NULL),
(3, 1, 1, 1, '2', 'Protective Gloves', '2025-08-11 06:46:30', '2025-08-11 06:46:30', NULL),
(4, 1, 1, 1, '1.1', 'demo', '2025-08-11 10:27:16', '2025-08-11 10:27:16', NULL),
(5, 1, 1, 1, '2.2', 'demo', '2025-08-11 10:30:12', '2025-08-11 10:31:15', '2025-08-11 10:31:15');

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
('xDGn46DwDhOE6WBa9klI2eNiXxmGFFj2peKHAMKj', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVWNOTUFDeDlxUG1Fbm5vNWVpYUZtdFVHa2tBVVRNdllKc2dSbHJneCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9lcGNlbnRyeV9kYXRhP3N1Yl9wYWNrYWdlX3Byb2plY3RfaWQ9MSI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJEhhZzlvUzBiMjI2aXc5TGJvMkh2QWVlcFU5QU5NeE5McFIyanJjWG1uNXRxSEcvaDhuRnRpIjt9', 1754980757);

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
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_package_projects`
--

INSERT INTO `sub_package_projects` (`id`, `project_id`, `name`, `contract_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Premnagar Bridge', 2000.00, '2025-08-11 00:56:57', '2025-08-11 00:56:57', NULL),
(2, 1, 'Premnagar Bridge 1', 2000.00, '2025-08-11 00:56:57', '2025-08-11 00:56:57', NULL),
(3, 1, 'Premnagar Bridge 2', 2000.00, '2025-08-11 00:56:57', '2025-08-11 00:56:57', NULL),
(4, 1, 'Premnagar Bridge 3', 2000.00, '2025-08-11 00:56:57', '2025-08-11 00:56:57', NULL),
(5, 1, 'Premnagar Bridge 4', 2000.00, '2025-08-11 00:56:57', '2025-08-11 00:56:57', NULL);

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
(3, 3, 'Test User ', 'testuser2@example.com', 'test_user_', '2025-08-04 11:12:58', '$2y$12$Hag9oS0b226iw9Lbo2HvAeepU9ANMxNLpR2jrcXmn5tqHG/h8nFti', NULL, NULL, NULL, 'lVIgKKTMvP9XmN3fEWic72gBcPRDBkqWuDYyQq0GT6sW212p3eOC6EkEFbmk', NULL, 'profile-photos/ecfCBGtLogkZ4bqlPAJwgbgPxsmSvtdOG2AHxDXp.png', '2025-08-04 11:12:58', '2025-08-11 05:56:59', 1, 10, 'male', '9090909090', 'active', 'Dehradun', NULL),
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
-- AUTO_INCREMENT for table `boqentry_data`
--
ALTER TABLE `boqentry_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=858;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
-- AUTO_INCREMENT for table `safeguard_compliances`
--
ALTER TABLE `safeguard_compliances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `safeguard_entries`
--
ALTER TABLE `safeguard_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sub_package_projects`
--
ALTER TABLE `sub_package_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `safeguard_entries`
--
ALTER TABLE `safeguard_entries`
  ADD CONSTRAINT `safeguard_entries_contraction_phase_id_foreign` FOREIGN KEY (`contraction_phase_id`) REFERENCES `contraction_phases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safeguard_entries_safeguard_compliance_id_foreign` FOREIGN KEY (`safeguard_compliance_id`) REFERENCES `safeguard_compliances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safeguard_entries_sub_package_project_id_foreign` FOREIGN KEY (`sub_package_project_id`) REFERENCES `sub_package_projects` (`id`) ON DELETE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
