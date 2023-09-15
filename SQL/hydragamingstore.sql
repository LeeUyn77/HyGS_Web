-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 11, 2019 lúc 06:27 AM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hydragamingstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `birthday` date NOT NULL,
  `date_created` date NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`account_id`, `username`, `password`, `fullname`, `gender`, `birthday`, `date_created`, `point`) VALUES
(1, 'Super_Admin', '123', 'Nguyen Van A', 'Male', '1997-11-06', '2019-11-14', 1000),
(2, 'Admin', '123', 'Nguyen Van Admin', 'Male', '2019-10-01', '2019-10-02', 0),
(5, 'User_1', '123', 'Nguyen Van E', 'Male', '1998-02-17', '2019-11-21', 1960),
(6, 'User_2', '123', 'Nguyen Van F', 'Female', '1992-11-17', '2019-11-19', 350),
(7, 'User_3', '123', 'Nguyen Van G', 'Male', '2000-01-12', '2019-11-28', 0),
(8, 'name1', '123', 'addada', 'Male', '0026-03-26', '2019-12-11', 0),
(11, 'name2', '', 'addada', 'Female', '2003-10-20', '2019-12-11', 0),
(12, 'name2', '', 'addada', 'Female', '2003-10-20', '2019-12-11', 0),
(13, 'User_Update', '123', 'addada', 'Male', '2019-07-01', '2019-07-01', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'ELECTRONIC'),
(2, 'GAME'),
(3, 'ACCESSORIES');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `stars` int(10) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `account_id` (`account_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `product_id`, `account_id`, `content`, `status`, `stars`) VALUES
(1, 1, 5, 'This is first comment', 1, 0),
(2, 5, 5, 'This is Good', 1, 5),
(3, 5, 6, 'This not really Good', 1, 5),
(4, 33, 5, 'this is good', 1, 4),
(5, 33, 5, 'this is good', 0, 2),
(6, 33, 5, 'this is good', 0, 4),
(7, 33, 5, 'this is good', 0, 4),
(8, 52, 5, 'this is bad', 1, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `date_order` date NOT NULL,
  `trade_type` varchar(250) NOT NULL,
  `invoice_total` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `account_id` (`account_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `account_id`, `date_order`, `trade_type`, `invoice_total`, `status`) VALUES
