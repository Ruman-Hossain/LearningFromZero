-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2021 at 07:08 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brebhr`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `dept_location` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_location`) VALUES
(1001, 'Finance', 'Sydney'),
(2001, 'Audit', 'Melbourne'),
(3001, 'Marketing', 'Perth'),
(4001, 'Production', 'Brisbane');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `Emp_id` int(11) DEFAULT NULL,
  `Emp_name` varchar(15) DEFAULT NULL,
  `Job_name` varchar(10) DEFAULT NULL,
  `Manager_id` int(10) DEFAULT NULL,
  `Hire_date` date DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Commission` decimal(7,2) DEFAULT NULL,
  `Dept_id` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`Emp_id`, `Emp_name`, `Job_name`, `Manager_id`, `Hire_date`, `Salary`, `Commission`, `Dept_id`) VALUES
(68319, 'Kayling', 'President', 0, '1991-11-18', '6000.00', '0.00', 1001),
(66928, 'Blaze', 'Manager', 68319, '1991-05-01', '2750.00', '0.00', 300),
(67832, 'Clare', 'Manager', 68319, '1991-06-09', '2550.00', '0.00', 1001),
(65646, 'Jonas', 'Manager', 68319, '1991-04-02', '2957.00', '0.00', 2001),
(67858, 'Scarlet', 'Analyst', 65646, '1991-04-19', '3100.00', '0.00', 2001),
(69062, 'Frank', 'Analyst', 65646, '1991-12-03', '3100.00', '0.00', 2001),
(63679, 'Sandrine', 'Clerk', 69062, '1991-12-18', '3100.00', '0.00', 2001),
(64989, 'Adelyn', 'salesman', 66928, '1991-02-20', '1700.00', '400.00', 3001),
(65271, 'wade', 'Salesman', 66928, '1991-02-22', '1350.00', '600.00', 3001);

-- --------------------------------------------------------

--
-- Table structure for table `salary_grade`
--

CREATE TABLE `salary_grade` (
  `grade` int(11) DEFAULT NULL,
  `Min_salary` int(7) DEFAULT NULL,
  `Max_salary` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary_grade`
--

INSERT INTO `salary_grade` (`grade`, `Min_salary`, `Max_salary`) VALUES
(0, 0, 0),
(1, 800, 1300),
(2, 1301, 1500),
(3, 1501, 2100),
(4, 2101, 3100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
