-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2018 at 02:57 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_ivan_zykov_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `add_charge_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`add_charge_id`, `name`, `price`) VALUES
(1, 'Scratch on body', 50),
(2, 'Dent on body', 200),
(3, 'Crack on window', 100),
(4, 'Scratch on bumper', 25),
(5, 'Dirty Interior', 15);

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges_lists`
--

CREATE TABLE `additional_charges_lists` (
  `fk_return_check_id` int(11) NOT NULL,
  `fk_add_charge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges_lists`
--

INSERT INTO `additional_charges_lists` (`fk_return_check_id`, `fk_add_charge_id`) VALUES
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `fk_car_model_id` int(11) DEFAULT NULL,
  `car_year` year(4) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `price_day` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `fk_car_model_id`, `car_year`, `color`, `price_day`) VALUES
(1, 1, 2017, 'red', 40),
(2, 1, 2018, 'blue', 45),
(3, 2, 2017, 'yellow', 60),
(4, 3, 2017, 'yellow', 70),
(5, 4, 2017, 'black', 80);

-- --------------------------------------------------------

--
-- Table structure for table `car_brands`
--

CREATE TABLE `car_brands` (
  `car_brand_id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_brands`
--

INSERT INTO `car_brands` (`car_brand_id`, `name`) VALUES
(1, 'Fiat'),
(2, 'Mitsubishi'),
(3, 'Audi');

-- --------------------------------------------------------

--
-- Table structure for table `car_models`
--

CREATE TABLE `car_models` (
  `car_model_id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `fk_car_brand_id` int(11) DEFAULT NULL,
  `transmission` char(1) DEFAULT NULL,
  `clima` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_models`
--

INSERT INTO `car_models` (`car_model_id`, `name`, `fk_car_brand_id`, `transmission`, `clima`) VALUES
(1, '500', 1, 'M', 'air-conditioner'),
(2, 'Lancer', 2, 'M', 'air-conditioner'),
(3, 'Lancer', 2, 'A', 'climate-control'),
(4, 'A6', 3, 'A', 'climate-control');

-- --------------------------------------------------------

--
-- Table structure for table `car_register`
--

CREATE TABLE `car_register` (
  `car_register_id` int(11) NOT NULL,
  `car_reg_date` date DEFAULT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `return_tag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_register`
--

INSERT INTO `car_register` (`car_register_id`, `car_reg_date`, `fk_reservation_id`, `fk_location_id`, `return_tag`) VALUES
(1, '2018-05-01', 1, 1, 0),
(2, '2018-05-05', 1, 3, 1),
(3, '2018-05-06', 2, 4, 0),
(4, '2018-05-12', 2, 3, 1),
(5, '2018-05-25', 3, 2, 0),
(6, '2018-05-27', 3, 3, 1),
(7, '2018-06-13', 4, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `driving_licence_num` varchar(20) DEFAULT NULL,
  `driving_licence_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `first_name`, `last_name`, `birth_date`, `driving_licence_num`, `driving_licence_date`) VALUES
(1, 'Alex', 'Suvorov', '1730-11-13', '1234567', '1750-11-13'),
(2, 'Gojko', 'Mitić', '1940-06-13', '7777777', '1958-06-13'),
(3, 'Yuri', 'Gagarin', '1934-03-09', '1111111', '1952-03-09'),
(4, 'Arnold', 'Schwarzenegger', '1947-07-30', '9999999', '1967-07-30'),
(5, 'Elvis', 'Presley', '1935-01-08', '5555555', '1955-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'Jonh', 'Smith'),
(2, 'Michael', 'Schiller'),
(3, 'Roman', 'Petrov'),
(4, 'Pedro', 'Sanchez'),
(5, 'Mario', 'Bortoletti');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_return_check_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `fk_reservation_id`, `fk_return_check_id`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, NULL, 1),
(8, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `house_number` smallint(5) UNSIGNED DEFAULT NULL,
  `zip_code` mediumint(8) UNSIGNED DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `name`, `city`, `street`, `house_number`, `zip_code`, `fk_employee_id`) VALUES
(1, 'Central', 'Vienna', 'Oskar-Morgenstern-Pl', 1, 1010, 1),
(2, 'Westbahnho', 'Vienna', 'Felberstraße', 3, 1150, 5),
(3, 'Graz', 'Graz', 'Laudongasse', 25, 8020, 2),
(4, 'Linz', 'Linz', 'Kraußstraße', 7, 4020, 3);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `fk_invoice_id` int(11) NOT NULL,
  `paym_date` date DEFAULT NULL,
  `amount` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`fk_invoice_id`, `paym_date`, `amount`) VALUES
(1, '2018-06-25', 320),
(2, '2018-05-01', 270),
(3, '2018-05-20', 80),
(7, '2018-05-15', 315);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservatioin_id` int(11) NOT NULL,
  `res_date` date DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_start_location` int(11) DEFAULT NULL,
  `fk_finish_location` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservatioin_id`, `res_date`, `fk_driver_id`, `fk_car_id`, `fk_start_location`, `fk_finish_location`, `start_date`, `finish_date`) VALUES
(1, '2018-04-01', 1, 5, 1, 3, '2018-05-01', '2018-05-05'),
(2, '2018-04-06', 4, 2, 4, 3, '2018-05-06', '2018-05-12'),
(3, '2018-04-25', 5, 1, 2, 3, '2018-05-25', '2018-05-27'),
(4, '2018-05-13', 2, 3, 2, 1, '2018-06-13', '2018-06-19'),
(5, '2018-06-01', 3, 4, 1, 1, '2018-07-01', '2018-07-31'),
(6, '2018-06-19', 1, 4, 1, 4, '2018-07-19', '2018-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `return_checks`
--

CREATE TABLE `return_checks` (
  `return_check_id` int(11) NOT NULL,
  `fk_car_register_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_checks`
--

INSERT INTO `return_checks` (`return_check_id`, `fk_car_register_id`) VALUES
(1, 2),
(2, 4),
(3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`add_charge_id`);

--
-- Indexes for table `additional_charges_lists`
--
ALTER TABLE `additional_charges_lists`
  ADD PRIMARY KEY (`fk_return_check_id`,`fk_add_charge_id`),
  ADD KEY `fk_add_charge_id` (`fk_add_charge_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_car_model_id` (`fk_car_model_id`);

--
-- Indexes for table `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`car_brand_id`);

--
-- Indexes for table `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`car_model_id`),
  ADD KEY `fk_car_brand_id` (`fk_car_brand_id`);

--
-- Indexes for table `car_register`
--
ALTER TABLE `car_register`
  ADD PRIMARY KEY (`car_register_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_return_check_id` (`fk_return_check_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`fk_invoice_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservatioin_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_location` (`fk_start_location`),
  ADD KEY `fk_finish_location` (`fk_finish_location`);

--
-- Indexes for table `return_checks`
--
ALTER TABLE `return_checks`
  ADD PRIMARY KEY (`return_check_id`),
  ADD KEY `fk_car_register_id` (`fk_car_register_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `add_charge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `car_brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_models`
--
ALTER TABLE `car_models`
  MODIFY `car_model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_register`
--
ALTER TABLE `car_register`
  MODIFY `car_register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservatioin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `return_checks`
--
ALTER TABLE `return_checks`
  MODIFY `return_check_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charges_lists`
--
ALTER TABLE `additional_charges_lists`
  ADD CONSTRAINT `additional_charges_lists_ibfk_1` FOREIGN KEY (`fk_return_check_id`) REFERENCES `return_checks` (`return_check_id`),
  ADD CONSTRAINT `additional_charges_lists_ibfk_2` FOREIGN KEY (`fk_add_charge_id`) REFERENCES `additional_charges` (`add_charge_id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_car_model_id`) REFERENCES `car_models` (`car_model_id`);

--
-- Constraints for table `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_ibfk_1` FOREIGN KEY (`fk_car_brand_id`) REFERENCES `car_brands` (`car_brand_id`);

--
-- Constraints for table `car_register`
--
ALTER TABLE `car_register`
  ADD CONSTRAINT `car_register_ibfk_2` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservations` (`reservatioin_id`),
  ADD CONSTRAINT `car_register_ibfk_3` FOREIGN KEY (`fk_location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservations` (`reservatioin_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`fk_return_check_id`) REFERENCES `return_checks` (`return_check_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`fk_start_location`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservations_ibfk_4` FOREIGN KEY (`fk_finish_location`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `return_checks`
--
ALTER TABLE `return_checks`
  ADD CONSTRAINT `return_checks_ibfk_1` FOREIGN KEY (`fk_car_register_id`) REFERENCES `car_register` (`car_register_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
