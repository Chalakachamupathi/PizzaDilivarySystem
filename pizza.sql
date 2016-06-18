-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2015 at 02:51 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `regular_phone_no` varchar(20) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `cross_road` varchar(255) DEFAULT NULL,
  `house_no` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  KEY `Regular_Phone_No` (`regular_phone_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`regular_phone_no`, `street`, `cross_road`, `house_no`, `landmark`) VALUES
('717156570', 'kirinda', '', '210', 'tree'),
('712403230', 'gampola', '', '', 'akbar'),
('342281111', '6th lane', 'Galle road', '118', 'Kaluthara bodhi'),
('712345678', 'sdfdsf', '', '', ''),
('723456789', '6th LANE', 'KANDY RD', '32', 'NEAR STATUE'),
('734567891', 'HAKMANA RD', 'MATARA', '45', 'NEAR GROUND'),
('798765432', 'Gammana rd, Maharagama', '1st Lane', '40/2', 'near bend'),
('78945612', 'KANDY', '', '40', '');

-- --------------------------------------------------------

--
-- Table structure for table `beverage_types`
--

CREATE TABLE IF NOT EXISTS `beverage_types` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beverage_types`
--

INSERT INTO `beverage_types` (`code`, `name`, `price`) VALUES
('CMS', 'CHOCOLATE MILK SHAKE', 490),
('FCS', 'FANTA CREAM SODA', 100),
('FF', 'FANTA', 100),
('FOF', 'FRESH ORANGE FREEZE', 400),
('FP', 'FANTA PORTELLO', 100),
('MC', 'MEGA COKE', 820),
('PC', 'PET COKE', 110),
('PCL', 'PET COKE LIGHT', 120),
('PS', 'PET SPRITE', 100),
('SMS', 'STRAWBERRY MILK SHAKE', 490),
('VMS', 'VANILLA MILK SHAKE', 450);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `calling_phone_no` varchar(20) DEFAULT NULL,
  `regular_phone_no` varchar(20) NOT NULL,
  `badge` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`regular_phone_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`title`, `name`, `calling_phone_no`, `regular_phone_no`, `badge`) VALUES
('Mr', 'Lahiru', '342281111', '342281111', 'Do not have'),
('Mr', 'John', '712345678', '712345678', 'Platinum'),
('Mr', 'chamupathi', '712403230', '712403230', 'Gold'),
('Mr', 'chalaka', '717156570', '717156570', 'Do not have'),
('Mr', 'Lahiru Dilshan', '723456789', '723456789', 'Do not have'),
('Mr', 'DHANIKA THATHSARA', '734567891', '734567891', 'Gold'),
('MR', 'PAHAN', '78945612', '78945612', 'Gold'),
('Mr', 'Pahan', '798765432', '798765432', 'Gold');

-- --------------------------------------------------------

--
-- Table structure for table `desert_types`
--

CREATE TABLE IF NOT EXISTS `desert_types` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `desert_types`
--

INSERT INTO `desert_types` (`code`, `name`, `price`) VALUES
('BP', 'BREAD BUDDING', 150),
('CCC', 'CHOCOLATE CHIP CREAMIZZA', 250),
('CLC', 'CHOCOLATE LAVA CAKE', 240),
('SCC', 'STRAWBERRY CHIP CREAMIZZA', 250),
('VCC', 'VANILLA CHIP CREAMIZZA', 250);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_no` int(20) NOT NULL AUTO_INCREMENT,
  `pizza_beverage_dessert_type` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `regular_phone_no` varchar(20) DEFAULT NULL,
  `total_charge` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_no`,`date`),
  KEY `Regular_Phone_No` (`regular_phone_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_no`, `pizza_beverage_dessert_type`, `date`, `regular_phone_no`, `total_charge`, `payment_method`) VALUES
(2, 'LARGE PAN DEVIL CHICKEN 5,', '2015-09-16', '717156570', '7450.00', 'CASH'),
(3, 'LARGE PAN DEVIL CHICKEN 3,FANTA 5,VANILLA CHIP CREAMIZZA 3,', '2015-09-16', '342281111', '13170.00', 'CASH'),
(4, 'LARGE PAN HAWAIIAN CHICKEN 5,FANTA 4,FRESH ORANGE FREEZE 4,', '2015-09-16', '717156570', '9550.00', 'CASH'),
(5, 'LARGE PAN TANDOORI CHICKEN 1,SMALL PAN SPICY VEGGIE 2,FRESH ORANGE FREEZE 2,CHOCOLATE LAVA CAKE 2,', '2015-09-16', '723456789', '3810.00', 'VISA/MASTER'),
(6, 'MEDIUM PAN DEVIL CHICKEN 2,SMALL PAN DEVIL CHICKEN 3,', '2015-09-16', '734567891', '6860.00', 'AMEX'),
(7, 'SMALL PAN HAWAIIAN CHICKEN 3,MEDIUM PAN DEVIL CHICKEN 3,', '2015-09-16', '798765432', '3900.00', 'CASH'),
(8, 'FANTA 5,', '2015-09-16', '717156570', '500.00', 'CASH'),
(9, 'LARGE PAN DEVIL CHICKEN 5,', '2015-09-16', '798765432', '7450.00', 'AMEX');

-- --------------------------------------------------------

--
-- Table structure for table `pizza_types`
--

CREATE TABLE IF NOT EXISTS `pizza_types` (
  `code` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizza_types`
--

INSERT INTO `pizza_types` (`code`, `name`, `price`) VALUES
('LPDC', 'LARGE PAN DEVIL CHICKEN', 1490),
('LPHC', 'LARGE PAN HAWAIIAN CHICKEN', 1510),
('LPHGP', 'LARGE PAN HOT GARLIC PRAWNS', 1650),
('LPHSC', 'LARGE PAN HOT & SPICY CHICKEN', 1510),
('LPIT', 'LARGE PAN ITALIAN TOMATO', 1510),
('LPSD', 'LARGE PAN SAUSAGE DELIGHT', 1490),
('LPSS', 'LARGE PAN SUPER SUPREME', 1700),
('LPSV', 'LARGE PAN SPICY VEGGIE', 1510),
('LPTC', 'LARGE PAN TANDOORI CHICKEN', 1510),
('MPDC', 'MEDIUM PAN DEVIL CHICKEN', 790),
('MPHC', 'MEDIUM PAN HAWAIIAN CHICKEN', 820),
('MPHGP', 'MEDIUM PAN HOT GARLIC PRAWNS', 850),
('MPHSC', 'MEDIUM PAN HOT & SPICY CHICKEN', 820),
('MPIT', 'MEDIUM PAN ITALIAN TOMATO', 820),
('MPSD', 'MEDIUM PAN SAUSAGE DELIGHT', 790),
('MPSS', 'MEDIUM PAN SUPER SUPREME', 860),
('MPSV', 'MEDIUM PAN SPICY VEGGIE', 820),
('MPTC', 'MEDIUM PAN TANDOORI CHICKEN', 820),
('SPDC', 'SMALL PAN DEVIL CHICKEN', 490),
('SPHC', 'SMALL PAN HAWAIIAN CHICKEN', 510),
('SPHGP', 'SMALL PAN HOT GARLIC PRAWNS', 550),
('SPHSC', 'SMALL PAN HOT & SPICY CHICKEN', 510),
('SPIT', 'SMALL PAN ITALIAN TOMATO', 510),
('SPSD', 'SMALL PAN SAUSAGE DELIGHT', 490),
('SPSS', 'SMALL PAN SUPER SUPREME', 560),
('SPSV', 'SMALL PAN SPICY VEGGIE', 510),
('SPTC', 'SMALL PAN TANDOORI CHICKEN', 510);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`regular_phone_no`) REFERENCES `customer` (`regular_phone_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`regular_phone_no`) REFERENCES `customer` (`regular_phone_no`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
