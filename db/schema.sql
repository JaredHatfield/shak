-- phpMyAdmin SQL Dump
-- version 4.3.3
-- http://www.phpmyadmin.net
--
-- Host: cpdbr.cxyu3tup9vgc.us-east-1.rds.amazonaws.com
-- Generation Time: Dec 22, 2014 at 07:40 PM
-- Server version: 5.5.40-log
-- PHP Version: 5.4.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `shak`
--

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE IF NOT EXISTS `home` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_location`
--

CREATE TABLE IF NOT EXISTS `home_location` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `timezone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_pushtospeech`
--

CREATE TABLE IF NOT EXISTS `home_pushtospeech` (
  `id` int(11) NOT NULL,
  `deviceid` varchar(40) NOT NULL,
  `home` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_pushtospeech_history`
--

CREATE TABLE IF NOT EXISTS `home_pushtospeech_history` (
  `id` int(11) NOT NULL,
  `pushtospeech` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `event` varchar(100) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_weather`
--

CREATE TABLE IF NOT EXISTS `home_weather` (
  `location` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `sunriseTime` datetime DEFAULT NULL,
  `sunsetTime` datetime DEFAULT NULL,
  `precipIntensity` double DEFAULT NULL,
  `precipIntensityMax` double DEFAULT NULL,
  `precipProbability` double DEFAULT NULL,
  `precipType` varchar(100) DEFAULT NULL,
  `temperatureMin` double DEFAULT NULL,
  `temperatureMinTime` datetime DEFAULT NULL,
  `temperatureMax` double DEFAULT NULL,
  `temperatureMaxTime` datetime DEFAULT NULL,
  `apparentTemperatureMin` double DEFAULT NULL,
  `apparentTemperatureMinTime` datetime DEFAULT NULL,
  `apparentTemperatureMax` double DEFAULT NULL,
  `apparentTemperatureMaxTime` datetime DEFAULT NULL,
  `dewPoint` double DEFAULT NULL,
  `humidity` double DEFAULT NULL,
  `windSpeed` double DEFAULT NULL,
  `windBearing` double DEFAULT NULL,
  `visibility` double DEFAULT NULL,
  `cloudCover` double DEFAULT NULL,
  `pressure` double DEFAULT NULL,
  `ozone` double DEFAULT NULL,
  `added` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL,
  `home` int(11) NOT NULL,
  `token` varchar(36) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `pushover` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_location_event`
--

CREATE TABLE IF NOT EXISTS `person_location_event` (
  `id` int(11) NOT NULL,
  `person` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_location_recent`
--

CREATE TABLE IF NOT EXISTS `person_location_recent` (
  `person` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_place`
--

CREATE TABLE IF NOT EXISTS `person_place` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_acceleration_event`
--

CREATE TABLE IF NOT EXISTS `smart_acceleration_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_acceleration_recent`
--

CREATE TABLE IF NOT EXISTS `smart_acceleration_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_battery_event`
--

CREATE TABLE IF NOT EXISTS `smart_battery_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_battery_recent`
--

CREATE TABLE IF NOT EXISTS `smart_battery_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_contact_event`
--

CREATE TABLE IF NOT EXISTS `smart_contact_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_contact_recent`
--

CREATE TABLE IF NOT EXISTS `smart_contact_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_device`
--

CREATE TABLE IF NOT EXISTS `smart_device` (
  `pid` int(11) NOT NULL,
  `deviceid` char(36) NOT NULL,
  `locationid` char(36) NOT NULL,
  `hubid` char(36) NOT NULL,
  `added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_device_details`
--

CREATE TABLE IF NOT EXISTS `smart_device_details` (
  `pid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isInside` tinyint(1) NOT NULL DEFAULT '0',
  `isOutside` tinyint(1) NOT NULL DEFAULT '0',
  `isTarget` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_device_type`
--

CREATE TABLE IF NOT EXISTS `smart_device_type` (
  `pid` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_generic_event`
--

CREATE TABLE IF NOT EXISTS `smart_generic_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `appId` char(36) DEFAULT NULL,
  `descriptionText` varchar(100) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_hub`
--

CREATE TABLE IF NOT EXISTS `smart_hub` (
  `pid` int(11) NOT NULL,
  `hubid` char(36) NOT NULL,
  `home` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_humidity_event`
--

CREATE TABLE IF NOT EXISTS `smart_humidity_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_humidity_recent`
--

CREATE TABLE IF NOT EXISTS `smart_humidity_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_illuminance_event`
--

CREATE TABLE IF NOT EXISTS `smart_illuminance_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_illuminance_recent`
--

CREATE TABLE IF NOT EXISTS `smart_illuminance_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_lqi_event`
--

CREATE TABLE IF NOT EXISTS `smart_lqi_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_lqi_recent`
--

CREATE TABLE IF NOT EXISTS `smart_lqi_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_motion_event`
--

CREATE TABLE IF NOT EXISTS `smart_motion_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_motion_recent`
--

CREATE TABLE IF NOT EXISTS `smart_motion_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_presence_event`
--

CREATE TABLE IF NOT EXISTS `smart_presence_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_presence_recent`
--

CREATE TABLE IF NOT EXISTS `smart_presence_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_rssi_event`
--

CREATE TABLE IF NOT EXISTS `smart_rssi_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_rssi_recent`
--

CREATE TABLE IF NOT EXISTS `smart_rssi_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_temperature_event`
--

CREATE TABLE IF NOT EXISTS `smart_temperature_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `unit` char(1) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_temperature_recent`
--

CREATE TABLE IF NOT EXISTS `smart_temperature_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `unit` char(1) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_threeaxis_event`
--

CREATE TABLE IF NOT EXISTS `smart_threeaxis_event` (
  `pid` bigint(20) NOT NULL,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `valX` int(11) DEFAULT NULL,
  `valY` int(11) DEFAULT NULL,
  `valZ` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_threeaxis_recent`
--

CREATE TABLE IF NOT EXISTS `smart_threeaxis_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `valX` int(11) DEFAULT NULL,
  `valY` int(11) DEFAULT NULL,
  `valZ` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `home`
--
ALTER TABLE `home`
ADD PRIMARY KEY (`id`), ADD KEY `location` (`location`);

--
-- Indexes for table `home_location`
--
ALTER TABLE `home_location`
ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_pushtospeech`
--
ALTER TABLE `home_pushtospeech`
ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `deviceid` (`deviceid`), ADD KEY `home` (`home`);

--
-- Indexes for table `home_pushtospeech_history`
--
ALTER TABLE `home_pushtospeech_history`
ADD PRIMARY KEY (`id`), ADD KEY `pushtospeech` (`pushtospeech`);

--
-- Indexes for table `home_weather`
--
ALTER TABLE `home_weather`
ADD PRIMARY KEY (`location`,`time`), ADD KEY `location` (`location`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
ADD PRIMARY KEY (`id`), ADD KEY `home` (`home`);

--
-- Indexes for table `person_location_event`
--
ALTER TABLE `person_location_event`
ADD PRIMARY KEY (`id`), ADD KEY `person` (`person`), ADD KEY `place` (`place`);

--
-- Indexes for table `person_location_recent`
--
ALTER TABLE `person_location_recent`
ADD PRIMARY KEY (`person`,`place`,`status`), ADD KEY `person` (`person`), ADD KEY `place` (`place`);

--
-- Indexes for table `person_place`
--
ALTER TABLE `person_place`
ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `smart_acceleration_event`
--
ALTER TABLE `smart_acceleration_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_acceleration_recent`
--
ALTER TABLE `smart_acceleration_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`,`status`);

--
-- Indexes for table `smart_battery_event`
--
ALTER TABLE `smart_battery_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_battery_recent`
--
ALTER TABLE `smart_battery_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- Indexes for table `smart_contact_event`
--
ALTER TABLE `smart_contact_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_contact_recent`
--
ALTER TABLE `smart_contact_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`,`status`);

--
-- Indexes for table `smart_device`
--
ALTER TABLE `smart_device`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `hub_location_device` (`hubid`,`locationid`,`deviceid`), ADD KEY `hubid` (`hubid`);

--
-- Indexes for table `smart_device_details`
--
ALTER TABLE `smart_device_details`
ADD PRIMARY KEY (`pid`), ADD KEY `type` (`type`);

--
-- Indexes for table `smart_device_type`
--
ALTER TABLE `smart_device_type`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `smart_generic_event`
--
ALTER TABLE `smart_generic_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_hub`
--
ALTER TABLE `smart_hub`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `hubid` (`hubid`), ADD KEY `home` (`home`);

--
-- Indexes for table `smart_humidity_event`
--
ALTER TABLE `smart_humidity_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_humidity_recent`
--
ALTER TABLE `smart_humidity_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- Indexes for table `smart_illuminance_event`
--
ALTER TABLE `smart_illuminance_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_illuminance_recent`
--
ALTER TABLE `smart_illuminance_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- Indexes for table `smart_lqi_event`
--
ALTER TABLE `smart_lqi_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_lqi_recent`
--
ALTER TABLE `smart_lqi_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- Indexes for table `smart_motion_event`
--
ALTER TABLE `smart_motion_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_motion_recent`
--
ALTER TABLE `smart_motion_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`,`status`);

--
-- Indexes for table `smart_presence_event`
--
ALTER TABLE `smart_presence_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_presence_recent`
--
ALTER TABLE `smart_presence_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`,`status`);

--
-- Indexes for table `smart_rssi_event`
--
ALTER TABLE `smart_rssi_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_rssi_recent`
--
ALTER TABLE `smart_rssi_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- Indexes for table `smart_temperature_event`
--
ALTER TABLE `smart_temperature_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_temperature_recent`
--
ALTER TABLE `smart_temperature_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- Indexes for table `smart_threeaxis_event`
--
ALTER TABLE `smart_threeaxis_event`
ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `eventid` (`eventid`), ADD KEY `device` (`device`);

--
-- Indexes for table `smart_threeaxis_recent`
--
ALTER TABLE `smart_threeaxis_recent`
ADD UNIQUE KEY `eventid` (`eventid`), ADD UNIQUE KEY `device` (`device`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `home_location`
--
ALTER TABLE `home_location`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `home_pushtospeech`
--
ALTER TABLE `home_pushtospeech`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `home_pushtospeech_history`
--
ALTER TABLE `home_pushtospeech_history`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_location_event`
--
ALTER TABLE `person_location_event`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `person_place`
--
ALTER TABLE `person_place`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_acceleration_event`
--
ALTER TABLE `smart_acceleration_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_battery_event`
--
ALTER TABLE `smart_battery_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_contact_event`
--
ALTER TABLE `smart_contact_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_device`
--
ALTER TABLE `smart_device`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_device_type`
--
ALTER TABLE `smart_device_type`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_generic_event`
--
ALTER TABLE `smart_generic_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_hub`
--
ALTER TABLE `smart_hub`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_humidity_event`
--
ALTER TABLE `smart_humidity_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_illuminance_event`
--
ALTER TABLE `smart_illuminance_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_lqi_event`
--
ALTER TABLE `smart_lqi_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_motion_event`
--
ALTER TABLE `smart_motion_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_presence_event`
--
ALTER TABLE `smart_presence_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_rssi_event`
--
ALTER TABLE `smart_rssi_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_temperature_event`
--
ALTER TABLE `smart_temperature_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smart_threeaxis_event`
--
ALTER TABLE `smart_threeaxis_event`
MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `home`
--
ALTER TABLE `home`
ADD CONSTRAINT `home_ibfk_1` FOREIGN KEY (`location`) REFERENCES `home_location` (`id`);

--
-- Constraints for table `home_pushtospeech`
--
ALTER TABLE `home_pushtospeech`
ADD CONSTRAINT `home_pushtospeech_ibfk_1` FOREIGN KEY (`home`) REFERENCES `home` (`id`);

--
-- Constraints for table `home_pushtospeech_history`
--
ALTER TABLE `home_pushtospeech_history`
ADD CONSTRAINT `home_pushtospeech_history_ibfk_1` FOREIGN KEY (`pushtospeech`) REFERENCES `home_pushtospeech` (`id`);

--
-- Constraints for table `home_weather`
--
ALTER TABLE `home_weather`
ADD CONSTRAINT `home_weather_ibfk_1` FOREIGN KEY (`location`) REFERENCES `home_location` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`home`) REFERENCES `home` (`id`);

--
-- Constraints for table `person_location_event`
--
ALTER TABLE `person_location_event`
ADD CONSTRAINT `person_location_event_ibfk_1` FOREIGN KEY (`person`) REFERENCES `person` (`id`),
ADD CONSTRAINT `person_location_event_ibfk_2` FOREIGN KEY (`place`) REFERENCES `person_place` (`id`);

--
-- Constraints for table `smart_acceleration_event`
--
ALTER TABLE `smart_acceleration_event`
ADD CONSTRAINT `smart_acceleration_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_acceleration_recent`
--
ALTER TABLE `smart_acceleration_recent`
ADD CONSTRAINT `smart_acceleration_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_battery_event`
--
ALTER TABLE `smart_battery_event`
ADD CONSTRAINT `smart_battery_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_battery_recent`
--
ALTER TABLE `smart_battery_recent`
ADD CONSTRAINT `smart_battery_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_contact_event`
--
ALTER TABLE `smart_contact_event`
ADD CONSTRAINT `smart_contact_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_contact_recent`
--
ALTER TABLE `smart_contact_recent`
ADD CONSTRAINT `smart_contact_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_device_details`
--
ALTER TABLE `smart_device_details`
ADD CONSTRAINT `smart_device_details_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `smart_device` (`pid`) ON DELETE CASCADE,
ADD CONSTRAINT `smart_device_details_ibfk_2` FOREIGN KEY (`type`) REFERENCES `smart_device_type` (`pid`);

--
-- Constraints for table `smart_generic_event`
--
ALTER TABLE `smart_generic_event`
ADD CONSTRAINT `smart_generic_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_hub`
--
ALTER TABLE `smart_hub`
ADD CONSTRAINT `smart_hub_ibfk_1` FOREIGN KEY (`home`) REFERENCES `home` (`id`);

--
-- Constraints for table `smart_humidity_event`
--
ALTER TABLE `smart_humidity_event`
ADD CONSTRAINT `smart_humidity_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_humidity_recent`
--
ALTER TABLE `smart_humidity_recent`
ADD CONSTRAINT `smart_humidity_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_illuminance_event`
--
ALTER TABLE `smart_illuminance_event`
ADD CONSTRAINT `smart_illuminance_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_illuminance_recent`
--
ALTER TABLE `smart_illuminance_recent`
ADD CONSTRAINT `smart_illuminance_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_lqi_event`
--
ALTER TABLE `smart_lqi_event`
ADD CONSTRAINT `smart_lqi_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_lqi_recent`
--
ALTER TABLE `smart_lqi_recent`
ADD CONSTRAINT `smart_lqi_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_motion_event`
--
ALTER TABLE `smart_motion_event`
ADD CONSTRAINT `smart_motion_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_motion_recent`
--
ALTER TABLE `smart_motion_recent`
ADD CONSTRAINT `smart_motion_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_presence_event`
--
ALTER TABLE `smart_presence_event`
ADD CONSTRAINT `smart_presence_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_presence_recent`
--
ALTER TABLE `smart_presence_recent`
ADD CONSTRAINT `smart_presence_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_rssi_event`
--
ALTER TABLE `smart_rssi_event`
ADD CONSTRAINT `smart_rssi_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_rssi_recent`
--
ALTER TABLE `smart_rssi_recent`
ADD CONSTRAINT `smart_rssi_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_temperature_event`
--
ALTER TABLE `smart_temperature_event`
ADD CONSTRAINT `smart_temperature_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_temperature_recent`
--
ALTER TABLE `smart_temperature_recent`
ADD CONSTRAINT `smart_temperature_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_threeaxis_event`
--
ALTER TABLE `smart_threeaxis_event`
ADD CONSTRAINT `smart_threeaxis_event_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);

--
-- Constraints for table `smart_threeaxis_recent`
--
ALTER TABLE `smart_threeaxis_recent`
ADD CONSTRAINT `smart_threeaxis_recent_ibfk_1` FOREIGN KEY (`device`) REFERENCES `smart_device` (`pid`);
