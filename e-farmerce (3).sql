-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2023 at 07:10 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-farmerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(100) NOT NULL,
  `user_id` int(200) NOT NULL,
  `product_id` int(200) NOT NULL,
  `order_qty` int(200) NOT NULL,
  `selected_mode` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `order_qty`, `selected_mode`) VALUES
(52, 6, 14, 20, 'Pick Up');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `barangay_id` int(50) NOT NULL,
  `municipality` varchar(41) NOT NULL,
  `barangay_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`barangay_id`, `municipality`, `barangay_name`) VALUES
(1, 'Oas', 'Balogo'),
(2, 'Oas', 'San Ramon'),
(3, 'Oas', 'San Agustin'),
(4, 'Oas', 'Maporong'),
(5, 'Oas', 'Maramba'),
(6, 'Oas', 'Badbad'),
(7, 'Oas', 'Saban'),
(8, 'Oas', 'Obaliw-Rinas'),
(9, 'Oas', 'Ilaor Sur'),
(10, 'Oas', 'Bagumbayan'),
(11, 'Libon', 'Alongong'),
(12, 'Libon', 'Apud'),
(13, 'Libon', 'Bacolod'),
(14, 'Libon', 'Bariw'),
(15, 'Libon', 'Bonbon'),
(16, 'Libon', 'Buga'),
(17, 'Libon', 'Bulusan'),
(18, 'Libon', 'Burabod'),
(19, 'Libon', 'Caguscos'),
(20, 'Libon', 'East Carisac'),
(21, 'Polangui', 'Alnay'),
(22, 'Polangui', 'Balinad'),
(23, 'Polangui', 'Napo'),
(24, 'Polangui', 'Ponso'),
(25, 'Polangui', 'Basud');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notif_id` bigint(255) NOT NULL,
  `seller_id` bigint(255) NOT NULL,
  `transact_code` varchar(50) NOT NULL,
  `buyer_id` int(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `mess_status` text NOT NULL DEFAULT 'Unread',
  `date_mess` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notif_id`, `seller_id`, `transact_code`, `buyer_id`, `message`, `mess_status`, `date_mess`) VALUES
(4, 7, '0X1JD8BV2Y', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:0X1JD8BV2Yis on the way to pick up location.', 'Read', '2023-09-19 07:54:39'),
(5, 8, '3299GCPEAY', 6, 'Hi Renz Palma,your order with transaction mode Deliver and order reference:3299GCPEAYis now approved by the seller.', 'Read', '2023-09-19 08:15:40'),
(6, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is now approved by the seller.', 'Read', '2023-09-19 08:19:20'),
(7, 8, '3299GCPEAY', 6, 'Hi Renz Palma,your order with transaction mode Deliver and order reference:3299GCPEAYis now approved by the seller.', 'Read', '2023-09-19 08:20:04'),
(8, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is on the way to pick up location.', 'Read', '2023-09-19 08:20:09'),
(9, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is now ready to pick up.', 'Read', '2023-09-19 08:20:13'),
(10, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is now ready to pick up.', 'Read', '2023-09-19 08:20:18'),
(11, 8, '3299GCPEAY', 6, 'Hi Renz Palma,your order with transaction mode Deliver and order reference:3299GCPEAYis now approved by the seller.', 'Read', '2023-09-19 08:20:31'),
(12, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now approved by the seller.', 'Read', '2023-09-19 12:12:50'),
(13, 7, '0I91RWAEQE', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:0I91RWAEQEis now approved by the seller.', 'Read', '2023-09-19 12:14:30'),
(14, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now approved by the seller.', 'Read', '2023-09-19 12:15:53'),
(15, 7, 'GLGXDHUW9H', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:GLGXDHUW9His on the way to pick up location.', 'Read', '2023-09-19 12:16:52'),
(16, 7, '0I91RWAEQE', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:0I91RWAEQEis now approved by the seller.', 'Read', '2023-09-19 12:31:56'),
(17, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now approved by the seller.', 'Read', '2023-09-19 12:36:06'),
(18, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now approved by the seller.', 'Read', '2023-09-19 12:38:08'),
(19, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is now approved by the seller.', 'Read', '2023-09-19 12:39:18'),
(20, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is now approved by the seller.', 'Read', '2023-09-19 12:42:19'),
(21, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now approved by the seller.', 'Read', '2023-09-19 12:45:17'),
(22, 7, '0I91RWAEQE', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:0I91RWAEQEis now approved by the seller.', 'Read', '2023-09-19 12:47:54'),
(23, 8, '68INX0LTN6', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:68INX0LTN6is now approved by the seller. Date of Transaction: 2023-09-20-09:02', 'Read', '2023-09-19 13:02:57'),
(24, 7, '0X1JD8BV2Y', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:0X1JD8BV2Yis now ready to pick up.', 'Read', '2023-09-20 02:48:35'),
(25, 7, '0X1JD8BV2Y', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:0X1JD8BV2Yis now ready to pick up.', 'Read', '2023-09-20 02:48:38'),
(26, 7, 'GLGXDHUW9H', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:GLGXDHUW9His now ready to pick up.', 'Read', '2023-09-20 06:01:28'),
(27, 7, 'GLGXDHUW9H', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:GLGXDHUW9His now ready to pick up.', 'Read', '2023-09-20 06:02:15'),
(28, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis on the way to pick up location.', 'Read', '2023-09-20 06:03:09'),
(29, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now ready to pick up.', 'Read', '2023-09-20 06:03:21'),
(30, 7, 'ZF1E1IOYVZ', 9, 'Hi Kurth Palma,your order with transaction mode Pick up and order reference:ZF1E1IOYVZis now already been picked up. Please leave a rating and comment on our service and product. Thank you!.', 'Read', '2023-09-20 06:09:19'),
(31, 7, 'WJL2UL78T0', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:WJL2UL78T0is now approved by the seller.', 'Read', '2023-09-20 09:47:41'),
(32, 7, 'WJL2UL78T0', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:WJL2UL78T0is on the way to pick up location.', 'Read', '2023-09-20 12:55:37'),
(33, 7, '1W7FCGVTOO', 6, 'Hi Renz Palma,your order with transaction mode Pick up and order reference:1W7FCGVTOOis now approved by the seller.', 'Read', '2023-09-21 03:20:20'),
(34, 7, 'WJL2UL78T0', 6, 'Hi Renz Palma R,your order with transaction mode Pick up and order reference:WJL2UL78T0is now ready to pick up.', 'Unread', '2023-09-22 04:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `seller_id` int(41) NOT NULL,
  `order_reference` varchar(20) NOT NULL,
  `product_id` int(50) NOT NULL,
  `order_qty` int(50) NOT NULL,
  `order_status` text NOT NULL,
  `order_total` bigint(50) NOT NULL,
  `date_place` datetime NOT NULL,
  `order_delivery_date` datetime DEFAULT NULL,
  `transact_mode` text NOT NULL,
  `order_rating` int(11) DEFAULT NULL,
  `order_comm` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `seller_id`, `order_reference`, `product_id`, `order_qty`, `order_status`, `order_total`, `date_place`, `order_delivery_date`, `transact_mode`, `order_rating`, `order_comm`) VALUES
(8, 6, 8, 'NXDXNUT1CP', 12, 23, 'Confirmed', 529, '2023-09-18 09:06:42', '0000-00-00 00:00:00', 'Deliver', 5, '0'),
(9, 6, 7, 'GLGXDHUW9H', 11, 32, 'Picked up', 736, '2023-09-18 09:06:42', '2023-09-20 10:30:00', 'Pick Up', 0, '0'),
(10, 6, 7, '0X1JD8BV2Y', 10, 20, 'Confirmed', 400, '2023-09-19 06:48:14', '2023-09-20 12:00:00', 'Pick Up', 4, 'nice'),
(11, 6, 7, '0X1JD8BV2Y', 11, 32, 'Confirmed', 736, '2023-09-19 06:48:14', '2023-09-20 12:00:00', 'Pick Up', 4, 'nice'),
(12, 6, 8, '3299GCPEAY', 12, 23, 'Confirmed', 529, '2023-09-19 06:48:14', '0000-00-00 00:00:00', 'Deliver', 5, 'Nice product'),
(13, 9, 8, '68INX0LTN6', 12, 23, 'Approved', 529, '2023-09-19 08:12:58', '2023-09-20 09:02:00', 'Pick Up', NULL, NULL),
(14, 9, 7, 'ZF1E1IOYVZ', 11, 32, 'Picked up', 736, '2023-09-19 08:12:58', '2023-09-21 20:46:00', 'Pick Up', NULL, NULL),
(15, 6, 7, '0I91RWAEQE', 10, 20, 'Cancelled', 400, '2023-09-19 20:12:07', '2023-09-21 08:47:00', 'Pick Up', NULL, NULL),
(16, 6, 7, '0I91RWAEQE', 11, 32, 'Cancelled', 736, '2023-09-19 20:12:07', '2023-09-21 08:47:00', 'Pick Up', NULL, NULL),
(17, 6, 7, '1W7FCGVTOO', 10, 20, 'Approved', 400, '2023-09-20 12:24:48', '2023-09-22 11:20:00', 'Pick Up', NULL, NULL),
(18, 6, 7, 'WJL2UL78T0', 10, 20, 'Ready to pick up', 400, '2023-09-20 17:45:52', '2023-09-28 10:47:00', 'Pick Up', NULL, NULL),
(19, 6, 7, 'WJL2UL78T0', 13, 100, 'Ready to pick up', 2000, '2023-09-20 17:45:52', '2023-09-28 10:47:00', 'Pick Up', NULL, NULL),
(20, 6, 7, 'VOU8HMZQ3P', 11, 32, 'Pending', 736, '2023-09-21 11:19:40', NULL, 'Pick Up', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_img` varchar(200) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` int(200) NOT NULL,
  `product_cat` text NOT NULL,
  `product_stock` int(200) NOT NULL,
  `min_order` int(100) NOT NULL,
  `product_details` varchar(200) NOT NULL,
  `seller_id` int(100) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_status` text NOT NULL DEFAULT 'On Sale' COMMENT 'On Sale, Sold'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_img`, `product_name`, `product_price`, `product_cat`, `product_stock`, `min_order`, `product_details`, `seller_id`, `date_added`, `product_status`) VALUES
(10, 'licensed-image.jpg', 'Petsay', 20, '', 940, 20, 'fresh', 7, '2023-09-20 09:45:52', 'On Sale'),
(11, 'kalabasa.jpg', 'Pumpkin', 23, '', 23, 32, 'pumpkin ', 7, '2023-09-21 11:15:57', 'On Sale'),
(12, '1200px-Bawang.jpg', 'Bawang', 23, '', 17, 23, 'mabango', 8, '2023-09-19 00:12:58', 'On Sale'),
(13, 'coco.jpg', 'coco', 20, 'fruit', 6, 100, 'Random size, per kilo not sako', 7, '2023-09-21 11:15:48', 'On Sale'),
(14, 'images (1).jpg', 'Mango', 25, 'fruit', 100, 20, 'Red Mango na may konting yelow', 7, '2023-09-21 10:19:39', 'On Sale');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` text NOT NULL,
  `number` varchar(13) NOT NULL,
  `address` varchar(50) NOT NULL,
  `municipality` varchar(20) NOT NULL,
  `user_type` text NOT NULL,
  `id_img` varchar(200) NOT NULL,
  `selfie_id` varchar(500) NOT NULL,
  `pickup_address` varchar(100) DEFAULT NULL,
  `delivery_area` varchar(200) NOT NULL,
  `forgot_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `fullname`, `number`, `address`, `municipality`, `user_type`, `id_img`, `selfie_id`, `pickup_address`, `delivery_area`, `forgot_code`) VALUES
(6, 'renzranoco12@gmail.com', 'niceone', 'Renz Palma R', '09158374062', 'Balinad,Polangui', 'Polangui', 'Buyer', 'cor.jpg', 'ibu-timetable.png', '', 'Purok 7, Balinad, Polangui, Albay', ''),
(7, 'jonaliza@gmail.com', 'asd', 'Jonaliza Moralde', '2147483647', 'Alongong,Libon', '', 'Seller', 'desktop-wallpaper-stylish-boys-cool-profile-pics-dp-for-facebook-whatsapp-2019-boy-smoke-thumbnail.jpg', 'desktop-wallpaper-stylish-boys-cool-profile-pics-dp-for-facebook-whatsapp-2019-boy-smoke-thumbnail.jpg', 'Polangui, Centro', 'Libon', ''),
(8, 'lionese@gmail.com', 'asd', 'Lionese Ramos', '2147483647', 'Alnay,Polangui', '', 'Seller', 'cor.jpg', '367702770_226088637064083_5716047942073789741_n.jpg', 'Polangui, Centro', 'Polangui', ''),
(9, 'kurth@gmail.com', 'asd', 'Kurth Palma', '2147483647', 'Balogo,Oas', 'Oas', 'Buyer', 'desktop-wallpaper-stylish-boys-cool-profile-pics-dp-for-facebook-whatsapp-2019-boy-smoke-thumbnail.jpg', 'desktop-wallpaper-stylish-boys-cool-profile-pics-dp-for-facebook-whatsapp-2019-boy-smoke-thumbnail.jpg', NULL, 'Sampalok, St Balogo, Oas, Albay', ''),
(10, 'admin@gmail.com', 'admin', '', '', '', '', 'Admin', '', '', NULL, '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`barangay_id`),
  ADD KEY `municipality_id` (`municipality`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notif_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `barangay_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notif_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
