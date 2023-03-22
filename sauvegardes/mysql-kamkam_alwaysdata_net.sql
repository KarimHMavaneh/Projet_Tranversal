-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-kamkam.alwaysdata.net
-- Generation Time: Mar 21, 2023 at 04:52 PM
-- Server version: 10.6.11-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kamkam_testlink_1_9_20`
--
CREATE DATABASE IF NOT EXISTS `kamkam_testlink_1_9_20` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kamkam_testlink_1_9_20`;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_status`
--

CREATE TABLE `assignment_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `assignment_status`
--

INSERT INTO `assignment_status` (`id`, `description`) VALUES
(1, 'open'),
(2, 'closed'),
(3, 'completed'),
(4, 'todo_urgent'),
(5, 'todo');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_types`
--

CREATE TABLE `assignment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `assignment_types`
--

INSERT INTO `assignment_types` (`id`, `fk_table`, `description`) VALUES
(1, 'testplan_tcversions', 'testcase_execution'),
(2, 'tcversions', 'testcase_review');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longblob DEFAULT NULL,
  `compression_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baseline_l1l2_context`
--

CREATE TABLE `baseline_l1l2_context` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `being_exec_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_exec_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baseline_l1l2_details`
--

CREATE TABLE `baseline_l1l2_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `context_id` int(10) UNSIGNED NOT NULL,
  `top_tsuite_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `child_tsuite_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_tc` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `builds`
--

CREATE TABLE `builds` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  `commit_id` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `branch` varchar(64) DEFAULT NULL,
  `release_candidate` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Available builds';

--
-- Dumping data for table `builds`
--

