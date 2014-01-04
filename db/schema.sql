-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2014 at 02:50 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `shak`
--

-- --------------------------------------------------------

--
-- Table structure for table `smart_acceleration_event`
--

CREATE TABLE IF NOT EXISTS `smart_acceleration_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_acceleration_recent`
--

CREATE TABLE IF NOT EXISTS `smart_acceleration_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_battery_event`
--

CREATE TABLE IF NOT EXISTS `smart_battery_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_battery_recent`
--

CREATE TABLE IF NOT EXISTS `smart_battery_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_contact_event`
--

CREATE TABLE IF NOT EXISTS `smart_contact_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_contact_recent`
--

CREATE TABLE IF NOT EXISTS `smart_contact_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_device`
--

CREATE TABLE IF NOT EXISTS `smart_device` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `deviceid` char(36) NOT NULL,
  `locationid` char(36) NOT NULL,
  `hubid` char(36) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `hub_location_device` (`hubid`,`locationid`,`deviceid`),
  KEY `hubid` (`hubid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_humidity_event`
--

CREATE TABLE IF NOT EXISTS `smart_humidity_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_humidity_recent`
--

CREATE TABLE IF NOT EXISTS `smart_humidity_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_illuminance_event`
--

CREATE TABLE IF NOT EXISTS `smart_illuminance_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_illuminance_recent`
--

CREATE TABLE IF NOT EXISTS `smart_illuminance_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_lqi_event`
--

CREATE TABLE IF NOT EXISTS `smart_lqi_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_lqi_recent`
--

CREATE TABLE IF NOT EXISTS `smart_lqi_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_motion_event`
--

CREATE TABLE IF NOT EXISTS `smart_motion_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_motion_recent`
--

CREATE TABLE IF NOT EXISTS `smart_motion_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_presence_event`
--

CREATE TABLE IF NOT EXISTS `smart_presence_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_presence_recent`
--

CREATE TABLE IF NOT EXISTS `smart_presence_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `status` char(1) NOT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_rssi_event`
--

CREATE TABLE IF NOT EXISTS `smart_rssi_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_rssi_recent`
--

CREATE TABLE IF NOT EXISTS `smart_rssi_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_temperature_event`
--

CREATE TABLE IF NOT EXISTS `smart_temperature_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `unit` char(1) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_temperature_recent`
--

CREATE TABLE IF NOT EXISTS `smart_temperature_recent` (
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `unit` char(1) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smart_threeaxis_event`
--

CREATE TABLE IF NOT EXISTS `smart_threeaxis_event` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` char(36) NOT NULL,
  `device` int(11) NOT NULL,
  `valX` int(11) DEFAULT NULL,
  `valY` int(11) DEFAULT NULL,
  `valZ` int(11) DEFAULT NULL,
  `occurred` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `eventid` (`eventid`),
  KEY `device` (`device`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

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
  `occurred` datetime NOT NULL,
  UNIQUE KEY `eventid` (`eventid`),
  UNIQUE KEY `device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

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
