-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-kamkam.alwaysdata.net
-- Generation Time: Mar 28, 2023 at 02:14 PM
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

--
-- Dumping data for table `cfield_node_types`
--

INSERT INTO `cfield_node_types` (`field_id`, `node_type_id`) VALUES
(1, 3);

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

--
-- Dumping data for table `cfield_testprojects`
--

INSERT INTO `cfield_testprojects` (`field_id`, `testproject_id`, `display_order`, `location`, `active`, `required`, `required_on_design`, `required_on_execution`, `monitorable`) VALUES
(1, 28, 1, 1, 1, 0, 0, 0, 0);

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

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `label`, `type`, `possible_values`, `default_value`, `valid_regexp`, `length_min`, `length_max`, `show_on_design`, `enable_on_design`, `show_on_execution`, `enable_on_execution`, `show_on_testplan_design`, `enable_on_testplan_design`) VALUES
(1, 'java_class', 'Java Class', 0, '', '', '', 0, 0, 1, 1, 0, 0, 0, 0);

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
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(644, 545, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679472757, 'PHP', 0, NULL),
(645, 546, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679472758, 'PHP', 0, NULL),
(646, 547, 2, 'GUI - Test Project ID : 28', 'E_WARNING\narray_keys() expects parameter 1 to be array, null given - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/usersAssign.php - Line 555', 1679473104, 'PHP', 0, NULL),
(647, 547, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:40:\"audit_all_user_roles_removed_testproject\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473104, 'ASSIGN', 28, 'testprojects'),
(648, 547, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nInvalid argument supplied for foreach() - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/usersAssign.php - Line 556', 1679473104, 'PHP', 0, NULL),
(649, 548, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_created\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - 1b8be45b1ad77e3b20ea2abd5fac98821ce1e40b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473795, 'CREATE', 10, 'roles'),
(650, 549, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_created\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - 96450ebbdcb7b45beb9474714379af3b16902b38\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473799, 'CREATE', 11, 'roles'),
(651, 550, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_created\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - f9e9996efc9ff1a444ece09a94f7c5aee342aad6\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473800, 'CREATE', 12, 'roles'),
(652, 551, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_created\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - 9db9a6d1ab17ffa6eb82fc82b1f311f4e864878e\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473801, 'CREATE', 13, 'roles'),
(653, 552, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/rolesView.php - Line 35', 1679473808, 'PHP', 0, NULL),
(654, 552, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_deleted\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - 1b8be45b1ad77e3b20ea2abd5fac98821ce1e40b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473808, 'DELETE', 10, 'roles'),
(655, 553, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/rolesView.php - Line 35', 1679473811, 'PHP', 0, NULL),
(656, 553, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_deleted\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - 96450ebbdcb7b45beb9474714379af3b16902b38\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473811, 'DELETE', 11, 'roles'),
(657, 554, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/rolesView.php - Line 35', 1679473814, 'PHP', 0, NULL),
(658, 554, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_deleted\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - f9e9996efc9ff1a444ece09a94f7c5aee342aad6\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473814, 'DELETE', 12, 'roles'),
(659, 555, 2, 'GUI - Test Project ID : 28', 'E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /home/kamkam/www/testlink_1_9_20/lib/usermanagement/rolesView.php - Line 35', 1679473816, 'PHP', 0, NULL),
(660, 555, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_role_deleted\";s:6:\"params\";a:1:{i:0;s:55:\"admin - Copy - 9db9a6d1ab17ffa6eb82fc82b1f311f4e864878e\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679473816, 'DELETE', 13, 'roles'),
(661, 556, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679475045, 'CREATE', 169, 'requirements'),
(662, 556, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679475045, 'PHP', 0, NULL),
(663, 557, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679475089, 'SAVE', 169, 'requirements'),
(664, 557, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679475089, 'PHP', 0, NULL),
(665, 558, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475369, 'PHP', 0, NULL),
(666, 559, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475370, 'PHP', 0, NULL),
(667, 560, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679475406, 'PHP', 0, NULL),
(668, 561, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679475407, 'PHP', 0, NULL),
(669, 562, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1679475417, 'LOCALIZATION', 0, NULL),
(670, 562, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1679475417, 'LOCALIZATION', 0, NULL),
(671, 562, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1679475417, 'LOCALIZATION', 0, NULL),
(672, 563, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475492, 'PHP', 0, NULL),
(673, 563, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475492, 'PHP', 0, NULL),
(674, 564, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475511, 'PHP', 0, NULL),
(675, 565, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475514, 'PHP', 0, NULL),
(676, 566, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475515, 'PHP', 0, NULL),
(677, 567, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475518, 'PHP', 0, NULL),
(678, 568, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475520, 'PHP', 0, NULL),
(679, 569, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475520, 'PHP', 0, NULL),
(680, 570, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: platform_id - in /home/kamkam/www/testlink_1_9_20/lib/functions/specview.php - Line 747', 1679475521, 'PHP', 0, NULL),
(681, 571, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679475556, 'PHP', 0, NULL),
(682, 572, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679475557, 'PHP', 0, NULL),
(683, 573, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475879, 'PHP', 0, NULL),
(684, 574, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475883, 'PHP', 0, NULL),
(685, 575, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475883, 'PHP', 0, NULL),
(686, 576, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679475897, 'PHP', 0, NULL),
(687, 577, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679475898, 'PHP', 0, NULL),
(688, 578, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679475932, 'PHP', 0, NULL),
(689, 579, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679475932, 'PHP', 0, NULL),
(690, 580, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475973, 'PHP', 0, NULL),
(691, 581, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679475973, 'PHP', 0, NULL),
(692, 582, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: selected - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/6b1d4b63ba13268eda29f27c9b1e91ea2ec678e4_0.file.buildEdit.tpl.php - Line 252', 1679476014, 'PHP', 0, NULL),
(693, 583, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$creation_ts - in /home/kamkam/www/testlink_1_9_20/lib/plan/buildEdit.php - Line 390', 1679476110, 'PHP', 0, NULL),
(694, 583, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:23:\"Tests projet BQTSI lot1\";i:2;s:24:\"BUILD_2_Authentification\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679476110, 'CREATE', 5, 'builds'),
(695, 584, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679476180, 'PHP', 0, NULL),
(696, 585, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679476311, 'PHP', 0, NULL),
(697, 586, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679476311, 'PHP', 0, NULL),
(698, 587, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679476312, 'PHP', 0, NULL),
(699, 588, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679476341, 'PHP', 0, NULL),
(700, 589, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679476370, 'PHP', 0, NULL),
(701, 590, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679477546, 'PHP', 0, NULL),
(702, 591, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679477556, 'LOGIN', 1, 'users'),
(703, 592, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679477659, 'UPDATE', 28, 'testprojects'),
(704, 593, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679477901, 'SAVE', 32, 'requirements'),
(705, 593, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679477901, 'PHP', 0, NULL),
(706, 594, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679477946, 'SAVE', 52, 'requirements'),
(707, 594, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679477946, 'PHP', 0, NULL),
(708, 595, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478012, 'SAVE', 169, 'requirements'),
(709, 595, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478012, 'PHP', 0, NULL),
(710, 596, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478169, 'LOGIN', 1, 'users'),
(711, 597, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:2:\"04\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478250, 'CREATE', 175, 'requirements'),
(712, 597, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478250, 'PHP', 0, NULL),
(713, 598, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: title - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqCommands.class.php - Line 367', 1679478274, 'PHP', 0, NULL),
(714, 599, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_12\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478316, 'SAVE', 52, 'requirements'),
(715, 599, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478316, 'PHP', 0, NULL),
(716, 600, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:7:\"RQT_011\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478335, 'SAVE', 32, 'requirements'),
(717, 600, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478335, 'PHP', 0, NULL),
(718, 601, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478359, 'SAVE', 169, 'requirements'),
(719, 601, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478359, 'PHP', 0, NULL),
(720, 602, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478378, 'SAVE', 32, 'requirements'),
(721, 602, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478378, 'PHP', 0, NULL),
(722, 603, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478394, 'SAVE', 52, 'requirements'),
(723, 603, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478394, 'PHP', 0, NULL),
(724, 604, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_04\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478416, 'SAVE', 175, 'requirements'),
(725, 604, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478416, 'PHP', 0, NULL),
(726, 605, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_05\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478555, 'CREATE', 183, 'requirements'),
(727, 605, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478555, 'PHP', 0, NULL),
(728, 606, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_06\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478651, 'CREATE', 185, 'requirements'),
(729, 606, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478651, 'PHP', 0, NULL),
(730, 607, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_09\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478740, 'CREATE', 187, 'requirements'),
(731, 607, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478740, 'PHP', 0, NULL),
(732, 608, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_07\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478772, 'CREATE', 189, 'requirements'),
(733, 608, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478772, 'PHP', 0, NULL),
(734, 609, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_07\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478789, 'SAVE', 189, 'requirements'),
(735, 609, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478789, 'PHP', 0, NULL),
(736, 610, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_10\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478838, 'CREATE', 192, 'requirements'),
(737, 610, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478838, 'PHP', 0, NULL),
(738, 611, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_08\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478891, 'CREATE', 194, 'requirements'),
(739, 611, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478891, 'PHP', 0, NULL),
(740, 612, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_11\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679478925, 'CREATE', 196, 'requirements'),
(741, 612, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679478925, 'PHP', 0, NULL),
(742, 613, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_08\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679479017, 'SAVE', 194, 'requirements'),
(743, 613, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679479017, 'PHP', 0, NULL),
(744, 614, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_12\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679479073, 'SAVE', 196, 'requirements'),
(745, 614, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679479073, 'PHP', 0, NULL),
(746, 615, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_11\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679479089, 'SAVE', 192, 'requirements'),
(747, 615, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679479089, 'PHP', 0, NULL),
(748, 616, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_10\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679479107, 'SAVE', 187, 'requirements'),
(749, 616, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679479107, 'PHP', 0, NULL),
(750, 617, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_09\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679479145, 'CREATE', 202, 'requirements'),
(751, 617, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679479145, 'PHP', 0, NULL),
(752, 618, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679479188, 'PHP', 0, NULL),
(753, 619, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479189, 'PHP', 0, NULL),
(754, 620, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679479199, 'PHP', 0, NULL),
(755, 621, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479199, 'PHP', 0, NULL),
(756, 622, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479236, 'PHP', 0, NULL),
(757, 623, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479242, 'PHP', 0, NULL),
(758, 624, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479243, 'PHP', 0, NULL),
(759, 625, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679479278, 'PHP', 0, NULL),
(760, 626, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679479318, 'PHP', 0, NULL),
(761, 627, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479367, 'PHP', 0, NULL),
(762, 628, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479398, 'PHP', 0, NULL),
(763, 629, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679479402, 'PHP', 0, NULL),
(764, 630, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679479403, 'PHP', 0, NULL),
(765, 631, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1679480636, 'LOCALIZATION', 0, NULL),
(766, 631, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1679480636, 'LOCALIZATION', 0, NULL),
(767, 631, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1679480636, 'LOCALIZATION', 0, NULL),
(768, 632, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679480722, 'PHP', 0, NULL),
(769, 633, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679480723, 'PHP', 0, NULL),
(770, 634, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679480760, 'PHP', 0, NULL),
(771, 635, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679480761, 'PHP', 0, NULL),
(772, 636, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679480881, 'PHP', 0, NULL),
(773, 637, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679480883, 'PHP', 0, NULL),
(774, 638, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679480911, 'PHP', 0, NULL),
(775, 639, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679480911, 'PHP', 0, NULL),
(776, 640, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679481623, 'PHP', 0, NULL),
(777, 641, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679481624, 'PHP', 0, NULL),
(778, 642, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679481671, 'PHP', 0, NULL),
(779, 643, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679481672, 'PHP', 0, NULL),
(780, 644, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679481793, 'PHP', 0, NULL),
(781, 645, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679481794, 'PHP', 0, NULL),
(782, 646, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679481823, 'PHP', 0, NULL),
(783, 647, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679481824, 'PHP', 0, NULL),
(784, 648, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679481861, 'PHP', 0, NULL),
(785, 649, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679481861, 'PHP', 0, NULL),
(786, 650, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679481893, 'PHP', 0, NULL),
(787, 651, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679481894, 'PHP', 0, NULL),
(788, 652, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1679482022, 'PHP', 0, NULL),
(789, 652, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1679482022, 'PHP', 0, NULL),
(790, 652, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1679482022, 'PHP', 0, NULL),
(791, 653, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679482032, 'PHP', 0, NULL),
(792, 654, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679482033, 'PHP', 0, NULL),
(793, 655, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679482056, 'PHP', 0, NULL),
(794, 656, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679482142, 'PHP', 0, NULL),
(795, 657, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679482143, 'PHP', 0, NULL),
(796, 658, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:65:\"Créer la fiche de poste et la transférer au manager d’équipe\";i:1;s:1:\"2\";i:2;s:77:\"Cas_Invalide_Créer la fiche de poste et la transférer au Manager d\'Équipee\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482187, 'ASSIGN', 0, NULL),
(797, 659, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482193, NULL, 0, NULL),
(798, 660, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:50:\"Valider la fiche de poste transmise par manager RH\";i:1;s:1:\"1\";i:2;s:69:\"Cas_Valide_Valider la fiche d\'attribution transmise par le Manager RH\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482281, 'ASSIGN', 0, NULL),
(799, 661, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482284, NULL, 0, NULL),
(800, 662, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:75:\"Transférer simultanément  la demande au Resp. Technique et à l\'Admin Sys\";i:1;s:1:\"1\";i:2;s:70:\"Cas_Valide_Transférer la demande au Responsable Technique (matériel)\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482327, 'ASSIGN', 0, NULL),
(801, 663, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482329, NULL, 0, NULL),
(802, 664, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:65:\"Valider la demande de droits d\'accès transmise par le Manager RH\";i:1;s:1:\"1\";i:2;s:50:\"Cas_Valide_Transférer la demande a l\'admin system\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482354, 'ASSIGN', 0, NULL),
(803, 665, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482356, NULL, 0, NULL),
(804, 666, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:65:\"Valider la demande de droits d\'accès transmise par le Manager RH\";i:1;s:1:\"1\";i:2;s:77:\"Cas_Valide_Valider la demande de droits d\'accès  transmise par le Manager RH\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482449, 'ASSIGN', 0, NULL),
(805, 667, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:20:\"Clôturer la demande\";i:1;s:1:\"1\";i:2;s:27:\"Cas_Valide_Authentification\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482475, 'ASSIGN', 0, NULL),
(806, 668, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482478, NULL, 0, NULL),
(807, 669, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:20:\"Clôturer la demande\";i:1;s:1:\"1\";i:2;s:29:\"Cas_Invalide_Authentification\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482495, 'ASSIGN', 0, NULL),
(808, 670, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482498, NULL, 0, NULL),
(809, 671, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482517, NULL, 0, NULL),
(810, 672, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:66:\"Etre informé de la disponibilité du matériel (Manager d\'Equipe)\";i:1;s:1:\"1\";i:2;s:67:\"Cas_Valide_Valider la demande(materiel) transmise par le manager RH\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482585, 'ASSIGN', 0, NULL),
(811, 673, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482589, NULL, 0, NULL),
(812, 674, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:20:\"Clôturer la demande\";i:1;s:1:\"1\";i:2;s:33:\"Cas_Valide_Cloture de  la demande\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482616, 'ASSIGN', 0, NULL),
(813, 675, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679482622, NULL, 0, NULL),
(814, 676, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679482677, 'PHP', 0, NULL),
(815, 677, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679482677, 'PHP', 0, NULL),
(816, 678, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482700, 'SAVE', 169, 'requirements'),
(817, 678, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679482700, 'PHP', 0, NULL),
(818, 679, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482766, 'SAVE', 32, 'requirements'),
(819, 679, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679482766, 'PHP', 0, NULL),
(820, 680, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_04\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482812, 'SAVE', 175, 'requirements'),
(821, 680, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679482812, 'PHP', 0, NULL),
(822, 681, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_05\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679482850, 'SAVE', 183, 'requirements'),
(823, 681, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679482850, 'PHP', 0, NULL),
(824, 682, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1679482892, 'PHP', 0, NULL),
(825, 682, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1679482892, 'PHP', 0, NULL),
(826, 682, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1679482892, 'PHP', 0, NULL),
(827, 683, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679483006, 'PHP', 0, NULL),
(828, 684, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679483050, 'PHP', 0, NULL),
(829, 685, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679483051, 'PHP', 0, NULL),
(830, 686, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679486971, 'PHP', 0, NULL),
(831, 687, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679486972, 'PHP', 0, NULL),
(832, 688, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1679488019, 'PHP', 0, NULL),
(833, 688, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1679488019, 'PHP', 0, NULL),
(834, 688, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1679488019, 'PHP', 0, NULL),
(835, 689, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:23:\"Tests projet BQTSI lot1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679488048, 'SAVE', 47, 'testplans'),
(836, 690, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1679488051, 'PHP', 0, NULL),
(837, 690, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1679488051, 'PHP', 0, NULL),
(838, 690, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1679488051, 'PHP', 0, NULL),
(839, 691, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:30:\"Campagne de tests projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679488074, 'SAVE', 47, 'testplans'),
(840, 692, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679488368, 'PHP', 0, NULL),
(841, 693, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679488369, 'PHP', 0, NULL),
(842, 694, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679488371, 'PHP', 0, NULL),
(843, 695, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679488371, 'PHP', 0, NULL),
(844, 696, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679488608, 'PHP', 0, NULL),
(845, 697, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679488609, 'PHP', 0, NULL),
(846, 698, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679489507, 'PHP', 0, NULL),
(847, 699, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679489508, 'PHP', 0, NULL),
(848, 700, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679489855, 'PHP', 0, NULL),
(849, 701, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679489855, 'PHP', 0, NULL),
(850, 702, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1679489920, 'PHP', 0, NULL),
(851, 702, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1679489920, 'PHP', 0, NULL),
(852, 702, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1679489920, 'PHP', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(853, 703, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679490039, 'PHP', 0, NULL),
(854, 704, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679490039, 'PHP', 0, NULL),
(855, 705, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:5:\"BQTSI\";i:1;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490260, 'SAVE', 47, 'testplans'),
(856, 706, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679490290, 'PHP', 0, NULL),
(857, 707, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679490302, 'PHP', 0, NULL),
(858, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:63:\"BQTSI-4 : Cas_Invalide_La demande doit contenir un destinataire\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(859, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:79:\"BQTSI-3 : Cas_Valide_Valider la fiche d\'attribution transmise par le Manager RH\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(860, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:80:\"BQTSI-5 : Cas_Valide_Transférer la demande au Responsable Technique (matériel)\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(861, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:60:\"BQTSI-6 : Cas_Valide_Transférer la demande a l\'admin system\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(862, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:87:\"BQTSI-7 : Cas_Valide_Valider la demande de droits d\'accès  transmise par le Manager RH\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(863, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:77:\"BQTSI-8 : Cas_Valide_Valider la demande(materiel) transmise par le manager RH\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(864, 708, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:43:\"BQTSI-9 : Cas_Valide_Cloture de  la demande\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490409, 'ASSIGN', 47, 'testplans'),
(865, 709, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679490410, 'PHP', 0, NULL),
(866, 710, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:38:\"BQTSI-10 : Cas_Valide_Authentification\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490421, 'ASSIGN', 47, 'testplans'),
(867, 710, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:40:\"BQTSI-11 : Cas_Invalide_Authentification\";i:1;s:1:\"1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679490421, 'ASSIGN', 47, 'testplans'),
(868, 711, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679490422, 'PHP', 0, NULL),
(869, 712, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679490451, 'PHP', 0, NULL),
(870, 713, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679490452, 'PHP', 0, NULL),
(871, 714, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679491078, 'PHP', 0, NULL),
(872, 715, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679491079, 'PHP', 0, NULL),
(873, 716, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679491081, 'PHP', 0, NULL),
(874, 717, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679491081, 'PHP', 0, NULL),
(875, 718, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_01\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679492174, 'SAVE', 169, 'requirements'),
(876, 718, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679492174, 'PHP', 0, NULL),
(877, 719, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679492412, 'SAVE', 32, 'requirements'),
(878, 719, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679492412, 'PHP', 0, NULL),
(879, 720, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679492600, 'SAVE', 52, 'requirements'),
(880, 720, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679492600, 'PHP', 0, NULL),
(881, 721, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_04\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679492850, 'SAVE', 175, 'requirements'),
(882, 721, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679492850, 'PHP', 0, NULL),
(883, 722, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_04\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679492921, 'SAVE', 175, 'requirements'),
(884, 722, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679492921, 'PHP', 0, NULL),
(885, 723, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679493059, 'PHP', 0, NULL),
(886, 724, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679493059, 'PHP', 0, NULL),
(887, 725, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_05\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679493659, 'SAVE', 183, 'requirements'),
(888, 725, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679493659, 'PHP', 0, NULL),
(889, 726, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679494033, 'PHP', 0, NULL),
(890, 727, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679494034, 'PHP', 0, NULL),
(891, 728, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_05\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494035, 'SAVE', 183, 'requirements'),
(892, 728, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494035, 'PHP', 0, NULL),
(893, 729, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494109, 'SAVE', 32, 'requirements'),
(894, 729, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494109, 'PHP', 0, NULL),
(895, 730, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494182, 'SAVE', 32, 'requirements'),
(896, 730, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494182, 'PHP', 0, NULL),
(897, 731, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_03\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494221, 'SAVE', 52, 'requirements'),
(898, 731, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494221, 'PHP', 0, NULL),
(899, 732, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_04\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494250, 'SAVE', 175, 'requirements'),
(900, 732, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494250, 'PHP', 0, NULL),
(901, 733, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_02\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494270, 'SAVE', 32, 'requirements'),
(902, 733, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494270, 'PHP', 0, NULL),
(903, 734, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679494353, 'PHP', 0, NULL),
(904, 735, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679494353, 'PHP', 0, NULL),
(905, 736, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_05\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494371, 'SAVE', 183, 'requirements'),
(906, 736, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494371, 'PHP', 0, NULL),
(907, 737, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_06\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494478, 'SAVE', 185, 'requirements'),
(908, 737, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494478, 'PHP', 0, NULL),
(909, 738, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_07\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494682, 'SAVE', 189, 'requirements'),
(910, 738, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494682, 'PHP', 0, NULL),
(911, 739, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679494863, 'PHP', 0, NULL),
(912, 740, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679494887, 'PHP', 0, NULL),
(913, 741, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679494910, 'PHP', 0, NULL),
(914, 742, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679494953, 'PHP', 0, NULL),
(915, 743, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_07\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679494971, 'SAVE', 189, 'requirements'),
(916, 743, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679494971, 'PHP', 0, NULL),
(917, 744, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679495053, 'PHP', 0, NULL),
(918, 745, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_08\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679495060, 'SAVE', 194, 'requirements'),
(919, 745, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679495060, 'PHP', 0, NULL),
(920, 746, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_deleted\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_09\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679495071, 'DELETE', 202, 'requirements'),
(921, 747, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679495076, 'PHP', 0, NULL),
(922, 748, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679495097, 'PHP', 0, NULL),
(923, 749, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679495114, 'PHP', 0, NULL),
(924, 750, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679495150, 'PHP', 0, NULL),
(925, 751, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_10\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679495238, 'SAVE', 187, 'requirements'),
(926, 751, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679495238, 'PHP', 0, NULL),
(927, 752, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_11\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679495388, 'SAVE', 192, 'requirements'),
(928, 752, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679495388, 'PHP', 0, NULL),
(929, 753, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_requirement_saved\";s:6:\"params\";a:1:{i:0;s:6:\"RQT_12\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679496681, 'SAVE', 196, 'requirements'),
(930, 753, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679496681, 'PHP', 0, NULL),
(931, 754, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679497548, 'PHP', 0, NULL),
(932, 755, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679497549, 'PHP', 0, NULL),
(933, 756, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_reqv_assignment_removed_tcv\";s:6:\"params\";a:4:{i:0;s:37:\"Traiter la demande de droits d\'accès\";i:1;s:1:\"1\";i:2;s:50:\"Cas_Valide_Transférer la demande a l\'admin system\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679497666, 'ASSIGN', 0, NULL),
(934, 757, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:38:\"Transférer la demande pour traitement\";i:1;s:1:\"1\";i:2;s:50:\"Cas_Valide_Transférer la demande a l\'admin system\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679497671, 'ASSIGN', 0, NULL),
(935, 758, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679497685, NULL, 0, NULL),
(936, 759, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679497703, 'PHP', 0, NULL),
(937, 760, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679497704, 'PHP', 0, NULL),
(938, 761, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679497848, 'PHP', 0, NULL),
(939, 762, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679497849, 'PHP', 0, NULL),
(940, 763, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679497879, NULL, 0, NULL),
(941, 764, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679497901, 'PHP', 0, NULL),
(942, 765, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: bulk_tester_div - in /home/kamkam/www/testlink_1_9_20/lib/plan/tc_exec_assignment.php - Line 259', 1679497935, 'PHP', 0, NULL),
(943, 766, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679497954, 'PHP', 0, NULL),
(944, 767, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679497955, 'PHP', 0, NULL),
(945, 768, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497985, 'PHP', 0, NULL),
(946, 768, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497985, 'PHP', 0, NULL),
(947, 768, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497985, 'PHP', 0, NULL),
(948, 768, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497985, 'PHP', 0, NULL),
(949, 769, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"BQTSI-1\";i:1;s:9:\"version 1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679497991, 'DELETE', 3, 'execution'),
(950, 769, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497991, 'PHP', 0, NULL),
(951, 769, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497991, 'PHP', 0, NULL),
(952, 769, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497991, 'PHP', 0, NULL),
(953, 769, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679497991, 'PHP', 0, NULL),
(954, 770, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679497998, 'PHP', 0, NULL),
(955, 771, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679497998, 'PHP', 0, NULL),
(956, 772, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:7:\"BQTSI-1\";i:1;s:9:\"version 1\";i:2;s:34:\"Recette fonctionnelle projet BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498000, 'DELETE', 1, 'execution'),
(957, 772, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498000, 'PHP', 0, NULL),
(958, 772, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498000, 'PHP', 0, NULL),
(959, 772, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498000, 'PHP', 0, NULL),
(960, 772, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498000, 'PHP', 0, NULL),
(961, 773, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679498013, 'PHP', 0, NULL),
(962, 774, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679498014, 'PHP', 0, NULL),
(963, 775, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679498067, NULL, 0, NULL),
(964, 776, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498095, 'PHP', 0, NULL),
(965, 776, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498095, 'PHP', 0, NULL),
(966, 776, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498095, 'PHP', 0, NULL),
(967, 776, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: related_item - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9d8bed4946da87ff6ea07155f2d944cc9077413b_0.file.exec_tc_relations.inc.tpl.php - Line 44', 1679498095, 'PHP', 0, NULL),
(968, 777, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_deleted\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:34:\"Recette fonctionnelle projet BQTSI\";i:2;s:9:\"version 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498123, 'DELETE', 4, 'builds'),
(969, 778, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_deleted\";s:6:\"params\";a:3:{i:0;s:5:\"BQTSI\";i:1;s:34:\"Recette fonctionnelle projet BQTSI\";i:2;s:24:\"BUILD_2_Authentification\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498127, 'DELETE', 5, 'builds'),
(970, 779, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679498161, 'PHP', 0, NULL),
(971, 780, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679498161, 'PHP', 0, NULL),
(972, 781, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679498211, 'PHP', 0, NULL),
(973, 782, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679498211, 'PHP', 0, NULL),
(974, 783, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 130', 1679498425, 'PHP', 0, NULL),
(975, 783, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$itemID - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 152', 1679498425, 'PHP', 0, NULL),
(976, 783, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index:  - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/fee4320abc8b70bced5d502fbc9ac4159b8fbdc9_0.file.planEdit.tpl.php - Line 302', 1679498425, 'PHP', 0, NULL),
(977, 784, 2, 'GUI - Test Project ID : 28', 'E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /home/kamkam/www/testlink_1_9_20/lib/general/frmWorkArea.php - Line 216', 1679498434, 'PHP', 0, NULL),
(978, 785, 2, 'GUI - Test Project ID : 28', 'E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /home/kamkam/www/testlink_1_9_20/lib/plan/newest_tcversions.php - Line 43', 1679498453, 'PHP', 0, NULL),
(979, 786, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679498465, 'PHP', 0, NULL),
(980, 787, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679498465, 'PHP', 0, NULL),
(981, 788, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:52:\"Créer une demande et la transférer pour validation\";i:1;s:1:\"2\";i:2;s:75:\"Cas_Valide_Créer la fiche de poste et la transférer au Manager d\'Équipee\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498682, 'ASSIGN', 0, NULL),
(982, 788, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679498682, 'PHP', 0, NULL),
(983, 789, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_reqv_assignment_removed_tcv\";s:6:\"params\";a:4:{i:0;s:52:\"Créer une demande et la transférer pour validation\";i:1;s:1:\"2\";i:2;s:75:\"Cas_Valide_Créer la fiche de poste et la transférer au Manager d\'Équipee\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498702, 'ASSIGN', 0, NULL),
(984, 789, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679498702, 'PHP', 0, NULL),
(985, 790, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679498711, 'PHP', 0, NULL),
(986, 791, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679498711, 'PHP', 0, NULL),
(987, 792, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$freezeLinkOnNewReqVersion - in /home/kamkam/www/testlink_1_9_20/lib/functions/requirement_mgr.class.php - Line 2466', 1679498826, 'PHP', 0, NULL),
(988, 792, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/requirements/reqEdit.php - Line 235', 1679498826, 'PHP', 0, NULL),
(989, 793, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_req_version_deleted\";s:6:\"params\";a:3:{i:0;s:1:\"3\";i:1;s:6:\"RQT_02\";i:2;s:52:\"Créer une demande et la transférer pour validation\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498869, 'DELETE', 237, 'req_version'),
(990, 794, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_req_version_unfrozen\";s:6:\"params\";a:3:{i:0;s:1:\"2\";i:1;s:6:\"RQT_02\";i:2;s:52:\"Créer une demande et la transférer pour validation\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498888, 'UNFREEZE', 55, 'req_version'),
(991, 795, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_req_version_unfrozen\";s:6:\"params\";a:3:{i:0;s:1:\"1\";i:1;s:6:\"RQT_02\";i:2;s:52:\"Créer une demande et la transférer pour validation\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679498913, 'UNFREEZE', 33, 'req_version'),
(992, 796, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679498961, 'PHP', 0, NULL),
(993, 797, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679498961, 'PHP', 0, NULL),
(994, 798, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_req_version_deleted\";s:6:\"params\";a:3:{i:0;s:1:\"1\";i:1;s:6:\"RQT_02\";i:2;s:52:\"Créer une demande et la transférer pour validation\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499034, 'DELETE', 33, 'req_version'),
(995, 799, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679499054, 'PHP', 0, NULL),
(996, 800, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679499054, 'PHP', 0, NULL),
(997, 801, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:52:\"Créer une demande et la transférer pour validation\";i:1;s:1:\"2\";i:2;s:75:\"Cas_Valide_Créer la fiche de poste et la transférer au Manager d\'Équipee\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499074, 'ASSIGN', 0, NULL),
(998, 802, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_reqv_assignment_removed_tcv\";s:6:\"params\";a:4:{i:0;s:20:\"Clôturer la demande\";i:1;s:1:\"1\";i:2;s:27:\"Cas_Valide_Authentification\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499710, 'ASSIGN', 0, NULL),
(999, 803, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:34:\"Se connecter à l\'application GLPI\";i:1;s:1:\"1\";i:2;s:27:\"Cas_Valide_Authentification\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499721, 'ASSIGN', 0, NULL),
(1000, 804, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679499725, NULL, 0, NULL),
(1001, 805, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_reqv_assignment_removed_tcv\";s:6:\"params\";a:4:{i:0;s:20:\"Clôturer la demande\";i:1;s:1:\"1\";i:2;s:29:\"Cas_Invalide_Authentification\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499745, 'ASSIGN', 0, NULL),
(1002, 806, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:34:\"Se connecter à l\'application GLPI\";i:1;s:1:\"1\";i:2;s:29:\"Cas_Invalide_Authentification\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499749, 'ASSIGN', 0, NULL),
(1003, 807, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679499752, NULL, 0, NULL),
(1004, 808, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:33:\"audit_reqv_assignment_removed_tcv\";s:6:\"params\";a:4:{i:0;s:47:\"Etre informé de la disponibilité du matériel\";i:1;s:1:\"1\";i:2;s:67:\"Cas_Valide_Valider la demande(materiel) transmise par le manager RH\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499853, 'ASSIGN', 0, NULL),
(1005, 809, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:31:\"Traiter la demande de matériel\";i:1;s:1:\"1\";i:2;s:67:\"Cas_Valide_Valider la demande(materiel) transmise par le manager RH\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499859, 'ASSIGN', 0, NULL),
(1006, 810, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679499861, NULL, 0, NULL),
(1007, 811, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:52:\"Créer une demande et la transférer pour validation\";i:1;s:1:\"2\";i:2;s:61:\"Cas_Invalide_La demande doit etre envoyer au manager d\'equipe\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679499993, 'ASSIGN', 0, NULL),
(1008, 812, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679500013, NULL, 0, NULL),
(1009, 813, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_reqv_assigned_tcv\";s:6:\"params\";a:4:{i:0;s:52:\"Créer une demande et la transférer pour validation\";i:1;s:1:\"2\";i:2;s:45:\"Cas_Invalide_mettre dans ticket type(demande)\";i:3;s:1:\"1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679500023, 'ASSIGN', 0, NULL),
(1010, 814, 1, 'GUI - Test Project ID : 28', 'Argument \"edit\" has invalid value: ', 1679500027, NULL, 0, NULL),
(1011, 815, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679500034, 'PHP', 0, NULL),
(1012, 816, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679500035, 'PHP', 0, NULL),
(1013, 817, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679559772, 'LOGIN_FAILED', 1, 'users'),
(1014, 818, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679559779, 'LOGIN', 1, 'users'),
(1015, 819, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679559933, 'PHP', 0, NULL),
(1016, 820, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679559934, 'PHP', 0, NULL),
(1017, 821, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679567226, 'LOGIN', 1, 'users'),
(1018, 822, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679567817, 'PHP', 0, NULL),
(1019, 823, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679567818, 'PHP', 0, NULL),
(1020, 824, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1679567874, 'LOCALIZATION', 0, NULL),
(1021, 824, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1679567874, 'LOCALIZATION', 0, NULL),
(1022, 824, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1679567874, 'LOCALIZATION', 0, NULL),
(1023, 825, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679567931, 'PHP', 0, NULL),
(1024, 826, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679567931, 'PHP', 0, NULL),
(1025, 827, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568068, 'PHP', 0, NULL),
(1026, 828, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679568069, 'PHP', 0, NULL),
(1027, 829, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568094, 'PHP', 0, NULL),
(1028, 830, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568097, 'PHP', 0, NULL),
(1029, 831, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568101, 'PHP', 0, NULL),
(1030, 832, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568104, 'PHP', 0, NULL),
(1031, 833, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568107, 'PHP', 0, NULL),
(1032, 834, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568110, 'PHP', 0, NULL),
(1033, 835, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568113, 'PHP', 0, NULL),
(1034, 836, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568154, 'PHP', 0, NULL),
(1035, 837, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568246, 'PHP', 0, NULL),
(1036, 838, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679568246, 'PHP', 0, NULL),
(1037, 839, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568283, 'PHP', 0, NULL),
(1038, 840, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568320, 'PHP', 0, NULL),
(1039, 841, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568347, 'PHP', 0, NULL),
(1040, 842, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568425, 'PHP', 0, NULL),
(1041, 843, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568595, 'PHP', 0, NULL),
(1042, 844, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679568595, 'PHP', 0, NULL),
(1043, 845, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568661, 'PHP', 0, NULL),
(1044, 846, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679568661, 'PHP', 0, NULL),
(1045, 847, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568725, 'PHP', 0, NULL),
(1046, 848, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568752, 'PHP', 0, NULL),
(1047, 849, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568835, 'PHP', 0, NULL),
(1048, 850, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679568911, 'PHP', 0, NULL),
(1049, 851, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679569005, 'PHP', 0, NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES
(1050, 852, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679569006, 'PHP', 0, NULL),
(1051, 853, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679573118, 'PHP', 0, NULL),
(1052, 854, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679573119, 'PHP', 0, NULL),
(1053, 855, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679573178, 'PHP', 0, NULL),
(1054, 856, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573520, 'PHP', 0, NULL),
(1055, 857, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573572, 'PHP', 0, NULL),
(1056, 858, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679573572, 'PHP', 0, NULL),
(1057, 859, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573604, 'PHP', 0, NULL),
(1058, 860, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573628, 'PHP', 0, NULL),
(1059, 861, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573687, 'PHP', 0, NULL),
(1060, 862, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573720, 'PHP', 0, NULL),
(1061, 863, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679573991, 'PHP', 0, NULL),
(1062, 864, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679573992, 'PHP', 0, NULL),
(1063, 865, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/lib/testcases/testcaseCommands.class.php - Line 1129', 1679574142, 'PHP', 0, NULL),
(1064, 866, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679574143, 'PHP', 0, NULL),
(1065, 867, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679574501, 'PHP', 0, NULL),
(1066, 868, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1679574502, 'PHP', 0, NULL),
(1067, 869, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1679645967, 'PHP', 0, NULL),
(1068, 870, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1679995144, 'LOGIN', 1, 'users'),
(1069, 871, 16, 'GUI', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1680002363, 'LOGIN_FAILED', 1, 'users'),
(1070, 872, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1680002371, 'LOGIN', 1, 'users'),
(1071, 873, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002528, 'PHP', 0, NULL),
(1072, 874, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002534, 'PHP', 0, NULL),
(1073, 875, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002564, 'PHP', 0, NULL),
(1074, 876, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002596, 'PHP', 0, NULL),
(1075, 877, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:14:\"212.106.109.94\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1680002630, 'LOGIN', 1, 'users'),
(1076, 878, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002644, 'PHP', 0, NULL),
(1077, 879, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002990, 'PHP', 0, NULL),
(1078, 880, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680002998, 'PHP', 0, NULL),
(1079, 881, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1680003113, 'PHP', 0, NULL),
(1080, 882, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1680003114, 'PHP', 0, NULL),
(1081, 883, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1680003118, 'LOCALIZATION', 0, NULL),
(1082, 883, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1680003118, 'LOCALIZATION', 0, NULL),
(1083, 883, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1680003118, 'LOCALIZATION', 0, NULL),
(1084, 884, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680004129, 'PHP', 0, NULL),
(1085, 885, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680004182, 'PHP', 0, NULL),
(1086, 886, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680004446, 'PHP', 0, NULL),
(1087, 887, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined variable: user - in /home/kamkam/www/testlink_1_9_20/lib/functions/common.php - Line 1925', 1680004447, 'PHP', 0, NULL),
(1088, 888, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_cfield_created\";s:6:\"params\";a:1:{i:0;s:10:\"java_class\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1680005031, 'CREATE', 1, 'custom_fields'),
(1089, 888, 16, 'GUI - Test Project ID : 28', 'O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_cfield_assigned\";s:6:\"params\";a:2:{i:0;s:10:\"java_class\";i:1;s:5:\"BQTSI\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}', 1680005031, 'ASSIGN', 28, 'testprojects'),
(1090, 889, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1680005186, 'PHP', 0, NULL),
(1091, 890, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1680005186, 'PHP', 0, NULL),
(1092, 891, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1680005187, 'PHP', 0, NULL),
(1093, 892, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1680005187, 'PHP', 0, NULL),
(1094, 893, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1680005370, 'PHP', 0, NULL),
(1095, 894, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1680005371, 'PHP', 0, NULL),
(1096, 895, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined property: stdClass::$uploadOp - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/9889c08f741d32cf93102138ac9c16e250899341_0.file.containerView.tpl.php - Line 123', 1680005408, 'PHP', 0, NULL),
(1097, 896, 2, 'GUI - Test Project ID : 28', 'E_NOTICE\nUndefined index: size - in /home/kamkam/www/testlink_1_9_20/gui/templates_c/974e1600f4512f061a4584c466998f9be814c70e_0.file.inc_filter_panel.tpl.php - Line 351', 1680005409, 'PHP', 0, NULL),
(1098, 897, 32, 'GUI - Test Project ID : 28', 'string \'img_title_remove_platform\' is not localized for locale \'en_GB\' ', 1680005416, 'LOCALIZATION', 0, NULL),
(1099, 897, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_msg\' is not localized for locale \'en_GB\' ', 1680005416, 'LOCALIZATION', 0, NULL),
(1100, 897, 32, 'GUI - Test Project ID : 28', 'string \'remove_plat_msgbox_title\' is not localized for locale \'en_GB\' ', 1680005416, 'LOCALIZATION', 0, NULL);

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
(32, 'Créer une demande et la transférer pour validation', 29, 7, 1),
(36, 'Tests projet BQTSI lot2 - Initialiser la demande', 28, 2, 1),
(37, 'Cas_Valide_Créer la fiche de poste et la transférer au Manager d\'Équipee', 36, 3, 0),
(38, '', 37, 4, 0),
(40, '', 38, 9, 0),
(47, 'Recette fonctionnelle projet BQTSI', 28, 5, 0),
(52, 'Valider la demande', 29, 7, 2),
(53, '', 52, 8, 0),
(54, '', 53, 10, 0),
(55, '', 32, 8, 0),
(56, '', 55, 10, 0),
(58, '', 53, 10, 0),
(59, '', 53, 10, 0),
(65, 'Cas_Valide_Valider la fiche d\'attribution transmise par le Manager RH', 36, 3, 2),
(66, '', 65, 4, 0),
(72, '', 66, 9, 0),
(75, 'Cas_Invalide_La demande doit contenir un destinataire', 36, 3, 1),
(76, '', 75, 4, 0),
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
(153, 'Tests projet BQTSI lot1 - Connexion', 28, 2, 2),
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
(168, '', 55, 10, 0),
(169, 'Se connecter à l\'application GLPI', 29, 7, 0),
(170, '', 169, 8, 0),
(171, '', 170, 10, 0),
(172, '', 55, 10, 0),
(173, '', 53, 10, 0),
(174, '', 170, 10, 0),
(175, 'Transférer la demande pour traitement', 29, 7, 3),
(176, '', 175, 8, 0),
(177, '', 53, 10, 0),
(178, '', 55, 10, 0),
(179, '', 170, 10, 0),
(180, '', 55, 10, 0),
(181, '', 53, 10, 0),
(182, '', 176, 10, 0),
(183, 'Traiter la demande de droits d\'accès', 29, 7, 4),
(184, '', 183, 8, 0),
(185, 'Consulter le traitement de la demande de droits d\'accès', 29, 7, 5),
(186, '', 185, 8, 0),
(187, 'Attester de la bonne réception du matériel', 29, 7, 9),
(188, '', 187, 8, 0),
(189, 'Traiter la demande de matériel', 29, 7, 6),
(190, '', 189, 8, 0),
(191, '', 190, 10, 0),
(192, 'Accuser réception de l’attestation de réception du matériel', 29, 7, 10),
(193, '', 192, 8, 0),
(194, 'Etre informé de la disponibilité du matériel', 29, 7, 7),
(195, '', 194, 8, 0),
(196, 'Clôturer la demande', 29, 7, 11),
(197, '', 196, 8, 0),
(198, '', 195, 10, 0),
(199, '', 197, 10, 0),
(200, '', 193, 10, 0),
(201, '', 188, 10, 0),
(204, '', 170, 10, 0),
(205, '', 55, 10, 0),
(206, '', 176, 10, 0),
(207, '', 184, 10, 0),
(208, '', 170, 10, 0),
(209, '', 55, 10, 0),
(210, '', 53, 10, 0),
(211, '', 176, 10, 0),
(212, '', 176, 10, 0),
(213, 'Cas_Invalide_La demande doit etre envoyer au manager d\'equipe', 36, 3, 8),
(214, '', 213, 4, 0),
(215, '', 184, 10, 0),
(216, '', 55, 10, 0),
(217, '', 55, 10, 0),
(218, '', 53, 10, 0),
(219, '', 176, 10, 0),
(220, '', 55, 10, 0),
(221, 'Cas_Invalide_mettre dans ticket type(demande)', 36, 3, 9),
(222, '', 221, 4, 0),
(223, '', 184, 10, 0),
(224, '', 186, 10, 0),
(225, '', 190, 10, 0),
(231, '', 195, 10, 0),
(234, '', 188, 10, 0),
(235, '', 193, 10, 0),
(236, '', 197, 10, 0),
(238, '', 76, 9, 0),
(239, '', 76, 9, 0),
(240, '', 214, 9, 0),
(241, '', 214, 9, 0),
(242, '', 222, 9, 0),
(243, '', 222, 9, 0);

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
(169, 29, 'RQT_01'),
(32, 29, 'RQT_02'),
(52, 29, 'RQT_03'),
(175, 29, 'RQT_04'),
(183, 29, 'RQT_05'),
(185, 29, 'RQT_06'),
(189, 29, 'RQT_07'),
(194, 29, 'RQT_08'),
(187, 29, 'RQT_10'),
(192, 29, 'RQT_11'),
(196, 29, 'RQT_12');

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
(1, 32, 33, 37, 38, 2, 1, 1, '2023-03-10 13:16:59', NULL, NULL),
(5, 32, 55, 75, 76, 1, 1, 1, '2023-03-22 10:49:47', NULL, NULL),
(6, 52, 53, 65, 66, 1, 1, 1, '2023-03-22 10:51:21', NULL, NULL),
(7, 175, 176, 115, 116, 1, 1, 1, '2023-03-22 10:52:07', NULL, NULL),
(9, 183, 184, 137, 138, 1, 1, 1, '2023-03-22 10:54:09', NULL, NULL),
(13, 196, 197, 147, 148, 1, 1, 1, '2023-03-22 10:56:56', NULL, NULL),
(14, 175, 176, 127, 128, 1, 1, 1, '2023-03-22 15:07:51', NULL, NULL),
(16, 32, 55, 37, 38, 1, 1, 1, '2023-03-22 15:31:14', NULL, NULL),
(17, 169, 170, 154, 155, 1, 1, 1, '2023-03-22 15:42:01', NULL, NULL),
(18, 169, 170, 163, 164, 1, 1, 1, '2023-03-22 15:42:29', NULL, NULL),
(19, 189, 190, 142, 143, 1, 1, 1, '2023-03-22 15:44:19', NULL, NULL),
(20, 32, 55, 213, 214, 1, 1, 1, '2023-03-22 15:46:33', NULL, NULL),
(21, 32, 55, 221, 222, 1, 1, 1, '2023-03-22 15:47:03', NULL, NULL);

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
(55, 168, 2, 'RQT_01', '1.1 Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur clique sur le bouton &quot;fiche de poste&quot;,la liste des fiches de poste s&#39;affiche et il peut en selectionner une&nbsp;</p>', 'V', '3', 1, 1, 1, ' exigence mis a jour', 1, '2023-03-10 14:17:01', NULL, '2023-03-10 15:15:04'),
(170, 171, 1, 'RQT_03', 'Message de reussite', '<p>le messsage d&#39;authantification reussite si l&#39;utilisateur s&#39;authentifie avec un &quot;login&quot; et &quot;password&quot; valide&nbsp;</p>', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 08:50:45', NULL, '2023-03-22 09:50:45'),
(55, 172, 3, 'RQT_01', 'Cas_Valide_Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur creer un premier ticket ca pour creer la fiche de poste et le transfere au manger d&#39;equipe</p>', 'V', '4', 1, 1, 1, ' RQT_01', 1, '2023-03-21 12:42:49', NULL, '2023-03-10 15:15:04'),
(53, 173, 4, 'RQT_02', '1.2 valider la fiche de poste transmise par manager RH', '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, ' ', 1, '2023-03-10 14:20:55', 1, '2023-03-10 15:21:17'),
(170, 174, 2, 'RQT_03', 'Message de reussite authentification', '<p>le messsage d&#39;authentification reussite si l&#39;utilisateur s&#39;authentifie avec un &quot;login&quot; et &quot;password&quot; valide&nbsp;</p>', 'V', '4', 1, 1, 1, ' 123', 1, '2023-03-22 08:51:29', NULL, '2023-03-22 09:50:45'),
(53, 177, 5, 'RQT_02', 'Valider la fiche de poste transmise par manager RH', '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, ' modif', 1, '2023-03-22 09:39:06', NULL, '2023-03-10 15:21:17'),
(55, 178, 4, 'RQT_01', 'Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur creer un premier ticket ca pour creer la fiche de poste et le transfere au manger d&#39;equipe</p>', 'V', '4', 1, 1, 1, ' modif', 1, '2023-03-22 09:38:21', NULL, '2023-03-10 15:15:04'),
(170, 179, 3, 'RQT_03', 'Se connecter', '<p>le messsage d&#39;authentification reussite si l&#39;utilisateur s&#39;authentifie avec un &quot;login&quot; et &quot;password&quot; valide&nbsp;</p>', 'V', '4', 1, 1, 1, ' modif', 1, '2023-03-22 09:40:12', NULL, '2023-03-22 09:50:45'),
(55, 180, 5, 'RQT_011', 'Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur creer un premier ticket ca pour creer la fiche de poste et le transfere au manger d&#39;equipe</p>', 'V', '4', 1, 1, 1, ' save id', 1, '2023-03-22 09:45:35', NULL, '2023-03-10 15:15:04'),
(53, 181, 6, 'RQT_12', 'Valider la fiche de poste transmise par manager RH', '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, ' save id', 1, '2023-03-22 09:45:16', NULL, '2023-03-10 15:21:17'),
(176, 182, 1, '04', 'Transférer simultanément  la demande au Resp. Technique et à l\'Admin Sys', '', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:44:10', NULL, '2023-03-22 10:44:10'),
(190, 191, 1, 'RQT_07', 'Informer le manager d\'équipe et manager RH de la disponibilité du matériel', '', 'D', '3', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:52:52', NULL, '2023-03-22 10:52:52'),
(195, 198, 1, 'RQT_08', 'Etre informé de la disponibilité du matériel', '', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:54:51', NULL, '2023-03-22 10:54:51'),
(197, 199, 1, 'RQT_11', 'Clôturer la demande', '<p><strong>Le Manager RH cloture la demande pour ferme le ticket&nbsp;</strong></p>', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:55:25', NULL, '2023-03-22 10:55:25'),
(193, 200, 1, 'RQT_10', 'Accuser réception de l’attestation de réception du matériel', '<p><strong>Le Manager RH&nbsp;Accuse le&nbsp;&nbsp;r&eacute;ception de l&rsquo;attestation de r&eacute;ception du mat&eacute;riel (sign&eacute;e par le nouvel arrivant) pour&nbsp;Envoyer au manager technique</strong></p>', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:53:58', NULL, '2023-03-22 10:53:58'),
(188, 201, 1, 'RQT_09', 'Envoyer l’attestation de reception au manager RH et au resp technique', '<p><strong>Manager d&rsquo;Equipe&nbsp;Envoyer l&rsquo;attestation de r&eacute;ception du mat&eacute;riel (sign&eacute;e par le nouvel arrivant) simultan&eacute;ment&nbsp; au manager RH et au resp technique&nbsp;Que le responsable technique enregistre le mat&eacute;riel comme &ldquo;Actif&rdquo; dans le SI</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:52:20', NULL, '2023-03-22 10:52:20'),
(170, 204, 4, 'RQT_01', 'Se connecter', '<p>le messsage d&#39;authentification reussite si l&#39;utilisateur s&#39;authentifie avec un &quot;login&quot; et &quot;password&quot; valide&nbsp;</p>', 'V', '4', 1, 1, 1, ' edit', 1, '2023-03-22 09:45:59', NULL, '2023-03-22 09:50:45'),
(55, 205, 6, 'RQT_02', 'Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur creer un premier ticket ca pour creer la fiche de poste et le transfere au manger d&#39;equipe</p>', 'V', '4', 1, 1, 1, ' save id', 1, '2023-03-22 09:46:18', NULL, '2023-03-10 15:15:04'),
(176, 206, 2, 'RQT_04', 'Transférer simultanément  la demande au Resp. Technique et à l\'Admin Sys', '', 'V', '4', 1, 1, 1, ' edit id', 1, '2023-03-22 09:46:56', NULL, '2023-03-22 10:44:10'),
(184, 207, 1, 'RQT_05', 'Valider la demande de droits d\'accès transmise par le Manager RH', '', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:49:15', NULL, '2023-03-22 10:49:15'),
(170, 208, 5, 'RQT_01', 'Se connecter', '<p>le messsage d&#39;authentification reussite si l&#39;utilisateur s&#39;authentifie avec un &quot;login&quot; et &quot;password&quot; valide&nbsp;</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 10:58:20', NULL, '2023-03-22 09:50:45'),
(55, 209, 7, 'RQT_02', 'Créer la fiche de poste et la transférer au manager d’équipe', '<p>Quand l&#39;utilsateur creer un premier ticket ca pour creer la fiche de poste et le transfere au manger d&#39;equipe</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 10:59:26', NULL, '2023-03-10 15:15:04'),
(53, 210, 7, 'RQT_03', 'Valider la fiche de poste transmise par manager RH', '<p><strong>Quand le manager d&#39;equipe valide,il transf&eacute;re&nbsp;simultan&eacute;ment&nbsp; la demande au responsable technique (mat&eacute;riels) et &agrave; l&#39;admin (droits d&#39;acc&egrave;s)</strong></p>', 'V', '3', 1, 1, 1, ' save id', 1, '2023-03-22 09:46:34', NULL, '2023-03-10 15:21:17'),
(176, 211, 3, 'RQT_04', 'Transférer simultanément  la demande au Resp. Technique et à l\'Admin Sys', '', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 11:00:12', NULL, '2023-03-22 10:44:10'),
(176, 212, 4, 'RQT_04', 'Transférer la demande au Resp.Technique et à l\'Admin.Système', '<p>Transf&eacute;rer simultan&eacute;ment la demande au Responsable Technique (mat&eacute;riel) et &agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s).</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 13:47:30', NULL, '2023-03-22 10:44:10'),
(184, 215, 2, 'RQT_05', 'Valider la demande de droits d\'accès transmise par le Manager RH', '<p>Valider Mettre en place la politique d&#39;acc&egrave;s aux logiciels &agrave; la date d&#39;int&eacute;gration ou &agrave; la date demand&eacute;e par le Manager d&#39;&Eacute;quipe</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 11:00:50', 1, '2023-03-22 15:00:59'),
(55, 216, 8, 'RQT_02', 'Créer une demande pour attribuer droits & matériel au nouvel arrivant', '<p>Le Manager RH souhaite cr&eacute;er une demande pour qu&#39;un nouvel arrivant dispose de mat&eacute;riel et de droits d&#39;acc&egrave;s pour commencer &agrave; travailler.</p>\r\n\r\n<p>Il doit ensuite l&#39;adresser au Manager d&#39;Equipe.</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 13:40:12', NULL, '2023-03-10 15:15:04'),
(55, 217, 9, 'RQT_02', 'Créer une demande', '<p>Le Manager RH souhaite cr&eacute;er une demande pour qu&#39;un nouvel arrivant dispose de mat&eacute;riel et de droits d&#39;acc&egrave;s pour commencer &agrave; travailler.</p>\r\n\r\n<p>Il doit ensuite l&#39;adresser au Manager d&#39;Equipe.</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 14:08:29', NULL, '2023-03-10 15:15:04'),
(53, 218, 8, 'RQT_03', 'Valider la demande transmise par le Manager RH', '<p>Le Manager d&#39;Equipe souhaite valider la demande du Manager RH si son contenu (mat&eacute;riel &amp; droits d&#39;acc&egrave;s) est adapt&eacute; aux besoins du nouvel arrivant.</p>', 'V', '3', 1, 1, 1, ' maj', 1, '2023-03-22 13:43:20', NULL, '2023-03-10 15:21:17'),
(176, 219, 5, 'RQT_04', 'Transférer la demande au Resp.Technique et à l\'Admin.Système', '<p>Transf&eacute;rer simultan&eacute;ment la demande au Responsable Technique (mat&eacute;riel) et &agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s) pour traitement.</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 13:48:41', NULL, '2023-03-22 10:44:10'),
(55, 220, 10, 'RQT_02', 'Créer une demande', '<p>Le Manager RH souhaite cr&eacute;er une demande pour qu&#39;un nouvel arrivant dispose de mat&eacute;riel et de droits d&#39;acc&egrave;s pour commencer &agrave; travailler.</p>\r\n\r\n<p>Il doit ensuite l&#39;adresser pour validation au Manager d&#39;Equipe.</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 14:09:42', NULL, '2023-03-10 15:15:04'),
(184, 223, 3, 'RQT_05', 'Valider la demande de droits d\'accès', '<p>L&#39;Administrateur Syst&egrave;me souhaite valider la demande de droits d&#39;acc&egrave;s transmise par le Manager RH (et valid&eacute;e par le Manager d&#39;Equipe) pour mettre en place la politique d&#39;acc&egrave;s aux logiciels &agrave; la date d&#39;int&eacute;gration ou &agrave; la date demand&eacute;e par le Manager d&#39;&Eacute;quipe.</p>', 'V', '4', 1, 1, 2, ' maj', 1, '2023-03-22 14:07:15', NULL, '2023-03-22 15:00:59'),
(186, 224, 1, 'RQT_06', 'Avoir une vue sur les échanges sur le traitement de la demande de droits', '', 'V', '4', 1, 1, 1, 'Requirement Created', 1, '2023-03-22 09:50:51', NULL, '2023-03-22 10:50:51'),
(190, 225, 2, 'RQT_07', 'Informer le manager d\'équipe et manager RH de la disponibilité du matériel', '', 'V', '4', 1, 1, 1, ' save', 1, '2023-03-22 09:53:09', NULL, '2023-03-22 10:52:52'),
(195, 231, 2, 'RQT_08', 'Etre informé de la disponibilité du matériel (Manager d\'Equipe)', '', 'V', '4', 1, 1, 1, ' save', 1, '2023-03-22 09:56:57', NULL, '2023-03-22 10:54:51'),
(188, 234, 2, 'RQT_10', 'Envoyer l’attestation de reception au manager RH et au resp technique', '<p><strong>Manager d&rsquo;Equipe&nbsp;Envoyer l&rsquo;attestation de r&eacute;ception du mat&eacute;riel (sign&eacute;e par le nouvel arrivant) simultan&eacute;ment&nbsp; au manager RH et au resp technique&nbsp;Que le responsable technique enregistre le mat&eacute;riel comme &ldquo;Actif&rdquo; dans le SI</strong></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'V', '4', 1, 1, 1, ' changement', 1, '2023-03-22 09:58:27', NULL, '2023-03-22 10:52:20'),
(193, 235, 2, 'RQT_11', 'Accuser réception de l’attestation de réception du matériel', '<p><strong>Le Manager RH&nbsp;Accuse le&nbsp;&nbsp;r&eacute;ception de l&rsquo;attestation de r&eacute;ception du mat&eacute;riel (sign&eacute;e par le nouvel arrivant) pour&nbsp;Envoyer au manager technique</strong></p>', 'V', '4', 1, 1, 1, ' changement', 1, '2023-03-22 09:58:09', NULL, '2023-03-22 10:53:58'),
(197, 236, 2, 'RQT_12', 'Clôturer la demande', '<p><strong>Le Manager RH cloture la demande pour ferme le ticket&nbsp;</strong></p>', 'V', '4', 1, 1, 1, ' changement', 1, '2023-03-22 09:57:53', NULL, '2023-03-22 10:55:25');

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
(53, 1, 9, '<p>Le Manager d&#39;Equipe souhaite valider la demande du Manager RH si son contenu (mat&eacute;riel &amp; droits d&#39;acc&egrave;s) est adapt&eacute; aux besoins du nouvel arrivant.</p>', 'V', '3', 1, 1, 1, 1, '2023-03-22 14:10:21', NULL, '2023-03-10 15:21:17', ' maj'),
(55, 2, 11, '<p>Le Manager RH souhaite cr&eacute;er une demande pour qu&#39;un nouvel arrivant dispose de mat&eacute;riel et de droits d&#39;acc&egrave;s pour commencer &agrave; travailler.</p>\r\n\r\n<p>Il doit ensuite l&#39;adresser pour validation au Manager d&#39;Equipe.</p>', 'V', '4', 1, 1, 2, 1, '2023-03-22 14:11:10', NULL, '2023-03-10 15:15:04', ' maj'),
(170, 1, 6, '<p>Un utilisateur souhaite s&#39;authentifier via son login et mot de passe pour acc&eacute;der &agrave; l&#39;application GLPI.</p>', 'V', '4', 1, 1, 2, 1, '2023-03-22 13:36:14', NULL, '2023-03-22 09:50:45', ' maj'),
(176, 1, 6, '<p>Transf&eacute;rer simultan&eacute;ment la demande au Responsable Technique (mat&eacute;riel) et &agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s) pour traitement.</p>', 'V', '4', 1, 1, 2, 1, '2023-03-22 14:10:50', NULL, '2023-03-22 10:44:10', ' maj'),
(184, 1, 4, '<p>Si la demande est compatible avec les exigences mat&eacute;rielles, logicielles et SI, l&#39;Administrateur Syst&egrave;me valide la demande de droits d&#39;acc&egrave;s transmise par le Manager RH (et valid&eacute;e par le Manager d&#39;Equipe) pour mettre en place la politique d&#39;acc&egrave;s aux logiciels &agrave; la date d&#39;int&eacute;gration ou &agrave; la date demand&eacute;e par le Manager d&#39;&Eacute;quipe.</p>', 'V', '4', 1, 1, 2, 1, '2023-03-22 14:12:51', NULL, '2023-03-22 15:00:59', ' maj'),
(186, 1, 2, '<p>Le DPO souhaite avoir une vue sur les &eacute;changes concernant le traitement de la demande de droits pour &eacute;ventuellement pouvoir intervenir.</p>', 'V', '4', 1, 1, 1, 1, '2023-03-22 14:14:38', NULL, '2023-03-22 10:50:51', ' maj'),
(188, 1, 3, '<p>A r&eacute;ception du mat&eacute;riel mis &agrave; disposition par le Responsable Technique, le Manager d&#39;Equipe transmet l&#39;attestation de r&eacute;ception du mat&eacute;riel (sign&eacute;e par le nouvel arrivant) simultan&eacute;ment au Manager RH et au Responsable Technique, qui enregistre le mat&eacute;riel comme &quot;Actif&quot; dans le SI.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'V', '4', 1, 1, 1, 1, '2023-03-22 14:27:18', NULL, '2023-03-22 10:52:20', ' maj'),
(190, 1, 3, '<p>Le Responsable Technique consulte la disponibilit&eacute; du mat&eacute;riel demand&eacute; et en informe le Manager d&#39;Equipe et Manager RH.</p>', 'V', '4', 1, 1, 1, 1, '2023-03-22 14:18:02', 1, '2023-03-22 15:22:51', ' maj'),
(193, 1, 3, '<p>Le Manager RH accuse r&eacute;ception au Manager d&#39;Equipe de l&rsquo;attestation de r&eacute;ception du mat&eacute;riel (sign&eacute;e par le nouvel arrivant).</p>', 'V', '4', 1, 1, 1, 1, '2023-03-22 14:29:48', NULL, '2023-03-22 10:53:58', ' maj'),
(195, 1, 3, '<p>Le Manager RH et le Manager d&#39;Equipe sont inform&eacute;s de la disponibilit&eacute; du mat&eacute;riel.</p>', 'V', '4', 1, 1, 1, 1, '2023-03-22 14:24:20', NULL, '2023-03-22 10:54:51', ' maj'),
(197, 1, 3, '<p>Le Manager RH cloture la demande une fois le mat&eacute;riel mis &agrave; disposition et les droits d&#39;acc&egrave;s fournis.</p>', 'V', '4', 1, 1, 1, 1, '2023-03-22 14:51:21', NULL, '2023-03-22 10:55:25', ' maj');

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
(99, 16, '<p>Le manager RH choisit le Manager d&#39;Equipe&nbsp;dans la liste.</p>\r\n', '<p>Le Manager d&#39;Equipe s&#39;affiche dans la zone &quot;Attribuer a&quot;.</p>\r\n', 1, 1),
(100, 17, '<p>le manager RH clique sur&quot; +Ajouter&quot;</p>\r\n', '<p>affichage d&#39;un message d&#39;information(POP UP)&nbsp;:&quot;la titre de demande &quot;</p>\r\n', 1, 1),
(101, 1, '<p>Sur la page d&#39;acceuil: le manager d&#39;equipe&nbsp;clique sur le&nbsp; ticket a valider dans la section &quot;Vos tickets a valider&quot;.</p>\r\n', '<p>Affichage de details de la demande de validation et un lien vers le document joint.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1),
(103, 11, '<p>Le manager RH clique sur la liste deroulante&quot; Demande de validation&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Affichage de la liste &quot; Utilisateur&quot; ou &quot; Groupe&quot;</p>\r\n', 1, 1),
(104, 12, '<p>Le manager Rh clique sur &quot;Utilisateur&quot;.</p>\r\n', '<p>Une zone de liste deroulante s&#39;affiche.</p>\r\n', 1, 1),
(105, 13, '<p>Le manager RH clique sur la liste deroulante des utilisateurs&nbsp;</p>\r\n', '<p>Les noms deS utilisateurs s&#39;affichent&quot;.</p>\r\n', 1, 1),
(106, 14, '<p>Le manager RH clique sur le nom du manager d&#39;equipe.</p>\r\n', '<p>Le nom de manager d&#39;equipe s&#39;affiche dans la&nbsp;zone de demande de validation.</p>\r\n', 1, 1),
(107, 18, '<p>Le manager RH clique sur assistance/ticket pour verifier l&#39;ajout du ticket cree dans la liste et le status du ticket passe de &quot;nouveau&quot; a &quot;En cours(attribue)</p>\r\n', '<p>Affichage du ticket creer dans la liste avec un status &quot;En cours&quot;</p>\r\n', 1, 1),
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
(167, 3, '<p>Tapper un &quot;invalid password&nbsp;&quot;&nbsp;dans l&#39;input</p>\r\n', '<p>Affichage d&#39;un message :</p>\r\n\r\n<p>&quot;Error</p>\r\n\r\n<p>Incorrect username or password&quot;</p>\r\n', 1, 1),
(238, 1, '<p>Le manager RH&nbsp;clique sur &quot;Utilisateur&quot;.</p>\r\n', '<p>Une zone de liste deroulante s&#39;affiche.</p>\r\n', 1, 1),
(239, 2, '<p>Le manager RH clique sur la liste deroulante des utilisateurs&nbsp;</p>\r\n', '<p>Les noms des&nbsp;utilisateurs ne s&#39;affichent pas.</p>\r\n', 1, 1),
(240, 1, '<p>Le manager RH clique sur la liste deroulante des utilisateurs&nbsp;</p>\r\n', '<p>Les noms deS utilisateurs s&#39;affichent&quot;.</p>\r\n', 1, 1),
(241, 2, '<p>Le manager RH clique sur le nom responsable technique</p>\r\n', '<p>Le nom de responsable&nbsp; technique s&#39;affiche dans la&nbsp;zone de demande de validation.</p>\r\n', 1, 1),
(242, 1, '<p>Cliquer sur la liste deroulante &quot;Type&quot;</p>\r\n', '<p>Affichage de la liste &quot;Incident&quot; ou &quot;Demande&quot;</p>\r\n', 1, 1),
(243, 2, '<p>Le manager RH clique sur &quot;Incident&quot;</p>\r\n', '<p>Affichage de type &quot;Incident&quot;</p>\r\n', 1, 1);

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
(38, 1, 1, 1, 1, '<p>choisir un model de&nbsp;fiche de poste parmis une liste de fiches</p>\r\n\r\n<p>choisir le destinataire de la fiche de poste&nbsp;(recap)</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Manager RH a son poste</p>\r\n\r\n<p>Liste de fiche de poste&nbsp;</p>\r\n\r\n<p>Listes des intervenants dans le workflow</p>\r\n\r\n<p>Etre connect&eacute;&nbsp;a GLPI</p>\r\n\r\n<p>Donnees de tests fournies (Fichiers de fiches de post)</p>\r\n', 2, 1, '2023-03-10 12:54:42', 1, '2023-03-23 11:47:44', 1, 1, 1, NULL),
(66, 3, 1, 1, 1, '<p>Valider la fiche de poste par le manager RH &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Manager RH a son poste</p>\r\n\r\n<p>Liste de fiche de poste</p>\r\n\r\n<p>Listes des&nbsp; intervenants dans le workflow</p>\r\n', 2, 1, '2023-03-12 11:35:04', 1, '2023-03-20 11:20:30', 1, 1, 1, NULL),
(76, 4, 1, 1, 1, '<p>choisir le&nbsp;&nbsp;fiche de poste parmis une liste de fiches</p>\r\n\r\n<p>choisir le destinataire de la fiche de poste&nbsp;(recap)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Seulement un manager d&#39;&eacute;quipe</p>\r\n', '<p>Manager RH a son poste</p>\r\n\r\n<p>Liste de fiche de poste&nbsp;</p>\r\n\r\n<p>Etre connect&eacute;&nbsp;a GLPI</p>\r\n\r\n<p>Cas de test (BQTSI-1) de pas 1 jusqu&#39;au pas 11</p>\r\n', 2, 1, '2023-03-14 09:34:58', 1, '2023-03-23 11:47:05', 1, 1, 1, NULL),
(116, 5, 1, 1, 1, '<p><strong>Transf&eacute;rer simultan&eacute;ment&nbsp; la demande au Responsable Technique (mat&eacute;riel) et &agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s)</strong></p>\r\n', '<p>Connecter sur le GLPI&nbsp;</p>\r\n\r\n<p>la demande est prete&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 1, '2023-03-20 10:12:52', 1, '2023-03-20 11:50:06', 1, 1, 1, NULL),
(128, 6, 1, 1, 1, '<p><strong>Transf&eacute;rer la fiche d&#39;attribution&nbsp;&nbsp;&agrave; l&rsquo;Administrateur Syst&egrave;me (droits d&#39;acc&egrave;s)</strong></p>\r\n', '<p>Connecter sur GLPI</p>\r\n\r\n<p>La demande est prete&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 1, '2023-03-20 10:43:07', 1, '2023-03-20 11:52:35', 1, 1, 1, NULL),
(138, 7, 1, 1, 1, '<p>Mettre en place la politique d&#39;acc&egrave;s aux logiciels &agrave; la date d&#39;int&eacute;gration ou &agrave; la date demand&eacute;e par le Manager d&#39;&Eacute;quipe</p>\r\n', '<p>Admin systeme&nbsp;&nbsp;a son post</p>\r\n\r\n<p>fiche de post prete&nbsp;</p>\r\n', 2, 1, '2023-03-20 11:09:00', 1, '2023-03-20 13:37:11', 1, 1, 1, NULL),
(143, 8, 1, 1, 1, '<p><strong>Mettre le mat&eacute;riel &agrave; la disposition</strong></p>\r\n', '<p>RESPONSABLE TECHNIQUE&nbsp; a son poste</p>\r\n\r\n<p>la demande prete&nbsp;</p>\r\n', 2, 1, '2023-03-20 12:43:10', 1, '2023-03-20 13:47:03', 1, 1, 1, NULL),
(148, 9, 1, 1, 1, '<p>&nbsp;Le manager RH close la demande por ferme le ticket</p>\r\n', '<p>MANAGER_RH a son poste&nbsp;</p>\r\n', 2, 1, '2023-03-20 13:05:07', 1, '2023-03-20 15:05:55', 1, 1, 1, NULL),
(155, 10, 1, 1, 1, '<p>Un utilisateur se connecte au syst&egrave;me pour acc&eacute;der aux fonctionnalit&eacute;s du syst&egrave;me.</p>\r\n', '<p>username/password de chaque role d&eacute;fini dans GLPI</p>\r\n', 2, 1, '2023-03-21 10:58:41', 1, '2023-03-22 13:36:48', 1, 1, 1, NULL),
(164, 11, 1, 1, 1, '<p>Un utilisateur ne parvient pas &agrave; se connecter au syst&egrave;me pour acc&eacute;der aux fonctionnalit&eacute;s du syst&egrave;me.</p>\r\n', '<p>username/password de chaque role d&eacute;fini dans GLPI</p>\r\n', 2, 1, '2023-03-21 12:09:46', 1, '2023-03-22 11:28:31', 1, 1, 1, NULL),
(214, 12, 1, 1, 1, '<p>la demande est envoyee&nbsp;au responsable technique ca implinque une faute dans le demarche de la demande</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Cas de test BQTSI-1 de pas 1 jusqu&#39;au pas 12</p>\r\n', 2, 1, '2023-03-22 13:50:59', 1, '2023-03-23 11:56:45', 1, 1, 1, NULL),
(222, 13, 1, 1, 1, '<p>Mettre dans le details de ticket&nbsp; specifiquement type: &quot;Incident&quot; ca n&#39; implique pas pour le demarche de la demande.</p>\r\n', '<p>cas de tst BSTQI-1 de pas 1 jusqu&#39;au 7</p>\r\n', 2, 1, '2023-03-22 14:12:33', 1, '2023-03-23 13:22:22', 1, 1, 1, NULL);

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

--
-- Dumping data for table `testcase_relations`
--

INSERT INTO `testcase_relations` (`id`, `source_id`, `destination_id`, `link_status`, `relation_type`, `author_id`, `creation_ts`) VALUES
(1, 143, 148, 1, 1, 1, '2023-03-22 13:22:35'),
(2, 138, 148, 1, 1, 1, '2023-03-22 13:23:53'),
(3, 116, 143, 1, 1, 1, '2023-03-22 13:24:43'),
(4, 128, 138, 1, 1, 1, '2023-03-22 13:27:10'),
(5, 66, 128, 1, 1, 1, '2023-03-22 13:28:34'),
(6, 66, 116, 1, 1, 1, '2023-03-22 13:28:48'),
(7, 38, 116, 1, 1, 1, '2023-03-22 13:29:27'),
(9, 38, 66, 1, 1, 1, '2023-03-22 13:30:25'),
(10, 155, 38, 1, 1, 1, '2023-03-22 13:31:13'),
(11, 38, 128, 1, 1, 1, '2023-03-22 13:40:00');

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
(47, 28, '', 1, 1, 1, '337e2255d633a8146e2459fe67b7706d8c3bcc1734ceebf24a8a05a21a487a3b');

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
(3, 47, 38, 10000, 2, 0, 1, '2023-03-10 13:34:21'),
(5, 47, 76, 10, 2, 0, 1, '2023-03-22 13:06:49'),
(6, 47, 66, 20, 2, 0, 1, '2023-03-22 13:06:49'),
(7, 47, 116, 30, 2, 0, 1, '2023-03-22 13:06:49'),
(8, 47, 128, 40, 2, 0, 1, '2023-03-22 13:06:49'),
(9, 47, 138, 50, 2, 0, 1, '2023-03-22 13:06:49'),
(10, 47, 143, 60, 2, 0, 1, '2023-03-22 13:06:49'),
(11, 47, 148, 70, 2, 0, 1, '2023-03-22 13:06:49'),
(12, 47, 155, 10000, 2, 0, 1, '2023-03-22 13:07:01'),
(13, 47, 164, 10010, 2, 0, 1, '2023-03-22 13:07:01');

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
(28, '<p>L&rsquo;accroissement r&eacute;cent des effectifs et le turn-over des personnels ne permettent plus de se satisfaire de la solution mail existante (ind&eacute;pendante du SI).&nbsp;</p>\r\n\r\n<p>Une solution a &eacute;t&eacute; trouv&eacute;e via la mise en place du logiciel GLPI (Gestionnaire Libre de Parc Informatique), qui permet de g&eacute;rer tant les services informatiques que les services d&rsquo;assistance.</p>\r\n\r\n<p>L&rsquo;objectif du projet est de tester cet outil pour en garantir la fiabilit&eacute; d&rsquo;utilisation dans le cadre des &eacute;changes inter-services li&eacute;s &agrave; l&rsquo;arriv&eacute;e d&rsquo;un nouveau salari&eacute; dans l&rsquo;entreprise.</p>', '', 1, 0, 0, 0, 'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:1;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:1;}', 'BQTSI', 13, 1, 0, 0, 0, '204089a683aeccf98f98c3a2cd99def1f5bf596cb213c9d9b103df65bd539a78');

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
(544, '/lib/testcases/archiveData.php', 1679413436, 1679413436, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(545, '/lib/testcases/listTestCases.php', 1679472757, 1679472757, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(546, '/lib/testcases/archiveData.php', 1679472758, 1679472758, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(547, '/lib/usermanagement/usersAssign.php', 1679473104, 1679473104, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(548, '/lib/usermanagement/rolesEdit.php', 1679473795, 1679473795, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(549, '/lib/usermanagement/rolesEdit.php', 1679473799, 1679473799, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(550, '/lib/usermanagement/rolesEdit.php', 1679473800, 1679473800, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(551, '/lib/usermanagement/rolesEdit.php', 1679473801, 1679473801, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(552, '/lib/usermanagement/rolesView.php', 1679473808, 1679473808, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(553, '/lib/usermanagement/rolesView.php', 1679473811, 1679473811, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(554, '/lib/usermanagement/rolesView.php', 1679473814, 1679473814, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(555, '/lib/usermanagement/rolesView.php', 1679473816, 1679473816, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(556, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679475045, 1679475045, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(557, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679475089, 1679475089, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(558, '/lib/plan/tc_exec_assignment.php', 1679475369, 1679475369, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(559, '/lib/plan/tc_exec_assignment.php', 1679475370, 1679475370, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(560, '/lib/testcases/listTestCases.php', 1679475406, 1679475406, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(561, '/lib/testcases/archiveData.php', 1679475407, 1679475407, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(562, '/lib/testcases/archiveData.php', 1679475417, 1679475417, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(563, '/lib/plan/tc_exec_assignment.php', 1679475492, 1679475492, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(564, '/lib/plan/tc_exec_assignment.php', 1679475511, 1679475511, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(565, '/lib/plan/tc_exec_assignment.php', 1679475514, 1679475514, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(566, '/lib/plan/tc_exec_assignment.php', 1679475515, 1679475515, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(567, '/lib/plan/tc_exec_assignment.php', 1679475518, 1679475518, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(568, '/lib/plan/tc_exec_assignment.php', 1679475520, 1679475520, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(569, '/lib/plan/tc_exec_assignment.php', 1679475520, 1679475520, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(570, '/lib/plan/tc_exec_assignment.php', 1679475521, 1679475521, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(571, '/lib/testcases/archiveData.php', 1679475556, 1679475556, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(572, '/lib/testcases/listTestCases.php', 1679475557, 1679475557, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(573, '/lib/plan/tc_exec_assignment.php', 1679475879, 1679475879, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(574, '/lib/plan/tc_exec_assignment.php', 1679475883, 1679475883, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(575, '/lib/plan/tc_exec_assignment.php', 1679475883, 1679475883, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(576, '/lib/testcases/listTestCases.php', 1679475897, 1679475897, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(577, '/lib/testcases/archiveData.php', 1679475898, 1679475898, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(578, '/lib/testcases/listTestCases.php', 1679475932, 1679475932, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(579, '/lib/testcases/archiveData.php', 1679475932, 1679475932, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(580, '/lib/plan/tc_exec_assignment.php', 1679475973, 1679475973, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(581, '/lib/plan/tc_exec_assignment.php', 1679475973, 1679475973, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(582, '/testlink_1_9_20/lib/plan/buildEdit.php', 1679476014, 1679476014, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(583, '/testlink_1_9_20/lib/plan/buildEdit.php', 1679476110, 1679476110, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(584, '/lib/plan/tc_exec_assignment.php', 1679476180, 1679476180, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(585, '/lib/plan/tc_exec_assignment.php', 1679476311, 1679476311, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(586, '/lib/plan/tc_exec_assignment.php', 1679476311, 1679476311, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(587, '/lib/plan/tc_exec_assignment.php', 1679476312, 1679476312, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(588, '/lib/plan/tc_exec_assignment.php', 1679476341, 1679476341, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(589, '/lib/plan/tc_exec_assignment.php', 1679476370, 1679476370, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(590, '/lib/plan/tc_exec_assignment.php', 1679477546, 1679477546, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(591, '/testlink_1_9_20/login.php', 1679477556, 1679477556, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(592, '/testlink_1_9_20/lib/project/projectEdit.php', 1679477659, 1679477659, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(593, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679477901, 1679477901, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(594, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679477946, 1679477946, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(595, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478012, 1679478012, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(596, '/testlink_1_9_20/login.php', 1679478169, 1679478169, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(597, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478250, 1679478250, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(598, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478274, 1679478274, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(599, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478316, 1679478316, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(600, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478335, 1679478335, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(601, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478359, 1679478359, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(602, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478378, 1679478378, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(603, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478394, 1679478394, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(604, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478416, 1679478416, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(605, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478555, 1679478555, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(606, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478651, 1679478651, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(607, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478740, 1679478740, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(608, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478772, 1679478772, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(609, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478789, 1679478789, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(610, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478838, 1679478838, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(611, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478891, 1679478891, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(612, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679478925, 1679478925, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(613, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679479017, 1679479017, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(614, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679479073, 1679479073, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(615, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679479089, 1679479089, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(616, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679479107, 1679479107, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(617, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679479145, 1679479145, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(618, '/lib/testcases/listTestCases.php', 1679479188, 1679479188, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(619, '/lib/testcases/archiveData.php', 1679479189, 1679479189, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(620, '/lib/testcases/listTestCases.php', 1679479199, 1679479199, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(621, '/lib/testcases/archiveData.php', 1679479199, 1679479199, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(622, '/lib/testcases/archiveData.php', 1679479236, 1679479236, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(623, '/lib/testcases/archiveData.php', 1679479242, 1679479242, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(624, '/lib/testcases/archiveData.php', 1679479243, 1679479243, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(625, '/lib/testcases/listTestCases.php', 1679479278, 1679479278, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(626, '/lib/testcases/listTestCases.php', 1679479318, 1679479318, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(627, '/lib/testcases/archiveData.php', 1679479367, 1679479367, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(628, '/lib/testcases/archiveData.php', 1679479398, 1679479398, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(629, '/lib/testcases/listTestCases.php', 1679479402, 1679479402, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(630, '/lib/testcases/archiveData.php', 1679479403, 1679479403, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(631, '/lib/testcases/archiveData.php', 1679480636, 1679480636, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(632, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679480722, 1679480722, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(633, '/lib/testcases/listTestCases.php', 1679480723, 1679480723, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(634, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679480760, 1679480760, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(635, '/lib/testcases/listTestCases.php', 1679480761, 1679480761, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(636, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679480881, 1679480881, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(637, '/lib/testcases/listTestCases.php', 1679480883, 1679480883, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(638, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679480911, 1679480911, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(639, '/lib/testcases/listTestCases.php', 1679480911, 1679480911, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(640, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679481623, 1679481623, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(641, '/lib/testcases/listTestCases.php', 1679481624, 1679481624, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(642, '/lib/testcases/listTestCases.php', 1679481671, 1679481671, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(643, '/lib/testcases/archiveData.php', 1679481672, 1679481672, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(644, '/lib/testcases/listTestCases.php', 1679481793, 1679481793, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(645, '/lib/testcases/archiveData.php', 1679481794, 1679481794, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(646, '/lib/testcases/listTestCases.php', 1679481823, 1679481823, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(647, '/lib/testcases/archiveData.php', 1679481824, 1679481824, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(648, '/lib/testcases/listTestCases.php', 1679481861, 1679481861, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(649, '/lib/testcases/archiveData.php', 1679481861, 1679481861, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(650, '/lib/testcases/listTestCases.php', 1679481893, 1679481893, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(651, '/lib/testcases/archiveData.php', 1679481894, 1679481894, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(652, '/testlink_1_9_20/lib/plan/planEdit.php', 1679482022, 1679482022, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(653, '/lib/testcases/listTestCases.php', 1679482032, 1679482032, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(654, '/lib/testcases/archiveData.php', 1679482033, 1679482033, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(655, '/lib/testcases/listTestCases.php', 1679482056, 1679482056, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(656, '/lib/testcases/listTestCases.php', 1679482142, 1679482142, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(657, '/lib/testcases/archiveData.php', 1679482143, 1679482143, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(658, '/lib/requirements/reqTcAssign.php', 1679482187, 1679482187, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(659, '/lib/testcases/archiveData.php', 1679482193, 1679482193, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(660, '/lib/requirements/reqTcAssign.php', 1679482281, 1679482281, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(661, '/lib/testcases/archiveData.php', 1679482284, 1679482284, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(662, '/lib/requirements/reqTcAssign.php', 1679482327, 1679482327, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(663, '/lib/testcases/archiveData.php', 1679482329, 1679482329, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(664, '/lib/requirements/reqTcAssign.php', 1679482354, 1679482354, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(665, '/lib/testcases/archiveData.php', 1679482356, 1679482356, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(666, '/lib/requirements/reqTcAssign.php', 1679482449, 1679482449, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(667, '/lib/requirements/reqTcAssign.php', 1679482475, 1679482475, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(668, '/lib/testcases/archiveData.php', 1679482478, 1679482478, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(669, '/lib/requirements/reqTcAssign.php', 1679482495, 1679482495, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(670, '/lib/testcases/archiveData.php', 1679482498, 1679482498, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(671, '/lib/testcases/archiveData.php', 1679482517, 1679482517, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(672, '/lib/requirements/reqTcAssign.php', 1679482585, 1679482585, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(673, '/lib/testcases/archiveData.php', 1679482589, 1679482589, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(674, '/lib/requirements/reqTcAssign.php', 1679482616, 1679482616, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(675, '/lib/testcases/archiveData.php', 1679482622, 1679482622, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(676, '/lib/testcases/listTestCases.php', 1679482677, 1679482677, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(677, '/lib/testcases/archiveData.php', 1679482677, 1679482677, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(678, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679482700, 1679482700, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(679, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679482766, 1679482766, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(680, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679482812, 1679482812, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(681, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679482850, 1679482850, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(682, '/testlink_1_9_20/lib/plan/planEdit.php', 1679482892, 1679482892, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(683, '/lib/plan/tc_exec_assignment.php', 1679483006, 1679483006, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(684, '/lib/testcases/listTestCases.php', 1679483050, 1679483050, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(685, '/lib/testcases/archiveData.php', 1679483051, 1679483051, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(686, '/lib/testcases/listTestCases.php', 1679486971, 1679486971, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(687, '/lib/testcases/archiveData.php', 1679486972, 1679486972, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(688, '/testlink_1_9_20/lib/plan/planEdit.php', 1679488019, 1679488019, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(689, '/testlink_1_9_20/lib/plan/planEdit.php', 1679488048, 1679488048, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(690, '/testlink_1_9_20/lib/plan/planEdit.php', 1679488051, 1679488051, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(691, '/testlink_1_9_20/lib/plan/planEdit.php', 1679488074, 1679488074, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(692, '/lib/testcases/listTestCases.php', 1679488368, 1679488368, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(693, '/lib/testcases/archiveData.php', 1679488369, 1679488369, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(694, '/lib/testcases/listTestCases.php', 1679488371, 1679488371, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(695, '/lib/testcases/archiveData.php', 1679488371, 1679488371, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(696, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679488608, 1679488608, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(697, '/lib/testcases/listTestCases.php', 1679488609, 1679488609, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(698, '/lib/testcases/listTestCases.php', 1679489507, 1679489507, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(699, '/lib/testcases/archiveData.php', 1679489508, 1679489508, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(700, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679489855, 1679489855, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(701, '/lib/testcases/listTestCases.php', 1679489855, 1679489855, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(702, '/testlink_1_9_20/lib/plan/planEdit.php', 1679489920, 1679489920, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(703, '/lib/testcases/listTestCases.php', 1679490039, 1679490039, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(704, '/lib/testcases/archiveData.php', 1679490039, 1679490039, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(705, '/testlink_1_9_20/lib/plan/planEdit.php', 1679490260, 1679490260, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(706, '/lib/plan/planAddTCNavigator.php', 1679490290, 1679490290, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(707, '/lib/plan/planAddTCNavigator.php', 1679490302, 1679490302, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(708, '/testlink_1_9_20/lib/plan/planAddTC.php', 1679490409, 1679490409, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(709, '/lib/plan/planAddTCNavigator.php', 1679490410, 1679490410, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(710, '/testlink_1_9_20/lib/plan/planAddTC.php', 1679490421, 1679490421, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(711, '/lib/plan/planAddTCNavigator.php', 1679490422, 1679490422, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(712, '/lib/testcases/listTestCases.php', 1679490451, 1679490451, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(713, '/lib/testcases/archiveData.php', 1679490452, 1679490452, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(714, '/lib/testcases/archiveData.php', 1679491078, 1679491078, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(715, '/lib/testcases/listTestCases.php', 1679491079, 1679491079, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(716, '/lib/testcases/listTestCases.php', 1679491081, 1679491081, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(717, '/lib/testcases/archiveData.php', 1679491081, 1679491081, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(718, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679492174, 1679492174, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(719, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679492412, 1679492412, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(720, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679492600, 1679492600, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(721, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679492850, 1679492850, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(722, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679492921, 1679492921, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(723, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679493059, 1679493059, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(724, '/lib/testcases/listTestCases.php', 1679493059, 1679493059, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(725, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679493659, 1679493659, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(726, '/lib/testcases/listTestCases.php', 1679494033, 1679494033, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(727, '/lib/testcases/archiveData.php', 1679494034, 1679494034, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(728, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494035, 1679494035, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(729, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494109, 1679494109, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(730, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494182, 1679494182, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(731, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494221, 1679494221, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(732, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494250, 1679494250, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(733, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494270, 1679494270, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(734, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679494353, 1679494353, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(735, '/lib/testcases/listTestCases.php', 1679494353, 1679494353, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(736, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494371, 1679494371, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(737, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494478, 1679494478, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(738, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494682, 1679494682, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(739, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679494863, 1679494863, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(740, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679494887, 1679494887, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(741, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679494910, 1679494910, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(742, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679494953, 1679494953, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(743, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679494971, 1679494971, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(744, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679495053, 1679495053, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(745, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679495060, 1679495060, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(746, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679495071, 1679495071, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(747, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679495076, 1679495076, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(748, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679495097, 1679495097, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(749, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679495114, 1679495114, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(750, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679495150, 1679495150, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(751, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679495238, 1679495238, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(752, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679495388, 1679495388, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(753, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679496681, 1679496681, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(754, '/lib/testcases/listTestCases.php', 1679497548, 1679497548, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(755, '/lib/testcases/archiveData.php', 1679497549, 1679497549, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(756, '/lib/requirements/reqTcAssign.php', 1679497666, 1679497666, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(757, '/lib/requirements/reqTcAssign.php', 1679497671, 1679497671, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(758, '/lib/testcases/archiveData.php', 1679497685, 1679497685, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(759, '/lib/testcases/listTestCases.php', 1679497703, 1679497703, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(760, '/lib/testcases/archiveData.php', 1679497704, 1679497704, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(761, '/lib/testcases/listTestCases.php', 1679497848, 1679497848, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(762, '/lib/testcases/archiveData.php', 1679497849, 1679497849, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(763, '/lib/testcases/archiveData.php', 1679497879, 1679497879, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(764, '/lib/plan/tc_exec_assignment.php', 1679497901, 1679497901, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(765, '/lib/plan/tc_exec_assignment.php', 1679497935, 1679497935, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(766, '/lib/testcases/archiveData.php', 1679497954, 1679497954, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(767, '/lib/testcases/listTestCases.php', 1679497955, 1679497955, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(768, '/lib/execute/execSetResults.php', 1679497985, 1679497985, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(769, '/lib/execute/execSetResults.php', 1679497991, 1679497991, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(770, '/lib/testcases/listTestCases.php', 1679497998, 1679497998, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(771, '/lib/testcases/archiveData.php', 1679497998, 1679497998, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(772, '/lib/execute/execSetResults.php', 1679498000, 1679498000, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(773, '/lib/testcases/archiveData.php', 1679498013, 1679498013, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(774, '/lib/testcases/listTestCases.php', 1679498014, 1679498014, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(775, '/lib/testcases/archiveData.php', 1679498067, 1679498067, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(776, '/lib/execute/execSetResults.php', 1679498095, 1679498095, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(777, '/testlink_1_9_20/lib/plan/buildEdit.php', 1679498123, 1679498123, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(778, '/testlink_1_9_20/lib/plan/buildEdit.php', 1679498127, 1679498127, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(779, '/lib/testcases/listTestCases.php', 1679498161, 1679498161, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(780, '/lib/testcases/archiveData.php', 1679498161, 1679498161, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(781, '/lib/testcases/listTestCases.php', 1679498211, 1679498211, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(782, '/lib/testcases/archiveData.php', 1679498211, 1679498211, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(783, '/testlink_1_9_20/lib/plan/planEdit.php', 1679498425, 1679498425, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(784, '/testlink_1_9_20/lib/general/frmWorkArea.php', 1679498434, 1679498434, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(785, '/lib/plan/newest_tcversions.php', 1679498453, 1679498453, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(786, '/lib/testcases/listTestCases.php', 1679498465, 1679498465, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(787, '/lib/testcases/archiveData.php', 1679498465, 1679498465, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(788, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679498682, 1679498682, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(789, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679498702, 1679498702, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(790, '/lib/testcases/listTestCases.php', 1679498711, 1679498711, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(791, '/lib/testcases/archiveData.php', 1679498711, 1679498711, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(792, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679498826, 1679498826, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(793, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679498869, 1679498869, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(794, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679498888, 1679498888, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(795, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679498913, 1679498913, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(796, '/lib/testcases/listTestCases.php', 1679498961, 1679498961, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(797, '/lib/testcases/archiveData.php', 1679498961, 1679498961, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(798, '/testlink_1_9_20/lib/requirements/reqEdit.php', 1679499034, 1679499034, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(799, '/lib/testcases/listTestCases.php', 1679499054, 1679499054, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(800, '/lib/testcases/archiveData.php', 1679499054, 1679499054, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(801, '/lib/requirements/reqTcAssign.php', 1679499074, 1679499074, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(802, '/lib/requirements/reqTcAssign.php', 1679499710, 1679499710, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(803, '/lib/requirements/reqTcAssign.php', 1679499721, 1679499721, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(804, '/lib/testcases/archiveData.php', 1679499725, 1679499725, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(805, '/lib/requirements/reqTcAssign.php', 1679499745, 1679499745, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(806, '/lib/requirements/reqTcAssign.php', 1679499749, 1679499749, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(807, '/lib/testcases/archiveData.php', 1679499752, 1679499752, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(808, '/lib/requirements/reqTcAssign.php', 1679499853, 1679499853, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(809, '/lib/requirements/reqTcAssign.php', 1679499859, 1679499859, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(810, '/lib/testcases/archiveData.php', 1679499861, 1679499861, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(811, '/lib/requirements/reqTcAssign.php', 1679499993, 1679499993, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(812, '/lib/testcases/archiveData.php', 1679500013, 1679500013, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(813, '/lib/requirements/reqTcAssign.php', 1679500023, 1679500023, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(814, '/lib/testcases/archiveData.php', 1679500027, 1679500027, 1, 'dc82ff91e48d79947d671395ffe0fa74'),
(815, '/lib/testcases/listTestCases.php', 1679500034, 1679500034, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(816, '/lib/testcases/archiveData.php', 1679500035, 1679500035, 1, 'b1e70ce463329d8579d888c52f74a15c'),
(817, '/testlink_1_9_20/login.php', 1679559772, 1679559772, 0, NULL),
(818, '/testlink_1_9_20/login.php', 1679559779, 1679559779, 1, 'a25e14dda2a0bb74062d74a7eb3cd93a'),
(819, '/lib/testcases/listTestCases.php', 1679559933, 1679559933, 1, 'a25e14dda2a0bb74062d74a7eb3cd93a'),
(820, '/lib/testcases/archiveData.php', 1679559934, 1679559934, 1, 'a25e14dda2a0bb74062d74a7eb3cd93a'),
(821, '/testlink_1_9_20/login.php', 1679567226, 1679567226, 1, 'be7301624ef033e2cf32585235fc74a1'),
(822, '/lib/testcases/listTestCases.php', 1679567817, 1679567817, 1, 'be7301624ef033e2cf32585235fc74a1'),
(823, '/lib/testcases/archiveData.php', 1679567818, 1679567818, 1, 'be7301624ef033e2cf32585235fc74a1'),
(824, '/lib/testcases/archiveData.php', 1679567874, 1679567874, 1, 'be7301624ef033e2cf32585235fc74a1'),
(825, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679567931, 1679567931, 1, 'be7301624ef033e2cf32585235fc74a1'),
(826, '/lib/testcases/listTestCases.php', 1679567931, 1679567931, 1, 'be7301624ef033e2cf32585235fc74a1'),
(827, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568068, 1679568068, 1, 'be7301624ef033e2cf32585235fc74a1'),
(828, '/lib/testcases/listTestCases.php', 1679568069, 1679568069, 1, 'be7301624ef033e2cf32585235fc74a1'),
(829, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568094, 1679568094, 1, 'be7301624ef033e2cf32585235fc74a1'),
(830, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568097, 1679568097, 1, 'be7301624ef033e2cf32585235fc74a1'),
(831, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568101, 1679568101, 1, 'be7301624ef033e2cf32585235fc74a1'),
(832, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568104, 1679568104, 1, 'be7301624ef033e2cf32585235fc74a1'),
(833, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568107, 1679568107, 1, 'be7301624ef033e2cf32585235fc74a1'),
(834, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568110, 1679568110, 1, 'be7301624ef033e2cf32585235fc74a1'),
(835, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568113, 1679568113, 1, 'be7301624ef033e2cf32585235fc74a1'),
(836, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568154, 1679568154, 1, 'be7301624ef033e2cf32585235fc74a1'),
(837, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568246, 1679568246, 1, 'be7301624ef033e2cf32585235fc74a1'),
(838, '/lib/testcases/listTestCases.php', 1679568246, 1679568246, 1, 'be7301624ef033e2cf32585235fc74a1'),
(839, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568283, 1679568283, 1, 'be7301624ef033e2cf32585235fc74a1'),
(840, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568320, 1679568320, 1, 'be7301624ef033e2cf32585235fc74a1'),
(841, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568347, 1679568347, 1, 'be7301624ef033e2cf32585235fc74a1'),
(842, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568425, 1679568425, 1, 'be7301624ef033e2cf32585235fc74a1'),
(843, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568595, 1679568595, 1, 'be7301624ef033e2cf32585235fc74a1'),
(844, '/lib/testcases/listTestCases.php', 1679568595, 1679568595, 1, 'be7301624ef033e2cf32585235fc74a1'),
(845, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568661, 1679568661, 1, 'be7301624ef033e2cf32585235fc74a1'),
(846, '/lib/testcases/listTestCases.php', 1679568661, 1679568661, 1, 'be7301624ef033e2cf32585235fc74a1'),
(847, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568725, 1679568726, 1, 'be7301624ef033e2cf32585235fc74a1'),
(848, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568752, 1679568752, 1, 'be7301624ef033e2cf32585235fc74a1'),
(849, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568835, 1679568835, 1, 'be7301624ef033e2cf32585235fc74a1'),
(850, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679568911, 1679568911, 1, 'be7301624ef033e2cf32585235fc74a1'),
(851, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679569005, 1679569005, 1, 'be7301624ef033e2cf32585235fc74a1'),
(852, '/lib/testcases/listTestCases.php', 1679569006, 1679569006, 1, 'be7301624ef033e2cf32585235fc74a1'),
(853, '/lib/testcases/archiveData.php', 1679573118, 1679573118, 1, 'be7301624ef033e2cf32585235fc74a1'),
(854, '/lib/testcases/listTestCases.php', 1679573119, 1679573119, 1, 'be7301624ef033e2cf32585235fc74a1'),
(855, '/lib/testcases/archiveData.php', 1679573178, 1679573178, 1, 'be7301624ef033e2cf32585235fc74a1'),
(856, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573520, 1679573520, 1, 'be7301624ef033e2cf32585235fc74a1'),
(857, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573572, 1679573572, 1, 'be7301624ef033e2cf32585235fc74a1'),
(858, '/lib/testcases/listTestCases.php', 1679573572, 1679573572, 1, 'be7301624ef033e2cf32585235fc74a1'),
(859, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573604, 1679573604, 1, 'be7301624ef033e2cf32585235fc74a1'),
(860, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573628, 1679573628, 1, 'be7301624ef033e2cf32585235fc74a1'),
(861, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573687, 1679573687, 1, 'be7301624ef033e2cf32585235fc74a1'),
(862, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573720, 1679573720, 1, 'be7301624ef033e2cf32585235fc74a1'),
(863, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679573991, 1679573991, 1, 'be7301624ef033e2cf32585235fc74a1'),
(864, '/lib/testcases/listTestCases.php', 1679573992, 1679573992, 1, 'be7301624ef033e2cf32585235fc74a1'),
(865, '/testlink_1_9_20/lib/testcases/tcEdit.php', 1679574142, 1679574142, 1, 'be7301624ef033e2cf32585235fc74a1'),
(866, '/lib/testcases/listTestCases.php', 1679574143, 1679574143, 1, 'be7301624ef033e2cf32585235fc74a1'),
(867, '/lib/testcases/listTestCases.php', 1679574501, 1679574501, 1, 'be7301624ef033e2cf32585235fc74a1'),
(868, '/lib/testcases/archiveData.php', 1679574502, 1679574502, 1, 'be7301624ef033e2cf32585235fc74a1'),
(869, '/lib/testcases/listTestCases.php', 1679645967, 1679645967, 1, 'be7301624ef033e2cf32585235fc74a1'),
(870, '/testlink_1_9_20/login.php', 1679995144, 1679995144, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(871, '/testlink_1_9_20/login.php', 1680002363, 1680002363, 0, NULL),
(872, '/testlink_1_9_20/login.php', 1680002371, 1680002371, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(873, '/lib/usermanagement/userInfo.php', 1680002528, 1680002528, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(874, '/lib/usermanagement/userInfo.php', 1680002534, 1680002534, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(875, '/lib/usermanagement/userInfo.php', 1680002564, 1680002564, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(876, '/lib/usermanagement/userInfo.php', 1680002596, 1680002596, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(877, '/testlink_1_9_20/login.php', 1680002630, 1680002630, 1, '38d3d4224dcd668871685bb48d4084c0'),
(878, '/lib/usermanagement/userInfo.php', 1680002644, 1680002644, 1, '38d3d4224dcd668871685bb48d4084c0'),
(879, '/lib/usermanagement/userInfo.php', 1680002990, 1680002990, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(880, '/lib/usermanagement/userInfo.php', 1680002998, 1680002998, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(881, '/lib/testcases/listTestCases.php', 1680003113, 1680003113, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(882, '/lib/testcases/archiveData.php', 1680003114, 1680003114, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(883, '/lib/testcases/archiveData.php', 1680003118, 1680003118, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(884, '/lib/usermanagement/userInfo.php', 1680004129, 1680004129, 1, '38d3d4224dcd668871685bb48d4084c0'),
(885, '/lib/usermanagement/userInfo.php', 1680004182, 1680004182, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(886, '/lib/usermanagement/userInfo.php', 1680004446, 1680004446, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(887, '/lib/usermanagement/userInfo.php', 1680004447, 1680004447, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(888, '/testlink_1_9_20/lib/cfields/cfieldsEdit.php', 1680005031, 1680005031, 1, '38d3d4224dcd668871685bb48d4084c0'),
(889, '/lib/testcases/listTestCases.php', 1680005186, 1680005186, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(890, '/lib/testcases/listTestCases.php', 1680005186, 1680005186, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(891, '/lib/testcases/archiveData.php', 1680005187, 1680005187, 1, '2126a4afe923a0b8736e0d4c77fd9590'),
(892, '/lib/testcases/archiveData.php', 1680005187, 1680005187, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(893, '/lib/testcases/listTestCases.php', 1680005370, 1680005370, 1, '38d3d4224dcd668871685bb48d4084c0'),
(894, '/lib/testcases/archiveData.php', 1680005371, 1680005371, 1, '38d3d4224dcd668871685bb48d4084c0'),
(895, '/lib/testcases/archiveData.php', 1680005408, 1680005408, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(896, '/lib/testcases/listTestCases.php', 1680005409, 1680005409, 1, '1ca47e650eb237be99bd4bc9c2f10527'),
(897, '/lib/testcases/archiveData.php', 1680005416, 1680005416, 1, '38d3d4224dcd668871685bb48d4084c0');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `codetrackers`
--
ALTER TABLE `codetrackers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `testplan_platforms`
--
ALTER TABLE `testplan_platforms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testplan_tcversions`
--
ALTER TABLE `testplan_tcversions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=898;

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
