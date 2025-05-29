-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2025 at 02:54 PM
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
-- Database: `manage_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `create_day` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `category_id`, `amount`, `image`, `create_day`) VALUES
(36, 'Đắc Nhân Tâm', 22, 5, 'Dac-nhan-tam.jpg', '2025-05-25 14:30:06'),
(37, 'Dám ước mơ', 22, 6, 'dam-uoc-mo.jpg', '2025-05-25 14:30:36'),
(38, 'Nghĩ Lớn Để Thành Công', 23, 4, 'nghi-lon-de-thanh-cong.jpg', '2025-05-25 14:30:49'),
(39, '360 Động Từ Bất Quy Tắc Đầy Đủ', 24, 5, '360-dong-tu-bat-quy-tac-day-du.jpg', '2025-05-25 14:31:01'),
(40, 'Khi Người Ta Tư Duy', 22, 5, 'khi-nguoi-ta-tu-duy.jpg', '2025-05-25 14:32:05'),
(41, 'Chiêu Bài Quản Lý Vàng Của Bill Gates ', 23, 6, 'chieu-bai-quan-ly-vang-cua-bill-gates.jpg', '2025-05-25 14:33:23'),
(42, 'Tự Học Tiếng Anh Hiệu Quả', 24, 5, 'tu-hoc-tieng-anh-hieu-qua.jpg', '2025-05-25 14:35:14'),
(43, 'Hands on machine learning with scikit learn and tensorflow', 25, 2, 'hands on machine learning with scikit learn and tensorflow.jpg', '2025-05-25 14:38:54'),
(44, 'Mặt Trời Và Con Người', 22, 1, 'mat-troi-va-con-nguoi.jpg', '2025-05-25 14:41:28'),
(45, 'Từ Tốt Đến Vĩ Đại', 23, 4, 'tu-tot-den-vi-dai.jpg', '2025-05-25 14:42:13'),
(46, 'Hạnh Phúc Thật Giản Đơn', 22, 1, 'hanh-phuc-that-gian-don.jpg', '2025-05-25 14:43:14'),
(52, 'Mật thư', 29, 4, 'mat-thu.jpg', '2025-05-25 12:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(22, 'Tâm Lý - Kỹ Năng Sống'),
(23, 'Kinh Tế Quản Lý'),
(24, 'Ngoại Ngữ'),
(25, 'Lập Trình'),
(29, 'Khoa học kỹ thuật');

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `book_id` int(11) NOT NULL,
  `identity_card` varchar(15) NOT NULL,
  `start_day` timestamp NULL DEFAULT current_timestamp(),
  `end_day` timestamp NULL DEFAULT NULL,
  `status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reader`
--

INSERT INTO `reader` (`id`, `name`, `book_id`, `identity_card`, `start_day`, `end_day`, `status`) VALUES
(17, 'Nguyễn Văn A', 46, '12213231', '2025-05-26 14:45:32', '2025-05-28 17:00:00', b'0'),
(18, 'Nguyễn Văn B', 45, '12345678', '2025-05-26 14:45:54', '2025-05-28 17:00:00', b'0'),
(19, 'Lê Thị C', 44, '12213231', '2025-05-26 14:46:25', '2025-05-28 17:00:00', b'0'),
(20, 'Lê Minh Đức', 43, '22312313', '2025-05-26 14:46:47', '2025-05-28 17:00:00', b'0'),
(21, 'Nguyễn Văn D', 38, '121345446', '2025-05-26 14:47:46', '2025-05-27 17:00:00', b'1'),
(22, 'Lê Đức Anh', 43, '244443242', '2025-05-26 14:48:34', '2025-05-27 17:00:00', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '1234567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reader`
--
ALTER TABLE `reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `reader`
--
ALTER TABLE `reader`
  ADD CONSTRAINT `reader_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
