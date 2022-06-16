-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2022 at 11:29 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kamsya`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_created` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `target_table` varchar(125) NOT NULL,
  `update_id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `url_string` varchar(255) DEFAULT NULL,
  `username` varchar(55) DEFAULT NULL,
  `first_name` varchar(65) DEFAULT NULL,
  `last_name` varchar(75) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `date_joined` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `num_logins` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `trongate_user_id` int(11) NOT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `user_token` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `penggunas`
--

CREATE TABLE `penggunas` (
  `id` int(11) NOT NULL,
  `url_string` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` int(11) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `categ_id` int(11) NOT NULL,
  `barcode` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL COMMENT 'sold,new,die,lost,other',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(11) NOT NULL DEFAULT '0',
  `buying_dt` datetime DEFAULT NULL,
  `buying_from` varchar(50) DEFAULT NULL,
  `buying_price` double DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `alias`, `categ_id`, `barcode`, `status`, `weight`, `stock`, `buying_dt`, `buying_from`, `buying_price`, `selling_price`, `market_price`, `photo`, `notes`, `created_at`, `updated_at`, `picture`) VALUES
(1, 'Si Jalu', 5, 'CxrVHE3dQN', '2', '47.12', 0, '2022-02-06 00:00:00', '1', 3585000, 4000000, 27500.02, 'sijalu.jpg', 'kambing gagah', '2022-03-22 08:05:03', '2022-03-23 18:50:12', NULL),
(2, 'Si Hitam', 5, 'TBgg2wzfNZ', '2', '33.25', 0, '2022-02-06 00:00:00', '3', 2600000, 3550000, 3000003, 'kambing-hitam.jpg', 'kambing bagus hitam banget', '2022-03-22 08:00:32', '2022-03-23 22:23:22', ''),
(3, 'Kambing Etawa Super', 5, '3pTwzrKkUP', '2', '35.00', 0, '2022-03-21 00:00:00', '2', 2500500, 4000000, NULL, 'sonic-among-us.png', 'kambing sonic', '2022-06-14 08:46:12', '2022-06-14 11:46:19', ''),
(4, 'Kambing Kacang Lokal', 5, 'cJdhBgejY2', '1', '22.25', 1, '2022-03-16 00:00:00', '1', 1350000, NULL, NULL, 'kambing.jpg', 'Kambing Kacang Lokal Mur-Mer', '2022-03-22 07:50:51', '2022-03-22 07:50:51', ''),
(22, 'Kambing Etawa Super Besar', 5, 'RDzH2mCDqt', '4', '52.00', 0, '2022-06-14 00:00:00', '2', 3500000, 0, NULL, 'kambing-besar.jpg', 'Besar banget', '2022-06-14 08:40:35', '2022-06-14 08:40:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `group_categ` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `name`, `parent_id`, `group_categ`, `description`) VALUES
(3, 'Pengumuman', 0, '', 'Macem2 Pengumuman'),
(4, 'Tips', 3, '', 'Tips and Trick'),
(5, 'Kambing', 0, '', 'Macem2 kambing'),
(6, 'Resep', 0, '', 'Macem2 Resep'),
(7, 'Etawa', 5, '', 'Jenis kambing etawa'),
(8, 'Kacang', 5, '', 'Jenis kambing kacang'),
(9, 'Minuman', 0, '', 'Kategori Minuman'),
(10, 'Es Campur', 9, '', 'Es campur-minuman'),
(11, 'Es Campur 77', 10, '', 'Es Campur 77-Es cAmpur-Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

CREATE TABLE `tbl_images` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_members`
--

CREATE TABLE `tbl_members` (
  `id` int(11) NOT NULL,
  `url_string` varchar(255) DEFAULT NULL,
  `username` varchar(55) DEFAULT NULL,
  `fullname` varchar(50) NOT NULL,
  `first_name` varchar(65) DEFAULT NULL,
  `last_name` varchar(75) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `date_joined` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `num_logins` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `trongate_user_id` int(11) NOT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `user_token` varchar(32) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_members`
--

INSERT INTO `tbl_members` (`id`, `url_string`, `username`, `fullname`, `first_name`, `last_name`, `email_address`, `role_id`, `address`, `date_joined`, `code`, `password`, `num_logins`, `last_login`, `trongate_user_id`, `confirmed`, `user_token`, `phone`, `picture`, `created_at`, `updated_at`) VALUES
(1, 'user_one', 'user1', 'User One', 'User One', '', 'user@user.net', 0, 'Jl. Besar', 1647538589, 'tmELBp54pSsxjRDc', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ/y4isrFNEi', 7, 1651660385, 5, 1, '', '', 'user_one.png', '2022-04-02 10:40:39', '2022-05-10 14:35:14'),
(2, 'superibra', 'superibra', 'Super Ibra', 'Super', 'Ibra', 'superibra@net.hr', 2, 'Kunafa Rd.', 1647538934, 'pFafShMRxXLHe4xH', '$2y$11$AF0uogdSTZGuSnZlSwJCyePXqgQAx4isZrao4kOeochxoE5rtbyBy', 6, 1652292746, 6, 1, '', '', 'superibra.png', '2022-04-02 10:40:39', '2022-06-15 03:52:44'),
(3, 'user_two', 'user2', 'User Two', NULL, NULL, 'user2@gmail.com', 0, 'Test St.', 1647584488, 'hdV8Q2Qz47eGrrSh', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ/y4isrFNEi', 9, 1651167883, 7, 1, '', '', 'user_two.png', '2022-04-02 10:40:39', '2022-05-10 14:35:38'),
(4, 'user_tri', 'user3', 'User Tri', NULL, NULL, 'user3@gmail.com', 0, '', 1647586218, 'g9U6wmGcYe9eWS65', '$2y$11$Cfelp/QD.blPZjtW0hYuFuZl8pAS/6LRWCzVeTuncJPYnprU2pHnS', 40, 1651167477, 8, 1, '', '', 'user_tri.png', '2022-04-02 10:40:39', '2022-05-10 14:35:43'),
(5, 'admin', 'Admin', 'Admin', 'Administrator', '', 'admin@user.net', 88, 'Jl. Besar', 1647538589, 'tmELBp54pSsxjRDc', '$2y$11$4WpgcXCvdUB1ueyLbdLx2.rmBa3o.6bZr4KY7RQl7rsKrL9ktLFBC', 4, 1652262478, 1, 1, '', '', 'admin.png', '2022-04-02 10:40:39', '2022-05-11 09:47:58'),
(6, 'webmaster', 'webmaster', 'Webmaster', 'Webmaster', '', 'webmaster@user.net', 99, 'Jl. Besar', 1647538589, 'tmELBp54pSsxjRDc', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ/y4isrFNEi', 1, 1647538590, 10, 1, '', '', 'webmaster.png', '2022-04-02 10:40:39', '2022-05-10 14:33:34'),
(7, 'maulahaz', 'maulahaz', 'Maulana Hazmi', 'Maulana', 'Hazmi', 'maulahaz@user.net', 88, 'Jl. Besar Banget', 1647538589, 'tmELBp54pSsxjRDc', '$2y$11$TkVmXbDPpPP4Hrm2pjsjPOTiWwtHLiGtYyDKlxFaQ7AvlMm4ThqY6', 4, 1652208555, 9, 1, '', '', 'maulahaz.png', '2022-04-02 10:40:39', '2022-05-10 18:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_options`
--

CREATE TABLE `tbl_options` (
  `id` int(11) NOT NULL,
  `opt_for` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `opt_code` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `opt_key` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `opt_value` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_options`
--

INSERT INTO `tbl_options` (`id`, `opt_for`, `opt_code`, `opt_key`, `opt_value`, `description`) VALUES
(1, 'confirmed', '', '0', 'Rejected', 'Rejected'),
(2, 'confirmed', '', '1', 'Approved', 'Approved'),
(3, 'role_id', 'STF', '1', 'Staff', 'Staff'),
(4, 'role_id', 'SPV', '2', 'Supervisor', 'Supervisor'),
(6, 'role_id', 'MGR', '3', 'Manager', 'Manager'),
(7, 'role_id', 'ADM', '5', 'Admin', 'Admin'),
(8, 'role_id', 'WMS', '88', 'Webmaster', 'Webmaster');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjual`
--

CREATE TABLE `tbl_penjual` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(50) DEFAULT NULL,
  `owner_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_penjual`
--

INSERT INTO `tbl_penjual` (`id`, `shop_name`, `owner_name`, `phone`, `address`) VALUES
(1, 'Toko Maju Jaya', 'Nugroho', '081299764535', 'Sidareja'),
(2, 'Toko Raja Kambing ', 'Ahmad Burhan', '081432764000', 'Tegalwangi, Merak'),
(3, 'Toko Kambing Top', 'Sri Rahayu', '081009964555', 'Taktakan, Serang');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `id` int(11) NOT NULL,
  `trans_dt` datetime NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `customer` varchar(100) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`id`, `trans_dt`, `item_id`, `price`, `qty`, `customer`, `notes`, `created_at`, `updated_at`) VALUES
(1, '2022-03-12 00:00:00', 2, 150000.00, 2, 'Ibu Fathimah', '', '2022-06-14 08:07:15', '2022-06-14 08:07:15'),
(2, '2022-03-19 00:00:00', 3, 1750000.00, 1, 'Bang Jampang', '', '2022-06-14 08:06:59', '2022-06-14 08:06:59'),
(3, '2022-03-23 00:00:00', 1, 4000000.00, 1, 'H. Sukur', 'Laku buat sukuran anak H.Sukur', '2022-03-23 17:50:12', '2022-03-23 17:50:12'),
(4, '2022-03-22 00:00:00', 2, 3550000.00, 1, 'Bu Nurlaela', 'Buat di sate', '2022-03-23 18:23:22', '2022-03-23 18:23:22'),
(5, '2022-06-14 00:00:00', 3, 4000000.00, 1, 'Steven Clarkson', 'Buat Qurban 2022', '2022-06-14 07:46:19', '2022-06-14 07:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pictures`
--

CREATE TABLE `tbl_pictures` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `picture` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pictures`
--

INSERT INTO `tbl_pictures` (`id`, `item_id`, `title`, `picture`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 3, 'test', 'kambing-putih.jpg', 1, '0000-00-00 00:00:00', '2022-06-14 05:22:15');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`id`, `status`, `description`) VALUES
(1, 'ada', 'Ada dan masih hidup sehat'),
(2, 'terjual', 'Terjual ke bpk Ahmad'),
(3, 'mati', 'mati krn sakit, ketabrak mobil'),
(4, 'hilang', 'Hilang karena tercuri dn lainya'),
(5, 'lainya', 'Alasan lainya'),
(7, 'Baru Datang', 'Baru aza Datang');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tokens`
--

CREATE TABLE `tbl_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(125) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `expiry_date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `trans_dt` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `paid_status` char(50) CHARACTER SET utf8mb4 NOT NULL,
  `courier` char(20) CHARACTER SET utf8mb4 NOT NULL,
  `notes` char(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `cashier` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `trans_dt`, `customer_id`, `status`, `paid_status`, `courier`, `notes`, `cashier`) VALUES
(1, '2022-03-23 00:00:00', 2, 1, '1', 'JNE', 'Test', '2'),
(2, '2022-03-23 00:00:00', 2, 1, '1', 'JNE 2', 'Test 2', '2'),
(3, '2022-03-23 00:00:00', 2, 1, '1', 'JNE 3', 'Test 3', '3'),
(4, '2022-03-23 00:00:00', 1, 2, '1', 'JNE 4', 'Test 4', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`id`, `trans_id`, `item_id`, `price`, `qty`, `discount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 150000.00, 2, 0.00, '2022-03-23 11:52:08', '0000-00-00 00:00:00'),
(2, 1, 3, 1750000.00, 1, 0.00, '2022-03-23 11:52:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `url_string` varchar(255) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `code` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `num_logins` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `trongate_user_id` int(11) NOT NULL,
  `isConfirmed` tinyint(1) DEFAULT NULL,
  `user_token` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `url_string`, `username`, `fullname`, `first_name`, `last_name`, `email`, `role_id`, `address`, `code`, `password`, `num_logins`, `last_login`, `trongate_user_id`, `isConfirmed`, `user_token`, `phone`, `picture`, `created_at`, `updated_at`) VALUES
(1, 'user_one', 'user1', 'User One', 'User One', '', 'user@user.net', 0, 'Jl. Besar', 'tmELBp54pSsxjRDc', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ/y4isrFNEi', 13, 1655259213, 5, 1, '', '', 'user_one.png', '2022-04-02 10:40:39', '2022-06-15 02:13:33'),
(2, 'superibra', 'superibra', 'Super Ibra', 'Super', 'Ibra', 'superibra@net.hr', 0, 'Kunafa Rd.', 'pFafShMRxXLHe4xH', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ', 2, 1650088903, 6, 1, '', '', 'superibra.png', '2022-04-02 10:40:39', '2022-06-15 03:50:36'),
(3, 'user_two', 'user2', 'User Two', NULL, NULL, 'user2@gmail.com', 0, 'Test St.', 'hdV8Q2Qz47eGrrSh', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ', 9, 1651167883, 7, 1, '', '', 'user_two.png', '2022-04-02 10:40:39', '2022-05-10 14:35:38'),
(4, 'user_tri', 'user3', 'User Tri', NULL, NULL, 'user3@gmail.com', 0, '', 'g9U6wmGcYe9eWS65', '$2y$11$Cfelp/QD.blPZjtW0hYuFuZl8pAS/6LRWCzVeTuncJP', 40, 1651167477, 8, 1, '', '', 'user_tri.png', '2022-04-02 10:40:39', '2022-05-10 14:35:43'),
(5, 'admin', 'Admin', 'Admin', 'Administrator', '', 'admin@user.net', 88, 'Jl. Besar', 'tmELBp54pSsxjRDc', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ/y4isrFNEi', 6, 1655259286, 1, 1, '', '', 'admin.png', '2022-04-02 10:40:39', '2022-06-15 02:14:46'),
(6, 'webmaster', 'webmaster', 'Webmaster', 'Webmaster', '', 'webmaster@user.net', 99, 'Jl. Besar', 'tmELBp54pSsxjRDc', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ', 1, 1647538590, 10, 1, '', '', 'webmaster.png', '2022-04-02 10:40:39', '2022-05-10 14:33:34'),
(7, 'maulahaz', 'maulahaz', 'Maulana Hazmi', 'Maulana', 'Hazmi', 'maulahaz@user.net', 88, 'Jl. Besar Banget', 'tmELBp54pSsxjRDc', '$2y$11$TkVmXbDPpPP4Hrm2pjsjPOTiWwtHLiGtYyDKlxFaQ7A', 4, 1652208555, 9, 1, '', '', 'maulahaz.png', '2022-04-02 10:40:39', '2022-05-10 18:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `trongate_administrators`
--

CREATE TABLE `trongate_administrators` (
  `id` int(11) NOT NULL,
  `username` varchar(65) NOT NULL,
  `password` varchar(60) NOT NULL,
  `trongate_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trongate_administrators`
--

INSERT INTO `trongate_administrators` (`id`, `username`, `password`, `trongate_user_id`) VALUES
(11, 'admin', '$2y$11$bFw83r0WMnhFJSv3KYkpq.bNXMTBMpzc1JJP7bgGqWJ/y4isrFNEi', 1),
(12, 'maulahaz', '$2y$11$d1.4AyEQ/SIu8afFauOgg.G3iqssSNHKqODoUIU8UVjRYCk2GkZFi', 9),
(13, 'webmaster', '$2y$11$qmXHH8xeqbAJ4MssCdeLiejZg2HiDjXhlCzI8w.YqMqIZ1x9Z/.Wq', 10);

-- --------------------------------------------------------

--
-- Table structure for table `trongate_comments`
--

CREATE TABLE `trongate_comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_created` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `target_table` varchar(125) NOT NULL,
  `update_id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trongate_tokens`
--

CREATE TABLE `trongate_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(125) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `expiry_date` int(11) NOT NULL,
  `code` varchar(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trongate_users`
--

CREATE TABLE `trongate_users` (
  `id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `user_level_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trongate_users`
--

INSERT INTO `trongate_users` (`id`, `code`, `user_level_id`) VALUES
(1, 'UVsY8ASG5evncc4U6trru2XH5Tbq7MU5', 1),
(2, 'KnSFLzDw2M58FHhqZchvs9HRN8FtfG2Y', 2),
(3, 'tdyRnermNsT93FsxuvAXmbTh9mA7e6dY', 2),
(4, 'ppBVawMUFN5mjFvhpUAcgeS77q65e2ZB', 2),
(5, '67QezKg9MdWHPYYmSM2KB8fbLsBMUwDp', 2),
(6, 'NKaFdKs7YNp2hDqrXU5LhPaM2b5Vk8Sd', 2),
(7, 'RGdCrAFYLPSrqfj2YjYBe2WPxG47ksMx', 2),
(8, 'kLpzLeXEJDHu6FjA2kD6ZUtwLGCzAffu', 2),
(9, 'Y43d27YEWbLS7dhMdJmbeqPRPfKw7Kec', 88),
(10, 'QEtx5teNJ6rTHmz9qYY2PJhbDFphHLmS', 99);

-- --------------------------------------------------------

--
-- Table structure for table `trongate_user_levels`
--

CREATE TABLE `trongate_user_levels` (
  `id` int(11) NOT NULL,
  `level_title` varchar(125) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trongate_user_levels`
--

INSERT INTO `trongate_user_levels` (`id`, `level_title`) VALUES
(1, 'admin'),
(2, 'member'),
(88, 'admin'),
(99, 'webmaster');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penggunas`
--
ALTER TABLE `penggunas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_options`
--
ALTER TABLE `tbl_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_penjual`
--
ALTER TABLE `tbl_penjual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_transaksi_detail_transaksi` (`trans_dt`),
  ADD KEY `FK_transaksi_detail_produk` (`item_id`);

--
-- Indexes for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tokens`
--
ALTER TABLE `tbl_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_transaksi_users` (`customer_id`);

--
-- Indexes for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_transaksi_detail_transaksi` (`trans_id`),
  ADD KEY `FK_transaksi_detail_produk` (`item_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trongate_administrators`
--
ALTER TABLE `trongate_administrators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trongate_comments`
--
ALTER TABLE `trongate_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trongate_tokens`
--
ALTER TABLE `trongate_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trongate_users`
--
ALTER TABLE `trongate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trongate_user_levels`
--
ALTER TABLE `trongate_user_levels`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penggunas`
--
ALTER TABLE `penggunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_members`
--
ALTER TABLE `tbl_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_options`
--
ALTER TABLE `tbl_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_penjual`
--
ALTER TABLE `tbl_penjual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_tokens`
--
ALTER TABLE `tbl_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trongate_administrators`
--
ALTER TABLE `trongate_administrators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trongate_comments`
--
ALTER TABLE `trongate_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trongate_tokens`
--
ALTER TABLE `trongate_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trongate_users`
--
ALTER TABLE `trongate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `trongate_user_levels`
--
ALTER TABLE `trongate_user_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
