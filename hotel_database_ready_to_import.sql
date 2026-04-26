-- Hotel Management System Database
-- Ready to import for hosting
-- Database: flaskdb

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Create database
--
CREATE DATABASE IF NOT EXISTS `flaskdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `flaskdb`;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `price`, `available`, `created_at`) VALUES
(1, 'Spa Treatment', 500.00, 1, '2026-04-18 03:11:01'),
(3, 'Breakfast Buffet', 250.00, 1, '2026-04-18 03:11:01'),
(4, 'Late Checkout', 200.00, 1, '2026-04-18 03:11:01'),
(5, 'Extra Bed', 150.00, 1, '2026-04-18 03:11:01'),
(6, 'Gym Access', 100.00, 1, '2026-04-18 03:11:01'),
(7, 'Pool Access', 80.00, 1, '2026-04-18 03:11:01'),
(8, 'WiFi Premium', 50.00, 1, '2026-04-18 03:11:01'),
(9, 'Kitchen', 1000.00, 1, '2026-04-18 07:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `addon_orders`
--

CREATE TABLE `addon_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkin_id` int(11) NOT NULL,
  `addon_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `order_time` datetime DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `checkin_id` (`checkin_id`),
  KEY `addon_id` (`addon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `check_in_time` datetime NOT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `status` enum('checked-in','checked-out') DEFAULT 'checked-in',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) DEFAULT 0.00,
  `downpayment_amount` decimal(10,2) DEFAULT 0.00,
  `remaining_balance` decimal(10,2) DEFAULT 0.00,
  `payment_status` enum('unpaid','partial','fully_paid') DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkins`
--

INSERT INTO `checkins` (`id`, `reservation_id`, `room_id`, `guest_name`, `check_in_time`, `check_out_time`, `status`, `created_at`, `total_price`, `downpayment_amount`, `remaining_balance`, `payment_status`) VALUES
(11, NULL, 6, 'ALLAN', '2026-04-19 11:31:38', '2026-04-19 17:59:58', 'checked-out', '2026-04-19 02:31:38', 0.00, 0.00, 0.00, 'unpaid'),
(12, NULL, 8, 'DENZ BALILI', '2026-04-19 18:35:30', '2026-04-19 18:38:56', 'checked-out', '2026-04-19 09:35:30', 0.00, 0.00, 0.00, 'unpaid'),
(13, NULL, 10, 'kyle vince', '2026-04-19 18:36:27', '2026-04-19 18:38:17', 'checked-out', '2026-04-19 09:36:27', 0.00, 0.00, 0.00, 'unpaid'),
(14, NULL, 8, 'LOVELY', '2026-04-19 19:08:58', '2026-04-19 19:17:13', 'checked-out', '2026-04-19 10:08:58', 0.00, 0.00, 0.00, 'unpaid'),
(15, NULL, 8, 'JAYSON', '2026-04-19 19:19:50', '2026-04-19 19:20:00', 'checked-out', '2026-04-19 10:19:50', 0.00, 0.00, 0.00, 'unpaid'),
(16, NULL, 6, 'LOVELY', '2026-04-20 23:01:16', '2026-04-20 23:09:52', 'checked-out', '2026-04-20 14:01:16', 460.00, 0.00, 460.00, 'unpaid'),
(17, NULL, 8, 'JAYSON', '2026-04-20 23:04:09', '2026-04-20 23:14:01', 'checked-out', '2026-04-20 14:04:09', 2000.00, 0.00, 2000.00, 'unpaid'),
(18, NULL, 9, 'DENZ BALILI', '2026-04-20 23:05:52', '2026-04-20 23:06:04', 'checked-out', '2026-04-20 14:05:52', 4500.00, 1000.00, 3500.00, 'partial'),
(19, NULL, 9, 'ALLAN', '2026-04-20 23:16:54', '2026-04-20 23:17:55', 'checked-out', '2026-04-20 14:16:54', 3000.00, 1000.00, 2000.00, 'partial'),
(20, NULL, 8, 'ALLAN', '2026-04-20 23:28:32', '2026-04-20 23:28:42', 'checked-out', '2026-04-20 14:28:32', 2000.00, 1500.00, 500.00, 'partial'),
(21, NULL, 8, 'ALING MADEL', '2026-04-20 23:38:41', '2026-04-20 23:39:13', 'checked-out', '2026-04-20 14:38:41', 3000.00, 1000.00, 2000.00, 'partial');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` enum('drinks','appetizers','mains','desserts') DEFAULT 'mains',
  `available` tinyint(1) DEFAULT 1,
  `image` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `price`, `category`, `available`, `image`, `created_at`) VALUES
(2, 'Tea', 40.00, 'drinks', 1, 'f0365347-3a5d-4465-83f1-7ebf2ff4c69d.webp', '2026-04-18 03:11:01'),
(3, 'Orange Juice', 60.00, 'drinks', 1, '96f37330-9fb8-4f57-b795-758d88644d48.jpg', '2026-04-18 03:11:01'),
(4, 'Soft Drinks', 45.00, 'drinks', 1, 'ae05705e-2ee5-4810-8c7b-d080778478e0.webp', '2026-04-18 03:11:01'),
(5, 'Chips', 80.00, 'appetizers', 1, '99ebc5b2-86ba-4ff5-b251-94c199328655.webp', '2026-04-18 03:11:01'),
(6, 'Sandwich', 120.00, 'appetizers', 1, 'a52b7a46-318d-466f-9fd6-94230545b6c9.webp', '2026-04-18 03:11:01'),
(7, 'Fried Rice', 180.00, 'mains', 1, '82cc183c-9fc4-4b54-8a5a-7538799dce24.webp', '2026-04-18 03:11:01'),
(8, 'Pasta', 200.00, 'mains', 1, '9fef9450-5f4e-46b4-b66a-0a8732c6c2ca.webp', '2026-04-18 03:11:01'),
(9, 'Grilled Chicken', 350.00, 'mains', 1, '2e8ee68f-68f0-4b5b-80c0-fa8f2cd89f98.webp', '2026-04-18 03:11:01'),
(10, 'Beef Steak', 450.00, 'mains', 1, 'd1ab5c40-e37a-4964-a656-af3f28446868.webp', '2026-04-18 03:11:01'),
(11, 'Cake', 150.00, 'desserts', 1, 'da16bfc2-c157-45d2-afa5-0b1ac57d2890.webp', '2026-04-18 03:11:01'),
(12, 'Ice Cream', 100.00, 'desserts', 1, 'aca50998-7792-4415-8c60-30a845052a5e.webp', '2026-04-18 03:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `food_orders`
--

CREATE TABLE `food_orders` (
  `id` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','prepared','delivered') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_orders`
--

INSERT INTO `food_orders` (`id`, `checkin_id`, `item_name`, `quantity`, `price`, `order_time`, `status`) VALUES
(3, 11, 'Orange Juice', 1, 60.00, '2026-04-19 03:07:33', 'pending'),
(5, 11, 'Tea', 2, 40.00, '2026-04-19 03:10:01', 'pending'),
(6, 11, 'Chips', 1, 80.00, '2026-04-19 03:10:01', 'pending'),
(7, 11, 'Chips', 1, 80.00, '2026-04-19 08:57:34', 'pending'),
(8, 11, 'Sandwich', 1, 120.00, '2026-04-19 08:57:34', 'pending'),
(9, 11, 'Orange Juice', 1, 60.00, '2026-04-19 08:57:34', 'pending'),
(10, 11, 'Beef Steak', 1, 450.00, '2026-04-19 08:57:34', 'pending'),
(11, 11, 'Sandwich', 2, 120.00, '2026-04-19 08:59:06', 'pending'),
(12, 13, 'Orange Juice', 1, 60.00, '2026-04-19 09:37:28', 'pending'),
(13, 13, 'Beef Steak', 1, 450.00, '2026-04-19 09:37:28', 'pending'),
(14, 16, 'Sandwich', 1, 120.00, '2026-04-20 14:09:16', 'pending'),
(15, 16, 'Beef Steak', 1, 450.00, '2026-04-20 14:09:16', 'pending'),
(16, 21, 'Sandwich', 1, 120.00, '2026-04-20 14:38:59', 'pending'),
(17, 21, 'Beef Steak', 1, 450.00, '2026-04-20 14:38:59', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` enum('cash','card','transfer') DEFAULT 'cash',
  `status` enum('pending','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `checkin_id`, `amount`, `payment_type`, `status`, `created_at`, `reservation_id`) VALUES
(9, 11, 1428.00, 'cash', 'completed', '2026-04-19 08:59:58', NULL),
(10, 13, 3070.20, 'cash', 'completed', '2026-04-19 09:38:17', NULL),
(11, 12, 1020.00, 'cash', 'completed', '2026-04-19 09:38:56', NULL),
(12, 14, 1020.00, 'cash', 'completed', '2026-04-19 10:17:13', NULL),
(13, 15, 1020.00, 'cash', 'completed', '2026-04-19 10:20:00', NULL),
(14, 18, 4590.00, 'cash', 'completed', '2026-04-20 14:06:04', NULL),
(15, 16, 1050.60, 'cash', 'completed', '2026-04-20 14:09:52', NULL),
(16, 17, 2040.00, 'cash', 'completed', '2026-04-20 14:12:38', NULL),
(17, 17, 2040.00, 'cash', 'completed', '2026-04-20 14:14:01', NULL),
(18, 19, 3060.00, 'cash', 'completed', '2026-04-20 14:17:55', NULL),
(19, 20, 2040.00, 'cash', 'completed', '2026-04-20 14:28:42', NULL),
(20, 21, 3641.40, 'cash', 'completed', '2026-04-20 14:39:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `downpayment_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `guest_name`, `email`, `phone`, `room_id`, `check_in`, `check_out`, `status`, `created_at`, `downpayment_amount`) VALUES
(37, 'LOVELY', 'admin@hotel.com', '01083196772', 6, '2026-04-21', '2026-04-23', 'confirmed', '2026-04-20 14:15:41', 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `type` enum('single','double','suite') DEFAULT 'single',
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','occupied','maintenance') DEFAULT 'available',
  `image` varchar(800) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `type`, `price`, `status`, `image`, `created_at`) VALUES
(6, '101', 'single', 230.00, 'available', 'b2f3fcfd-a671-4534-9936-0785dabce49a.webp', '2026-04-18 23:13:08'),
(8, '105', 'double', 1000.00, 'available', '3711983a-9d44-4eb2-b842-26aadcf2df28.webp', '2026-04-18 23:13:25'),
(9, 'kubo1', 'single', 1500.00, 'available', '5d324573-aea6-41b8-a0c3-e5a05dc9aba6.jpg', '2026-04-18 23:13:36'),
(10, 'Kubo2', 'single', 2500.00, 'available', 'f753e947-90d8-4c30-aad0-86a2bbdc9f22.jpg', '2026-04-18 23:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'currency', 'PHP'),
(2, 'currency_symbol', 'P'),
(3, 'language', 'en'),
(4, 'theme', 'blue'),
(5, 'logo', '53c64421-5464-46fe-8ec3-c0fb91adc701.png'),
(43, 'company_name', 'Denztech'),
(44, 'company_tax_id', ''),
(45, 'company_address', ''),
(46, 'company_phone', ''),
(47, 'company_email', 'sakurano20@gmail.com'),
(48, 'company_website', ''),
(61, 'staff_can_confirm', 'false'),
(62, 'staff_can_cancel', 'false'),
(63, 'staff_can_delete', 'false'),
(64, 'email_enabled', 'true'),
(65, 'email_smtp_host', 'smtp.gmail.com'),
(66, 'email_smtp_port', '587'),
(67, 'email_smtp_user', 'sakurano20@gmail.com'),
(68, 'email_smtp_password', 'lxox ptyu cqmy dvnn'),
(69, 'email_sender', 'sakurano20@gmail.com'),
(70, 'email_sender_name', 'HotelMS'),
(71, 'email_confirmation', 'true'),
(72, 'email_cancellation', 'false'),
(205, 'email_confirmation_subject', ''),
(206, 'email_cancellation_subject', ''),
(230, 'email_confirmation_body', ''),
(232, 'email_cancellation_body', ''),
(233, 'email_footer', ''),
(468, 'tax_rate', '2'),
(492, 'app_name', 'DNZTech '),
(501, 'logo_icon', 'building'),
(539, 'logo_size', '44'),
(566, 'logo_width', ''),
(596, 'require_downpayment', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `role`, `created_at`) VALUES
(1, 'admin@hotel.com', 'admin123', 'Administrator', 'admin', '2026-04-18 03:11:01'),
(2, 'denzbalili_19@yahoo.com', '123456', 'denz', 'staff', '2026-04-18 06:54:33'),
(3, 'sakurano20@gmail.com', '123456', 'denz', 'admin', '2026-04-18 08:54:46');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `reservation_id` (`reservation_id`);

ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkin_id` (`checkin_id`);

ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkin_id` (`checkin_id`);

ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

-- --------------------------------------------------------

--
-- AUTO_INCREMENT for dumped tables
--

ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `addon_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `checkins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `food_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

ALTER TABLE `addon_orders`
  ADD CONSTRAINT `addon_orders_ibfk_1` FOREIGN KEY (`checkin_id`) REFERENCES `checkins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_orders_ibfk_2` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE;

ALTER TABLE `checkins`
  ADD CONSTRAINT `checkins_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `checkins_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

ALTER TABLE `food_orders`
  ADD CONSTRAINT `food_orders_ibfk_1` FOREIGN KEY (`checkin_id`) REFERENCES `checkins` (`id`);

ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`checkin_id`) REFERENCES `checkins` (`id`);

ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
