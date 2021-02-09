-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2019 at 06:41 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_sekolahku`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2019-2020', 'odd', 'true', 'true', '2019-07-10 10:55:37', '2019-07-10 03:55:37', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT '0',
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT '0',
  `achievement_level` smallint(6) NOT NULL DEFAULT '0',
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admission_phases`
--

CREATE TABLE `admission_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admission_phases`
--

INSERT INTO `admission_phases` (`id`, `academic_year_id`, `phase_name`, `phase_start_date`, `phase_end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, '2', '2019-01-01', '2019-12-31', '2019-07-10 18:38:46', '2019-07-13 07:27:39', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `admission_quotas`
--

CREATE TABLE `admission_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admission_quotas`
--

INSERT INTO `admission_quotas` (`id`, `academic_year_id`, `admission_type_id`, `major_id`, `quota`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 170, 0, 20, '2019-07-10 10:58:19', '2019-07-10 03:58:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `album_title`, `album_description`, `album_slug`, `album_cover`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Foto Besama', '', 'foto-besama', 'fc64059c1db4044c1ea1ee773a6e5ca1.jpg', '2019-07-10 18:10:38', '2019-07-10 11:11:37', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Pembinaan Ibadah', 'Sikap dan perilaku yang patuh dalam melaksanakan ajaran agama yang dianutnya,toleran terhadap pelaksanaan ibadah agama lain dan rukun dengan pemeluk agama lain', 'pembinaan-ibadah', '090a34e888c4e4ef924f749a980fe961.jpg', '2019-07-10 18:12:17', '2019-09-30 13:54:02', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Proses Belajar, Mengajar', 'Kurikulum diarahkan pada proses pengembangan, pembudayaan, dan pemberdayaan peserta didik yang berlangsung sepanjang hayat', 'proses-belajar-mengajar', '40aa3f4dcedf57ce0671b4ed528426ee.jpg', '2019-07-10 18:22:16', '2019-09-30 13:51:53', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'Gedung Sekolah', '', 'gedung-sekolah', 'd4c7d31f29a8206cd2ff4253c1069fdc.jpg', '2019-07-10 18:24:18', '2019-07-10 11:24:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 'Kegiatan Menghafal Al-Qur\'an', 'Siswa san siswi mampu menghafal al-Qur’an minimal 1 (satu) Juz setahun dan 6 (enam) juz selama 6 (enam) tahun', 'kegiatan-menghafal-al-quran', '1aedf1e2883c21d075738f3a3feceb6e.jpg', '2019-07-13 13:17:45', '2019-09-30 13:55:15', NULL, NULL, 1, 1, 0, 0, 'false'),
(6, 'Makan Bersama', 'Makan Bersama, sesuai dengan Sunnah Nabi', 'makan-bersama', '240373ee298559a99e083e17d563f019.jpg', '2019-07-13 13:19:07', '2019-09-30 13:49:50', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '', 'post', '2019-04-01 08:26:40', '2019-07-10 03:45:31', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Pengumuman', 'pengumuman', '', 'post', NULL, '2019-07-10 03:45:56', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 'Sekilas Info', 'sekilas-info', '', 'post', NULL, '2019-07-10 03:46:26', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_groups`
--

INSERT INTO `class_groups` (`id`, `class_group`, `sub_class_group`, `major_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '1', '', 0, '2019-07-10 10:53:16', '2019-07-10 03:53:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, '2', '', 0, '2019-07-10 10:53:25', '2019-07-10 03:53:25', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, '3', '', 0, '2019-07-10 10:53:41', '2019-07-10 03:53:41', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, '4', '', 0, '2019-07-10 10:53:48', '2019-07-10 03:53:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, '5', '', 0, '2019-07-10 10:53:55', '2019-07-10 03:53:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, '6', '', 0, '2019-07-10 10:54:01', '2019-07-10 03:54:01', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT '0' COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT '0' COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_group_settings`
--

INSERT INTO `class_group_settings` (`id`, `academic_year_id`, `class_group_id`, `employee_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 2, 2, '2019-07-14 13:41:40', '2019-07-14 06:41:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 3, 3, '2019-07-14 13:41:52', '2019-07-14 06:41:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 4, 4, '2019-07-14 13:42:04', '2019-07-14 06:42:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 1, 5, 5, '2019-07-14 13:42:16', '2019-07-14 06:42:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 1, 6, 6, '2019-07-14 13:42:30', '2019-07-14 06:42:30', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 1, 1, 7, '2019-07-28 13:15:33', '2019-07-28 06:15:33', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_group_students`
--

CREATE TABLE `class_group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT '0',
  `student_id` bigint(20) DEFAULT '0',
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_group_students`
--

INSERT INTO `class_group_students` (`id`, `class_group_setting_id`, `student_id`, `is_class_manager`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 5, 2, 'false', '2019-07-14 14:21:43', '2019-07-14 07:21:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 5, 3, 'false', '2019-07-14 14:22:35', '2019-07-14 07:22:35', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 5, 5, 'false', '2019-07-14 14:22:45', '2019-07-14 07:22:45', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 5, 12, 'false', '2019-07-14 14:23:04', '2019-07-14 07:23:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 5, 21, 'false', '2019-07-14 14:23:33', '2019-07-14 07:23:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 5, 29, 'false', '2019-07-14 14:23:54', '2019-07-14 07:23:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 5, 31, 'false', '2019-07-14 14:24:07', '2019-07-14 07:24:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, 5, 33, 'false', '2019-07-14 14:24:54', '2019-07-14 07:24:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 5, 49, 'false', '2019-07-14 14:24:54', '2019-07-14 07:24:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 5, 46, 'false', '2019-07-14 14:25:32', '2019-07-14 07:25:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 4, 9, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 4, 10, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 4, 15, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 4, 18, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 4, 26, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 4, 30, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 4, 35, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 4, 37, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 4, 38, 'false', '2019-07-14 14:28:24', '2019-07-14 07:28:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 3, 13, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 3, 23, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 3, 24, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 3, 32, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 3, 39, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 3, 41, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 3, 42, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 3, 45, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 3, 47, 'false', '2019-07-14 14:31:16', '2019-07-14 07:31:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 2, 1, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 2, 4, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 2, 7, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 2, 8, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 2, 11, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 2, 17, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 2, 19, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 2, 22, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 2, 40, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 2, 43, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 2, 44, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 2, 48, 'false', '2019-07-14 14:33:20', '2019-07-14 07:33:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 1, 6, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(42, 1, 14, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 1, 16, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 1, 20, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 1, 25, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 1, 27, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 1, 28, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 1, 34, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 1, 36, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 1, 50, 'false', '2019-07-14 14:34:38', '2019-07-14 07:34:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 6, 51, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 6, 52, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 6, 53, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(54, 6, 54, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 6, 55, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 6, 56, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 6, 57, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 6, 58, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 6, 59, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 6, 60, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 6, 61, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(62, 6, 62, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(63, 6, 63, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(64, 6, 64, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(65, 6, 65, 'false', '2019-07-28 13:15:50', '2019-07-28 06:15:50', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) DEFAULT '0',
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT '0',
  `marriage_status_id` bigint(20) DEFAULT '0',
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT '0' COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT '0' COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT '0' COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT '0' COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT '0' COMMENT 'Pangkat / Golongan',
  `salary_source_id` bigint(20) DEFAULT '0' COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah ?',
  `laboratory_skill_id` bigint(20) DEFAULT '0' COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT '0' COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `assignment_letter_number`, `assignment_letter_date`, `assignment_start_date`, `parent_school_status`, `full_name`, `gender`, `nik`, `birth_place`, `birth_date`, `mother_name`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `religion_id`, `marriage_status_id`, `spouse_name`, `spouse_employment_id`, `citizenship`, `country`, `npwp`, `employment_status_id`, `nip`, `niy`, `nuptk`, `employment_type_id`, `decree_appointment`, `appointment_start_date`, `institution_lifter_id`, `decree_cpns`, `pns_start_date`, `rank_id`, `salary_source_id`, `headmaster_license`, `laboratory_skill_id`, `special_need_id`, `braille_skills`, `sign_language_skills`, `phone`, `mobile_phone`, `email`, `photo`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '024/SK/YPAI/VII/2017', '0000-00-00', '0000-00-00', 'true', 'Syahri Ramadhan, S. Psi, M. S. I', 'M', '11', 'Koto Panjang', '1989-04-12', 'Jusmanidar', 'Jalan Godang', '-', '-', ' Jorong Abdurrahman', 'Nagari Tigo Jangko', 'Lintau Buo', 'Tanah Datar', '27292', 89, 103, 'Dian', 22, 'WNI', 'Indonesia', NULL, 123, NULL, NULL, '', 134, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 171, 23, 'false', 'false', '', '081392727192', 'ramadhan.pdg@gmail.com', NULL, '2019-07-10 18:57:25', '2019-07-10 15:43:58', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, '022/SK/YPIA/III/2017', '2017-03-13', '0000-00-00', 'true', 'Yuherdawati, S. Pd. I', 'F', '22', 'Teluk Bintungan', '1979-06-12', '', 'KPP II - Garuda Blok B4 No 34', '1', '1', '', 'Kubang Jaya', 'Siak Hulu', 'Kampar', '28452', 89, 103, '', 10, 'WNI', 'Indonesia', NULL, 113, NULL, NULL, '', 124, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'true', 171, 23, 'false', 'false', '', '', 'a@a.com', NULL, '2019-07-10 22:40:45', '2019-07-10 15:42:01', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, '027/SK/YPIA/VII/2018', '2019-07-02', '0000-00-00', 'true', 'Elvi Fitriani', 'F', '33', 'Simpang Kubu', '1992-07-02', '', 'Perumahan Villa Pesona Panama atau Trilogi 2 Blok D No 3', '', '', '', '', '', '', '', 89, 103, '', 10, 'WNI', 'Indonesia', NULL, 123, NULL, NULL, '', 124, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 171, 23, 'false', 'false', '', '', 'b@b.com', NULL, '2019-07-10 22:48:47', '2019-07-10 15:48:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, '023/SK/YPAI/VII/2017', '2017-07-07', '0000-00-00', 'true', 'Reni Handayani, S. E. Sy', 'F', '44', 'Teluk Kuantan', '1990-03-07', '', 'Kabang Raya', '', '', '', 'Kabang Raya', 'Siak Hulu', 'Kampar', '', 89, 103, '', 10, 'WNI', 'Indonesia', NULL, 123, NULL, NULL, '', 124, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 171, 23, 'false', 'false', '', '', 'c@c.com', NULL, '2019-07-10 22:55:58', '2019-07-10 15:55:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, '013/SK/YPIA/VII/2015', '2015-07-01', '0000-00-00', 'true', 'Delisma, A. Ma', 'F', '55', 'Banjar Melayu', '1977-12-05', '', '', '', '', '', '', '', '', '', 89, 103, '', 10, 'WNI', 'Indonesia', NULL, 123, NULL, NULL, '', 124, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 159, 23, 'false', 'false', '', '', 'e@e.com', NULL, '2019-07-10 23:00:02', '2019-07-10 16:00:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, '', '0000-00-00', '0000-00-00', 'true', 'Raihana Silvia, S. Pd', 'F', '66', 'Perupuk', '1985-10-15', '', '', '', '', '', '', '', '', '', 89, 103, '', 10, 'WNI', '', NULL, 123, NULL, NULL, '', 124, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 171, 23, 'false', 'false', '', '', 'f@f.com', NULL, '2019-07-10 23:03:09', '2019-07-10 16:03:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, '', '0000-00-00', '0000-00-00', 'true', 'Firnaldi T. Yasit, S. Pd', 'M', '77', 'Pekanbaru', '1992-07-17', '', 'HR.Soebrantas Gg, Nuru Ikhlas', '1', '2', '', 'Bangkinang', 'Bangkinang', 'Kampar', '', 89, 103, '', 10, 'WNI', 'Indonesia', NULL, 123, NULL, NULL, '', 124, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 171, 23, 'false', 'false', '', '', 'g@g.com', NULL, '2019-07-10 23:08:05', '2019-07-10 16:09:04', NULL, NULL, 1, 1, 0, 0, 'false'),
(8, '', '0000-00-00', '0000-00-00', 'true', 'Suryawan Panca Kusuma', 'M', '1403021811954672', 'Bantan Tua', '1995-11-18', '', 'Jl. Rajimun', '004', '003', '', 'Pasiran', 'Bantan', 'Kampar', '', 89, 103, '', 10, 'WNI', 'Indonesia', NULL, 123, NULL, NULL, '', 125, '', '0000-00-00', 109, '', '0000-00-00', 172, 155, 'false', 171, 23, 'false', 'false', '', '', 'aa@bbbb.com', NULL, '2019-07-13 13:05:51', '2019-07-13 06:06:40', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT '0',
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Proses Belajar, Mengajar', 'eae58db53f2b8e9ea7dd8e5b7dcc1ba1.jpg', '2019-04-01 08:26:41', '2019-07-31 14:43:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Pembinaan Ibadah', '4424c65caf99b3b1dbda9239a0e71470.jpg', '2019-04-01 08:26:41', '2019-07-31 14:43:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'Gedung Sekolah', 'facb5991e9215ad4c52c06b95c1699d3.jpg', '2019-07-10 10:42:24', '2019-07-31 14:43:35', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT '0',
  `menu_position` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 5, '2019-04-01 08:26:42', '2019-09-30 13:36:23', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2019-04-01 08:26:42', '2019-04-01 01:26:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2019-04-01 08:26:42', '2019-04-01 01:26:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2019-04-01 08:26:42', '2019-04-01 01:26:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2019-04-01 08:26:42', '2019-04-01 01:26:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2019-04-01 08:26:42', '2019-04-01 01:26:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2019-04-01 08:26:42', '2019-04-01 01:26:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'PPDB 2019', '#', '_self', 'links', 0, 3, '2019-04-01 08:26:42', '2019-09-30 13:36:23', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 4, '2019-04-01 08:26:42', '2019-09-30 13:36:23', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Kategori', '#', '', 'links', 0, 2, '2019-04-01 08:26:42', '2019-07-10 03:58:44', '2019-07-10 10:58:44', NULL, 0, 1, 1, 0, 'true'),
(11, 'Uncategorized', 'kategori/uncategorized', '', 'post_categories', 10, 1, '2019-04-01 08:26:42', '2019-07-10 03:59:07', '2019-07-10 10:59:07', NULL, 0, 1, 1, 0, 'true'),
(12, 'Direktori', '#', '_self', 'links', 0, 2, '2019-04-01 08:26:42', '2019-09-30 13:36:23', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'Direktori Alumni', 'direktori-alumni', '', 'modules', 12, 1, '2019-04-01 08:26:42', '2019-07-10 03:59:20', '2019-07-10 10:59:20', NULL, 0, 1, 1, 0, 'true'),
(14, 'Peserta Didik', 'direktori-peserta-didik', '_self', 'modules', 12, 4, '2019-04-01 08:26:42', '2019-10-01 16:40:25', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 2, '2019-04-01 08:26:42', '2019-10-01 16:40:50', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'Pendaftaran Alumni', 'pendaftaran-alumni', '', 'modules', 0, 4, '2019-04-01 08:26:42', '2019-07-10 03:58:54', '2019-07-10 10:58:54', NULL, 0, 1, 1, 0, 'true'),
(17, 'Profil', '#', '_parent', 'pages', 0, 1, '2019-04-01 08:26:42', '2019-09-30 13:37:38', NULL, '2019-09-30 20:37:38', 0, 1, 0, 1, 'false'),
(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 17, 3, '2019-04-01 08:26:42', '2019-09-30 13:30:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'Identitas Sekolah', 'read/10/identitas-sekolah', '_self', 'pages', 17, 2, '2019-09-30 20:29:26', '2019-09-30 13:30:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 'Sejarah Sekolah', 'read/11/sejarah-sekolah', '_self', 'pages', 17, 1, '2019-09-30 20:29:26', '2019-09-30 13:30:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 'Struktur Organisasi', 'read/12/struktur-organisasi', '_self', 'pages', 17, 4, '2019-09-30 20:29:26', '2019-09-30 13:30:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 'Kurikulum', 'read/13/kurikulum', '_self', 'pages', 12, 1, '2019-09-30 20:29:26', '2019-09-30 13:36:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 'Sarana dan Prasarana', 'read/15/sarana-dan-prasarana', '_self', 'pages', 12, 3, '2019-09-30 20:29:26', '2019-09-30 13:36:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 'Prestasi Sekolah', 'read/16/prestasi-sekolah', '_self', 'pages', 9, 3, '2019-09-30 20:48:07', '2019-10-01 04:49:11', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Akademik', 'Akademik', 'academic', '2019-04-01 08:26:39', '2019-04-01 01:26:39', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kabupaten', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Provinsi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama Orang Tua', '2019-04-01 08:26:40', '2019-07-10 03:54:35', NULL, NULL, 0, 1, 0, 0, 'false'),
(75, 'residences', 'Wali', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan Pribadi', '2019-04-01 08:26:40', '2019-07-10 03:48:57', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / Angkot / Pete - Pete', '2019-04-01 08:26:40', '2019-07-10 03:48:42', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua Yayasan', '2019-04-01 08:26:40', '2019-07-10 16:10:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kabupaten/Kota', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(170, 'admission_types', 'Mandiri', '2019-07-10 10:58:06', '2019-07-10 03:58:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(171, 'laboratory_skills', 'Tidak Ada', '2019-07-10 18:49:03', '2019-07-10 11:49:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(172, 'ranks', '-', '2019-07-10 22:41:28', '2019-07-10 15:41:28', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) DEFAULT '0',
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo_album_id`, `photo_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, '584d0151d719fb7e95b3218169d48e83.jpg', '2019-07-10 18:10:57', '2019-07-10 11:10:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 1, 'ee9783d3dd885d0e6fe649cd1ef64f3b.jpg', '2019-07-10 18:10:58', '2019-07-10 11:10:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, '95d1fe06a98381f3175395ae7cd61398.jpg', '2019-07-10 18:10:59', '2019-07-10 11:10:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 1, '5e25f5a1db064ae2f3a0f4fa7ba7bf2c.jpg', '2019-07-10 18:11:00', '2019-07-10 11:11:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 1, '093056f2ceacac58ae4834982c7bd07c.jpg', '2019-07-10 18:11:00', '2019-07-10 11:11:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 1, '50e9845d292a68941138431d1e2b4380.jpg', '2019-07-10 18:11:01', '2019-07-10 11:11:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 1, 'bb1e8d0cbce6fa218fd05482e819a2f8.jpg', '2019-07-10 18:11:01', '2019-07-10 11:11:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, 1, '57038edffb91df1522f5d17a73047c31.jpg', '2019-07-10 18:11:02', '2019-07-10 11:11:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 1, 'f200318f8c107f8cc41bd052f34bf5ad.jpg', '2019-07-10 18:11:03', '2019-07-10 11:11:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 1, '390e9713ca04f3b4a08ca86d0cf63210.jpg', '2019-07-10 18:11:03', '2019-07-10 11:11:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 1, '95471aa5fadfce6b90c23bdae48a8182.jpg', '2019-07-10 18:11:04', '2019-07-10 11:11:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 1, '1639b1429d95320e9ae5fa361bd072ed.jpg', '2019-07-10 18:11:04', '2019-07-10 11:11:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 1, '40f132926fb4335e4047a1e07f2b2e61.jpg', '2019-07-10 18:11:05', '2019-07-10 11:11:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 1, '38e33d94afa2d03b9db53fe798986b63.jpg', '2019-07-10 18:11:06', '2019-07-10 11:11:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 1, 'd1f93e3f79af056ca04d68f7a115997f.jpg', '2019-07-10 18:11:06', '2019-07-10 11:11:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 1, 'bdb7581632595a01127ed9ebd04dec7d.jpg', '2019-07-10 18:11:07', '2019-07-10 11:11:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 1, 'ef3b84a223566b2a43d1ce80ad70c93f.jpg', '2019-07-10 18:11:08', '2019-07-10 11:11:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 1, '186ac168558c4f4d6d443138a21cd4b4.jpg', '2019-07-10 18:11:08', '2019-07-10 11:11:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 2, '64f12497c1d7ff05ce0efb855200ef00.jpg', '2019-07-10 18:13:01', '2019-07-10 11:13:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 2, 'b865d0e6b731002ac7f72771b5f79829.jpg', '2019-07-10 18:13:01', '2019-07-10 11:13:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 2, '7386d431a30c4465eca0af4d976fca51.jpg', '2019-07-10 18:13:02', '2019-07-10 11:13:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 2, '7f43cb320da5320e6e2ca1fb8b219de4.jpg', '2019-07-10 18:13:03', '2019-07-10 11:13:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 2, '344a3cbaa0f64c7ae5303401245a60e6.jpg', '2019-07-10 18:13:04', '2019-07-10 11:13:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 2, '43af044e33e5dd29358071221c7eb00a.jpg', '2019-07-10 18:13:04', '2019-07-10 11:13:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 2, '1b957fb786e6a4ad76e0a704d9eb8eda.jpg', '2019-07-10 18:13:05', '2019-07-10 11:13:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 2, '6291e9ed4f3047cf923e3d739af6a342.jpg', '2019-07-10 18:13:06', '2019-07-10 11:13:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 2, 'ed62308669b2ecbbfc15e005024f825c.jpg', '2019-07-10 18:13:06', '2019-07-10 11:13:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 2, 'ef6db132412f292d98c9db4ba7ebd2c8.jpg', '2019-07-10 18:13:07', '2019-07-10 11:13:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 2, '269fc0c9f7f9c2f66ff1eb07e5bc5bb5.jpg', '2019-07-10 18:13:08', '2019-07-10 11:13:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 2, 'b8d4bc84d8622aacfa9cec5e73f0e837.jpg', '2019-07-10 18:13:08', '2019-07-10 11:13:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 2, 'e8aa7b83a3c10342b4ee33494d170d1b.jpg', '2019-07-10 18:18:05', '2019-07-10 11:18:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 2, '2f7ea27ce08194b64678fe53a82bedd8.jpg', '2019-07-10 18:18:05', '2019-07-10 11:18:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 2, '7e041b60311d8e3c4c7492065cc0bce9.jpg', '2019-07-10 18:18:06', '2019-07-10 11:18:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 2, '8bfede773f6814a6fb3447a133c2e6d8.jpg', '2019-07-10 18:18:07', '2019-07-10 11:18:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 2, 'f4c9d721892cbb979c00932630baed88.jpg', '2019-07-10 18:18:07', '2019-07-10 11:18:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 2, '7c44bb929473c46565345757c4d42096.jpg', '2019-07-10 18:18:08', '2019-07-10 11:18:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 2, '1d54b5ac2eaf0fd9d1cb6691c40a2d23.jpg', '2019-07-10 18:18:09', '2019-07-10 11:18:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 1, '5418a72e1c798a06fad7ec49a16fbe3c.jpg', '2019-07-10 18:19:19', '2019-07-10 11:19:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 3, '5b9d14aeb23b894bb43c4769b306a85c.jpg', '2019-07-10 18:22:46', '2019-07-10 11:22:46', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 3, '13a24e08cd7afa7b33c40d0e806f07f4.jpg', '2019-07-10 18:22:47', '2019-07-10 11:22:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 3, '72cd4fdd0ec02da038968f9e38eae81e.jpg', '2019-07-10 18:22:48', '2019-07-10 11:22:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(42, 3, '817586c8ab3f8a145dd78198647fc8aa.jpg', '2019-07-10 18:22:48', '2019-07-10 11:22:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 3, '89152a71b033f0fd3da2ea19dbefaa00.jpg', '2019-07-10 18:22:49', '2019-07-10 11:22:49', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 3, 'd1449ec997a0216440d64f96a45f1aa3.jpg', '2019-07-10 18:22:49', '2019-07-10 11:22:49', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 3, '252acd531830d86cbc9ef51144a2aece.jpg', '2019-07-10 18:22:50', '2019-07-10 11:22:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 3, '83cd6854cf31838e11726634c07c234a.jpg', '2019-07-10 18:22:50', '2019-07-10 11:22:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 3, 'b1d169f2a27ce338e68e0d31eea88847.jpg', '2019-07-10 18:22:51', '2019-07-10 11:22:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 3, '7c8f7e3091b8afbea4b5f268fa8dbcc3.jpg', '2019-07-10 18:22:52', '2019-07-10 11:22:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 3, '965c23128297294f4ce4dd3755c4de33.jpg', '2019-07-10 18:22:52', '2019-07-10 11:22:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 3, '948de9c467164587e41d50bf1dafa3f1.jpg', '2019-07-10 18:22:53', '2019-07-10 11:22:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 3, '3997459b8051e0bafefddc1310e4c7f3.jpg', '2019-07-10 18:22:54', '2019-07-10 11:22:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 3, 'a026704065c54b45c91bc28291aef4d3.jpg', '2019-07-10 18:22:54', '2019-07-10 11:22:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 3, '1a5160ed1b575c79a11d78a86fe7afce.jpg', '2019-07-10 18:22:55', '2019-07-10 11:22:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(54, 3, '057a2dc46bbe31eeeedd1fbbe6dd03bf.jpg', '2019-07-10 18:22:55', '2019-07-10 11:22:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 3, '2e4e865b64731d62c7702fd7e90c548b.jpg', '2019-07-10 18:22:56', '2019-07-10 11:22:56', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 3, '349664eb1ef70e28d3767fe3cd4bef5b.jpg', '2019-07-10 18:22:57', '2019-07-10 11:22:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 3, 'd331be0f72275e43c457a801ce8945d1.jpg', '2019-07-10 18:22:57', '2019-07-10 11:22:57', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 3, '42d24bbf3c125b5fbc84d7a61ba42df5.jpg', '2019-07-10 18:22:58', '2019-07-10 11:22:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 3, '0177fed7c486ff608655c892b160a6aa.jpg', '2019-07-10 18:22:59', '2019-07-10 11:22:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 3, '1b3dcf85cf02f5c978329aec3bcc5c6f.jpg', '2019-07-10 18:22:59', '2019-07-10 11:22:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 3, 'f69f270bfdee4f9c7aec3aa5bc6c6973.jpg', '2019-07-10 18:23:00', '2019-07-10 11:23:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(62, 3, '9c0202a66a8566b70c273fccd4b5de2f.jpg', '2019-07-10 18:23:01', '2019-07-10 11:23:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(63, 3, 'f36357b3edfd1cd0ffe504eb35f1cd83.jpg', '2019-07-10 18:23:01', '2019-07-10 11:23:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(64, 3, 'e34e880475cf5295550a1ad0a6825115.jpg', '2019-07-10 18:23:02', '2019-07-10 11:23:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(65, 3, '84020e91b1f71d9f55344581269d8188.jpg', '2019-07-10 18:23:02', '2019-07-10 11:23:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(66, 3, '8fb22c9efef18453a3a407e78d380ac2.jpg', '2019-07-10 18:23:03', '2019-07-10 11:23:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(67, 3, '2c0e239014e1fdf8174fb254d17bd9e7.jpg', '2019-07-10 18:23:04', '2019-07-10 11:23:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(68, 3, 'a2527e0072b6ea052b3abc77363358b0.jpg', '2019-07-10 18:23:04', '2019-07-10 11:23:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(69, 3, '560ce66486e0706cac0e473162917715.jpg', '2019-07-10 18:23:05', '2019-07-10 11:23:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(70, 3, '1078a60c892dd23ef8dd3cd4fc83308b.jpg', '2019-07-10 18:23:06', '2019-07-10 11:23:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(71, 4, '7d0642720056ad46975bc70b35c1bfa3.jpg', '2019-07-10 18:24:49', '2019-07-10 11:24:49', NULL, NULL, 1, 0, 0, 0, 'false'),
(72, 4, 'e0655c74e12e171de105e12e4bcef1ee.jpg', '2019-07-10 18:24:50', '2019-07-10 11:24:50', NULL, NULL, 1, 0, 0, 0, 'false'),
(73, 4, '886d91f8525027d8c1cce7aeeb4359ac.jpg', '2019-07-10 18:24:51', '2019-07-10 11:24:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(74, 4, 'f0e6ce3c54d671ba2b1a602f22985cb5.jpg', '2019-07-10 18:24:51', '2019-07-10 11:24:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(75, 4, 'df62ea6b838e3ed8437fd5ed61e16699.jpg', '2019-07-10 18:24:52', '2019-07-10 11:24:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(76, 4, '5643307a38ce1a4ce91bd739a81de1ab.jpg', '2019-07-10 18:24:52', '2019-07-10 11:24:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(77, 4, '76cecd576cc2c2500182a41ceb9c0f81.jpg', '2019-07-10 18:24:53', '2019-07-10 11:24:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(78, 4, '94fd4e47a1ec27defd58a7e7ba84880a.jpg', '2019-07-10 18:24:54', '2019-07-10 11:24:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(79, 4, 'f4a796b06f2d7ed3e00ebbb5673d8a95.jpg', '2019-07-10 18:24:54', '2019-07-10 11:24:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(80, 4, '20a8c1b2eec3a845dbe282e7b6b394e1.jpg', '2019-07-10 18:24:55', '2019-07-10 11:24:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(81, 4, '8fbfb06178a0ff9a1642d4e04c6780a5.jpg', '2019-07-10 18:24:56', '2019-07-10 11:24:56', NULL, NULL, 1, 0, 0, 0, 'false'),
(82, 3, '6cdf8d2f34dc6fc97a24822374b40a67.jpg', '2019-07-10 18:27:38', '2019-07-10 11:27:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(83, 3, 'fb8ef1572a4036645f00dee894ba6cdd.jpg', '2019-07-13 13:16:23', '2019-07-13 06:16:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(84, 5, 'f06b67f758bd1093a7b5584142b44e34.jpg', '2019-07-13 13:18:19', '2019-07-13 06:18:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(85, 5, '44babdc8d10fe4dd084138c803ac9d86.jpg', '2019-07-13 13:18:20', '2019-07-13 06:18:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(86, 5, 'a6df878f0069c1810ab4d2db8aff9c67.jpg', '2019-07-13 13:18:21', '2019-07-13 06:18:21', NULL, NULL, 1, 0, 0, 0, 'false'),
(87, 5, 'f3f4f085bdc71967c10444f3da7ff889.jpg', '2019-07-13 13:18:22', '2019-07-13 06:18:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(88, 5, '6adcff3b0d7a7d9424a98df1754a7368.jpg', '2019-07-13 13:18:22', '2019-07-13 06:18:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(89, 5, 'e78eeff40d94447cf8576bf0b592adbb.jpg', '2019-07-13 13:18:23', '2019-07-13 06:18:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(90, 5, '962c9ceca76647066cd836540346f2e2.jpg', '2019-07-13 13:18:23', '2019-07-13 06:18:23', NULL, NULL, 1, 0, 0, 0, 'false'),
(91, 6, '9d4f8deacb1d44d6d1e3a5212e6d92d6.jpg', '2019-07-13 13:20:01', '2019-07-13 06:20:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(92, 6, '5cbccddb960ac37118abb35b94dd2bbe.jpg', '2019-07-13 13:20:02', '2019-07-13 06:20:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(93, 6, 'cea7a53b57bd029f15940fcf1c4f75aa.jpg', '2019-07-13 13:20:02', '2019-07-13 06:20:02', NULL, NULL, 1, 0, 0, 0, 'false'),
(94, 6, '50c70aa9f4209187919c8fd320599d8e.jpg', '2019-07-13 13:20:03', '2019-07-13 06:20:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(95, 6, 'e0191a43c6d5cd3bf99f1cbd675eac36.jpg', '2019-07-13 13:20:03', '2019-07-13 06:20:03', NULL, NULL, 1, 0, 0, 0, 'false'),
(96, 6, '60e10bb10af534313bcfde409dec8f5e.jpg', '2019-07-13 13:20:04', '2019-07-13 06:20:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(97, 6, '3c01df6e8cb46504dec382441d2bb08b.jpg', '2019-07-13 13:20:04', '2019-07-13 06:20:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(98, 6, '43ffe1fc12fa08ec774f8b6c479d1957.jpg', '2019-07-13 13:20:05', '2019-07-13 06:20:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(99, 6, 'aa2faec39fdc23eb50cb2c7f06a6947b.jpg', '2019-07-13 13:20:06', '2019-07-13 06:20:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(100, 6, 'b70e9855fd4afca4852d4853d37bf963.jpg', '2019-07-13 13:20:06', '2019-07-13 06:20:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(101, 6, '58a3cb473f1dcd55fb39315d9fa41d28.jpg', '2019-07-13 13:20:07', '2019-07-13 06:20:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(102, 6, '9605e0c2d30c0c6e0a8e438c3709a76c.jpg', '2019-07-13 13:20:07', '2019-07-13 06:20:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(103, 6, 'f93da21bb849cc73e1d9c1f8353ea500.jpg', '2019-07-13 13:20:08', '2019-07-13 06:20:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(104, 6, '8e9cafe1762985e31a23188e13421ab0.jpg', '2019-07-13 13:20:08', '2019-07-13 06:20:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(105, 6, 'ac2db85b6f6c65e21378f530c82feacf.jpg', '2019-07-13 13:20:09', '2019-07-13 06:20:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(106, 6, '20efde1b262ef5c03afc8f80e4ba4735.jpg', '2019-07-13 13:20:09', '2019-07-13 06:20:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(107, 6, '72597f4d7ff2af90671873d62e5e9b0a.jpg', '2019-07-13 13:20:10', '2019-07-13 06:20:10', NULL, NULL, 1, 0, 0, 0, 'false'),
(108, 6, 'ec3cc513d9e9bd74001561060b77c9e3.jpg', '2019-07-13 13:20:11', '2019-07-13 06:20:11', NULL, NULL, 1, 0, 0, 0, 'false'),
(109, 6, '4858350ac40a783d9130cec68509d3e4.jpg', '2019-07-13 13:20:11', '2019-07-13 06:20:11', NULL, NULL, 1, 0, 0, 0, 'false'),
(110, 6, '0d6282af2b42f7b335ca56c54c245d8c.jpg', '2019-07-13 13:20:12', '2019-07-13 06:20:12', NULL, NULL, 1, 0, 0, 0, 'false'),
(111, 6, '35aedc8537eff967fc4f3663adb9d34f.jpg', '2019-07-13 13:20:12', '2019-07-13 06:20:12', NULL, NULL, 1, 0, 0, 0, 'false'),
(112, 6, '18ce6e071a71069f38d2350cc871e6b4.jpg', '2019-07-13 13:20:13', '2019-07-13 06:20:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(113, 6, '592629365a924ffea9d7288ecff64fe0.jpg', '2019-07-13 13:20:14', '2019-07-13 06:20:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(114, 6, '1ff7decac2c0a9732c11d50be491a8b7.jpg', '2019-07-13 13:20:14', '2019-07-13 06:20:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(115, 6, '28a366fb7673143de5995c1b662de817.jpg', '2019-07-13 13:20:15', '2019-07-13 06:20:15', NULL, NULL, 1, 0, 0, 0, 'false'),
(116, 6, '419d2e83272fb95bf5f53e67d72ad577.jpg', '2019-07-13 13:20:16', '2019-07-13 06:20:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(117, 6, 'b91d4d1ec1a6cebefabe471654cf6582.jpg', '2019-07-13 13:20:16', '2019-07-13 06:20:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(118, 6, '4755652686ad1f50b27223a7f35a9ba8.jpg', '2019-07-13 13:20:17', '2019-07-13 06:20:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(119, 6, '93c2a27686b40015c6b6caa54e5a935c.jpg', '2019-07-13 13:20:17', '2019-07-13 06:20:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(120, 6, '6153fd6646b6bc8ba1727a4380f8e8fa.jpg', '2019-07-13 13:20:18', '2019-07-13 06:20:18', NULL, NULL, 1, 0, 0, 0, 'false'),
(121, 6, 'df0ba5d8d68080facd24e87a786910ac.jpg', '2019-07-13 13:20:19', '2019-07-13 06:20:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(122, 6, 'ff54e2f5a6995cb748872cc3cc2e6385.jpg', '2019-07-13 13:20:19', '2019-07-13 06:20:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(123, 3, '76880eed87d6591f8b1aed0a38075de7.jpg', '2019-07-27 19:34:57', '2019-07-27 12:34:57', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT '0',
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p style=\"text-align: center;\"><strong>Selamat Datang Di Website SDIT Tahfizh Al-Makki</strong></p>\n<p style=\"text-align: center;\">&nbsp;&nbsp;</p>\n<p style=\"text-align: center;\">Assalamu\'alaikum Wr. Wb.</p>\n<p>&nbsp;</p>\n<p style=\"text-align: justify;\">Puji syukur kami panjatkan kehadirat ALLAH SWT atas limpahan rahmat dan karunia-Nya sehingga SDIT TAHFIZH AL-MAKKI berhasil membangun website,&nbsp;Kehadiran Website SDIT Tahfizh Al-Makki diharapkan&nbsp;dapat memudahkan penyampaian informasi secara terbuka kepada warga sekolah, alumni dan masyarakat serta instansi lain yang terkait.&nbsp;</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">Semoga dengan kehadiran Website ini akan terjalin informasi, komunikasi antar alumni khususnya sebagai salah satu upaya sekolah mendapatkan informasi akan penelusuran tamatan/ alumni dimana saja berada. Dapat memperoleh informasi dengan cepat sehingga dapat mengikuti perkembangan dalam pengetahuan yang berkembang dengan cepat pula.</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">Kesiapan dari semua warga sekolah sangat besar artinya bagi keberadaan website tersebut, sebab tanpa kesiapan dari warga sekolah maka keberadaan website tersebut akan tidak ada gunanya.</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\">Sehubungan dengan hal tersebut maka semua warga sekolah harus mau untuk belajar menggunakan komputer dan internet, agar dapat meng-akses segala informasi yang berhubungan dengan sekolah dan pengetahuan di internet.</p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: center;\">Selamat bekerja, Demikian dan terima kasih.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p style=\"text-align: center;\">Wassalamu\'alaikum Wr. Wb.</p>\n<p style=\"text-align: center;\">Kepala Sekolah SDIT Tahfizh Al-Makki.</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2019-04-01 08:26:41', '2019-07-10 03:47:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Profil', '<p>-</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'profil', 'berita, pengumuman, sekilas-info', 28, '2019-04-01 08:26:41', '2019-09-30 13:37:04', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p><strong>Visi:</strong></p>\n<p><strong><em>Menjadi lembaga penghafal Al-Qur&rsquo;an di usia dini yang berprestasi, berakhlakul karimah dan berkompetensi di zamannya.</em></strong></p>\n<p><strong>Misi:</strong></p>\n<ol>\n<li>Menciptakan generasi yang cinta dan hafal Al-Qur&rsquo;an di usia dini.</li>\n<li>Membentuk generasi yang mempunyai <em>hard skill</em> dan <em>soft skill</em> yang mumpuni.</li>\n<li>Mempersiapkan penggerak masyarakat madani yang suka beramal.</li>\n<li>Mengembangkan budaya 5S (sapa, salam, senyum, dan santun).</li>\n<li>Lulusan mudah melanjutkan ke jenjang pendidikan yang lebih berkualitas.</li>\n</ol>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 16, '2019-04-01 08:26:41', '2019-07-29 08:52:38', NULL, NULL, 0, 1, 0, 0, 'false'),
(4, 'Lauching Website Resmi SD IT Tahfizh Al Makki', '<p style=\"text-align: justify;\">Alhamdulillah berkat rahmat Allah SWT Website Resmi SD IT Tahfizh Al Makki Resmi dipublikasikan dengan domain / alamat situs yaitu&nbsp;&nbsp;<a title=\"sdit.tahfizh.almakki.sch.id\" href=\"http://localhost/cmssekolahku/blog/posts/create/sdit.tahfizh.almakki.sch.id\" target=\"_blank\" rel=\"noopener\">sdit.tahfizh.almakki.sch.id</a>&nbsp;sebagai sarana informasi tambahan bagi warga sekolah tentang profil, kegiatan, dokumentasi, dan apapun informasi publik yang berkaitan dengan sekolah SD IT Tahfizh Al Makki, semoga bermanfaat, terimakasih.</p>', '58dac60508aa03e38f708412307b56fb.jpg', 1, '+1+', 'post', 'publish', 'public', 'open', 'lauching-website-resmi-sd-it-tahfizh-al-makki', 'Pengumuman', 15, '2019-04-01 08:26:41', '2019-07-27 12:25:29', NULL, NULL, 0, 1, 0, 0, 'false'),
(5, 'Tujuan SDIT Tahfizh Al-Makki', '<ol>\n<li>Siswa/i mampu membaca al-Qur&rsquo;an secara baik dan benar sesuai dengan hukum <em>tajwid</em>;</li>\n<li>Siswa/i mampu menghafal al-Qur&rsquo;an minimal 1 (satu) Juz setahun dan 6 (enam) juz selama 6 (enam) tahun;</li>\n<li>Siswa/i mampu memahami al-Qur&rsquo;an dan mengamalkan nilai-nilai keislaman yang terkandung di dalamnya;</li>\n<li>Siswa/i memiliki karakter (<em>mentality</em>) yang berdasarkan nilai-nilai keislaman yang terkandung di dalamnya;</li>\n<li>Siswa/i mampu bersaing di bidang sains dalam lomba tingkat kota, provinsi dan nasional;</li>\n<li>Siswa/i mampu bersaing di bidang olah raga dan seni dalam lomba tingkat kota, provinsi dan nasional;</li>\n<li>Siswa/i mampu mengenali potensi yang dimiliki sejak dini;</li>\n<li>Siswa/i memiliki status perkembangan psikologi, gaya belajar, dan intelegensi;</li>\n<li>Mampu mengaplikasikan nilai-nilai keislaman dalam kontribusi menggerakkan kehidupan masyarakat yang madani dilingkungan tempat tinggalnya.</li>\n</ol>', 'd9da3952f6de233521558b6a19caebe8.jpg', 1, '+4+', 'post', 'publish', 'public', 'open', 'tujuan-sdit-tahfizh-al-makki', 'Sekilas Info', 7, '2019-04-01 08:26:41', '2019-07-31 14:38:57', NULL, NULL, 0, 1, 0, 0, 'false'),
(6, 'Program Kegiatan SDIT Tahfizh Al-Makki', '<p><strong>Program Unggulan</strong></p>\n<ol>\n<li>Tahfizh dan Tahsin</li>\n<li><em>Learning Mentality Program</em></li>\n<li><em>Language Develompent Program</em></li>\n<li><em>Enterpreneurship Program</em></li>\n</ol>\n<p><strong>Program Harian</strong></p>\n<ol>\n<li>Tahsin Al-Qur&rsquo;an</li>\n<li>Murajaah pagi dan setiap pergantian pelajaran</li>\n<li>Pembiasaan dhuha setiap hari</li>\n<li>Zuhur dan ashar berjamaah</li>\n<li>Pembiasaan akhlak Islami</li>\n<li>Menghafal dan membiasakan dzikir dan doa&rsquo;-doa harian</li>\n</ol>\n<p><strong>Program Penunjang</strong></p>\n<ol>\n<li>Mukhayyam Al-Qur&rsquo;an</li>\n<li>Muhadharah</li>\n<li>Tasmi&rsquo; Al-Qur&rsquo;an</li>\n<li>Islamuna</li>\n<li>Dhuha <em>Habbit</em></li>\n<li>Shalat Berjama&rsquo;ah</li>\n<li>Renang</li>\n<li>Memanah</li>\n<li>Tadabbur Alam</li>\n<li>Kamping</li>\n<li><em>Outing Class Program</em></li>\n</ol>\n<p><strong>Program Pengembangan Diri</strong></p>\n<ol>\n<li>Pramuka</li>\n<li>Belah Diri</li>\n<li>UKS</li>\n<li><em>Market Day</em></li>\n</ol>', 'a91e764c4b833975ec917fca4b8d2e5f.jpg', 1, '+4+', 'post', 'publish', 'public', 'open', 'program-kegiatan-sdit-tahfizh-al-makki', 'Sekilas Info', 3, '2019-04-01 08:26:41', '2019-07-31 14:30:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(7, 'Mars JSIT Dengan Lirik (Minus interlude)', 'AMv-QH1kWp0', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2019-07-20 21:48:25', '2019-07-20 14:50:29', NULL, NULL, 1, 1, 0, 0, 'false'),
(8, 'SD IT Al Makki Present', 'csoGM1wIWPA', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2019-07-20 21:56:34', '2019-07-20 14:56:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 'Terbaru !! Senam JSIT 2019 FULL', 'zav09TFQtks', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2019-08-01 12:16:10', '2019-08-01 05:16:10', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 'Identitas Sekolah', '<table style=\"width: 576.781px;\">\n<tbody>\n<tr>\n<td style=\"width: 189px;\">\n<p>Nama Sekolah</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Sekolah Dasar Islam Terpadu Al-Makki</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Alamat</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Jalan Teropong Ujung</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Kelurahan/Desa</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Kubang Jaya</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Kecamatan</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Siak Hulu</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Kabupaten</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Kampar</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Provinsi</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Riau</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Kode Pos</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>28452</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Telepon / HP</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>0813 7263 8157</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Status Sekolah</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Swasta</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>NSS</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>102140680033</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>NPSN</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>69920592</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Tahun Didirikan</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Tahun 2013</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Tahun Beroperasi</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Tahun 2013</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Surat Izin Operasional</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>421/KPTS/P Dan K-DIKDAS/9524</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Pemberi SK</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Nasrul S.Pd., M.Pd</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Nama Kepala Skeolah</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Syahri Ramadhan, S.Psi., M.S.I</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Akreditasi</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Kepemilikan</p>\n</td>\n<td style=\"width: 18px;\">\n<p>&nbsp;</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status Tanah</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>Milik Sendiri</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Luas Tanah/Lahan</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>15X36 m<sup>2</sup></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>Status Bangunan</p>\n</td>\n<td style=\"width: 18px;\">\n<p>&nbsp;</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Surat IMB</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>-</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 189px;\">\n<p>b.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Luas Bangunan</p>\n</td>\n<td style=\"width: 18px;\">\n<p>:</p>\n</td>\n<td style=\"width: 351.781px;\">\n<p>15X36 m<sup>2</sup></p>\n</td>\n</tr>\n</tbody>\n</table>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'identitas-sekolah', NULL, 5, '2019-09-30 20:13:38', '2019-09-30 13:46:09', NULL, NULL, 1, 1, 0, 0, 'false'),
(11, 'Sejarah Sekolah', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'sejarah-sekolah', NULL, 4, '2019-09-30 20:16:38', '2019-10-01 04:43:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 'Struktur Organisasi', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'struktur-organisasi', NULL, 0, '2019-09-30 20:18:10', '2019-09-30 13:18:10', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 'Kurikulum', '<p><strong>Struktur Kurikulum S</strong><strong>DIT TAHFIZH Al-MAKKI</strong><strong> TP 201</strong><strong>8</strong><strong>/201</strong><strong>9</strong></p>\n<table width=\"593\">\n<tbody>\n<tr>\n<td rowspan=\"2\" width=\"34\">\n<p><strong>NO</strong></p>\n</td>\n<td colspan=\"2\" rowspan=\"2\" width=\"279\">\n<p><strong>MATA PELAJARAN</strong></p>\n</td>\n<td colspan=\"6\" width=\"280\">\n<p><strong>KELAS &amp; ALOKASI WAKTU</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"53\">\n<p><strong>I</strong></p>\n</td>\n<td width=\"43\">\n<p><strong>II</strong></p>\n</td>\n<td width=\"43\">\n<p><strong>III</strong></p>\n</td>\n<td width=\"53\">\n<p><strong>IV</strong></p>\n</td>\n<td width=\"43\">\n<p><strong>V</strong></p>\n</td>\n<td width=\"43\">\n<p><strong>VI</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"34\">\n<p><strong>A</strong></p>\n</td>\n<td colspan=\"8\" width=\"559\">\n<p><strong>Kelompok A (Umum)</strong></p>\n</td>\n</tr>\n<tr>\n<td rowspan=\"6\" width=\"34\">\n<p>&nbsp;</p>\n</td>\n<td width=\"85\">\n<p>1</p>\n</td>\n<td width=\"193\">\n<p>Pendidikan Agama Islam</p>\n</td>\n<td rowspan=\"12\" width=\"53\">\n<p>TEMATIK KURIKULUM 2013</p>\n</td>\n<td colspan=\"2\" rowspan=\"12\" width=\"87\">\n<p>TEMATIK (KTSP)</p>\n</td>\n<td rowspan=\"12\" width=\"53\">\n<p>TEMATIK KURIKULUM 2013</p>\n</td>\n<td width=\"43\">\n<p>3</p>\n</td>\n<td width=\"43\">\n<p>3</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>2</p>\n</td>\n<td width=\"193\">\n<p>Pendidikan Kewarganegaraan</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>3</p>\n</td>\n<td width=\"193\">\n<p>Bahasa Indonesia</p>\n</td>\n<td width=\"43\">\n<p>5</p>\n</td>\n<td width=\"43\">\n<p>5</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>4</p>\n</td>\n<td width=\"193\">\n<p>Matematika</p>\n</td>\n<td width=\"43\">\n<p>6</p>\n</td>\n<td width=\"43\">\n<p>6</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>5</p>\n</td>\n<td width=\"193\">\n<p>Ilmu pengetahuan Alam</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>6</p>\n</td>\n<td width=\"193\">\n<p>Ilmu pengetahuan Sosial</p>\n</td>\n<td width=\"43\">\n<p>3</p>\n</td>\n<td width=\"43\">\n<p>3</p>\n</td>\n</tr>\n<tr>\n<td width=\"34\">\n<p><strong>B</strong></p>\n</td>\n<td colspan=\"2\" width=\"279\">\n<p><strong>Kelompok B (Umum)</strong></p>\n</td>\n<td width=\"43\">\n<p>&nbsp;</p>\n</td>\n<td width=\"43\">\n<p>&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td rowspan=\"2\" width=\"34\">\n<p>&nbsp;</p>\n</td>\n<td width=\"85\">\n<p>7</p>\n</td>\n<td width=\"193\">\n<p>SBDB</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>8</p>\n</td>\n<td width=\"193\">\n<p>Pendidikan Jasmani, olahraga dan Kesehatan</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n</tr>\n<tr>\n<td width=\"34\">\n<p><strong>C</strong></p>\n</td>\n<td width=\"85\">\n<p><strong>Muatan Lokal</strong></p>\n</td>\n<td width=\"193\">\n<p><strong>&nbsp;</strong></p>\n</td>\n<td width=\"43\">\n<p><strong>&nbsp;</strong></p>\n</td>\n<td width=\"43\">\n<p><strong>&nbsp;</strong></p>\n</td>\n</tr>\n<tr>\n<td rowspan=\"2\" width=\"34\">\n<p>&nbsp;</p>\n</td>\n<td width=\"85\">\n<p>1</p>\n</td>\n<td width=\"193\">\n<p>Budaya Melayu Riau</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>2</p>\n</td>\n<td width=\"193\">\n<p>Bahasa Inggris</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n</tr>\n<tr>\n<td colspan=\"3\" width=\"313\">\n<p><strong><u>Jumlah</u></strong></p>\n</td>\n<td width=\"53\">\n<p><strong><u>30</u></strong></p>\n</td>\n<td width=\"43\">\n<p><strong><u>31</u></strong></p>\n</td>\n<td width=\"43\">\n<p><strong><u>32</u></strong></p>\n</td>\n<td width=\"53\">\n<p><strong><u>36</u></strong></p>\n</td>\n<td width=\"43\">\n<p><strong><u>3</u></strong><strong><u>5</u></strong></p>\n</td>\n<td width=\"43\">\n<p><strong><u>3</u></strong><strong><u>5</u></strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"34\">\n<p><strong>D</strong></p>\n</td>\n<td colspan=\"8\" width=\"559\">\n<p><strong>Pengembangan diri</strong></p>\n</td>\n</tr>\n<tr>\n<td rowspan=\"7\" width=\"34\">\n<p><em><u>&nbsp;</u></em></p>\n</td>\n<td colspan=\"8\" width=\"559\">\n<p><strong>Pengembangan diri</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>1</p>\n</td>\n<td width=\"193\">\n<p>Tahfidz</p>\n</td>\n<td width=\"53\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"53\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>2</p>\n</td>\n<td width=\"193\">\n<p>Tahsin</p>\n</td>\n<td width=\"53\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"53\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n<td width=\"43\">\n<p>4</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>3</p>\n</td>\n<td width=\"193\">\n<p>Bahasa Arab</p>\n</td>\n<td width=\"53\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n<td width=\"53\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n<td width=\"43\">\n<p>2</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>4</p>\n</td>\n<td colspan=\"7\" width=\"473\">\n<p>Ekstrakurikuler :</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>&nbsp;</p>\n</td>\n<td width=\"193\">\n<p>1. Pramuka (wajib)</p>\n</td>\n<td width=\"53\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>*2</p>\n</td>\n<td width=\"53\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>-</p>\n</td>\n</tr>\n<tr>\n<td width=\"85\">\n<p>&nbsp;</p>\n</td>\n<td width=\"193\">\n<p>2. Beladiri (pilihan)</p>\n</td>\n<td width=\"53\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>*2</p>\n</td>\n<td width=\"53\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>*2</p>\n</td>\n<td width=\"43\">\n<p>-</p>\n</td>\n</tr>\n<tr>\n<td width=\"34\">&nbsp;</td>\n<td width=\"85\">&nbsp;</td>\n<td width=\"193\">&nbsp;</td>\n<td width=\"53\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"53\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n</tr>\n<tr>\n<td colspan=\"3\" width=\"313\">\n<p>Keterangan :</p>\n</td>\n<td width=\"53\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"53\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n</tr>\n<tr>\n<td width=\"34\">&nbsp;</td>\n<td width=\"85\">\n<p>1)</p>\n</td>\n<td colspan=\"3\" width=\"290\">\n<p>Kelas&nbsp; 1 dan 4 menggunakan kurikulum 2013</p>\n</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"53\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n</tr>\n<tr>\n<td width=\"34\">&nbsp;</td>\n<td width=\"85\">\n<p>2)</p>\n</td>\n<td colspan=\"3\" width=\"290\">\n<p>Kelas 2, 3, 5 dan 6 menggunakan kurikulum 2006</p>\n</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"53\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n<td width=\"43\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p><strong>&nbsp;</strong></p>\n<ol>\n<li><strong>Muatan Kurikulum</strong></li>\n</ol>\n<p>Muatan kurikulum SDIT Tahfizh Al-Makki terdiri dari:</p>\n<ul>\n<li>Mata Pelajaran;</li>\n<li>Muatan lokal;</li>\n<li>Kegiatan pengembangan diri;</li>\n<li>Pengaturan beban belajar;</li>\n<li>Ketuntasan belajar;</li>\n<li>Kenaikan kelas dan kelulusan;</li>\n<li>Pendidikan kecakapan hidup; dan</li>\n<li>Pendidikan berbasis keunggulan lokal dan global.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Adapun penjelasannya adalah sebagai berikut :</p>\n<ol>\n<li><strong><em>Mata Pelajaran</em></strong></li>\n<li><strong>Pendidikan Agama Islam</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Menumbuhkan akidah melalui pemberian, pemupukan dan pengembangan pengetahuan, penghayatan, pengalaman, embiasaan serta pengalaman peserta didik tentang agama islam sehingga menjadi manusia muslim yang terus berkembang keimanan dan ketaqwaannya kepada Allah SWT;</li>\n<li>Mewujudkan manusia Indonesia yang taat beragama dan berakhlak mulian yaitu manusia yang berpengetahuan, rajin ibadah, cerdas, produktif, jujur, adil, etis, berdisiplin, bertoleransi (tasamuh), menjaga keharmonisan secara personal dan sosial serta mengembangkan budaya agama dalam komunitas sekolah.</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran Pendidikan Agama Islam dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol>\n<li><strong>Pendidikan Kewarganegaraan</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Berpikir secara kritis, rasional, dan kreatif dalam menanggapi isu kewarganegaraan.</li>\n<li>Berpartisipasi secara aktif dan bertanggung jawab, dan bertindak secara cerdas dalam kegiatan bermasyarakat, berbangsa dan bernegara serta anti korupsi.</li>\n<li>Berkembang secara positif dan demokratis untuk membentuk diri berdasarkan karakter-karakter masyarakat Indonesia agar dapat hidup bersama dengan bangsa-bangsa lainnya.</li>\n<li>Berinteraksi dengan bangsa-bangsa lain dalam percaturan dunia secara langsung atau tidak langsung dengan memanfaatkan teknologi informasi dan komunikasi.</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran Pendidikan Kewarganegaraan dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol>\n<li><strong>Bahasa Indonesia</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Berkomunikasi secara efektif dan efisien sesuai dengan etika yang berlaku, baik secara lisan maupun tulis</li>\n<li>Menghargai dan bangga menggunakan bahasa Indonesia sebagai bahasa persatuan dan bahasa negara</li>\n<li>Memahami bahasa indonesia dan menggunakannya dengan tepat dan kreatif untuk berbagai tujuan</li>\n<li>Menggunakan bahasa Indonesia untuk meningkatkan kemampuan intelektual serta kematangan emosional dan sosial</li>\n<li>Menikmati dan memanfaatkan karya sastra untuk memperluas wawasan, memperhalus budi pekerti, serta meningkatkan pengetahuan dan kemampuan berbahasa</li>\n<li>Menghargai dan membanggakan sastra Indonesia sebagai khazanah budaya dan intelektual manusia I</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran Bahasa Indonesia dapat dilihat pada lampiran Peraturan Mentri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p><strong>&nbsp;</strong></p>\n<ol>\n<li><strong>Matematika </strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Memahami konsep matematika, menjelaskan keterkaitan antar konsep dan mengaplikasikan konsep atau algoritma, secara luwes, akurat, efisien dan tepat dalam pemecahan masalah.</li>\n<li>Menggunakan penalaran pada pola dan sifat, melakukan manipulasi matematika dalam membuat generalisasi, menyusun bukti, atau menjelaskan gagasan dan pernyataan matematika</li>\n<li>Memecahkan masalah yang meliputi kemampuan memahami masalah, merancang model matematika, menyelesaikan model dan menafsirkan solusi yang diperoleh</li>\n<li>Mengomunikasikan gagasan dengan simbol, tabel, diagram atau media lain untuk memperjelas keadaan atau masalah</li>\n<li>Memiliki sikap menghargai kegunaan matematika dalam kehidupan, yaitu memiliki rasa ingin tahu, perhatian, dan minat dalam mempelajari matematika, serta sikap ulet dan percaya diri dalam pemecahan masalah.</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran Matematika dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol>\n<li><strong>IPA</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Memperoleh keyakinan terhadap kebesaran Tuhan Yang Maha Esa berdasarkan keberadaan, keindahan dan keteraturan alam ciptaan-Nya</li>\n<li>Mengembangkan pengetahuan dan pemahaman konsep-konsep IPA yang bermanfaat dan dapat diterapkan dalam kehidupan sehari-hari</li>\n<li>Mengembangkan rasa ingin tahu, sikap positif dan kesadaran tentang adanya hubungan yang saling mempengaruhi antara IPA, lingkungan, teknologi dan masyarakat.</li>\n<li>Mengebangkan keterampilan proses untuk menyelidiki alam sekitar, memecahkan masalah dan membuat keputusan</li>\n<li>Meningkatkan kesadaran untuk berperan serta dalam memelihara, menjaga dan melestarikan lingkungan alam</li>\n<li>Meningkatkan kesadaran untuk menghargai alam dan segala keteraturannya sebagai salah satu cptaan Tuhan</li>\n<li>Memperoleh bekal pengetahuan, konsep dan ketrampilan IPA sebagai dasar untuk melanjutkan ke SMP/MTs.</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran IPA dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol>\n<li><strong>IPS</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Mengenal konsep-konsep yang berkaitan dengan kehidupan masyarakat dan lingkungannya</li>\n<li>Memiliki kemampuan dasar untuk berpikir logis dan kritis, rasa ingin tahu, inkuiri, memecahkan masalah, dan ketrampilan dalam kehidupan sosial</li>\n<li>Memiliki komitmen dan kesadaran terhadap nilai-nilai sosial dan kemanusiaan</li>\n<li>Memiliki kemampuan berkomunikasi, bekerjasama dan berkompetensi dalam masyarakat yang majemuk, di tingkat lokal, nasional, dan global</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran IPS dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol>\n<li><strong>Seni Budaya dan Ketrampilan</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Memahami konsep dan pentingnya seni budaya dan ketrampilan</li>\n<li>Menampilkan sikap apresiasi terhadap seni budaya dan ketrampilan</li>\n<li>Menampilkan kreatifitas melalui seni budaya dan ketrampilan</li>\n<li>Menampilkan peran serta dalam seni budaya dan ketrampilan dalam tingkat lokal, regional maupun global.</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran Seni Budaya dan Ketrampilan dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol>\n<li><strong>Pendidikan Jasmani, Olahraga, dan Kesehatan</strong></li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Mengembangkan ketrampilan pengelolaan diri dalam upaya pengembangan dan pemeliharaan kebugaran jasmani serta pola hidup sehat melalui berbagai aktifitas jasmani dan olahraga yang terpilih</li>\n<li>Meningkatkan pertumbuhan fisik dan pengembangan psikis yang lebih baik</li>\n<li>Meningkatkan kemampuan dan keterampilan gerak dasar</li>\n<li>Meletakan landasan karakter moral yang kuat melalui internalisasi nilai-nilai yang terkandung di dalam pendidikan jasmani, olahraga dan kesehatan</li>\n<li>Mengembangkan sikap sportif, jujur, disiplin, bertanggungjawab, kerjasama, percaya diri dan demokratis</li>\n<li>Mengembangkan ketrampilan untuk menjaga keselamatan diri sendiri, orang lain dan lingkungan</li>\n<li>Memahami konsep aktifitas jasmani dan olahraga di lingkungan yang bersih sebagai informasi untuk mencapai pertumbuhan fisik yang sempurna, pola hidup sehat dan kebugaran, terampil, serta memiliki sikap yang positif.</li>\n</ul>\n<p>Standar Kompetensi dan Kompetensi Dasar mata pelajaran Pendidikan Jasmani, Olah Raga, dan Kesehatan dapat dilihat pada lampiran Peraturan Menteri Pendidikan Nasional Nomor 22 Tahun 2006 untuk kurikulum 2006, sedangkan kurikulum 2013 menurut Peraturan Menteri Pendidikan dan Kebudayaan No 24 Tahun 2016.</p>\n<p>&nbsp;</p>\n<ol start=\"2\">\n<li><strong><em>Muatan Lokal</em></strong></li>\n</ol>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Muatan lokal merupakan kegiatan kurikuler untuk mengembangkan kompetensi yang disesuaikan dengan ciri khas dan potensi daerah, termasuk keunggulan daerah, yang materinya tidak dapat dikelompokan ke dalam mata pelajaran yang ada.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Substansi muatan lokal ditentukan oleh sekolah. Sekolah dapat menyelenggarakan satu mata pelajaran muatan lokal setiap semester atau dua mata pelajaran muatan lokal dalam satu tahun.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Muatan lokal yang menjadi ciri khas dan diterapkan di SDIT Tahfizh Al-Makki disesuaikan dengan ciri khas sekolah, pemerintah propinsi daerah Riau dan pemberian bekal keterampilan teknologi serta komunikasi global. Adapun muatan lokal yang diselenggarakan di SDIT Tahfizh Al-Makki adalah sebagai berikut :</p>\n<p>&nbsp;</p>\n<ol>\n<li>Bahasa Arab</li>\n</ol>\n<p>Muatan lokal Bahasa Arab wajib bagi semua siswa kelas I hingga kelas VI. Alokasi waktu yang diperlukan untuk kelas I-VI adalah 2 jam pelajaran.</p>\n<ol start=\"2\">\n<li>Bahasa Inggris</li>\n</ol>\n<p>Muatan lokal Bahasa Inggris wajib bagi semua siswa kelas I hingga kelas VI. Alokasi waktu yang diperlukan untuk kelas I-VI adalah 2 jam pelajaran.</p>\n<p>&nbsp;</p>\n<ol>\n<li>Bahasa Arab</li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Mengembangkan kemampuan dan ketrampilan berkomunikasi siswa dengan menggunakan bahasa Arab.</li>\n<li>Sebagai penujang kegiatan tahsin dan tahfizh Al-Qur&rsquo;an.</li>\n</ul>\n<ol start=\"2\">\n<li>Bahasa Inggris</li>\n</ol>\n<p>Tujuan :</p>\n<ul>\n<li>Mengenalkan bahasa Inggris sebagai bahasa komunikasi internasional</li>\n<li>Membekali siswa untuk menghadapi tuntutan dalam rangka menyongsong era globalisasi</li>\n</ul>\n<p>&nbsp;</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Berikut adalah tabel alokasi waktu untuk mata pelajaran muatan lokal yang di selenggarakan SDIT Tahfizh Al-Makki.</p>\n<p><strong>Tabel 2. Alokasi Waktu Mata Pelajaran Muatan Lokal</strong></p>\n<p><strong>&nbsp;</strong></p>\n<table width=\"513\">\n<tbody>\n<tr>\n<td rowspan=\"2\" width=\"35\">\n<p><strong>No</strong></p>\n</td>\n<td rowspan=\"2\" width=\"205\">\n<p><strong>Mata Pelajaran Muatan Lokal</strong></p>\n</td>\n<td colspan=\"6\" width=\"273\">\n<p><strong>Kelas dan Alokasi Waktu</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"46\">\n<p><strong>I</strong></p>\n</td>\n<td width=\"46\">\n<p><strong>II</strong></p>\n</td>\n<td width=\"46\">\n<p><strong>III</strong></p>\n</td>\n<td width=\"46\">\n<p><strong>IV</strong></p>\n</td>\n<td width=\"46\">\n<p><strong>V</strong></p>\n</td>\n<td width=\"46\">\n<p><strong>VI</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"35\">\n<p><strong>1</strong></p>\n</td>\n<td width=\"205\">\n<p>Bahasa Arab</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n</tr>\n<tr>\n<td width=\"35\">\n<p><strong>2</strong></p>\n</td>\n<td width=\"205\">\n<p>Bahasa Inggris</p>\n</td>\n<td width=\"46\">\n<p>2 jam</p>\n</td>\n<td width=\"46\">\n<p>2 jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n<td width=\"46\">\n<p>2</p>\n<p>jam</p>\n</td>\n</tr>\n<tr>\n<td width=\"35\">&nbsp;</td>\n<td width=\"205\">\n<p><strong>Jumlah</strong></p>\n</td>\n<td width=\"46\">\n<p>4 jam</p>\n</td>\n<td width=\"46\">\n<p>4 jam</p>\n</td>\n<td width=\"46\">\n<p>4 jam</p>\n</td>\n<td width=\"46\">\n<p>4 jam</p>\n</td>\n<td width=\"46\">\n<p>4 jam</p>\n</td>\n<td width=\"46\">\n<p>4 jam</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<ol start=\"3\">\n<li><strong>Pengembangan Diri</strong></li>\n</ol>\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Pengembangan diri adalah kegiatan yang bertujuan memberikan kesempatan kepada peserta didik untuk mengembangkan dan mengekspresikan diri sesuai dengan kebutuhan, bakat, minat, setiap peserta didik sesuai dengan kondisi sekolah. Kegiatan pengembangan diri difasilitasi dan/atau dibimbing oleh konselor, guru atau tenaga kependidikan yang dapat dilakukan dalam bentuk kegiatan ekstrakurikuler.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kegiatan pengembangan diri dilakukan dalam bentuk 3 (tiga) kegiatan yaitu : kegiatan pengembangan Minat dan Bakat (ekstrakurikuler), bimbingan dan konseling dan kegiatan pembiasaan.</p>\n<ol>\n<li><em>Kegiatan Pengembangan Minat dan Bakat (ekstrakurikuler)</em></li>\n</ol>\n<p>Kegiatan ekstrakurikuler SDIT Tahfzh Al-Makki dibagi dalam dua kelompok, yaitu :</p>\n<ol>\n<li>Ekstrakurikuler wajib, adalah pramuka (semua kelas).</li>\n<li>Ekstrakurikuler pilihan, yang meliputi :</li>\n<li>Beladiri</li>\n<li>Tahfizh</li>\n<li>Tilawah</li>\n</ol>\n<p>Adapun tujuan dan program ekstrakurikuler wajib dapat dijelaskan sebagai berikut :</p>\n<ol>\n<li><strong><em>Pramuka</em></strong></li>\n</ol>\n<p>Tujuan ekstrakurikuler pramuka adalah :</p>\n<ul>\n<li>Mengembangkan kemampuan siswa dalam berorganisasi</li>\n<li>Melatih siswa untuk terampil dan mandiri</li>\n<li>Melatih siswa untuk mempertahankan diri.</li>\n<li>Melatih siswa untuk memiliki jiwa sosial dan peduli kepada orang lain</li>\n<li>Memiliki sikap kerjasama kelompok.</li>\n<li>Dapat menyelesaikan permasalahan dengan cepat.</li>\n</ul>\n<p>&nbsp;</p>\n<p><em>Program dan target Pramuka</em></p>\n<ul>\n<li>Tingkat Siaga</li>\n</ul>\n<ol>\n<li>Materi Kemampuan Dasar</li>\n</ol>\n<ul>\n<li>Hafal dan mengerti isi Dwi Darma dan Dwi Satya</li>\n<li>Praktik Pengamalan Dwi Darma dan Dwi Satya</li>\n<li>Pembiasaan tertib sholat lima waktu</li>\n<li>Dapat mengibarkan bendera merah putih</li>\n<li>Dapat menyanyikan lagu Kebangsaan RI</li>\n<li>Dapat melakukan baris berbaris</li>\n<li>Mengetahui nama Negara dan Ibukota Republik Indonesia.</li>\n<li>Dapat melakukan tata upacara pembukaan dan penutupan latihan.</li>\n</ul>\n<ol>\n<li>Materi permainan</li>\n</ol>\n<ul>\n<li>Melakukan permainan ketangkasan</li>\n<li>Melakukan permainan penyegaran.</li>\n<li>Melakukan aneka tepuk.</li>\n<li>Merangkai gambar/peta.</li>\n<li>Menyanyikann aneka lagu kepramukaan.</li>\n</ul>\n<ol>\n<li>Materi Keterampilan</li>\n</ol>\n<ul>\n<li>Memelihara kebersihan rumah, sekolah dan tempat ibadah</li>\n<li>Dapat menyampaikan berita secara lisan..</li>\n<li>Membbuat hasta karya.</li>\n<li>Tali temali dasar.</li>\n<li>Teknik pertolongan pertama pada kecelakaan.</li>\n<li>Dapat memberi salam Pramuka.</li>\n<li>Membiasakan berpakaian rapi lengkap dengan atributnya.</li>\n<li>Membiasakan hidup hemat dengan menabung.</li>\n<li>Tingkat Penggalang</li>\n</ul>\n<ol>\n<li>Materi Kemampuan Dasar</li>\n</ol>\n<ul>\n<li>Hafal dan mengerti isi Dasa Darma dan Tri Satya.</li>\n<li>Praktik pengamalan Dasa Darma dan Tri Satya</li>\n<li>Membiasakan diri tertib sholat lima waktu.</li>\n<li>Mengetahui arti kiasan Lambang Pramuka.</li>\n<li>Pengetahuan Dasar P3K dan aplikasinya.</li>\n<li>Dapat menggunakkan dan mengibarkan bendera kebangsaan Indonesia.</li>\n<li>Dapat melaksanakan tata upacara pembukaan dan penutupan upacara latihan.</li>\n<li>Dapat mempraktikan Peraturan Baris Berbaris dengan formasinya.</li>\n</ul>\n<ol>\n<li>Materi Permainan Pramuka</li>\n</ol>\n<ul>\n<li>Melakukan permainan ketangkasan.</li>\n<li>Melakukan permainan penyegaran.</li>\n<li>Melakukan permainan kekompakan.</li>\n<li>Menyanyikan aneka lagu Pramuka.</li>\n</ul>\n<ol>\n<li>Materi Keterampilan</li>\n</ol>\n<ul>\n<li>Memberi dan mengirim berita Morse.</li>\n<li>Memberi dan mengirim berita Semaphore.</li>\n</ul>\n<p>&nbsp;</p>\n<ol start=\"2\">\n<li><strong><em>Bimbingan dan Konseling</em></strong></li>\n</ol>\n<p>Tujuan Bimbingan dan Konseling</p>\n<ul>\n<li>Terpenuhinya tugas-tugas perkembangan siswa dalam setiap tahap perkembangan mereka.</li>\n<li>Pengenalan diri dan lingkungan pengembangan diri dan arah karir, serta masa depan siswa.</li>\n<li>Terlaksananya bidang tugas perkembangan yang mencakup bimbingan pribadi, sosial, belajar dann karir.</li>\n</ul>\n<ol>\n<li><em>Kegiatan Pokok Bimbingan dan Konseling</em></li>\n</ol>\n<ul>\n<li>Kegiatan Layanan</li>\n</ul>\n<p>Kegiatan Bimbingan dan Konseling di SDIT Tahfizh Al-Makki diselenggarakan melalui berbagai bentuk layanan, antara lain sebagai berikut :</p>\n<ul>\n<li>Layanan Informasi</li>\n<li>Layanan pembelajaran</li>\n<li>Layanan konseling perorangan</li>\n<li>Layanan konsultasi</li>\n<li>Kegiatan Pendukung</li>\n</ul>\n<p>Sejumlah kegiatan pendukung kelancaran dan keberhasilan layanan bimbingan dan konseling, yaitu :</p>\n<ul>\n<li>Himpunan data</li>\n<li>Kunjungan rumah</li>\n<li>Alih tangan kasus</li>\n</ul>\n<ol>\n<li><em>Uraian Kompetensi</em></li>\n</ol>\n<p>Kompetensi yang menjadi Sasaran bimbingan dan konseling berorientasi pada tugas perkembangan yang meliputi :</p>\n<ul>\n<li>Menanamkan dan mengembangkan kebiasaan serta sikap dalam beriman dan bertaqwa terhadap Allah SWT.</li>\n<li>Mengembangkan keterampilan dasar dalam membaca, menulis, dan berhitung.</li>\n<li>Mengembangkan konsep-konsep yang perlu dalam kehidupan sehari-hari.</li>\n<li>Belajar bergaul dan bekerja dengan kelompok sebaya</li>\n<li>Belajar menjadi pribadi mandiri.</li>\n<li>Mempelajari ketrampilan fisik, sederhana yang diperlukan baik untuk permainan maupun kehidupan.</li>\n<li>Mengembangkan kata hati, moral, nilai-nilai sebagai pedoman perilaku.</li>\n<li>Membina hidup sehat, untuk diri sendiri dan lingkungan serta keindahan.</li>\n<li>Mengembangkan siikap sosial terhadap kelompok, lembaga sosial, serta masa depan.</li>\n</ul>\n<p>&nbsp;</p>\n<ol start=\"3\">\n<li><strong><em>Pembiasaan </em></strong></li>\n</ol>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pembiasaan merupakan proses pembentukan sikap dan perilakku yang relatif menetap dan bersifat otomatis melalui proses pembelajaran yang berulang-ulang dan dilaksanakan di luar jam pelajaran.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pembiasaan merupakan bagian dari pendidikan budi pekerti dengan ciri-ciri sebagai berikut : relatif menetap, tidak memerlukan fungsi berpikir yang cukup tinggi, sebagai hasil pengalaman belajar tampil secara berulang-ulang sebagai respons terhadap stimulus yang sama.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kegiatan pembiasaan di SDIT Tahfizh Al-Makki meliputi :</p>\n<ol>\n<li>Kegiatan rutin adalah kegiatan yang dilakukan secara reguler, dengan tujuan untuk membentuk kebiasaan siswa mengerjakan sesuatu dengan baik. Kegiatan rutin meliputi :</li>\n</ol>\n<ul>\n<li>Berjabat tangan</li>\n<li>Sholat berjamaah</li>\n<li>Berdoa setiap hari, baik di awal dan akhir pelajaran maupun setelah sholat.</li>\n<li>Kontrol kegiatan sehari-hari di rumah (mutaba&rsquo;ah yaumiah)</li>\n<li>Membaca Al-Quran ataupun Iqro jilid 1 sampai jilid 6.</li>\n<li>Upacara setiap hari Senin.</li>\n<li>Membersihkan kelas dengan jadwal piket.</li>\n<li>Senam dihari Rabu</li>\n<li>Pemeriksaan kesehatan</li>\n<li>Mengunjungi perpustakaan.</li>\n<li>Jum&rsquo;at bersih</li>\n<li>Infaq Jum&rsquo;at</li>\n<li>Sholat dhuha</li>\n</ul>\n<ol>\n<li>Kegiatan spontan adalah kegiatan yang tidak ditentukan tempat dan waktunya. Kegiatan ini bertujuan untuk menanamkan kebiasaan pada saat itu, terutama disiplin dan sopan santun meliputi :</li>\n</ol>\n<ul>\n<li>Memberi salam dan berjabat tangan</li>\n<li>Membiasakan mengucapkan tolong, maaf, permisi dan terima kasih.</li>\n<li>Membuang sampah pada tempatnya.</li>\n<li>Membiasakan budaya antri.</li>\n<li>Membiasakan busaya disiplin dan tertib.</li>\n</ul>\n<ol>\n<li>Kegiatan teladan adalah kegiatan dengan pemberian contoh dari guru dan tenaga pendidik yang lain kepada siswa. Kegiatan teladan meliputi : disiplin, jujur, ulet, hidup sederhana, suka menolong, berkata santun dan bersikap sopan, peduli lingkungan dan sosial dan sebagainya.</li>\n<li>Kegiatan terprogram yaitu kegiatan yang direncanakan dengan maksud untuk mendukung kegiatan pembiasaan terhadap siswa. Kegiatan ini meliputi : kunjungan, kultum, lomba dan sebagainya.</li>\n</ol>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'kurikulum', NULL, 0, '2019-09-30 20:25:36', '2019-09-30 13:25:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 'Sarana dan Prasarana', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'sarana-dan-prasarana', NULL, 0, '2019-09-30 20:28:43', '2019-09-30 13:58:51', NULL, NULL, 1, 1, 0, 0, 'false'),
(16, 'Prestasi Sekolah', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'prestasi-sekolah', NULL, 2, '2019-09-30 20:47:26', '2019-09-30 13:59:20', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pendidikan merupakan tiket untuk masa depan. Hari esok untuk orang-orang yang telah mempersiapkan dirinya hari ini', 'Syahri Ramadhan, S.Psi., M.S.I', '2019-04-01 08:26:41', '2019-07-10 11:04:14', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Agama tanpa ilmu pengetahuan adalah buta. Dan ilmu pengetahuan tanpa agama adalah lumpuh', 'Syahri Ramadhan, S.Psi., M.S.I', '2019-04-01 08:26:41', '2019-07-10 11:04:23', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Hiduplah seakan-akan kau akan mati besok. Belajarlah seakan-akan kau akan hidup selamanya', 'Syahri Ramadhan, S.Psi., M.S.I', '2019-04-01 08:26:41', '2019-07-10 11:04:31', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT '0',
  `scholarship_type` bigint(20) DEFAULT '0',
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text,
  `setting_default_value` text,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2019-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', 'Website Resmi Sekolah Dasar Islam Terpadu Al-Makki', 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2019-04-01 08:26:40', '2019-07-13 06:28:59', NULL, NULL, 0, 1, 0, 0, 'false'),
(6, 'general', 'meta_keywords', 'Website Resmi Sekolah Dasar Islam Terpadu Al-Makki, Website Resmi SD IT Tahfizh Al Makki, Website Resmi SDIT Tahfizh Al Makki, Sekolah Dasar Islam Terpadu Al-Makki, SD IT Tahfizh Al Makki, SDIT Tahfizh Al Makki', 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2019-04-01 08:26:40', '2019-07-13 06:30:47', NULL, NULL, 0, 1, 0, 0, 'false'),
(7, 'general', 'google_map_api_key', NULL, 'AIzaSyDmiycFxzYZ37FOwA4wqSbL3z2YvIYIArw', 'public', 'API Key Google Map', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'general', 'latitude', '0.3750614', '-6.2407311', 'public', 'Latitude', '2019-04-01 08:26:40', '2019-07-10 11:00:10', NULL, NULL, 0, 1, 0, 0, 'false'),
(9, 'general', 'longitude', '101.4669332', '106.9972892', 'public', 'Longitude', '2019-04-01 08:26:40', '2019-07-10 11:00:31', NULL, NULL, 0, 1, 0, 0, 'false'),
(10, 'general', 'favicon', 'a05ab930d641beb6fd4afdba47fafaa0.jpg', 'favicon.png', 'public', 'Favicon', '2019-04-01 08:26:40', '2019-07-10 10:59:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public', 'Time Zone', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'media', 'file_allowed_types', 'jpg, jpeg, png, gif, pdf', 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2019-04-01 08:26:40', '2019-07-10 10:49:48', NULL, NULL, 0, 1, 0, 0, 'false'),
(17, 'media', 'upload_max_filesize', '1024000', '0', 'public', 'Maksimal Ukuran File yang Diupload', '2019-04-01 08:26:40', '2019-07-10 10:51:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(18, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'image_slider_height', '400', '400', 'public', 'Tinggi Gambar Slide', '2019-04-01 08:26:40', '2019-07-31 14:42:24', NULL, NULL, 0, 1, 0, 0, 'false'),
(29, 'media', 'image_slider_width', '800', '900', 'public', 'Lebar Gambar Slide', '2019-04-01 08:26:40', '2019-07-31 14:42:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(30, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'media', 'logo_height', '300', '120', 'public', 'Tinggi Logo Sekolah', '2019-04-01 08:26:40', '2019-07-10 11:31:11', NULL, NULL, 0, 1, 0, 0, 'false'),
(39, 'media', 'logo_width', '600', '120', 'public', 'Lebar Logo Sekolah', '2019-04-01 08:26:40', '2019-07-10 11:31:39', NULL, NULL, 0, 1, 0, 0, 'false'),
(40, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'social_account', 'facebook', 'https://www.facebook.com/syahri.ramadhan.10048379', '', 'public', 'Facebook', '2019-04-01 08:26:40', '2019-07-18 06:08:59', NULL, NULL, 0, 1, 0, 0, 'false'),
(59, 'social_account', 'twitter', 'https://twitter.com/ItMakki', '', 'public', 'Twitter', '2019-04-01 08:26:40', '2019-07-18 06:25:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(60, 'social_account', 'linked_in', '-', '', 'public', 'Linked In', '2019-04-01 08:26:40', '2019-07-18 05:12:44', NULL, NULL, 0, 1, 0, 0, 'false'),
(61, 'social_account', 'youtube', 'https://www.youtube.com/channel/UCQYMpSpGVtDT3TwHdb__HXQ', '', 'public', 'Youtube', '2019-04-01 08:26:40', '2019-07-18 05:10:41', NULL, NULL, 0, 1, 0, 0, 'false'),
(62, 'social_account', 'instagram', '-', '', 'public', 'Instagram', '2019-04-01 08:26:40', '2019-07-18 06:26:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(63, 'mail_server', 'sendgrid_username', NULL, '', 'public', 'Sendgrid Username', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'mail_server', 'sendgrid_password', NULL, '', 'public', 'Sendgrid Password', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'mail_server', 'sendgrid_api_key', NULL, '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', 'public', 'Sendgrid API Key', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'school_profile', 'npsn', '69920592', '123', 'public', 'NPSN', '2019-04-01 08:26:40', '2019-07-10 10:54:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'school_name', 'SD IT Tahfizh Al Makki', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2019-04-01 08:26:40', '2019-07-10 10:56:22', NULL, NULL, 0, 1, 0, 0, 'false'),
(68, 'school_profile', 'headmaster', 'Syahri Ramadhan, S.Psi., M.S.I', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2019-04-01 08:26:40', '2019-07-10 10:53:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(69, 'school_profile', 'headmaster_photo', '602ae87f3df5a1d71adb3fbeec73da58.jpg', 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2019-04-01 08:26:40', '2019-09-30 13:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'school_profile', 'school_level', '96', '3', 'public', 'Bentuk Pendidikan', '2019-04-01 08:26:40', '2019-07-10 10:55:35', NULL, NULL, 0, 1, 0, 0, 'false'),
(71, 'school_profile', 'school_status', '2', '1', 'public', 'Status Sekolah', '2019-04-01 08:26:40', '2019-07-10 10:56:32', NULL, NULL, 0, 1, 0, 0, 'false'),
(72, 'school_profile', 'ownership_status', '109', '1', 'public', 'Status Kepemilikan', '2019-04-01 08:26:40', '2019-07-10 10:54:27', NULL, NULL, 0, 1, 0, 0, 'false'),
(73, 'school_profile', 'decree_operating_permit', '421/KPTS/P Dan K-DIKDAS/9524', '-', 'public', 'SK Izin Operasional', '2019-04-01 08:26:40', '2019-07-10 04:04:16', NULL, NULL, 0, 1, 0, 0, 'false'),
(74, 'school_profile', 'decree_operating_permit_date', '2015-08-14', '2019-04-01', 'public', 'Tanggal SK Izin Operasional', '2019-04-01 08:26:40', '2019-07-10 04:04:44', NULL, NULL, 0, 1, 0, 0, 'false'),
(75, 'school_profile', 'tagline', 'Utamakan Akhlak Daripada Ilmu', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2019-04-01 08:26:40', '2019-07-10 10:58:01', NULL, NULL, 0, 1, 0, 0, 'false'),
(76, 'school_profile', 'rt', '3', '12', 'public', 'RT', '2019-04-01 08:26:40', '2019-07-10 10:55:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(77, 'school_profile', 'rw', '4', '06', 'public', 'RW', '2019-04-01 08:26:40', '2019-07-10 10:55:27', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'sub_village', '-', 'Wage', 'public', 'Dusun', '2019-04-01 08:26:40', '2019-07-10 10:58:26', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'village', 'Kubang Jaya', 'Kadugede', 'public', 'Kelurahan / Desa', '2019-04-01 08:26:40', '2019-07-10 10:58:54', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'sub_district', 'Siak Hulu', 'Kadugede', 'public', 'Kecamatan', '2019-04-01 08:26:40', '2019-07-10 10:57:34', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'district', 'Kampar', 'Kuningan', 'public', 'Kabupaten', '2019-04-01 08:26:40', '2019-07-10 04:05:02', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'school_profile', 'postal_code', '28452', '45561', 'public', 'Kode Pos', '2019-04-01 08:26:40', '2019-07-10 10:55:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'street_address', 'Jalan Teropong Ujung', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2019-04-01 08:26:40', '2019-07-10 10:57:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(84, 'school_profile', 'phone', '0813 7263 8157', '0232123456', 'public', 'Telepon', '2019-04-01 08:26:40', '2019-07-10 10:54:54', NULL, NULL, 0, 1, 0, 0, 'false'),
(85, 'school_profile', 'fax', '0', '0232123456', 'public', 'Fax', '2019-04-01 08:26:40', '2019-07-10 04:06:57', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'email', 'sdit.tahfizh.almakki@gmail.com', 'info@sman9kuningan.sch.id', 'public', 'Email', '2019-04-01 08:26:40', '2019-07-10 04:06:51', NULL, NULL, 0, 1, 0, 0, 'false'),
(87, 'school_profile', 'website', 'sdit.tahfizh.almakki.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2019-04-01 08:26:40', '2019-07-10 10:59:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(88, 'school_profile', 'logo', '62c801842101386b24712b23c2cddb47.jpg', 'logo.png', 'public', 'Logo', '2019-04-01 08:26:40', '2019-07-10 11:32:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'admission', 'admission_status', NULL, 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'admission', 'admission_year', NULL, '2019', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'admission', 'admission_start_date', NULL, '2019-01-01', 'public', 'Tanggal Mulai PPDB', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'admission', 'admission_end_date', NULL, '2019-12-31', 'public', 'Tanggal Selesai PPDB', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'admission', 'announcement_start_date', NULL, '2019-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'admission', 'announcement_end_date', NULL, '2019-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT '0' COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT '0' COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT '0' COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni ?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan / KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT '0',
  `special_need_id` bigint(20) DEFAULT '0' COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT '0' COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT '0' COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT '0',
  `father_employment_id` bigint(20) DEFAULT '0',
  `father_monthly_income_id` bigint(20) DEFAULT '0',
  `father_special_need_id` bigint(20) DEFAULT '0',
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT '0',
  `mother_employment_id` bigint(20) DEFAULT '0',
  `mother_monthly_income_id` bigint(20) DEFAULT '0',
  `mother_special_need_id` bigint(20) DEFAULT '0',
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT '0',
  `guardian_employment_id` bigint(20) DEFAULT '0',
  `guardian_monthly_income_id` bigint(20) DEFAULT '0',
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(3) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(3) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(2) DEFAULT '0' COMMENT 'Jumlah Saudara Kandng',
  `student_status_id` bigint(20) DEFAULT '0' COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '1', '0116509580', '1471102801110001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ABDULLAH ALKAUTSAR ARDI', 'M', 'PEKANBARU', '2011-01-28', 89, 23, 'Jl. Damai No 09', '2', '11', '', 'Rejo Sari', 'Kec. Tenayan Raya', '', '', 74, 80, '', '082172338774', 'q@a.com', '', '', '', '', '', 'WNI', 'Indonesia', 'ARDI LUBIS', 1985, 46, 15, 68, 23, 'IDA AZRIDA', 1985, 49, 10, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-10 23:20:22', '2019-07-10 16:20:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '012', '0072189053', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ABDULLAH SAID AL MUBARAK', 'M', 'Kubang', '2007-05-19', 89, 23, 'Perum Putra Kubang Permai L25', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'a@v.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Asyura Bin Mustahfa', 1971, 46, 18, 68, 23, 'Nurul Azizah', 1969, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 10:48:18', '2019-07-12 03:48:18', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '001', '0087778998', '1405026306090005', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'AFNAN KARIMAH EL-GUMANTI', 'F', 'Cairo', '2008-06-23', 89, 23, 'Garuda', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'a@u.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Hendra Gumanti', 1983, 50, 18, 68, 23, 'Mega Maya', 1984, 50, 18, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 10:54:05', '2019-07-12 03:54:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '4', '0109146660', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'AHMAD FAIZ SYAHRUL SYAM', 'M', 'PEKANBARU', '2010-10-07', 89, 23, 'DUSUN III BENCAH PUDU PERMAI', '', '', 'DUSUN III BENCAH PUDU PERMAI', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '082165260871', 'a@t.com', '', '', '', '', '', 'WNI', 'Indonesia', 'ASEP ANSHORI', 1983, 42, 10, 68, 23, 'YUSNELLI', 1983, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:07:48', '2019-07-12 04:07:48', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '011', '0073345445', '1471082108070042', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ALIEF HAFIIZ ZAHDI', 'M', 'Pekanbaru', '2007-08-21', 89, 23, 'Teropong Perum GMA Blok A No.18', '', '', '', 'Teropong', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'v@v.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Iswandi', 1975, 46, 18, 68, 23, 'Roza Jenita Anuarni', 1982, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:13:32', '2019-07-12 04:13:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '003', '0071265395', '1308040411070003', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ANDIKA ANSHARI', 'M', 'Pekanbaru', '2007-11-04', 89, 23, 'Kubang Raya', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'm@m.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Erizal', 1971, 46, 19, 68, 23, 'Widya Astuti', 1978, 44, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:17:53', '2019-07-12 04:17:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(7, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '7', '0119500130', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ANINDYA HUSNA', 'F', 'PEKANBARU', '2011-08-28', 89, 23, 'PERUM GRIYA CANTIKA PERMAI', '', '', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '085244870689', 'c@l.com', '', '', '', '', '', 'WNI', 'Indonesia', 'MUHAMMAD MUKHLIS', 1971, 42, 10, 68, 23, 'RIKA MARTINI', 1971, 42, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:22:39', '2019-07-12 04:22:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(8, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '8', NULL, '1471085207110009', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ASMA\' NAJMA \'ALIYA', 'F', 'PEKANBARU', '2011-07-12', 89, 23, 'Jl. EKA SARI', '1', '1', '', 'SIDOMULYO BARAT', 'Kec. Tampan', 'Kampar', '', 74, 80, '', '', 'q@z.com', '', '', '', '', '', 'WNI', 'Indonesia', 'ADE CANDOKO', 1984, 50, 22, 68, 23, 'MAISAL FITRI', 1985, 50, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:27:21', '2019-07-12 04:27:21', NULL, NULL, 1, 0, 0, 0, 'false'),
(9, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '030', '0086997015', '1471076811080003', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ASYIFA AZRIANI', 'F', 'Pekanbaru', '2008-11-18', 89, 23, 'Amal Ikhlas No.06B', '5', '3', '', 'Simpang Tiga', 'Kec. Bukit Raya', 'Kampar', '', 74, 81, '', '081378444568', 't@c.com', '', '', '', '', '', 'WNI', 'Indonesia', 'AZWIR', 1980, 47, 14, 68, 23, 'SRI WAHYUNI', 1982, 47, 15, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:31:51', '2019-07-12 04:31:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '10', '0093577251', '1471014401090002', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'AURANISA INAYAH', 'F', 'Pekanbaru', '2009-01-04', 89, 23, 'Teratai No.117', '1', '2', '', 'Pulau Kampar', 'Kec. Sukajadi', 'Kampar', '28127', 74, 81, '', '081275655633', 'x@o.com', '', '', '', '', '', 'WNI', 'Indonesia', 'INDRA KISWA', 1984, 46, 15, 68, 23, 'RUQOYYAH', 1980, 46, 22, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:36:35', '2019-07-12 04:36:35', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '11', '0118150066', '1471107200511002', NULL, NULL, 'false', 'true', NULL, NULL, NULL, '', '', 'AZZAM REZKY NALDI', 'M', 'PEKANBARU', '2011-05-20', 89, 23, 'Jl. AUR KUNING NO. 181', '1', '3', '', 'SIMPANG TIGA', 'Kec. Bukit Raya', 'Kampar', '', 74, 80, '', '081371775572', 'm@b.com', '', '', '', '', '', 'WNI', 'Indonesia', 'YUNALDI', 1983, 46, 15, 68, 23, 'DESI RATNA SARI', 1986, 49, 15, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 11:40:47', '2019-07-12 04:40:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(12, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '013', '0085081508', '1471090701080022', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'BINTANG DWI ANUGRAH', 'M', 'Pekanbaru', '2008-07-01', 89, 23, 'Garuda', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'v@k.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Syafrizal', 1983, 46, 18, 68, 23, 'Helen Eka Puspita', 1983, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:04:42', '2019-07-12 14:04:42', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '13', '0106475710', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'Chiko Kurniawan', 'M', 'Kubang', '2010-05-13', 89, 23, 'Cendrawasi 2', '3', '2', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 81, '', '085355593857', 'a@l.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Gunawan', 1974, 42, 18, 70, 23, 'Reni Posla', 1975, 42, 22, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:09:13', '2019-07-12 14:09:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '14', '0086317217', '1401162411090001', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'DAFA DWI NOFANDI', 'M', 'Pekanbaru', '2008-11-24', 89, 23, 'Perumah Pagar Nusa Lima', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'j@a.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Nofriandi', 1974, 42, 15, 68, 23, 'Melly Miarti', 1974, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:13:36', '2019-07-12 14:13:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '15', NULL, NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'DZAKI ARIFIN JIDAN', 'M', 'PEKANBARU', '2009-01-02', 89, 23, 'PERUM PAGAR NUSA LIMA', '', '', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'a@p.com', '', '', '', '', '', 'WNI', 'Indonesia', 'M MUKHLIS', 1985, 46, 15, 68, 23, 'RIKA MARTINI', 1986, 46, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:32:28', '2019-07-12 14:32:28', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '16', '0109560993', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'FATIHUL IBAD ZADAFI', 'M', 'PEKANBARU', '2010-07-21', 89, 23, 'JL SUDIRMAN GG MESJID ASSA\'ADAH NO 6', '', '', '', 'CINTA RAJA', 'Kec. Sail', 'Kampar', '', 74, 80, '', '085274797278', 'l@c.com', '', '', '', '', '', 'WNI', 'Indonesia', 'FITRIZAL', 1985, 42, 10, 68, 23, 'NELFI', 1985, 42, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:37:01', '2019-07-12 14:37:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '17', '0111065056', '1401065501110002', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'HAQIZA SYAFARINA AZZAHRA', 'M', 'PEKANBARU', '2011-01-15', 89, 23, 'DUSUN III BENCAH PUDU PERMAI', '3', '2', 'DUSUN III BENCAH PUDU PERMAI', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '082272390846', 'aa@aa.com', '', '', '', '', '', 'WNI', 'Indonesia', 'SUSMORO', 1972, 46, 15, 68, 23, 'DALIMAH', 1975, 46, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:42:06', '2019-07-12 14:42:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '019', '0089716801', '1401062100800003', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'HAUZAN IRHAB NABIL', 'M', 'Pekanbaru', '2008-10-21', 89, 23, 'H. Usman Perum Girya Kencana Permai Blok A No.63', '5', '4', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'akk@m.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Victhorino', 1981, 42, 14, 68, 23, 'Ferawati Siregar', 1982, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 21:54:13', '2019-07-12 14:54:13', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '19', '0118966531', '1471096406110001', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'HAYATUN NUFUS', 'F', 'PEKANBARU', '2011-06-24', 89, 23, 'JL. ARIFIN AHMAD', '2', '16', '', 'TANGKERANG TENGAH', 'Kec. Marpoyan Damai', 'Kampar', '', 74, 80, '', '082285393290', 'e@vvv.com', '', '', '', '', '', 'WNI', 'Indonesia', 'DENI JAELANI', 1981, 46, 15, 68, 23, 'ROHANI', 1982, 46, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 22:08:24', '2019-07-12 15:08:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '20', NULL, NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'IFFAH AZIZAH HIDAYAT', 'F', 'PEKANBARU', '2011-07-27', 89, 23, 'Jl PESANTREN', '3', '4', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'ss@ss.com', '', '', '', '', '', 'WNI', 'Indonesia', 'HELMI HIDAYAT', 1981, 50, 15, 70, 23, 'ISTIHAROH', 1981, 50, 15, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-12 22:12:54', '2019-07-12 15:12:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '002', '0088797330', '1401061205080011', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'IRSYAD M. ISNAENI', 'M', 'Kubang Jaya', '2008-05-12', 89, 23, 'H. Usman I Perum Chantika Permai Blok B No.2', '3', '2', 'IV Kasang Kulim', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'a@cccc.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Sujarwadi', 1976, 50, 15, 68, 23, 'Inar Hazar', 1980, 49, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 13:36:58', '2019-07-13 06:36:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '22', '0107079992', '1471071211100004', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'LUTHFI BACHTIAR YAHYA LUBIS', 'M', 'PEKANBARU', '2010-11-12', 89, 23, 'DUSUN III BENCAH PUDU PERMAI', '3', '2', 'DUSUN III BENCAH PUDU PERMAI', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '085265575784', 'vvvv@aaaa.com', '', '', '', '', '', 'WNI', 'Indonesia', 'MHD MAHYUDDIN LUBIS', 1977, 46, 18, 68, 23, 'SITI ASMIA', 1979, 42, 18, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 13:41:25', '2019-07-13 06:41:25', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '23', '0098933626', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'M. Rafif Augesthy Rahman', 'M', 'Kampar', '2009-08-26', 89, 23, 'Rambah Raya', '4', '3', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '081277984046', 'zzz@q.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Abdul Rahman', 1979, 42, 18, 72, 23, 'Yusmila', 1985, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 13:46:26', '2019-07-13 06:46:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '24', '0101833140', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'Marsha Miftahul Jannah', 'F', 'Duri', '2010-03-28', 89, 23, 'Garuda II', '2', '4', '', 'Kubang Jaya', 'Kec. Taman Sari', 'Kampar', '', 74, 81, '', '085261047130', 'j@j.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Sagafni', 1982, 42, 20, 68, 23, 'Respita', 1985, 42, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 13:51:20', '2019-07-13 06:51:20', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '25', NULL, '1471091109100006', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'MUHAMMAD ALFURQON RIKIL ABDULLAH', 'M', 'PEKANBARU', '2010-09-11', 89, 23, 'JL TIRAM', '3', '2', '', 'TANGKERANG BARAT', 'Kec. Marpoyan Damai', 'Kampar', '', 74, 80, '', '', 'c@bbbbb.cpm', '', '', '', '', '', 'WNI', 'Indonesia', 'ABDULLAH', 1975, 46, 15, 68, 23, 'TRIKA PUSPITA', 1981, 46, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 13:55:24', '2019-07-13 06:55:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '033', '0093000563', '1471090610090001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'MUHAMMAD FUAD HUSAIN', 'M', 'Pekanbaru', '2009-06-10', 89, 23, 'Perum Putra Kubang Permai Blok L No.20', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'sss@yyyyy.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Deni Jaelani', 1981, 46, 18, 68, 23, 'Rohani', 1982, 46, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 13:59:26', '2019-07-13 06:59:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '27', '0106498707', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'MUHAMMAD MUS\'AB', 'M', 'SUKA MULIA', '2010-12-16', 89, 23, 'Makota Riau', '4', '7', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'ff@f.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Abu Malik', 1977, 42, 19, 70, 23, 'Mesmawati', 1977, 42, 22, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 14:05:37', '2019-07-13 07:05:37', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '28', '0093711581', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'MUHAMMAD RAHMAN HAKIM', 'M', 'PEKANBARU', '2009-09-28', 89, 23, 'Perum Ginting II', '', '', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'bbbbbbbb@q.com', '', '', '', '', '', 'WNI', 'Indonesia', 'JUSAN', 1977, 50, 14, 71, 23, 'ERLIZA DEWI', 1977, 50, 14, 71, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 14:11:00', '2019-07-13 07:11:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '005', '0087270450', '1401061404080003', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'MUHAMMAD SYAHLAN AULIA', 'M', 'Pekanbaru', '2008-04-14', 89, 23, 'Perum Griya Mayang Sari Blok O No.01', '', '', 'III Bencah Pudu Permai', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'ccccc@mm.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Awaluddin', 1980, 50, 14, 71, 23, 'Ubaddinur Hairat', 1976, 50, 14, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 14:15:44', '2019-07-13 07:15:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '032', '0084020780', '1471111710080001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'MUHAMMAD UBAY HARAHAP', 'M', 'Pekanbaru', '2008-10-17', 89, 23, 'Sabar No.11D', '6', '3', '', 'Labuh Baru Timur', 'Kec. Payung Sekaki', 'Kampar', '28291', 74, 81, '', '081267287612', 'll@c.com', '', '', '', '', '', 'WNI', 'Indonesia', 'AGUS BAHTIAR HARAHAP', 1981, 46, 18, 68, 23, 'INDAH RESTITAH SARI', 1991, 45, 22, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 14:20:30', '2019-07-13 07:20:30', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '017', '0071266734', '1401065507070003', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'MUTIARA RIZKI', 'F', 'Kampung Baru', '2007-07-15', 89, 23, 'Dusun IV Suka Maju', '2', '1', 'Dusun IV Suka Maju', 'Kepau Jaya', 'Kec. Siak Hulu', 'Kampar', '28452', 74, 81, '', '085375097912', 'zzzz@q.com', '', '', '', '', '', 'WNI', 'Indonesia', 'WIDODO', 1972, 44, 12, 68, 23, 'HALIMAH', 1979, 44, 22, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 20:18:09', '2019-07-13 13:18:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '32', '0107484402', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Nabila Chantika Putri', 'F', 'Pekanbaru', '2010-05-05', 89, 23, 'Jl. Impres Perum. BSA Blok B1.06', '2', '9', '', 'Sidomulyo Timur', 'Kec. Marpoyan Damai', 'Kampar', '', 74, 80, '', '081365486103', 'kk@b.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Riswanto', 1972, 42, 20, 68, 23, 'Mardiani', 1972, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 20:22:40', '2019-07-13 13:22:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '006', '0083649807', '1401064508800011', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'NABILA INDAH', 'F', 'Pekanbaru', '2008-05-08', 89, 23, 'Garuda Gg. Cendrawasih II Blok B10 No.13', '3', '2', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'na@s.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Samsudin', 1975, 46, 15, 68, 23, 'Aida', 1983, 46, 18, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 20:27:45', '2019-07-13 13:27:45', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '34', '0115092871', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'NAJLA AHDA SABILA', 'F', 'PEKANBARU', '2011-02-12', 89, 23, 'JL DAGANG GG INTAN KORONG', '', '', '', 'KAMPUNG TENGAH', 'Kec. Sukajadi', 'Kampar', '', 74, 80, '', '085278579439', 'SABILA@SABILA.com', '', '', '', '', '', 'WNI', 'Indonesia', 'DESNEDI', 1975, 42, 10, 68, 23, 'MAYA NURUL HIDAYATI', 1975, 42, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 20:33:06', '2019-07-13 13:33:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '029', '0092826609', '1401064703090001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'NURUL HAFIZHAH', 'F', 'Kubang Jaya', '2009-03-07', 89, 23, 'Kaharuddin Nasution', '', '', '', 'Kubang', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'HAFIZHAH@HAFIZHAH.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Asnawi', 1969, 50, 14, 71, 23, 'Jasmani', 1969, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-13 20:39:05', '2019-07-13 13:39:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '36', '0096723278', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Qonitah Washifah', 'F', 'Pekanbaru', '2009-12-23', 89, 23, 'Keramat Sakti Dusun II', '3', '2', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '081372809528', 'Washifah@Washifah.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Apriandi', 1982, 42, 18, 68, 23, 'Isnita', 1982, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 10:40:11', '2019-07-14 03:40:11', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '37', NULL, '1401061711060007', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'RENDI SUDIRMANSYAH', 'M', 'KUBANG JAYA', '2006-11-17', 89, 23, 'Keramat Sakti', '2', '3', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '085355282043', 'SUDIRMANSYAH@SUDIRMANSYAH.om', '', '', '', '', '', 'WNI', 'Indonesia', 'ALFIAN KENEDI', 1985, 42, 18, 68, 23, 'ROBIAH MILDANIA', 1985, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 10:43:49', '2019-07-14 03:43:49', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '024', '0095585743', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'SAKINAH APRIALIANI CANDRA', 'F', 'Peranap', '2009-04-27', 89, 23, 'Kubang Jaya', '', '', '', 'Kubang', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'CANDRA@CANDRA.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Kosong', 1955, 42, 10, 68, 23, 'Noffriani', 1955, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 10:48:55', '2019-07-14 03:48:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '39', '0104672940', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'SALSABILA M. ALI', 'F', 'Pekanbaru', '2010-05-20', 89, 23, 'Garuda', '3', '4', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '081268468456', 'ali@ali.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Muhammad Ali Abdul chalik', 1967, 42, 15, 68, 23, 'Hustiah Husni Said', 1978, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 10:52:43', '2019-07-14 03:52:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '40', '0102566689', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, '', '', 'SATRIA INDRAPURA PRATAMA', 'M', 'PEKANBARU', '2010-11-10', 89, 23, 'KUBANG KERAMAT SAKTI', '', '', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kamapr', '', 74, 80, '', '081378214796', 'PRATAMA@PRATAMA.com', '', '', '', '', '', 'WNI', 'Indonesia', 'SLAMET DAMIRI', 1967, 42, 10, 68, 23, 'ASMIATUN', 1967, 42, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 10:56:45', '2019-07-14 03:56:45', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '41', NULL, '1401061808100001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'SHOHWAH ISLAMIYAH AIDIL', 'M', 'SUNGAI PAGAR', '2010-08-18', 89, 23, 'perum putra kubang blok L no 7', '', '', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'AIDIL@AIDIL.com', '', '', '', '', '', 'WNI', 'Indonesia', 'AIDIL AGUS SYAHPUTRA', 1977, 50, 15, 71, 23, 'NUR ASTIFA', 1977, 50, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 11:01:14', '2019-07-14 04:01:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(42, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'true', NULL, '0000-00-00', '42', '0109315959', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Siti Zainab Harahap', 'F', 'Pekanbaru', '2010-05-28', 89, 23, 'Perumahan Syifa Residen Blok A No 6', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'Harahap@Harahap.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Agus Bakhtiar Harahap', 1981, 42, 10, 68, 23, 'Indah Ristitah Sari', 1991, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 11:05:29', '2019-07-14 04:05:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(43, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '43', '0105050284', '1401064407110001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'SRI YULIANI', 'F', 'KUBANG JAYA', '2010-07-04', 89, 23, 'DUSUN IV KASANG KULIM', '3', '4', 'DUSUN IV KASANG KULIM', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '085356949511', 'YULIANI@YULIANI.com', '', '', '', '', '', 'WNI', 'Indonesia', 'SAIFUL HARAHAP', 1979, 46, 18, 68, 23, 'FITRI MARDIA', 1981, 42, 10, 68, 23, '', 0000, 46, 22, 70, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 11:10:31', '2019-07-14 04:10:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(44, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '44', '0112795924', '1401066205110001', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'TASYI ATASYA DIENTI', 'F', 'PEKANBARU', '2011-05-22', 89, 23, 'DUSUN II KERAMAT SAKTI', '2', '7', 'DUSUN II KERAMAT SAKTI', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '081363834858', 'DIENTI@DIENTI.com', '', '', '', '', '', 'WNI', 'Indonesia', 'DIDIK PRIATNA', 1982, 46, 18, 68, 23, 'NETI SYAFNI', 1980, 46, 22, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 11:15:36', '2019-07-14 04:15:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(45, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '45', '0095685652', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'WAHYUDI ESATAMA', 'M', 'PEKANBARU', '2009-08-02', 89, 23, 'Perumahan Mutiara F3 Kubang Jaya', '2', '2', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '081270904820', 'ESATAMA@ESATAMA.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Kosong', 1982, 42, 10, 68, 23, 'Darmita Lubis', 1983, 42, 15, 71, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 11:19:59', '2019-07-14 04:19:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(46, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '014', '0083018730', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'XENA QURROTUL RIKIL ABDULLAH', 'F', 'Pekanbaru', '2008-07-14', 89, 23, 'Perum Anugrah Jl. Garuda 1', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'ABDULLAH@ABDULLAH.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Abdullah', 1983, 42, 18, 68, 23, 'T. Rika Puspita', 1983, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 12:52:34', '2019-07-14 05:52:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(47, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '47', NULL, '3173085502101004', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'YARFVA KALNAJMA HIDAYAT', 'M', 'TANGERANG', '2010-02-15', 89, 23, 'perum brlian blok G II', '', '', '', 'KUBANG JAYA', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'HIDAYAT@HIDAYAT.com', '', '', '', '', '', 'WNI', 'Indonesia', 'HIDAYAT', 1983, 50, 15, 71, 23, 'NOPENTIA SARI', 1987, 50, 15, 70, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 12:56:55', '2019-07-14 05:56:55', NULL, NULL, 1, 0, 0, 0, 'false'),
(48, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '48', '0107391946', NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ZAHARA ZEE ANGGRAINI', 'F', 'PEKANABARU', '2010-04-20', 89, 23, 'JL PAUS GG. LUMBA LUMBA', '', '', '', 'TANGKERANG BARAT', 'Kec. Marpoyan Damai', 'Kampar', '085278062682', 74, 80, '', '085278062682', 'ANGGRAINI@ANGGRAINI.com', '', '', '', '', '', 'WNI', 'Indonesia', 'ABDUL RAZAK', 1983, 42, 10, 68, 23, 'ALVAH', 1983, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 13:00:40', '2019-07-14 06:00:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(49, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '007', '0083983554', '1401065008080002', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ZIKRA MUHAMMAD ALI', 'F', 'Sudan', '2008-08-10', 89, 23, 'Perum Putra Kubang Blok L No. 21', '', '', '', 'Kubang Jaya', 'Kec. Siak Hulu', 'Kampar', '', 74, 80, '', '', 'ALI@AdLI.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Muhammad Ali Abdul Chalik', 1967, 50, 18, 68, 23, 'Hustiah Husni Said', 1978, 50, 15, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 13:34:51', '2019-07-14 06:34:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(50, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '018', NULL, '1401065109080002', NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'ZUMIRA HAYATUL ASYIFA', 'F', '0085372130', '2008-11-09', 89, 23, 'Perum Bumi Kualu Damai Blok F 02', '', '', '', 'Kualu', 'Kec. Tambang', 'Kampar', '', 74, 80, '', '', 'ASYIFA@ASYIFA.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Bambang Purwanto', 1974, 46, 18, 68, 23, 'Fitri Risdianti', 1976, 46, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-14 13:39:37', '2019-07-14 06:39:37', NULL, NULL, 1, 0, 0, 0, 'false'),
(51, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '51', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Durratul Hikmah', 'F', 'Pekanbaru', '2013-04-19', 89, 23, 'Kubang jaya', '', '', '', 'Kubang Jaya', 'Siak Hulu', 'Kampar', '', 74, 80, '', '082385799536', 'Hakim@Hakim.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Iskandar Hakim', 1978, 42, 10, 68, 23, 'Asmiyati', 1980, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-27 11:18:01', '2019-07-27 04:18:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(52, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '52', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Fakrullah Azzam', 'M', 'Pekanbaru', '2012-08-11', 89, 23, 'Setia Pertiwi B8 No 15', '', '', '', 'Kubang Jaya', 'Siak Hulu', 'Kampar', '', 74, 80, '', '', 'Azzam@Azzam.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Nardi', 1987, 42, 10, 68, 23, 'Putri Rahmadani', 1988, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-27 11:22:06', '2019-07-27 04:22:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(53, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '53', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Jihan Aqila Tri Utari', 'M', 'Pekanbaru', '2012-05-11', 89, 23, 'Kosong', '', '', '', 'Kosong', 'Kosong', 'Kosong', '', 74, 80, '', '', 'Utari@Utari.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Gunawan', 1965, 42, 10, 68, 23, 'Reni Poslan', 1965, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-27 19:02:57', '2019-07-27 12:03:48', NULL, NULL, 1, 1, 0, 0, 'false'),
(54, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '54', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Hiro Azka  Aldric', 'M', 'Pandan', '2012-10-10', 89, 23, 'JL. Rambah Raya Perum Permata Blok J No8', '', '', '', '', '', '', '', 74, 80, '', '081376043000', 'Aldric@Aldric.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Sailan', 1988, 42, 10, 68, 23, 'Rahayu Lubis', 1988, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-27 19:07:07', '2019-07-27 12:07:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(55, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '56', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Latifah Aulia Purnomo', 'M', 'Simpang Ampek', '2012-09-10', 89, 23, 'Teropong', '', '', '', '', '', '', '', 74, 80, '', '081343219266', 'Purnomo@Purnomo.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Adi Purnomo', 1987, 42, 10, 68, 23, 'Isnakarya', 1989, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-27 19:10:44', '2019-07-27 12:10:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(56, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '57', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Muhammad Ikhsan Syaputra', 'M', 'Brebes', '2012-11-28', 89, 23, 'Jl. Pesantren Perum Setia Pertiwi', '', '', '', '', '', '', '', 74, 80, '', '', 'Syaputra@Syaputra.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Tukirman', 1985, 42, 10, 68, 23, 'Sri Sulistiowati', 1989, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 10:57:05', '2019-07-28 03:57:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(57, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '58', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Muzaki Al Qolbi', 'M', 'Kubang', '2013-07-19', 89, 23, 'Jl. Garuda Perum KPP II', '', '', '', '', '', '', '', 74, 80, '', '', 'Qolbi@Qolbi.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Susmoro', 1977, 42, 10, 68, 23, 'Dalimah', 1980, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 12:45:43', '2019-07-28 05:45:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(58, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '59', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Najla Fatiha Amiran', 'F', 'Pekanbaru', '2012-10-24', 89, 23, 'H. Usman Perum Griya Cantika', '', '', '', '', '', '', '', 74, 80, '', '', 'Amiran@Amiran.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Amirudin', 1988, 42, 10, 68, 23, 'Randa SriMadewita', 1990, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 12:49:51', '2019-07-28 05:49:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(59, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '61', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Mimie Chairany', 'F', 'Langsa', '2012-07-06', 89, 23, 'Perum Kelapa Gading No 8A', '', '', '', '', '', '', '', 74, 80, '', '', 'Chairany@Chairany.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Jimmy Syahputra', 1990, 42, 10, 68, 23, 'Chandra Wijayanti', 1992, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 12:52:49', '2019-07-28 05:52:49', NULL, NULL, 1, 0, 0, 0, 'false'),
(60, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '62', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Qaulan Sakila', 'F', 'Pekanbaru', '2012-03-08', 89, 23, 'Teropong', '', '', '', '', '', '', '', 74, 80, '', '', 'Sakila@Sakila.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Hendra ', 1981, 42, 10, 68, 23, 'Avia Mayhani', 1985, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 12:55:43', '2019-07-28 05:55:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(61, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '63', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Raffa Putra Deas', 'M', 'Bukittinggi', '2012-09-22', 89, 23, 'Jl. Soekarno Hatta', '', '', '', '', '', '', '', 74, 80, '', '', 'Deas@Deas.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Asrizal', 1980, 42, 10, 68, 23, 'Desi Supriyetti', 1987, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 12:59:01', '2019-07-28 05:59:01', NULL, NULL, 1, 0, 0, 0, 'false'),
(62, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '64', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Raziq Hadi Savero', 'M', 'Pekanbaru', '2012-12-28', 89, 23, 'Jl. Camar XI No 315F', '', '', '', '', '', '', '', 74, 80, '', '', 'Savero@Savero.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Metro Hadi', 1987, 42, 10, 68, 23, 'Diana Indah Putri', 1990, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 13:01:59', '2019-07-28 06:01:59', NULL, NULL, 1, 0, 0, 0, 'false'),
(63, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '65', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Reyna Tri Andini', 'F', 'Kubang Jaya', '2012-12-06', 89, 23, 'Dusun III Bencah Pudu Permai', '', '', '', '', '', '', '', 74, 80, '', '', 'Andini@Andini.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Mulyo Herawan', 1981, 42, 10, 68, 23, 'Yulizar', 1984, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 13:05:43', '2019-07-28 06:05:43', NULL, NULL, 1, 0, 0, 0, 'false'),
(64, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '66', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Ukasyah Habiburrahman', 'M', 'Pekanbaru', '2013-03-10', 89, 23, 'Teropong Setia Pertiwi', '', '', '', '', '', '', '', 74, 80, '', '', 'Habiburrahman@Habiburrahman.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Ade Candoko', 1977, 42, 10, 68, 23, 'Maisal Fitri', 1980, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 13:09:27', '2019-07-28 06:09:27', NULL, NULL, 1, 0, 0, 0, 'false'),
(65, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '0000-00-00', '67', NULL, NULL, NULL, NULL, 'false', 'false', NULL, NULL, NULL, '', '', 'Zidan Ramadhani', 'M', 'Kubang Jaya', '2012-07-26', 89, 23, 'Kubang jaya', '', '', '', '', '', '', '', 74, 80, '', '', 'Ramadhani@Ramadhani.com', '', '', '', '', '', 'WNI', 'Indonesia', 'Enggra Maryoli', 1984, 42, 10, 68, 23, 'Perawati', 1988, 42, 10, 68, 23, '', 0000, 42, 10, 68, 0, 0, 0, 0, 0, 1, '0000-00-00', '', '2019-07-28 13:13:36', '2019-07-28 06:13:36', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2019-04-01 08:26:41', '2019-04-01 01:26:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2019-04-01 08:26:41', '2019-04-01 01:26:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2019-04-01 08:26:41', '2019-04-01 01:26:41', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'true', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Anton Sofyan', 'false', '2019-04-01 08:26:40', '2019-04-01 01:26:40', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT '0',
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'administrator', '$2y$10$xqvVABOHOazAeKenbe6OpOcC90HJEW4KdM6CqmXFPT1ztVy6y0JX2', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, '', NULL, NULL, 'true', '2019-10-01 11:28:06', '::1', '2019-04-01 08:26:40', '2019-10-01 09:28:06', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, '11', '$2y$10$nCE1A/bqIIIFkDJSDpEd6uLkOqfSdObF25lXQJrUHQL3sro.YsHoq', 'Syahri Ramadhan, S. Psi, M. S. I', 'ramadhan.pdg@gmail.com', NULL, 0, 'employee', 1, NULL, NULL, NULL, 'true', '2019-07-10 13:59:33', '::1', '2019-07-10 18:57:38', '2019-07-10 11:59:33', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, '22', '$2y$10$Nsj7.88sIJJDu3NYXVUcBebzS61JAWeGMbbMNy4OTXKBhCcpj1w56', 'Yuherdawati, S. Pd. I', 'a@a.com', NULL, 0, 'employee', 2, NULL, NULL, NULL, 'false', '2019-07-10 18:37:14', '::1', '2019-07-10 23:28:11', '2019-07-10 16:37:25', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, '33', '$2y$10$dCg9LiQlKLzdrkQCBz6VqOQ.m3tVmD9mDRYRjqd7T8zqfSQKhXtYS', 'Elvi Fitriani', 'b@b.com', NULL, 0, 'employee', 3, NULL, NULL, NULL, 'false', '2019-07-10 18:37:31', '::1', '2019-07-10 23:28:11', '2019-07-10 16:37:51', NULL, NULL, 1, 1, 0, 0, 'false'),
(5, '44', '$2y$10$KezGros22wOSnUx.EsxcReEjAFLGa.QFYSEPJ1sNLOjYYpshtOIuS', 'Reni Handayani, S. E. Sy', 'c@c.com', NULL, 0, 'employee', 4, NULL, NULL, NULL, 'false', '2019-07-10 18:37:57', '::1', '2019-07-10 23:28:11', '2019-07-10 16:38:02', NULL, NULL, 1, 1, 0, 0, 'false'),
(6, '55', '$2y$10$xWzaDjEjqscdEWcZxaGe4u6jbhV7j3imgl0gNQXjUjW.WPnriA/tC', 'Delisma, A. Ma', 'e@e.com', NULL, 0, 'employee', 5, NULL, NULL, NULL, 'false', '2019-07-10 18:38:10', '::1', '2019-07-10 23:28:11', '2019-07-10 16:38:23', NULL, NULL, 1, 1, 0, 0, 'false'),
(7, '66', '$2y$10$t3mjGArdEFpA4PkMiR2aMeSbDa7TCuYQZJqm.e5VJi.HHCNcBvdaC', 'Raihana Silvia, S. Pd', 'f@f.com', NULL, 0, 'employee', 6, NULL, NULL, NULL, 'false', '2019-07-10 18:38:29', '::1', '2019-07-10 23:28:11', '2019-07-10 16:38:39', NULL, NULL, 1, 1, 0, 0, 'false'),
(8, '77', '$2y$10$WzT9aPCk.QqirElR..C34uo0.d6CsKzqjh5mu2CDE0RslBFbHR6CG', 'Firnaldi T. Yasit, S. Pd', 'g@g.com', NULL, 0, 'employee', 7, NULL, NULL, NULL, 'true', '2019-07-10 18:38:46', '::1', '2019-07-10 23:28:11', '2019-07-10 16:38:46', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) DEFAULT '0',
  `module_id` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ghka7gq9ln08eilubjo2a5sloc9hbuah', '::1', 1569905357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393930353239353b746f6b656e7c733a33323a223863653031616333653338303735623136633630363765303638373538633264223b637372665f746f6b656e7c733a33323a223863653031616333653338303735623136633630363765303638373538633264223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a35303a2257656273697465205265736d692053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b69223b6d6574615f6b6579776f7264737c733a3231303a2257656273697465205265736d692053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b692c2057656273697465205265736d692053442049542054616866697a6820416c204d616b6b692c2057656273697465205265736d6920534449542054616866697a6820416c204d616b6b692c2053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b692c2053442049542054616866697a6820416c204d616b6b692c20534449542054616866697a6820416c204d616b6b69223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a393a22302e33373530363134223b6c6f6e6769747564657c733a31313a223130312e34363639333332223b66617669636f6e7c733a33363a2261303561623933306436343162656236666434616664626134376661666161302e6a7067223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a32343a226a70672c206a7065672c20706e672c206769662c20706466223b75706c6f61645f6d61785f66696c6573697a657c733a373a2231303234303030223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22383030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22333030223b6c6f676f5f77696474687c733a333a22363030223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a34393a2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f7379616872692e72616d616468616e2e3130303438333739223b747769747465727c733a32373a2268747470733a2f2f747769747465722e636f6d2f49744d616b6b69223b6c696e6b65645f696e7c733a313a222d223b796f75747562657c733a35363a2268747470733a2f2f7777772e796f75747562652e636f6d2f6368616e6e656c2f554351594d70537047567444543354774864625f5f485851223b696e7374616772616d7c733a313a222d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a383a223639393230353932223b7363686f6f6c5f6e616d657c733a32323a2253442049542054616866697a6820416c204d616b6b69223b686561646d61737465727c733a33303a225379616872692052616d616468616e2c20532e5073692e2c204d2e532e49223b686561646d61737465725f70686f746f7c733a33363a2236303261653837663364663561316437316164623366626565633733646135382e6a7067223b7363686f6f6c5f6c6576656c7c733a313a2231223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313039223b6465637265655f6f7065726174696e675f7065726d69747c733a32383a223432312f4b5054532f502044616e204b2d44494b4441532f39353234223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031352d30382d3134223b7461676c696e657c733a32393a225574616d616b616e20416b686c616b20446172697061646120496c6d75223b72747c733a313a2233223b72777c733a313a2234223b7375625f76696c6c6167657c733a313a222d223b76696c6c6167657c733a31313a224b7562616e67204a617961223b7375625f64697374726963747c733a393a225369616b2048756c75223b64697374726963747c733a363a224b616d706172223b706f7374616c5f636f64657c733a353a223238343532223b7374726565745f616464726573737c733a32303a224a616c616e205465726f706f6e6720556a756e67223b70686f6e657c733a31343a223038313320373236332038313537223b6661787c733a313a2230223b656d61696c7c733a33303a22736469742e74616866697a682e616c6d616b6b6940676d61696c2e636f6d223b776562736974657c733a32373a22736469742e74616866697a682e616c6d616b6b692e7363682e6964223b6c6f676f7c733a33363a2236326338303138343231303133383662323437313262323363326364646234372e6a7067223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303139223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031392d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323031392d31322d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031392d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031392d31322d3331223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323031392d32303230223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323031392d32303230223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2232223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d),
('pa044nqald2tapu2tmk9c6kh8qfbab2l', '::1', 1569922112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393932323034313b746f6b656e7c733a33323a226132666339366639393736616633313465313834666564656361626561656264223b637372665f746f6b656e7c733a33323a226132666339366639393736616633313465313834666564656361626561656264223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a35303a2257656273697465205265736d692053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b69223b6d6574615f6b6579776f7264737c733a3231303a2257656273697465205265736d692053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b692c2057656273697465205265736d692053442049542054616866697a6820416c204d616b6b692c2057656273697465205265736d6920534449542054616866697a6820416c204d616b6b692c2053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b692c2053442049542054616866697a6820416c204d616b6b692c20534449542054616866697a6820416c204d616b6b69223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a393a22302e33373530363134223b6c6f6e6769747564657c733a31313a223130312e34363639333332223b66617669636f6e7c733a33363a2261303561623933306436343162656236666434616664626134376661666161302e6a7067223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a32343a226a70672c206a7065672c20706e672c206769662c20706466223b75706c6f61645f6d61785f66696c6573697a657c733a373a2231303234303030223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22383030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22333030223b6c6f676f5f77696474687c733a333a22363030223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a34393a2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f7379616872692e72616d616468616e2e3130303438333739223b747769747465727c733a32373a2268747470733a2f2f747769747465722e636f6d2f49744d616b6b69223b6c696e6b65645f696e7c733a313a222d223b796f75747562657c733a35363a2268747470733a2f2f7777772e796f75747562652e636f6d2f6368616e6e656c2f554351594d70537047567444543354774864625f5f485851223b696e7374616772616d7c733a313a222d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a383a223639393230353932223b7363686f6f6c5f6e616d657c733a32323a2253442049542054616866697a6820416c204d616b6b69223b686561646d61737465727c733a33303a225379616872692052616d616468616e2c20532e5073692e2c204d2e532e49223b686561646d61737465725f70686f746f7c733a33363a2236303261653837663364663561316437316164623366626565633733646135382e6a7067223b7363686f6f6c5f6c6576656c7c733a313a2231223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313039223b6465637265655f6f7065726174696e675f7065726d69747c733a32383a223432312f4b5054532f502044616e204b2d44494b4441532f39353234223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031352d30382d3134223b7461676c696e657c733a32393a225574616d616b616e20416b686c616b20446172697061646120496c6d75223b72747c733a313a2233223b72777c733a313a2234223b7375625f76696c6c6167657c733a313a222d223b76696c6c6167657c733a31313a224b7562616e67204a617961223b7375625f64697374726963747c733a393a225369616b2048756c75223b64697374726963747c733a363a224b616d706172223b706f7374616c5f636f64657c733a353a223238343532223b7374726565745f616464726573737c733a32303a224a616c616e205465726f706f6e6720556a756e67223b70686f6e657c733a31343a223038313320373236332038313537223b6661787c733a313a2230223b656d61696c7c733a33303a22736469742e74616866697a682e616c6d616b6b6940676d61696c2e636f6d223b776562736974657c733a32373a22736469742e74616866697a682e616c6d616b6b692e7363682e6964223b6c6f676f7c733a33363a2236326338303138343231303133383662323437313262323363326364646234372e6a7067223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303139223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031392d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323031392d31322d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031392d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031392d31322d3331223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323031392d32303230223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323031392d32303230223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2232223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d),
('i71b76q9hsg9pb1878shgk3c5397sceu', '::1', 1569948054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536393934373936383b746f6b656e7c733a33323a226234373037376663633965316263656466376334356161643935333836353636223b637372665f746f6b656e7c733a33323a226234373037376663633965316263656466376334356161643935333836353636223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a35303a2257656273697465205265736d692053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b69223b6d6574615f6b6579776f7264737c733a3231303a2257656273697465205265736d692053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b692c2057656273697465205265736d692053442049542054616866697a6820416c204d616b6b692c2057656273697465205265736d6920534449542054616866697a6820416c204d616b6b692c2053656b6f6c61682044617361722049736c616d205465727061647520416c2d4d616b6b692c2053442049542054616866697a6820416c204d616b6b692c20534449542054616866697a6820416c204d616b6b69223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a393a22302e33373530363134223b6c6f6e6769747564657c733a31313a223130312e34363639333332223b66617669636f6e7c733a33363a2261303561623933306436343162656236666434616664626134376661666161302e6a7067223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a32343a226a70672c206a7065672c20706e672c206769662c20706466223b75706c6f61645f6d61785f66696c6573697a657c733a373a2231303234303030223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22383030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22333030223b6c6f676f5f77696474687c733a333a22363030223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a34393a2268747470733a2f2f7777772e66616365626f6f6b2e636f6d2f7379616872692e72616d616468616e2e3130303438333739223b747769747465727c733a32373a2268747470733a2f2f747769747465722e636f6d2f49744d616b6b69223b6c696e6b65645f696e7c733a313a222d223b796f75747562657c733a35363a2268747470733a2f2f7777772e796f75747562652e636f6d2f6368616e6e656c2f554351594d70537047567444543354774864625f5f485851223b696e7374616772616d7c733a313a222d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a383a223639393230353932223b7363686f6f6c5f6e616d657c733a32323a2253442049542054616866697a6820416c204d616b6b69223b686561646d61737465727c733a33303a225379616872692052616d616468616e2c20532e5073692e2c204d2e532e49223b686561646d61737465725f70686f746f7c733a33363a2236303261653837663364663561316437316164623366626565633733646135382e6a7067223b7363686f6f6c5f6c6576656c7c733a313a2231223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313039223b6465637265655f6f7065726174696e675f7065726d69747c733a32383a223432312f4b5054532f502044616e204b2d44494b4441532f39353234223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031352d30382d3134223b7461676c696e657c733a32393a225574616d616b616e20416b686c616b20446172697061646120496c6d75223b72747c733a313a2233223b72777c733a313a2234223b7375625f76696c6c6167657c733a313a222d223b76696c6c6167657c733a31313a224b7562616e67204a617961223b7375625f64697374726963747c733a393a225369616b2048756c75223b64697374726963747c733a363a224b616d706172223b706f7374616c5f636f64657c733a353a223238343532223b7374726565745f616464726573737c733a32303a224a616c616e205465726f706f6e6720556a756e67223b70686f6e657c733a31343a223038313320373236332038313537223b6661787c733a313a2230223b656d61696c7c733a33303a22736469742e74616866697a682e616c6d616b6b6940676d61696c2e636f6d223b776562736974657c733a32373a22736469742e74616866697a682e616c6d616b6b692e7363682e6964223b6c6f676f7c733a33363a2236326338303138343231303133383662323437313262323363326364646234372e6a7067223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303139223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031392d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323031392d31322d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031392d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031392d31322d3331223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323031392d32303230223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323031392d32303230223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b61646d697373696f6e5f70686173655f69647c733a313a2231223b61646d697373696f6e5f70686173657c733a313a2232223b6d616a6f725f636f756e747c623a303b);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indexes for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indexes for table `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indexes for table `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_nik__idx` (`nik`) USING BTREE,
  ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `employees_email__idx` (`email`) USING BTREE,
  ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indexes for table `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
