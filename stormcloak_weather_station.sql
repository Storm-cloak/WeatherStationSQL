-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: mysql-stormcloak.alwaysdata.net
-- Generation Time: May 07, 2020 at 06:52 AM
-- Server version: 10.3.17-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stormcloak_weather_station`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `attribute_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `attribute_name`) VALUES
(1, 'Temperature'),
(2, 'Speed'),
(3, 'Humidity'),
(4, 'Pressure'),
(5, 'RainRate');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Baku');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `conf_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `conf_name`) VALUES
(1, 'Budget configuration');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_devices`
--

CREATE TABLE `configuration_devices` (
  `device_id` int(11) NOT NULL,
  `conf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `configuration_devices`
--

INSERT INTO `configuration_devices` (`device_id`, `conf_id`) VALUES
(3, 1),
(6, 1),
(8, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `daily_weather_log`
--

CREATE TABLE `daily_weather_log` (
  `city_id` int(11) NOT NULL,
  `date_day` date NOT NULL,
  `max_temp` int(11) NOT NULL,
  `min_temp` int(11) NOT NULL,
  `avg_humidity` int(11) NOT NULL,
  `sunrise_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `sunset_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_weather_log`
--

INSERT INTO `daily_weather_log` (`city_id`, `date_day`, `max_temp`, `min_temp`, `avg_humidity`, `sunrise_time`, `sunset_time`) VALUES
(1, '2020-04-20', 25, 15, 30, '2020-04-20 04:00:00', '2020-04-20 16:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `device_name` varchar(30) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `device_name`, `attribute_id`) VALUES
(1, 'Probe Thermometer', 1),
(2, 'Infrared Thermometer', 1),
(3, 'K-TYPE Thermoculus', 1),
(4, 'Cup anemometer', 2),
(5, 'Vane anemometer', 2),
(6, 'Acoustic resonance anemometer', 2),
(7, 'Hygrometer', 3),
(8, 'Digital Hygrometer', 3),
(9, 'Barometer', 4),
(10, 'Udometer', 5),
(11, 'Acoustic Rain Gauge', 5),
(12, 'Optical Rain Gauge', 5);

-- --------------------------------------------------------

--
-- Table structure for table `hourly_weather_log`
--

CREATE TABLE `hourly_weather_log` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `start_frame` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_frame` timestamp NOT NULL DEFAULT current_timestamp(),
  `temperature` int(11) NOT NULL,
  `humidity` int(11) NOT NULL,
  `wind_speed` int(11) NOT NULL,
  `pressure` int(11) NOT NULL,
  `visibility_distance` int(11) NOT NULL,
  `rain_rate` int(11) NOT NULL,
  `temp_feeling_id` int(11) NOT NULL,
  `wind_feeling_id` int(11) NOT NULL,
  `humidity_feeling_id` int(11) NOT NULL,
  `rain_feeling_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hourly_weather_log`
--

INSERT INTO `hourly_weather_log` (`id`, `city_id`, `start_frame`, `end_frame`, `temperature`, `humidity`, `wind_speed`, `pressure`, `visibility_distance`, `rain_rate`, `temp_feeling_id`, `wind_feeling_id`, `humidity_feeling_id`, `rain_feeling_id`) VALUES
(1, 1, '2020-04-20 17:19:35', '2020-04-20 18:19:35', 8, 5, 15, 10, 200, 2, 1, 2, 1, 1),
(4, 1, '2020-05-20 17:19:35', '2020-05-20 18:19:35', 26, 26, 15, 30, 500, 15, 2, 2, 2, 2),
(5, 1, '2020-05-20 18:19:35', '2020-05-20 19:19:35', 25, 28, 13, 50, 200, 12, 2, 2, 2, 2),
(6, 1, '2020-05-20 19:19:35', '2020-05-20 20:19:35', 25, 28, 20, 30, 100, 12, 2, 2, 2, 2),
(7, 1, '2020-04-20 17:19:35', '2020-04-20 18:19:35', 5, 80, 50, 100, 50, 30, 1, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `humidity_feeling`
--

CREATE TABLE `humidity_feeling` (
  `id` int(11) NOT NULL,
  `humidity_limit` int(11) NOT NULL,
  `feel_desc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `humidity_feeling`
--

INSERT INTO `humidity_feeling` (`id`, `humidity_limit`, `feel_desc`) VALUES
(1, 10, 'lowHumidity'),
(2, 25, 'AverageHumidity'),
(3, 50, 'HighHumidity');

-- --------------------------------------------------------

--
-- Table structure for table `measuring_units`
--

CREATE TABLE `measuring_units` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(45) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `measuring_units`
--

INSERT INTO `measuring_units` (`id`, `unit_name`, `attribute_id`) VALUES
(1, 'C', 1),
(2, 'F', 1),
(3, 'K', 1),
(4, 'R', 1),
(5, 'm/s', 2),
(6, 'km/h', 2),
(7, 'miles/h', 2),
(8, 'ft/s', 2),
(9, '%', 3),
(10, 'HectoPascal', 4),
(11, 'mmHg', 4),
(12, 'mm', 5);

-- --------------------------------------------------------

--
-- Table structure for table `p_station`
--

CREATE TABLE `p_station` (
  `id` int(11) NOT NULL,
  `station_specs_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `p_station`
--

INSERT INTO `p_station` (`id`, `station_specs_id`, `city_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rain_feeling`
--

CREATE TABLE `rain_feeling` (
  `id` int(11) NOT NULL,
  `rain_rate_limit` int(11) NOT NULL,
  `feel_desc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rain_feeling`
--

INSERT INTO `rain_feeling` (`id`, `rain_rate_limit`, `feel_desc`) VALUES
(1, 2, 'Rainless'),
(2, 10, 'Light rain'),
(3, 25, 'Heavy rain'),
(4, 40, 'Flood'),
(5, 70, 'HAIL');

-- --------------------------------------------------------

--
-- Table structure for table `station_settings`
--

CREATE TABLE `station_settings` (
  `station_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `measuring_units_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station_settings`
--

INSERT INTO `station_settings` (`station_id`, `attribute_id`, `measuring_units_id`) VALUES
(1, 1, 1),
(1, 2, 5),
(1, 3, 9),
(1, 4, 10),
(1, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `temp_feeling`
--

CREATE TABLE `temp_feeling` (
  `id` int(11) NOT NULL,
  `temp_limit` int(11) NOT NULL,
  `feel_desc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_feeling`
--

INSERT INTO `temp_feeling` (`id`, `temp_limit`, `feel_desc`) VALUES
(1, 10, 'Chilly'),
(2, 25, 'Warm');

-- --------------------------------------------------------

--
-- Table structure for table `wind_feeling`
--

CREATE TABLE `wind_feeling` (
  `id` int(11) NOT NULL,
  `wind_speed_limit` int(11) NOT NULL,
  `feel_desc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wind_feeling`
--

INSERT INTO `wind_feeling` (`id`, `wind_speed_limit`, `feel_desc`) VALUES
(1, 2, 'Windless'),
(2, 10, 'Light wind'),
(3, 20, 'Strong wind');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration_devices`
--
ALTER TABLE `configuration_devices`
  ADD PRIMARY KEY (`device_id`,`conf_id`),
  ADD KEY `configuration_devices_configuration` (`conf_id`);

--
-- Indexes for table `daily_weather_log`
--
ALTER TABLE `daily_weather_log`
  ADD PRIMARY KEY (`city_id`,`date_day`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instruments_attribute` (`attribute_id`);

--
-- Indexes for table `hourly_weather_log`
--
ALTER TABLE `hourly_weather_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hourly_weather_log_city` (`city_id`),
  ADD KEY `hourly_weather_log_humidity_feeling` (`humidity_feeling_id`),
  ADD KEY `hourly_weather_log_rain_feeling` (`rain_feeling_id`),
  ADD KEY `hourly_weather_log_temp_feeling` (`temp_feeling_id`),
  ADD KEY `hourly_weather_log_wind_feeling` (`wind_feeling_id`);

--
-- Indexes for table `humidity_feeling`
--
ALTER TABLE `humidity_feeling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measuring_units`
--
ALTER TABLE `measuring_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measuring_units_attribute` (`attribute_id`);

--
-- Indexes for table `p_station`
--
ALTER TABLE `p_station`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_station_city` (`city_id`),
  ADD KEY `p_station_station_specs` (`station_specs_id`);

--
-- Indexes for table `rain_feeling`
--
ALTER TABLE `rain_feeling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station_settings`
--
ALTER TABLE `station_settings`
  ADD PRIMARY KEY (`station_id`,`attribute_id`),
  ADD KEY `station_sett_measuring_units` (`measuring_units_id`),
  ADD KEY `station_settings_attribute` (`attribute_id`);

--
-- Indexes for table `temp_feeling`
--
ALTER TABLE `temp_feeling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wind_feeling`
--
ALTER TABLE `wind_feeling`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `hourly_weather_log`
--
ALTER TABLE `hourly_weather_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `humidity_feeling`
--
ALTER TABLE `humidity_feeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `measuring_units`
--
ALTER TABLE `measuring_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `p_station`
--
ALTER TABLE `p_station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `rain_feeling`
--
ALTER TABLE `rain_feeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `temp_feeling`
--
ALTER TABLE `temp_feeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `wind_feeling`
--
ALTER TABLE `wind_feeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `configuration_devices`
--
ALTER TABLE `configuration_devices`
  ADD CONSTRAINT `configuration_devices_configuration` FOREIGN KEY (`conf_id`) REFERENCES `configuration` (`id`),
  ADD CONSTRAINT `configuration_devices_devices` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`);

--
-- Constraints for table `daily_weather_log`
--
ALTER TABLE `daily_weather_log`
  ADD CONSTRAINT `daily_weather_log_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `instruments_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `hourly_weather_log`
--
ALTER TABLE `hourly_weather_log`
  ADD CONSTRAINT `hourly_weather_log_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `hourly_weather_log_humidity_feeling` FOREIGN KEY (`humidity_feeling_id`) REFERENCES `humidity_feeling` (`id`),
  ADD CONSTRAINT `hourly_weather_log_rain_feeling` FOREIGN KEY (`rain_feeling_id`) REFERENCES `rain_feeling` (`id`),
  ADD CONSTRAINT `hourly_weather_log_temp_feeling` FOREIGN KEY (`temp_feeling_id`) REFERENCES `temp_feeling` (`id`),
  ADD CONSTRAINT `hourly_weather_log_wind_feeling` FOREIGN KEY (`wind_feeling_id`) REFERENCES `wind_feeling` (`id`);

--
-- Constraints for table `measuring_units`
--
ALTER TABLE `measuring_units`
  ADD CONSTRAINT `measuring_units_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `p_station`
--
ALTER TABLE `p_station`
  ADD CONSTRAINT `p_station_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `p_station_station_specs` FOREIGN KEY (`station_specs_id`) REFERENCES `configuration` (`id`);

--
-- Constraints for table `station_settings`
--
ALTER TABLE `station_settings`
  ADD CONSTRAINT `station_sett_measuring_units` FOREIGN KEY (`measuring_units_id`) REFERENCES `measuring_units` (`id`),
  ADD CONSTRAINT `station_setting_stations` FOREIGN KEY (`station_id`) REFERENCES `p_station` (`id`),
  ADD CONSTRAINT `station_settings_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
