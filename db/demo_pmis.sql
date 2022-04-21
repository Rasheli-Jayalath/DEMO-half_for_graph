-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2022 at 12:14 PM
-- Server version: 8.0.17
-- PHP Version: 7.2.23RC1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_pmis`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `aid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `baseline` float NOT NULL,
  `rid` int(11) NOT NULL,
  `temp_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_cd` int(11) NOT NULL,
  `log_module` varchar(200) NOT NULL,
  `log_title` varchar(200) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ip` varchar(200) NOT NULL,
  `itemid` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `secheduleid` varchar(200) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `actualstartdate` date NOT NULL,
  `actualenddate` date NOT NULL,
  `aorder` int(11) NOT NULL,
  `baseline` float NOT NULL,
  `remarks` text NOT NULL,
  `rid` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `baseline`
--

CREATE TABLE `baseline` (
  `rid` int(11) NOT NULL,
  `base_code` varchar(50) DEFAULT NULL,
  `base_desc` text NOT NULL,
  `unit` varchar(100) NOT NULL,
  `quantity` double NOT NULL,
  `unit_type` int(11) NOT NULL,
  `temp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `baseline_mapping_boqs`
--

CREATE TABLE `baseline_mapping_boqs` (
  `bitem_id` int(11) NOT NULL,
  `rid` int(11) DEFAULT NULL,
  `boqid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `baseline_template`
--

CREATE TABLE `baseline_template` (
  `temp_id` int(11) NOT NULL,
  `temp_title` varchar(200) DEFAULT NULL,
  `temp_desc` text,
  `temp_is_default` int(11) DEFAULT NULL,
  `use_data` float NOT NULL,
  `active_temp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `base_data_cube`
--

CREATE TABLE `base_data_cube` (
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `weight` float NOT NULL,
  `isentry` tinyint(1) NOT NULL,
  `resources` text NOT NULL,
  `aorder` int(11) NOT NULL,
  `kpi_temp_id` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `kaweight` float NOT NULL,
  `kpiid` int(11) NOT NULL,
  `kaid` int(11) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL DEFAULT '0',
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `baseline` double NOT NULL,
  `temp_id` int(11) NOT NULL,
  `scid` int(11) NOT NULL COMMENT 'kpiscale id',
  `rid` int(11) NOT NULL COMMENT 'resource id',
  `planned` double NOT NULL,
  `actual` double NOT NULL,
  `comm_planned` double NOT NULL,
  `comm_actual` double NOT NULL,
  `total_planned` double NOT NULL,
  `total_actual` double NOT NULL,
  `planned_perc` double NOT NULL,
  `actual_perc` double NOT NULL,
  `base_desc` text NOT NULL,
  `unit` varchar(100) NOT NULL,
  `quantity` double NOT NULL,
  `unit_type` int(11) NOT NULL,
  `itemid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `boq`
--

CREATE TABLE `boq` (
  `boqid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `boqcode` varchar(100) NOT NULL,
  `boqitem` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `boqunit` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `boq_base_currency` varchar(100) DEFAULT NULL,
  `boqqty` double DEFAULT NULL,
  `boq_cur_1` varchar(100) DEFAULT NULL,
  `cur_1_exchrate` double DEFAULT NULL,
  `boq_cur_1_rate` double DEFAULT NULL,
  `boq_cur_2` varchar(100) DEFAULT NULL,
  `cur_2_exchrate` double DEFAULT NULL,
  `boq_cur_2_rate` double DEFAULT NULL,
  `boq_cur_3` varchar(100) DEFAULT NULL,
  `cur_3_exchrate` int(11) DEFAULT NULL,
  `boq_cur_3_rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `boq`
--

INSERT INTO `boq` (`boqid`, `itemid`, `boqcode`, `boqitem`, `boqunit`, `boq_base_currency`, `boqqty`, `boq_cur_1`, `cur_1_exchrate`, `boq_cur_1_rate`, `boq_cur_2`, `cur_2_exchrate`, `boq_cur_2_rate`, `boq_cur_3`, `cur_3_exchrate`, `boq_cur_3_rate`) VALUES
(1, 5, '1', 'test', 'kg', 'PKR', 1, 'PKR', 1, 100, 'USD', 150, 1000, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `boqdata`
--

CREATE TABLE `boqdata` (
  `itemid` int(11) NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `itemcode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `itemname` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `weight` float DEFAULT NULL,
  `activities` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `isentry` tinyint(1) NOT NULL,
  `resources` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `aorder` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boqdata`
--

INSERT INTO `boqdata` (`itemid`, `parentcd`, `parentgroup`, `activitylevel`, `stage`, `factor`, `itemcode`, `itemname`, `weight`, `activities`, `isentry`, `resources`, `aorder`, `lid`) VALUES
(1, 0, '000001', 0, 'BOQ', 0, '1234321', 'test project', 0, NULL, 0, NULL, 0, 0),
(2, 1, '000001_000002', 1, 'BOQ', 0, '1', 'civil Work', 0, NULL, 0, NULL, 0, 1),
(3, 1, '000001_000003', 1, 'BOQ', 0, '2', 'Electrical and Mechanical', 0, NULL, 0, NULL, 0, 2),
(4, 3, '000001_000003_000004', 2, 'BOQ', NULL, '01', 'earth work1', NULL, NULL, 0, NULL, NULL, NULL),
(5, 4, '000001_000003_000004_000005', 3, 'BOQ', NULL, 'A', 'Schedule A', NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ipc`
--

CREATE TABLE `ipc` (
  `ipcid` int(11) NOT NULL,
  `ipcno` varchar(100) DEFAULT NULL,
  `ipcmonth` varchar(100) DEFAULT NULL,
  `ipcstartdate` date DEFAULT NULL,
  `ipcenddate` date DEFAULT NULL,
  `ipcsubmitdate` date DEFAULT NULL,
  `ipcreceivedate` date DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ipc`
--

INSERT INTO `ipc` (`ipcid`, `ipcno`, `ipcmonth`, `ipcstartdate`, `ipcenddate`, `ipcsubmitdate`, `ipcreceivedate`, `status`, `lid`) VALUES
(1, '01 ', '2020-03-01', '2020-03-01', '2020-03-30', '2020-04-01', '2020-04-01', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ipcv`
--

CREATE TABLE `ipcv` (
  `ipcvid` int(11) NOT NULL,
  `ipcid` int(11) NOT NULL,
  `boqid` int(11) NOT NULL,
  `ipcqty` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ipcv`
--

INSERT INTO `ipcv` (`ipcvid`, `ipcid`, `boqid`, `ipcqty`) VALUES
(1, 1, 1, 934);

-- --------------------------------------------------------

--
-- Table structure for table `ipc_log`
--

CREATE TABLE `ipc_log` (
  `log_cd` int(11) NOT NULL,
  `log_module` varchar(210) NOT NULL,
  `log_title` varchar(210) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ip` varchar(200) NOT NULL,
  `ipcno` varchar(100) NOT NULL,
  `ipcmonth` varchar(100) NOT NULL,
  `ipcstartdate` date NOT NULL,
  `ipcenddate` date NOT NULL,
  `ipcsubmitdate` date NOT NULL,
  `ipcreceivedate` date NOT NULL,
  `status` varchar(1) NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ipc_log`
--

INSERT INTO `ipc_log` (`log_cd`, `log_module`, `log_title`, `log_ip`, `ipcno`, `ipcmonth`, `ipcstartdate`, `ipcenddate`, `ipcsubmitdate`, `ipcreceivedate`, `status`, `transaction_id`) VALUES
(1, 'IPC Data Module', 'Add IPC Data Record', '::1', '01 ', '2020-03-01', '2020-03-01', '2020-03-30', '2020-04-01', '2020-04-01', '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kpidata`
--

CREATE TABLE `kpidata` (
  `kpiid` int(11) NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `weight` float NOT NULL,
  `isentry` tinyint(1) NOT NULL,
  `resources` text NOT NULL,
  `aorder` int(11) NOT NULL,
  `kpi_temp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpidata_etl`
--

CREATE TABLE `kpidata_etl` (
  `keid` int(11) NOT NULL,
  `kpiid` int(11) NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `weight` float NOT NULL,
  `isentry` tinyint(1) NOT NULL,
  `resources` text NOT NULL,
  `aorder` int(11) NOT NULL,
  `kpi_temp_id` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `baseline` double NOT NULL,
  `weighted_planned` double NOT NULL,
  `weighted_actual` double NOT NULL,
  `kpi_comm_planned` double NOT NULL,
  `kpi_comm_actual` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpidata_result`
--

CREATE TABLE `kpidata_result` (
  `keid` int(11) NOT NULL,
  `kpiid` int(11) NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `weight` float NOT NULL,
  `isentry` tinyint(1) NOT NULL,
  `resources` text NOT NULL,
  `aorder` int(11) NOT NULL,
  `kpi_temp_id` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `baseline` double NOT NULL,
  `weighted_planned` double NOT NULL,
  `weighted_actual` double NOT NULL,
  `kpi_comm_planned` double NOT NULL,
  `kpi_comm_actual` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpiscale`
--

CREATE TABLE `kpiscale` (
  `scid` int(11) NOT NULL,
  `scmonth` varchar(7) NOT NULL,
  `scyear` varchar(4) NOT NULL,
  `scquarter` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_activity`
--

CREATE TABLE `kpi_activity` (
  `kaid` int(11) NOT NULL,
  `kpiid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `kaweight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_base_level_report`
--

CREATE TABLE `kpi_base_level_report` (
  `temp_id` int(11) NOT NULL,
  `kpi_temp_id` int(11) NOT NULL,
  `kpiid` int(11) NOT NULL DEFAULT '0',
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `weight` float NOT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `baseline` double DEFAULT NULL,
  `rid` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `scid` int(11) NOT NULL COMMENT 'kpiscale id',
  `kpi_planned` double DEFAULT NULL,
  `kpi_actual` double DEFAULT NULL,
  `kpi_comm_planned` double DEFAULT NULL,
  `kpi_comm_actual` double DEFAULT NULL,
  `kpi_planned_per` double DEFAULT NULL,
  `kpi_actual_per` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_colors`
--

CREATE TABLE `kpi_colors` (
  `kpi_color_id` int(11) NOT NULL,
  `kpi_color` varchar(10) NOT NULL,
  `kpi_actlevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kpi_colors`
--

INSERT INTO `kpi_colors` (`kpi_color_id`, `kpi_color`, `kpi_actlevel`) VALUES
(1, '#32CD32', 0),
(2, '#5F9EA0', 1),
(3, '#8FBC8F', 2),
(4, '#00CED1', 3),
(5, '#ADD8E6', 4),
(6, '#E0FFFF', 5),
(7, '#20B2AA', 6),
(8, '#87CEFA', 7),
(9, '#B0C4DE', 8),
(10, '#66CDAA', 9),
(11, '#9370DB', 10),
(12, '#48D1CC', 11),
(13, '#EEE8AA', 12),
(14, '#98FB98', 13),
(15, '#AFEEEE', 14),
(16, '#FFEFD5', 15),
(17, '#FFDAB9', 16),
(18, '#DDA0DD', 17),
(19, '#B0E0E6', 18),
(20, '#D8BFD8', 19),
(21, '#F5DEB3', 20),
(22, '#EE82EE', 21),
(23, '#87CEEB', 22),
(24, '#C0C0C0', 23),
(25, '#F4A460', 24),
(26, '#FA8072', 25),
(27, '#BC8F8F', 26),
(28, '#FFC0CB', 27),
(29, '#DA70D6', 28),
(30, '#FDF5E6', 29),
(31, '#FFDEAD', 30),
(32, '#FFE4E1', 31),
(33, '#00FA9A', 32),
(34, '#FAF0E6', 33),
(35, '#778899', 34),
(36, '#FFA07A', 35),
(37, '#FFB6C1', 36),
(38, '#90EE90', 37),
(39, '#D3D3D3', 38),
(40, '#FAFAD2', 39),
(41, '#E6E6FA', 40),
(42, '#CD5C5C', 41),
(43, '#DAA520', 42),
(44, '#00BFFF', 43),
(45, '#E9967A', 44),
(46, '#008B8B', 45),
(47, '#6495ED', 46),
(48, '#7FFFD4', 47),
(49, '#FAEBD7', 48),
(50, '#F5F5DC', 49),
(1, '#32CD32', 0),
(2, '#5F9EA0', 1),
(3, '#8FBC8F', 2),
(4, '#00CED1', 3),
(5, '#ADD8E6', 4),
(6, '#E0FFFF', 5),
(7, '#20B2AA', 6),
(8, '#87CEFA', 7),
(9, '#B0C4DE', 8),
(10, '#66CDAA', 9),
(11, '#9370DB', 10),
(12, '#48D1CC', 11),
(13, '#EEE8AA', 12),
(14, '#98FB98', 13),
(15, '#AFEEEE', 14),
(16, '#FFEFD5', 15),
(17, '#FFDAB9', 16),
(18, '#DDA0DD', 17),
(19, '#B0E0E6', 18),
(20, '#D8BFD8', 19),
(21, '#F5DEB3', 20),
(22, '#EE82EE', 21),
(23, '#87CEEB', 22),
(24, '#C0C0C0', 23),
(25, '#F4A460', 24),
(26, '#FA8072', 25),
(27, '#BC8F8F', 26),
(28, '#FFC0CB', 27),
(29, '#DA70D6', 28),
(30, '#FDF5E6', 29),
(31, '#FFDEAD', 30),
(32, '#FFE4E1', 31),
(33, '#00FA9A', 32),
(34, '#FAF0E6', 33),
(35, '#778899', 34),
(36, '#FFA07A', 35),
(37, '#FFB6C1', 36),
(38, '#90EE90', 37),
(39, '#D3D3D3', 38),
(40, '#FAFAD2', 39),
(41, '#E6E6FA', 40),
(42, '#CD5C5C', 41),
(43, '#DAA520', 42),
(44, '#00BFFF', 43),
(45, '#E9967A', 44),
(46, '#008B8B', 45),
(47, '#6495ED', 46),
(48, '#7FFFD4', 47),
(49, '#FAEBD7', 48),
(50, '#F5F5DC', 49);

-- --------------------------------------------------------

--
-- Table structure for table `kpi_monthly_progress_report`
--

CREATE TABLE `kpi_monthly_progress_report` (
  `kpi_id` int(11) NOT NULL,
  `kpi_start` date NOT NULL,
  `kpi_end` date NOT NULL,
  `kpi_gend` date NOT NULL,
  `kpi_till_last` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_templates`
--

CREATE TABLE `kpi_templates` (
  `kpi_temp_id` int(11) NOT NULL,
  `kpi_temp_title` varchar(300) DEFAULT NULL,
  `kpi_temp_desc` varchar(500) DEFAULT NULL,
  `temp_id` int(11) DEFAULT NULL,
  `is_default_temp` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_eva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_top_level_report`
--

CREATE TABLE `kpi_top_level_report` (
  `kpi_tlid` int(11) NOT NULL,
  `kpiid` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `kpi_plan_per` double NOT NULL,
  `kpi_act_per` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_total_baseline`
--

CREATE TABLE `kpi_total_baseline` (
  `kpi_tid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `total_planned` double DEFAULT NULL,
  `total_actual` double DEFAULT NULL,
  `progress_month` date DEFAULT NULL,
  `temp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `lid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `user_ids` text NOT NULL,
  `user_right` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations_component`
--

CREATE TABLE `locations_component` (
  `lcid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lid` int(11) NOT NULL,
  `giscode` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maindata`
--

CREATE TABLE `maindata` (
  `itemid` int(11) NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `factor` double DEFAULT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `weight` float NOT NULL,
  `activities` text NOT NULL,
  `isentry` tinyint(1) NOT NULL,
  `resources` text NOT NULL,
  `aorder` int(11) NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maindata_log`
--

CREATE TABLE `maindata_log` (
  `log_cd` int(11) NOT NULL,
  `log_module` varchar(210) NOT NULL,
  `log_title` varchar(210) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ip` varchar(200) NOT NULL,
  `parentcd` int(11) NOT NULL,
  `parentgroup` text NOT NULL,
  `activitylevel` int(11) NOT NULL,
  `stage` varchar(200) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` text NOT NULL,
  `weight` float NOT NULL,
  `activities` text NOT NULL,
  `isentry` tinyint(1) NOT NULL,
  `resources` text NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_data_cube`
--

CREATE TABLE `main_data_cube` (
  `mdcid` int(11) NOT NULL,
  `scid` int(11) NOT NULL COMMENT 'kpiscale id',
  `itemid` int(11) NOT NULL COMMENT 'Activity id',
  `rid` int(11) NOT NULL COMMENT 'resource id',
  `planned` double NOT NULL,
  `actual` double NOT NULL,
  `comm_planned` double NOT NULL,
  `comm_actual` double NOT NULL,
  `total_planned` double NOT NULL,
  `total_actual` double NOT NULL,
  `planned_perc` double NOT NULL,
  `actual_perc` double NOT NULL,
  `temp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mis_tbl_log`
--

CREATE TABLE `mis_tbl_log` (
  `log_cd` int(11) NOT NULL DEFAULT '0',
  `log_module` varchar(255) DEFAULT NULL,
  `log_title` varchar(255) NOT NULL,
  `log_desc` text NOT NULL,
  `log_date` datetime NOT NULL,
  `log_ip` varchar(25) NOT NULL,
  `user_cd` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mis_tbl_users`
--

CREATE TABLE `mis_tbl_users` (
  `user_cd` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `member_cd` int(10) NOT NULL DEFAULT '0',
  `user_type` varchar(20) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  `sadmin` tinyint(1) NOT NULL,
  `news` tinyint(1) NOT NULL,
  `newsadm` tinyint(1) NOT NULL,
  `newsentry` tinyint(1) NOT NULL,
  `res` tinyint(1) NOT NULL,
  `resadm` tinyint(1) NOT NULL,
  `resentry` tinyint(1) NOT NULL,
  `mdata` tinyint(1) NOT NULL,
  `mdataadm` tinyint(1) NOT NULL,
  `mdataentry` tinyint(1) NOT NULL,
  `mile` tinyint(1) NOT NULL COMMENT 'Milestone',
  `mileadm` tinyint(1) NOT NULL COMMENT 'Milestone Admin',
  `mileentry` tinyint(1) NOT NULL COMMENT 'Milestone Entry',
  `spg` tinyint(1) NOT NULL COMMENT 'schedule progress',
  `spgadm` tinyint(1) NOT NULL COMMENT 'schedule progress admin',
  `spgentry` tinyint(1) NOT NULL COMMENT 'schedule progress entry',
  `spln` tinyint(1) NOT NULL,
  `splnadm` tinyint(1) NOT NULL,
  `splnentry` tinyint(1) NOT NULL,
  `kpi` tinyint(1) NOT NULL,
  `kpiadm` tinyint(1) NOT NULL,
  `kpientry` tinyint(1) NOT NULL,
  `cam` tinyint(1) NOT NULL,
  `camadm` tinyint(1) NOT NULL,
  `camentry` tinyint(1) NOT NULL,
  `boq` tinyint(1) NOT NULL,
  `boqadm` tinyint(1) NOT NULL,
  `boqentry` tinyint(1) NOT NULL,
  `ipc` tinyint(1) NOT NULL,
  `ipcadm` tinyint(1) NOT NULL,
  `ipcentry` tinyint(1) NOT NULL,
  `eva` tinyint(1) NOT NULL,
  `evaadm` tinyint(1) NOT NULL,
  `evaentry` tinyint(1) NOT NULL,
  `padm` tinyint(1) NOT NULL,
  `issueAdm` tinyint(1) NOT NULL,
  `actd` tinyint(1) NOT NULL,
  `miled` tinyint(1) NOT NULL,
  `kpid` tinyint(1) NOT NULL,
  `camd` tinyint(1) NOT NULL,
  `kfid` tinyint(1) NOT NULL,
  `evad` tinyint(1) NOT NULL,
  `pic` tinyint(1) NOT NULL,
  `picadm` tinyint(1) NOT NULL,
  `picentry` tinyint(1) NOT NULL,
  `draw` tinyint(1) NOT NULL,
  `drawadm` tinyint(1) NOT NULL,
  `drawentry` tinyint(1) NOT NULL,
  `ncf` tinyint(1) NOT NULL,
  `ncfadm` tinyint(1) NOT NULL,
  `ncfentry` tinyint(1) NOT NULL,
  `dp` tinyint(1) NOT NULL,
  `dpadm` tinyint(1) NOT NULL,
  `dpentry` tinyint(1) NOT NULL,
  `process` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mis_tbl_users`
--

INSERT INTO `mis_tbl_users` (`user_cd`, `username`, `passwd`, `first_name`, `middle_name`, `last_name`, `email`, `phone`, `designation`, `last_login_date`, `member_cd`, `user_type`, `is_active`, `sadmin`, `news`, `newsadm`, `newsentry`, `res`, `resadm`, `resentry`, `mdata`, `mdataadm`, `mdataentry`, `mile`, `mileadm`, `mileentry`, `spg`, `spgadm`, `spgentry`, `spln`, `splnadm`, `splnentry`, `kpi`, `kpiadm`, `kpientry`, `cam`, `camadm`, `camentry`, `boq`, `boqadm`, `boqentry`, `ipc`, `ipcadm`, `ipcentry`, `eva`, `evaadm`, `evaentry`, `padm`, `issueAdm`, `actd`, `miled`, `kpid`, `camd`, `kfid`, `evad`, `pic`, `picadm`, `picentry`, `draw`, `drawadm`, `drawentry`, `ncf`, `ncfadm`, `ncfentry`, `dp`, `dpadm`, `dpentry`, `process`) VALUES
(1, 'administrator', 'admin@2019', 'Super Administrator', NULL, '.', 'Abdul.Waqar@smec.com', '+92 42 3575 4751', 'General Manager (IT) Pakistan/ BMS Manager (Pak & Afg)/ Divisional Coordinator ICT (SAME)', NULL, 0, '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(3, 'guest_user', 'guest@2019', 'Guest', NULL, 'User', 'test@test.com', '', '', NULL, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0),
(4, 'AM14044', 'Green_149', 'Andrew', NULL, 'MCKUNE', 'Andrew.Mckune@smec.com', '', '', NULL, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0),
(5, 'uma', 'Green_649', 'Dr. Uma', NULL, 'MAHESWARAN', 'uma@surbanajurong.com', '', 'Chief Operating Officer SAME Division', NULL, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0),
(6, 'AA10559', 'Blue_201', 'Adil', NULL, 'AL RAEESI', 'Adil.AlRaeesi@smec.com', '', '', NULL, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0),
(7, 'MB5700935', 'mb_123456', 'Masudur', NULL, 'BHUIYAN', 'Masudur.Bhuiyan@smec.com', NULL, 'Operations Manager', NULL, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0),
(8, 'AG5700930', 'ag_123456', 'Ataulgoni', NULL, 'ASIF', 'Ataulgoni.Asif@smec.com', '', 'Operational Manager', NULL, 0, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0),
(9, 'ajith', 'ajith@2021', 'Ajith', NULL, 'B', 'ajith.b@smec.com', NULL, 'Junior Engineer', NULL, 0, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0),
(10, 'dipankar', 'dipankar@2021', 'Dipankar', NULL, 'Chutia', 'dipankar.chutia@smec.com', NULL, 'Environmental Investigation Officer', NULL, 0, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0),
(11, 'babli', 'babli@2021', 'Babli', NULL, 'Dutta', 'Babli.Dutta@smec.com', NULL, 'Social Investigation Officer', NULL, 0, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages_visit_log`
--

CREATE TABLE `pages_visit_log` (
  `p_visit_log` int(11) NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  `request_url` varchar(240) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `visited_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages_visit_log`
--

INSERT INTO `pages_visit_log` (`p_visit_log`, `log_id`, `request_url`) VALUES
(1, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(2, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(3, 1, '1_1 - New record added successfully'),
(4, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(5, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(6, 1, '2_2 - New record added successfully'),
(7, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(8, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(9, 1, '/Demo/pages/administration/Data_Updation/project_structure.php'),
(10, 1, '/Demo/pages/administration/Data_Updation/project_structure.php');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `pid` int(11) NOT NULL,
  `dsid` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `planned`
--

CREATE TABLE `planned` (
  `plid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `temp_id` int(11) DEFAULT NULL,
  `budgetdate` date DEFAULT NULL,
  `budgetqty` double DEFAULT NULL,
  `budgetamount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `pgid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `temp_id` int(11) NOT NULL,
  `progressdate` date NOT NULL,
  `progressqty` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `progressmonth`
--

CREATE TABLE `progressmonth` (
  `pmid` int(11) NOT NULL,
  `pmonth` date NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `remarks` text NOT NULL,
  `temp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `progressmonth_log`
--

CREATE TABLE `progressmonth_log` (
  `log_cd` int(11) NOT NULL,
  `log_module` varchar(210) NOT NULL,
  `log_title` varchar(210) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ip` varchar(200) NOT NULL,
  `pmonth` date NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `remarks` text NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pid` int(11) NOT NULL,
  `pcode` varchar(200) DEFAULT NULL,
  `pdetail` varchar(500) DEFAULT NULL,
  `pstart` date DEFAULT NULL,
  `pend` date DEFAULT NULL,
  `client` varchar(100) DEFAULT NULL,
  `contractor` varchar(100) DEFAULT NULL,
  `consultant` varchar(100) DEFAULT NULL,
  `funding_agency` varchar(100) DEFAULT NULL,
  `pcost` double DEFAULT NULL,
  `sector_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `smec_code` varchar(100) DEFAULT NULL,
  `ptype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pid`, `pcode`, `pdetail`, `pstart`, `pend`, `client`, `contractor`, `consultant`, `funding_agency`, `pcost`, `sector_id`, `country_id`, `location`, `smec_code`, `ptype`) VALUES
(1, '1234321', 'test project', '2020-03-02', '2024-03-01', 'test', 'test', 'test', 'test', 5060084, 1, 162, 'Lahore', '123432', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_currency`
--

CREATE TABLE `project_currency` (
  `pcid` int(11) DEFAULT NULL,
  `base_cur` varchar(10) DEFAULT NULL,
  `cur_1` varchar(10) DEFAULT NULL,
  `cur_1_rate` double DEFAULT NULL,
  `cur_2` varchar(10) DEFAULT NULL,
  `cur_2_rate` double DEFAULT NULL,
  `cur_3` varchar(20) DEFAULT NULL,
  `cur_3_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_currency`
--

INSERT INTO `project_currency` (`pcid`, `base_cur`, `cur_1`, `cur_1_rate`, `cur_2`, `cur_2_rate`, `cur_3`, `cur_3_rate`) VALUES
(NULL, 'PKR', 'PKR', 1, 'USD', 150, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_days`
--

CREATE TABLE `project_days` (
  `pd_id` int(11) NOT NULL,
  `pd_date` date DEFAULT NULL,
  `pd_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_days`
--

INSERT INTO `project_days` (`pd_id`, `pd_date`, `pd_status`) VALUES
(1, '2020-03-31', 1),
(2, '2020-04-01', 1),
(3, '2020-04-02', 1),
(4, '2020-04-03', 0),
(5, '2020-04-04', 1),
(6, '2020-04-05', 1),
(7, '2020-04-06', 1),
(8, '2020-04-07', 1),
(9, '2020-04-08', 1),
(10, '2020-04-09', 1),
(11, '2020-04-10', 0),
(12, '2020-04-11', 1),
(13, '2020-04-12', 1),
(14, '2020-04-13', 1),
(15, '2020-04-14', 1),
(16, '2020-04-15', 1),
(17, '2020-04-16', 1),
(18, '2020-04-17', 0),
(19, '2020-04-18', 1),
(20, '2020-04-19', 1),
(21, '2020-04-20', 1),
(22, '2020-04-21', 1),
(23, '2020-04-22', 1),
(24, '2020-04-23', 1),
(25, '2020-04-24', 0),
(26, '2020-04-25', 1),
(27, '2020-04-26', 1),
(28, '2020-04-27', 1),
(29, '2020-04-28', 1),
(30, '2020-04-29', 1),
(31, '2020-04-30', 1),
(32, '2020-05-01', 0),
(33, '2020-05-02', 1),
(34, '2020-05-03', 1),
(35, '2020-05-04', 1),
(36, '2020-05-05', 1),
(37, '2020-05-06', 1),
(38, '2020-05-07', 1),
(39, '2020-05-08', 0),
(40, '2020-05-09', 1),
(41, '2020-05-10', 1),
(42, '2020-05-11', 1),
(43, '2020-05-12', 1),
(44, '2020-05-13', 1),
(45, '2020-05-14', 1),
(46, '2020-05-15', 0),
(47, '2020-05-16', 1),
(48, '2020-05-17', 1),
(49, '2020-05-18', 1),
(50, '2020-05-19', 1),
(51, '2020-05-20', 1),
(52, '2020-05-21', 1),
(53, '2020-05-22', 0),
(54, '2020-05-23', 1),
(55, '2020-05-24', 1),
(56, '2020-05-25', 1),
(57, '2020-05-26', 1),
(58, '2020-05-27', 1),
(59, '2020-05-28', 1),
(60, '2020-05-29', 0),
(61, '2020-05-30', 1),
(62, '2020-05-31', 1),
(63, '2020-06-01', 1),
(64, '2020-06-02', 1),
(65, '2020-06-03', 1),
(66, '2020-06-04', 1),
(67, '2020-06-05', 0),
(68, '2020-06-06', 1),
(69, '2020-06-07', 1),
(70, '2020-06-08', 1),
(71, '2020-06-09', 1),
(72, '2020-06-10', 1),
(73, '2020-06-11', 1),
(74, '2020-06-12', 0),
(75, '2020-06-13', 1),
(76, '2020-06-14', 1),
(77, '2020-06-15', 1),
(78, '2020-06-16', 1),
(79, '2020-06-17', 1),
(80, '2020-06-18', 1),
(81, '2020-06-19', 0),
(82, '2020-06-20', 1),
(83, '2020-06-21', 1),
(84, '2020-06-22', 1),
(85, '2020-06-23', 1),
(86, '2020-06-24', 1),
(87, '2020-06-25', 1),
(88, '2020-06-26', 0),
(89, '2020-06-27', 1),
(90, '2020-06-28', 1),
(91, '2020-06-29', 1),
(92, '2020-06-30', 1),
(93, '2020-07-01', 1),
(94, '2020-07-02', 1),
(95, '2020-07-03', 0),
(96, '2020-07-04', 1),
(97, '2020-07-05', 1),
(98, '2020-07-06', 1),
(99, '2020-07-07', 1),
(100, '2020-07-08', 1),
(101, '2020-07-09', 1),
(102, '2020-07-10', 0),
(103, '2020-07-11', 1),
(104, '2020-07-12', 1),
(105, '2020-07-13', 1),
(106, '2020-07-14', 1),
(107, '2020-07-15', 1),
(108, '2020-07-16', 1),
(109, '2020-07-17', 0),
(110, '2020-07-18', 1),
(111, '2020-07-19', 1),
(112, '2020-07-20', 1),
(113, '2020-07-21', 1),
(114, '2020-07-22', 1),
(115, '2020-07-23', 1),
(116, '2020-07-24', 0),
(117, '2020-07-25', 1),
(118, '2020-07-26', 1),
(119, '2020-07-27', 1),
(120, '2020-07-28', 1),
(121, '2020-07-29', 1),
(122, '2020-07-30', 1),
(123, '2020-07-31', 0),
(124, '2020-08-01', 1),
(125, '2020-08-02', 1),
(126, '2020-08-03', 1),
(127, '2020-08-04', 1),
(128, '2020-08-05', 1),
(129, '2020-08-06', 1),
(130, '2020-08-07', 0),
(131, '2020-08-08', 1),
(132, '2020-08-09', 1),
(133, '2020-08-10', 1),
(134, '2020-08-11', 1),
(135, '2020-08-12', 1),
(136, '2020-08-13', 1),
(137, '2020-08-14', 0),
(138, '2020-08-15', 1),
(139, '2020-08-16', 1),
(140, '2020-08-17', 1),
(141, '2020-08-18', 1),
(142, '2020-08-19', 1),
(143, '2020-08-20', 1),
(144, '2020-08-21', 0),
(145, '2020-08-22', 1),
(146, '2020-08-23', 1),
(147, '2020-08-24', 1),
(148, '2020-08-25', 1),
(149, '2020-08-26', 1),
(150, '2020-08-27', 1),
(151, '2020-08-28', 0),
(152, '2020-08-29', 1),
(153, '2020-08-30', 1),
(154, '2020-08-31', 1),
(155, '2020-09-01', 1),
(156, '2020-09-02', 1),
(157, '2020-09-03', 1),
(158, '2020-09-04', 0),
(159, '2020-09-05', 1),
(160, '2020-09-06', 1),
(161, '2020-09-07', 1),
(162, '2020-09-08', 1),
(163, '2020-09-09', 1),
(164, '2020-09-10', 1),
(165, '2020-09-11', 0),
(166, '2020-09-12', 1),
(167, '2020-09-13', 1),
(168, '2020-09-14', 1),
(169, '2020-09-15', 1),
(170, '2020-09-16', 1),
(171, '2020-09-17', 1),
(172, '2020-09-18', 0),
(173, '2020-09-19', 1),
(174, '2020-09-20', 1),
(175, '2020-09-21', 1),
(176, '2020-09-22', 1),
(177, '2020-09-23', 1),
(178, '2020-09-24', 1),
(179, '2020-09-25', 0),
(180, '2020-09-26', 1),
(181, '2020-09-27', 1),
(182, '2020-09-28', 1),
(183, '2020-09-29', 1),
(184, '2020-09-30', 1),
(185, '2020-10-01', 1),
(186, '2020-10-02', 0),
(187, '2020-10-03', 1),
(188, '2020-10-04', 1),
(189, '2020-10-05', 1),
(190, '2020-10-06', 1),
(191, '2020-10-07', 1),
(192, '2020-10-08', 1),
(193, '2020-10-09', 0),
(194, '2020-10-10', 1),
(195, '2020-10-11', 1),
(196, '2020-10-12', 1),
(197, '2020-10-13', 1),
(198, '2020-10-14', 1),
(199, '2020-10-15', 1),
(200, '2020-10-16', 0),
(201, '2020-10-17', 1),
(202, '2020-10-18', 1),
(203, '2020-10-19', 1),
(204, '2020-10-20', 1),
(205, '2020-10-21', 1),
(206, '2020-10-22', 1),
(207, '2020-10-23', 0),
(208, '2020-10-24', 1),
(209, '2020-10-25', 1),
(210, '2020-10-26', 1),
(211, '2020-10-27', 1),
(212, '2020-10-28', 1),
(213, '2020-10-29', 1),
(214, '2020-10-30', 0),
(215, '2020-10-31', 1),
(216, '2020-11-01', 1),
(217, '2020-11-02', 1),
(218, '2020-11-03', 1),
(219, '2020-11-04', 1),
(220, '2020-11-05', 1),
(221, '2020-11-06', 0),
(222, '2020-11-07', 1),
(223, '2020-11-08', 1),
(224, '2020-11-09', 1),
(225, '2020-11-10', 1),
(226, '2020-11-11', 1),
(227, '2020-11-12', 1),
(228, '2020-11-13', 0),
(229, '2020-11-14', 1),
(230, '2020-11-15', 1),
(231, '2020-11-16', 1),
(232, '2020-11-17', 1),
(233, '2020-11-18', 1),
(234, '2020-11-19', 1),
(235, '2020-11-20', 0),
(236, '2020-11-21', 1),
(237, '2020-11-22', 1),
(238, '2020-11-23', 1),
(239, '2020-11-24', 1),
(240, '2020-11-25', 1),
(241, '2020-11-26', 1),
(242, '2020-11-27', 0),
(243, '2020-11-28', 1),
(244, '2020-11-29', 1),
(245, '2020-11-30', 1),
(246, '2020-12-01', 1),
(247, '2020-12-02', 1),
(248, '2020-12-03', 1),
(249, '2020-12-04', 0),
(250, '2020-12-05', 1),
(251, '2020-12-06', 1),
(252, '2020-12-07', 1),
(253, '2020-12-08', 1),
(254, '2020-12-09', 1),
(255, '2020-12-10', 1),
(256, '2020-12-11', 0),
(257, '2020-12-12', 1),
(258, '2020-12-13', 1),
(259, '2020-12-14', 1),
(260, '2020-12-15', 1),
(261, '2020-12-16', 1),
(262, '2020-12-17', 1),
(263, '2020-12-18', 0),
(264, '2020-12-19', 1),
(265, '2020-12-20', 1),
(266, '2020-12-21', 1),
(267, '2020-12-22', 1),
(268, '2020-12-23', 1),
(269, '2020-12-24', 1),
(270, '2020-12-25', 0),
(271, '2020-12-26', 1),
(272, '2020-12-27', 1),
(273, '2020-12-28', 1),
(274, '2020-12-29', 1),
(275, '2020-12-30', 1),
(276, '2020-12-31', 1),
(277, '2021-01-01', 0),
(278, '2021-01-02', 1),
(279, '2021-01-03', 1),
(280, '2021-01-04', 1),
(281, '2021-01-05', 1),
(282, '2021-01-06', 1),
(283, '2021-01-07', 1),
(284, '2021-01-08', 0),
(285, '2021-01-09', 1),
(286, '2021-01-10', 1),
(287, '2021-01-11', 1),
(288, '2021-01-12', 1),
(289, '2021-01-13', 1),
(290, '2021-01-14', 1),
(291, '2021-01-15', 0),
(292, '2021-01-16', 1),
(293, '2021-01-17', 1),
(294, '2021-01-18', 1),
(295, '2021-01-19', 1),
(296, '2021-01-20', 1),
(297, '2021-01-21', 1),
(298, '2021-01-22', 0),
(299, '2021-01-23', 1),
(300, '2021-01-24', 1),
(301, '2021-01-25', 1),
(302, '2021-01-26', 1),
(303, '2021-01-27', 1),
(304, '2021-01-28', 1),
(305, '2021-01-29', 0),
(306, '2021-01-30', 1),
(307, '2021-01-31', 1),
(308, '2021-02-01', 1),
(309, '2021-02-02', 1),
(310, '2021-02-03', 1),
(311, '2021-02-04', 1),
(312, '2021-02-05', 0),
(313, '2021-02-06', 1),
(314, '2021-02-07', 1),
(315, '2021-02-08', 1),
(316, '2021-02-09', 1),
(317, '2021-02-10', 1),
(318, '2021-02-11', 1),
(319, '2021-02-12', 0),
(320, '2021-02-13', 1),
(321, '2021-02-14', 1),
(322, '2021-02-15', 1),
(323, '2021-02-16', 1),
(324, '2021-02-17', 1),
(325, '2021-02-18', 1),
(326, '2021-02-19', 0),
(327, '2021-02-20', 1),
(328, '2021-02-21', 1),
(329, '2021-02-22', 1),
(330, '2021-02-23', 1),
(331, '2021-02-24', 1),
(332, '2021-02-25', 1),
(333, '2021-02-26', 0),
(334, '2021-02-27', 1),
(335, '2021-02-28', 1),
(336, '2021-03-01', 1),
(337, '2021-03-02', 1),
(338, '2021-03-03', 1),
(339, '2021-03-04', 1),
(340, '2021-03-05', 0),
(341, '2021-03-06', 1),
(342, '2021-03-07', 1),
(343, '2021-03-08', 1),
(344, '2021-03-09', 1),
(345, '2021-03-10', 1),
(346, '2021-03-11', 1),
(347, '2021-03-12', 0),
(348, '2021-03-13', 1),
(349, '2021-03-14', 1),
(350, '2021-03-15', 1),
(351, '2021-03-16', 1),
(352, '2021-03-17', 1),
(353, '2021-03-18', 1),
(354, '2021-03-19', 0),
(355, '2021-03-20', 1),
(356, '2021-03-21', 1),
(357, '2021-03-22', 1),
(358, '2021-03-23', 1),
(359, '2021-03-24', 1),
(360, '2021-03-25', 1),
(361, '2021-03-26', 0),
(362, '2021-03-27', 1),
(363, '2021-03-28', 1),
(364, '2021-03-29', 1),
(365, '2021-03-30', 1),
(366, '2021-03-31', 1),
(367, '2021-04-01', 1),
(368, '2021-04-02', 0),
(369, '2021-04-03', 1),
(370, '2021-04-04', 1),
(371, '2021-04-05', 1),
(372, '2021-04-06', 1),
(373, '2021-04-07', 1),
(374, '2021-04-08', 1),
(375, '2021-04-09', 0),
(376, '2021-04-10', 1),
(377, '2021-04-11', 1),
(378, '2021-04-12', 1),
(379, '2021-04-13', 1),
(380, '2021-04-14', 1),
(381, '2021-04-15', 1),
(382, '2021-04-16', 0),
(383, '2021-04-17', 1),
(384, '2021-04-18', 1),
(385, '2021-04-19', 1),
(386, '2021-04-20', 1),
(387, '2021-04-21', 1),
(388, '2021-04-22', 1),
(389, '2021-04-23', 0),
(390, '2021-04-24', 1),
(391, '2021-04-25', 1),
(392, '2021-04-26', 1),
(393, '2021-04-27', 1),
(394, '2021-04-28', 1),
(395, '2021-04-29', 1),
(396, '2021-04-30', 0),
(397, '2021-05-01', 1),
(398, '2021-05-02', 1),
(399, '2021-05-03', 1),
(400, '2021-05-04', 1),
(401, '2021-05-05', 1),
(402, '2021-05-06', 1),
(403, '2021-05-07', 0),
(404, '2021-05-08', 1),
(405, '2021-05-09', 1),
(406, '2021-05-10', 1),
(407, '2021-05-11', 1),
(408, '2021-05-12', 1),
(409, '2021-05-13', 1),
(410, '2021-05-14', 0),
(411, '2021-05-15', 1),
(412, '2021-05-16', 1),
(413, '2021-05-17', 1),
(414, '2021-05-18', 1),
(415, '2021-05-19', 1),
(416, '2021-05-20', 1),
(417, '2021-05-21', 0),
(418, '2021-05-22', 1),
(419, '2021-05-23', 1),
(420, '2021-05-24', 1),
(421, '2021-05-25', 1),
(422, '2021-05-26', 1),
(423, '2021-05-27', 1),
(424, '2021-05-28', 0),
(425, '2021-05-29', 1),
(426, '2021-05-30', 1),
(427, '2021-05-31', 1),
(428, '2021-06-01', 1),
(429, '2021-06-02', 1),
(430, '2021-06-03', 1),
(431, '2021-06-04', 0),
(432, '2021-06-05', 1),
(433, '2021-06-06', 1),
(434, '2021-06-07', 1),
(435, '2021-06-08', 1),
(436, '2021-06-09', 1),
(437, '2021-06-10', 1),
(438, '2021-06-11', 0),
(439, '2021-06-12', 1),
(440, '2021-06-13', 1),
(441, '2021-06-14', 1),
(442, '2021-06-15', 1),
(443, '2021-06-16', 1),
(444, '2021-06-17', 1),
(445, '2021-06-18', 0),
(446, '2021-06-19', 1),
(447, '2021-06-20', 1),
(448, '2021-06-21', 1),
(449, '2021-06-22', 1),
(450, '2021-06-23', 1),
(451, '2021-06-24', 1),
(452, '2021-06-25', 0),
(453, '2021-06-26', 1),
(454, '2021-06-27', 1),
(455, '2021-06-28', 1),
(456, '2021-06-29', 1),
(457, '2021-06-30', 1),
(458, '2021-07-01', 1),
(459, '2021-07-02', 0),
(460, '2021-07-03', 1),
(461, '2021-07-04', 1),
(462, '2021-07-05', 1),
(463, '2021-07-06', 1),
(464, '2021-07-07', 1),
(465, '2021-07-08', 1),
(466, '2021-07-09', 0),
(467, '2021-07-10', 1),
(468, '2021-07-11', 1),
(469, '2021-07-12', 1),
(470, '2021-07-13', 1),
(471, '2021-07-14', 1),
(472, '2021-07-15', 1),
(473, '2021-07-16', 0),
(474, '2021-07-17', 1),
(475, '2021-07-18', 1),
(476, '2021-07-19', 1),
(477, '2021-07-20', 1),
(478, '2021-07-21', 1),
(479, '2021-07-22', 1),
(480, '2021-07-23', 0),
(481, '2021-07-24', 1),
(482, '2021-07-25', 1),
(483, '2021-07-26', 1),
(484, '2021-07-27', 1),
(485, '2021-07-28', 1),
(486, '2021-07-29', 1),
(487, '2021-07-30', 0),
(488, '2021-07-31', 1),
(489, '2021-08-01', 1),
(490, '2021-08-02', 1),
(491, '2021-08-03', 1),
(492, '2021-08-04', 1),
(493, '2021-08-05', 1),
(494, '2021-08-06', 0),
(495, '2021-08-07', 1),
(496, '2021-08-08', 1),
(497, '2021-08-09', 1),
(498, '2021-08-10', 1),
(499, '2021-08-11', 1),
(500, '2021-08-12', 1),
(501, '2021-08-13', 0),
(502, '2021-08-14', 1),
(503, '2021-08-15', 1),
(504, '2021-08-16', 1),
(505, '2021-08-17', 1),
(506, '2021-08-18', 1),
(507, '2021-08-19', 1),
(508, '2021-08-20', 0),
(509, '2021-08-21', 1),
(510, '2021-08-22', 1),
(511, '2021-08-23', 1),
(512, '2021-08-24', 1),
(513, '2021-08-25', 1),
(514, '2021-08-26', 1),
(515, '2021-08-27', 0),
(516, '2021-08-28', 1),
(517, '2021-08-29', 1),
(518, '2021-08-30', 1),
(519, '2021-08-31', 1),
(520, '2021-09-01', 1),
(521, '2021-09-02', 1),
(522, '2021-09-03', 0),
(523, '2021-09-04', 1),
(524, '2021-09-05', 1),
(525, '2021-09-06', 1),
(526, '2021-09-07', 1),
(527, '2021-09-08', 1),
(528, '2021-09-09', 1),
(529, '2021-09-10', 0),
(530, '2021-09-11', 1),
(531, '2021-09-12', 1),
(532, '2021-09-13', 1),
(533, '2021-09-14', 1),
(534, '2021-09-15', 1),
(535, '2021-09-16', 1),
(536, '2021-09-17', 0),
(537, '2021-09-18', 1),
(538, '2021-09-19', 1),
(539, '2021-09-20', 1),
(540, '2021-09-21', 1),
(541, '2021-09-22', 1),
(542, '2021-09-23', 1),
(543, '2021-09-24', 0),
(544, '2021-09-25', 1),
(545, '2021-09-26', 1),
(546, '2021-09-27', 1),
(547, '2021-09-28', 1),
(548, '2021-09-29', 1),
(549, '2021-09-30', 1),
(550, '2021-10-01', 0),
(551, '2021-10-02', 1),
(552, '2021-10-03', 1),
(553, '2021-10-04', 1),
(554, '2021-10-05', 1),
(555, '2021-10-06', 1),
(556, '2021-10-07', 1),
(557, '2021-10-08', 0),
(558, '2021-10-09', 1),
(559, '2021-10-10', 1),
(560, '2021-10-11', 1),
(561, '2021-10-12', 1),
(562, '2021-10-13', 1),
(563, '2021-10-14', 1),
(564, '2021-10-15', 0),
(565, '2021-10-16', 1),
(566, '2021-10-17', 1),
(567, '2021-10-18', 1),
(568, '2021-10-19', 1),
(569, '2021-10-20', 1),
(570, '2021-10-21', 1),
(571, '2021-10-22', 0),
(572, '2021-10-23', 1),
(573, '2021-10-24', 1),
(574, '2021-10-25', 1),
(575, '2021-10-26', 1),
(576, '2021-10-27', 1),
(577, '2021-10-28', 1),
(578, '2021-10-29', 0),
(579, '2021-10-30', 1),
(580, '2021-10-31', 1),
(581, '2021-11-01', 1),
(582, '2021-11-02', 1),
(583, '2021-11-03', 1),
(584, '2021-11-04', 1),
(585, '2021-11-05', 0),
(586, '2021-11-06', 1),
(587, '2021-11-07', 1),
(588, '2021-11-08', 1),
(589, '2021-11-09', 1),
(590, '2021-11-10', 1),
(591, '2021-11-11', 1),
(592, '2021-11-12', 0),
(593, '2021-11-13', 1),
(594, '2021-11-14', 1),
(595, '2021-11-15', 1),
(596, '2021-11-16', 1),
(597, '2021-11-17', 1),
(598, '2021-11-18', 1),
(599, '2021-11-19', 0),
(600, '2021-11-20', 1),
(601, '2021-11-21', 1),
(602, '2021-11-22', 1),
(603, '2021-11-23', 1),
(604, '2021-11-24', 1),
(605, '2021-11-25', 1),
(606, '2021-11-26', 0),
(607, '2021-11-27', 1),
(608, '2021-11-28', 1),
(609, '2021-11-29', 1),
(610, '2021-11-30', 1),
(611, '2021-12-01', 1),
(612, '2021-12-02', 1),
(613, '2021-12-03', 0),
(614, '2021-12-04', 1),
(615, '2021-12-05', 1),
(616, '2021-12-06', 1),
(617, '2021-12-07', 1),
(618, '2021-12-08', 1),
(619, '2021-12-09', 1),
(620, '2021-12-10', 0),
(621, '2021-12-11', 1),
(622, '2021-12-12', 1),
(623, '2021-12-13', 1),
(624, '2021-12-14', 1),
(625, '2021-12-15', 1),
(626, '2021-12-16', 1),
(627, '2021-12-17', 0),
(628, '2021-12-18', 1),
(629, '2021-12-19', 1),
(630, '2021-12-20', 1),
(631, '2021-12-21', 1),
(632, '2021-12-22', 1),
(633, '2021-12-23', 1),
(634, '2021-12-24', 0),
(635, '2021-12-25', 1),
(636, '2021-12-26', 1),
(637, '2021-12-27', 1),
(638, '2021-12-28', 1),
(639, '2021-12-29', 1),
(640, '2021-12-30', 1),
(641, '2021-12-31', 0),
(642, '2022-01-01', 1),
(643, '2022-01-02', 1),
(644, '2022-01-03', 1),
(645, '2022-01-04', 1),
(646, '2022-01-05', 1),
(647, '2022-01-06', 1),
(648, '2022-01-07', 0),
(649, '2022-01-08', 1),
(650, '2022-01-09', 1),
(651, '2022-01-10', 1),
(652, '2022-01-11', 1),
(653, '2022-01-12', 1),
(654, '2022-01-13', 1),
(655, '2022-01-14', 0),
(656, '2022-01-15', 1),
(657, '2022-01-16', 1),
(658, '2022-01-17', 1),
(659, '2022-01-18', 1),
(660, '2022-01-19', 1),
(661, '2022-01-20', 1),
(662, '2022-01-21', 0),
(663, '2022-01-22', 1),
(664, '2022-01-23', 1),
(665, '2022-01-24', 1),
(666, '2022-01-25', 1),
(667, '2022-01-26', 1),
(668, '2022-01-27', 1),
(669, '2022-01-28', 0),
(670, '2022-01-29', 1),
(671, '2022-01-30', 1),
(672, '2022-01-31', 1),
(673, '2022-02-01', 1),
(674, '2022-02-02', 1),
(675, '2022-02-03', 1),
(676, '2022-02-04', 0),
(677, '2022-02-05', 1),
(678, '2022-02-06', 1),
(679, '2022-02-07', 1),
(680, '2022-02-08', 1),
(681, '2022-02-09', 1),
(682, '2022-02-10', 1),
(683, '2022-02-11', 0),
(684, '2022-02-12', 1),
(685, '2022-02-13', 1),
(686, '2022-02-14', 1),
(687, '2022-02-15', 1),
(688, '2022-02-16', 1),
(689, '2022-02-17', 1),
(690, '2022-02-18', 0),
(691, '2022-02-19', 1),
(692, '2022-02-20', 1),
(693, '2022-02-21', 1),
(694, '2022-02-22', 1),
(695, '2022-02-23', 1),
(696, '2022-02-24', 1),
(697, '2022-02-25', 0),
(698, '2022-02-26', 1),
(699, '2022-02-27', 1),
(700, '2022-02-28', 1),
(701, '2022-03-01', 1),
(702, '2022-03-02', 1),
(703, '2022-03-03', 1),
(704, '2022-03-04', 0),
(705, '2022-03-05', 1),
(706, '2022-03-06', 1),
(707, '2022-03-07', 1),
(708, '2022-03-08', 1),
(709, '2022-03-09', 1),
(710, '2022-03-10', 1),
(711, '2022-03-11', 0),
(712, '2022-03-12', 1),
(713, '2022-03-13', 1),
(714, '2022-03-14', 1),
(715, '2022-03-15', 1),
(716, '2022-03-16', 1),
(717, '2022-03-17', 1),
(718, '2022-03-18', 0),
(719, '2022-03-19', 1),
(720, '2022-03-20', 1),
(721, '2022-03-21', 1),
(722, '2022-03-22', 1),
(723, '2022-03-23', 1),
(724, '2022-03-24', 1),
(725, '2022-03-25', 0),
(726, '2022-03-26', 1),
(727, '2022-03-27', 1),
(728, '2022-03-28', 1),
(729, '2022-03-29', 1),
(730, '2022-03-30', 1),
(731, '2022-03-31', 1),
(732, '2022-04-01', 0),
(733, '2022-04-02', 1),
(734, '2022-04-03', 1),
(735, '2022-04-04', 1),
(736, '2022-04-05', 1),
(737, '2022-04-06', 1),
(738, '2022-04-07', 1),
(739, '2022-04-08', 0),
(740, '2022-04-09', 1),
(741, '2022-04-10', 1),
(742, '2022-04-11', 1),
(743, '2022-04-12', 1),
(744, '2022-04-13', 1),
(745, '2022-04-14', 1),
(746, '2022-04-15', 0),
(747, '2022-04-16', 1),
(748, '2022-04-17', 1),
(749, '2022-04-18', 1),
(750, '2022-04-19', 1),
(751, '2022-04-20', 1),
(752, '2022-04-21', 1),
(753, '2022-04-22', 0),
(754, '2022-04-23', 1),
(755, '2022-04-24', 1),
(756, '2022-04-25', 1),
(757, '2022-04-26', 1),
(758, '2022-04-27', 1),
(759, '2022-04-28', 1),
(760, '2022-04-29', 0),
(761, '2022-04-30', 1),
(762, '2022-05-01', 1),
(763, '2022-05-02', 1),
(764, '2022-05-03', 1),
(765, '2022-05-04', 1),
(766, '2022-05-05', 1),
(767, '2022-05-06', 0),
(768, '2022-05-07', 1),
(769, '2022-05-08', 1),
(770, '2022-05-09', 1),
(771, '2022-05-10', 1),
(772, '2022-05-11', 1),
(773, '2022-05-12', 1),
(774, '2022-05-13', 0),
(775, '2022-05-14', 1),
(776, '2022-05-15', 1),
(777, '2022-05-16', 1),
(778, '2022-05-17', 1),
(779, '2022-05-18', 1),
(780, '2022-05-19', 1),
(781, '2022-05-20', 0),
(782, '2022-05-21', 1),
(783, '2022-05-22', 1),
(784, '2022-05-23', 1),
(785, '2022-05-24', 1),
(786, '2022-05-25', 1),
(787, '2022-05-26', 1),
(788, '2022-05-27', 0),
(789, '2022-05-28', 1),
(790, '2022-05-29', 1),
(791, '2022-05-30', 1),
(792, '2022-05-31', 1),
(793, '2022-06-01', 1),
(794, '2022-06-02', 1),
(795, '2022-06-03', 0),
(796, '2022-06-04', 1),
(797, '2022-06-05', 1),
(798, '2022-06-06', 1),
(799, '2022-06-07', 1),
(800, '2022-06-08', 1),
(801, '2022-06-09', 1),
(802, '2022-06-10', 0),
(803, '2022-06-11', 1),
(804, '2022-06-12', 1),
(805, '2022-06-13', 1),
(806, '2022-06-14', 1),
(807, '2022-06-15', 1),
(808, '2022-06-16', 1),
(809, '2022-06-17', 0),
(810, '2022-06-18', 1),
(811, '2022-06-19', 1),
(812, '2022-06-20', 1),
(813, '2022-06-21', 1),
(814, '2022-06-22', 1),
(815, '2022-06-23', 1),
(816, '2022-06-24', 0),
(817, '2022-06-25', 1),
(818, '2022-06-26', 1),
(819, '2022-06-27', 1),
(820, '2022-06-28', 1),
(821, '2022-06-29', 1),
(822, '2022-06-30', 1),
(823, '2022-07-01', 0),
(824, '2022-07-02', 1),
(825, '2022-07-03', 1),
(826, '2022-07-04', 1),
(827, '2022-07-05', 1),
(828, '2022-07-06', 1),
(829, '2022-07-07', 1),
(830, '2022-07-08', 0),
(831, '2022-07-09', 1),
(832, '2022-07-10', 1),
(833, '2022-07-11', 1),
(834, '2022-07-12', 1),
(835, '2022-07-13', 1),
(836, '2022-07-14', 1),
(837, '2022-07-15', 0),
(838, '2022-07-16', 1),
(839, '2022-07-17', 1),
(840, '2022-07-18', 1),
(841, '2022-07-19', 1),
(842, '2022-07-20', 1),
(843, '2022-07-21', 1),
(844, '2022-07-22', 0),
(845, '2022-07-23', 1),
(846, '2022-07-24', 1),
(847, '2022-07-25', 1),
(848, '2022-07-26', 1),
(849, '2022-07-27', 1),
(850, '2022-07-28', 1),
(851, '2022-07-29', 0),
(852, '2022-07-30', 1),
(853, '2022-07-31', 1),
(854, '2022-08-01', 1),
(855, '2022-08-02', 1),
(856, '2022-08-03', 1),
(857, '2022-08-04', 1),
(858, '2022-08-05', 0),
(859, '2022-08-06', 1),
(860, '2022-08-07', 1),
(861, '2022-08-08', 1),
(862, '2022-08-09', 1),
(863, '2022-08-10', 1),
(864, '2022-08-11', 1),
(865, '2022-08-12', 0),
(866, '2022-08-13', 1),
(867, '2022-08-14', 1),
(868, '2022-08-15', 1),
(869, '2022-08-16', 1),
(870, '2022-08-17', 1),
(871, '2022-08-18', 1),
(872, '2022-08-19', 0),
(873, '2022-08-20', 1),
(874, '2022-08-21', 1),
(875, '2022-08-22', 1),
(876, '2022-08-23', 1),
(877, '2022-08-24', 1),
(878, '2022-08-25', 1),
(879, '2022-08-26', 0),
(880, '2022-08-27', 1),
(881, '2022-08-28', 1),
(882, '2022-08-29', 1),
(883, '2022-08-30', 1),
(884, '2022-08-31', 1),
(885, '2022-09-01', 1),
(886, '2022-09-02', 0),
(887, '2022-09-03', 1),
(888, '2022-09-04', 1),
(889, '2022-09-05', 1),
(890, '2022-09-06', 1),
(891, '2022-09-07', 1),
(892, '2022-09-08', 1),
(893, '2022-09-09', 0),
(894, '2022-09-10', 1),
(895, '2022-09-11', 1),
(896, '2022-09-12', 1),
(897, '2022-09-13', 1),
(898, '2022-09-14', 1),
(899, '2022-09-15', 1),
(900, '2022-09-16', 0),
(901, '2022-09-17', 1),
(902, '2022-09-18', 1),
(903, '2022-09-19', 1),
(904, '2022-09-20', 1),
(905, '2022-09-21', 1),
(906, '2022-09-22', 1),
(907, '2022-09-23', 0),
(908, '2022-09-24', 1),
(909, '2022-09-25', 1),
(910, '2022-09-26', 1),
(911, '2022-09-27', 1),
(912, '2022-09-28', 1),
(913, '2022-09-29', 1),
(914, '2022-09-30', 0),
(915, '2022-10-01', 1),
(916, '2022-10-02', 1),
(917, '2022-10-03', 1),
(918, '2022-10-04', 1),
(919, '2022-10-05', 1),
(920, '2022-10-06', 1),
(921, '2022-10-07', 0),
(922, '2022-10-08', 1),
(923, '2022-10-09', 1),
(924, '2022-10-10', 1),
(925, '2022-10-11', 1),
(926, '2022-10-12', 1),
(927, '2022-10-13', 1),
(928, '2022-10-14', 0),
(929, '2022-10-15', 1),
(930, '2022-10-16', 1),
(931, '2022-10-17', 1),
(932, '2022-10-18', 1),
(933, '2022-10-19', 1),
(934, '2022-10-20', 1),
(935, '2022-10-21', 0),
(936, '2022-10-22', 1),
(937, '2022-10-23', 1),
(938, '2022-10-24', 1),
(939, '2022-10-25', 1),
(940, '2022-10-26', 1),
(941, '2022-10-27', 1),
(942, '2022-10-28', 0),
(943, '2022-10-29', 1),
(944, '2022-10-30', 1),
(945, '2022-10-31', 1),
(946, '2022-11-01', 1),
(947, '2022-11-02', 1),
(948, '2022-11-03', 1),
(949, '2022-11-04', 0),
(950, '2022-11-05', 1),
(951, '2022-11-06', 1),
(952, '2022-11-07', 1),
(953, '2022-11-08', 1),
(954, '2022-11-09', 1),
(955, '2022-11-10', 1),
(956, '2022-11-11', 0),
(957, '2022-11-12', 1),
(958, '2022-11-13', 1),
(959, '2022-11-14', 1),
(960, '2022-11-15', 1),
(961, '2022-11-16', 1),
(962, '2022-11-17', 1),
(963, '2022-11-18', 0),
(964, '2022-11-19', 1),
(965, '2022-11-20', 1),
(966, '2022-11-21', 1),
(967, '2022-11-22', 1),
(968, '2022-11-23', 1),
(969, '2022-11-24', 1),
(970, '2022-11-25', 0),
(971, '2022-11-26', 1),
(972, '2022-11-27', 1),
(973, '2022-11-28', 1),
(974, '2022-11-29', 1),
(975, '2022-11-30', 1),
(976, '2022-12-01', 1),
(977, '2022-12-02', 0),
(978, '2022-12-03', 1),
(979, '2022-12-04', 1),
(980, '2022-12-05', 1),
(981, '2022-12-06', 1),
(982, '2022-12-07', 1),
(983, '2022-12-08', 1),
(984, '2022-12-09', 0),
(985, '2022-12-10', 1),
(986, '2022-12-11', 1),
(987, '2022-12-12', 1),
(988, '2022-12-13', 1),
(989, '2022-12-14', 1),
(990, '2022-12-15', 1),
(991, '2022-12-16', 0),
(992, '2022-12-17', 1),
(993, '2022-12-18', 1),
(994, '2022-12-19', 1),
(995, '2022-12-20', 1),
(996, '2022-12-21', 1),
(997, '2022-12-22', 1),
(998, '2022-12-23', 0),
(999, '2022-12-24', 1),
(1000, '2022-12-25', 1),
(1001, '2022-12-26', 1),
(1002, '2022-12-27', 1),
(1003, '2022-12-28', 1),
(1004, '2022-12-29', 1),
(1005, '2022-12-30', 0),
(1006, '2022-12-31', 1),
(1007, '2023-01-01', 1),
(1008, '2023-01-02', 1),
(1009, '2023-01-03', 1),
(1010, '2023-01-04', 1),
(1011, '2023-01-05', 1),
(1012, '2023-01-06', 0),
(1013, '2023-01-07', 1),
(1014, '2023-01-08', 1),
(1015, '2023-01-09', 1),
(1016, '2023-01-10', 1),
(1017, '2023-01-11', 1),
(1018, '2023-01-12', 1),
(1019, '2023-01-13', 0),
(1020, '2023-01-14', 1),
(1021, '2023-01-15', 1),
(1022, '2023-01-16', 1),
(1023, '2023-01-17', 1),
(1024, '2023-01-18', 1),
(1025, '2023-01-19', 1),
(1026, '2023-01-20', 0),
(1027, '2023-01-21', 1),
(1028, '2023-01-22', 1),
(1029, '2023-01-23', 1),
(1030, '2023-01-24', 1),
(1031, '2023-01-25', 1),
(1032, '2023-01-26', 1),
(1033, '2023-01-27', 0),
(1034, '2023-01-28', 1),
(1035, '2023-01-29', 1),
(1036, '2023-01-30', 1),
(1037, '2023-01-31', 1),
(1038, '2023-02-01', 1),
(1039, '2023-02-02', 1),
(1040, '2023-02-03', 0),
(1041, '2023-02-04', 1),
(1042, '2023-02-05', 1),
(1043, '2023-02-06', 1),
(1044, '2023-02-07', 1),
(1045, '2023-02-08', 1),
(1046, '2023-02-09', 1),
(1047, '2023-02-10', 0),
(1048, '2023-02-11', 1),
(1049, '2023-02-12', 1),
(1050, '2023-02-13', 1),
(1051, '2023-02-14', 1),
(1052, '2023-02-15', 1),
(1053, '2023-02-16', 1),
(1054, '2023-02-17', 0),
(1055, '2023-02-18', 1),
(1056, '2023-02-19', 1),
(1057, '2023-02-20', 1),
(1058, '2023-02-21', 1),
(1059, '2023-02-22', 1),
(1060, '2023-02-23', 1),
(1061, '2023-02-24', 0),
(1062, '2023-02-25', 1),
(1063, '2023-02-26', 1),
(1064, '2023-02-27', 1),
(1065, '2023-02-28', 1),
(1066, '2023-03-01', 1),
(1067, '2023-03-02', 1),
(1068, '2023-03-03', 0),
(1069, '2023-03-04', 1),
(1070, '2023-03-05', 1),
(1071, '2023-03-06', 1),
(1072, '2023-03-07', 1),
(1073, '2023-03-08', 1),
(1074, '2023-03-09', 1),
(1075, '2023-03-10', 0),
(1076, '2023-03-11', 1),
(1077, '2023-03-12', 1),
(1078, '2023-03-13', 1),
(1079, '2023-03-14', 1),
(1080, '2023-03-15', 1),
(1081, '2023-03-16', 1),
(1082, '2023-03-17', 0),
(1083, '2023-03-18', 1),
(1084, '2023-03-19', 1),
(1085, '2023-03-20', 1),
(1086, '2023-03-21', 1),
(1087, '2023-03-22', 1),
(1088, '2023-03-23', 1),
(1089, '2023-03-24', 0),
(1090, '2023-03-25', 1),
(1091, '2023-03-26', 1),
(1092, '2023-03-27', 1),
(1093, '2023-03-28', 1),
(1094, '2023-03-29', 1),
(1095, '2023-03-30', 1),
(1096, '2023-03-31', 0),
(1097, '2023-04-01', 1),
(1098, '2023-04-02', 1),
(1099, '2023-04-03', 1),
(1100, '2023-04-04', 1),
(1101, '2023-04-05', 1),
(1102, '2023-04-06', 1),
(1103, '2023-04-07', 0),
(1104, '2023-04-08', 1),
(1105, '2023-04-09', 1),
(1106, '2023-04-10', 1),
(1107, '2023-04-11', 1),
(1108, '2023-04-12', 1),
(1109, '2023-04-13', 1),
(1110, '2023-04-14', 0),
(1111, '2023-04-15', 1),
(1112, '2023-04-16', 1),
(1113, '2023-04-17', 1),
(1114, '2023-04-18', 1),
(1115, '2023-04-19', 1),
(1116, '2023-04-20', 1),
(1117, '2023-04-21', 0),
(1118, '2023-04-22', 1),
(1119, '2023-04-23', 1),
(1120, '2023-04-24', 1),
(1121, '2023-04-25', 1),
(1122, '2023-04-26', 1),
(1123, '2023-04-27', 1),
(1124, '2023-04-28', 0),
(1125, '2023-04-29', 1),
(1126, '2023-04-30', 1),
(1127, '2023-05-01', 1),
(1128, '2023-05-02', 1),
(1129, '2023-05-03', 1),
(1130, '2023-05-04', 1),
(1131, '2023-05-05', 0),
(1132, '2023-05-06', 1),
(1133, '2023-05-07', 1),
(1134, '2023-05-08', 1),
(1135, '2023-05-09', 1),
(1136, '2023-05-10', 1),
(1137, '2023-05-11', 1),
(1138, '2023-05-12', 0),
(1139, '2023-05-13', 1),
(1140, '2023-05-14', 1),
(1141, '2023-05-15', 1),
(1142, '2023-05-16', 1),
(1143, '2023-05-17', 1),
(1144, '2023-05-18', 1),
(1145, '2023-05-19', 0),
(1146, '2023-05-20', 1),
(1147, '2023-05-21', 1),
(1148, '2023-05-22', 1),
(1149, '2023-05-23', 1),
(1150, '2023-05-24', 1),
(1151, '2023-05-25', 1),
(1152, '2023-05-26', 0),
(1153, '2023-05-27', 1),
(1154, '2023-05-28', 1),
(1155, '2023-05-29', 1),
(1156, '2023-05-30', 1),
(1157, '2023-05-31', 1),
(1158, '2023-06-01', 1),
(1159, '2023-06-02', 0),
(1160, '2023-06-03', 1),
(1161, '2023-06-04', 1),
(1162, '2023-06-05', 1),
(1163, '2023-06-06', 1),
(1164, '2023-06-07', 1),
(1165, '2023-06-08', 1),
(1166, '2023-06-09', 0),
(1167, '2023-06-10', 1),
(1168, '2023-06-11', 1),
(1169, '2023-06-12', 1),
(1170, '2023-06-13', 1),
(1171, '2023-06-14', 1),
(1172, '2023-06-15', 1),
(1173, '2023-06-16', 0),
(1174, '2023-06-17', 1),
(1175, '2023-06-18', 1),
(1176, '2023-06-19', 1),
(1177, '2023-06-20', 1),
(1178, '2023-06-21', 1),
(1179, '2023-06-22', 1),
(1180, '2023-06-23', 0),
(1181, '2023-06-24', 1),
(1182, '2023-06-25', 1),
(1183, '2023-06-26', 1),
(1184, '2023-06-27', 1),
(1185, '2023-06-28', 1),
(1186, '2023-06-29', 1),
(1187, '2023-06-30', 0),
(1188, '2023-07-01', 1),
(1189, '2023-07-02', 1),
(1190, '2023-07-03', 1),
(1191, '2023-07-04', 1),
(1192, '2023-07-05', 1),
(1193, '2023-07-06', 1),
(1194, '2023-07-07', 0),
(1195, '2023-07-08', 1),
(1196, '2023-07-09', 1),
(1197, '2023-07-10', 1),
(1198, '2023-07-11', 1),
(1199, '2023-07-12', 1),
(1200, '2023-07-13', 1),
(1201, '2023-07-14', 0),
(1202, '2023-07-15', 1),
(1203, '2023-07-16', 1),
(1204, '2023-07-17', 1),
(1205, '2023-07-18', 1),
(1206, '2023-07-19', 1),
(1207, '2023-07-20', 1),
(1208, '2023-07-21', 0),
(1209, '2023-07-22', 1),
(1210, '2023-07-23', 1),
(1211, '2023-07-24', 1),
(1212, '2023-07-25', 1),
(1213, '2023-07-26', 1),
(1214, '2023-07-27', 1),
(1215, '2023-07-28', 0),
(1216, '2023-07-29', 1),
(1217, '2023-07-30', 1),
(1218, '2023-07-31', 1),
(1219, '2023-08-01', 1),
(1220, '2023-08-02', 1),
(1221, '2023-08-03', 1),
(1222, '2023-08-04', 0),
(1223, '2023-08-05', 1),
(1224, '2023-08-06', 1),
(1225, '2023-08-07', 1),
(1226, '2023-08-08', 1),
(1227, '2023-08-09', 1),
(1228, '2023-08-10', 1),
(1229, '2023-08-11', 0),
(1230, '2023-08-12', 1),
(1231, '2023-08-13', 1),
(1232, '2023-08-14', 1),
(1233, '2023-08-15', 1),
(1234, '2023-08-16', 1),
(1235, '2023-08-17', 1),
(1236, '2023-08-18', 0),
(1237, '2023-08-19', 1),
(1238, '2023-08-20', 1),
(1239, '2023-08-21', 1),
(1240, '2023-08-22', 1),
(1241, '2023-08-23', 1),
(1242, '2023-08-24', 1),
(1243, '2023-08-25', 0),
(1244, '2023-08-26', 1),
(1245, '2023-08-27', 1),
(1246, '2023-08-28', 1),
(1247, '2023-08-29', 1),
(1248, '2023-08-30', 1),
(1249, '2023-08-31', 1),
(1250, '2023-09-01', 0),
(1251, '2023-09-02', 1),
(1252, '2023-09-03', 1),
(1253, '2023-09-04', 1),
(1254, '2023-09-05', 1),
(1255, '2023-09-06', 1),
(1256, '2023-09-07', 1),
(1257, '2023-09-08', 0),
(1258, '2023-09-09', 1),
(1259, '2023-09-10', 1),
(1260, '2023-09-11', 1),
(1261, '2023-09-12', 1),
(1262, '2023-09-13', 1),
(1263, '2023-09-14', 1),
(1264, '2023-09-15', 0),
(1265, '2023-09-16', 1),
(1266, '2023-09-17', 1),
(1267, '2023-09-18', 1),
(1268, '2023-09-19', 1),
(1269, '2023-09-20', 1),
(1270, '2023-09-21', 1),
(1271, '2023-09-22', 0),
(1272, '2023-09-23', 1),
(1273, '2023-09-24', 1),
(1274, '2023-09-25', 1),
(1275, '2023-09-26', 1),
(1276, '2023-09-27', 1),
(1277, '2023-09-28', 1),
(1278, '2023-09-29', 0),
(1279, '2023-09-30', 1),
(1280, '2023-10-01', 1),
(1281, '2023-10-02', 1),
(1282, '2023-10-03', 1),
(1283, '2023-10-04', 1),
(1284, '2023-10-05', 1),
(1285, '2023-10-06', 0),
(1286, '2023-10-07', 1),
(1287, '2023-10-08', 1),
(1288, '2023-10-09', 1),
(1289, '2023-10-10', 1),
(1290, '2023-10-11', 1),
(1291, '2023-10-12', 1),
(1292, '2023-10-13', 0),
(1293, '2023-10-14', 1),
(1294, '2023-10-15', 1),
(1295, '2023-10-16', 1),
(1296, '2023-10-17', 1),
(1297, '2023-10-18', 1),
(1298, '2023-10-19', 1),
(1299, '2023-10-20', 0),
(1300, '2023-10-21', 1),
(1301, '2023-10-22', 1),
(1302, '2023-10-23', 1),
(1303, '2023-10-24', 1),
(1304, '2023-10-25', 1),
(1305, '2023-10-26', 1),
(1306, '2023-10-27', 0),
(1307, '2023-10-28', 1),
(1308, '2023-10-29', 1),
(1309, '2023-10-30', 1),
(1310, '2023-10-31', 1),
(1311, '2023-11-01', 1),
(1312, '2023-11-02', 1),
(1313, '2023-11-03', 0),
(1314, '2023-11-04', 1),
(1315, '2023-11-05', 1),
(1316, '2023-11-06', 1),
(1317, '2023-11-07', 1),
(1318, '2023-11-08', 1),
(1319, '2023-11-09', 1),
(1320, '2023-11-10', 0),
(1321, '2023-11-11', 1),
(1322, '2023-11-12', 1),
(1323, '2023-11-13', 1),
(1324, '2023-11-14', 1),
(1325, '2023-11-15', 1),
(1326, '2023-11-16', 1),
(1327, '2023-11-17', 0),
(1328, '2023-11-18', 1),
(1329, '2023-11-19', 1),
(1330, '2023-11-20', 1),
(1331, '2023-11-21', 1),
(1332, '2023-11-22', 1),
(1333, '2023-11-23', 1),
(1334, '2023-11-24', 0),
(1335, '2023-11-25', 1),
(1336, '2023-11-26', 1),
(1337, '2023-11-27', 1),
(1338, '2023-11-28', 1),
(1339, '2023-11-29', 1),
(1340, '2023-11-30', 1),
(1341, '2023-12-01', 0),
(1342, '2023-12-02', 1),
(1343, '2023-12-03', 1),
(1344, '2023-12-04', 1),
(1345, '2023-12-05', 1),
(1346, '2023-12-06', 1),
(1347, '2023-12-07', 1),
(1348, '2023-12-08', 0),
(1349, '2023-12-09', 1),
(1350, '2023-12-10', 1),
(1351, '2023-12-11', 1),
(1352, '2023-12-12', 1),
(1353, '2023-12-13', 1),
(1354, '2023-12-14', 1),
(1355, '2023-12-15', 0),
(1356, '2023-12-16', 1),
(1357, '2023-12-17', 1),
(1358, '2023-12-18', 1),
(1359, '2023-12-19', 1),
(1360, '2023-12-20', 1),
(1361, '2023-12-21', 1),
(1362, '2023-12-22', 0),
(1363, '2023-12-23', 1),
(1364, '2023-12-24', 1),
(1365, '2023-12-25', 1),
(1366, '2023-12-26', 1),
(1367, '2023-12-27', 1),
(1368, '2023-12-28', 1),
(1369, '2023-12-29', 0),
(1370, '2023-12-30', 1),
(1371, '2023-12-31', 1),
(1372, '2024-01-01', 1),
(1373, '2024-01-02', 1),
(1374, '2024-01-03', 1),
(1375, '2024-01-04', 1),
(1376, '2024-01-05', 0),
(1377, '2024-01-06', 1),
(1378, '2024-01-07', 1),
(1379, '2024-01-08', 1),
(1380, '2024-01-09', 1),
(1381, '2024-01-10', 1),
(1382, '2024-01-11', 1),
(1383, '2024-01-12', 0),
(1384, '2024-01-13', 1),
(1385, '2024-01-14', 1),
(1386, '2024-01-15', 1),
(1387, '2024-01-16', 1),
(1388, '2024-01-17', 1),
(1389, '2024-01-18', 1),
(1390, '2024-01-19', 0),
(1391, '2024-01-20', 1),
(1392, '2024-01-21', 1),
(1393, '2024-01-22', 1),
(1394, '2024-01-23', 1),
(1395, '2024-01-24', 1),
(1396, '2024-01-25', 1),
(1397, '2024-01-26', 0),
(1398, '2024-01-27', 1),
(1399, '2024-01-28', 1),
(1400, '2024-01-29', 1),
(1401, '2024-01-30', 1),
(1402, '2024-01-31', 1),
(1403, '2024-02-01', 1),
(1404, '2024-02-02', 0),
(1405, '2024-02-03', 1),
(1406, '2024-02-04', 1),
(1407, '2024-02-05', 1),
(1408, '2024-02-06', 1),
(1409, '2024-02-07', 1),
(1410, '2024-02-08', 1),
(1411, '2024-02-09', 0),
(1412, '2024-02-10', 1),
(1413, '2024-02-11', 1),
(1414, '2024-02-12', 1),
(1415, '2024-02-13', 1),
(1416, '2024-02-14', 1),
(1417, '2024-02-15', 1),
(1418, '2024-02-16', 0),
(1419, '2024-02-17', 1),
(1420, '2024-02-18', 1),
(1421, '2024-02-19', 1),
(1422, '2024-02-20', 1),
(1423, '2024-02-21', 1),
(1424, '2024-02-22', 1),
(1425, '2024-02-23', 0),
(1426, '2024-02-24', 1),
(1427, '2024-02-25', 1),
(1428, '2024-02-26', 1),
(1429, '2024-02-27', 1),
(1430, '2024-02-28', 1),
(1431, '2024-02-29', 1),
(1432, '2024-03-01', 0),
(1433, '2024-03-02', 1),
(1434, '2024-03-03', 1),
(1435, '2024-03-04', 1),
(1436, '2024-03-05', 1),
(1437, '2024-03-06', 1),
(1438, '2024-03-07', 1),
(1439, '2024-03-08', 0),
(1440, '2024-03-09', 1),
(1441, '2024-03-10', 1),
(1442, '2024-03-11', 1),
(1443, '2024-03-12', 1),
(1444, '2024-03-13', 1),
(1445, '2024-03-14', 1),
(1446, '2024-03-15', 0),
(1447, '2024-03-16', 1),
(1448, '2024-03-17', 1),
(1449, '2024-03-18', 1),
(1450, '2024-03-19', 1),
(1451, '2024-03-20', 1),
(1452, '2024-03-21', 1),
(1453, '2024-03-22', 0),
(1454, '2024-03-23', 1),
(1455, '2024-03-24', 1),
(1456, '2024-03-25', 1),
(1457, '2024-03-26', 1),
(1458, '2024-03-27', 1),
(1459, '2024-03-28', 1),
(1460, '2024-03-29', 0),
(1461, '2024-03-30', 1),
(1462, '2024-03-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_photos`
--

CREATE TABLE `project_photos` (
  `phid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `al_file` varchar(255) DEFAULT NULL,
  `ph_cap` int(11) DEFAULT NULL,
  `date_p` date DEFAULT NULL,
  `lcid` int(11) NOT NULL,
  `giscode` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_weekdays`
--

CREATE TABLE `project_weekdays` (
  `pwd_id` int(11) NOT NULL,
  `wd_id` int(11) NOT NULL,
  `wd_day` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `results`
-- (See below for the actual view)
--
CREATE TABLE `results` (
`rid` int(11)
,`rcomponent` int(11)
,`rmonth` date
,`cv` double
,`sv` double
,`cpi` double
,`spi` double
,`bac` double
,`eac1` double
,`eac2` double
,`eac3` double
,`etc1` double
,`etc2` double
,`etc3` double
,`tcpi1` double
,`tcpi2_1` double
,`tcpi2_2` double
,`tcpi2_3` double
,`pv` double
,`ev` double
,`ac` double
);

-- --------------------------------------------------------

--
-- Table structure for table `rs_tbl_countries`
--

CREATE TABLE `rs_tbl_countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(64) NOT NULL DEFAULT '',
  `iso_code_2` char(2) NOT NULL,
  `iso_code_3` char(3) NOT NULL,
  `format_id` int(11) NOT NULL DEFAULT '0',
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rs_tbl_countries`
--

INSERT INTO `rs_tbl_countries` (`country_id`, `country_name`, `iso_code_2`, `iso_code_3`, `format_id`, `region_id`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 1, 3),
(13, 'Australia', 'AU', 'AUS', 1, 4),
(15, 'Azerbaijan', 'A', 'AZE', 1, 3),
(18, 'Bangladesh', 'BD', 'B', 1, 3),
(25, 'Bhutan', 'BT', 'BTN', 1, 3),
(37, 'Cameroon', 'CM', 'CMR', 1, 5),
(44, 'China', 'CN', 'CHN', 1, 5),
(61, 'East Timor', 'TP', 'TMP', 1, 5),
(68, 'Ethiopia', 'ET', 'ETH', 1, 6),
(71, 'Fiji', 'FJ', 'FJI', 1, 5),
(82, 'Ghana', 'GH', 'GHA', 1, 6),
(96, 'Hong Kong', 'HK', 'HKG', 1, 5),
(99, 'India', 'IN', 'IND', 1, 3),
(100, 'Indonesia', 'ID', 'IDN', 1, 5),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1, 3),
(110, 'Kenya', 'KE', 'KEN', 1, 6),
(111, 'Kiribati', 'KI', 'KIR', 1, 5),
(112, 'Korea, Democratic Republic', 'KP', 'PRK', 1, 5),
(113, 'Korea, Republic', 'KR', 'KOR', 1, 5),
(114, 'Kuwait', 'KW', 'KWT', 1, 3),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1, 3),
(116, 'Lao Peoples Democratic Republic', 'LA', 'LAO', 1, 5),
(119, 'Lesotho', 'LS', 'LSO', 1, 6),
(125, 'Macau', 'MO', 'MAC', 1, 5),
(128, 'Malawi', 'MW', 'MWI', 1, 6),
(129, 'Malaysia', 'MY', 'MYS', 1, 5),
(142, 'Mongolia', 'MN', 'MNG', 1, 5),
(145, 'Mozambique', 'MZ', 'MOZ', 1, 5),
(146, 'Myanmar', 'MM', 'MMR', 1, 6),
(147, 'Namibia', 'NA', 'NAM', 1, 6),
(149, 'Nepal', 'NP', 'NPL', 1, 3),
(162, 'Pakistan', 'PK', 'PAK', 1, 3),
(165, 'Papua New Guinea', 'PG', 'PNG', 1, 5),
(168, 'Philippines', 'PH', 'PHL', 1, 5),
(174, 'Reunion', 'RE', 'REU', 1, 3),
(177, 'Rwanda', 'RW', 'RWA', 1, 6),
(181, 'Samoa', 'WS', 'WSM', 1, 5),
(187, 'Sierra Leone', 'SL', 'SLE', 1, 6),
(188, 'Singapore', 'SG', 'SGP', 4, 5),
(191, 'Solomon Islands', 'SB', 'SLB', 1, 5),
(196, 'Sri Lanka', 'LK', 'LKA', 1, 3),
(200, 'Suriname', 'SR', 'SUR', 1, 6),
(202, 'Swaziland', 'SZ', 'SWZ', 1, 6),
(206, 'Taiwan', 'TW', 'TWN', 1, 5),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1, 6),
(212, 'Tonga', 'TO', 'TON', 1, 5),
(219, 'Uganda', 'UG', 'UGA', 1, 6),
(221, 'United Arab Emirates', 'AE', 'ARE', 1, 3),
(226, 'Uzbekistan', 'UZ', 'UZB', 1, 3),
(227, 'Vanuatu', 'VU', 'VUT', 1, 5),
(238, 'Zambia', 'ZM', 'ZMB', 1, 6),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1, 6),
(240, 'Pool', '', '', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `rs_tbl_news`
--

CREATE TABLE `rs_tbl_news` (
  `news_cd` int(10) NOT NULL,
  `title` text NOT NULL,
  `details` text NOT NULL,
  `newsdate` date DEFAULT NULL,
  `ordering` int(10) NOT NULL DEFAULT '1',
  `newsfile` varchar(255) NOT NULL,
  `newsfile1` varchar(255) NOT NULL,
  `newsfile2` varchar(255) NOT NULL,
  `newsfile3` varchar(255) NOT NULL,
  `newsfile4` varchar(255) NOT NULL,
  `status` char(1) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rs_tbl_sectors`
--

CREATE TABLE `rs_tbl_sectors` (
  `sector_id` int(11) NOT NULL,
  `sector_name` varchar(100) DEFAULT NULL,
  `parent_cd` int(11) NOT NULL,
  `sector_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rs_tbl_sectors`
--

INSERT INTO `rs_tbl_sectors` (`sector_id`, `sector_name`, `parent_cd`, `sector_status`) VALUES
(1, 'Highways and Bridges', 0, 1),
(2, 'Water, Environment and Social ', 0, 1),
(3, 'Geotechnics and Tunnels', 0, 1),
(5, 'Urban Development', 0, 1),
(6, 'Hydropower and Dams', 0, 1),
(7, 'Power and Energy', 0, 1),
(8, 'Government and Advisory Services', 0, 1),
(9, 'Mining, Oil and Gas', 0, 1),
(10, 'Rail and Metro\r\n', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `s006-eva-budget`
--

CREATE TABLE `s006-eva-budget` (
  `bid` int(11) NOT NULL,
  `bcomponent` int(11) NOT NULL,
  `bmonth` date NOT NULL,
  `bmonthlycost` double NOT NULL,
  `bcommulativecost` double NOT NULL,
  `bmonthlypercent` float NOT NULL,
  `bcommulativepercent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `s007-eva-earned`
--

CREATE TABLE `s007-eva-earned` (
  `eid` int(11) NOT NULL,
  `ecomponent` int(11) NOT NULL,
  `emonth` date NOT NULL,
  `emonthlycost` double NOT NULL,
  `ecommulativecost` double NOT NULL,
  `emonthlypercent` float NOT NULL,
  `ecommulativepercent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `s008-eva-actual`
--

CREATE TABLE `s008-eva-actual` (
  `aid` int(11) NOT NULL,
  `acomponent` int(11) NOT NULL,
  `amonth` date NOT NULL,
  `amonthlycost` double NOT NULL,
  `acommulativecost` double NOT NULL,
  `amonthlypercent` float NOT NULL,
  `acommulativepercent` float NOT NULL,
  `aipcnumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `s009-eva-results`
--

CREATE TABLE `s009-eva-results` (
  `rid` int(11) NOT NULL,
  `rcomponent` int(11) NOT NULL,
  `rmonth` date NOT NULL,
  `cv` double NOT NULL,
  `sv` double NOT NULL,
  `cpi` double NOT NULL,
  `spi` double NOT NULL,
  `bac` double NOT NULL,
  `eac1` double NOT NULL,
  `eac2` double NOT NULL,
  `eac3` double NOT NULL,
  `etc1` double NOT NULL,
  `etc2` double NOT NULL,
  `etc3` double NOT NULL,
  `tcpi1` double NOT NULL,
  `tcpi2_1` double NOT NULL,
  `tcpi2_2` double NOT NULL,
  `tcpi2_3` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `lid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `pictorial_user_ids` text,
  `pictorial_user_right` text,
  `album_user_ids` text,
  `album_user_right` text,
  `issue_user_ids` text,
  `issue_user_right` text,
  `ncn_user_ids` text,
  `ncn_user_right` text,
  `map_user_ids` text,
  `map_user_right` text,
  `design_user_ids` text,
  `design_user_right` text,
  `boq_user_ids` text,
  `boq_user_right` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `structures`
--

INSERT INTO `structures` (`lid`, `pid`, `code`, `title`, `pictorial_user_ids`, `pictorial_user_right`, `album_user_ids`, `album_user_right`, `issue_user_ids`, `issue_user_right`, `ncn_user_ids`, `ncn_user_right`, `map_user_ids`, `map_user_right`, `design_user_ids`, `design_user_right`, `boq_user_ids`, `boq_user_right`) VALUES
(1, 1, '1', 'civil Work', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '2', 'Electrical and Mechanical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t0101designprogress`
--

CREATE TABLE `t0101designprogress` (
  `dgid` int(11) NOT NULL,
  `pgid` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `total` double NOT NULL,
  `submitted` double NOT NULL,
  `revision` double NOT NULL,
  `approved` double NOT NULL,
  `approvedpct` float NOT NULL,
  `item_id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `remarks` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t012issues`
--

CREATE TABLE `t012issues` (
  `nos_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `iss_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `iss_title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `iss_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `iss_status` int(11) NOT NULL DEFAULT '1',
  `iss_action` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `iss_remarks` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `iss_date` date DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `action_status` int(11) DEFAULT NULL,
  `image1` varchar(200) NOT NULL,
  `image2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t013nonconformitynotice`
--

CREATE TABLE `t013nonconformitynotice` (
  `nos_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `iss_no` varchar(10) NOT NULL,
  `iss_title` text,
  `iss_detail` text,
  `iss_status` int(11) DEFAULT NULL,
  `iss_action` varchar(200) DEFAULT NULL,
  `iss_remarks` varchar(240) DEFAULT NULL,
  `attachment` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t014majoritems`
--

CREATE TABLE `t014majoritems` (
  `item_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t023project_progress_graph`
--

CREATE TABLE `t023project_progress_graph` (
  `ppg_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `planned` double NOT NULL,
  `actual` double NOT NULL,
  `ppg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t027project_drawings`
--

CREATE TABLE `t027project_drawings` (
  `dwgid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `album_id` int(11) NOT NULL,
  `dwg_type` varchar(50) NOT NULL,
  `dwg_no` varchar(200) DEFAULT NULL,
  `dwg_title` varchar(255) DEFAULT NULL,
  `dwg_date` date DEFAULT NULL,
  `revision_no` varchar(200) DEFAULT NULL,
  `dwg_status` varchar(200) DEFAULT NULL,
  `al_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t027project_photos`
--

CREATE TABLE `t027project_photos` (
  `phid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `album_id` int(11) NOT NULL,
  `al_file` varchar(255) NOT NULL,
  `al_file_old` varchar(255) DEFAULT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `ph_cap` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t031project_albums`
--

CREATE TABLE `t031project_albums` (
  `albumid` int(11) NOT NULL,
  `parent_album` int(11) DEFAULT '0',
  `parent_group` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `pid` int(11) NOT NULL,
  `album_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_right` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `creater_id` int(11) DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t031project_albums`
--

INSERT INTO `t031project_albums` (`albumid`, `parent_album`, `parent_group`, `pid`, `album_name`, `status`, `user_ids`, `user_right`, `creater`, `creater_id`, `last_modified_by`, `lid`) VALUES
(1, 0, '001', 1, 'civil Work', 1, NULL, NULL, 'Super Administrator . 2022-03-28 10:00:29', 1, NULL, 1),
(2, 0, '002', 1, 'Electrical and Mechanical', 1, NULL, NULL, 'Super Administrator . 2022-03-28 10:01:49', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t031project_drawingalbums`
--

CREATE TABLE `t031project_drawingalbums` (
  `albumid` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `parent_group` varchar(250) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `album_name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `user_ids` text,
  `user_right` text,
  `creater` varchar(255) DEFAULT NULL,
  `creater_id` int(11) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t031project_drawingalbums`
--

INSERT INTO `t031project_drawingalbums` (`albumid`, `parent_id`, `parent_group`, `pid`, `album_name`, `status`, `user_ids`, `user_right`, `creater`, `creater_id`, `last_modified_by`, `lid`) VALUES
(1, 0, '001', 1, 'civil Work', 1, NULL, NULL, 'Super Administrator . 2022-03-28 10:00:29', 1, NULL, 1),
(2, 0, '002', 1, 'Electrical and Mechanical', 1, NULL, NULL, 'Super Administrator . 2022-03-28 10:01:49', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t32project_videos`
--

CREATE TABLE `t32project_videos` (
  `vid` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `album_id` int(11) NOT NULL,
  `v_cap` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `v_al_file` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_daily_site_entry`
--

CREATE TABLE `tbl_daily_site_entry` (
  `dsid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `wsid` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_desc` varchar(500) NOT NULL,
  `pdate` date NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rfi_lab`
--

CREATE TABLE `tbl_rfi_lab` (
  `rfi_id` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `contractor_no` varchar(200) DEFAULT NULL,
  `section` varchar(200) DEFAULT NULL,
  `site` varchar(200) DEFAULT NULL,
  `rfi_number` varchar(200) DEFAULT NULL,
  `rfi_prev_ref` varchar(200) DEFAULT NULL,
  `rfi_Date` date DEFAULT NULL,
  `rfi_sub_date_time` date NOT NULL,
  `rfi_activity_detail` text,
  `rfi_activity_location` varchar(500) DEFAULT NULL,
  `rfi_activity_location_from` varchar(200) DEFAULT NULL,
  `rfi_activity_location_to` varchar(200) DEFAULT NULL,
  `rfi_contractor_rep_name` varchar(200) DEFAULT NULL,
  `RFI_Received_by` varchar(200) DEFAULT NULL,
  `RFI_Received_date_time` date NOT NULL,
  `rfi_time` time DEFAULT NULL,
  `RFI_Scanned_document` varchar(200) DEFAULT NULL,
  `Survey_Surveyor_name` varchar(200) DEFAULT NULL,
  `Survey_Date_time` date DEFAULT NULL,
  `survey_time` time DEFAULT NULL,
  `Survey_report` text,
  `Survey_comments` text,
  `Survey_document` varchar(200) DEFAULT NULL,
  `Inspection_inspector_name` varchar(200) DEFAULT NULL,
  `Inspection_Date_time` date DEFAULT NULL,
  `Inspect_time` time DEFAULT NULL,
  `Inspection_report` text,
  `Inspection_comments` text,
  `Inspection_document` text,
  `Quality_MT_Engineer_name` varchar(200) DEFAULT NULL,
  `Quality_testing_Date_time` date DEFAULT NULL,
  `Quality_time` time DEFAULT NULL,
  `Quality_test_perfomed` text,
  `Quality_test_sample_numbers` int(11) DEFAULT NULL,
  `Quality_test_report` text,
  `Quality_test_result` text,
  `Quality_test_comments` text,
  `Quality_test_report_document` varchar(200) DEFAULT NULL,
  `Approval_authority` text,
  `Approval_authority_name` text,
  `Approval_status` int(11) DEFAULT NULL,
  `Approval_comments` text,
  `Approval_documents` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_risk_impact_rating`
--

CREATE TABLE `tbl_risk_impact_rating` (
  `risk_impact_id` int(11) NOT NULL,
  `impact_score` int(11) NOT NULL,
  `impact_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_risk_likelihood_rating`
--

CREATE TABLE `tbl_risk_likelihood_rating` (
  `risk_like_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `like_per` varchar(50) NOT NULL,
  `like_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_risk_register`
--

CREATE TABLE `tbl_risk_register` (
  `risk_id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `risk_con_id` int(11) NOT NULL,
  `risk_no` varchar(10) NOT NULL,
  `risk_entry_date` date NOT NULL,
  `risk_status` varchar(50) NOT NULL,
  `risk_cons_hazard` text,
  `risk_cause` text,
  `risk_like_score` int(11) DEFAULT NULL,
  `risk_impact_score` int(11) NOT NULL,
  `risk_control_measure` text NOT NULL,
  `risk_owner` varchar(400) NOT NULL,
  `risk_lastdate` date NOT NULL,
  `risk_update_date` date NOT NULL,
  `risk_rrls` int(200) NOT NULL,
  `risk_rris` int(240) NOT NULL,
  `risk_comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_risk_register_context`
--

CREATE TABLE `tbl_risk_register_context` (
  `risk_con_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `risk_con_code` varchar(50) NOT NULL,
  `ris_con_desc` varchar(400) NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_risk_score_rating_color`
--

CREATE TABLE `tbl_risk_score_rating_color` (
  `risk_score_rate_id` int(11) NOT NULL,
  `risk_score_low_val` int(11) NOT NULL,
  `risk_score_high_val` int(11) NOT NULL,
  `risk_color` varchar(50) NOT NULL,
  `risk_color_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `template_progress`
--

CREATE TABLE `template_progress` (
  `temp_pid` int(11) NOT NULL,
  `temp_id` int(11) NOT NULL,
  `progress_type` int(11) NOT NULL,
  `update_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_log`
--

CREATE TABLE `users_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_name` varchar(240) NOT NULL,
  `password` varchar(200) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `req_url` varchar(230) NOT NULL,
  `browser` varchar(240) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `weekdays`
--

CREATE TABLE `weekdays` (
  `wd_id` int(11) NOT NULL,
  `wd_day` varchar(50) DEFAULT NULL,
  `wd_detail` varchar(10) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weekdays`
--

INSERT INTO `weekdays` (`wd_id`, `wd_day`, `wd_detail`, `status`) VALUES
(1, '0', 'Monday', 1),
(2, '1', 'Tuesday', 1),
(3, '2', 'Wednesday', 1),
(4, '3', 'Thursday', 1),
(5, '4', 'Friday', 0),
(6, '5', 'Saturday', 1),
(7, '6', 'Sunday', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yearly_holidays`
--

CREATE TABLE `yearly_holidays` (
  `yh_id` int(11) NOT NULL,
  `yh_title` varchar(255) NOT NULL,
  `yh_date` date NOT NULL,
  `yh_status` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yearly_holidays`
--

INSERT INTO `yearly_holidays` (`yh_id`, `yh_title`, `yh_date`, `yh_status`, `pid`) VALUES
(1, 'Eid ul adha', '2022-07-07', 1, 1);

-- --------------------------------------------------------

--
-- Structure for view `results`
--
DROP TABLE IF EXISTS `results`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `results`  AS  select `pmst16_pmis`.`s009-eva-results`.`rid` AS `rid`,`pmst16_pmis`.`s009-eva-results`.`rcomponent` AS `rcomponent`,`pmst16_pmis`.`s009-eva-results`.`rmonth` AS `rmonth`,`pmst16_pmis`.`s009-eva-results`.`cv` AS `cv`,`pmst16_pmis`.`s009-eva-results`.`sv` AS `sv`,`pmst16_pmis`.`s009-eva-results`.`cpi` AS `cpi`,`pmst16_pmis`.`s009-eva-results`.`spi` AS `spi`,`pmst16_pmis`.`s009-eva-results`.`bac` AS `bac`,`pmst16_pmis`.`s009-eva-results`.`eac1` AS `eac1`,`pmst16_pmis`.`s009-eva-results`.`eac2` AS `eac2`,`pmst16_pmis`.`s009-eva-results`.`eac3` AS `eac3`,`pmst16_pmis`.`s009-eva-results`.`etc1` AS `etc1`,`pmst16_pmis`.`s009-eva-results`.`etc2` AS `etc2`,`pmst16_pmis`.`s009-eva-results`.`etc3` AS `etc3`,`pmst16_pmis`.`s009-eva-results`.`tcpi1` AS `tcpi1`,`pmst16_pmis`.`s009-eva-results`.`tcpi2_1` AS `tcpi2_1`,`pmst16_pmis`.`s009-eva-results`.`tcpi2_2` AS `tcpi2_2`,`pmst16_pmis`.`s009-eva-results`.`tcpi2_3` AS `tcpi2_3`,`pmst16_pmis`.`s006-eva-budget`.`bcommulativecost` AS `pv`,`pmst16_pmis`.`s007-eva-earned`.`ecommulativecost` AS `ev`,`pmst16_pmis`.`s008-eva-actual`.`acommulativecost` AS `ac` from (((`pmst16_pmis`.`s009-eva-results` join `pmst16_pmis`.`s006-eva-budget` on((`pmst16_pmis`.`s009-eva-results`.`rmonth` = `pmst16_pmis`.`s006-eva-budget`.`bmonth`))) join `pmst16_pmis`.`s007-eva-earned` on((`pmst16_pmis`.`s009-eva-results`.`rmonth` = `pmst16_pmis`.`s007-eva-earned`.`emonth`))) join `pmst16_pmis`.`s008-eva-actual` on((`pmst16_pmis`.`s009-eva-results`.`rmonth` = `pmst16_pmis`.`s008-eva-actual`.`amonth`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_cd`),
  ADD KEY `itemid` (`itemid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `baseline`
--
ALTER TABLE `baseline`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `temp_id` (`temp_id`),
  ADD KEY `unit_type` (`unit_type`);

--
-- Indexes for table `baseline_mapping_boqs`
--
ALTER TABLE `baseline_mapping_boqs`
  ADD PRIMARY KEY (`bitem_id`),
  ADD KEY `rid` (`rid`),
  ADD KEY `boqid` (`boqid`);

--
-- Indexes for table `baseline_template`
--
ALTER TABLE `baseline_template`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `base_data_cube`
--
ALTER TABLE `base_data_cube`
  ADD PRIMARY KEY (`parentcd`);

--
-- Indexes for table `boq`
--
ALTER TABLE `boq`
  ADD PRIMARY KEY (`boqid`),
  ADD KEY `itemid` (`itemid`),
  ADD KEY `boqcode` (`boqcode`);

--
-- Indexes for table `boqdata`
--
ALTER TABLE `boqdata`
  ADD PRIMARY KEY (`itemid`),
  ADD KEY `parentcd` (`parentcd`),
  ADD KEY `activitylevel` (`activitylevel`);

--
-- Indexes for table `ipc`
--
ALTER TABLE `ipc`
  ADD PRIMARY KEY (`ipcid`),
  ADD KEY `ipcno` (`ipcno`);

--
-- Indexes for table `ipcv`
--
ALTER TABLE `ipcv`
  ADD PRIMARY KEY (`ipcvid`),
  ADD KEY `ipcid` (`ipcid`),
  ADD KEY `boqid` (`boqid`);

--
-- Indexes for table `ipc_log`
--
ALTER TABLE `ipc_log`
  ADD PRIMARY KEY (`log_cd`);

--
-- Indexes for table `kpidata`
--
ALTER TABLE `kpidata`
  ADD PRIMARY KEY (`kpiid`);

--
-- Indexes for table `kpidata_etl`
--
ALTER TABLE `kpidata_etl`
  ADD PRIMARY KEY (`keid`);

--
-- Indexes for table `kpidata_result`
--
ALTER TABLE `kpidata_result`
  ADD PRIMARY KEY (`keid`);

--
-- Indexes for table `kpiscale`
--
ALTER TABLE `kpiscale`
  ADD PRIMARY KEY (`scid`);

--
-- Indexes for table `kpi_activity`
--
ALTER TABLE `kpi_activity`
  ADD PRIMARY KEY (`kaid`);

--
-- Indexes for table `kpi_base_level_report`
--
ALTER TABLE `kpi_base_level_report`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `kpi_monthly_progress_report`
--
ALTER TABLE `kpi_monthly_progress_report`
  ADD PRIMARY KEY (`kpi_id`);

--
-- Indexes for table `kpi_templates`
--
ALTER TABLE `kpi_templates`
  ADD PRIMARY KEY (`kpi_temp_id`);

--
-- Indexes for table `kpi_top_level_report`
--
ALTER TABLE `kpi_top_level_report`
  ADD PRIMARY KEY (`kpi_tlid`);

--
-- Indexes for table `kpi_total_baseline`
--
ALTER TABLE `kpi_total_baseline`
  ADD PRIMARY KEY (`kpi_tid`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `locations_component`
--
ALTER TABLE `locations_component`
  ADD PRIMARY KEY (`lcid`);

--
-- Indexes for table `maindata`
--
ALTER TABLE `maindata`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `maindata_log`
--
ALTER TABLE `maindata_log`
  ADD PRIMARY KEY (`log_cd`);

--
-- Indexes for table `main_data_cube`
--
ALTER TABLE `main_data_cube`
  ADD PRIMARY KEY (`mdcid`);

--
-- Indexes for table `mis_tbl_log`
--
ALTER TABLE `mis_tbl_log`
  ADD PRIMARY KEY (`log_cd`);

--
-- Indexes for table `mis_tbl_users`
--
ALTER TABLE `mis_tbl_users`
  ADD PRIMARY KEY (`user_cd`);

--
-- Indexes for table `pages_visit_log`
--
ALTER TABLE `pages_visit_log`
  ADD PRIMARY KEY (`p_visit_log`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `planned`
--
ALTER TABLE `planned`
  ADD PRIMARY KEY (`plid`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`pgid`);

--
-- Indexes for table `progressmonth`
--
ALTER TABLE `progressmonth`
  ADD PRIMARY KEY (`pmid`);

--
-- Indexes for table `progressmonth_log`
--
ALTER TABLE `progressmonth_log`
  ADD PRIMARY KEY (`log_cd`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `project_days`
--
ALTER TABLE `project_days`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indexes for table `project_photos`
--
ALTER TABLE `project_photos`
  ADD PRIMARY KEY (`phid`);

--
-- Indexes for table `rs_tbl_news`
--
ALTER TABLE `rs_tbl_news`
  ADD PRIMARY KEY (`news_cd`);

--
-- Indexes for table `s009-eva-results`
--
ALTER TABLE `s009-eva-results`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `t0101designprogress`
--
ALTER TABLE `t0101designprogress`
  ADD PRIMARY KEY (`dgid`);

--
-- Indexes for table `t012issues`
--
ALTER TABLE `t012issues`
  ADD PRIMARY KEY (`nos_id`);

--
-- Indexes for table `t013nonconformitynotice`
--
ALTER TABLE `t013nonconformitynotice`
  ADD PRIMARY KEY (`nos_id`);

--
-- Indexes for table `t014majoritems`
--
ALTER TABLE `t014majoritems`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `t023project_progress_graph`
--
ALTER TABLE `t023project_progress_graph`
  ADD PRIMARY KEY (`ppg_id`);

--
-- Indexes for table `t027project_drawings`
--
ALTER TABLE `t027project_drawings`
  ADD PRIMARY KEY (`dwgid`);

--
-- Indexes for table `t027project_photos`
--
ALTER TABLE `t027project_photos`
  ADD PRIMARY KEY (`phid`);

--
-- Indexes for table `t031project_albums`
--
ALTER TABLE `t031project_albums`
  ADD PRIMARY KEY (`albumid`);

--
-- Indexes for table `t031project_drawingalbums`
--
ALTER TABLE `t031project_drawingalbums`
  ADD PRIMARY KEY (`albumid`);

--
-- Indexes for table `t32project_videos`
--
ALTER TABLE `t32project_videos`
  ADD PRIMARY KEY (`vid`);

--
-- Indexes for table `tbl_daily_site_entry`
--
ALTER TABLE `tbl_daily_site_entry`
  ADD PRIMARY KEY (`dsid`);

--
-- Indexes for table `tbl_rfi_lab`
--
ALTER TABLE `tbl_rfi_lab`
  ADD PRIMARY KEY (`rfi_id`);

--
-- Indexes for table `tbl_risk_impact_rating`
--
ALTER TABLE `tbl_risk_impact_rating`
  ADD PRIMARY KEY (`risk_impact_id`);

--
-- Indexes for table `tbl_risk_likelihood_rating`
--
ALTER TABLE `tbl_risk_likelihood_rating`
  ADD PRIMARY KEY (`risk_like_id`);

--
-- Indexes for table `tbl_risk_register`
--
ALTER TABLE `tbl_risk_register`
  ADD PRIMARY KEY (`risk_id`);

--
-- Indexes for table `tbl_risk_register_context`
--
ALTER TABLE `tbl_risk_register_context`
  ADD PRIMARY KEY (`risk_con_id`);

--
-- Indexes for table `tbl_risk_score_rating_color`
--
ALTER TABLE `tbl_risk_score_rating_color`
  ADD PRIMARY KEY (`risk_score_rate_id`);

--
-- Indexes for table `template_progress`
--
ALTER TABLE `template_progress`
  ADD PRIMARY KEY (`temp_pid`);

--
-- Indexes for table `users_log`
--
ALTER TABLE `users_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `yearly_holidays`
--
ALTER TABLE `yearly_holidays`
  ADD PRIMARY KEY (`yh_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_cd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseline`
--
ALTER TABLE `baseline`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baseline_template`
--
ALTER TABLE `baseline_template`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_data_cube`
--
ALTER TABLE `base_data_cube`
  MODIFY `parentcd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boq`
--
ALTER TABLE `boq`
  MODIFY `boqid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boqdata`
--
ALTER TABLE `boqdata`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ipc`
--
ALTER TABLE `ipc`
  MODIFY `ipcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ipcv`
--
ALTER TABLE `ipcv`
  MODIFY `ipcvid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ipc_log`
--
ALTER TABLE `ipc_log`
  MODIFY `log_cd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kpidata`
--
ALTER TABLE `kpidata`
  MODIFY `kpiid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpidata_etl`
--
ALTER TABLE `kpidata_etl`
  MODIFY `keid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpidata_result`
--
ALTER TABLE `kpidata_result`
  MODIFY `keid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpiscale`
--
ALTER TABLE `kpiscale`
  MODIFY `scid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_activity`
--
ALTER TABLE `kpi_activity`
  MODIFY `kaid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_base_level_report`
--
ALTER TABLE `kpi_base_level_report`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_monthly_progress_report`
--
ALTER TABLE `kpi_monthly_progress_report`
  MODIFY `kpi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_templates`
--
ALTER TABLE `kpi_templates`
  MODIFY `kpi_temp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_top_level_report`
--
ALTER TABLE `kpi_top_level_report`
  MODIFY `kpi_tlid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_total_baseline`
--
ALTER TABLE `kpi_total_baseline`
  MODIFY `kpi_tid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations_component`
--
ALTER TABLE `locations_component`
  MODIFY `lcid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maindata`
--
ALTER TABLE `maindata`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maindata_log`
--
ALTER TABLE `maindata_log`
  MODIFY `log_cd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_data_cube`
--
ALTER TABLE `main_data_cube`
  MODIFY `mdcid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mis_tbl_users`
--
ALTER TABLE `mis_tbl_users`
  MODIFY `user_cd` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pages_visit_log`
--
ALTER TABLE `pages_visit_log`
  MODIFY `p_visit_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planned`
--
ALTER TABLE `planned`
  MODIFY `plid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `pgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progressmonth`
--
ALTER TABLE `progressmonth`
  MODIFY `pmid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progressmonth_log`
--
ALTER TABLE `progressmonth_log`
  MODIFY `log_cd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_days`
--
ALTER TABLE `project_days`
  MODIFY `pd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2048;

--
-- AUTO_INCREMENT for table `project_photos`
--
ALTER TABLE `project_photos`
  MODIFY `phid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rs_tbl_news`
--
ALTER TABLE `rs_tbl_news`
  MODIFY `news_cd` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s009-eva-results`
--
ALTER TABLE `s009-eva-results`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t0101designprogress`
--
ALTER TABLE `t0101designprogress`
  MODIFY `dgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t012issues`
--
ALTER TABLE `t012issues`
  MODIFY `nos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t013nonconformitynotice`
--
ALTER TABLE `t013nonconformitynotice`
  MODIFY `nos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t014majoritems`
--
ALTER TABLE `t014majoritems`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t023project_progress_graph`
--
ALTER TABLE `t023project_progress_graph`
  MODIFY `ppg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t027project_drawings`
--
ALTER TABLE `t027project_drawings`
  MODIFY `dwgid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t027project_photos`
--
ALTER TABLE `t027project_photos`
  MODIFY `phid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t031project_albums`
--
ALTER TABLE `t031project_albums`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t031project_drawingalbums`
--
ALTER TABLE `t031project_drawingalbums`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t32project_videos`
--
ALTER TABLE `t32project_videos`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_daily_site_entry`
--
ALTER TABLE `tbl_daily_site_entry`
  MODIFY `dsid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rfi_lab`
--
ALTER TABLE `tbl_rfi_lab`
  MODIFY `rfi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_risk_impact_rating`
--
ALTER TABLE `tbl_risk_impact_rating`
  MODIFY `risk_impact_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_risk_likelihood_rating`
--
ALTER TABLE `tbl_risk_likelihood_rating`
  MODIFY `risk_like_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_risk_register`
--
ALTER TABLE `tbl_risk_register`
  MODIFY `risk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_risk_register_context`
--
ALTER TABLE `tbl_risk_register_context`
  MODIFY `risk_con_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_risk_score_rating_color`
--
ALTER TABLE `tbl_risk_score_rating_color`
  MODIFY `risk_score_rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_progress`
--
ALTER TABLE `template_progress`
  MODIFY `temp_pid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_log`
--
ALTER TABLE `users_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yearly_holidays`
--
ALTER TABLE `yearly_holidays`
  MODIFY `yh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