(1, 5, '2019-11-10', 'Cash', 1948.47, 1),
(2, 6, '2019-11-28', 'PayPal', 709.87, 1),
(3, 7, '2019-12-01', 'Cash', 1377.47, 1),
(4, 5, '2019-12-10', 'Point', 531.35, 1),
(5, 5, '2019-12-10', 'Cash', 11.1, 0),
(6, 5, '2019-12-10', 'Cash', 11.1, 0),
(7, 5, '2019-12-10', 'Cash', 49, 0),
(8, 5, '2019-12-10', 'Cash', 12.99, 0),
(9, 5, '2019-12-10', 'Cash', 62.99, 0),
(10, 5, '2019-12-10', 'Cash', 61.99, 0),
(11, 5, '2019-12-10', 'Cash', 61.99, 0),
(12, 5, '2019-12-10', 'Cash', 12.99, 0),
(13, 5, '2019-12-10', 'Cash', 12.99, 0),
(14, 5, '2019-12-10', 'Cash', 13.99, 0),
(15, 5, '2019-12-10', 'Cash', 188.97, 0),
(16, 5, '2019-12-10', 'Cash', 188.97, 0),
(17, 5, '2019-12-10', 'Paypal', 20.99, 0),
(18, 5, '2019-12-10', 'Paypal', 59.98, 0),
(19, 5, '2019-12-10', 'Paypal', 31.979999999999997, 0),
(20, 5, '2019-12-10', 'Paypal', 63.980000000000004, 0),
(21, 5, '2019-12-10', 'Paypal', 23.93, 0),
(22, 5, '2019-12-11', 'Cash', 461.90999999999997, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE IF NOT EXISTS `invoice_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `invoice_id`, `product_id`, `amount`, `price`, `total`) VALUES
(1, 1, 2, 1, 549.95, 549.95),
(2, 1, 25, 4, 207.75, 831),
(3, 1, 37, 1, 229.99, 229.99),
(4, 1, 43, 1, 298.04, 298.04),
(5, 1, 51, 1, 15.56, 15.56),
(6, 1, 52, 1, 23.93, 23.93),
(7, 2, 5, 2, 223.95, 447.9),
(8, 2, 16, 1, 197, 197),
(9, 2, 26, 1, 36.99, 36.99),
(10, 2, 33, 2, 13.99, 27.98),
(11, 3, 6, 1, 799.99, 799.99),
(12, 3, 7, 1, 308, 308),
(13, 3, 8, 1, 229.99, 229.99),
(14, 3, 51, 1, 15.56, 15.56),
(15, 3, 52, 1, 23.93, 23.93),
(16, 4, 15, 1, 1.99, 1.99),
(17, 4, 23, 3, 149.79, 449.37),
(18, 4, 47, 1, 79.99, 79.99),
(19, 10, 32, 1, 49, 49),
(20, 10, 31, 1, 12.99, 12.99),
(21, 12, 31, 1, 12.99, 12.99),
(22, 14, 33, 1, 13.99, 13.99),
(23, 15, 33, 3, 13.99, 41.97),
(24, 17, 30, 1, 20.99, 20.99),
(25, 18, 53, 2, 29.99, 59.98),
(26, 19, 53, 1, 29.99, 29.99),
(27, 19, 15, 1, 1.99, 1.99),
(28, 20, 33, 1, 13.99, 13.99),
(29, 20, 54, 1, 49.99, 49.99),
(30, 21, 52, 1, 23.93, 23.93),
(31, 22, 33, 3, 13.99, 41.97),
(32, 22, 34, 3, 139.98, 419.93999999999994);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(250) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `amount` int(11) NOT NULL,
  `detail` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `product_name`, `photo`, `category_id`, `price`, `amount`, `detail`) VALUES
(1, 'Acer Aspire 5 Slim Laptop, 15.6 inches Full HD IPS Display\r\n', 'Elec_1.jpg', 1, 309.94, 100, 'Detail 1'),
(2, 'Lenovo Flex 14 2-in-1 Convertible Laptop, 14 Inch FHD Touchscreen Display\r\n', 'Elec_2.jpg', 1, 549.95, 30, 'Detail 2'),
(3, 'Newest Flagship Premium 2019 Lenovo Ideapad S145 15.6 HD Laptop PC', 'Elec_3.jpg', 1, 379, 20, 'Detail 3'),
(4, 'HP Pavilion 15.6 HD 2019 Newest Thin and Light Laptop Notebook Computer', 'Elec_4.jpg', 1, 368, 45, 'Detail 4'),
(5, '2018 Acer 15.6\" HD WLED Chromebook 15 with 3X Faster WiFi Laptop Computer\r\n', 'Elec_5.jpg', 1, 197, 37, 'Detail 5'),
(6, 'Acer Spin 3 Convertible Laptop, 14 inches Full HD IPS Touch\r\n', 'Elec_6.jpg', 1, 799.99, 28, 'Detail 6'),
(7, '2019 HP 14, 14\" HD Thin & Light Flagship Laptop Computer\r\n', 'Elec_7.jpg', 1, 308, 10, 'Detail 7'),
(8, 'HP 2018 Elitebook 840 G1 14\' HD LED-backlit anti-glare Laptop Computer\r\n', 'Elec_8.jpg', 1, 229.99, 18, 'Detail 8'),
(9, '2019 ASUS VivoBook F510QA 15.6” WideView FHD Laptop Computer\r\n', 'Elec_9.jpg', 1, 309, 18, 'Detail 9'),
(10, 'Dell Inspiron 15 5000, 2019 15.6\" FHD Touchscreen Laptop\r\n', 'Elec_10.jpg', 1, 489, 19, 'Detail 10'),
(11, 'HITMAN 2 - Gold Edition', 'Game_1.jpg', 2, 34.46, 20, 'Detail 11'),
(12, 'Temple Run 2', 'Game_2.jpg', 2, 20, 80, 'Detail 12'),
(13, 'Minecraft', 'Game_3.jpg', 2, 6.99, 59, 'Detail 13'),
(14, 'HP 15.6in Laptop Intel 4000 2.60GHz 4GB 500GB DVDRW HDMI Bluetooth Windows 10 (Renewed)', 'Acce_1.jpg', 3, 218.99, 36, 'Detail 14'),
(15, 'Geometry Dash', 'Game_4.jpg', 2, 1.99, 120, 'Detail 15'),
(16, 'PowerLead Mobile Game Controller PG-9118 Wireless Gamepad\r\n', 'Acce_2.jpg', 3, 36.99, 75, 'Detail 16'),
(17, 'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin Zero Frame Monitor (HDMI & VGA port)', 'Elec_11.jpg', 1, 89.99, 28, 'Detail 17'),
(18, 'HP 23.8-inch FHD IPS Monitor with Tilt/Height Adjustment (VH240a, Black)', 'Elec_12.jpg', 1, 109.99, 37, 'Detail 18'),
(19, 'Sceptre E205W-16003R 20\" 75Hz Ultra Thin Frameless LED Monitor\r\n', 'Elec_13.jpg', 1, 145, 178, 'Detail 19'),
(20, 'Samsung 27\" FHD Flat Monitor with Super-Slim Design - LS27F354FHNXZA', 'Elec_14.jpg', 1, 149.99, 190, 'Detail 20'),
(21, 'Sceptre 24 Inch FHD LED Gaming Monitor 75Hz 2X HDMI VGA Build-in Speakers, Metal Black 2018', 'Elec_15.jpg', 1, 89.99, 38, 'Detail 21'),
(22, 'AOC U2790VQ 27\" 4K 3840x2160 UHD Frameless Monitor, IPS, 5ms, 1 Billion+ Colors, DisplayPort/HDMI inputs, VESA', 'Elec_16.jpg', 1, 241.17, 80, 'Detail 22'),
(23, 'ASUS VP248QGL 24” Full HD 1920x1080 1ms DP HDMI VGA Adaptive Sync/FreeSync Eye Care Monitor', 'Elec_17.jpg', 1, 149.79, 76, 'Detail 23'),
(24, 'ASUS PB277Q 27\" WQHD 2560x1440 75Hz 1ms HDMI DVI VGA Eye Care Monitor', 'Elec_18.jpg', 1, 273.48, 46, 'Detail 24'),
(25, 'BenQ 27 Inch IPS Monitor\r\n', 'Elec_19.jpg', 1, 207.75, 49, 'Detail 25'),
(26, 'Philips 276E9QDSB 27\" Frameless Monitor\r\n', 'Elec_20.jpg', 1, 223.95, 19, 'Detail 26'),
(27, 'AOC 24B2XH 24\" Full HD IPS Monitor\r\n', 'Elec_21.jpg', 1, 223.95, 67, 'Detail 27'),
(28, 'COWIN E7 Active Noise Cancelling Headphones Bluetooth Headphones with Microphone Deep Bass Wireless Headphones Over Ear\r\n', 'Elec_22.jpg', 1, 69.99, 28, 'Detail 28'),
(29, 'iJoy Matte Finish Premium Rechargeable Wireless Headphones Bluetooth Over Ear Headphones Foldable Headset with Mic (Stealth)', 'Elec_23.jpg', 1, 16.99, 39, 'Detail 29\r\n'),
(30, 'Otium Bluetooth Headphones, Best Wireless Earbuds IPX7 Waterproof Sports Earphones', 'Elec_24.jpg', 1, 20.99, 37, 'Detail 30'),
(31, 'iClever Kids Headphones - Wired Headphones for Kids\r\n', 'Elec_25.jpg', 1, 12.99, 20, 'Detail 31'),
(32, 'Audio-Technica ATH-M20x Professional Studio Monitor Headphones, Black', 'Elec_26.jpg', 1, 49, 69, 'Detail 32'),
(33, 'Mpow CH6 [2019 New Version] Kids Headphones Over-Ear/On-Ear\r\n\r\n', 'Elec_27.jpg', 1, 13.99, 70, 'Detail 33'),
(34, 'Devoko Ergonomic Gaming Chair Racing Style Adjustable Height High-Back PC Computer Chair with Headrest and Lumbar Support Executive Office Chair (Red)', 'Acce_3.jpg', 3, 139.98, 40, 'Detail 34'),
(35, 'KILLABEE Massage Gaming Chair High Back PU Leather PC Racing Computer Desk Office Swivel Recliner with Retractable Footrest and Adjustable Lumbar Support, Gray/Black', 'Acce_4.jpg', 3, 129.99, 50, 'Detail 35'),
(36, 'Homall Ergonomic High-Back Racing Chair Pu Leather Bucket Seat,Computer Swivel Office Chair Headrest and Lumbar Support Executive Desk Chair with Footrest, Black/Blue', 'Acce_5.jpg', 3, 141.55, 70, 'Detail 36'),
(37, 'GANK Gaming Chair Large Size Racing Office Computer Chair High Back PU Leather Swivel Chair with Adjustable Massage Lumbar Support and Footrest (Red)', 'Acce_6.jpg', 3, 229.99, 40, 'Detail 37'),
(38, 'Redragon K556 RGB LED Backlit Wired Mechanical Gaming Keyboard, Aluminum Base, 104 Standard Keys', 'Acce_7.jpg', 3, 59.89, 45, 'Detail 38'),
(39, 'PICTEK RGB Gaming Keyboard USB Wired Keyboard, Crater Architecture Backlit Computer Keyboard', 'Acce_8.jpg', 3, 19.99, 65, 'Detail 39'),
(40, 'Razer Cynosa Chroma Gaming Keyboard: Customizable Chroma RGB Lighting', 'Acce_9.jpg', 3, 39.99, 30, 'Detail 40'),
(41, 'KLIM Chroma Wireless Gaming Keyboard\r\n', 'Acce_10.jpg', 3, 29.9, 60, 'Detail 41'),
(42, 'Apple Wireless Magic Keyboard 2, Silver (MLA22LL/A) - (Renewed)', 'Acce_11.jpg', 3, 64.99, 90, 'Detail 42'),
(43, 'Logitech G915 Wireless Mechanical Gaming Keyboard (Clicky)', 'Acce_12.jpg', 3, 298.04, 68, 'Detail 43'),
(44, 'Razer Basilisk Ultimate Hyperspeed Wireless Gaming Mouse\r\n', 'Acce_13.jpg', 3, 169.99, 80, 'Detail 44'),
(47, 'CORSAIR IRONCLAW Wireless RGB - FPS and MOBA Gaming Mouse', 'Acce_16.jpg', 3, 79.99, 60, 'Detail 47'),
(48, 'SteelSeries Rival 650 Quantum Wireless Gaming Mouse - Rapid Charging Battery', 'Acce_17.jpg', 3, 113.99, 70, 'Detail 48'),
(49, 'UtechSmart VENUS Pro RGB MMO Wireless Gaming Mouse', 'Acce_18.jpg', 3, 51.99, 90, 'Detail 49'),
(50, 'TENMOS T12 Wireless Gaming Mouse Rechargeable, 2.4G Silent Optical Wireless Computer Mice', 'Acce_19.jpg', 3, 15.99, 87, 'Detail 50'),
(51, 'The Evil Within', 'Game_5.jpg', 2, 15.56, 400, 'Detail 51'),
(52, 'Resident Evil-Afterlife', 'Game_6.jpg', 2, 23.93, 400, 'Detail 52'),
(53, 'PlayerUnknown\'s Battlegrounds', 'Game_7.jpg', 2, 29.99, 500, 'Detail 53'),
(54, 'BattleField', 'Game_8.jpg', 2, 49.99, 450, 'Detail 54\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_SUPER_ADMIN'),
(2, 'ROLE_ADMIN'),
(5, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_account`
--

DROP TABLE IF EXISTS `role_account`;
CREATE TABLE IF NOT EXISTS `role_account` (
  `role_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  KEY `role_id` (`role_id`,`account_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role_account`
--

INSERT INTO `role_account` (`role_id`, `account_id`) VALUES
(1, 1),
(2, 2),
(5, 5),
(5, 6),
(5, 7);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `invoice_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `role_account`
--
ALTER TABLE `role_account`
  ADD CONSTRAINT `role_account_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `role_account_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
