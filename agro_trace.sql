-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 10, 2026 at 02:12 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agro_trace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_detail`
--

DROP TABLE IF EXISTS `admin_detail`;
CREATE TABLE IF NOT EXISTS `admin_detail` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pass` varchar(10) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_detail`
--

INSERT INTO `admin_detail` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`) VALUES
(1, 'admin', 'admin@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE IF NOT EXISTS `bill_detail` (
  `bill_id` int(10) NOT NULL,
  `bill_date` date NOT NULL,
  `order_id` int(10) NOT NULL,
  `cart_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `bill_amount` int(20) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE IF NOT EXISTS `cart_detail` (
  `cart_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `cart_quantity` int(10) NOT NULL,
  `cart_price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`cart_id`, `product_id`, `cart_quantity`, `cart_price`) VALUES
(1, 1, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `cart_master`
--

DROP TABLE IF EXISTS `cart_master`;
CREATE TABLE IF NOT EXISTS `cart_master` (
  `cart_id` int(10) NOT NULL,
  `cart_date` date NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_master`
--

INSERT INTO `cart_master` (`cart_id`, `cart_date`) VALUES
(1, '2026-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`category_id`, `category_name`) VALUES
(1, 'hybrid');

-- --------------------------------------------------------

--
-- Table structure for table `customer_detail`
--

DROP TABLE IF EXISTS `customer_detail`;
CREATE TABLE IF NOT EXISTS `customer_detail` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_address` varchar(200) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_pass` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_detail`
--

INSERT INTO `customer_detail` (`customer_id`, `customer_name`, `customer_address`, `customer_city`, `customer_mobile`, `customer_email`, `customer_pass`) VALUES
(1, 'meril', 'rama appartment g-5 valsad pardi valsad\r\nNA', 'Valsad Chhipwad ', '9876543210', 'customer@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_detail`
--

DROP TABLE IF EXISTS `farmer_detail`;
CREATE TABLE IF NOT EXISTS `farmer_detail` (
  `farmer_id` int(10) NOT NULL AUTO_INCREMENT,
  `farmer_name` varchar(50) NOT NULL,
  `farmer_address` varchar(200) NOT NULL,
  `farmer_city` varchar(50) NOT NULL,
  `farmer_mobile` varchar(10) NOT NULL,
  `farmer_email` varchar(50) NOT NULL,
  `farmer_pass` varchar(10) NOT NULL,
  `farmer_status` varchar(20) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`farmer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_detail`
--

INSERT INTO `farmer_detail` (`farmer_id`, `farmer_name`, `farmer_address`, `farmer_city`, `farmer_mobile`, `farmer_email`, `farmer_pass`, `farmer_status`) VALUES
(1, 'meril', 'rama appartment g-5 valsad pardi valsad\r\nNA', 'Valsad Chhipwad ', '9876543210', 'supplier@gmail.com', '123456', 'Verified');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_id` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `cart_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `order_address` varchar(200) NOT NULL,
  `order_mobile` varchar(10) NOT NULL,
  `order_amount` int(10) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `order_date`, `cart_id`, `customer_id`, `order_address`, `order_mobile`, `order_amount`) VALUES
(1, '2026-03-08', 1, 1, 'ss', '9876543210', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE IF NOT EXISTS `product_detail` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `category_id` int(10) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_image` varchar(50) NOT NULL,
  `farmer_id` int(10) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_product` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