INSERT INTO `builds` (`id`, `testplan_id`, `name`, `notes`, `active`, `is_open`, `author_id`, `creation_ts`, `release_date`, `closed_on_date`, `commit_id`, `tag`, `branch`, `release_candidate`) VALUES
(4, 47, 'version 1', '<p>Build lot1</p>\r\n', 1, 1, NULL, '2023-03-10 13:28:44', '2023-03-13', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cfield_build_design_values`
--

CREATE TABLE `cfield_build_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_design_values`
--

CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_execution_values`
--

CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `execution_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `tcversion_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_node_types`
--

CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_type_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_testplan_design_values`
--

CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cfield_testprojects`
--

CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `testproject_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `display_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `location` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_design` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_execution` tinyint(1) NOT NULL DEFAULT 0,
  `monitorable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codetrackers`
--

CREATE TABLE `codetrackers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT 0,
  `length_max` int(10) NOT NULL DEFAULT 0,
  `show_on_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `enable_on_testplan_design` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_version`
--

CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `db_version`
--

INSERT INTO `db_version` (`version`, `upgrade_ts`, `notes`) VALUES
('DB 1.9.20', '2023-03-07 15:55:09', 'TestLink 1.9.20 Raijin');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `log_level` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) UNSIGNED DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(1, 1, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:38:\"2a04:cec0:110c:3eaf:c0a:fdd8:6104:264c\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678205128, 'LOGIN', 1, 'users'),
(2, 2, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678364398, 'LOGIN', 1, 'users'),
(3, 3, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:39:\"2a04:cec0:1102:9204:6877:5518:fe5a:7ad7\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678364417, 'LOGIN', 1, 'users'),
(4, 4, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678364555, 'LOGIN_FAILED', 1, 'users'),
(5, 5, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678364563, 'LOGIN', 1, 'users'),
(6, 6, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678364662, 'LOGOUT', 1, 'users'),
(7, 7, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678364671, 'LOGIN', 1, 'users'),
(8, 8, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678376689, 'CREATE', 1, 'testprojects'),
(9, 9, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678376726, 'LOGOUT', 1, 'users'),
(10, 10, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678376736, 'LOGIN', 1, 'users'),
(11, 11, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678376783, 'PHP', 0, NULL),
(12, 12, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678376783, 'LOGOUT', 1, 'users'),
(13, 13, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678376784, 'PHP', 0, NULL),
(14, 14, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678376785, 'PHP', 0, NULL),
(15, 15, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678376786, 'PHP', 0, NULL),
(16, 16, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678376792, 'LOGIN', 1, 'users'),
(17, 17, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678376837, 'PHP', 0, NULL),
(18, 18, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678376838, 'PHP', 0, NULL),
(19, 19, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678376888, 'UPDATE', 1, 'testprojects'),
(20, 20, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678376926, 'PHP', 0, NULL),
(21, 21, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678376927, 'PHP', 0, NULL),
(22, 22, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678376962, 'PHP', 0, NULL),
(23, 23, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678377278, 'UPDATE', 1, 'testprojects'),
(24, 24, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678377282, 'PHP', 0, NULL),
(25, 25, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678377283, 'PHP', 0, NULL),
(26, 26, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678377310, 'PHP', 0, NULL),
(27, 27, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678377328, 'UPDATE', 1, 'testprojects'),
(28, 28, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678377342, 'PHP', 0, NULL),
(29, 29, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678377343, 'PHP', 0, NULL),
(30, 30, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678377347, 'PHP', 0, NULL),
(31, 31, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678377469, 'PHP', 0, NULL),
(32, 32, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678377471, 'PHP', 0, NULL),
(33, 33, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678377472, 'PHP', 0, NULL),
(34, 34, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678377497, 'LOGOUT', 1, 'users'),
(35, 35, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:38:\"2001:861:3382:b0c0:95bf:8d1e:b783:4b91\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678391170, 'LOGIN', 1, 'users'),
(36, 36, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:34:\"Initialisation_la_fiche_de_demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678391717, 'CREATE', 2, 'req_specs'),
(37, 37, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:5:\"EX_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678392162, 'CREATE', 4, 'requirements'),
(38, 37, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678392162, 'PHP', 0, NULL),
(39, 38, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678392227, 'UPDATE', 1, 'testprojects'),
(40, 39, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678394390, 'PHP', 0, NULL),
(41, 40, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678394419, 'PHP', 0, NULL),
(42, 41, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678394556, 'PHP', 0, NULL),
(43, 42, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678394568, 'PHP', 0, NULL),
(44, 43, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678394574, 'PHP', 0, NULL),
(45, 44, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678394574, 'PHP', 0, NULL),
(46, 45, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:22:\"Initialiser la demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678395226, 'CREATE', 8, 'testprojects'),
(47, 46, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:24:\"Traitement_de_la_demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678395259, 'CREATE', 15, 'req_specs'),
(48, 47, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:7:\"EX_02.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678395596, 'CREATE', 17, 'requirements'),
(49, 47, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678395596, 'PHP', 0, NULL),
(50, 48, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678395986, 'LOGOUT', 1, 'users'),
(51, 49, 16, 'GUI - Test Project ID : 8', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678435693, 'LOGIN', 1, 'users'),
(52, 50, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678435733, 'PHP', 0, NULL),
(53, 50, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678435733, 'PHP', 0, NULL),
(54, 51, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678436404, 'PHP', 0, NULL),
(55, 51, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678436404, 'PHP', 0, NULL),
(56, 52, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678436902, 'PHP', 0, NULL),
(57, 52, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678436902, 'PHP', 0, NULL),
(58, 53, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:40:\"audit_all_user_roles_removed_testproject\";s:6:\"params\";a:1:{i:0;s:22:\"Initialiser la demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678436920, 'ASSIGN', 8, 'testprojects'),
(59, 53, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_deleted\";s:6:\"params\";a:1:{i:0;s:22:\"Initialiser la demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678436920, 'DELETE', 8, 'testprojects'),
(60, 54, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678436928, 'PHP', 0, NULL),
(61, 54, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678436928, 'PHP', 0, NULL),
(62, 55, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:22:\"Initialiser la demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678437016, 'CREATED', 19, 'testplans'),
(63, 56, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678438862, 'PHP', 0, NULL),
(64, 56, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678438862, 'PHP', 0, NULL),
(65, 57, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678438931, 'PHP', 0, NULL),
(66, 57, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678438931, 'PHP', 0, NULL),
(67, 57, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678438931, 'PHP', 0, NULL),
(68, 58, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:24:\"1-Initialiser la demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678438945, 'SAVE', 19, 'testplans'),
(69, 59, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678438948, 'PHP', 0, NULL),
(70, 59, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678438948, 'PHP', 0, NULL),
(71, 60, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:37:\"2-Traiter la demande (droits d\'acces)\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678439065, 'CREATED', 20, 'testplans'),
(72, 61, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678439067, 'PHP', 0, NULL),
(73, 61, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678439067, 'PHP', 0, NULL),
(74, 62, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:31:\"3-Traiter la demande (materiel)\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678439125, 'CREATED', 21, 'testplans'),
(75, 63, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678439130, 'PHP', 0, NULL),
(76, 63, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678439130, 'PHP', 0, NULL),
(77, 63, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678439130, 'PHP', 0, NULL),
(78, 64, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678439489, 'PHP', 0, NULL),
(79, 64, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678439489, 'PHP', 0, NULL),
(80, 64, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678439489, 'PHP', 0, NULL),
(81, 65, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$creation_ts - in /home/kamkam/www/testlink_1_9_20/lib/plan/buildEdit.php - Line 390', 1678439530, 'PHP', 0, NULL),
(82, 65, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:24:\"1-Initialiser la demande\";i:2;s:30:\"BUILD_1_Intilaiser la demande \";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678439530, 'CREATE', 1, 'builds'),
(83, 66, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$creation_ts - in /home/kamkam/www/testlink_1_9_20/lib/plan/buildEdit.php - Line 390', 1678439569, 'PHP', 0, NULL),
(84, 66, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:37:\"2-Traiter la demande (droits d\'acces)\";i:2;s:43:\"BUILD_2_Traiter la demande (droits d\'acces)\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678439569, 'CREATE', 2, 'builds'),
(85, 67, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$creation_ts - in /home/kamkam/www/testlink_1_9_20/lib/plan/buildEdit.php - Line 390', 1678439597, 'PHP', 0, NULL),
(86, 67, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:31:\"3-Traiter la demande (materiel)\";i:2;s:37:\"BUILD_3_Traiter la demande (materiel)\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678439597, 'CREATE', 3, 'builds'),
(87, 68, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439636, 'PHP', 0, NULL),
(88, 69, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678439637, 'PHP', 0, NULL),
(89, 70, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439679, 'PHP', 0, NULL),
(90, 71, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439811, 'PHP', 0, NULL),
(91, 72, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439875, 'PHP', 0, NULL),
(92, 73, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439898, 'PHP', 0, NULL),
(93, 74, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439911, 'PHP', 0, NULL),
(94, 75, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678439937, 'PHP', 0, NULL),
(95, 76, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678442032, 'LOGIN', 1, 'users'),
(96, 77, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678442066, 'LOGIN', 1, 'users'),
(97, 78, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678442541, 'PHP', 0, NULL),
(98, 79, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678442541, 'PHP', 0, NULL),
(99, 80, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678442648, 'PHP', 0, NULL),
(100, 81, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678442648, 'PHP', 0, NULL),
(101, 82, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:4:\"TOTO\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678442894, 'CREATE', 26, 'req_specs'),
(102, 83, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678443189, 'PHP', 0, NULL),
(103, 84, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678443190, 'PHP', 0, NULL),
(104, 85, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678443363, 'PHP', 0, NULL),
(105, 86, 2, 'GUI - Test Project ID : 1', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678443364, 'PHP', 0, NULL),
(106, 87, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:37:\"audit_all_user_roles_removed_testplan\";s:6:\"params\";a:1:{i:0;s:24:\"1-Initialiser la demande\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678444961, 'ASSIGN', 19, 'testplans'),
(107, 87, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:37:\"audit_all_user_roles_removed_testplan\";s:6:\"params\";a:1:{i:0;s:37:\"2-Traiter la demande (droits d\'acces)\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678444961, 'ASSIGN', 20, 'testplans'),
(108, 87, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:37:\"audit_all_user_roles_removed_testplan\";s:6:\"params\";a:1:{i:0;s:31:\"3-Traiter la demande (materiel)\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678444961, 'ASSIGN', 21, 'testplans'),
(109, 87, 16, 'GUI - Test Project ID : 1', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:40:\"audit_all_user_roles_removed_testproject\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678444961, 'ASSIGN', 1, 'testprojects'),
(110, 87, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_deleted\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678444961, 'DELETE', 1, 'testprojects'),
(111, 88, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678445079, 'CREATE', 28, 'testprojects'),
(112, 89, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined offset: 0 - in /home/kamkam/www/testlink_1_9_20/lib/general/navBar.php - Line 160', 1678445079, 'PHP', 0, NULL),
(113, 89, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined offset: 0 - in /home/kamkam/www/testlink_1_9_20/lib/general/navBar.php - Line 161', 1678445079, 'PHP', 0, NULL),
(114, 90, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:43:\"1.1Accéder aux fiches de poste par métier\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678445275, 'CREATE', 29, 'req_specs'),
(115, 91, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678450103, 'LOGIN', 1, 'users'),
(116, 92, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqSpecEdit.php - Line 213', 1678450523, 'PHP', 0, NULL),
(117, 93, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678450987, 'CREATE', 32, 'requirements'),
(118, 93, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678450987, 'PHP', 0, NULL),
(119, 94, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678451216, 'CREATE', 34, 'requirements'),
(120, 94, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678451216, 'PHP', 0, NULL),
(121, 95, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452073, 'PHP', 0, NULL),
(122, 96, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452074, 'PHP', 0, NULL),
(123, 97, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452100, 'PHP', 0, NULL),
(124, 98, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452113, 'PHP', 0, NULL),
(125, 99, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452114, 'PHP', 0, NULL),
(126, 100, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452138, 'PHP', 0, NULL),
(127, 101, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452142, 'PHP', 0, NULL),
(128, 102, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452148, 'PHP', 0, NULL),
(129, 103, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452171, 'PHP', 0, NULL),
(130, 104, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452172, 'PHP', 0, NULL),
(131, 105, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452213, 'PHP', 0, NULL),
(132, 106, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452214, 'PHP', 0, NULL),
(133, 107, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452537, 'PHP', 0, NULL),
(134, 108, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678452538, 'PHP', 0, NULL),
(135, 109, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452653, 'PHP', 0, NULL),
(136, 110, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678452882, 'PHP', 0, NULL),
(137, 110, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678452882, 'LOCALIZATION', 0, NULL),
(138, 110, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678452882, 'LOCALIZATION', 0, NULL),
(139, 110, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678452882, 'LOCALIZATION', 0, NULL),
(140, 111, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678452882, 'PHP', 0, NULL),
(141, 112, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678453333, 'PHP', 0, NULL),
(142, 113, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678453588, 'PHP', 0, NULL),
(143, 114, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678453588, 'PHP', 0, NULL),
(144, 115, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678453729, 'PHP', 0, NULL),
(145, 116, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678453729, 'PHP', 0, NULL),
(146, 117, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678453929, 'PHP', 0, NULL),
(147, 118, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678453957, 'PHP', 0, NULL),
(148, 119, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678454000, 'PHP', 0, NULL),
(149, 120, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:43:\"1.1Accéder aux fiches de poste par métier\";i:1;s:1:\"1\";i:2;s:26:\"Choisir une fiche de poste\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454219, 'ASSIGN', 0, NULL),
(150, 120, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:53:\"1.2Transférer la fiche de poste au manager d\'équipe\";i:1;s:1:\"1\";i:2;s:26:\"Choisir une fiche de poste\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454219, 'ASSIGN', 0, NULL),
(151, 121, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1678454240, NULL, 0, NULL),
(152, 122, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678454248, 'PHP', 0, NULL),
(153, 122, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678454248, 'PHP', 0, NULL),
(154, 123, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454426, 'CREATED', 47, 'testplans'),
(155, 124, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678454461, 'PHP', 0, NULL),
(156, 125, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678454462, 'PHP', 0, NULL),
(157, 126, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:43:\"1.1Accéder aux fiches de poste par métier\";i:1;s:1:\"1\";i:2;s:28:\"Transferer la fiche de poste\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454600, 'ASSIGN', 0, NULL),
(158, 126, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:53:\"1.2Transférer la fiche de poste au manager d\'équipe\";i:1;s:1:\"1\";i:2;s:28:\"Transferer la fiche de poste\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454600, 'ASSIGN', 0, NULL),
(159, 127, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1678454605, NULL, 0, NULL),
(160, 128, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678454656, 'PHP', 0, NULL),
(161, 129, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:36:\"BQTSI-1 : Choisir une fiche de poste\";i:1;s:1:\"1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454749, 'ASSIGN', 47, 'testplans'),
(162, 129, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:38:\"BQTSI-2 : Transferer la fiche de poste\";i:1;s:1:\"1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454749, 'ASSIGN', 47, 'testplans'),
(163, 130, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678454749, 'PHP', 0, NULL),
(164, 131, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678454778, 'PHP', 0, NULL),
(165, 132, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:30:\"audit_tc_removed_from_testplan\";s:6:\"params\";a:3:{i:0;s:36:\"BQTSI-1 : Choisir une fiche de poste\";i:1;s:1:\"1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454794, 'UNASSIGN', 47, 'testplans'),
(166, 132, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:30:\"audit_tc_removed_from_testplan\";s:6:\"params\";a:3:{i:0;s:38:\"BQTSI-2 : Transferer la fiche de poste\";i:1;s:1:\"1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454794, 'UNASSIGN', 47, 'testplans'),
(167, 133, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678454794, 'PHP', 0, NULL),
(168, 134, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678454799, 'PHP', 0, NULL),
(169, 135, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$creation_ts - in /home/kamkam/www/testlink_1_9_20/lib/plan/buildEdit.php - Line 390', 1678454924, 'PHP', 0, NULL),
(170, 135, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:23:\"Tests projet BQTSI lot1\";i:2;s:9:\"version 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678454924, 'CREATE', 4, 'builds'),
(171, 136, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678455122, 'PHP', 0, NULL),
(172, 136, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678455122, 'PHP', 0, NULL),
(173, 136, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678455122, 'PHP', 0, NULL),
(174, 137, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678455155, 'SAVE', 47, 'testplans'),
(175, 138, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678455178, 'PHP', 0, NULL),
(176, 138, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678455178, 'PHP', 0, NULL),
(177, 138, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678455178, 'PHP', 0, NULL),
(178, 139, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678455223, 'PHP', 0, NULL),
(179, 140, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678455245, 'PHP', 0, NULL),
(180, 141, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678455256, 'PHP', 0, NULL),
(181, 142, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:36:\"BQTSI-1 : Choisir une fiche de poste\";i:1;s:1:\"1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678455261, 'ASSIGN', 47, 'testplans'),
(182, 142, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:38:\"BQTSI-2 : Transferer la fiche de poste\";i:1;s:1:\"1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678455261, 'ASSIGN', 47, 'testplans'),
(183, 143, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678455261, 'PHP', 0, NULL),
(184, 144, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678455263, 'PHP', 0, NULL),
(185, 145, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"BQTSI-1\";i:1;s:9:\"version 1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678455409, 'CREATE', 1, 'execution'),
(186, 146, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"BQTSI-2\";i:1;s:9:\"version 1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678455450, 'CREATE', 2, 'execution'),
(187, 147, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: items2loop - in /home/kamkam/www/testlink_1_9_20/lib/results/resultsGeneral.php - Line 65', 1678455519, 'PHP', 0, NULL),
(188, 147, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nInvalid argument supplied for foreach() - in /home/kamkam/www/testlink_1_9_20/lib/results/resultsGeneral.php - Line 65', 1678455519, 'PHP', 0, NULL),
(189, 148, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678455782, 'PHP', 0, NULL),
(190, 148, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678455782, 'PHP', 0, NULL),
(191, 148, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678455782, 'PHP', 0, NULL),
(192, 149, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678455790, 'PHP', 0, NULL),
(193, 149, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678455790, 'PHP', 0, NULL),
(194, 149, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678455790, 'PHP', 0, NULL),
(195, 150, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678456168, 'PHP', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(196, 151, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678456169, 'PHP', 0, NULL),
(197, 152, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678456228, 'PHP', 0, NULL),
(198, 152, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678456228, 'PHP', 0, NULL),
(199, 152, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678456228, 'PHP', 0, NULL),
(200, 153, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:54:\"1.3 valider la fiche de poste transmise par manager RH\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678456796, 'CREATE', 48, 'req_specs'),
(201, 154, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_deleted\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:54:\"1.3 valider la fiche de poste transmise par manager RH\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678456810, 'DELETE', 48, 'req_specs'),
(202, 155, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:54:\"1.3 valider la fiche de poste transmise par manager RH\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678456845, 'CREATE', 50, 'req_specs'),
(203, 156, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_deleted\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:54:\"1.3 valider la fiche de poste transmise par manager RH\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678456859, 'DELETE', 50, 'req_specs'),
(204, 157, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678456932, 'CREATE', 52, 'requirements'),
(205, 157, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678456932, 'PHP', 0, NULL),
(206, 158, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678457264, 'PHP', 0, NULL),
(207, 159, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678457265, 'PHP', 0, NULL),
(208, 160, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678457304, 'LOCALIZATION', 0, NULL),
(209, 160, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678457304, 'LOCALIZATION', 0, NULL),
(210, 160, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678457304, 'LOCALIZATION', 0, NULL),
(211, 161, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678457610, 'SAVE', 52, 'requirements'),
(212, 161, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678457610, 'PHP', 0, NULL),
(213, 162, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$freezeLinkOnNewReqVersion - in /home/kamkam/www/testlink_1_9_20/lib/functions/requirement_mgr.class.php - Line 2466', 1678457704, 'PHP', 0, NULL),
(214, 162, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678457704, 'PHP', 0, NULL),
(215, 163, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678457705, 'PHP', 0, NULL),
(216, 164, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678457705, 'PHP', 0, NULL),
(217, 165, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678457821, 'SAVE', 32, 'requirements'),
(218, 165, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678457821, 'PHP', 0, NULL),
(219, 166, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$freezeLinkOnNewReqVersion - in /home/kamkam/www/testlink_1_9_20/lib/functions/requirement_mgr.class.php - Line 2466', 1678457845, 'PHP', 0, NULL),
(220, 166, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678457845, 'PHP', 0, NULL),
(221, 167, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_deleted\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678457869, 'DELETE', 34, 'requirements'),
(222, 168, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678457900, 'PHP', 0, NULL),
(223, 169, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678457901, 'PHP', 0, NULL),
(224, 170, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678457917, 'PHP', 0, NULL),
(225, 171, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678457918, 'PHP', 0, NULL),
(226, 172, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678457926, 'SAVE', 52, 'requirements'),
(227, 172, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678457926, 'PHP', 0, NULL),
(228, 173, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678457928, 'LOGOUT', 1, 'users'),
(229, 174, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678457933, 'LOGIN', 1, 'users'),
(230, 175, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678457938, 'PHP', 0, NULL),
(231, 176, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678457939, 'PHP', 0, NULL),
(232, 177, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678458055, 'SAVE', 52, 'requirements'),
(233, 177, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678458055, 'PHP', 0, NULL),
(234, 178, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678458077, 'SAVE', 52, 'requirements'),
(235, 178, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1678458077, 'PHP', 0, NULL),
(236, 179, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678458086, 'PHP', 0, NULL),
(237, 180, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678458087, 'PHP', 0, NULL),
(238, 181, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678458302, 'PHP', 0, NULL),
(239, 182, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678458302, 'PHP', 0, NULL),
(240, 183, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:13:\"79.87.130.217\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678612644, 'LOGIN', 1, 'users'),
(241, 184, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678612655, 'PHP', 0, NULL),
(242, 185, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678612656, 'PHP', 0, NULL),
(243, 186, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678616821, 'PHP', 0, NULL),
(244, 187, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678616822, 'PHP', 0, NULL),
(245, 188, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678616823, 'LOCALIZATION', 0, NULL),
(246, 188, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678616823, 'LOCALIZATION', 0, NULL),
(247, 188, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678616823, 'LOCALIZATION', 0, NULL),
(248, 189, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617635, 'PHP', 0, NULL),
(249, 190, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678617636, 'PHP', 0, NULL),
(250, 191, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617845, 'PHP', 0, NULL),
(251, 192, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617851, 'PHP', 0, NULL),
(252, 193, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617911, 'PHP', 0, NULL),
(253, 194, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617916, 'PHP', 0, NULL),
(254, 195, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617921, 'PHP', 0, NULL),
(255, 196, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678617924, 'PHP', 0, NULL),
(256, 197, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testcase_deleted\";s:6:\"params\";a:1:{i:0;s:7:\"BQTSI-2\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678618446, 'DELETE', 42, 'testcases'),
(257, 198, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678618446, 'PHP', 0, NULL),
(258, 199, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678618500, 'PHP', 0, NULL),
(259, 200, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678618500, 'PHP', 0, NULL),
(260, 201, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678618998, 'PHP', 0, NULL),
(261, 201, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678618998, 'PHP', 0, NULL),
(262, 202, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619019, 'PHP', 0, NULL),
(263, 203, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619020, 'PHP', 0, NULL),
(264, 203, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678619020, 'PHP', 0, NULL),
(265, 204, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619020, 'PHP', 0, NULL),
(266, 204, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678619020, 'PHP', 0, NULL),
(267, 205, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619035, 'PHP', 0, NULL),
(268, 206, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619035, 'PHP', 0, NULL),
(269, 207, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678619156, 'PHP', 0, NULL),
(270, 208, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678619187, 'PHP', 0, NULL),
(271, 209, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678619195, 'PHP', 0, NULL),
(272, 210, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678619200, 'PHP', 0, NULL),
(273, 211, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678619211, 'PHP', 0, NULL),
(274, 212, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619296, 'PHP', 0, NULL),
(275, 213, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678619296, 'PHP', 0, NULL),
(276, 214, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:7:\"BQTSI-1\";i:1;s:9:\"version 1\";i:2;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678619430, 'CREATE', 3, 'execution'),
(277, 215, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1678619527, 'PHP', 0, NULL),
(278, 216, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: items2loop - in /home/kamkam/www/testlink_1_9_20/lib/results/resultsGeneral.php - Line 65', 1678619545, 'PHP', 0, NULL),
(279, 216, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nInvalid argument supplied for foreach() - in /home/kamkam/www/testlink_1_9_20/lib/results/resultsGeneral.php - Line 65', 1678619545, 'PHP', 0, NULL),
(280, 217, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678619690, 'PHP', 0, NULL),
(281, 218, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678619690, 'PHP', 0, NULL),
(282, 219, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678620904, 'PHP', 0, NULL),
(283, 220, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678620905, 'PHP', 0, NULL),
(284, 221, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678650568, 'PHP', 0, NULL),
(285, 222, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678650568, 'PHP', 0, NULL),
(286, 223, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678781925, 'LOGIN', 1, 'users'),
(287, 224, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678781960, 'PHP', 0, NULL),
(288, 225, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678781961, 'PHP', 0, NULL),
(289, 226, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678781965, 'LOCALIZATION', 0, NULL),
(290, 226, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678781965, 'LOCALIZATION', 0, NULL),
(291, 226, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678781965, 'LOCALIZATION', 0, NULL),
(292, 227, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678782195, 'PHP', 0, NULL),
(293, 228, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678782196, 'PHP', 0, NULL),
(294, 229, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678782599, 'PHP', 0, NULL),
(295, 230, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782798, 'PHP', 0, NULL),
(296, 230, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782798, 'PHP', 0, NULL),
(297, 231, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782838, 'PHP', 0, NULL),
(298, 231, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782838, 'PHP', 0, NULL),
(299, 232, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782852, 'PHP', 0, NULL),
(300, 232, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782852, 'PHP', 0, NULL),
(301, 233, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782873, 'PHP', 0, NULL),
(302, 234, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782880, 'PHP', 0, NULL),
(303, 235, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782881, 'PHP', 0, NULL),
(304, 235, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782881, 'PHP', 0, NULL),
(305, 236, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782882, 'PHP', 0, NULL),
(306, 236, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782882, 'PHP', 0, NULL),
(307, 237, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782882, 'PHP', 0, NULL),
(308, 237, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782882, 'PHP', 0, NULL),
(309, 238, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782884, 'PHP', 0, NULL),
(310, 238, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782884, 'PHP', 0, NULL),
(311, 239, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678782884, 'PHP', 0, NULL),
(312, 239, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678782884, 'PHP', 0, NULL),
(313, 240, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783021, 'PHP', 0, NULL),
(314, 241, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783096, 'PHP', 0, NULL),
(315, 242, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783100, 'PHP', 0, NULL),
(316, 242, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678783100, 'PHP', 0, NULL),
(317, 243, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678783432, 'LOGIN', 1, 'users'),
(318, 244, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783437, 'PHP', 0, NULL),
(319, 244, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678783437, 'PHP', 0, NULL),
(320, 245, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783440, 'PHP', 0, NULL),
(321, 246, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678783443, 'PHP', 0, NULL),
(322, 246, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678783443, 'PHP', 0, NULL),
(323, 246, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678783443, 'PHP', 0, NULL),
(324, 247, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783444, 'PHP', 0, NULL),
(325, 247, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1678783444, 'PHP', 0, NULL),
(326, 248, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1678783454, 'PHP', 0, NULL),
(327, 249, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678783460, 'PHP', 0, NULL),
(328, 250, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678783461, 'PHP', 0, NULL),
(329, 251, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678783581, 'PHP', 0, NULL),
(330, 252, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678783582, 'PHP', 0, NULL),
(331, 253, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678783582, 'PHP', 0, NULL),
(332, 254, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678783583, 'PHP', 0, NULL),
(333, 255, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678783599, 'LOCALIZATION', 0, NULL),
(334, 255, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678783599, 'LOCALIZATION', 0, NULL),
(335, 255, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678783599, 'LOCALIZATION', 0, NULL),
(336, 256, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678783823, 'PHP', 0, NULL),
(337, 257, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678783916, 'PHP', 0, NULL),
(338, 258, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678783916, 'PHP', 0, NULL),
(339, 259, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678783951, 'PHP', 0, NULL),
(340, 260, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678783951, 'PHP', 0, NULL),
(341, 261, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678784297, 'PHP', 0, NULL),
(342, 262, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678784506, 'PHP', 0, NULL),
(343, 263, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678784581, 'PHP', 0, NULL),
(344, 264, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678784670, 'PHP', 0, NULL),
(345, 265, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678784677, 'PHP', 0, NULL),
(346, 266, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678785122, 'PHP', 0, NULL),
(347, 267, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678785122, 'PHP', 0, NULL),
(348, 268, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678785354, 'PHP', 0, NULL),
(349, 269, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678785355, 'PHP', 0, NULL),
(350, 270, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678785399, 'PHP', 0, NULL),
(351, 271, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678785400, 'PHP', 0, NULL),
(352, 272, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678786387, 'PHP', 0, NULL),
(353, 273, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678786498, 'PHP', 0, NULL),
(354, 274, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678786498, 'PHP', 0, NULL),
(355, 275, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678786547, 'PHP', 0, NULL),
(356, 276, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678786547, 'PHP', 0, NULL),
(357, 277, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678786657, 'PHP', 0, NULL),
(358, 278, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678786658, 'PHP', 0, NULL),
(359, 279, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678786670, 'PHP', 0, NULL),
(360, 280, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678786671, 'PHP', 0, NULL),
(361, 281, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678786740, 'PHP', 0, NULL),
(362, 282, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678786740, 'PHP', 0, NULL),
(363, 283, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678786772, 'PHP', 0, NULL),
(364, 284, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678786772, 'PHP', 0, NULL),
(365, 285, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678787170, 'PHP', 0, NULL),
(366, 286, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678787318, 'PHP', 0, NULL),
(367, 287, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678787327, 'PHP', 0, NULL),
(368, 288, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678787377, 'PHP', 0, NULL),
(369, 289, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678787378, 'PHP', 0, NULL),
(370, 290, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678788596, 'PHP', 0, NULL),
(371, 291, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678788596, 'PHP', 0, NULL),
(372, 292, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678788673, 'PHP', 0, NULL),
(373, 293, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678788680, 'PHP', 0, NULL),
(374, 294, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678788683, 'PHP', 0, NULL),
(375, 295, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678788705, 'PHP', 0, NULL),
(376, 296, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678789091, 'PHP', 0, NULL),
(377, 297, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678789319, 'PHP', 0, NULL),
(378, 298, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678789347, 'PHP', 0, NULL),
(379, 299, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678789596, 'PHP', 0, NULL),
(380, 300, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678789761, 'PHP', 0, NULL),
(381, 301, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678789982, 'PHP', 0, NULL),
(382, 302, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678790062, 'PHP', 0, NULL),
(383, 303, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678791103, 'PHP', 0, NULL),
(384, 304, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678791211, 'PHP', 0, NULL),
(385, 305, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678791491, 'PHP', 0, NULL),
(386, 306, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678791618, 'PHP', 0, NULL),
(387, 307, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678791826, 'PHP', 0, NULL),
(388, 308, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678791826, 'PHP', 0, NULL),
(389, 309, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678792360, 'PHP', 0, NULL),
(390, 310, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796104, 'PHP', 0, NULL),
(391, 311, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796127, 'PHP', 0, NULL),
(392, 312, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796344, 'PHP', 0, NULL),
(393, 313, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678796363, 'PHP', 0, NULL),
(394, 314, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678796364, 'PHP', 0, NULL),
(395, 315, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796394, 'PHP', 0, NULL),
(396, 316, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796444, 'PHP', 0, NULL),
(397, 317, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796459, 'PHP', 0, NULL),
(398, 318, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796485, 'PHP', 0, NULL),
(399, 319, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796570, 'PHP', 0, NULL),
(400, 320, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796577, 'PHP', 0, NULL),
(401, 321, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796585, 'PHP', 0, NULL),
(402, 322, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796667, 'PHP', 0, NULL),
(403, 323, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796679, 'PHP', 0, NULL),
(404, 324, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796850, 'PHP', 0, NULL),
(405, 325, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796879, 'PHP', 0, NULL),
(406, 326, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796883, 'PHP', 0, NULL),
(407, 327, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678796981, 'PHP', 0, NULL),
(408, 328, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678797004, 'PHP', 0, NULL),
(409, 329, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678797005, 'PHP', 0, NULL),
(410, 330, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797051, 'PHP', 0, NULL),
(411, 331, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797070, 'PHP', 0, NULL),
(412, 332, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797077, 'PHP', 0, NULL),
(413, 333, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797139, 'PHP', 0, NULL),
(414, 334, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678797154, 'LOGIN', 1, 'users'),
(415, 335, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678797160, 'PHP', 0, NULL),
(416, 336, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678797161, 'PHP', 0, NULL),
(417, 337, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678797164, 'LOCALIZATION', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(418, 337, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678797164, 'LOCALIZATION', 0, NULL),
(419, 337, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678797164, 'LOCALIZATION', 0, NULL),
(420, 338, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797164, 'PHP', 0, NULL),
(421, 339, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797198, 'PHP', 0, NULL),
(422, 340, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797211, 'PHP', 0, NULL),
(423, 341, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797245, 'PHP', 0, NULL),
(424, 342, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797251, 'PHP', 0, NULL),
(425, 343, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797265, 'PHP', 0, NULL),
(426, 344, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797333, 'PHP', 0, NULL),
(427, 345, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797406, 'PHP', 0, NULL),
(428, 346, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797521, 'PHP', 0, NULL),
(429, 347, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797567, 'PHP', 0, NULL),
(430, 348, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797575, 'PHP', 0, NULL),
(431, 349, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678797715, 'PHP', 0, NULL),
(432, 350, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798000, 'PHP', 0, NULL),
(433, 351, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798189, 'PHP', 0, NULL),
(434, 352, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678798419, 'LOGIN', 1, 'users'),
(435, 353, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678798435, 'PHP', 0, NULL),
(436, 354, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678798435, 'PHP', 0, NULL),
(437, 355, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678798441, 'LOCALIZATION', 0, NULL),
(438, 355, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678798441, 'LOCALIZATION', 0, NULL),
(439, 355, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678798441, 'LOCALIZATION', 0, NULL),
(440, 356, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798547, 'PHP', 0, NULL),
(441, 357, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798547, 'PHP', 0, NULL),
(442, 358, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798666, 'PHP', 0, NULL),
(443, 359, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798689, 'PHP', 0, NULL),
(444, 360, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798798, 'PHP', 0, NULL),
(445, 361, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678798972, 'PHP', 0, NULL),
(446, 362, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678799082, 'PHP', 0, NULL),
(447, 363, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678799086, 'PHP', 0, NULL),
(448, 364, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678799114, 'PHP', 0, NULL),
(449, 365, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678799126, 'PHP', 0, NULL),
(450, 366, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678799245, 'PHP', 0, NULL),
(451, 367, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678802725, 'PHP', 0, NULL),
(452, 368, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678802782, 'PHP', 0, NULL),
(453, 369, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678802845, 'PHP', 0, NULL),
(454, 370, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678802927, 'PHP', 0, NULL),
(455, 371, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678802978, 'PHP', 0, NULL),
(456, 372, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678803044, 'PHP', 0, NULL),
(457, 373, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678803103, 'PHP', 0, NULL),
(458, 374, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678803190, 'PHP', 0, NULL),
(459, 375, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678803227, 'PHP', 0, NULL),
(460, 376, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678803313, 'PHP', 0, NULL),
(461, 377, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678803677, 'PHP', 0, NULL),
(462, 378, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678804789, 'LOGIN', 1, 'users'),
(463, 379, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678804791, 'PHP', 0, NULL),
(464, 380, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678804792, 'PHP', 0, NULL),
(465, 381, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678804794, 'LOCALIZATION', 0, NULL),
(466, 381, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678804794, 'LOCALIZATION', 0, NULL),
(467, 381, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678804794, 'LOCALIZATION', 0, NULL),
(468, 382, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678804844, 'PHP', 0, NULL),
(469, 383, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678804858, 'PHP', 0, NULL),
(470, 384, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678804863, 'PHP', 0, NULL),
(471, 385, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805054, 'PHP', 0, NULL),
(472, 386, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805128, 'PHP', 0, NULL),
(473, 387, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805200, 'PHP', 0, NULL),
(474, 388, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805325, 'PHP', 0, NULL),
(475, 389, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805347, 'PHP', 0, NULL),
(476, 390, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805353, 'PHP', 0, NULL),
(477, 391, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805365, 'PHP', 0, NULL),
(478, 392, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805369, 'PHP', 0, NULL),
(479, 393, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805375, 'PHP', 0, NULL),
(480, 394, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805478, 'PHP', 0, NULL),
(481, 395, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805525, 'PHP', 0, NULL),
(482, 396, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678805574, 'PHP', 0, NULL),
(483, 397, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678806051, 'PHP', 0, NULL),
(484, 398, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1678807225, 'PHP', 0, NULL),
(485, 398, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1678807225, 'PHP', 0, NULL),
(486, 398, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1678807225, 'PHP', 0, NULL),
(487, 399, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678807252, 'PHP', 0, NULL),
(488, 400, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678807279, 'PHP', 0, NULL),
(489, 401, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678807280, 'PHP', 0, NULL),
(490, 402, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1678807783, 'PHP', 0, NULL),
(491, 403, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678807950, 'PHP', 0, NULL),
(492, 404, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678807951, 'PHP', 0, NULL),
(493, 405, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678868561, 'PHP', 0, NULL),
(494, 406, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1678955299, 'LOGIN', 1, 'users'),
(495, 407, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1678955318, 'PHP', 0, NULL),
(496, 408, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678955319, 'PHP', 0, NULL),
(497, 409, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1678955347, 'LOCALIZATION', 0, NULL),
(498, 409, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1678955347, 'LOCALIZATION', 0, NULL),
(499, 409, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1678955347, 'LOCALIZATION', 0, NULL),
(500, 410, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1678971211, 'PHP', 0, NULL),
(501, 411, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678973514, 'PHP', 0, NULL),
(502, 412, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1678973532, 'PHP', 0, NULL),
(503, 413, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679304722, 'LOGIN', 1, 'users'),
(504, 414, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679304728, 'PHP', 0, NULL),
(505, 415, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679304729, 'PHP', 0, NULL),
(506, 416, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1679304734, 'LOCALIZATION', 0, NULL),
(507, 416, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1679304734, 'LOCALIZATION', 0, NULL),
(508, 416, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1679304734, 'LOCALIZATION', 0, NULL),
(509, 417, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679304939, 'PHP', 0, NULL),
(510, 418, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679305406, 'PHP', 0, NULL),
(511, 419, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679305764, 'PHP', 0, NULL),
(512, 420, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679305775, 'PHP', 0, NULL),
(513, 421, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679305833, 'PHP', 0, NULL),
(514, 422, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679305866, 'PHP', 0, NULL),
(515, 423, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679305999, 'PHP', 0, NULL),
(516, 424, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679306148, 'PHP', 0, NULL),
(517, 425, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679306148, 'PHP', 0, NULL),
(518, 426, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679306177, 'PHP', 0, NULL),
(519, 427, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679306177, 'PHP', 0, NULL),
(520, 428, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679306208, 'PHP', 0, NULL),
(521, 429, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679306208, 'PHP', 0, NULL),
(522, 430, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679307172, 'PHP', 0, NULL),
(523, 431, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679307172, 'PHP', 0, NULL),
(524, 432, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679307372, 'PHP', 0, NULL),
(525, 433, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679307406, 'PHP', 0, NULL),
(526, 434, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679307537, 'PHP', 0, NULL),
(527, 435, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679307630, 'PHP', 0, NULL),
(528, 436, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679307943, 'PHP', 0, NULL),
(529, 437, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308112, 'PHP', 0, NULL),
(530, 438, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308118, 'PHP', 0, NULL),
(531, 439, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308201, 'PHP', 0, NULL),
(532, 440, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308295, 'PHP', 0, NULL),
(533, 441, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308385, 'PHP', 0, NULL),
(534, 442, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308496, 'PHP', 0, NULL),
(535, 443, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308811, 'PHP', 0, NULL),
(536, 444, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308890, 'PHP', 0, NULL),
(537, 445, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679308890, 'PHP', 0, NULL),
(538, 446, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679308987, 'PHP', 0, NULL),
(539, 447, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679308987, 'PHP', 0, NULL),
(540, 448, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309035, 'PHP', 0, NULL),
(541, 449, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309102, 'PHP', 0, NULL),
(542, 450, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679309103, 'PHP', 0, NULL),
(543, 451, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309132, 'PHP', 0, NULL),
(544, 452, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309160, 'PHP', 0, NULL),
(545, 453, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309199, 'PHP', 0, NULL),
(546, 454, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309228, 'PHP', 0, NULL),
(547, 455, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309247, 'PHP', 0, NULL),
(548, 456, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309267, 'PHP', 0, NULL),
(549, 457, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309336, 'PHP', 0, NULL),
(550, 458, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309361, 'PHP', 0, NULL),
(551, 459, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309379, 'PHP', 0, NULL),
(552, 460, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309406, 'PHP', 0, NULL),
(553, 461, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309453, 'PHP', 0, NULL),
(554, 462, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309497, 'PHP', 0, NULL),
(555, 463, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309521, 'PHP', 0, NULL),
(556, 464, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679309555, 'PHP', 0, NULL),
(557, 465, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679310540, 'PHP', 0, NULL),
(558, 466, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679310540, 'PHP', 0, NULL),
(559, 467, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679314264, 'PHP', 0, NULL),
(560, 468, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679314264, 'PHP', 0, NULL),
(561, 469, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679315487, 'PHP', 0, NULL),
(562, 470, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679315542, 'PHP', 0, NULL),
(563, 471, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679315611, 'PHP', 0, NULL),
(564, 472, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679315611, 'PHP', 0, NULL),
(565, 473, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679315741, 'PHP', 0, NULL),
(566, 474, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679315831, 'PHP', 0, NULL),
(567, 475, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316190, 'PHP', 0, NULL),
(568, 476, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679316191, 'PHP', 0, NULL),
(569, 477, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316237, 'PHP', 0, NULL),
(570, 478, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316248, 'PHP', 0, NULL),
(571, 479, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316326, 'PHP', 0, NULL),
(572, 480, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316341, 'PHP', 0, NULL),
(573, 481, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316358, 'PHP', 0, NULL),
(574, 482, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316364, 'PHP', 0, NULL),
(575, 483, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316405, 'PHP', 0, NULL),
(576, 484, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679316423, 'PHP', 0, NULL),
(577, 485, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679317507, 'PHP', 0, NULL),
(578, 486, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679317507, 'PHP', 0, NULL),
(579, 487, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679318039, 'PHP', 0, NULL),
(580, 488, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679318198, 'PHP', 0, NULL),
(581, 489, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679318282, 'PHP', 0, NULL),
(582, 490, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679318349, 'PHP', 0, NULL),
(583, 491, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679318459, 'PHP', 0, NULL),
(584, 492, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679318460, 'PHP', 0, NULL),
(585, 493, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679320471, 'PHP', 0, NULL),
(586, 494, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679321155, 'PHP', 0, NULL),
(587, 495, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679387019, 'PHP', 0, NULL),
(588, 496, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679387020, 'PHP', 0, NULL),
(589, 497, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679388150, 'PHP', 0, NULL),
(590, 498, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679388234, 'PHP', 0, NULL),
(591, 499, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679396021, 'LOGIN', 1, 'users'),
(592, 500, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679396030, 'PHP', 0, NULL),
(593, 501, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679396031, 'PHP', 0, NULL),
(594, 502, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396321, 'PHP', 0, NULL),
(595, 502, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1679396321, 'LOCALIZATION', 0, NULL),
(596, 502, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1679396321, 'LOCALIZATION', 0, NULL),
(597, 502, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1679396321, 'LOCALIZATION', 0, NULL),
(598, 503, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679396321, 'PHP', 0, NULL),
(599, 504, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396584, 'PHP', 0, NULL),
(600, 505, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396636, 'PHP', 0, NULL),
(601, 506, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396780, 'PHP', 0, NULL),
(602, 507, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396783, 'PHP', 0, NULL),
(603, 508, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396793, 'PHP', 0, NULL),
(604, 509, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396798, 'PHP', 0, NULL),
(605, 510, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396805, 'PHP', 0, NULL),
(606, 511, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679396887, 'PHP', 0, NULL),
(607, 512, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400483, 'PHP', 0, NULL),
(608, 513, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400516, 'PHP', 0, NULL),
(609, 514, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400586, 'PHP', 0, NULL),
(610, 515, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679400586, 'PHP', 0, NULL),
(611, 516, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400669, 'PHP', 0, NULL),
(612, 517, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679400670, 'PHP', 0, NULL),
(613, 518, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400734, 'PHP', 0, NULL),
(614, 519, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400754, 'PHP', 0, NULL),
(615, 520, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400771, 'PHP', 0, NULL),
(616, 521, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400806, 'PHP', 0, NULL),
(617, 522, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679400882, 'PHP', 0, NULL),
(618, 523, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679401895, 'PHP', 0, NULL),
(619, 524, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679401896, 'PHP', 0, NULL),
(620, 525, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679402020, 'PHP', 0, NULL),
(621, 526, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679402085, 'PHP', 0, NULL),
(622, 527, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679402086, 'PHP', 0, NULL),
(623, 528, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679402217, 'PHP', 0, NULL),
(624, 529, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679402218, 'PHP', 0, NULL),
(625, 530, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679402258, 'PHP', 0, NULL),
(626, 531, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679402259, 'PHP', 0, NULL),
(627, 532, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679402569, 'SAVE', 32, 'requirements'),
(628, 532, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679402569, 'PHP', 0, NULL),
(629, 533, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679402853, 'PHP', 0, NULL),
(630, 534, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679402854, 'PHP', 0, NULL),
(631, 535, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679403048, 'PHP', 0, NULL),
(632, 535, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679403048, 'PHP', 0, NULL),
(633, 536, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679403128, 'PHP', 0, NULL),
(634, 537, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679403209, 'PHP', 0, NULL),
(635, 538, 2, 'GUI - Test Project ID : 28', 'E_WARNING\narray_keys() expects parameter 1 to be array, null given - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/usersAssign.php - Line 555', 1679403349, 'PHP', 0, NULL),
(636, 538, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:40:\"audit_all_user_roles_removed_testproject\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679403349, 'ASSIGN', 28, 'testprojects'),
(637, 538, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nInvalid argument supplied for foreach() - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/usersAssign.php - Line 556', 1679403349, 'PHP', 0, NULL),
(638, 539, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679408631, 'LOGIN', 1, 'users'),
(639, 540, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679408806, 'PHP', 0, NULL),
(640, 541, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679408806, 'PHP', 0, NULL),
(641, 542, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679413401, 'LOGIN', 1, 'users'),
(642, 543, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679413435, 'PHP', 0, NULL),
(643, 544, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679413436, 'PHP', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `executions`
--

CREATE TABLE `executions` (
  `id` int(10) UNSIGNED NOT NULL,
  `build_id` int(10) NOT NULL DEFAULT 0,
  `tester_id` int(10) UNSIGNED DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_number` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `execution_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `executions`
--

INSERT INTO `executions` (`id`, `build_id`, `tester_id`, `execution_ts`, `status`, `testplan_id`, `tcversion_id`, `tcversion_number`, `platform_id`, `execution_type`, `execution_duration`, `notes`) VALUES
(1, 4, 1, '2023-03-10 14:36:49', 'p', 47, 38, 1, 0, 1, NULL, ''),
(3, 4, 1, '2023-03-12 12:10:30', 'f', 47, 38, 1, 0, 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `execution_bugs`
--

CREATE TABLE `execution_bugs` (
  `execution_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bug_id` varchar(64) NOT NULL DEFAULT '0',
  `tcstep_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `execution_tcsteps`
--

CREATE TABLE `execution_tcsteps` (
  `id` int(10) UNSIGNED NOT NULL,
  `execution_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcstep_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `execution_tcsteps`
--

INSERT INTO `execution_tcsteps` (`id`, `execution_id`, `tcstep_id`, `notes`, `status`) VALUES
(2, 1, 40, '', 'p'),
(8, 3, 40, '', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `execution_tcsteps_wip`
--

CREATE TABLE `execution_tcsteps_wip` (
  `id` int(10) UNSIGNED NOT NULL,
  `tcstep_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `build_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tester_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `exec_by_date_time`
-- (See below for the actual view)
--
CREATE TABLE `exec_by_date_time` (
`testplan_name` varchar(100)
,`yyyy_mm_dd` varchar(10)
,`yyyy_mm` varchar(7)
,`hh` varchar(7)
,`hour` varchar(7)
,`id` int(10) unsigned
,`build_id` int(10)
,`tester_id` int(10) unsigned
,`execution_ts` datetime
,`status` char(1)
,`testplan_id` int(10) unsigned
,`tcversion_id` int(10) unsigned
,`tcversion_number` smallint(5) unsigned
,`platform_id` int(10) unsigned
,`execution_type` tinyint(1)
,`execution_duration` decimal(6,2)
,`notes` text
);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modification_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issuetrackers`
--

CREATE TABLE `issuetrackers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_exec_by_context`
-- (See below for the actual view)
--
CREATE TABLE `latest_exec_by_context` (
`tcversion_id` int(10) unsigned
,`testplan_id` int(10) unsigned
,`build_id` int(10)
,`platform_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_exec_by_testplan`
-- (See below for the actual view)
--
CREATE TABLE `latest_exec_by_testplan` (
`tcversion_id` int(10) unsigned
,`testplan_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_exec_by_testplan_plat`
-- (See below for the actual view)
--
CREATE TABLE `latest_exec_by_testplan_plat` (
`tcversion_id` int(10) unsigned
,`testplan_id` int(10) unsigned
,`platform_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_req_version`
-- (See below for the actual view)
--
CREATE TABLE `latest_req_version` (
`req_id` int(10) unsigned
,`version` smallint(5) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_req_version_id`
-- (See below for the actual view)
--
CREATE TABLE `latest_req_version_id` (
`req_id` int(10) unsigned
,`version` smallint(5) unsigned
,`req_version_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_rspec_revision`
-- (See below for the actual view)
--
CREATE TABLE `latest_rspec_revision` (
`req_spec_id` int(10) unsigned
,`testproject_id` int(10) unsigned
,`revision` smallint(5) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_tcase_version_id`
-- (See below for the actual view)
--
CREATE TABLE `latest_tcase_version_id` (
`testcase_id` int(10) unsigned
,`version` smallint(5) unsigned
,`tcversion_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_tcase_version_number`
-- (See below for the actual view)
--
CREATE TABLE `latest_tcase_version_number` (
`testcase_id` int(10) unsigned
,`version` smallint(5) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `target_date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `a` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `b` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `c` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nodes_hierarchy`
--

CREATE TABLE `nodes_hierarchy` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `node_type_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `node_order` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `nodes_hierarchy`
--

INSERT INTO `nodes_hierarchy` (`id`, `name`, `parent_id`, `node_type_id`, `node_order`) VALUES
(28, 'BQTSI', NULL, 1, 1),
(29, 'Fonctionnalites projet BQTSI', 28, 6, 0),
(30, '1.1Accéder aux fiches de poste par métier', 29, 11, 0),
(31, 'Fonctionnalites projet BQTSI', 29, 11, 0),
(32, 'Cas_Valide_Créer la fiche de poste et la transférer au manager d’équipe', 29, 7, 1),
(33, '', 32, 8, 0),
(36, 'tests projet BQTSI lot1', 28, 2, 1),
(37, 'Cas_Valide_Créer la fiche de poste et la transférer au Manager d\'Équipee', 36, 3, 0),
(38, '', 37, 4, 0),
(40, '', 38, 9, 0),
(47, 'Tests projet BQTSI lot1', 28, 5, 0),
(52, '1.2 valider la fiche de poste transmise par manager RH', 29, 7, 3),
(53, '', 52, 8, 0),
(54, '', 53, 10, 0),
(55, '', 32, 8, 0),
(56, '', 55, 10, 0),
(58, '', 53, 10, 0),
(59, '', 53, 10, 0),
(65, 'Cas_Valide_Valider la fiche d\'attribution transmise par le Manager RH', 36, 3, 2),
(66, '', 65, 4, 0),
(72, '', 66, 9, 0),
(75, 'Cas_Invalide_Créer la fiche de poste et la transférer au Manager d\'Équipee', 36, 3, 1),
(76, '', 75, 4, 0),
(77, '', 76, 9, 0),
(81, '', 38, 9, 0),
(85, '', 38, 9, 0),
(86, '', 38, 9, 0),
(87, '', 38, 9, 0),
(88, '', 38, 9, 0),
(89, '', 38, 9, 0),
(90, '', 38, 9, 0),
(94, '', 38, 9, 0),
(95, '', 38, 9, 0),
(98, '', 38, 9, 0),
(99, '', 38, 9, 0),
(100, '', 38, 9, 0),
(101, '', 66, 9, 0),
(103, '', 38, 9, 0),
(104, '', 38, 9, 0),
(105, '', 38, 9, 0),
(106, '', 38, 9, 0),
(107, '', 38, 9, 0),
(108, '', 66, 9, 0),
(109, '', 66, 9, 0),
(115, 'Cas_Valide_Transférer la demande au Responsable Technique (matériel)', 36, 3, 3),
(116, '', 115, 4, 0),
(117, '', 116, 9, 0),
(118, '', 116, 9, 0),
(120, '', 116, 9, 0),
(121, '', 116, 9, 0),
(122, '', 116, 9, 0),
(123, '', 116, 9, 0),
(124, '', 116, 9, 0),
(125, '', 116, 9, 0),
(127, 'Cas_Valide_Transférer la demande a l\'admin system', 36, 3, 4),
(128, '', 127, 4, 0),
(129, '', 128, 9, 0),
(130, '', 128, 9, 0),
(131, '', 128, 9, 0),
(132, '', 128, 9, 0),
(133, '', 128, 9, 0),
(134, '', 128, 9, 0),
(135, '', 128, 9, 0),
(136, '', 128, 9, 0),
(137, 'Cas_Valide_Valider la demande de droits d\'accès  transmise par le Manager RH', 36, 3, 5),
(138, '', 137, 4, 0),
(139, '', 138, 9, 0),
(140, '', 138, 9, 0),
(141, '', 138, 9, 0),
(142, 'Cas_Valide_Valider la demande(materiel) transmise par le manager RH', 36, 3, 6),
(143, '', 142, 4, 0),
(144, '', 143, 9, 0),
(145, '', 143, 9, 0),
(146, '', 143, 9, 0),
(147, 'Cas_Valide_Cloture de  la demande', 36, 3, 7),
(148, '', 147, 4, 0),
(149, '', 148, 9, 0),
(150, '', 148, 9, 0),
(151, '', 148, 9, 0),
(152, '', 148, 9, 0),
(153, 'tests projet BQTSI lot2', 28, 2, 2),
(154, 'Cas_Valide_Authentification', 153, 3, 1000),
(155, '', 154, 4, 0),
(156, '', 155, 9, 0),
(157, '', 155, 9, 0),
(159, '', 155, 9, 0),
(162, '', 155, 9, 0),
(163, 'Cas_Invalide_Authentification', 153, 3, 1001),
(164, '', 163, 4, 0),
(165, '', 164, 9, 0),
(166, '', 164, 9, 0),
(167, '', 164, 9, 0),
(168, '', 55, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_types`
--

CREATE TABLE `node_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT 'testproject'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `node_types`
--

INSERT INTO `node_types` (`id`, `description`) VALUES
(1, 'testproject'),
(2, 'testsuite'),
(3, 'testcase'),
(4, 'testcase_version'),
(5, 'testplan'),
(6, 'requirement_spec'),
(7, 'requirement'),
(8, 'requirement_version'),
(9, 'testcase_step'),
(10, 'requirement_revision'),
(11, 'requirement_spec_revision'),
(12, 'build'),
(13, 'platform'),
(14, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `object_keywords`
--

CREATE TABLE `object_keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

CREATE TABLE `platforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `notes` text NOT NULL,
  `enable_on_design` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `enable_on_execution` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `basename` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins_configuration`
--

CREATE TABLE `plugins_configuration` (
  `id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_type` int(11) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reqmgrsystems`
--

CREATE TABLE `reqmgrsystems` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(10) UNSIGNED NOT NULL,
  `srs_id` int(10) UNSIGNED NOT NULL,
  `req_doc_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `srs_id`, `req_doc_id`) VALUES
(32, 29, 'RQT_01'),
(52, 29, 'RQT_02');

-- --------------------------------------------------------

--
-- Table structure for table `req_coverage`
--

CREATE TABLE `req_coverage` (
  `id` int(10) UNSIGNED NOT NULL,
  `req_id` int(10) NOT NULL,
  `req_version_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `tcversion_id` int(10) NOT NULL,
  `link_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_requester_id` int(10) UNSIGNED DEFAULT NULL,
  `review_request_ts` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='relation test case version ** requirement version';

--
-- Dumping data for table `req_coverage`
--

INSERT INTO `req_coverage` (`id`, `req_id`, `req_version_id`, `testcase_id`, `tcversion_id`, `link_status`, `is_active`, `author_id`, `creation_ts`, `review_requester_id`, `review_request_ts`) VALUES
(1, 32, 33, 37, 38, 2, 1, 1, '2023-03-10 13:16:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `req_monitor`
--

CREATE TABLE `req_monitor` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_relations`
--

CREATE TABLE `req_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED NOT NULL,
  `relation_type` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `req_revisions`
--

CREATE TABLE `req_revisions` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `revision` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `req_revisions`
--

INSERT INTO `req_revisions` (`parent_id`, `id`, `revision`, `req_doc_id`, `name`, `scope`, `status`, `type`, `active`, `is_open`, `expected_coverage`, `log_message`, `author_id`, `creation_ts`, `modifier_id`, `modification_ts`) VALUES
(53, 54, 1, 'RQT_03', '1.3 valider la fiche de poste transmise par manager RH', '', 'V', '3', 1, 1, 1, 'Requirement Created', 1, '2023-03-10 14:02:12', NULL, '2023-03-10 15:02:12'),
(55, 56, 1, 'RQT_01', '1.1Accéder aux fiches de poste par métier', '<p>Quand l&#39;utilsateur clique sur le bouton &quot;fiche de poste&quot;,la liste des fiches de poste s&#39;affiche et il peut en selectionner une&nbsp;</p>', 'V', '3', 1, 1, 1, '', 1, '2023-03-10 14:15:04', NULL, '2023-03-10 15:15:04'),
(53, 58, 2, 'RQT_03', '1.3 valider la fiche de poste transmise par manager RH', '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, ' ', 1, '2023-03-10 14:13:30', NULL, '2023-03-10 15:02:12'),
(53, 59, 3, 'RQT_02', '1.3 valider la fiche de poste transmise par manager RH', '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, ' ', 1, '2023-03-10 14:18:46', NULL, '2023-03-10 15:02:12'),
(55, 168, 2, 'RQT_01', '1.1 Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur clique sur le bouton &quot;fiche de poste&quot;,la liste des fiches de poste s&#39;affiche et il peut en selectionner une&nbsp;</p>', 'V', '3', 1, 1, 1, ' exigence mis a jour', 1, '2023-03-10 14:17:01', NULL, '2023-03-10 15:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `req_specs`
--

CREATE TABLE `req_specs` (
  `id` int(10) UNSIGNED NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `doc_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Dev. Documents (e.g. System Requirements Specification)';

--
-- Dumping data for table `req_specs`
--

INSERT INTO `req_specs` (`id`, `testproject_id`, `doc_id`) VALUES
(29, 28, 'RQT');

-- --------------------------------------------------------

--
-- Table structure for table `req_specs_revisions`
--

CREATE TABLE `req_specs_revisions` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `revision` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `total_req` int(10) NOT NULL DEFAULT 0,
  `status` int(10) UNSIGNED DEFAULT 1,
  `type` char(1) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `req_specs_revisions`
--

INSERT INTO `req_specs_revisions` (`parent_id`, `id`, `revision`, `doc_id`, `name`, `scope`, `total_req`, `status`, `type`, `log_message`, `author_id`, `creation_ts`, `modifier_id`, `modification_ts`) VALUES
(29, 30, 1, 'RQT', '1.1Accéder aux fiches de poste par métier', '', 0, 1, '1', 'Requirement Specification Created', 1, '2023-03-10 10:47:55', NULL, '2023-03-10 11:47:55'),
(29, 31, 2, 'RQT', 'Fonctionnalites projet BQTSI', '', 0, 1, '1', '', 1, '2023-03-10 12:15:23', NULL, '2023-03-10 13:15:23');

-- --------------------------------------------------------

--
-- Table structure for table `req_versions`
--

CREATE TABLE `req_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `revision` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `log_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `req_versions`
--

INSERT INTO `req_versions` (`id`, `version`, `revision`, `scope`, `status`, `type`, `active`, `is_open`, `expected_coverage`, `author_id`, `creation_ts`, `modifier_id`, `modification_ts`, `log_message`) VALUES
(33, 1, 1, '<p>Quand l&#39;utilsateur clique sur le bouton &quot;fiche de poste&quot;,la liste des fiches de poste s&#39;affiche et il peut en selectionner une&nbsp;</p>', 'V', '3', 1, 0, 1, 1, '2023-03-10 12:23:07', NULL, '2023-03-10 13:23:07', 'Requirement Created'),
(53, 1, 4, '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, 1, '2023-03-10 14:20:55', 1, '2023-03-10 15:21:17', ' '),
(55, 2, 3, '<p>Quand l&#39;utilsateur creer un premier ticket ca pour creer la fiche de poste et le transfere au manger d&#39;equipe</p>', 'V', '4', 1, 1, 1, 1, '2023-03-21 12:42:49', NULL, '2023-03-10 15:15:04', ' RQT_01');

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

CREATE TABLE `rights` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` (`id`, `description`) VALUES
(53, 'cfield_assignment'),
(18, 'cfield_management'),
(17, 'cfield_view'),
(51, 'codetracker_management'),
(52, 'codetracker_view'),
(56, 'delete_frozen_tcversion'),
(22, 'events_mgt'),
(54, 'exec_assign_testcases'),
(36, 'exec_delete'),
(35, 'exec_edit_notes'),
(49, 'exec_ro_access'),
(41, 'exec_testcases_assigned_to_me'),
(31, 'issuetracker_management'),
(32, 'issuetracker_view'),
(29, 'keyword_assignment'),
(9, 'mgt_modify_key'),
(12, 'mgt_modify_product'),
(11, 'mgt_modify_req'),
(7, 'mgt_modify_tc'),
(48, 'mgt_plugins'),
(16, 'mgt_testplan_create'),
(30, 'mgt_unfreeze_req'),
(13, 'mgt_users'),
(20, 'mgt_view_events'),
(8, 'mgt_view_key'),
(10, 'mgt_view_req'),
(6, 'mgt_view_tc'),
(21, 'mgt_view_usergroups'),
(50, 'monitor_requirement'),
(24, 'platform_management'),
(25, 'platform_view'),
(26, 'project_inventory_management'),
(27, 'project_inventory_view'),
(33, 'reqmgrsystem_management'),
(34, 'reqmgrsystem_view'),
(28, 'req_tcase_link_management'),
(14, 'role_management'),
(19, 'system_configuration'),
(47, 'testcase_freeze'),
(43, 'testplan_add_remove_platforms'),
(2, 'testplan_create_build'),
(1, 'testplan_execute'),
(3, 'testplan_metrics'),
(40, 'testplan_milestone_overview'),
(4, 'testplan_planning'),
(45, 'testplan_set_urgent_testcases'),
(46, 'testplan_show_testcases_newest_versions'),
(37, 'testplan_unlink_executed_testcases'),
(44, 'testplan_update_linked_testcase_versions'),
(5, 'testplan_user_role_assignment'),
(55, 'testproject_add_remove_keywords_executed_tcversions'),
(38, 'testproject_delete_executed_testcases'),
(39, 'testproject_edit_executed_testcases'),
(42, 'testproject_metrics_dashboard'),
(23, 'testproject_user_role_assignment'),
(15, 'user_role_assignment');

-- --------------------------------------------------------

--
-- Table structure for table `risk_assignments`
--

CREATE TABLE `risk_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `node_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `description`, `notes`) VALUES
(1, '<reserved system role 1>', NULL),
(2, '<reserved system role 2>', NULL),
(3, '<no rights>', NULL),
(4, 'test designer', NULL),
(5, 'guest', NULL),
(6, 'senior tester', NULL),
(7, 'tester', NULL),
(8, 'admin', NULL),
(9, 'leader', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_rights`
--

CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT 0,
  `right_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `role_rights`
--

INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES
(4, 3),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 28),
(4, 29),
(4, 30),
(4, 50),
(5, 3),
(5, 6),
(5, 8),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 11),
(6, 25),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(6, 50),
(7, 1),
(7, 3),
(7, 6),
(7, 8),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(8, 16),
(8, 17),
(8, 18),
(8, 19),
(8, 20),
(8, 21),
(8, 22),
(8, 23),
(8, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(8, 41),
(8, 42),
(8, 43),
(8, 44),
(8, 45),
(8, 46),
(8, 47),
(8, 48),
(8, 50),
(8, 51),
(8, 52),
(8, 53),
(8, 54),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 15),
(9, 16),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 47),
(9, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tcsteps`
--

CREATE TABLE `tcsteps` (
  `id` int(10) UNSIGNED NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT 1,
  `actions` text DEFAULT NULL,
  `expected_results` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tcsteps`
--

INSERT INTO `tcsteps` (`id`, `step_number`, `actions`, `expected_results`, `active`, `execution_type`) VALUES
(40, 5, '<p>Le manager RH clique sur l&#39;icon calendrier&nbsp; de la zone &quot;date d&#39;ouverture&quot; dans la section ticket.</p>\r\n', '<p>Affichage de calendrier</p>\r\n', 1, 1),
(72, 4, '<p>Le manager d&#39;equipe clique sur &quot;Sauvegarder&quot;</p>\r\n', '<p>Rien a signaler.</p>\r\n', 1, 1),
(77, 1, '<p>le manager RH Clickersur le button &quot;Ajouter&quot; ALORS que&nbsp;</p>\r\n', '', 1, 1),
(81, 1, '<p>Le manager RH clique sur &quot;Assistance/Creer un ticket&quot;&nbsp;&nbsp;</p>\r\n', '<p>l&#39;ecran de &quot;Creation de fichier&quot; s&#39;affiche</p>\r\n', 1, 1),
(85, 2, '<p>Le manager RH renseigne le titre de la demande: &quot;Demande d&#39;attribution de materiel et de droits d&#39;acces pour un nouvel arrivant&quot;</p>\r\n', '<p>la saise est affichee dans la zone de titre</p>\r\n', 1, 1),
(86, 3, '<p>Le manager RH renseigne la description de la demande : &quot;Veuillez trouver ci-joint une demande de materiel et de droits d&#39;acces pour M. Pual Auchon&quot;</p>\r\n', '<p>La saisie est affichee dans le text area de la description&nbsp;</p>\r\n', 1, 1),
(87, 4, '<p>En tant que Manager RH:<br />\r\nle code fournira la fiche de poste au prealable pour la mettre dans la zone &quot;Parcourir&quot;</p>\r\n', '<p>Le nom de ficher s&#39;affiche dans la &lt;div&gt;</p>\r\n', 1, 1),
(88, 6, '<p>Le manager RH clique sur &quot;Maintenant&quot; sur le calendrier&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>la date choisis s&#39;affiche dans la zone &quot;date d&#39;ouverture&quot;</p>\r\n', 1, 1),
(89, 7, '<p>Le manager RH clique sur l&#39;icon calendrier&nbsp; de la zone &quot;date d&#39;ouverture&quot; dans la section ticket.</p>\r\n', '<p>le calendrier se ferme</p>\r\n', 1, 1),
(90, 8, '<p>Cliquer sur la liste deroulante &quot;Type&quot;</p>\r\n', '<p>Affichage de la liste &quot;Incident&quot; ou &quot;Demande&quot;</p>\r\n', 1, 1),
(94, 9, '<p>Le manager RH clique sur &quot;Demande&quot;</p>\r\n', '<p>Affichage de type &quot;Demande&quot;</p>\r\n', 1, 1),
(95, 10, '<p>Le manager Rh verifie qu le status du ticket soit &quot;Nouveau&quot;</p>\r\n', '<p>Le status du ticket est affiche &quot;Nouveau&quot;</p>\r\n', 1, 1),
(98, 15, '<p>Dans la section &quot;Acteurs&quot; le manager RH&nbsp;clique dans la zone &quot;Attribuer a &quot;</p>\r\n', '<p>la liste des utilisateurs s&#39;affiche</p>\r\n', 1, 1),
(99, 17, '<p>Le manager RH choisit le Manager d&#39;Equipe&nbsp;dans la liste.</p>\r\n', '<p>Le Manager d&#39;Equipe s&#39;affiche dans la zone &quot;Attribuer a&quot;.</p>\r\n', 1, 1),
(100, 18, '<p>le manager RH clique sur&quot; +Ajouter&quot;</p>\r\n', '<p>affichage d&#39;un message d&#39;information(POP UP)&nbsp;:&quot;la titre de demande &quot;</p>\r\n', 1, 1),
(101, 1, '<p>Sur la page d&#39;acceuil: le manager d&#39;equipe&nbsp;clique sur le&nbsp; ticket a valider dans la section &quot;Vos tickets a valider&quot;.</p>\r\n', '<p>Affichage de details de la demande de validation et un lien vers le document joint.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1),
(103, 11, '<p>Le manager RH clique sur la liste deroulante&quot; Demande de validation&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Affichage de la liste &quot; Utilisateur&quot; ou &quot; Groupe&quot;</p>\r\n', 1, 1),
(104, 12, '<p>Le manager Rh clique sur &quot;Utilisateur&quot;.</p>\r\n', '<p>Une zone de liste deroulante s&#39;affiche.</p>\r\n', 1, 1),
(105, 13, '<p>Le manager RH clique sur la liste deroulante des utilisateurs&nbsp;</p>\r\n', '<p>Les noms deS utilisateurs s&#39;affichent&quot;.</p>\r\n', 1, 1),
(106, 14, '<p>Le manager RH clique sur le nom du manager d&#39;equipe.</p>\r\n', '<p>Le nom de manager d&#39;equipe s&#39;affiche dans la&nbsp;zone de demande de validation.</p>\r\n', 1, 1),
(107, 19, '<p>Le manager RH clique sur assistance/ticket pour verifier l&#39;ajout du ticket cree dans la liste et le status du ticket passe de &quot;nouveau&quot; a &quot;En cours(attribue)</p>\r\n', '<p>Affichage du ticket creer dans la liste avec un status &quot;En cours&quot;</p>\r\n', 1, 1),
(108, 2, '<p>Le manager d&#39;equipe saisie un commentaire &quot;demande valide&quot;.</p>\r\n', '<p>la saisie s&#39;affiche dans le texte area &quot; Commentaire&quot;</p>\r\n', 1, 1),
(109, 3, '<p>le manager d&#39;equipe clique sur le bouton &quot; Approuver&quot;</p>\r\n', '<p>Affichage de message &quot;Reponse a une demande de validation : Acceptee&quot;.et message associer</p>\r\n', 1, 1),
(117, 1, '<p>Sur la page d&#39;acceuil: le manager RH&nbsp;clique sur le&nbsp; ticket en cours&nbsp;&nbsp;dans la section &quot;VOS TICKETS EN COURS&quot;.</p>\r\n', '<p>Affichage d&#39;un &quot;chat&quot; pour faire la reponse</p>\r\n', 1, 1),
(118, 2, '<p>Dans la zone &quot;tickets&quot;, le manager RH clique sur la liste deroulante&nbsp;a cote de la bouton &quot;reponse&quot;&nbsp;</p>\r\n', '<p>Affichage de la liste.</p>\r\n', 1, 1),
(120, 3, '<p>Le manager RH clique sur &quot;Demander une validation&quot;</p>\r\n', '<p>Affichage de text AREA &quot;Demande de validation&quot;</p>\r\n', 1, 1),
(121, 4, '<p>Le manager RH clique sur la liste deroulant &quot;Valideur&quot;</p>\r\n', '<p>Affichage de la liste&nbsp;</p>\r\n', 1, 1),
(122, 5, '<p>Le manager RH choisit &quot;utilisateur&quot; dans la liste&nbsp;&nbsp;</p>\r\n', '<p>Affichage d&#39;un autre liste deroulant</p>\r\n', 1, 1),
(123, 6, '<p>Le manager RH clique sur &quot;RESP_TECHNIQUE&quot;</p>\r\n', '', 1, 1),
(124, 7, '<p>Le manager RH tappe une commentaire dans le text area&nbsp;</p>\r\n', '<p>Affichage de text&nbsp;</p>\r\n', 1, 1),
(125, 8, '<p>Le manager RH clique sur le bouton &quot;Ajouter&quot;&nbsp;</p>\r\n', '<p>Affichage d&#39;un message:</p>\r\n\r\n<p>Demande de validation ---&gt;&nbsp;<a href=\"http://kamkam.infinityfreeapp.com/glpi_10_0_6/front/user.form.php?id=11\" title=\"RESP_TECHNIQUE\">RESP_TECHNIQUE</a></p>\r\n', 1, 1),
(129, 1, '<p>Sur la page d&#39;acceuil: le manager RH&nbsp;clique sur le&nbsp; ticket en cours&nbsp;&nbsp;dans la section &quot;VOS TICKETS EN COURS&quot;.</p>\r\n', '<p>Affichage d&#39;un &quot;chat&quot; pour faire la reponse</p>\r\n', 1, 1),
(130, 2, '<p>Dans la zone &quot;tickets&quot;, le manager RH clique sur la liste deroulante&nbsp;a cote de la bouton &quot;reponse&quot;&nbsp;</p>\r\n', '<p>Affichage de la liste&nbsp;</p>\r\n', 1, 1),
(131, 3, '<p>Le manager RH clique sur &quot;Demander une validation&quot;</p>\r\n', '<p>Affichage de text AREA &quot;Demande de validation&quot;</p>\r\n', 1, 1),
(132, 4, '<p>Le manager RH clique sur la liste deroulant &quot;Valideur&quot;</p>\r\n', '<p>Affichage la liste&nbsp;</p>\r\n', 1, 1),
(133, 5, '<p>Le manager RH choisit &quot;utilisateur&quot; dans la liste&nbsp;&nbsp;</p>\r\n', '<p>Affichage d&#39;un autre liste deroulant</p>\r\n', 1, 1),
(134, 6, '<p>Le manager RH clique sur &quot;ADMIN_SYS&quot;</p>\r\n', '', 1, 1),
(135, 7, '<p>Le manager RH tappe une commentaire dans le text area&nbsp;</p>\r\n', '<p>Affichage de text&nbsp;</p>\r\n', 1, 1),
(136, 8, '<p>Le manager RH clique sur le bouton &quot;Ajouter&quot;&nbsp;</p>\r\n', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>Affichage d&#39;un message:</p>\r\n\r\n			<p>Demande de validation ---&gt; ADMIN_SYSY</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, 1),
(139, 1, '<p>Sur la page d&#39;acceuil: l&#39;ADMIN SYS&nbsp;clique sur le&nbsp; ticket a valider dans la section &quot;Vos tickets a valider&quot;.</p>\r\n', '<p>Affichage de details de la demande de validation</p>\r\n', 1, 1),
(140, 2, '<p>Dans le text area de &quot;commentaire&quot;:</p>\r\n\r\n<p>ADMIN_SYS tappe &quot;<strong>Mettre en place la politique d&#39;acc&egrave;s aux logiciels &agrave; la date d&#39;int&eacute;gration ou &agrave; la date demand&eacute;e par le Manager d&#39;&Eacute;quipe&quot;</strong></p>\r\n', '<p>Affichage de texte&nbsp;</p>\r\n', 1, 1),
(141, 3, '<p>L&#39;ADMIN_SYS clique sur le bouton &quot;Approuver&quot;</p>\r\n', '<p>Affichage d&#39;un message &quot;R&eacute;ponse &agrave; une demande de validation : Accept&eacute;e&quot;</p>\r\n', 1, 1),
(144, 1, '<p>Sur la page d&#39;acceuil: le responsable technique&nbsp;clique sur le&nbsp; ticket a valider dans la section &quot;Vos tickets a valider&quot;.</p>\r\n', '<p>Affichage de details de la demande de validation</p>\r\n', 1, 1),
(145, 2, '<p>Dans le text area de &quot;commentaire&quot;:</p>\r\n\r\n<p>Responsable technique&nbsp;tappe &quot;Mettre le mat&eacute;riel &agrave; la disposition&quot;</p>\r\n', '<p>Affichage de texte&nbsp;</p>\r\n', 1, 1),
(146, 3, '<p>Le responsable technique&nbsp;clique sur le bouton &quot;Approuver&quot;</p>\r\n', '<p>Affichage d&#39;un message &quot;R&eacute;ponse &agrave; une demande de validation : Accept&eacute;e&quot;</p>\r\n', 1, 1),
(149, 1, '<p>Sur la page d&#39;acceuil: le responsable technique&nbsp;clique sur le&nbsp; ticket a valider dans la section &quot;Vos tickets a valider&quot;.</p>\r\n', '<p>Affichage des details</p>\r\n', 1, 1),
(150, 2, '<p>le manager RH clique sur la liste deroulant &quot;Status&quot;</p>\r\n', '<p>Affichage de la liste&nbsp;</p>\r\n', 1, 1),
(151, 3, '<p>le manager RH choisit le status &quot;Clos&quot;</p>\r\n', '<p>Affichage de de status &quot;Clos&quot;</p>\r\n', 1, 1),
(152, 4, '<p>Le manager RH clique sur &quot;Sauvegarder&quot;</p>\r\n', '<p>Affichage &quot;POP UP&quot; : element modifiee</p>\r\n', 1, 1),
(156, 1, '<p>tapper l&#39;url: &#39;&quot;http://kamkam.infinityfreeapp.com/glpi_10_0_6/index.php&quot;</p>\r\n', '<p>Affichage &quot; Login to your account&quot; page&nbsp;de l&#39;application Glpi&nbsp;</p>\r\n', 1, 1),
(157, 3, '<p>Tapper le username dans l&#39;input</p>\r\n', '<p>Affichage de &quot;username&quot;</p>\r\n\r\n<p>ex:MANAGER_RH</p>\r\n', 1, 1),
(159, 4, '<p>Tapper le password dans l&#39;input</p>\r\n', '<p>&nbsp;password cacher dans l&#39;input</p>\r\n', 1, 1),
(162, 5, '<p>Cliquer sur &quot;Sign In &quot;</p>\r\n', '<p>Affichage Application &quot;GLPI&quot;&nbsp; dans un autre page&nbsp;</p>\r\n', 1, 1),
(165, 1, '<p>tapper l&#39;url: &#39;&quot;http://kamkam.infinityfreeapp.com/glpi_10_0_6/index.php&quot;</p>\r\n', '<p>Affichage &quot; Login to your account&quot; page&nbsp;de l&#39;application Glpi&nbsp;</p>\r\n', 1, 1),
(166, 2, '<p>Tapper un valid username dans l&#39;input</p>\r\n', '<p>Affichage de &quot;username&quot;</p>\r\n\r\n<p>ex:MANAGER_RH</p>\r\n', 1, 1),
(167, 3, '<p>Tapper un &quot;invalid password&nbsp;&quot;&nbsp;dans l&#39;input</p>\r\n', '<p>Affichage d&#39;un message :</p>\r\n\r\n<p>&quot;Error</p>\r\n\r\n<p>Incorrect username or password&quot;</p>\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tcversions`
--

CREATE TABLE `tcversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `tc_external_id` int(10) UNSIGNED DEFAULT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `layout` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `summary` text DEFAULT NULL,
  `preconditions` text DEFAULT NULL,
  `importance` smallint(5) UNSIGNED NOT NULL DEFAULT 2,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updater_id` int(10) UNSIGNED DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tcversions`
--

INSERT INTO `tcversions` (`id`, `tc_external_id`, `version`, `layout`, `status`, `summary`, `preconditions`, `importance`, `author_id`, `creation_ts`, `updater_id`, `modification_ts`, `active`, `is_open`, `execution_type`, `estimated_exec_duration`) VALUES
(38, 1, 1, 1, 1, '<p>choisir un model de&nbsp;fiche de poste parmis une liste de fiches</p>\r\n\r\n<p>choisir le destinataire de la fiche de poste&nbsp;(recap)</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Manager RH a son poste</p>\r\n\r\n<p>Liste de fiche de poste&nbsp;</p>\r\n\r\n<p>Listes des intervenants dans le workflow</p>\r\n\r\n<p>Etre connect&eacute;&nbsp;a GLPI</p>\r\n\r\n<p>Donnees de tests fournies (Fichiers de fiches de post)</p>\r\n', 2, 1, '2023-03-10 12:54:42', 1, '2023-03-20 10:56:17', 1, 1, 1, NULL),
(66, 3, 1, 1, 1, '<p>Valider la fiche de poste par le manager RH &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Manager RH a son poste</p>\r\n\r\n<p>Liste de fiche de poste</p>\r\n\r\n<p>Listes des&nbsp; intervenants dans le workflow</p>\r\n', 2, 1, '2023-03-12 11:35:04', 1, '2023-03-20 11:20:30', 1, 1, 1, NULL),
(76, 4, 1, 1, 1, '<p>choisir le&nbsp;&nbsp;fiche de poste parmis une liste de fiches</p>\r\n\r\n<p>choisir le destinataire de la fiche de poste&nbsp;(recap)</p>\r\n', '<p>Manager RH a son poste</p>\r\n\r\n<p>Liste de fiche de poste&nbsp;</p>\r\n\r\n<p>Etre connect&eacute;&nbsp;a GLPI</p>\r\n', 2, 1, '2023-03-14 09:34:58', 1, '2023-03-21 13:36:57', 1, 1, 1, NULL),
(116, 5, 1, 1, 1, '<p><strong>Transf&eacute;rer simultan&eacute;ment&nbsp; la demande au Responsable Technique (mat&eacute;riel) et &agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s)</strong></p>\r\n', '<p>Connecter sur le GLPI&nbsp;</p>\r\n\r\n<p>la demande est prete&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 1, '2023-03-20 10:12:52', 1, '2023-03-20 11:50:06', 1, 1, 1, NULL),
(128, 6, 1, 1, 1, '<p><strong>Transf&eacute;rer la fiche d&#39;attribution&nbsp;&nbsp;&agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s)</strong></p>\r\n', '<p>Connecter sur GLPI</p>\r\n\r\n<p>La demande est prete&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 1, '2023-03-20 10:43:07', 1, '2023-03-20 11:52:35', 1, 1, 1, NULL),
(138, 7, 1, 1, 1, '<p>Mettre en place la politique d&#39;acc&egrave;s aux logiciels &agrave; la date d&#39;int&eacute;gration ou &agrave; la date demand&eacute;e par le Manager d&#39;&Eacute;quipe</p>\r\n', '<p>Admin systeme&nbsp;&nbsp;a son post</p>\r\n\r\n<p>fiche de post prete&nbsp;</p>\r\n', 2, 1, '2023-03-20 11:09:00', 1, '2023-03-20 13:37:11', 1, 1, 1, NULL),
(143, 8, 1, 1, 1, '<p><strong>Mettre le mat&eacute;riel &agrave; la disposition</strong></p>\r\n', '<p>RESPONSABLE TECHNIQUE&nbsp; a son poste</p>\r\n\r\n<p>la demande prete&nbsp;</p>\r\n', 2, 1, '2023-03-20 12:43:10', 1, '2023-03-20 13:47:03', 1, 1, 1, NULL),
(148, 9, 1, 1, 1, '<p>&nbsp;Le manager RH close la demande por ferme le ticket</p>\r\n', '<p>MANAGER_RH a son poste&nbsp;</p>\r\n', 2, 1, '2023-03-20 13:05:07', 1, '2023-03-20 15:05:55', 1, 1, 1, NULL),
(155, 10, 1, 1, 1, '<p>validation de username et password</p>\r\n', '<p>username/password pret de chaque role&nbsp;</p>\r\n', 2, 1, '2023-03-21 10:58:41', 1, '2023-03-21 13:08:36', 1, 1, 1, NULL),
(164, 11, 1, 1, 1, '<p>un cas qui montre l&#39;invalidation de password.</p>\r\n', '', 2, 1, '2023-03-21 12:09:46', 1, '2023-03-21 13:14:42', 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tcversions_without_keywords`
-- (See below for the actual view)
--
CREATE TABLE `tcversions_without_keywords` (
`testcase_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tcversions_without_platforms`
-- (See below for the actual view)
--
CREATE TABLE `tcversions_without_platforms` (
`testcase_id` int(10) unsigned
,`id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `testcase_keywords`
--

CREATE TABLE `testcase_keywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `testcase_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `keyword_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testcase_platforms`
--

CREATE TABLE `testcase_platforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `testcase_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testcase_relations`
--

CREATE TABLE `testcase_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT 1,
  `relation_type` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testcase_script_links`
--

CREATE TABLE `testcase_script_links` (
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `project_key` varchar(64) NOT NULL,
  `repository_name` varchar(64) NOT NULL,
  `code_path` varchar(255) NOT NULL,
  `branch_name` varchar(64) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testplans`
--

CREATE TABLE `testplans` (
  `id` int(10) UNSIGNED NOT NULL,
  `testproject_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `api_key` varchar(64) NOT NULL DEFAULT '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `testplans`
--

INSERT INTO `testplans` (`id`, `testproject_id`, `notes`, `active`, `is_open`, `is_public`, `api_key`) VALUES
(47, 28, '<p>cette campagne de test permet de verifier le bon fonctionnement du lot1</p>', 1, 1, 1, '337e2255d633a8146e2459fe67b7706d8c3bcc1734ceebf24a8a05a21a487a3b');

-- --------------------------------------------------------

--
-- Table structure for table `testplan_platforms`
--

CREATE TABLE `testplan_platforms` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL,
  `platform_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Connects a testplan with platforms';

-- --------------------------------------------------------

--
-- Table structure for table `testplan_tcversions`
--

CREATE TABLE `testplan_tcversions` (
  `id` int(10) UNSIGNED NOT NULL,
  `testplan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tcversion_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `node_order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `urgency` smallint(5) NOT NULL DEFAULT 2,
  `platform_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `testplan_tcversions`
--

INSERT INTO `testplan_tcversions` (`id`, `testplan_id`, `tcversion_id`, `node_order`, `urgency`, `platform_id`, `author_id`, `creation_ts`) VALUES
(3, 47, 38, 10000, 2, 0, 1, '2023-03-10 13:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `testprojects`
--

CREATE TABLE `testprojects` (
  `id` int(10) UNSIGNED NOT NULL,
  `notes` text DEFAULT NULL,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `option_reqs` tinyint(1) NOT NULL DEFAULT 0,
  `option_priority` tinyint(1) NOT NULL DEFAULT 0,
  `option_automation` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `issue_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `code_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `reqmgr_integration_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` varchar(64) NOT NULL DEFAULT '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `testprojects`
--

INSERT INTO `testprojects` (`id`, `notes`, `color`, `active`, `option_reqs`, `option_priority`, `option_automation`, `options`, `prefix`, `tc_counter`, `is_public`, `issue_tracker_enabled`, `code_tracker_enabled`, `reqmgr_integration_enabled`, `api_key`) VALUES
(28, '', '', 1, 0, 0, 0, 'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:1;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:1;}', 'BQTSI', 11, 1, 0, 0, 0, '204089a683aeccf98f98c3a2cd99def1f5bf596cb213c9d9b103df65bd539a78');

-- --------------------------------------------------------

--
-- Table structure for table `testproject_codetracker`
--

CREATE TABLE `testproject_codetracker` (
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `codetracker_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testproject_issuetracker`
--

CREATE TABLE `testproject_issuetracker` (
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `issuetracker_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testproject_reqmgrsystem`
--

CREATE TABLE `testproject_reqmgrsystem` (
  `testproject_id` int(10) UNSIGNED NOT NULL,
  `reqmgrsystem_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testsuites`
--

CREATE TABLE `testsuites` (
  `id` int(10) UNSIGNED NOT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `testsuites`
--

INSERT INTO `testsuites` (`id`, `details`) VALUES
(36, '<p>Tester l&#39;initialisation de la demande</p>\r\n'),
(153, '<p>Tester Authentification&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `text_templates`
--

CREATE TABLE `text_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `template_data` text DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Global Project Templates';

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `end_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES
(1, '/testlink_1_9_20/login.php', 1678205128, 1678205128, 1, '512e898d021dd46f653dac3bbc63231e'),
(2, '/testlink_1_9_20/login.php', 1678364398, 1678364398, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(3, '/testlink_1_9_20/login.php', 1678364417, 1678364417, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(4, '/testlink_1_9_20/login.php', 1678364555, 1678364555, 0, NULL),
(5, '/testlink_1_9_20/login.php', 1678364563, 1678364563, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(6, '/testlink_1_9_20/logout.php', 1678364662, 1678364662, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(7, '/testlink_1_9_20/login.php', 1678364671, 1678364671, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(8, '/testlink_1_9_20/lib/project/projectEdit.php', 1678376689, 1678376689, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(9, '/testlink_1_9_20/logout.php', 1678376726, 1678376726, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(10, '/testlink_1_9_20/login.php', 1678376736, 1678376736, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(11, '/lib/testcases/listTestCases.php', 1678376783, 1678376783, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(12, '/testlink_1_9_20/logout.php', 1678376783, 1678376783, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(13, '/lib/testcases/archiveData.php', 1678376784, 1678376784, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(14, '/lib/testcases/archiveData.php', 1678376785, 1678376785, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(15, '/lib/testcases/listTestCases.php', 1678376786, 1678376786, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(16, '/testlink_1_9_20/login.php', 1678376792, 1678376792, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(17, '/lib/testcases/archiveData.php', 1678376837, 1678376837, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(18, '/lib/testcases/listTestCases.php', 1678376838, 1678376838, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(19, '/testlink_1_9_20/lib/project/projectEdit.php', 1678376888, 1678376888, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(20, '/lib/testcases/listTestCases.php', 1678376926, 1678376926, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(21, '/lib/testcases/archiveData.php', 1678376927, 1678376927, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(22, '/lib/testcases/archiveData.php', 1678376962, 1678376962, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(23, '/testlink_1_9_20/lib/project/projectEdit.php', 1678377278, 1678377278, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(24, '/lib/testcases/archiveData.php', 1678377282, 1678377282, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(25, '/lib/testcases/listTestCases.php', 1678377283, 1678377283, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(26, '/lib/testcases/archiveData.php', 1678377310, 1678377310, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(27, '/testlink_1_9_20/lib/project/projectEdit.php', 1678377328, 1678377328, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(28, '/lib/testcases/listTestCases.php', 1678377342, 1678377342, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(29, '/lib/testcases/archiveData.php', 1678377343, 1678377343, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(30, '/lib/testcases/archiveData.php', 1678377347, 1678377347, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(31, '/lib/testcases/archiveData.php', 1678377469, 1678377469, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(32, '/lib/testcases/listTestCases.php', 1678377471, 1678377471, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(33, '/lib/testcases/archiveData.php', 1678377472, 1678377472, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(34, '/testlink_1_9_20/logout.php', 1678377497, 1678377497, 1, '3c377dbe3a3076ae6c0bccab7e1e705f'),
(35, '/testlink_1_9_20/login.php', 1678391170, 1678391170, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(36, '/lib/requirements/reqSpecEdit.php', 1678391717, 1678391717, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(37, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678392162, 1678392162, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(38, '/testlink_1_9_20/lib/project/projectEdit.php', 1678392227, 1678392227, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(39, '/lib/testcases/archiveData.php', 1678394390, 1678394390, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(40, '/lib/testcases/listTestCases.php', 1678394419, 1678394419, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(41, '/lib/testcases/listTestCases.php', 1678394556, 1678394556, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(42, '/lib/testcases/archiveData.php', 1678394568, 1678394568, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(43, '/lib/testcases/archiveData.php', 1678394574, 1678394574, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(44, '/lib/testcases/archiveData.php', 1678394574, 1678394574, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(45, '/testlink_1_9_20/lib/project/projectEdit.php', 1678395226, 1678395226, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(46, '/lib/requirements/reqSpecEdit.php', 1678395259, 1678395259, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(47, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678395596, 1678395596, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(48, '/testlink_1_9_20/logout.php', 1678395986, 1678395986, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(49, '/testlink_1_9_20/login.php', 1678435693, 1678435693, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(50, '/testlink_1_9_20/lib/plan/planEdit.php', 1678435733, 1678435733, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(51, '/testlink_1_9_20/lib/plan/planEdit.php', 1678436404, 1678436404, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(52, '/testlink_1_9_20/lib/plan/planEdit.php', 1678436902, 1678436902, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(53, '/testlink_1_9_20/lib/project/projectEdit.php', 1678436920, 1678436920, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(54, '/testlink_1_9_20/lib/plan/planEdit.php', 1678436928, 1678436928, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(55, '/testlink_1_9_20/lib/plan/planEdit.php', 1678437016, 1678437016, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(56, '/testlink_1_9_20/lib/plan/planEdit.php', 1678438862, 1678438862, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(57, '/testlink_1_9_20/lib/plan/planEdit.php', 1678438931, 1678438931, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(58, '/testlink_1_9_20/lib/plan/planEdit.php', 1678438945, 1678438945, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(59, '/testlink_1_9_20/lib/plan/planEdit.php', 1678438948, 1678438948, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(60, '/testlink_1_9_20/lib/plan/planEdit.php', 1678439065, 1678439065, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(61, '/testlink_1_9_20/lib/plan/planEdit.php', 1678439067, 1678439067, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(62, '/testlink_1_9_20/lib/plan/planEdit.php', 1678439125, 1678439125, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(63, '/testlink_1_9_20/lib/plan/planEdit.php', 1678439130, 1678439130, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(64, '/testlink_1_9_20/lib/plan/planEdit.php', 1678439489, 1678439489, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(65, '/testlink_1_9_20/lib/plan/buildEdit.php', 1678439530, 1678439530, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(66, '/testlink_1_9_20/lib/plan/buildEdit.php', 1678439569, 1678439569, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(67, '/testlink_1_9_20/lib/plan/buildEdit.php', 1678439597, 1678439597, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(68, '/lib/testcases/listTestCases.php', 1678439636, 1678439636, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(69, '/lib/testcases/archiveData.php', 1678439637, 1678439637, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(70, '/lib/testcases/listTestCases.php', 1678439679, 1678439679, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(71, '/lib/testcases/listTestCases.php', 1678439811, 1678439811, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(72, '/lib/testcases/listTestCases.php', 1678439875, 1678439875, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(73, '/lib/testcases/listTestCases.php', 1678439898, 1678439898, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(74, '/lib/testcases/listTestCases.php', 1678439911, 1678439911, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(75, '/lib/testcases/listTestCases.php', 1678439937, 1678439937, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(76, '/testlink_1_9_20/login.php', 1678442032, 1678442032, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(77, '/testlink_1_9_20/login.php', 1678442066, 1678442066, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(78, '/lib/testcases/listTestCases.php', 1678442541, 1678442541, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(79, '/lib/testcases/archiveData.php', 1678442541, 1678442541, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(80, '/lib/testcases/listTestCases.php', 1678442648, 1678442648, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(81, '/lib/testcases/archiveData.php', 1678442648, 1678442648, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(82, '/lib/requirements/reqSpecEdit.php', 1678442894, 1678442894, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(83, '/lib/testcases/listTestCases.php', 1678443189, 1678443189, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(84, '/lib/testcases/archiveData.php', 1678443190, 1678443190, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(85, '/lib/testcases/listTestCases.php', 1678443363, 1678443363, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(86, '/lib/testcases/archiveData.php', 1678443364, 1678443364, 1, 'cb626634eaf6093236bc98ca75de3af1'),
(87, '/testlink_1_9_20/lib/project/projectEdit.php', 1678444961, 1678444961, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(88, '/testlink_1_9_20/lib/project/projectEdit.php', 1678445079, 1678445079, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(89, '/testlink_1_9_20/lib/general/navBar.php', 1678445079, 1678445079, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(90, '/lib/requirements/reqSpecEdit.php', 1678445275, 1678445275, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(91, '/testlink_1_9_20/login.php', 1678450103, 1678450103, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(92, '/lib/requirements/reqSpecEdit.php', 1678450523, 1678450523, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(93, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678450987, 1678450987, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(94, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678451216, 1678451216, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(95, '/lib/testcases/archiveData.php', 1678452073, 1678452073, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(96, '/lib/testcases/listTestCases.php', 1678452074, 1678452074, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(97, '/lib/testcases/archiveData.php', 1678452100, 1678452100, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(98, '/lib/testcases/archiveData.php', 1678452113, 1678452113, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(99, '/lib/testcases/listTestCases.php', 1678452114, 1678452114, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(100, '/lib/testcases/archiveData.php', 1678452138, 1678452138, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(101, '/lib/testcases/archiveData.php', 1678452142, 1678452142, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(102, '/lib/testcases/archiveData.php', 1678452148, 1678452148, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(103, '/lib/testcases/listTestCases.php', 1678452171, 1678452171, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(104, '/lib/testcases/archiveData.php', 1678452172, 1678452172, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(105, '/lib/testcases/listTestCases.php', 1678452213, 1678452213, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(106, '/lib/testcases/archiveData.php', 1678452214, 1678452214, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(107, '/lib/testcases/listTestCases.php', 1678452537, 1678452537, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(108, '/lib/testcases/archiveData.php', 1678452538, 1678452538, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(109, '/lib/testcases/listTestCases.php', 1678452653, 1678452653, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(110, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678452882, 1678452882, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(111, '/lib/testcases/listTestCases.php', 1678452882, 1678452882, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(112, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678453333, 1678453333, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(113, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678453588, 1678453588, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(114, '/lib/testcases/listTestCases.php', 1678453588, 1678453588, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(115, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678453729, 1678453729, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(116, '/lib/testcases/listTestCases.php', 1678453729, 1678453729, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(117, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678453929, 1678453929, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(118, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678453957, 1678453957, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(119, '/lib/testcases/archiveData.php', 1678454000, 1678454000, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(120, '/lib/requirements/reqTcAssign.php', 1678454219, 1678454219, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(121, '/lib/testcases/archiveData.php', 1678454240, 1678454240, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(122, '/testlink_1_9_20/lib/plan/planEdit.php', 1678454248, 1678454248, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(123, '/testlink_1_9_20/lib/plan/planEdit.php', 1678454426, 1678454426, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(124, '/lib/testcases/listTestCases.php', 1678454461, 1678454461, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(125, '/lib/testcases/archiveData.php', 1678454462, 1678454462, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(126, '/lib/requirements/reqTcAssign.php', 1678454600, 1678454600, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(127, '/lib/testcases/archiveData.php', 1678454605, 1678454605, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(128, '/lib/plan/planAddTCNavigator.php', 1678454656, 1678454656, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(129, '/testlink_1_9_20/lib/plan/planAddTC.php', 1678454749, 1678454749, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(130, '/lib/plan/planAddTCNavigator.php', 1678454749, 1678454749, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(131, '/lib/plan/planAddTCNavigator.php', 1678454778, 1678454778, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(132, '/testlink_1_9_20/lib/plan/planAddTC.php', 1678454794, 1678454794, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(133, '/lib/plan/planAddTCNavigator.php', 1678454794, 1678454794, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(134, '/lib/plan/planAddTCNavigator.php', 1678454799, 1678454799, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(135, '/testlink_1_9_20/lib/plan/buildEdit.php', 1678454924, 1678454924, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(136, '/testlink_1_9_20/lib/plan/planEdit.php', 1678455122, 1678455122, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(137, '/testlink_1_9_20/lib/plan/planEdit.php', 1678455155, 1678455155, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(138, '/testlink_1_9_20/lib/plan/planEdit.php', 1678455178, 1678455178, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(139, '/lib/plan/planAddTCNavigator.php', 1678455223, 1678455223, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(140, '/lib/plan/planAddTCNavigator.php', 1678455245, 1678455245, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(141, '/lib/plan/planAddTCNavigator.php', 1678455256, 1678455256, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(142, '/testlink_1_9_20/lib/plan/planAddTC.php', 1678455261, 1678455261, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(143, '/lib/plan/planAddTCNavigator.php', 1678455261, 1678455261, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(144, '/lib/plan/planAddTCNavigator.php', 1678455263, 1678455263, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(145, '/lib/execute/execSetResults.php', 1678455409, 1678455409, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(146, '/lib/execute/execSetResults.php', 1678455450, 1678455450, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(147, '/lib/results/resultsGeneral.php', 1678455519, 1678455519, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(148, '/testlink_1_9_20/lib/plan/planEdit.php', 1678455782, 1678455782, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(149, '/testlink_1_9_20/lib/plan/planEdit.php', 1678455790, 1678455790, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(150, '/lib/testcases/listTestCases.php', 1678456168, 1678456168, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(151, '/lib/testcases/archiveData.php', 1678456169, 1678456169, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(152, '/testlink_1_9_20/lib/plan/planEdit.php', 1678456228, 1678456228, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(153, '/lib/requirements/reqSpecEdit.php', 1678456796, 1678456796, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(154, '/lib/requirements/reqSpecEdit.php', 1678456810, 1678456810, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(155, '/lib/requirements/reqSpecEdit.php', 1678456845, 1678456845, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(156, '/lib/requirements/reqSpecEdit.php', 1678456859, 1678456859, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(157, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678456932, 1678456932, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(158, '/lib/testcases/listTestCases.php', 1678457264, 1678457264, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(159, '/lib/testcases/archiveData.php', 1678457265, 1678457265, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(160, '/lib/testcases/archiveData.php', 1678457304, 1678457304, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(161, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678457610, 1678457610, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(162, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678457704, 1678457704, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(163, '/lib/testcases/listTestCases.php', 1678457705, 1678457705, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(164, '/lib/testcases/archiveData.php', 1678457705, 1678457705, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(165, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678457821, 1678457821, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(166, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678457845, 1678457845, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(167, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678457869, 1678457869, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(168, '/lib/testcases/listTestCases.php', 1678457900, 1678457900, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(169, '/lib/testcases/archiveData.php', 1678457901, 1678457901, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(170, '/lib/testcases/listTestCases.php', 1678457917, 1678457917, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(171, '/lib/testcases/archiveData.php', 1678457918, 1678457918, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(172, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678457926, 1678457926, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(173, '/testlink_1_9_20/logout.php', 1678457928, 1678457928, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(174, '/testlink_1_9_20/login.php', 1678457933, 1678457933, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(175, '/lib/testcases/listTestCases.php', 1678457938, 1678457938, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(176, '/lib/testcases/archiveData.php', 1678457939, 1678457939, 1, '101cc094cfc3c90a032fc2838f55bdb9'),
(177, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678458055, 1678458055, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(178, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1678458077, 1678458077, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(179, '/lib/testcases/listTestCases.php', 1678458086, 1678458086, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(180, '/lib/testcases/archiveData.php', 1678458087, 1678458087, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(181, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678458302, 1678458302, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(182, '/lib/testcases/listTestCases.php', 1678458302, 1678458302, 1, '2bda10a0c4a08dc6eaaec7c0c7d32394'),
(183, '/testlink_1_9_20/login.php', 1678612644, 1678612644, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(184, '/lib/testcases/listTestCases.php', 1678612655, 1678612655, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(185, '/lib/testcases/archiveData.php', 1678612656, 1678612656, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(186, '/lib/testcases/listTestCases.php', 1678616821, 1678616821, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(187, '/lib/testcases/archiveData.php', 1678616822, 1678616822, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(188, '/lib/testcases/archiveData.php', 1678616823, 1678616823, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(189, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617635, 1678617635, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(190, '/lib/testcases/listTestCases.php', 1678617636, 1678617636, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(191, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617845, 1678617845, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(192, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617851, 1678617851, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(193, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617911, 1678617911, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(194, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617916, 1678617916, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(195, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617921, 1678617921, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(196, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678617924, 1678617924, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(197, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678618446, 1678618446, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(198, '/lib/testcases/listTestCases.php', 1678618446, 1678618446, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(199, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678618500, 1678618500, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(200, '/lib/testcases/listTestCases.php', 1678618500, 1678618500, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(201, '/lib/plan/tc_exec_assignment.php', 1678618998, 1678618998, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(202, '/lib/plan/tc_exec_assignment.php', 1678619019, 1678619019, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(203, '/lib/plan/tc_exec_assignment.php', 1678619020, 1678619020, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(204, '/lib/plan/tc_exec_assignment.php', 1678619020, 1678619020, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(205, '/lib/plan/tc_exec_assignment.php', 1678619035, 1678619035, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(206, '/lib/plan/tc_exec_assignment.php', 1678619035, 1678619035, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(207, '/lib/plan/planAddTCNavigator.php', 1678619156, 1678619156, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(208, '/lib/plan/planAddTCNavigator.php', 1678619187, 1678619187, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(209, '/lib/plan/planAddTCNavigator.php', 1678619195, 1678619195, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(210, '/lib/plan/planAddTCNavigator.php', 1678619200, 1678619200, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(211, '/lib/plan/planAddTCNavigator.php', 1678619211, 1678619211, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(212, '/lib/plan/tc_exec_assignment.php', 1678619296, 1678619296, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(213, '/lib/plan/tc_exec_assignment.php', 1678619296, 1678619296, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(214, '/lib/execute/execSetResults.php', 1678619430, 1678619430, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(215, '/lib/results/resultsByTSuite.php', 1678619527, 1678619527, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(216, '/lib/results/resultsGeneral.php', 1678619545, 1678619545, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(217, '/lib/testcases/listTestCases.php', 1678619690, 1678619690, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(218, '/lib/testcases/archiveData.php', 1678619690, 1678619690, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(219, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678620904, 1678620904, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(220, '/lib/testcases/listTestCases.php', 1678620905, 1678620905, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(221, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678650568, 1678650568, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(222, '/lib/testcases/listTestCases.php', 1678650568, 1678650568, 1, '1a8f4a5a5556b51dfd10f73d6b79e63a'),
(223, '/testlink_1_9_20/login.php', 1678781925, 1678781925, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(224, '/lib/testcases/listTestCases.php', 1678781960, 1678781960, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(225, '/lib/testcases/archiveData.php', 1678781961, 1678781961, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(226, '/lib/testcases/archiveData.php', 1678781965, 1678781965, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(227, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678782195, 1678782195, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(228, '/lib/testcases/listTestCases.php', 1678782196, 1678782196, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(229, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678782599, 1678782599, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(230, '/lib/plan/tc_exec_assignment.php', 1678782798, 1678782798, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(231, '/lib/plan/tc_exec_assignment.php', 1678782838, 1678782838, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(232, '/lib/plan/tc_exec_assignment.php', 1678782852, 1678782852, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(233, '/lib/plan/tc_exec_assignment.php', 1678782873, 1678782873, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(234, '/lib/plan/tc_exec_assignment.php', 1678782880, 1678782880, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(235, '/lib/plan/tc_exec_assignment.php', 1678782881, 1678782881, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(236, '/lib/plan/tc_exec_assignment.php', 1678782882, 1678782882, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(237, '/lib/plan/tc_exec_assignment.php', 1678782882, 1678782882, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(238, '/lib/plan/tc_exec_assignment.php', 1678782884, 1678782884, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(239, '/lib/plan/tc_exec_assignment.php', 1678782884, 1678782884, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(240, '/lib/plan/tc_exec_assignment.php', 1678783021, 1678783021, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(241, '/lib/plan/tc_exec_assignment.php', 1678783096, 1678783096, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(242, '/lib/plan/tc_exec_assignment.php', 1678783100, 1678783100, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(243, '/testlink_1_9_20/login.php', 1678783432, 1678783432, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(244, '/lib/plan/tc_exec_assignment.php', 1678783437, 1678783437, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(245, '/lib/plan/tc_exec_assignment.php', 1678783440, 1678783440, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(246, '/testlink_1_9_20/lib/plan/planEdit.php', 1678783443, 1678783443, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(247, '/lib/plan/tc_exec_assignment.php', 1678783444, 1678783444, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(248, '/lib/plan/tc_exec_assignment.php', 1678783454, 1678783454, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(249, '/lib/testcases/listTestCases.php', 1678783460, 1678783460, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(250, '/lib/testcases/archiveData.php', 1678783461, 1678783461, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(251, '/lib/testcases/archiveData.php', 1678783581, 1678783581, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(252, '/lib/testcases/listTestCases.php', 1678783582, 1678783582, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(253, '/lib/testcases/listTestCases.php', 1678783582, 1678783582, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(254, '/lib/testcases/archiveData.php', 1678783583, 1678783583, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(255, '/lib/testcases/archiveData.php', 1678783599, 1678783599, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(256, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678783823, 1678783823, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(257, '/lib/testcases/listTestCases.php', 1678783916, 1678783916, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(258, '/lib/testcases/archiveData.php', 1678783916, 1678783916, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(259, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678783951, 1678783951, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(260, '/lib/testcases/listTestCases.php', 1678783951, 1678783951, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(261, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678784297, 1678784297, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(262, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678784506, 1678784506, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(263, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678784581, 1678784581, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(264, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678784670, 1678784670, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(265, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678784677, 1678784677, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(266, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678785122, 1678785122, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(267, '/lib/testcases/listTestCases.php', 1678785122, 1678785122, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(268, '/lib/testcases/listTestCases.php', 1678785354, 1678785354, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(269, '/lib/testcases/archiveData.php', 1678785355, 1678785355, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(270, '/lib/testcases/listTestCases.php', 1678785399, 1678785399, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(271, '/lib/testcases/archiveData.php', 1678785400, 1678785400, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(272, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678786387, 1678786387, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(273, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678786498, 1678786498, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(274, '/lib/testcases/listTestCases.php', 1678786498, 1678786498, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(275, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678786547, 1678786547, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(276, '/lib/testcases/listTestCases.php', 1678786547, 1678786547, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(277, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678786657, 1678786657, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(278, '/lib/testcases/listTestCases.php', 1678786658, 1678786658, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(279, '/lib/testcases/archiveData.php', 1678786670, 1678786670, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(280, '/lib/testcases/listTestCases.php', 1678786671, 1678786671, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(281, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678786740, 1678786740, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(282, '/lib/testcases/listTestCases.php', 1678786740, 1678786740, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(283, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678786772, 1678786772, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(284, '/lib/testcases/listTestCases.php', 1678786772, 1678786772, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(285, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678787170, 1678787170, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(286, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678787318, 1678787318, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(287, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678787327, 1678787327, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(288, '/lib/testcases/listTestCases.php', 1678787377, 1678787377, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(289, '/lib/testcases/archiveData.php', 1678787378, 1678787378, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(290, '/lib/testcases/listTestCases.php', 1678788596, 1678788596, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(291, '/lib/testcases/listTestCases.php', 1678788596, 1678788596, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(292, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678788673, 1678788673, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(293, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678788680, 1678788680, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(294, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678788683, 1678788683, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(295, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678788705, 1678788705, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(296, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678789091, 1678789091, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(297, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678789319, 1678789319, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(298, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678789347, 1678789347, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(299, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678789596, 1678789596, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(300, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678789761, 1678789761, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(301, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678789982, 1678789982, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(302, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678790062, 1678790062, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(303, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678791103, 1678791104, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(304, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678791211, 1678791211, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(305, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678791491, 1678791491, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(306, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678791618, 1678791618, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(307, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678791826, 1678791826, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(308, '/lib/testcases/listTestCases.php', 1678791826, 1678791826, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(309, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678792360, 1678792360, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(310, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796104, 1678796104, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(311, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796127, 1678796127, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(312, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796344, 1678796344, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(313, '/lib/testcases/listTestCases.php', 1678796363, 1678796363, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(314, '/lib/testcases/archiveData.php', 1678796364, 1678796364, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(315, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796394, 1678796394, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(316, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796444, 1678796444, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(317, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796459, 1678796459, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(318, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796485, 1678796485, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(319, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796570, 1678796570, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(320, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796577, 1678796577, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(321, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796585, 1678796585, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(322, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796667, 1678796667, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(323, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796679, 1678796679, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(324, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796850, 1678796850, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(325, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796879, 1678796879, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(326, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796883, 1678796883, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(327, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678796981, 1678796981, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(328, '/lib/testcases/archiveData.php', 1678797004, 1678797004, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(329, '/lib/testcases/listTestCases.php', 1678797005, 1678797005, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(330, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797051, 1678797051, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(331, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797070, 1678797070, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(332, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797077, 1678797077, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(333, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797139, 1678797139, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(334, '/testlink_1_9_20/login.php', 1678797154, 1678797154, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(335, '/lib/testcases/listTestCases.php', 1678797160, 1678797160, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(336, '/lib/testcases/archiveData.php', 1678797161, 1678797161, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(337, '/lib/testcases/archiveData.php', 1678797164, 1678797164, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(338, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797164, 1678797164, 1, '9c64f3fbb0f7df76158f91ea31c31ad8'),
(339, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797198, 1678797199, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(340, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797211, 1678797211, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(341, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797245, 1678797245, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(342, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797251, 1678797251, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(343, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797265, 1678797265, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(344, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797333, 1678797333, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(345, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797406, 1678797406, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(346, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797521, 1678797521, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(347, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797567, 1678797567, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(348, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797575, 1678797575, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(349, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678797715, 1678797715, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(350, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798000, 1678798000, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(351, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798189, 1678798189, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(352, '/testlink_1_9_20/login.php', 1678798419, 1678798419, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(353, '/lib/testcases/listTestCases.php', 1678798435, 1678798435, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(354, '/lib/testcases/archiveData.php', 1678798435, 1678798435, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(355, '/lib/testcases/archiveData.php', 1678798441, 1678798441, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(356, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798547, 1678798547, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(357, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798547, 1678798547, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(358, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798666, 1678798666, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(359, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798689, 1678798689, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(360, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798798, 1678798798, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(361, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678798972, 1678798972, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(362, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678799082, 1678799082, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(363, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678799086, 1678799086, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(364, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678799114, 1678799114, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(365, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678799126, 1678799126, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(366, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678799245, 1678799245, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(367, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678802725, 1678802725, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(368, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678802782, 1678802782, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(369, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678802845, 1678802845, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(370, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678802927, 1678802927, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(371, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678802978, 1678802978, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(372, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678803044, 1678803044, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(373, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678803103, 1678803103, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(374, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678803190, 1678803190, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(375, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678803227, 1678803227, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(376, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678803313, 1678803313, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(377, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678803677, 1678803677, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(378, '/testlink_1_9_20/login.php', 1678804789, 1678804789, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(379, '/lib/testcases/listTestCases.php', 1678804791, 1678804791, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(380, '/lib/testcases/archiveData.php', 1678804792, 1678804792, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(381, '/lib/testcases/archiveData.php', 1678804794, 1678804794, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(382, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678804844, 1678804844, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(383, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678804858, 1678804858, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(384, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678804863, 1678804863, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(385, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805054, 1678805054, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(386, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805128, 1678805128, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(387, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805200, 1678805200, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(388, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805325, 1678805325, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(389, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805347, 1678805347, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(390, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805353, 1678805353, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(391, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805365, 1678805365, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(392, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805369, 1678805369, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(393, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805375, 1678805375, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(394, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805478, 1678805478, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(395, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805525, 1678805525, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(396, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678805574, 1678805574, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(397, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678806051, 1678806051, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(398, '/testlink_1_9_20/lib/plan/planEdit.php', 1678807225, 1678807225, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(399, '/lib/testcases/listTestCases.php', 1678807252, 1678807252, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(400, '/lib/testcases/listTestCases.php', 1678807279, 1678807279, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(401, '/lib/testcases/archiveData.php', 1678807280, 1678807280, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(402, '/lib/usermanagement/userInfo.php', 1678807783, 1678807783, 1, 'be7524c45f19005e8fe3b7fc3ba59778'),
(403, '/lib/testcases/listTestCases.php', 1678807950, 1678807950, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(404, '/lib/testcases/archiveData.php', 1678807951, 1678807951, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(405, '/lib/testcases/listTestCases.php', 1678868561, 1678868561, 1, 'cf114709f4fe9ffc7b95b9f7f6d7edeb'),
(406, '/testlink_1_9_20/login.php', 1678955299, 1678955299, 1, 'c89587695b04551cc53ec24fb754c090'),
(407, '/lib/testcases/archiveData.php', 1678955318, 1678955318, 1, 'c89587695b04551cc53ec24fb754c090'),
(408, '/lib/testcases/listTestCases.php', 1678955319, 1678955319, 1, 'c89587695b04551cc53ec24fb754c090'),
(409, '/lib/testcases/archiveData.php', 1678955347, 1678955347, 1, 'c89587695b04551cc53ec24fb754c090'),
(410, '/lib/testcases/listTestCases.php', 1678971211, 1678971211, 1, 'c89587695b04551cc53ec24fb754c090'),
(411, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678973514, 1678973514, 1, 'c89587695b04551cc53ec24fb754c090'),
(412, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1678973532, 1678973532, 1, 'c89587695b04551cc53ec24fb754c090'),
(413, '/testlink_1_9_20/login.php', 1679304722, 1679304722, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(414, '/lib/testcases/listTestCases.php', 1679304728, 1679304728, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(415, '/lib/testcases/archiveData.php', 1679304729, 1679304729, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(416, '/lib/testcases/archiveData.php', 1679304734, 1679304734, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(417, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679304939, 1679304939, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(418, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679305406, 1679305406, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(419, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679305764, 1679305764, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(420, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679305775, 1679305775, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(421, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679305833, 1679305833, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(422, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679305866, 1679305866, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(423, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679305999, 1679305999, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(424, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679306148, 1679306148, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(425, '/lib/testcases/listTestCases.php', 1679306148, 1679306148, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(426, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679306177, 1679306177, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(427, '/lib/testcases/listTestCases.php', 1679306177, 1679306177, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(428, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679306208, 1679306208, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(429, '/lib/testcases/listTestCases.php', 1679306208, 1679306208, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(430, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679307172, 1679307172, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(431, '/lib/testcases/listTestCases.php', 1679307172, 1679307172, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(432, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679307372, 1679307372, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(433, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679307406, 1679307406, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(434, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679307537, 1679307537, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(435, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679307630, 1679307630, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(436, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679307943, 1679307943, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(437, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308112, 1679308112, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(438, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308118, 1679308118, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(439, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308201, 1679308201, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(440, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308295, 1679308295, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(441, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308385, 1679308385, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(442, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308496, 1679308496, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(443, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308811, 1679308811, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(444, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308890, 1679308890, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(445, '/lib/testcases/listTestCases.php', 1679308890, 1679308890, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(446, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679308987, 1679308987, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(447, '/lib/testcases/listTestCases.php', 1679308987, 1679308987, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(448, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309035, 1679309035, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(449, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309102, 1679309102, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(450, '/lib/testcases/listTestCases.php', 1679309103, 1679309103, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(451, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309132, 1679309132, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(452, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309160, 1679309160, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(453, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309199, 1679309199, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(454, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309228, 1679309228, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(455, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309247, 1679309247, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(456, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309267, 1679309267, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(457, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309336, 1679309336, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(458, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309361, 1679309361, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(459, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309379, 1679309379, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(460, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309406, 1679309406, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(461, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309453, 1679309453, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(462, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309497, 1679309497, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(463, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309521, 1679309521, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(464, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679309555, 1679309555, 1, '12d0f4ec33add0b493bbe8d5c5218594');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES
(465, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679310540, 1679310540, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(466, '/lib/testcases/listTestCases.php', 1679310540, 1679310540, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(467, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679314264, 1679314264, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(468, '/lib/testcases/listTestCases.php', 1679314264, 1679314264, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(469, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679315487, 1679315487, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(470, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679315542, 1679315542, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(471, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679315611, 1679315611, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(472, '/lib/testcases/listTestCases.php', 1679315611, 1679315611, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(473, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679315741, 1679315741, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(474, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679315831, 1679315831, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(475, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316190, 1679316190, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(476, '/lib/testcases/listTestCases.php', 1679316191, 1679316191, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(477, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316237, 1679316237, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(478, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316248, 1679316248, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(479, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316326, 1679316326, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(480, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316341, 1679316341, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(481, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316358, 1679316358, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(482, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316364, 1679316364, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(483, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316405, 1679316405, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(484, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679316423, 1679316423, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(485, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679317507, 1679317507, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(486, '/lib/testcases/listTestCases.php', 1679317507, 1679317507, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(487, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679318039, 1679318039, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(488, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679318198, 1679318198, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(489, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679318282, 1679318282, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(490, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679318349, 1679318349, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(491, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679318459, 1679318459, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(492, '/lib/testcases/listTestCases.php', 1679318460, 1679318460, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(493, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679320471, 1679320471, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(494, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679321155, 1679321155, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(495, '/lib/testcases/listTestCases.php', 1679387019, 1679387019, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(496, '/lib/testcases/archiveData.php', 1679387020, 1679387020, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(497, '/lib/testcases/archiveData.php', 1679388150, 1679388150, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(498, '/lib/testcases/listTestCases.php', 1679388234, 1679388234, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(499, '/testlink_1_9_20/login.php', 1679396021, 1679396021, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(500, '/lib/testcases/listTestCases.php', 1679396030, 1679396030, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(501, '/lib/testcases/archiveData.php', 1679396031, 1679396031, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(502, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396321, 1679396321, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(503, '/lib/testcases/listTestCases.php', 1679396321, 1679396321, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(504, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396584, 1679396584, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(505, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396636, 1679396636, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(506, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396780, 1679396780, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(507, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396783, 1679396783, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(508, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396793, 1679396793, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(509, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396798, 1679396798, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(510, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396805, 1679396805, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(511, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679396887, 1679396887, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(512, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400483, 1679400483, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(513, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400516, 1679400516, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(514, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400586, 1679400586, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(515, '/lib/testcases/listTestCases.php', 1679400586, 1679400586, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(516, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400669, 1679400669, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(517, '/lib/testcases/listTestCases.php', 1679400670, 1679400670, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(518, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400734, 1679400734, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(519, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400754, 1679400754, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(520, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400771, 1679400771, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(521, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400806, 1679400806, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(522, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679400882, 1679400882, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(523, '/lib/testcases/archiveData.php', 1679401895, 1679401895, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(524, '/lib/testcases/listTestCases.php', 1679401896, 1679401896, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(525, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679402020, 1679402020, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(526, '/lib/testcases/listTestCases.php', 1679402085, 1679402085, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(527, '/lib/testcases/archiveData.php', 1679402086, 1679402086, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(528, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679402217, 1679402217, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(529, '/lib/testcases/listTestCases.php', 1679402218, 1679402218, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(530, '/lib/testcases/listTestCases.php', 1679402258, 1679402258, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(531, '/lib/testcases/archiveData.php', 1679402259, 1679402259, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(532, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679402569, 1679402569, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(533, '/lib/testcases/listTestCases.php', 1679402853, 1679402853, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(534, '/lib/testcases/archiveData.php', 1679402854, 1679402854, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(535, '/lib/plan/tc_exec_assignment.php', 1679403048, 1679403048, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(536, '/lib/plan/tc_exec_assignment.php', 1679403128, 1679403128, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(537, '/lib/plan/tc_exec_assignment.php', 1679403209, 1679403210, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(538, '/lib/usermanagement/usersAssign.php', 1679403349, 1679403349, 1, '12d0f4ec33add0b493bbe8d5c5218594'),
(539, '/testlink_1_9_20/login.php', 1679408631, 1679408631, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(540, '/lib/testcases/listTestCases.php', 1679408806, 1679408806, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(541, '/lib/testcases/archiveData.php', 1679408806, 1679408806, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(542, '/testlink_1_9_20/login.php', 1679413401, 1679413401, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(543, '/lib/testcases/listTestCases.php', 1679413435, 1679413435, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(544, '/lib/testcases/archiveData.php', 1679413436, 1679413436, 1, 'b1e70ce463329d8579d888c52f74a15c');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tsuites_tree_depth_2`
-- (See below for the actual view)
--
CREATE TABLE `tsuites_tree_depth_2` (
`prefix` varchar(16)
,`testproject_name` varchar(100)
,`level1_name` varchar(100)
,`level2_name` varchar(100)
,`testproject_id` int(10) unsigned
,`level1_id` int(10) unsigned
,`level2_id` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `script_key` varchar(32) DEFAULT NULL,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `auth_method` varchar(10) DEFAULT '',
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User information';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role_id`, `email`, `first`, `last`, `locale`, `default_testproject_id`, `active`, `script_key`, `cookie_string`, `auth_method`, `creation_ts`, `expiration_date`) VALUES
(1, 'admin', '$2y$10$IVs5VghxCwm4ffsfaH5vbObOv/c61XYMfsJlnZnwqBMIPw9LZJYum', 8, '', 'Testlink', 'Administrator', 'en_GB', NULL, 1, NULL, 'c28eb00b45cce7cb0473f7cb10484820897a31ade09268adc38d2e0999a05535', '', '2023-03-07 15:55:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_assignments`
--

CREATE TABLE `user_assignments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `feature_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED DEFAULT 0,
  `build_id` int(10) UNSIGNED DEFAULT 0,
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) UNSIGNED DEFAULT 0,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `user_assignments`
--

INSERT INTO `user_assignments` (`id`, `type`, `feature_id`, `user_id`, `build_id`, `deadline_ts`, `assigner_id`, `creation_ts`, `status`) VALUES
(2, 1, 3, 1, 4, NULL, 1, '2023-03-21 12:53:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_assign`
--

CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_testplan_roles`
--

CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_testproject_roles`
--

CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testproject_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `exec_by_date_time`
--
DROP TABLE IF EXISTS `exec_by_date_time`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `exec_by_date_time`  AS   (select `NHTPL`.`name` AS `testplan_name`,date_format(`E`.`execution_ts`,'%Y-%m-%d') AS `yyyy_mm_dd`,date_format(`E`.`execution_ts`,'%Y-%m') AS `yyyy_mm`,date_format(`E`.`execution_ts`,'%H') AS `hh`,date_format(`E`.`execution_ts`,'%k') AS `hour`,`E`.`id` AS `id`,`E`.`build_id` AS `build_id`,`E`.`tester_id` AS `tester_id`,`E`.`execution_ts` AS `execution_ts`,`E`.`status` AS `status`,`E`.`testplan_id` AS `testplan_id`,`E`.`tcversion_id` AS `tcversion_id`,`E`.`tcversion_number` AS `tcversion_number`,`E`.`platform_id` AS `platform_id`,`E`.`execution_type` AS `execution_type`,`E`.`execution_duration` AS `execution_duration`,`E`.`notes` AS `notes` from ((`executions` `E` join `testplans` `TPL` on(`TPL`.`id` = `E`.`testplan_id`)) join `nodes_hierarchy` `NHTPL` on(`NHTPL`.`id` = `TPL`.`id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_exec_by_context`
--
DROP TABLE IF EXISTS `latest_exec_by_context`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_exec_by_context`  AS SELECT `executions`.`tcversion_id` AS `tcversion_id`, `executions`.`testplan_id` AS `testplan_id`, `executions`.`build_id` AS `build_id`, `executions`.`platform_id` AS `platform_id`, max(`executions`.`id`) AS `id` FROM `executions` GROUP BY `executions`.`tcversion_id`, `executions`.`testplan_id`, `executions`.`build_id`, `executions`.`platform_id``platform_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_exec_by_testplan`
--
DROP TABLE IF EXISTS `latest_exec_by_testplan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_exec_by_testplan`  AS SELECT `executions`.`tcversion_id` AS `tcversion_id`, `executions`.`testplan_id` AS `testplan_id`, max(`executions`.`id`) AS `id` FROM `executions` GROUP BY `executions`.`tcversion_id`, `executions`.`testplan_id``testplan_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_exec_by_testplan_plat`
--
DROP TABLE IF EXISTS `latest_exec_by_testplan_plat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_exec_by_testplan_plat`  AS SELECT `executions`.`tcversion_id` AS `tcversion_id`, `executions`.`testplan_id` AS `testplan_id`, `executions`.`platform_id` AS `platform_id`, max(`executions`.`id`) AS `id` FROM `executions` GROUP BY `executions`.`tcversion_id`, `executions`.`testplan_id`, `executions`.`platform_id``platform_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_req_version`
--
DROP TABLE IF EXISTS `latest_req_version`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_req_version`  AS SELECT `RQ`.`id` AS `req_id`, max(`RQV`.`version`) AS `version` FROM ((`nodes_hierarchy` `NHRQV` join `requirements` `RQ` on(`RQ`.`id` = `NHRQV`.`parent_id`)) join `req_versions` `RQV` on(`RQV`.`id` = `NHRQV`.`id`)) GROUP BY `RQ`.`id``id`  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_req_version_id`
--
DROP TABLE IF EXISTS `latest_req_version_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_req_version_id`  AS SELECT `LRQVN`.`req_id` AS `req_id`, `LRQVN`.`version` AS `version`, `REQV`.`id` AS `req_version_id` FROM ((`latest_req_version` `LRQVN` join `nodes_hierarchy` `NHRQV` on(`NHRQV`.`parent_id` = `LRQVN`.`req_id`)) join `req_versions` `REQV` on(`REQV`.`id` = `NHRQV`.`id` and `REQV`.`version` = `LRQVN`.`version`))  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_rspec_revision`
--
DROP TABLE IF EXISTS `latest_rspec_revision`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_rspec_revision`  AS SELECT `RSR`.`parent_id` AS `req_spec_id`, `RS`.`testproject_id` AS `testproject_id`, max(`RSR`.`revision`) AS `revision` FROM (`req_specs_revisions` `RSR` join `req_specs` `RS` on(`RS`.`id` = `RSR`.`parent_id`)) GROUP BY `RSR`.`parent_id`, `RS`.`testproject_id``testproject_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_tcase_version_id`
--
DROP TABLE IF EXISTS `latest_tcase_version_id`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_tcase_version_id`  AS SELECT `LTCVN`.`testcase_id` AS `testcase_id`, `LTCVN`.`version` AS `version`, `TCV`.`id` AS `tcversion_id` FROM ((`latest_tcase_version_number` `LTCVN` join `nodes_hierarchy` `NHTCV` on(`NHTCV`.`parent_id` = `LTCVN`.`testcase_id`)) join `tcversions` `TCV` on(`TCV`.`id` = `NHTCV`.`id` and `TCV`.`version` = `LTCVN`.`version`))  ;

-- --------------------------------------------------------

--
-- Structure for view `latest_tcase_version_number`
--
DROP TABLE IF EXISTS `latest_tcase_version_number`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `latest_tcase_version_number`  AS SELECT `NH_TC`.`id` AS `testcase_id`, max(`TCV`.`version`) AS `version` FROM ((`nodes_hierarchy` `NH_TC` join `nodes_hierarchy` `NH_TCV` on(`NH_TCV`.`parent_id` = `NH_TC`.`id`)) join `tcversions` `TCV` on(`NH_TCV`.`id` = `TCV`.`id`)) GROUP BY `NH_TC`.`id``id`  ;

-- --------------------------------------------------------

--
-- Structure for view `tcversions_without_keywords`
--
DROP TABLE IF EXISTS `tcversions_without_keywords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `tcversions_without_keywords`  AS SELECT `NHTCV`.`parent_id` AS `testcase_id`, `NHTCV`.`id` AS `id` FROM `nodes_hierarchy` AS `NHTCV` WHERE `NHTCV`.`node_type_id` = 4 AND !exists(select 1 from `testcase_keywords` `TCK` where `TCK`.`tcversion_id` = `NHTCV`.`id` limit 1)  ;

-- --------------------------------------------------------

--
-- Structure for view `tcversions_without_platforms`
--
DROP TABLE IF EXISTS `tcversions_without_platforms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `tcversions_without_platforms`  AS SELECT `NHTCV`.`parent_id` AS `testcase_id`, `NHTCV`.`id` AS `id` FROM `nodes_hierarchy` AS `NHTCV` WHERE `NHTCV`.`node_type_id` = 4 AND !exists(select 1 from `testcase_platforms` `TCPL` where `TCPL`.`tcversion_id` = `NHTCV`.`id` limit 1)  ;

-- --------------------------------------------------------

--
-- Structure for view `tsuites_tree_depth_2`
--
DROP TABLE IF EXISTS `tsuites_tree_depth_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`kamkam`@`%` SQL SECURITY DEFINER VIEW `tsuites_tree_depth_2`  AS SELECT `TPRJ`.`prefix` AS `prefix`, `NHTPRJ`.`name` AS `testproject_name`, `NHTS_L1`.`name` AS `level1_name`, `NHTS_L2`.`name` AS `level2_name`, `NHTPRJ`.`id` AS `testproject_id`, `NHTS_L1`.`id` AS `level1_id`, `NHTS_L2`.`id` AS `level2_id` FROM (((`testprojects` `TPRJ` join `nodes_hierarchy` `NHTPRJ` on(`TPRJ`.`id` = `NHTPRJ`.`id`)) left join `nodes_hierarchy` `NHTS_L1` on(`NHTS_L1`.`parent_id` = `NHTPRJ`.`id`)) left join `nodes_hierarchy` `NHTS_L2` on(`NHTS_L2`.`parent_id` = `NHTS_L1`.`id`)) WHERE `NHTPRJ`.`node_type_id` = 1 AND `NHTS_L1`.`node_type_id` = 2 AND `NHTS_L2`.`node_type_id` = 22  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_status`
--
ALTER TABLE `assignment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_types`
--
ALTER TABLE `assignment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_idx1` (`fk_id`);

--
-- Indexes for table `baseline_l1l2_context`
--
ALTER TABLE `baseline_l1l2_context`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx1` (`testplan_id`,`platform_id`,`creation_ts`);

--
-- Indexes for table `baseline_l1l2_details`
--
ALTER TABLE `baseline_l1l2_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx1` (`context_id`,`top_tsuite_id`,`child_tsuite_id`,`status`);

--
-- Indexes for table `builds`
--
ALTER TABLE `builds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`testplan_id`,`name`),
  ADD KEY `testplan_id` (`testplan_id`);

--
-- Indexes for table `cfield_build_design_values`
--
ALTER TABLE `cfield_build_design_values`
  ADD PRIMARY KEY (`field_id`,`node_id`),
  ADD KEY `idx_cfield_build_design_values` (`node_id`);

--
-- Indexes for table `cfield_design_values`
--
ALTER TABLE `cfield_design_values`
  ADD PRIMARY KEY (`field_id`,`node_id`),
  ADD KEY `idx_cfield_design_values` (`node_id`);

--
-- Indexes for table `cfield_execution_values`
--
ALTER TABLE `cfield_execution_values`
  ADD PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`);

--
-- Indexes for table `cfield_node_types`
--
ALTER TABLE `cfield_node_types`
  ADD PRIMARY KEY (`field_id`,`node_type_id`),
  ADD KEY `idx_custom_fields_assign` (`node_type_id`);

--
-- Indexes for table `cfield_testplan_design_values`
--
ALTER TABLE `cfield_testplan_design_values`
  ADD PRIMARY KEY (`field_id`,`link_id`),
  ADD KEY `idx_cfield_tplan_design_val` (`link_id`);

--
-- Indexes for table `cfield_testprojects`
--
ALTER TABLE `cfield_testprojects`
  ADD PRIMARY KEY (`field_id`,`testproject_id`);

--
-- Indexes for table `codetrackers`
--
ALTER TABLE `codetrackers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codetrackers_uidx1` (`name`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_custom_fields_name` (`name`);

--
-- Indexes for table `db_version`
--
ALTER TABLE `db_version`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `fired_at` (`fired_at`);

--
-- Indexes for table `executions`
--
ALTER TABLE `executions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  ADD KEY `executions_idx2` (`execution_type`),
  ADD KEY `executions_idx3` (`tcversion_id`);

--
-- Indexes for table `execution_bugs`
--
ALTER TABLE `execution_bugs`
  ADD PRIMARY KEY (`execution_id`,`bug_id`,`tcstep_id`);

--
-- Indexes for table `execution_tcsteps`
--
ALTER TABLE `execution_tcsteps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `execution_tcsteps_idx1` (`execution_id`,`tcstep_id`);

--
-- Indexes for table `execution_tcsteps_wip`
--
ALTER TABLE `execution_tcsteps_wip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `execution_tcsteps_wip_idx1` (`tcstep_id`,`testplan_id`,`platform_id`,`build_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_idx1` (`testproject_id`);

--
-- Indexes for table `issuetrackers`
--
ALTER TABLE `issuetrackers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `issuetrackers_uidx1` (`name`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyword_testproject_id` (`keyword`,`testproject_id`),
  ADD KEY `testproject_id` (`testproject_id`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  ADD KEY `testplan_id` (`testplan_id`);

--
-- Indexes for table `nodes_hierarchy`
--
ALTER TABLE `nodes_hierarchy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid_m_nodeorder` (`parent_id`,`node_order`),
  ADD KEY `nodes_hierarchy_node_type_id` (`node_type_id`);

--
-- Indexes for table `node_types`
--
ALTER TABLE `node_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `object_keywords`
--
ALTER TABLE `object_keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `udx01_object_keywords` (`fk_id`,`fk_table`,`keyword_id`);

--
-- Indexes for table `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_platforms` (`testproject_id`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins_configuration`
--
ALTER TABLE `plugins_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reqmgrsystems`
--
ALTER TABLE `reqmgrsystems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reqmgrsystems_uidx1` (`name`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`);

--
-- Indexes for table `req_coverage`
--
ALTER TABLE `req_coverage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_coverage_full_link` (`req_id`,`req_version_id`,`testcase_id`,`tcversion_id`);

--
-- Indexes for table `req_monitor`
--
ALTER TABLE `req_monitor`
  ADD PRIMARY KEY (`req_id`,`user_id`,`testproject_id`);

--
-- Indexes for table `req_relations`
--
ALTER TABLE `req_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `req_revisions`
--
ALTER TABLE `req_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`);

--
-- Indexes for table `req_specs`
--
ALTER TABLE `req_specs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  ADD KEY `testproject_id` (`testproject_id`);

--
-- Indexes for table `req_specs_revisions`
--
ALTER TABLE `req_specs_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `req_specs_revisions_uidx1` (`parent_id`,`revision`);

--
-- Indexes for table `req_versions`
--
ALTER TABLE `req_versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rights_descr` (`description`);

--
-- Indexes for table `risk_assignments`
--
ALTER TABLE `risk_assignments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_rights_roles_descr` (`description`);

--
-- Indexes for table `role_rights`
--
ALTER TABLE `role_rights`
  ADD PRIMARY KEY (`role_id`,`right_id`);

--
-- Indexes for table `tcsteps`
--
ALTER TABLE `tcsteps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcversions`
--
ALTER TABLE `tcversions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testcase_keywords`
--
ALTER TABLE `testcase_keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx01_testcase_keywords` (`testcase_id`,`tcversion_id`,`keyword_id`),
  ADD KEY `idx02_testcase_keywords` (`tcversion_id`);

--
-- Indexes for table `testcase_platforms`
--
ALTER TABLE `testcase_platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx01_testcase_platform` (`testcase_id`,`tcversion_id`,`platform_id`),
  ADD KEY `idx02_testcase_platform` (`tcversion_id`);

--
-- Indexes for table `testcase_relations`
--
ALTER TABLE `testcase_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testcase_script_links`
--
ALTER TABLE `testcase_script_links`
  ADD PRIMARY KEY (`tcversion_id`,`project_key`,`repository_name`,`code_path`);

--
-- Indexes for table `testplans`
--
ALTER TABLE `testplans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testplans_api_key` (`api_key`),
  ADD KEY `testplans_testproject_id_active` (`testproject_id`,`active`);

--
-- Indexes for table `testplan_platforms`
--
ALTER TABLE `testplan_platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`);

--
-- Indexes for table `testplan_tcversions`
--
ALTER TABLE `testplan_tcversions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`);

--
-- Indexes for table `testprojects`
--
ALTER TABLE `testprojects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testprojects_prefix` (`prefix`),
  ADD UNIQUE KEY `testprojects_api_key` (`api_key`),
  ADD KEY `testprojects_id_active` (`id`,`active`);

--
-- Indexes for table `testproject_codetracker`
--
ALTER TABLE `testproject_codetracker`
  ADD PRIMARY KEY (`testproject_id`);

--
-- Indexes for table `testproject_issuetracker`
--
ALTER TABLE `testproject_issuetracker`
  ADD PRIMARY KEY (`testproject_id`);

--
-- Indexes for table `testproject_reqmgrsystem`
--
ALTER TABLE `testproject_reqmgrsystem`
  ADD PRIMARY KEY (`testproject_id`);

--
-- Indexes for table `testsuites`
--
ALTER TABLE `testsuites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_templates`
--
ALTER TABLE `text_templates`
  ADD UNIQUE KEY `idx_text_templates` (`type`,`title`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login` (`login`),
  ADD UNIQUE KEY `users_cookie_string` (`cookie_string`);

--
-- Indexes for table `user_assignments`
--
ALTER TABLE `user_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_assignments_feature_id` (`feature_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_group` (`title`);

--
-- Indexes for table `user_group_assign`
--
ALTER TABLE `user_group_assign`
  ADD UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`);

--
-- Indexes for table `user_testplan_roles`
--
ALTER TABLE `user_testplan_roles`
  ADD PRIMARY KEY (`user_id`,`testplan_id`);

--
-- Indexes for table `user_testproject_roles`
--
ALTER TABLE `user_testproject_roles`
  ADD PRIMARY KEY (`user_id`,`testproject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_status`
--
ALTER TABLE `assignment_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `assignment_types`
--
ALTER TABLE `assignment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseline_l1l2_context`
--
ALTER TABLE `baseline_l1l2_context`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseline_l1l2_details`
--
ALTER TABLE `baseline_l1l2_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `builds`
--
ALTER TABLE `builds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `codetrackers`
--
ALTER TABLE `codetrackers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=644;

--
-- AUTO_INCREMENT for table `executions`
--
ALTER TABLE `executions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `execution_tcsteps`
--
ALTER TABLE `execution_tcsteps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `execution_tcsteps_wip`
--
ALTER TABLE `execution_tcsteps_wip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issuetrackers`
--
ALTER TABLE `issuetrackers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nodes_hierarchy`
--
ALTER TABLE `nodes_hierarchy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `node_types`
--
ALTER TABLE `node_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `object_keywords`
--
ALTER TABLE `object_keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plugins_configuration`
--
ALTER TABLE `plugins_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reqmgrsystems`
--
ALTER TABLE `reqmgrsystems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `req_coverage`
--
ALTER TABLE `req_coverage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `req_relations`
--
ALTER TABLE `req_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `risk_assignments`
--
ALTER TABLE `risk_assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testcase_keywords`
--
ALTER TABLE `testcase_keywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testcase_platforms`
--
ALTER TABLE `testcase_platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testcase_relations`
--
ALTER TABLE `testcase_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testplan_platforms`
--
ALTER TABLE `testplan_platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testplan_tcversions`
--
ALTER TABLE `testplan_tcversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=545;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_assignments`
--
ALTER TABLE `user_assignments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
