-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2026 at 07:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wearzone`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `size` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `size`, `price`) VALUES
(1, 2, 1, 6, NULL, NULL),
(9, 26, 10, 1, NULL, NULL),
(11, 27, 10, 1, NULL, NULL),
(13, 28, 10, 1, NULL, NULL),
(35, 32, 9, 1, NULL, NULL),
(36, 32, 10, 1, NULL, NULL),
(49, 29, 4, 1, 'M', 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(6, 'Kurata'),
(1, 'Shirts'),
(2, 'T-Shirts');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT 0.00,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_code`, `discount_type`, `discount_value`, `min_order_amount`, `start_date`, `end_date`, `status`) VALUES
(2, 'hello', 'percentage', 20.00, 1.00, '2025-05-09', '0026-11-12', 'Active'),
(5, 'WELCOME-10', 'percentage', 10.00, 0.00, '2026-09-06', '2026-09-30', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `offer_id` int(100) NOT NULL,
  `offer_name` varchar(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `discount` int(100) NOT NULL,
  `start_date` int(100) NOT NULL,
  `end_date` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offer_id` int(11) NOT NULL,
  `offer_name` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`offer_id`, `offer_name`, `product_id`, `discount`, `start_date`, `end_date`) VALUES
(1, 'navratri ', 1, 10.00, '2026-08-12', '2026-08-31'),
(4, 'diwali', 6, 20.00, '2025-06-09', '2026-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `payment_method` varchar(50) NOT NULL DEFAULT 'Cash on Delivery'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `order_date`, `customer_name`, `mobile`, `address`, `status`, `payment_method`) VALUES
(7, 22, 2000.00, '2026-07-28 15:10:43', 'S Rutik', '9484546225', 'surat\r\n', 'Delivered', 'Cash on Delivery'),
(8, 22, 5000.00, '2026-08-02 03:51:13', 'S Rutik', '9925248426', 'nesadi\r\n', 'Delivered', 'Cash on Delivery'),
(23, 31, 3600.00, '2026-09-25 12:28:00', 'paras parmar', '6352154133', 'good qulity', 'Pending', 'Cash on Delivery'),
(24, 31, 16900.00, '2026-09-26 05:52:26', 'Paras Parmar', '6352154133', 'sdfg', 'Pending', 'Cash on Delivery'),
(25, 31, 18600.00, '2026-09-27 16:11:48', 'vijay', '5645614561', 'surat', 'Pending', 'Cash on Delivery'),
(26, 31, 10400.00, '2026-09-27 16:58:15', 'Paras Parmar', '8849727678', 'amreli', 'Pending', 'Cash on Delivery'),
(27, 31, 2600.00, '2026-09-27 17:01:03', 'Paras Parmar', '6352154133', 'rajkot', 'Pending', 'Cash on Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `size` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_image`, `price`, `quantity`, `total`, `size`) VALUES
(1, 7, 9, 'Shirt', 'CSMOVSRT8791_1_1e78a95d-890e-4c1e-8712-6598eee56338[1].jpg', 2000.00, 1, 2000.00, ''),
(2, 8, 10, 'Shirt', 'images[1]', 2500.00, 2, 5000.00, ''),
(22, 23, 9, 'Shirt', 'CSMOVSRT8791_1_1e78a95d-890e-4c1e-8712-6598eee56338[1].jpg', 2000.00, 2, 4000.00, ''),
(23, 24, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 3, 7800.00, ''),
(24, 24, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 1, 2600.00, ''),
(25, 24, 10, 'Shirt', 'images[1]', 2500.00, 1, 2500.00, ''),
(26, 24, 9, 'Shirt', 'CSMOVSRT8791_1_1e78a95d-890e-4c1e-8712-6598eee56338[1].jpg', 2000.00, 2, 4000.00, ''),
(27, 25, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 4, 10400.00, ''),
(28, 25, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 1, 2600.00, ''),
(29, 25, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 1, 2600.00, ''),
(30, 25, 6, 'Shirt', 'Front_95d0ba9e-1538-471f-a17d-df56fbeacc1c[1].png', 1500.00, 2, 3000.00, ''),
(31, 26, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 2, 5200.00, 'M'),
(32, 26, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 1, 2600.00, 'L'),
(33, 26, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 1, 2600.00, 'XL'),
(34, 27, 11, 'Cotton kurta', '71a6lLpsfGL._SY741_[1].jpg', 2600.00, 1, 2600.00, 'L');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `size_prices` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category`, `price`, `stock`, `description`, `image`, `created_at`, `size_prices`) VALUES
(4, 'T-Shirt', 'T-Shirt', 2000.00, '68', 'best product', 'download.webp', '2026-07-22 15:36:39', '{\"S\":2000,\"M\":2000,\"L\":2000,\"XL\":2100,\"XXL\":2200}'),
(6, 'Shirt', 'Shirt', 1500.00, '47', '', 'Front_95d0ba9e-1538-471f-a17d-df56fbeacc1c[1].png', '2026-07-22 15:44:11', NULL),
(9, 'Shirt', 'Shirt', 2000.00, '41', '', 'CSMOVSRT8791_1_1e78a95d-890e-4c1e-8712-6598eee56338[1].jpg', '2026-07-22 16:27:28', NULL),
(10, 'Shirt', 'Shirt', 2500.00, '22', '', 'images[1]', '2026-07-22 16:28:27', NULL),
(11, 'Cotton kurta', 'Kurta', 2600.00, '65', '', '71a6lLpsfGL._SY741_[1].jpg', '2026-09-06 16:08:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `mobile`, `password`) VALUES
(26, 'paras', 'paras@gmaiil.com', '9484546225', '$2y$10$NGdYAct0tviKfBEiADcoHOG8YvarmS9us.27Z132sDZ.Bl/x6fsqC'),
(27, 'paras1', 'parasn@gmaiil.com', '6352113236', '$2y$10$RZefzsiBtNhbo4nqv3Dwl.AsF.f08bQ9MvjYKDFaDd.WZhmgDWlvq'),
(29, 'Rutik', 'rutiks928@gmail.com', '9484546225', '$2y$10$fOdlj3T7NRPTJHkkqcC01OeLMDo7TV74m.EbK12dcaMleiGtcxeYa'),
(30, 'hetal', 'hetvi@gmail.com', '9484546225', '$2y$10$QlvKzO/qXeAOPJOoP8oCPOPElR4wtWqhCy06RP0.tHp9JvzLEahZy'),
(31, 'paras@gmail.com', 'parasppparmar@gmail.com', '6352154133', '$2y$10$P/1XWyHuifZws2SAJjYi3.Az7cxhUwEqcDcaEKCXUekFuXfWXZR2G'),
(32, 'jenu', 'jenu@gmail.com', '8849727678', '$2y$10$04q/CFJNuKvyL.rumTIkbu62.VaKslLVJ2Ah3isf9cHIjb8Wa3LpC');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(3, 30, 10, '2026-08-08 12:48:03'),
(7, 29, 9, '2026-08-30 15:08:47'),
(8, 29, 6, '2026-08-30 15:08:59'),
(9, 29, 4, '2026-08-30 15:09:03'),
(10, 29, 10, '2026-08-30 15:09:07'),
(11, 31, 11, '2026-09-25 04:41:46'),
(12, 31, 10, '2026-09-25 04:46:42'),
(13, 31, 9, '2026-09-25 04:46:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
