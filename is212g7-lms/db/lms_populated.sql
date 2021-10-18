-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 12, 2021 at 11:25 AM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--
CREATE DATABASE IF NOT EXISTS `lms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `lms`;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `CourseID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassTitle` varchar(150) NOT NULL,
  `TrainerUID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TotalSlots` int(11) NOT NULL,
  `OccupiedSlots` int(11) NOT NULL,
  `ClassStartDateTime` datetime NOT NULL,
  `ClassEndDateTime` datetime NOT NULL,
  `SelfEnrollmentStarDate` datetime NOT NULL,
  `SelfEnrollmentEndDate` datetime NOT NULL,
  PRIMARY KEY (`CourseID`,`ClassID`),
  KEY `ClassID` (`ClassID`),
  KEY `TrainerUID` (`TrainerUID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`CourseID`, `ClassID`, `ClassTitle`, `TrainerUID`, `TotalSlots`, `OccupiedSlots`, `ClassStartDateTime`, `ClassEndDateTime`, `SelfEnrollmentStarDate`, `SelfEnrollmentEndDate`) VALUES
(1, 9, 'Class 1', 'william_tan@allinone.com', 15, 6, '2021-10-00 00:00:00', '2021-11-30 00:00:00', '2021-09-01 00:00:00', '2021-09-15 11:59:00'),
(1, 10, 'Class 2', 'alexis.tan@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 11, 'Class 3', 'henry.q@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 8, 'Class 1', 'jackson.s@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 6, 'Class 1', 'ethan.n@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 7, 'Class 1', 'xin.chua@allinone.com', 15, 0, '2021-11-01 00:00:00', '2021-12-31 00:00:00', '2021-10-10 00:00:00', '2021-10-31 00:00:00'),
(5, 3, 'Class 1', 'alexis.tan@allinone.com', 15, 0, '2021-09-01 00:00:00', '2021-10-31 00:00:00', '2021-08-01 00:00:00', '2021-08-28 00:00:00'),
(5, 4, 'Class 2', 'william_tan@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 5, 'Class 3', 'alexis.tan@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 'Class 1', 'ethan.n@allinone.com', 15, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 2, 'Class 2', 'logan_chew@allinone.com', 15, 0, '2021-11-01 00:00:00', '2021-12-31 00:00:00', '2021-10-10 00:00:00', '2021-10-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseTitle` varchar(150) NOT NULL,
  `CourseDescription` varchar(500) NOT NULL,
  PRIMARY KEY (`CourseID`),
  UNIQUE KEY `CourseID` (`CourseID`),
  KEY `CourseID_2` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseTitle`, `CourseDescription`) VALUES
(1, 'Fundamentals of Xerox WorkCentre 7845', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(2, 'Fundamentals of XEROX B215 MULTIFUNCTION PRINTER', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(3, 'Fundamentals of Xerox WORKCENTRE 6515 DNI', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(4, 'Fundamentals of Xerox WORKCENTRE 3335 DNI', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(5, 'Fundamentals of Xerox ALTALINK B8100 SERIES', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(6, 'Fundamentals of Xerox VERSALINK C7000 SERIES', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(7, 'Fundamentals of Xerox VERSALINK C405 DN', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(8, 'Fundamentals of Xerox VERSALINK B605/B615', 'The course is about information regarding Xerox series of printers All-in-One Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(9, 'Fundamentals of XEROX B230 PRINTER', 'The course is about information regarding Xerox series of printers Office Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(10, 'Fundamentals of XEROX C230 COLOR PRINTER', 'The course is about information regarding Xerox series of printers Office Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(11, 'Fundamentals of XEROX B205 MULTIFUNCTION PRINTER', 'The course is about information regarding Xerox series of printers Office Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(12, 'Fundamentals of WORKCENTRE 3335 DNI', 'The course is about information regarding Xerox series of printers Office Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(13, 'Fundamentals of XEROX ALTALINK C8100 SERIES', 'The course is about information regarding Xerox series of printers Office Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(14, 'Fundamentals of WORKCENTRE 6515 DN', 'The course is about information regarding Xerox series of printers Office Laser Printers. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(15, 'Fundamentals of Brother MFC-L8690CDW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(16, 'Fundamentals of Brother MFC-J5730DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(17, 'Fundamentals of Brother MFC-J6530DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(18, 'Fundamentals of Brother MFC-J5330DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(19, 'Fundamentals of Brother MFC-J6930DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(20, 'Fundamentals of Brother MFC-J6945DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(21, 'Fundamentals of Brother MFC-J5945DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(22, 'Fundamentals of Brother MFC-J4340DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(23, 'Fundamentals of Brother MFC-J4540DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(24, 'Fundamentals of Brother MFC-J4540DWXL', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(25, 'Fundamentals of Brother MFC-L5700DN', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(26, 'Fundamentals of Brother MFC-L6900DW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(27, 'Fundamentals of Brother MFC-L8900CDWMT', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(28, 'Fundamentals of Brother MFC-L8690CDW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(29, 'Fundamentals of Brother MFC-L9570CDWT', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(30, 'Fundamentals of Brother MFC-L8900CDW', 'The course is about information regarding Brother series of printers All-in-One Printers with Fax. You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(31, 'Fundamentals of Brother MFC-J6930DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(32, 'Fundamentals of Brother MFC-J5330DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(33, 'Fundamentals of Brother MFC-J5730DW ', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(34, 'Fundamentals of Brother HL-J6000DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(35, 'Fundamentals of Brother HL-J6100DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(36, 'Fundamentals of Brother MFC-J6945DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(37, 'Fundamentals of Brother MFC-J5945DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(38, 'Fundamentals of Brother MFC-J4340DW', 'The course is about information regarding Brother series of Business inkjet printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade.'),
(39, 'Fundamentals of Brother RJ-2150', 'The course is about information regarding Brother series of Portable printers . You will take a final quiz at the end of the course. All training materials must be viewed in order to be counted for a passing grade. Learn the Rugged mobile printer with LCD display for printing 58mm width receipts and 55mm width labels. Bluetooth, Wi-Fi and USB connectivity. Android, iOS and Windows compatible.'),
(40, 'Fundamentals of Brother RJ-3035B Mobile Receipt Printer', 'Learn the specifications about the 3\" mobile printer weighing only 375g and printing receipts up to 80mm media width connectivity.'),
(41, 'Fundamentals of Brother RJ-4030', 'Learn the specifications about the Rugged 4 inch portable printer with Bluetooth.'),
(42, 'Fundamentals of Brother Brother RJ-2035B Mobile Receipt Printer', 'Learn the specifications about the 2\" mobile printer weighing only 215g and printing receipts up to 58mm media width'),
(43, 'Fundamentals of Brother PJ-763', 'Learn the specifications about the Compact High-Resolution A4 Mobile Printer with Bluetooth. connectivity.'),
(44, 'Fundamentals of Brother RJ-4230B ', 'Learn the specifications about the Rugged 4 inch mobile label/receipt printer with USB and Bluetooth connectivity.');

-- --------------------------------------------------------

--
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
CREATE TABLE IF NOT EXISTS `enrolment` (
  `EnrolmentID` int(100) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `DateOfEnrollment` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Confirmed Enrolled by HR',
  `Category` varchar(15) NOT NULL COMMENT 'Pre-assigned/Self-Enrolled',
  `Status` varchar(15) NOT NULL COMMENT 'Completed/In-Progress/Withdrawn/Failed',
  `DateOfCompletion` datetime DEFAULT NULL,
  PRIMARY KEY (`EnrolmentID`),
  KEY `ClassID` (`ClassID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrolment`
--

INSERT INTO `enrolment` (`EnrolmentID`, `CourseID`, `Username`, `ClassID`, `DateOfEnrollment`, `Category`, `Status`, `DateOfCompletion`) VALUES
(1, 1, 'gray_lee@allinone.com', 9, '2021-10-06 19:05:00', 'Pre-assigned', 'In-Progress', NULL),
(2, 1, 'luke_sim@allinone.com', 9, '2021-10-06 19:05:00', 'Pre-assigned', 'In-Progress', NULL),
(3, 1, 'wyatt_king@allinone.com', 9, '2021-10-06 19:05:00', 'Pre-assigned', 'In-Progress', NULL),
(11, 1, 'elijah.m@allinone.com', 9, '2021-10-10 23:35:06', 'Pre-assigned', 'In-Progress', NULL),
(22, 1, 'charles.o@allinone.com', 9, '2021-10-10 23:46:55', 'Pre-assigned', 'In-Progress', NULL),
(23, 1, 'gabriel_ong@allinone.com', 9, '2021-10-10 23:51:22', 'Self-Enrolled', 'In-Progress', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
CREATE TABLE IF NOT EXISTS `prerequisites` (
  `CourseID` int(11) NOT NULL,
  `PrerequisiteID` int(11) NOT NULL,
  KEY `CourseID` (`CourseID`,`PrerequisiteID`),
  KEY `PrerequisiteID` (`PrerequisiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prerequisites`
--

INSERT INTO `prerequisites` (`CourseID`, `PrerequisiteID`) VALUES
(35, 31),
(44, 43);

-- --------------------------------------------------------

--
-- Table structure for table `qualifiedtrainers`
--

DROP TABLE IF EXISTS `qualifiedtrainers`;
CREATE TABLE IF NOT EXISTS `qualifiedtrainers` (
  `Username` varchar(100) NOT NULL,
  `QualifiedtoTeach` int(11) NOT NULL COMMENT 'Reference CourseID from Course',
  PRIMARY KEY (`Username`,`QualifiedtoTeach`),
  KEY `QualifiedtoTeach` (`QualifiedtoTeach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `qualifiedtrainers`
--

INSERT INTO `qualifiedtrainers` (`Username`, `QualifiedtoTeach`) VALUES
('alexis.tan@allinone.com', 1),
('benedict@allinone.com', 1),
('elijah.m@allinone.com', 1),
('ethan.n@allinone.com', 1),
('henry.q@allinone.com', 1),
('hong.l@allinone.com', 1),
('jack@allinone.com', 1),
('jackson.s@allinone.com', 1),
('jacob_tan@allinone.com', 1),
('kenneth.s.tan@allinone.com', 1),
('logan_chew@allinone.com', 1),
('teck.a@allinone.com', 1),
('william_tan@allinone.com', 1),
('xin.chua@allinone.com', 1),
('elijah.m@allinone.com', 2),
('ethan.n@allinone.com', 2),
('henry.q@allinone.com', 2),
('jack@allinone.com', 2),
('jackson.s@allinone.com', 2),
('jacob_tan@allinone.com', 2),
('logan_chew@allinone.com', 2),
('alexis.tan@allinone.com', 3),
('ethan.n@allinone.com', 3),
('henry.q@allinone.com', 3),
('william_tan@allinone.com', 3),
('hong.l@allinone.com', 4),
('teck.a@allinone.com', 4),
('xin.chua@allinone.com', 4),
('alexis.tan@allinone.com', 5),
('kenneth.s.tan@allinone.com', 5),
('william_tan@allinone.com', 5),
('alexis.tan@allinone.com', 6),
('ethan.n@allinone.com', 6),
('henry.q@allinone.com', 6),
('hong.l@allinone.com', 7),
('teck.a@allinone.com', 7),
('alexis.tan@allinone.com', 8),
('benedict@allinone.com', 8),
('ethan.n@allinone.com', 8),
('henry.q@allinone.com', 8),
('kenneth.s.tan@allinone.com', 8),
('william_tan@allinone.com', 8),
('xin.chua@allinone.com', 8),
('jack@allinone.com', 9),
('jackson.s@allinone.com', 9),
('jacob_tan@allinone.com', 9),
('logan_chew@allinone.com', 9),
('elijah.m@allinone.com', 10),
('henry.q@allinone.com', 10),
('alexis.tan@allinone.com', 11),
('elijah.m@allinone.com', 11),
('ethan.n@allinone.com', 11),
('henry.q@allinone.com', 11),
('logan_chew@allinone.com', 11),
('william_tan@allinone.com', 11),
('alexis.tan@allinone.com', 12),
('ethan.n@allinone.com', 12),
('henry.q@allinone.com', 12),
('teck.a@allinone.com', 12),
('ethan.n@allinone.com', 13),
('hong.l@allinone.com', 13),
('jack@allinone.com', 13),
('logan_chew@allinone.com', 13),
('teck.a@allinone.com', 13),
('benedict@allinone.com', 14),
('kenneth.s.tan@allinone.com', 14),
('xin.chua@allinone.com', 14),
('alexis.tan@allinone.com', 15),
('henry.q@allinone.com', 15),
('william_tan@allinone.com', 15),
('ethan.n@allinone.com', 16),
('jack@allinone.com', 16),
('jackson.s@allinone.com', 16),
('logan_chew@allinone.com', 16),
('benedict@allinone.com', 17),
('elijah.m@allinone.com', 17),
('jacob_tan@allinone.com', 17),
('benedict@allinone.com', 18),
('elijah.m@allinone.com', 18),
('kenneth.s.tan@allinone.com', 18),
('william_tan@allinone.com', 18),
('benedict@allinone.com', 19),
('elijah.m@allinone.com', 19),
('ethan.n@allinone.com', 19),
('henry.q@allinone.com', 19),
('logan_chew@allinone.com', 19),
('benedict@allinone.com', 20),
('kenneth.s.tan@allinone.com', 20),
('xin.chua@allinone.com', 20),
('alexis.tan@allinone.com', 21),
('benedict@allinone.com', 21),
('ethan.n@allinone.com', 21),
('henry.q@allinone.com', 21),
('logan_chew@allinone.com', 21),
('william_tan@allinone.com', 21),
('xin.chua@allinone.com', 21),
('jack@allinone.com', 22),
('william_tan@allinone.com', 22),
('alexis.tan@allinone.com', 23),
('henry.q@allinone.com', 23),
('benedict@allinone.com', 24),
('xin.chua@allinone.com', 24),
('kenneth.s.tan@allinone.com', 25),
('william_tan@allinone.com', 25),
('alexis.tan@allinone.com', 26),
('jackson.s@allinone.com', 26),
('ethan.n@allinone.com', 27),
('henry.q@allinone.com', 27),
('jack@allinone.com', 28),
('jackson.s@allinone.com', 28),
('jacob_tan@allinone.com', 28),
('logan_chew@allinone.com', 28),
('elijah.m@allinone.com', 29),
('jackson.s@allinone.com', 29),
('benedict@allinone.com', 30),
('jacob_tan@allinone.com', 30),
('kenneth.s.tan@allinone.com', 30),
('william_tan@allinone.com', 30),
('alexis.tan@allinone.com', 31),
('henry.q@allinone.com', 31),
('ethan.n@allinone.com', 32),
('jack@allinone.com', 32),
('logan_chew@allinone.com', 32),
('ethan.n@allinone.com', 33),
('henry.q@allinone.com', 33),
('jack@allinone.com', 34),
('logan_chew@allinone.com', 34),
('william_tan@allinone.com', 35),
('alexis.tan@allinone.com', 36),
('logan_chew@allinone.com', 36),
('benedict@allinone.com', 37),
('henry.q@allinone.com', 37),
('kenneth.s.tan@allinone.com', 37),
('xin.chua@allinone.com', 37),
('alexis.tan@allinone.com', 38),
('william_tan@allinone.com', 38),
('ethan.n@allinone.com', 39),
('henry.q@allinone.com', 39),
('jack@allinone.com', 40),
('logan_chew@allinone.com', 40),
('alexis.tan@allinone.com', 41),
('ethan.n@allinone.com', 41),
('jack@allinone.com', 41),
('logan_chew@allinone.com', 41),
('william_tan@allinone.com', 41),
('henry.q@allinone.com', 42),
('jack@allinone.com', 42),
('logan_chew@allinone.com', 42),
('william_tan@allinone.com', 42),
('alexis.tan@allinone.com', 43),
('jack@allinone.com', 43),
('william_tan@allinone.com', 43),
('ethan.n@allinone.com', 44),
('henry.q@allinone.com', 44),
('jack@allinone.com', 44),
('logan_chew@allinone.com', 44);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `QuizID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `QuizTitle` varchar(150) NOT NULL,
  `QuizDescription` varchar(300) NOT NULL,
  `Duration` int(3) NOT NULL COMMENT 'in minutes',
  `QuizArray` varchar(10000) NOT NULL COMMENT 'questions and answers',
  `FinalQuiz` tinyint(1) NOT NULL,
  PRIMARY KEY (`QuizID`),
  KEY `CreatedBy` (`CreatedBy`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`QuizID`, `CourseID`, `CreatedBy`, `QuizTitle`, `QuizDescription`, `Duration`, `QuizArray`, `FinalQuiz`) VALUES
(1, 1, 'william_tan@allinone.com', 'End of Section 1 Quiz', 'Complete the quiz in order to move to the next section of the course. You have 15 minutes to complete it.', 15, '{ \"questions\": [{ \"type\": \"mcq\", \"questiondescription\": \"Choose the following false statement.\", \"options\": [\"The printer is able to print in color.\", \"The printer is able to print in B/W only.\", \"The printer is only sold and available in black.\", \"The printer is sold as office-use.\"], \"answer\": 0 }] }', 0),
(2, 1, 'william_tan@allinone.com', 'End of Section 2 Quiz (Final Quiz)', 'Complete and pass the quiz in order to graduate from the course. You have unlimited attempts. You have 15 minutes to complete it.', 15, '{ \"questions\": [{ \"type\": \"mcq\", \"questiondescription\": \"Choose the following false statement.\", \"options\": [\"The printer is able to print in color.\", \"The printer is able to print in B/W only.\", \"The printer is only sold and available in black.\", \"The printer is sold as office-use.\"], \"answer\": 0 }, { \"type\": \"tf\", \"questiondescription\": \"The printer is able to print in color\", \"options\": [\"True\", \"False\"], \"answer\": 0 } ] }', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sectioninfo`
--

DROP TABLE IF EXISTS `sectioninfo`;
CREATE TABLE IF NOT EXISTS `sectioninfo` (
  `ClassID` int(11) NOT NULL,
  `SectionNo` int(11) NOT NULL,
  `QuizID` int(11) NOT NULL COMMENT 'quizid to complete the section',
  `Section Title` varchar(50) NOT NULL,
  PRIMARY KEY (`ClassID`,`SectionNo`),
  KEY `QuizID` (`QuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sectioninfo`
--

INSERT INTO `sectioninfo` (`ClassID`, `SectionNo`, `QuizID`, `Section Title`) VALUES
(9, 1, 1, 'Section 1 - User guide'),
(9, 2, 2, 'Section 2 - About printer');

-- --------------------------------------------------------

--
-- Table structure for table `selfenrolment`
--

DROP TABLE IF EXISTS `selfenrolment`;
CREATE TABLE IF NOT EXISTS `selfenrolment` (
  `SelfEnrolmentID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `Username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Pending/Rejected/Approved',
  `LastReviewedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`SelfEnrolmentID`),
  KEY `selfenrolment_ibfk_1` (`ClassID`,`CourseID`),
  KEY `Username` (`Username`),
  KEY `CourseID` (`CourseID`,`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `selfenrolment`
--

INSERT INTO `selfenrolment` (`SelfEnrolmentID`, `CourseID`, `ClassID`, `Username`, `CreatedOn`, `Status`, `LastReviewedOn`) VALUES
(5, 1, 9, 'gabriel_ong@allinone.com', '2021-10-10 23:47:29', 'Approved', '2021-10-10 23:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `trainingmaterial`
--

DROP TABLE IF EXISTS `trainingmaterial`;
CREATE TABLE IF NOT EXISTS `trainingmaterial` (
  `TrainingMaterialID` int(11) NOT NULL AUTO_INCREMENT,
  `TMArray` varchar(10000) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `SectionNo` int(11) NOT NULL,
  `DisplayOrder` int(11) NOT NULL,
  PRIMARY KEY (`TrainingMaterialID`),
  KEY `ClassID` (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trainingmaterial`
--

INSERT INTO `trainingmaterial` (`TrainingMaterialID`, `TMArray`, `ClassID`, `SectionNo`, `DisplayOrder`) VALUES
(1, '{Title:Read the user guide about the printer, type: document, path: \"/xerox/Xerox-Workcentre-7845-User-Guide.pdf\"}', 9, 1, 1),
(2, '{Title:Watch video about the printer, type: hyperlink, uri: \"https://www.youtube.com/watch?v=0rd1Ppk9p9A\"}', 9, 2, 1),
(3, '{Title:Look at this picture about the printer, type: document, path: \"/xerox/Xerox_WorkCentre_7800_Series_8e0c37b7-c0de-401a-98ad-7b7c8cad6045.jpg\"}', 9, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Username` varchar(100) NOT NULL,
  `EmployeeName` varchar(200) NOT NULL,
  `Designation` varchar(200) NOT NULL,
  `Department` varchar(50) NOT NULL,
  `Role` varchar(15) NOT NULL DEFAULT 'learner' COMMENT 'Has default value of "learner"',
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Username`, `EmployeeName`, `Designation`, `Department`, `Role`) VALUES
('aiden.j@allinone.com', 'aiden jonas', 'roving service engineer', 'operations', 'learner'),
('alex.chen@allinone.com', 'alex chen rui na', 'roving service engineer', 'operations', 'learner'),
('alexis.q@allinone.com', 'alexis queens', 'roving service engineer', 'operations', 'learner'),
('alexis.tan@allinone.com', 'alexis tan yi en', 'roving service engineer', 'operations', 'trainer'),
('alice.chua@allinone.com', 'alice chualings', 'admin and call centre', 'HR and admin', 'administrator'),
('andrew_lee@allinone.com', 'andrew lee qin wei', 'roving service engineer', 'operations', 'learner'),
('ben.tan@allinone.com', 'ben tan jia rui', 'roving service engineer', 'operations', 'learner'),
('benedict@allinone.com', 'benedict tan jia ke', 'repair engineer', 'operations', 'trainer'),
('benjamin.chew@allinone.com', 'benjamin chew ming en', 'roving service engineer', 'operations', 'learner'),
('calvin_chen@allinone.com', 'calvin chen yi han', 'roving service engineer', 'operations', 'learner'),
('candy.lim@allinone.com', 'candy lim qi qi', 'operation planning', 'HR and admin', 'administrator'),
('carter.k@allinone.com', 'carter kane', 'roving service engineer', 'operations', 'learner'),
('charles.o@allinone.com', 'charles olson', 'roving service engineer', 'operations', 'learner'),
('chester_lim@allinone.com', 'chester lim wei jie', 'roving service engineer', 'operations', 'learner'),
('christian_lee@allinone.com', 'christian lee wei lun', 'roving service engineer', 'operations', 'learner'),
('cole_chua@allinone.com', 'cole chua ming en', 'roving service engineer', 'operations', 'learner'),
('colt.g@allinone.com', 'colt george', 'roving service engineer', 'operations', 'learner'),
('cooper.g@allinone.com', 'cooper gwens', 'roving service engineer', 'operations', 'learner'),
('daniel_lim@allinone.com', 'daniel lim jia en', 'roving service engineer', 'operations', 'learner'),
('eli.s@allinone.com', 'eli silvers', 'roving service engineer', 'operations', 'learner'),
('elijah.m@allinone.com', 'elijah miller', 'roving service engineer', 'operations', 'trainer'),
('ethan.n@allinone.com', 'ethan neil', 'roving service engineer', 'operations', 'trainer'),
('evan.g@allinone.com', 'evan griffin', 'roving service engineer', 'operations', 'learner'),
('gabriel_ong@allinone.com', 'gabriel ong ci yu', 'roving service engineer', 'operations', 'learner'),
('gavin_lee@allinone.com', 'gavin lee jia hai', 'roving service engineer', 'operations', 'learner'),
('grace_lee@allinone.com', 'grace lee jia rong', 'operation planning', 'HR and admin', 'administrator'),
('gray_lee@allinone.com', 'gray lee bao lam', 'roving service engineer', 'operations', 'learner'),
('greyson.j@allinone.com', 'greyson jenkins', 'roving service engineer', 'operations', 'learner'),
('henry.q@allinone.com', 'henry queens', 'roving service engineer', 'operations', 'trainer'),
('hong.l@allinone.com', 'hong li jia', 'repair engineer', 'operations', 'trainer'),
('ian_sim@allinone.com', 'ian sim dai yu', 'roving service engineer', 'operations', 'learner'),
('isaac_phoon@allinone.com', 'isaac phoon bing hai', 'roving service engineer', 'operations', 'learner'),
('jack@allinone.com', 'jack winding', 'roving service engineer', 'operations', 'trainer'),
('jackson_lum@allinone.com', 'jackson lum bi jia', 'roving service engineer', 'operations', 'learner'),
('jackson.s@allinone.com', 'jackson snyder', 'roving service engineer', 'operations', 'trainer'),
('jacob_tan@allinone.com', 'jacob tan rong li', 'roving service engineer', 'operations', 'trainer'),
('jason_q@allinone.com', 'jason qing chen', 'roving service engineer', 'operations', 'learner'),
('jaxon_lim@allinone.com', 'jaxon lim xiang rui', 'roving service engineer', 'operations', 'learner'),
('jonas.q.tan@allinone.com', 'jonas quinn tan', 'roving service engineer', 'operations', 'learner'),
('jonathan.lim@allinone.com', 'jonathan lim li rui', 'roving service engineer', 'operations', 'learner'),
('jose_lee@allinone.com', 'jose lee teck anh', 'roving service engineer', 'operations', 'learner'),
('jose.f@allinone.com', 'jose fisher', 'roving service engineer', 'operations', 'learner'),
('joseph_lim@allinone.com', 'joseph lim dong hai', 'roving service engineer', 'operations', 'learner'),
('joshua_lim@allinone.com', 'joshua lim jia cao', 'roving service engineer', 'operations', 'learner'),
('josiah_lee@allinone.com', 'josiah lee en xiang', 'admin and call centre', 'HR and admin', 'administrator'),
('josiah.j@allinone.com', 'josiah johnson', 'roving service engineer', 'operations', 'learner'),
('kenneth.s.tan@allinone.com', 'kenneth singer tan', 'roving service engineer', 'operations', 'trainer'),
('lee_eng@allinone.com', 'lee eng lam', 'roving service engineer', 'operations', 'learner'),
('leo.k@allinone.com', 'leo kelly', 'roving service engineer', 'operations', 'learner'),
('levi.a@allinone.com', 'levi alexander', 'roving service engineer', 'operations', 'learner'),
('liam.lim@allinone.com', 'liam lim jia jia', 'roving service engineer', 'operations', 'learner'),
('logan_chew@allinone.com', 'logan chew', 'roving service engineer', 'operations', 'trainer'),
('luca.d@allinone.com', 'luca devers', 'roving service engineer', 'operations', 'learner'),
('luke_sim@allinone.com', 'luke sim bao yi', 'roving service engineer', 'operations', 'learner'),
('lum.s@allinone.com', 'lum stewart scott', 'roving service engineer', 'operations', 'learner'),
('matt.a@allinone.com', 'matt anderson', 'roving service engineer', 'operations', 'learner'),
('maverick_lee@allinone.com', 'maverick lee kun yi', 'roving service engineer', 'operations', 'learner'),
('max_phoon@allinone.com', 'max phoon lun fatt', 'roving service engineer', 'operations', 'learner'),
('max_sim@allinone.com', 'max sim xing le', 'operation planning', 'HR and admin', 'administrator'),
('mica.s@allinone.com', 'mica smith', 'roving service engineer', 'operations', 'learner'),
('nathan_lee@allinone.com', 'nathan lee chang yi', 'roving service engineer', 'operations', 'learner'),
('nathan.h@allinone.com', 'nathan harris', 'roving service engineer', 'operations', 'learner'),
('oliver.sun@allinone.com', 'oliver sun ming', 'roving service engineer', 'operations', 'learner'),
('owen_choo@allinone.com', 'owen choo yang ru', 'roving service engineer', 'operations', 'learner'),
('owen.j@allinone.com', 'owen johnson', 'roving service engineer', 'operations', 'learner'),
('peng_lim@allinone.com', 'peng lei lim', 'roving service engineer', 'operations', 'learner'),
('rica.h@allinone.com', 'rica howard', 'roving service engineer', 'operations', 'learner'),
('robert_lim@allinone.com', 'robert lim hong de', 'roving service engineer', 'operations', 'learner'),
('ryan_tan@allinone.com', 'ryan tan han ming', 'roving service engineer', 'operations', 'learner'),
('samuel_lim@allinone.com', 'samuel lim yao en', 'roving service engineer', 'operations', 'learner'),
('silas_lee@allinone.com', 'silas lee de lun', 'roving service engineer', 'operations', 'learner'),
('teck.a@allinone.com', 'teck alex simon', 'repair engineer', 'operations', 'trainer'),
('thomas_choo@allinone.com', 'thomas choo teck xiang', 'roving service engineer', 'operations', 'learner'),
('thomick_chen@allinone.com', 'thomick chen bao jia', 'roving service engineer', 'operations', 'learner'),
('wayn.g@allinone.com', 'wayn gordon', 'roving service engineer', 'operations', 'learner'),
('william_tan@allinone.com', 'william tan rong jie', 'roving service engineer', 'operations', 'trainer'),
('wyatt_king@allinone.com', 'wyatt king anders', 'roving service engineer', 'operations', 'learner'),
('xin.chua@allinone.com', 'chua xin qi ', 'repair engineer', 'operations', 'trainer'),
('zachary.n@allinone.com', 'zachary nowells', 'roving service engineer', 'operations', 'learner');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`TrainerUID`) REFERENCES `users` (`Username`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `enrolment`
--
ALTER TABLE `enrolment`
  ADD CONSTRAINT `enrolment_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `enrolment_ibfk_4` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD CONSTRAINT `prerequisites_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prerequisites_ibfk_2` FOREIGN KEY (`PrerequisiteID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qualifiedtrainers`
--
ALTER TABLE `qualifiedtrainers`
  ADD CONSTRAINT `qualifiedtrainers_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qualifiedtrainers_ibfk_3` FOREIGN KEY (`QualifiedtoTeach`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_3` FOREIGN KEY (`CreatedBy`) REFERENCES `users` (`Username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_ibfk_4` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `sectioninfo`
--
ALTER TABLE `sectioninfo`
  ADD CONSTRAINT `sectioninfo_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `sectioninfo_ibfk_3` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `selfenrolment`
--
ALTER TABLE `selfenrolment`
  ADD CONSTRAINT `selfenrolment_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `selfenrolment_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `class` (`CourseID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `selfenrolment_ibfk_4` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`);

--
-- Constraints for table `trainingmaterial`
--
ALTER TABLE `trainingmaterial`
  ADD CONSTRAINT `trainingmaterial_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`ClassID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
