-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2016 at 12:08 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `question_paper_generator`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` varchar(20) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Password`) VALUES
('tester', 'tester'),
('root', '63a9f0ea7bb98050796b'),
('tester1', 'f5d1278e8109edd94e1e4197e04873b9');

-- --------------------------------------------------------

--
-- Table structure for table `belongs_to`
--

CREATE TABLE `belongs_to` (
  `QP_ID` varchar(20) NOT NULL DEFAULT '',
  `Ques_ID` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Semester` int(10) DEFAULT NULL,
  `Course_ID` varchar(10) NOT NULL,
  `Credits` int(5) DEFAULT NULL,
  `Course_Tyoe` varchar(20) DEFAULT NULL,
  `Dept_ID` varchar(10) DEFAULT NULL,
  `Course_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Semester`, `Course_ID`, `Credits`, `Course_Tyoe`, `Dept_ID`, `Course_Name`) VALUES
(6, '12IS62', 3, 'Mandatory', 'RVCEISE', 'Software Engineering'),
(6, '12IS63', 5, 'Mandatory', 'RVCEISE', 'CNS'),
(6, '12IS64', 5, 'Mandatory', 'RVCEISE', 'DataBase Management System');

-- --------------------------------------------------------

--
-- Table structure for table `course_outcome`
--

CREATE TABLE `course_outcome` (
  `Course_ID` varchar(10) NOT NULL DEFAULT '',
  `CO_No` varchar(5) NOT NULL DEFAULT '',
  `CO_Description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_outcome`
--

INSERT INTO `course_outcome` (`Course_ID`, `CO_No`, `CO_Description`) VALUES
('12IS64', '1', 'Design a Database for a given miniworld.'),
('12IS64', '2', 'Apply the principles of normalization for a given schema to implement database in the real world'),
('12IS64', '3', 'Appreciate the use of different algorithms for achieving ACID properties'),
('12IS64', '4', 'Implement a DBMS that provides user with business queries,forms and reports'),
('12IS64', '5', 'Implement Database using querying mechanism and implement different level of security');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dept_Name` varchar(30) DEFAULT NULL,
  `Dept_ID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_Name`, `Dept_ID`) VALUES
('ISE', 'RVCEISE');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `Eval_Start_Date` date DEFAULT NULL,
  `Eval_Type` varchar(10) DEFAULT NULL,
  `Eval_ID` varchar(20) NOT NULL,
  `Added_By` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`Eval_Start_Date`, `Eval_Type`, `Eval_ID`, `Added_By`) VALUES
('2016-05-19', 'CIE', '56f635b74e31d', ''),
('2016-05-12', 'SEE', '56f693570a954', 'tester'),
('2016-05-12', 'SEE', '56f69385cbeaa', 'tester'),
('2016-05-12', 'SEE', '56f693a054ad5', 'tester'),
('2016-04-06', 'SEE', '56f693d22caaa', 'tester'),
('2016-05-19', 'SEE', '57260e72a6ca6', ''),
('2016-05-01', 'SEE', '57260e9860854', '');

-- --------------------------------------------------------

--
-- Table structure for table `handled_by`
--

CREATE TABLE `handled_by` (
  `Teacher_ID` varchar(20) NOT NULL DEFAULT '',
  `Course_ID` varchar(10) NOT NULL DEFAULT '',
  `No_of_Hours` int(5) DEFAULT NULL,
  `Course_Year` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `handled_by`
--

INSERT INTO `handled_by` (`Teacher_ID`, `Course_ID`, `No_of_Hours`, `Course_Year`) VALUES
('ISE001', '12IS64', 3, 2016),
('ISE002', '12IS64', 3, 2016),
('ISE003', '12IS63', 8, 2016);

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `Login_Date` date DEFAULT NULL,
  `Login_Time` time DEFAULT NULL,
  `User_ID` varchar(20) DEFAULT NULL,
  `User_Type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`Login_Date`, `Login_Time`, `User_ID`, `User_Type`) VALUES
('2016-03-26', '10:41:15', 'ISE001', 'Faculty'),
('2016-03-26', '10:56:13', 'ISE001', 'Faculty'),
('2016-03-26', '11:08:53', 'ISE001', 'Faculty'),
('2016-03-26', '11:10:17', 'tester', 'Admin'),
('2016-03-26', '11:12:04', 'tester', 'Admin'),
('2016-03-26', '11:26:12', 'ISE001', 'Faculty'),
('2016-03-27', '12:04:04', 'ISE002', 'Faculty'),
('2016-03-28', '11:21:02', 'ISE001', 'Faculty'),
('2016-03-28', '11:32:29', 'ISE001', 'Faculty'),
('2016-03-29', '12:19:58', 'ISE001', 'Faculty'),
('2016-03-29', '12:22:34', 'ISE001', 'Faculty'),
('2016-03-29', '12:25:51', 'ISE001', 'Faculty'),
('2016-03-29', '12:45:27', 'ISE001', 'Faculty'),
('2016-03-29', '01:00:02', 'ISE001', 'Faculty'),
('2016-03-29', '01:21:09', 'ISE001', 'Faculty'),
('2016-03-29', '01:23:13', 'ISE001', 'Faculty'),
('2016-03-29', '01:23:13', 'ISE001', 'Faculty'),
('2016-04-03', '11:30:45', 'ISE001', 'Faculty'),
('2016-04-03', '12:54:42', 'ISE001', 'Faculty'),
('2016-04-03', '12:54:43', 'ISE001', 'Faculty'),
('2016-04-03', '03:40:22', 'ISE001', 'Faculty'),
('2016-04-03', '06:52:27', 'ISE001', 'Faculty'),
('2016-04-03', '06:55:02', 'ISE001', 'Faculty'),
('2016-04-03', '09:54:55', 'ISE001', 'Faculty'),
('2016-04-03', '10:00:24', 'ISE001', 'Faculty'),
('2016-04-03', '10:04:06', 'tester', 'Admin'),
('2016-04-03', '10:06:14', 'ISE001', 'Faculty'),
('2016-04-03', '10:25:29', 'ISE001', 'Faculty'),
('2016-04-03', '11:07:07', 'ISE001', 'Faculty'),
('2016-04-04', '12:33:53', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:27', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:37', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:37', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:38', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:38', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:38', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:39', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:39', 'ISE001', 'Faculty'),
('2016-04-04', '12:43:40', 'ISE001', 'Faculty'),
('2016-04-04', '11:05:58', 'ISE001', 'Faculty'),
('2016-04-04', '11:25:44', 'tester', 'Admin'),
('2016-04-04', '11:26:36', 'ISE001', 'Faculty'),
('2016-04-04', '04:02:56', 'tester', 'Admin'),
('2016-04-04', '04:47:12', 'ISE001', 'Faculty'),
('2016-04-04', '05:34:02', 'ISE001', 'Faculty'),
('2016-04-04', '07:42:34', 'ISE001', 'Faculty'),
('2016-04-04', '08:28:18', 'ISE001', 'Faculty'),
('2016-04-04', '09:00:24', 'ISE001', 'Faculty'),
('2016-04-04', '09:38:01', 'ISE001', 'Faculty'),
('2016-04-04', '10:03:28', 'ISE001', 'Faculty'),
('2016-04-04', '10:16:38', 'ISE001', 'Faculty'),
('2016-04-04', '10:51:31', 'ISE001', 'Faculty'),
('2016-04-04', '10:53:01', 'ISE001', 'Faculty'),
('2016-04-04', '10:56:27', 'ISE001', 'Faculty'),
('2016-04-05', '12:28:47', 'tester', 'Admin'),
('2016-04-05', '12:31:42', 'tester', 'Admin'),
('2016-04-05', '08:20:15', 'ISE001', 'Faculty'),
('2016-04-05', '08:46:53', 'tester', 'Admin'),
('2016-04-05', '01:17:13', 'ISE001', 'Faculty'),
('2016-04-05', '01:17:13', 'ISE001', 'Faculty'),
('2016-04-06', '07:21:07', 'tester', 'Admin'),
('2016-04-06', '08:31:38', 'tester', 'Admin'),
('2016-04-06', '08:51:13', 'tester', 'Admin'),
('2016-04-06', '09:02:31', 'ISE001', 'Faculty'),
('2016-04-06', '09:02:46', 'ISE001', 'Faculty'),
('2016-04-06', '09:04:59', 'ISE001', 'Faculty'),
('2016-04-07', '10:52:14', 'ISE001', 'Faculty'),
('2016-04-07', '11:47:04', 'ISE001', 'Faculty'),
('2016-04-08', '04:55:44', 'tester', 'Admin'),
('2016-04-08', '04:55:57', 'tester', 'Admin'),
('2016-04-08', '04:58:17', 'tester', 'Admin'),
('2016-04-08', '04:59:54', 'tester', 'Admin'),
('2016-04-08', '05:03:14', 'tester', 'Admin'),
('2016-04-08', '05:06:51', 'tester', 'Admin'),
('2016-04-08', '05:16:37', 'tester', 'Admin'),
('2016-04-08', '05:23:52', 'tester', 'Admin'),
('2016-04-08', '05:29:23', 'ISE001', 'Faculty'),
('2016-04-08', '06:02:18', 'ISE001', 'Faculty'),
('2016-04-08', '06:06:14', 'tester', 'Admin'),
('2016-04-08', '06:25:42', 'tester', 'Admin'),
('2016-04-08', '06:28:42', 'ISE001', 'Faculty'),
('2016-04-08', '06:30:20', 'tester', 'Admin'),
('2016-04-08', '06:43:42', 'ISE001', 'Faculty'),
('2016-04-14', '05:41:28', 'ISE001', 'Faculty'),
('2016-04-14', '07:24:39', 'ISE001', 'Faculty'),
('2016-04-14', '08:24:09', 'ISE001', 'Faculty'),
('2016-04-14', '09:27:54', 'ISE001', 'Faculty'),
('2016-04-14', '09:40:21', 'ISE001', 'Faculty'),
('2016-04-14', '09:48:12', 'ISE001', 'Faculty'),
('2016-04-14', '09:50:59', 'ISE001', 'Faculty'),
('2016-04-14', '09:52:43', 'ISE001', 'Faculty'),
('2016-04-14', '10:53:08', 'ISE001', 'Faculty'),
('2016-04-14', '11:26:19', 'tester', 'Admin'),
('2016-04-14', '11:45:49', 'tester', 'Admin'),
('2016-04-15', '12:00:57', 'tester', 'Admin'),
('2016-04-15', '12:20:11', 'tester', 'Admin'),
('2016-04-15', '12:21:08', 'ISE004', 'Faculty'),
('2016-04-15', '01:47:15', 'ISE004', 'Faculty'),
('2016-04-15', '01:49:24', 'ISE001', 'Faculty'),
('2016-04-15', '01:56:42', 'tester', 'Admin'),
('2016-04-15', '01:57:55', 'ISE001', 'Faculty'),
('2016-04-15', '02:27:23', 'ISE001', 'Faculty'),
('2016-04-17', '09:18:35', 'ISE001', 'Faculty'),
('2016-04-17', '09:42:03', 'tester', 'Admin'),
('2016-04-17', '01:13:43', 'tester', 'Admin'),
('2016-04-17', '01:59:51', 'tester', 'Admin'),
('2016-04-17', '02:20:39', 'tester', 'Admin'),
('2016-04-17', '03:50:25', 'tester', 'Admin'),
('2016-04-17', '03:59:03', 'tester', 'Admin'),
('2016-04-17', '04:35:08', 'tester', 'Admin'),
('2016-04-17', '05:32:04', 'tester', 'Admin'),
('2016-04-17', '09:28:18', 'ISE001', 'Faculty'),
('2016-04-17', '11:26:55', 'ISE001', 'Faculty'),
('2016-04-18', '10:25:09', 'tester', 'Admin'),
('2016-04-18', '10:37:27', 'tester', 'Admin'),
('2016-04-18', '10:44:44', 'ISE001', 'Faculty'),
('2016-04-18', '11:10:23', 'tester', 'Admin'),
('2016-04-18', '12:43:11', 'tester', 'Admin'),
('2016-04-18', '12:46:44', 'ISE001', 'Faculty'),
('2016-04-18', '12:49:37', 'ISE001', 'Faculty'),
('2016-04-28', '09:14:07', 'tester', 'Admin'),
('2016-04-28', '09:14:52', 'ISE004', 'Faculty'),
('2016-04-28', '09:15:14', 'ISE001', 'Faculty'),
('2016-04-28', '09:20:52', 'tester', 'Admin'),
('2016-04-28', '09:26:32', 'tester1', 'Admin'),
('2016-04-28', '09:27:39', 'tester1', 'Admin'),
('2016-04-28', '09:29:36', 'tester1', 'Admin'),
('2016-04-28', '09:30:26', 'tester1', 'Admin'),
('2016-04-28', '09:31:53', 'ISE001', 'Faculty'),
('2016-04-28', '09:32:33', 'ISE001', 'Faculty'),
('2016-04-28', '09:52:45', 'ISE001', 'Faculty'),
('2016-04-28', '09:54:00', 'ISE001', 'Faculty'),
('2016-04-28', '09:55:34', 'ISE001', 'Faculty'),
('2016-04-29', '09:36:13', 'tester1', 'Admin'),
('2016-04-29', '09:37:09', 'tester1', 'Admin'),
('2016-04-29', '09:37:40', 'ISE001', 'Faculty'),
('2016-04-29', '09:39:24', 'ISE001', 'Faculty'),
('2016-04-29', '09:41:00', 'ISE001', 'Faculty'),
('2016-04-30', '11:53:26', 'ISE001', 'Faculty'),
('2016-04-30', '12:05:59', 'ISE001', 'Faculty'),
('2016-04-30', '12:09:05', 'ISE001', 'Faculty'),
('2016-04-30', '12:32:20', 'ISE001', 'Faculty'),
('2016-04-30', '01:31:34', 'ISE001', 'Faculty'),
('2016-04-30', '01:32:31', 'ISE001', 'Faculty'),
('2016-04-30', '01:34:33', 'ISE001', 'Faculty'),
('2016-05-01', '10:09:06', 'ISE001', 'Faculty'),
('2016-05-01', '10:10:09', 'ISE001', 'Faculty'),
('2016-05-01', '10:25:07', 'ISE001', 'Faculty'),
('2016-05-01', '11:41:51', 'ISE003', 'Faculty');

-- --------------------------------------------------------

--
-- Table structure for table `prev_qp`
--

CREATE TABLE `prev_qp` (
  `QP_ID` varchar(20) NOT NULL DEFAULT '',
  `Eval_ID` varchar(20) NOT NULL DEFAULT '',
  `Course_ID` varchar(10) NOT NULL DEFAULT '',
  `Content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prev_qp`
--

INSERT INTO `prev_qp` (`QP_ID`, `Eval_ID`, `Course_ID`, `Content`) VALUES
('57032b8ab4304', '56f635b74e31d', '12IS64', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>The __________ model was developed to meet the need of manipulating complex data types.</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>Differentiate between weak and normal entity</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Write one difference between file storage and database storage.</td><td>1</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define an entity.</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example of ternary relation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example of converting a M:N cardinality relation to Schema</td><td>2</td><td>3</td><td>2</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Illustrate natural join with an example</td><td>2</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Describe candidate key ?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Give an example that illustrates referential integrity constrai</td><td>2</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Give 1 difference between natural join and equi join</td><td>2</td><td>1</td><td>2</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Give the advantages of database design</td ><td>8</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What are the disadvantages of database systems?</td ><td>2</td><td>3</td><td>3</td></tr><tr><td style=''width:1000px''>Write a note on different database interfaces.</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give different attributes in a database</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain the three normal forms with examples</td ><td>6</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Why do practical database designs typically aim for BCNF and not aim for higher normal forms?</td ><td>4</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define the following terms with respect to the tuple calculus: tuple variable, range relation, atom, formula, and expression.</td ><td>5</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Explain the UNION, INTERSECTION, and MINUS Operations with examples</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Explain ER-to-Relational Mapping Algorithm</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate natural join with an example</td ><td>2</td><td>3</td><td>1</td></tr>'),
('5707aec7130df', '56f635b74e31d', '12IS64', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>The __________ model was developed to meet the need of manipulating complex data types.</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>What is a relation</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What are the responsibilities of DBA?</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define database management system?</td><td>1</td><td>2</td><td>3</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Describe candidate key ?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Define domain</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>Write a query to get the student name of the student second highest gpa.</td><td>2</td><td>1</td><td>3</td></tr><tr><td style=''width:1000px''>Give 1 difference between select and project</td><td>1</td><td>3</td><td>3</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Illustrate the use of rename operation</td><td>1</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>Illustrate use of any two schema change statements</td><td>2</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Illustrate use of any one aggregate function with an example</td><td>2</td><td>1</td><td>4</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Write a note on different database interfaces.</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give different attributes in a database</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give the characteristics of database design</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate the relation between generalization and specialization with example</td ><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Explain ER-to-Relational Mapping Algorithm</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give 1 difference between natural join and equi join</td ><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>Explain with examples aggregate functions in SQL</td ><td>6</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is the impedance mismatch problem? Which of the three program- ming approaches minimizes this problem?</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is ODBC? How is it related to SQL/CLI?</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What are triggers, and what  are its three parts? What are the differences between row-level and statement-level triggers?</td ><td>5</td><td>1</td><td>1</td></tr>');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Teacher_ID` varchar(20) DEFAULT NULL,
  `Ques_ID` varchar(10) NOT NULL,
  `Marks` int(3) DEFAULT NULL,
  `CO` int(5) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `Remarks` varchar(200) DEFAULT NULL,
  `LOD` int(3) DEFAULT NULL,
  `Unit_No` varchar(5) DEFAULT NULL,
  `Course_Id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Teacher_ID`, `Ques_ID`, `Marks`, `CO`, `Description`, `Remarks`, `LOD`, `Unit_No`, `Course_Id`) VALUES
('ISE001', '570fa4d1e2', 1, 1, 'NwAUXi21E1frEdd5B6e0hnShEg==', 'DBMS', 1, '1', '12IS64'),
('ISE001', '570fbebfb2', 1, 1, '3QJwIr++D1cjhaOaJnKvrneGtqJ9', 'Knowledge on schema', 1, '1', '12IS64'),
('ISE001', '570fbebfbb', 1, 1, '/gJecb++D1dyl8la8jKyAZKk872PCCo=', 'Knowledge on database ', 1, '1', '12IS64'),
('ISE001', '570fbebfd3', 2, 2, 'YgOAUL++D1fHtV1Ox8awNvzioulChRgs7UdXzzF3ZJ5XjyjUfEKw0UdoiCWSuC8F2GVozyoXYRbOl/HMM9OmU3+u8rcOLKIz', 'Tests syntax knowledge', 2, '1', '12IS64'),
('ISE001', '570fbebfde', 8, 1, 'jwOEqr++D1fq9CHQCcXxdL14uZmkyuR3e3OMp+HiOAHv9t9zbFXBogzr3QumvtpJ01p2', 'Database design', 2, '1', '12IS64'),
('ISE001', '570fbec000', 8, 1, 'AACULcC+D1cqM/UEwXDW75lTepJiXzcfWjkKfnYbflisADMrMZ5QmEgndlIO1w==', 'Database design', 1, '1', '12IS64'),
('ISE001', '570fbec01d', 6, 1, 'ewBDJcC+D1cO2ViX9DYMsSuzLE0bUYCtYV3xsJQgPGaqlPEGo/+BRwhI+p06UJFzMxrLK/fbsW0NnqfiVMduzj+mmmiFxFpjaDOW1KA=', 'Need for DB approach', 1, '1', '12IS64'),
('ISE001', '570fbec028', 6, 1, 'pwBA+MC+D1dw+QddxeCTnKVI6YOFM20/GlAJvFW+N4+/6dkNKgUJUT752SJd5fE8hkqRn7T5AA==', 'Three schema architecture', 2, '1', '12IS64'),
('ISE001', '570fbec033', 4, 1, '1ABmh8C+D1f7f1Vv9xWoZkngBm1JxeoJim4Opsjd0FEkqo1h3dlLzsbhOX1fnx+IWfvux1mj9paI/qqxQNGTiV4suuRHd/UsNhsjipTucdeKFA8hZWeyXmBrCWyAK5Nx', 'Three schema architecture', 1, '1', '12IS64'),
('ISE001', '570fbec03e', 5, 1, 'AAHl88C+D1eKMEqugi4rjD7SmtjcyfYqhNOjivoAk4Ou5ECoEm08oimBs6+GT5tSptbOnC5E', 'Database interfaces', 1, '1', '12IS64'),
('ISE001', '570fbec049', 4, 1, 'LQHmasC+D1deLZYskbZ0lgTbvq/kbZfhW6J6QG7T0B8h2GXoWWv+hkmTNj9vfBPPCGebaA==', 'Database utilities', 3, '1', '12IS64'),
('ISE001', '570fbec054', 6, 1, 'WgFTm8C+D1fKfCg7KlwRCwlqny6RCcsqMlaob90+1FM/TZE0JwZG+jR1gZMsx3QAg6Za7WBUke4JlcxJJHknwl3V/vWCnc9TvZ/SqvSJuLOlzLpkNZvhU7bw', 'Architectures', 3, '1', '12IS64'),
('ISE001', '570fbec05f', 4, 1, 'hgGiE8C+D1eWpeSKAAiOVFX/HT3/88DVhK9kcWHaRbSEdh1xnZQVic6Zz1YRCynurkhnp7sJD5rC', 'Classification of DBMS', 2, '1', '12IS64'),
('ISE001', '570fbec06c', 8, 1, 'vgHlUMC+D1fh5zw2dAUOluz8rNfOCFW6E3dpSBONpyWMh7bMAsUzVv5B98BFpCBgNtgxk61qF8Ux8J70iWblxnUiNDH8gaM6', 'Phases of DB design', 3, '1', '12IS64'),
('ISE001', '570fbec077', 5, 1, '6gG6dMC+D1dNrFBwehtV6qy0fEVMYdQbJc2KDzPRUpeXOeEtY6L1js6IPEVjibY=', 'DB attributes', 2, '1', '12IS64'),
('ISE001', '570fbec082', 5, 2, 'FwKWzcC+D1cTugnZCAbwCZ+yU1qFqYFdkQHsCynpPKrCSLfAurwrxpRYEzxRtfrwGtpdIxr5s6Z/+IT6eTZqjByllmV2sYP+EPVzRF6KrxoVGRAj', 'Constraints - Binary DB types', 3, '1', '12IS64'),
('ISE001', '570fbec08d', 8, 1, 'QwLdt8C+D1dR2LRSEl6UuvsK3LMCkWITYQaRt7zkex0u0OKNslla71jXe+8gIjH1nq+v4zdj', 'DB Cinstraints', 1, '2', '12IS64'),
('ISE001', '570fbec098', 1, 1, 'cAJVQ8C+D1epGakWfXwtHQuhxQ==', 'DBMS ', 1, '1', '12IS64'),
('ISE001', '570fbec0a3', 8, 1, 'nQJkhcC+D1eslrKIjhDQq+Dpmgy7bClsqL9WwzD/iallbEEBC7w8Alz37Xx2HdOY3y8=', 'ER-to-Relational Model', 2, '2', '12IS64'),
('ISE001', '570fbec0ae', 8, 2, 'yQIpgcC+D1cfaWPm1SrK5l9Eazo9AT6GmbTNZeN5sL3STmlGdr2fjk6PsLhXtQ/+5YZGzhc1lgeyG4glrujiT9eRdrWOiw==', 'EER-to-Relational Model', 3, '2', '12IS64'),
('ISE001', '570fbec0b9', 6, 1, '9gIMucC+D1ckUkUBfKVRTqjnL91GRCywulXc5lD5mKb9DiCtMQwP/UwxWCXw', 'Characteristics of a relation', 3, '2', '12IS64'),
('ISE001', '570fbec0c3', 6, 1, 'IgNyfMC+D1dO3CLiEk7R6E7fEEex6rZDRJWX4c3kyEhAX3zZpMkyhTJ4HBxqbxss72sXSQ==', 'Normal Forms', 2, '2', '12IS64'),
('ISE001', '570fbec0ce', 6, 1, 'TwPkCMC+D1e3/mQLqwf2vB8Lu5UV8hjxjJEx8QS/u2tIA3VVCtwF+7S1cK3M8MfoqCSCIZRyd4sh8yJv8dVVBkjTSzhV4N9XZiSA4k6hi23F4TC1oEh5bAO1vSto3jrNz5anbyJC4d+pP2F3Y4i1o5U21zp1ECGD4w==', 'Anamolies', 1, '2', '12IS64'),
('ISE001', '570fbec0d9', 4, 1, 'fAOpxsC+D1e2JDKFHsAoY1ObKt3iFSiLvb39Yr1LEwC4c5Zgq7YV4b6gNqau+Za9aaBsVhcn6pYzP54=', 'Multi-valued dependencies', 1, '2', '12IS64'),
('ISE001', '570fbec0e1', 4, 1, 'nQP0CMC+D1dwQjmVy12O7EbOsIXmqw01IxilV8yjW7x9DWqdJMzZmTp28Hafw5avsIbWVmSoS8i86pbRfuLV1NAk7kcdbDOHB43oL+Rw9Te+y/ODYZiAOg==', 'Fifth normal form', 2, '2', '12IS64'),
('ISE001', '570fbec0e9', 4, 1, 'vgO2c8C+D1dXoDrNP1yVagUiKk3PLvHYBDrGqlWtFruIKIXVRWzjYImXJCvXutgER2rELG2nWh0wO+4dwSEYpJM+ypw2vnrFL5QL+aZnvEN9fWnpN1++yYs1I4MUWCj97m+3BvQ=', 'BCNF', 3, '2', '12IS64'),
('ISE001', '570fbec100', 5, 1, 'AwCT3cG+D1cJim1lqe0Q6a+eolL9youLHdI0oiamqkLyUhA+KWPNztv6RGhm3dKq7sTZfAT1BoATIzZlXTzJxvwdpVvW5zmaZD0T', 'Algebra', 1, '2', '12IS64'),
('ISE001', '570fbec108', 5, 1, 'JADeXsG+D1dsLFDKzrU/UUrz0SXZrogguLG4C663r6ntkbR/0OgdV1xmozkUKSzuu3LFk32bp5nuRqNq6VrrqByQSg783DEB+w59PgoL', 'Join Operations', 2, '2', '12IS64'),
('ISE001', '570fbec111', 5, 1, 'RgDhdcG+D1fou66e+NjuUMT7+Igxs9ZnTUTNHtyLuSlTzYzVujaESF2z/n4dujukECpd42cQ3vj/E9jIdpHpehicvPa/QpRmiTIP00uBgfR3sOC48ziIkT/S/mbGcZyiXCFjegKWpMk2oj5nMobc4ioYeTYUe/MBImvLwbhJm9DQfy9lng==', 'Definitions', 3, '2', '12IS64'),
('ISE001', '570fbec119', 5, 1, 'ZwBvU8G+D1dpPlVlwyRmv9sxYT7LfSC2Td61GZp2zJ0a8ilyIW2YFbH4hWYvVEyXpLD6o8KC579XESPMitqW0ALzMouS5GsUaATRim8o/nTXCF5pCF8m5I2SPabeq97FyU6lK77wH/IGTzZCh9qvlvsmmt0+Ht+ohAWCplY58loc5gALgCedOPJ8vzn1ROnESKKnbjrllwHvhb+yh5wnHmNTb0OCKrXJX2Ck1wra0ZsUYRZeyER7HjiZRnwaVZ6EqORrJAmj8NWNsSeotq78MAPA+ne6ckG9ljv4ZyjSwTq28qvZgp35V9aP1ZJOTM3M1+9eJzprjRPe5eVediKqekoxtxpkoOyJWHacfB+fwXXe47HnWgvEZN9mS0N8Rs6CzWTdXjOwmEdP6kwppTyx30qbfIPWBMgNNIk1JnpzZiHp6/MLjVrsVeKFJ4uFVQXOfYVTAUDGB1+DgzNlFKkOcYIrIkbuz9/4kwzVdUail5BWoSvPUa2CyZu1ugyUdcyI8Nq176hm/Lj6vFOktnZ7LFektEq4ndiFhzGK+Yx1D/oPcXhHSKsyIpX7FiFwlAON2BHx7ZYy1/umXVOTOouSVjdfD2BcrWkibRN5MMfbudWN6b03Xys6VPaQ7wdTgrjjfENfLxZN5bDAl/8JdFCzUZC3ZbjnPkN5xSvDi2Jr0j8BUcKXAqQ87Qd7+8Dt9VAvWj1YO3KgihsM8Ae7DkbPSQpB/0HapE2nvnj4jjo6mHVl7zqjvUZeVEOqfGAh6JEVE6fiass5L9dw7nuTMHf19M+wYWSM1UKURJ0SxgpHWY2/76peJqkUWiOUqoV6qV9fna1RwMqSWabpwovn7XOGq9m8lL2JFyYmqEiopKOTve/qVecitFYVM+BQKfJBs93p2zrTesnsgUV7flBPBIZ6lCM=', 'SQL', 2, '3', '12IS64'),
('ISE001', '570fbec126', 5, 1, 'nwB/4cG+D1c/fOBdt1TOIxrsEQkrP75tXta24++mHaA02c4m+ZIK3KT+obYi7alC1kY6q60mK9poQS+pOKTydiaQkhD3q94vUwaYc+pkEH9/PgpXLZNZ0ffo31iPSExWK+98pglsqh6nDtkuLOjYaJ2jPS4z9Dr0Se3rF8WlVLP5RUd22A6C95hKVQ+v5urLp10Cf3w+0AbLCHNxuodw7DNa4hRswLILlt8nEg1Fy+xUjlS4YqBHEHZw6hflJvRrR0VdQCOAxeJ0IK7/8cG4eq97e6qjsU3THBl7uEfbLu5wyPQKTKUsqnZCP3+hwU0/CV1nRlLRODGs5gvZQGY9aWcUGPtiKukKK4RqX7HPnw8HVx4rAzYzrpIycKn6EwRXa2+/sST2OmAesNECbFFIOrD1EQFy/Jx6LJluSj3KeZyPGPDXoapDSVVobQ/rDS83eEBHcaKqYdhKSAkjV0vioxXw68mnPmsv2/8YKauJfWQg1S9gUNB99i1OWC4Ri0oXOEqgkyLAytyAPKj1AZb2vWnxkYhqgZ73x99vZBzlWo0HJD9cduPaTI1UsxqrhRuXPtCoL1dG8Tn1HwdVVeG5uf42JmFVUB6yVhnEyl8IQRh0DVU3jFNx8GOdcIlMI82ZpL04Frkh8Ruo1EAj/J1agIBPNKhG91CuBdLujd6h1H1Gsn23XK/NTPqqiYPXZtW0tuDRw4IeWR8h+BRT8Gh6davLJmKIRz3Prh8S7Lyye/3aMk7sBw2KmTCRutQFYkRbJHfJvxN1WT0+snhZkEXzNI77nb2p+mwr5Ew/vk5Mpxn1JSWQze9cFD6VHvfDHVNez6Hzpyp5dRxI0T4WYPsGld3TIfD7dk+sWg9Sbpm0u+//HTn+lVApF/sIzR0SqUfOkECI5qi6o8+GJkCahbYZ5GWT2HNhLoGem7mpruYjMcdS4RFupyOxyvup0jXg1HicJtIBCJkVy51tcA8YcLp7mICnABzsR5mSvaFqP6koZZGfBU/tijeZxxLjFiF2mxUmb+ukBvuao4C0Uo7oEihbHF2Tmqndp9Otu4F94mwz3JeyDfZzDEzUIx22aec868mGHu+c+qEh+8u8TLxjgwtUXja9S53qHoDkFuwnzWk+jdbjpVsDaKOsj6joO0ahQ6xyG6bbC6+sdpfwc+Pknr2/15CDV1M8bHombMZoStByikospfE3aCtQ0QHs5vcgVjAySMkPUJTPjw2v7qsbzPxYoOKTagMKr1dRmaVgMSHXfm8tazV/vSQ0pnghaKlQ5oJ5yvC5i38C+LtzoOeEb27OKsdplkGgfyhtB9HYpr8/VN1NMG6mX9VYT7uoysqmnMou4vXrbES9V17q+vsE9Bqj1199+5dnemFHAQsJ86ETgFna+Kq6puRj0BV8y5TI0hzRG37a2w9Pqx8tMQo+MZsndfK6vBCB8fDLBcBbaPd1g1GpunOz0zCrmpMvjjuEUhT63PakMGkyzWqJ5ucRvCbd9LESpoFVEYrzchv7ZspX+82PFY0=', 'Query', 3, '3', '12IS64'),
('ISE001', '570fbec13a', 5, 1, '8AAma8G+D1dAgxa0wjISWUr181qIuD/4w30eviTPt0dMwUPviQCk+Dqgrl9BI/XQWSWz7261ZLeCWAhNfwtlRjMJy/TXgtwt/Nd/4uh+QGiRLbx2VcAOAoXJ1OwPW2dU+4e8NUhk15nRoWzkoEYnGpRUtysC3e+89pX2P9wqUEGyfg==', 'triggers', 1, '3', '12IS64'),
('ISE001', '570fbec142', 5, 2, 'EQHgdcG+D1eqk1kVQzaaVGAiZEjEhHY3bsRNEnwCji+VeOPdoc0Dt2RzfyM2IjtN80FN9HiZBIE=', 'Grouping', 1, '3', '12IS64'),
('ISE001', '570fbec14a', 6, 1, 'MwHdUsG+D1fY7JZnertuM2iByuOoCldzs65LCWZtu6IFFzd4mWYDEKN7j24Bhoq2xQilwQUx2Dv/XaMRVElU/dLksx8Ci7X66/YsLXtlemgeUETyWVnElO4qgeOqk+49/4x/rnj3sC5ITgUeyhiupXXmhVf71tsRuiBZc9EUKYtOGGqc6X0AWyezliSc/dy9W9GVxyOLpeZArENUQ5Z6FDHTphfIeucPdxeqkoz3VlmkXqTiDjl1dik3FXpwyBHIPP4o/6HhYMcLIfolZ3AzvFuJOswU5+yqtmRiK0CZveCs5zZ1aonVhoFu39Mh3fxX1cikNF+wti18Pgrah5f7dliGk6neFYAOg5CCm5Rsa+Lw8d5x20z3nj79FPdzbvBuaToPNWDxOMhKomSTe21E40C9mS4n1lblmHgjw7Jn3Lesw80A+CtoiPy9m5ToJcotmwqDGvszp1sClKhGN+xGofydj46i2rN0I+Cu1/Jp3v5yYEqjKnV5X8BiFqa9DwjphUzP9YNFee9uDusC29DB6PWaPiHiUc6HUFuzJxUern5706HgxXDNM4IA6/oEZJTe9VfS6f2PGK8S/w36xO4UmHlSmpeAfrnJppLGHHh1pyPSqDnBkRZwencXdRSrWQUuFI0tgnDa/rFNkORnUZNRNnYFE6hErMzCCuSE5OSRHeV0mt/xXHKQHQU4dtvjJUOSe46HbMrHxoiZolPcYvfELaYVPAXWCN2qUlm1Rjtt0tl+r6cBXFFSF7NznLJsxZvqeGzisziDhXC8N75Cgx6HRuI3snYCXw5Cn9OMuUf1whPD7HS5zs6iShk0ffAbrKdoUMEho/ejohVs92jhK55O+xL8bR0xVGp1TcZWO/xL5AlsQO7ycGcKP9CRBIyhoZQeGR3hqx2nSF9Rb05E9zw0kDHedogPCOz8a3RVVdTs6IDoMqUlVZr8hFhho7dquD0Kcd2lPBkXX/SQZl+dqcy1Y9N8QC89gd4s2zvWy84jH7VCrC2ZEPIOKVmObZYcpaktAZtC0bA79AgeZGtmFtB4TnvzLEGhHP1HFZSr4RHSSeTtRcdu6Y/W5M79FNSgyl55OB1nik5/SLoHYxYcGcisFRgQZWkmkrjNuA3YS3VAGSdQ+nZY2c95f3wPdFBc35YLkKYZV18HD+ewTh7QUQQMjbqxmR5Ul6qMx4963YzBQXlN4MIwKbpFxElgNh5NTcPkLC3fqDb/BZqJs/Voty0FfZ14FRFaFjapW/E7pSzFaTH+R4UD1jBlDPmOUkwMr3NS22eGlXSBh6GijGAGaLasM4KeaLV1TJUl+ej/PYdjrf5dvfvYWPqUSrHkyS66WvvR2zYvf/FMuh461ok3w8qw7FYruBhyLhYflT+krhwfpFSZO7uX7ikTQJehR7hOd8K4lS7bvAY5MTwCgCdmP1n0kLMvlOV8fFZ4RvXgPwhr+pSWgdpvan6CM1l/g2gf9vE23CJj/UpXOLFzrM5VBQXsiZiM86l1zZ6UjLaW6OhzApMYl6pWO54PxhIAmDiDGhaWZLYDKqRkIQhLopbR4zmZxHPm2P5cpv9p2v6r7YWJGeNRAcvFknpf2h/Qy2OkO00/JLMKnwRUsCw/Jw/HTQ==', 'SQL Query', 3, '3', '12IS64'),
('ISE001', '570fbec158', 6, 1, 'awGnu8G+D1d2yE6lOJpjhouZXMM2FHzeiktJ4a/pU8Htsyt8HNhhoSt5f76PlCrleUW+nt5QXst/GG87WShmLqAVnvJYW9hJv/oxHAxch2LWkm6MC/yZWrWVqLk1t8ZWeFDLR2KdwfUM/5kQ9patSpk2bf//MyPufxxvbtLSO8HITXEK2sNEinepDsPobCYTjdnJnifdv2FScy+0hnRIfBvV5O26+JY7/Nfzeez8eP/12Ta7Q4uXVZKXuJSpgnoiYh7kT/v4y+rNG43rxVRUyEK4MubID3yo58CxOijjA8N8F4fvdRa56Xn7jOmT40h1UjPkRpCoDAOhkBjvOGkTqQ2WRAD0ZIi2H9jXD4VBDCwQejEqB6ClHriCPXyKvk0m6SZtAFGK11tC7q9YK4Hr0vuy7DK1pukrzaXO0er9wMFn8uQioU8XJp5EYBN0qJGxDKgQk/bfRW3KoaUZ+JjqDze9CNQ2gVXMqKSn9Ot2ahg5i1c3bMeo9WZm3zwG39tQ9jWuWjuS2Ogex3QPOpQiV8JRT45HRXFM0acGASCmuRf6YocJ+7Y+C+8B/yvkE8ubjjpwmVLRak3JoswnYOm21gxX0pCeZ1ovL2d9hzkN7Mgdp0BKcaP+BlsRdIj+FSZkDu7PExTzbdu2WfcuPgDS5j4vaYA1cVTyec9bjwk/jRSIQel+5ACJPiCK6CFD7bIC7WDcGKXdhEXQQOaekLCIMvOn0MWJBFYFv/nmijckFjAADsAg9ybMf7W18si1DX91Qh1udV2H3gHc9OM/Mq1TrfpmUhHmu50YaFLADYtDBw17P8hHE6MQZPbHgnn5YZ+u92CTZSF4zg6iGqA0u7SLMoX8I4Dz5dlIXZ/+oLX05im3nfpjHD1aqG81FhJtFT6s3jTQdPYGCYbbIU9QtxCwnTL3XNsiQAwF9wSBPsdctIUbcwgbmv5Ds+mr6d+7FTwU7hgwuMZI8kzOLPMtTHnTADzzeytsHO0DvQSGTIcesYupf9h8+IBS3viFu+Ht/iQoIZaNJkfsMImlOad6P+/73cudIf67tBhAfnhEHsU6j35KJU5EaEdQDKOze9V9MKJg8ncDsoHOdKZki0DMU3SglgqwsARY9MeUdlbBVPHxkWbxHHbTmf+JfGIg4D8kaei9SVDCVN76d8L5ZZo/cWbjB7Yk8SRx+QOFILXjzOvaalLPidx7l9/H2RwL22mV0FyIX9VWs1t7aDIIR3cm2IlsL1i9blf6EFC1AXZCn1qM0ZFjhWguJZbuq2l3VwULH1PHPOq13Dbu5QfrhZ/cyOyW7SxWyQsG3DAEfIOSkOhum0ctJ1SjUwFgzouoZ4qxgMoXn/OcNJYBuEGaGbVDvUJUTolDmWQ3RfbqDCXBGmN/3dO01B13AkbdtW+AeLxDSEPvyOZYIu4hAZKiv3+SZG8e5qmOiBQhkSnIj5oPAIvVzQQphDmwMZMtzuN0EzAJbOViGDR6A1kEoqjfDOLKG5v1jj4QsuUvgcOhXJaEgLro9zEmMDVvrg==', 'Query', 2, '3', '12IS64'),
('ISE001', '570fbec166', 6, 1, 'ogFkIMG+D1cu7zjZhGr6XysBdoUpqOptDibVu6QoNbV1L7wx4YiIjf2pw+SYP/D0WyRzM3cnmxM=', 'Aggregate Functions', 1, '3', '12IS64'),
('ISE001', '570fbec16e', 6, 1, 'xAFxgMG+D1di4WQ/XgKGADQPSAmFCxQZfS4NIjf5LC4BdKT8qg5mw32fE3Cv4Kl//iWFAJ6CUr/nDAjoqUppGMURhs9+waCT', 'Set Operations', 1, '3', '12IS64'),
('ISE001', '570fbec176', 5, 1, '5QHq4MG+D1dXu9wRNnZu3J2f5vrrORphFJY7eOHY6jmSqA8LjMzdF8pjSxYFKrdY7yolBEQ5tDee6y+A3gbfxwjNwiVj+AamDRvIFbt0qixhoFvXQUEG+UYdZ1kUTQF452V21xA20uEfywXhmmt/IZWhMw==', 'Impedance Mismatch', 1, '3', '12IS64'),
('ISE001', '570fbec17e', 5, 1, 'BwKlGMG+D1eJwqH7OTTuNClpvMdkmbsKAVCnpDZv1LD6A8WJB+Jpuepb/Fz475e8TG8P', 'ODBC/CLI/SQL', 1, '3', '12IS64'),
('ISE001', '570fbec186', 4, 1, 'KALXB8G+D1czRqWJPSWDYrTj1Q5mGFEMnwh9ZXEsxqmi0bEYKSgpJC1CBZk52YiFN43rXDjHiDeR', 'ACID properties', 1, '4', '12IS64'),
('ISE001', '570fbec18e', 8, 1, 'SgLQ1MG+D1d2n/WmrRf9WBEa7psiKDK4TU4VGTCs2WqiyaJosulhjTZmb4eJEbihCphU73xDlEbFof+ZJCXnCg==', 'WR,RW,WW', 1, '4', '12IS64'),
('ISE001', '570fbec197', 8, 1, 'awKLg8G+D1c/K0D2IMb+7chKEAs1W6xdv4P4W/bF5m1dv95ZvNWbT2jS/jAbJyPQRTHdLIAGJC9V0eMdKLZDXgGBVvYOeA==', '2PL', 2, '4', '12IS64'),
('ISE001', '570fbec19f', 8, 1, 'jQIqo8G+D1dDuv7Zz5LSuivIxI6vjzFkHOxIp4mrMsUj4XFhTtapn5s3uigy', 'ARIES', 3, '4', '12IS64'),
('ISE001', '570fbec1a7', 6, 3, 'rgJy6MG+D1fnWsD65+lwa8auQ/CkRS+0cnY9XIr+5FKLGm/6ygAKccs3NSWINHxdY7Y4QynT5ShaRn5aP6YoELDs1YOlXFPcQbwmLSQWRdLHj6QT/KBPj+acfqmG', 'Performance - Locks', 3, '4', '12IS64'),
('ISE001', '570fbec1af', 6, 1, 'zwJx1MG+D1eXA1pX2jkuO16Nzh4W9vpyGph/QfjXe5BuRfEb+zdgDucFQOMYr+oIbBC/H+O+qZw67CJPmVAXUni21dLg2jdH1pWVGNXsHv0R7SmpBA+U', 'Tables in ARIES', 2, '4', '12IS64'),
('ISE001', '570fbec1b7', 4, 1, '8QLlF8G+D1cidI0d7YBq9Bh0l2VL234JuNZJwhSofWnp/80xfkIfjxuTtrjOCodqRfQ8Zlhr7Sgb3yslTMfVpYLbdWT16NAqsfyr3NkVYQnChcy4rsz35AE/KfMwuJHggu3PS90JZpB9uNQRoQ==', 'Recovery and Transaction managers', 2, '4', '12IS64'),
('ISE001', '570fbec1c5', 6, 3, 'KQMItsG+D1fih9TW0RmXSdkFk9IN0XMe2AaI/oTIaxR4JPxnGbwrAVPDyl2Q43TIfstyop2KXHBOOidY67TRej+mmjx571WV3yrJvO2PvR3UctfCYBKMrTpQtehgvDtMWCqEVc4M8ZG9u5042bn3y+Hb5PaDiV542nu2irrMhjU/zbv8xslKH1Ab1SFRYltz/IRet1alrkY0', 'Phantom Problem', 1, '4', '12IS64'),
('ISE001', '570fbec1d0', 8, 1, 'VQNOjMG+D1dAw1b8GFillrAJWZHjztlOLeQGEdHkNktrgqamm6HdYAnEZBMr4Baf3ToqMKRoW6H/eKlXStbY0wiuHc5nuDM=', 'Log', 2, '4', '12IS64'),
('ISE001', '570fbec1db', 8, 2, 'ggM7W8G+D1dgUFk9ZyWR0U6sQa/0Kyu/o/yCQG0i9pwfYBDPv7QlbA2XdR3akxQOoX0u7kUWn5LKDkAsuTD03wOaGnO9xrlnZhXkHrOqLLd2ZUxtvAHEJQivr+puPMQfJnGi', 'Security Measures', 1, '5', '12IS64'),
('ISE001', '570fbec1e6', 8, 1, 'rwNtO8G+D1cOn4pcJiueU50u4AQPaXuVXw7hOntK1u2dJIsaB/WTI2aDMa5PbF9VADaBqHnEXlv4mqs=', 'Privacy in DB', 1, '5', '12IS64'),
('ISE001', '570fbec1f0', 6, 1, '2wN4DcG+D1cCHUpYe1Xl/C54YF8/PfWky0MquSxsi7axG2g4ZpP6iok9HigR2saq7EuaBpjND4gQHCAo3EK8Wh4TeeYs7M7aSuaEG0cf4DWB5g==', 'Challenges', 1, '5', '12IS64'),
('ISE001', '570fbec207', 6, 1, 'HwBHFMK+D1do556bmCL/V8t7I0wdjZWUpmjaaK8kMxfK+kKz9hgJxJBD6EQ/UhNZ7Cr+S4FG7CL6uB6bOQnBJu85FzXpY1K0DIAgDw==', 'SQL Injection', 1, '5', '12IS64'),
('ISE001', '570fbec212', 10, 1, 'TQDft8K+D1ea2TotaRO8soVSFjNmjLSwVcYjsuHPOlT02Z/512b4Cp9CCy4G8py50IsjvmO58bLXuH0+CHFjHiij8okMU7m4', 'Encryption', 1, '5', '12IS64'),
('ISE001', '570fbec21d', 10, 1, 'eQBcFsK+D1dIgXetdTuc4WnmBjYHi9KYKXXU/ZtDRz/Gqvdt89s6s1VUf+yjeeuq', 'Temporal Databases', 2, '5', '12IS64'),
('ISE001', '570fbec228', 10, 4, 'pgDw2sK+D1cQErJZO4rHc0++Pjj9AVdU7ohNMioBr9OHdj3PrU0YZKgbzfcoRfY=', 'Spatial database', 1, '5', '12IS64'),
('ISE001', '570fbec233', 6, 1, '0gDUwMK+D1cJQBu6iTpdJfw5B3vggArDr9dMXaMVanQvwa9GQ8+MVaOtGz+z3s5T', 'Spatial database', 2, '5', '12IS64'),
('ISE001', '570fbec23e', 10, 3, '/gATisK+D1fUO54deL0VeTTwWc7BrAwjLEcerwkgSz9/ZG7l7Rqx6QrQkvwoc1KVbqM=', 'Multimedia Databases', 3, '5', '12IS64'),
('ISE001', '570fbec248', 6, 4, 'KwGEuMK+D1dmk4hKmRZJa7vXRctoIDQJXpmf1miSr1cotCWIXm808RR5auL8NGLHOT1RhjBJXruJcxtIqOO+Tcp3PK1c', 'Multimedia Databases', 2, '5', '12IS64'),
('ISE001', '570fbec253', 1, 1, 'WAGyH8K+D1d9nt/AlnRuyt+2Csk5sLW9Osk=', 'Relation Knowledge', 1, '1', '12IS64'),
('ISE001', '570fbec261', 1, 1, 'jwH0/8K+D1dZk7L9972bMS8a7NOmlSm8fQ==', 'tests fundamental concepts knowledge', 1, '1', '12IS64'),
('ISE001', '570fbec26c', 1, 1, 'vAH0C8K+D1dZoYDQrGHuQQBcZBkbmYwwbdFxKtDAcWlfh301/rBz8RdqC4hqoYw8V8h7it9ILuxcKfYZzWy97BSyw3f/F4k=', 'Checks whether student can distinguish the feature', 3, '1', '12IS64'),
('ISE001', '570fbec277', 2, 1, '6AExAcK+D1fCmAo91vImMa/xgBFDHEBM/wej1aJgXylUfBkuHqNqR3yASww7AztcmsTvsQ==', 'Entities', 1, '1', '12IS64'),
('ISE001', '570fbec282', 1, 1, 'FQIba8K+D1dDf+NGc2m1zjou0B1nJ8621L5xbq/3O1axOAzuZjTKKMWSkQ==', 'Ternary relation', 2, '1', '12IS64'),
('ISE001', '570fbec28d', 2, 2, 'QgLUgcK+D1e6fJYj11fxw1Bg9UinkgxE0kdlPUVULmE8vENBUtclpsdu2Jr99pPaoD9ZZMggD1vTC18lC3722y4DOIq4IW0CpYyyGNVt', 'Database approach advantages', 1, '1', '12IS64'),
('ISE001', '570fbec297', 2, 2, 'bgIOVMK+D1cnSivPkjEnF+PKSIzKeEcsMTFKInmpQctJOPi30LgC7ePERNgFfGZ8pJV9', 'Classificcations', 2, '1', '12IS64'),
('ISE001', '570fbec2a2', 2, 2, 'mgLCJsK+D1dqtfYPV5zKNCW85RAd4IjfWYBSg/QlPKyWnQUrWYYSCAy6Ay+UWLilevi1wh2e64qIZ2ZuXgk+bawDRzVY5hbOHhU=', 'Cardinality', 3, '1', '12IS64'),
('ISE001', '570fbec2ad', 2, 1, 'xwI5osK+D1epsscN8VhgiJDe2nR1A3F21bv/el5FQKO+fP2CRLOELXkze945ElSNQAl3UJ3JWd25MxKrJYelqa7zNMCmLDNIAiMq2zCT00qLjbf5Qno=', 'Generalization', 1, '1', '12IS64'),
('ISE001', '570fbec2bb', 1, 1, '/gJ/1MK+D1c/goZJp3KpqVcXdFxSA5gRfmFylZU+p+dwJgyfxg4slx2Cb3UC7+qkfw==', '', 1, '2', '12IS64'),
('ISE001', '570fbec2c6', 2, 1, 'LAOsB8K+D1dem4MeEuqO5s9zYWbkGSg7+RhMUDx+ohf+sCs803HaXPcuthnquWO2RfD+Jsrzhu4CqtKA9pNVAlf07gpFsKLGfJWsne0i5gx2K7Fko390ORVm8g8Qp7YI7iy4J5S/ntE9MiA/Eg4=', '', 2, '2', '12IS64'),
('ISE001', '570fbec2d0', 1, 3, 'WAPeusK+D1emygmwSock8NB2cOTN8CyY1VhVpYYP0p+5Mj4qRV9bW2b+K+DDEVys19gzbg==', '', 3, '2', '12IS64'),
('ISE001', '570fbec2d9', 2, 4, 'eQNX3MK+D1cG3D0ZA/k6s1+bZdUqy2u03RF5sSAax9hoAibUx88J7B1lY3HF60tP2hRfi2eO+eyjlzvWw+Yq8EYihQok0OA=', '', 2, '2', '12IS64'),
('ISE001', '570fbec2e1', 2, 1, 'mwN93MK+D1fr2ULUbfzifATbAVwl97AucL7Z68zye3OttLE32lxi+I8i+gdMMZU=', '', 3, '2', '12IS64'),
('ISE001', '570fbec2e9', 2, 2, 'vANqPsK+D1eRoWRBYstIVO7Kx7rbX6GBovksJsVjVfJVYl8u6WX13dGXe/p72wtDSUiiWC/8S0gXkYJX', '', 1, '2', '12IS64'),
('ISE001', '570fbec2f1', 1, 3, '3gOCf8K+D1fSZ6l4XN+bz2T2JGLz', '', 2, '2', '12IS64'),
('ISE001', '570fbec305', 2, 5, 'FwDvxMO+D1ct2IyMhe7vkKh21xScZH9UwC4gM7j2w0Qa6FCLRvr9huAeMLYYt+qSHq6Mxg==', '', 3, '3', '12IS64'),
('ISE001', '570fbec30d', 1, 2, 'OQDbEsO+D1dadGNFcprN/fIeyLGDkB5vnju8+Uo3oxo8lr0H1J+NUlPEyK8eLZanxH5NSg==', '', 3, '3', '12IS64'),
('ISE001', '570fbec315', 1, 3, 'WgBnl8O+D1fFqNN+4bCgaEneuR38XaWr2eOam02kwmEvvgOjX+mFnHub', '', 2, '3', '12IS64'),
('ISE001', '570fbec31e', 2, 4, 'fAD4esO+D1c9JyDMEBF55SmsJaeHOkRv6Xj5pUTrO10XaBoWhVob7wUpaMY=', '', 1, '3', '12IS64'),
('ISE001', '570fbec326', 2, 1, 'nQAqn8O+D1cOQ3sLRtUfxlxbul0zZfqp74Lc1jqRHE2RTYwCQ0DRH7W0vw==', '', 1, '3', '12IS64'),
('ISE001', '570fbec32e', 2, 2, 'vwCi8sO+D1elmBJWS04Kc1c1U1khQzR9OfQIrJxTKA8gyBGIRC0mTO1Mb1cz4pD43P2ZRdT9fpCxQIpr2xk6CoxMmtIXL9ucOY4EedSpVgYDyw==', '', 1, '3', '12IS64'),
('ISE001', '570fbec336', 2, 4, '4ABltsO+D1eAK/SiRtnqkumRIx4Mw3vsEm0ehkIDWqHib4sYVgPQIFt0gpxbVAL51xYCfIkLZpDi/e951s/SFzEf2eY=', '', 1, '3', '12IS64'),
('ISE001', '570fbec341', 1, 2, 'DAGirMO+D1dyooyu0AgR+W0DlR0trL+q', '', 2, '4', '12IS64'),
('ISE001', '570fbec349', 1, 1, 'LgHqBsO+D1edL2SldmmciDCe1pnONMvgzh+WodJrGZM=', '', 3, '4', '12IS64'),
('ISE001', '570fbec351', 1, 2, 'TwFFbsO+D1cvUl/gro39cP+brB/5A8JMQpVkIxFJ', '', 2, '4', '12IS64'),
('ISE001', '570fbec35a', 1, 3, 'cQH/wsO+D1fJNETCR7RM56rd6g==', '', 1, '4', '12IS64'),
('ISE001', '570fbec362', 2, 4, 'kgHa4cO+D1dIv4kS1WxRxXyOGaeZFlZg9e1VegaNVfeYYKPZhboa0h7eah/+aUfcV0f92wJOMxA=', '', 2, '4', '12IS64'),
('ISE001', '570fbec36d', 2, 1, 'wQEZL8O+D1f+UdxUo9hCkLfYQOtRzrs38vzDwgDOCuJyqM6RwmLWrmaFUFjYlu5s3w==', '', 3, '4', '12IS64'),
('ISE001', '570fbec375', 1, 1, '4gESTcO+D1cFQZ9jOl82ZkwgTDcJgfyh+ANgbRBzK/djftGi', '', 1, '4', '12IS64'),
('ISE001', '570fbec37d', 2, 1, 'BAJfmsO+D1ehOLKFVe6tHmuAWoTGsqlfEFyYt7FOSJCxjEebgGmqMR0NaYxUXwCOVxL/+sqCK72o5hL+rwJbvJIMBgw=', '', 2, '4', '12IS64'),
('ISE001', '570fbec386', 1, 1, 'JQLMTsO+D1fUrVR6v789fPROzYldDA==', '', 3, '5', '12IS64'),
('ISE001', '570fbec38e', 1, 1, 'RwIHTcO+D1eZrE1i7i41tjGFiIGaD0lX+/iFMc1sYZ25Yg==', '', 1, '5', '12IS64'),
('ISE001', '570fbec396', 1, 2, 'aAJUpsO+D1eHwumqqiFikDyyYcqDlKnYp+IfXtn9DtWQA9amUl4QiofxGvfuBeMTxFmdkvBtQAOragvAIma3XnTh', '', 2, '5', '12IS64'),
('ISE001', '570fbec39e', 2, 3, 'igL9T8O+D1fwxfyxOIcRSiGyYQyao3VJcIXPeFbnAREBbIWp8epGSVmSeVfGbh4lm/6r43DSO6ofLg4RZDWVKTptbGN3cU3WdKvVmA==', '', 3, '5', '12IS64'),
('ISE001', '570fbec3a6', 2, 2, 'rAIiuMO+D1c7k2YnEWJf+ZGoRgErqjAl8Ser5eEVC7MHiMaoAxrUHkRSg2si0LtbtEchxHnk', '', 1, '5', '12IS64'),
('ISE001', '570fbec3af', 2, 5, 'zQIoKMO+D1cowQ23krAhXjoxP3EQgF0yWb4LXP3Velqf36jd6Htgz0NagA==', '', 2, '5', '12IS64'),
('ISE001', '570fbec3b7', 2, 4, '7gIMpMO+D1c0l3qWO2z7j0FRsveHFYGehbR/B+AfnK9DfBnjFbuyx0BEz1fomRwQtVpOQZvYw8xWeqDKBmd17VRjB5uewkMcTA==', '', 3, '5', '12IS64'),
('ISE001', '570fbec3c4', 1, 2, 'JgPl3sO+D1cxUvwLlQJrkNVVBMJAJA3tDRK1JtMg27G6/Rzr2Js7tewMl7FVKFGXmNLwZqdi+05YdwbIacNfYy0=', '', 1, '5', '12IS64'),
('ISE001', '570fbec3cf', 1, 3, 'UgNiysO+D1ei7BVq8H9STF/7Y/zIK9HZeBFTx1tXAqpZyt06Z3w6tGeReJwJCZD8zhh7N2wC1NpuvMV7SwcBIv6BogiJ1pt/8okJKNYJLIl+Mt3q0maSsDSjvQGub8w=', '', 2, '1', '12IS64'),
('ISE001', '570fbec3da', 2, 2, 'fwOLeMO+D1fqDcwyEWrj2EWQZVCKtkP7xTxf/39llgJrOAgCirey', '', 3, '1', '12IS64'),
('ISE001', '570fbec3e8', 2, 2, 'twOS5sO+D1cQNK/xKslIaMUa3KJAzgpBdiy5QmHISPcUjUhSt2kMatWwLMIm3U7+E6d6qzEbNMq3SC1uBXc7Ejxg', '', 1, '1', '12IS64'),
('ISE001', '570fbec407', 1, 3, 'HQBBhcS+D1dxIRG8Q4njTyX/rr8aHfuTSVqaRmnNKk75oDTeDGVN05S9', '', 2, '1', '12IS64'),
('ISE001', '570fbec41c', 2, 1, 'dgDjVMS+D1eE55WrJSoC8yoeNxgrY3e/rRns5q8ShgTISuPGMrOhc3N+SD4YmJg4FSE=', '', 3, '1', '12IS64'),
('ISE001', '570fbec427', 2, 1, 'owAPw8S+D1e3HX2j6f/+eHl5rjYcbMhinSCsowvNESsqljYaIzL6UfE883Ay', '', 1, '1', '12IS64'),
('ISE001', '570fbec432', 1, 2, '0ACrw8S+D1fevJbYKdn0G1HsDVskeczyhA==', '', 2, '1', '12IS64'),
('ISE001', '570fbec43d', 2, 3, '/ABl1MS+D1fV2dl6sYBqvRN7FW7Kz2Vvsv8yLLKy0V4hGjTjezF9GuSPlZqAJrHU/Q3q7pzFlQ==', '', 3, '1', '12IS64'),
('ISE001', '570fbec448', 1, 4, 'KAH/h8S+D1cpretHiZ2FkKWPmdIe', '', 1, '2', '12IS64'),
('ISE001', '570fbec453', 1, 3, 'VQGH1sS+D1cNcE/fUhsPwk5vzqnGHMcaDx/WMGdPdpVUhUYirA==', '', 2, '2', '12IS64'),
('ISE001', '570fbec45e', 2, 2, 'gQHNa8S+D1f8YE1wH9QaIkxNZUIo6JaVUcjCMz6QQ1dMyU7aM5wv6C/M6FpSwXUWbg==', '', 3, '2', '12IS64'),
('ISE001', '570fbec468', 2, 3, 'rgH3AsS+D1ejCdL05SPbL0F/FPFCsCj1oV8XYWsGMomv1AcxvabwuUq7SEZuPXVAWUUFJ8/f8red6SZlMfQra+wg+/C1x+5tHYcrVWyluXQ=', '', 1, '2', '12IS64'),
('ISE001', '570fbec473', 1, 4, '3AGydcS+D1d2snd97VTJGpYt/XhY/WGhHJlBmXJ/PTE=', '', 2, '2', '12IS64'),
('ISE001', '570fbec47e', 2, 3, 'BwJvXsS+D1c0yQnhqYpOn161YXOI/o6FLQIHTupjFd+uwmGVFP7WrM6pZzPtkaEta/ou+QQA8Tn6UYbAXCtl3mtPQA==', '', 3, '2', '12IS64'),
('ISE001', '570fbec489', 2, 2, 'NAJducS+D1cpnGCTgHgoo16r4Haku+8slBxY88Wa9AMhVyAV3wLbI5ToBkd0alZW6jfDGewrERxuC1xVkW/qap3LJQJTWK0=', '', 1, '2', '12IS64'),
('ISE001', '570fbec494', 1, 1, 'YQJUIsS+D1eGQMHFFmZkAmD90gRnZo/jZv5YHa5dWk8t8p80L11L2vcr1LqS', '', 2, '2', '12IS64'),
('ISE001', '570fbec49f', 2, 2, 'jQJZZcS+D1fuQXahku6YvBwvmjg2ynLvR/xhZQg=', '', 3, '3', '12IS64'),
('ISE001', '570fbec4aa', 1, 3, 'ugKiJ8S+D1fqhVtZjG8bmNRolQJicPbu', '', 1, '3', '12IS64'),
('ISE001', '570fbec4b5', 1, 4, '5wJU5cS+D1d0P3A2HvYa269FAf1Lkw+sa1wCNw==', '', 2, '3', '12IS64'),
('ISE001', '570fbec4c0', 2, 4, 'EwM0R8S+D1esvgtHmXn718CRLHvPXYghyFkfCD27bgHTWBkB2MfmITc64g==', '', 3, '3', '12IS64'),
('ISE001', '570fbec4c8', 2, 3, 'NAO8VsS+D1cqHPmtPQ7xbQR4d4UH66AWWsNtBXMdjs+50ytm+kVxGapg', '', 1, '3', '12IS64'),
('ISE001', '570fbec4d0', 1, 2, 'VQNnMsS+D1diG23b7JHhJSyJpd6VHTSZXb6f+GOEc2zvJxb8eX8CL4lJ5dpWNg==', '', 2, '3', '12IS64'),
('ISE001', '570fbec4d8', 2, 2, 'dwOU4cS+D1dLhd9b6sZ3vUtvOQzniDcAHUUPbI2s7/puqUmzBF/FxWZFPc0gL35jEtZ67BPStr5M7g==', '', 3, '3', '12IS64'),
('ISE001', '570fbec4e0', 2, 1, 'mAOIpcS+D1eKFOAbM6ILClcpSQVZCKOqi5eMKIjsl8fBNztkiGovCaMgk5+28c7ktX8nmA==', '', 1, '3', '12IS64'),
('ISE001', '570fbec4e8', 1, 1, 'ugNvf8S+D1fN4432prExnVIsKYqgHSd++HObU0ZdbD9/f0l7TA==', '', 2, '4', '12IS64'),
('ISE001', '570fbec4f1', 1, 2, '2wPoh8S+D1c5hcR58t+LXhXia3zaHmDgd8TqI8H1rdwBJAM4GNMh1ZinMbw2Dg==', '', 3, '4', '12IS64'),
('ISE001', '570fbec505', 1, 2, 'FQCG9cW+D1cfzxWP//sQL5N6xuF5xeNgwRg+oG2Ghj9O8aNOqJrnGzgHpj4MkFpexjJGaDyKRr0=', '', 1, '4', '12IS64'),
('ISE001', '570fbec50f', 1, 4, 'QgCRN8W+D1fjxXzu8ZEIprkYR01RRGPjEg==', '', 2, '4', '12IS64'),
('ISE001', '570fbec518', 2, 5, 'YwARsMW+D1d93ZmTqzQgLZEquINbL28cqraReASDNMiJ0+CwKUrB3tDC7Ztk', '', 3, '4', '12IS64'),
('ISE001', '570fbec520', 2, 2, 'hACSmcW+D1dffStXeCr988O9k7yiuCtsxoDw/9KwOYbQrPgYXGDCjqk0czFvooIV', '', 1, '4', '12IS64'),
('ISE001', '570fbec528', 1, 1, 'pgB3FsW+D1dru2C7dhdJrSgZlVncsV5Y1jMybqTUfG37M028KAy36NU=', '', 2, '4', '12IS64'),
('ISE001', '570fbec530', 1, 2, 'xwBzesW+D1f+VEBtsxnSKa0THA21xkhvvto=', '', 3, '4', '12IS64'),
('ISE001', '570fbec538', 1, 5, '6QAeEsW+D1fl5bwyqAMNMZzuDHlffzU=', '', 1, '5', '12IS64'),
('ISE001', '570fbec540', 2, 3, 'CgEJ/cW+D1cMUlci4ID8fp2IAZexvbY3c4ci2gc7NeCRDh5iC2yTuEr3J4FiJQ0k9H86t0vv0RxMRcozGjzBdm1MAmUJ7k2mMEoluq+XaAt0z4CaLzRCxjRxh9dcTp9MUqLosL0F', '', 2, '5', '12IS64'),
('ISE001', '570fbec549', 2, 4, 'LAG1/8W+D1fy9iaKMuw3Bw63SV5b64osvn4c09ylqen2GqSM', '', 3, '5', '12IS64'),
('ISE001', '570fbec551', 1, 1, 'TQEBZ8W+D1eDjnne50w3XVWAcPfkJZ/PsYZz3aKKpO0i', '', 1, '5', '12IS64'),
('ISE001', '570fbec559', 2, 2, 'bwEYwMW+D1fus9BeLwYoXcUw1/hbgUwUhCLQw7SxWCdCFNunvvjrQUBLfLTG+Y/7OXd47Tu55QoJSYE=', '', 2, '5', '12IS64'),
('ISE001', '570fbec561', 2, 5, 'kAFgw8W+D1d/HRSTlAscSX7Yi3fls0RKWoktWKSAmQS/JB0VlhLiBu1sMTa0vjCs9LlBZHNeb8PGb6uWUESBQ1t2', '', 3, '5', '12IS64'),
('ISE001', '570fbec569', 2, 3, 'sQFnO8W+D1ey4/fw5gUcr11jY3lTIWmbYhAIdNO3HNZQkrCdYM03u8Mwp5QEv9W+V8o=', '', 1, '5', '12IS64'),
('ISE001', '570fbec571', 2, 4, '0wEXSMW+D1e5keV/dSiZSjHEWGtA1DJ92UF8mn9qzV7vWDSCnFFQOJWUD1NJAcLxUO+wDKdZ', '', 2, '5', '12IS64'),
('ISE001', '570fbec57a', 4, 1, '9AHomcW+D1caAywh8MHotJP6nDmHZUWHCVl2vcwPP67qSmzr60zBgen0ELGt/uFRTiGmva6OLFn/wBBewQ==', 'Privacy', 2, '5', '12IS64'),
('ISE001', '570fbec585', 10, 1, 'IQI0p8W+D1ds/Y2Ajvtqoh03WTUyFke2joBMufeOhOg21DJchxIkor3gSPi94mtVCjX83E0II6Sp5+27dux9IPIWOJUg16Fz9oootQ==', 'dbms', 1, '1', '12IS64'),
('ISE001', '570fbec58f', 10, 2, 'TgIPS8W+D1fdYO+X8rr5F+LJuG2SdUa7+8Fs228tFplpdyQNTVbF0wh6ZcuE+BB2pODs0YcQM+r7W1hzDj1I5IhBApzLGA0=', 'dbms', 3, '1', '12IS64'),
('ISE001', '570fbec598', 8, 3, 'bwKaD8W+D1ctAq5LdVQ7kGVKYhFlDMD3e3Fi9/OHqLlApMG4LImMOSPl9sKOtEHitnc4JNp9Z5Dp/4gK+qAX3g==', 'Scherna architecture', 2, '1', '12IS64'),
('ISE001', '570fbec5a0', 6, 2, 'kQKkBcW+D1dx9mJWAkef/9XQeE5sv9r+ywBXeN9adr/oEmPgNXaS1coRG5j9HzoJBx8ZJ258Gth2w0hQfqLfpohBGA==', 'Database', 2, '1', '12IS64'),
('ISE001', '570fbec5a8', 4, 1, 'tQJsBMW+D1dfI5wTapESlMTghnctqoKA3bcvC+/v6l9ymKDpVOPD2aCgChqffKXigzY6viP7sKr9+y6cef4I0xwuI9ED9ukc', 'Database', 1, '1', '12IS64'),
('ISE001', '570fbec5b3', 4, 2, '4QLvMcW+D1fWCAyIA/lHAk0NHeG4S4etNvGJkNW3tXWccRePQdeYXJQKbGqGNCmvWmNLhhnDKptQd9dKYAwNKU9abjqjY3XpI2ll6AAPypGwFKr8oj6v3dIgUxtJdEjyZkp5QDjLZSuqGSzN6UWrmH8eCcmp7zAs6hyox0yTlD0dQPBxzxyz/qgd9xgiQIqrTVb20SP/HrPdL2MIWyYgw+jjIQ==', 'Schema concepts', 3, '1', '12IS64'),
('ISE001', '570fbec5be', 4, 3, 'xANf5l2zE1d+its/8GToYbB1VoqpDMFXZozB8Tgh0zAdtOBfcOonuEuZPJZa4js=', 'Er model concepts', 3, '1', '12IS64'),
('ISE001', '570fbec5c9', 4, 5, 'rQN4aR/8D1f140poyz6CpwJvBbtQgd6ngysREFkTN06TGZRll02yx1cwSQNmxrK5jRm91KnOZSp508ex6Ci9m+LYekyfW/8=', 'Er model concepts', 3, '1', '12IS64'),
('ISE001', '570fbec5d4', 4, 4, 'CADv686yE1c/EKIgTH0CU8dEBFw/OtfkyNwKFvj5RLvg6scmtVCn3shafhQ95FqIQnnHtfBs452KAFoD', 'Er model concepts', 2, '1', '12IS64'),
('ISE001', '570fbec5df', 10, 4, 'kwMyssW+D1d2YxSUWimEbGiRHevNYHkHarojY2R9XzAFC8HIWiC4pRvW1WLbJdWJGWU1SeDhYfqsoNKkpakGE9VQ2VTud2ZicCRvzVrFhjPuDifx/RGthCP3JKQ=', 'Relational model', 3, '2', '12IS64'),
('ISE001', '570fbec5ea', 10, 3, 'wAPMgsW+D1d1BRbckfpC9Cif4BfirNJRiUfdxz/poedOOkMZeNVIgx9RMD+1HQOJav+oePnlSrz0IgM=', 'Normal forms', 3, '2', '12IS64'),
('ISE001', '570fbec600', 8, 2, 'BACrSca+D1dXFqC0IzcvEuHs99v5Z2mV7kQ80dKFUUFlFy9M1jrnfx1PNqyPEgw60BVRhQ==', 'Normal forms', 2, '2', '12IS64'),
('ISE001', '570fbec60b', 6, 1, 'MADGk8a+D1d8lxrWXHjUW+tggkaQ9YjF4dnPStKWt5gkP8thF6Z8JMUBy2mc8Ru7Xw==', 'Relational dn design', 1, '2', '12IS64'),
('ISE001', '570fbec619', 4, 1, 'aABUKMa+D1do4ZBU8qUOHfhki7UX0fYxO+dvjWrHmw5//NmzbYqDMXcBfunJJjKye1h+FSQ=', 'Relational dn design', 1, '2', '12IS64'),
('ISE001', '570fbec624', 4, 2, 'lQAayca+D1csZj3xilWs4ZHoHvmib52MBMDPoT5oCi8ReJlHVcgkFpL8PkEpniQ=', 'Relational dn design', 2, '2', '12IS64'),
('ISE001', '570fbec62f', 4, 3, 'wQCvG8a+D1dPpoG7PDuci6TnrsS58XZn0BdaQhAcod+VtZuN/FE8YhN5KHKR4wAVVWc=', 'Relational algebra', 3, '2', '12IS64'),
('ISE001', '570fbec63a', 4, 4, '7gDaHca+D1cjg0L7Pu1vUfcqrr9dbiQ54HJ4WN5thydTf92HuAKcj3q1cC6zkJdSfl/5KBN12ThOFIbPvi5qXqpp8VvTrMTox8JQ3Dda', 'Normal forms', 3, '2', '12IS64'),
('ISE001', '570fbec645', 4, 2, 'GwGsAMa+D1fyyU9iOlZJWyE0DdBfQriX3/+KBcvgbKLwaEq8LXzPzBCEey4f', 'Join operation', 2, '2', '12IS64'),
('ISE001', '570fbec64f', 10, 4, 'SAHAy8a+D1c6B3h+tdu1n4OtuxYMPQ6sV247r4vqYpoGJ7XzH1GMqxo0TJKy74gnXEpBU2UQm2KQ+9N+ABihIOc=', 'Sql', 3, '3', '12IS64'),
('ISE001', '570fbec65a', 10, 1, 'dAFtt8a+D1f/s/lo+0Z47lnY13h/aV5xmvnHmhx4EIbsE3iU/n9MMIhTFPu3zl9ItLddR9WBDhR5I4LzIyTscvoq', 'Sql', 1, '3', '12IS64'),
('ISE001', '570fbec665', 8, 1, 'oAEjF8a+D1fALqNhnFxWzZaSYrZ3BkNCD8bS+wj+hk2RcGxYAWD3+g5ZgyWsf06OCtGkwn+N6ENgMiUgFCNZ7GjAt7MEP24DzoyZQioc6A==', 'Basics of sql', 3, '3', '12IS64'),
('ISE001', '570fbec670', 8, 2, 'zQE0Rsa+D1efT1GVBlcuFd5rd4kwFU5qjQ3tfVpGhZnTRIeVz3meKZL35hxjgJESzJhctqP6oD+NNbdL2HjuiQ+vv/k3WNEPZSbWqEr8zuSwClOE0pf7F5zgcZFvrnUN4B6AJhgZwMB4eu27yTJQWTZrsS6jQtx7XCtEkHsLD3SBKzCxPcQUVzKD7rHqYR05m6fvxKVjKRGBbzb5xDUzViyBnsAR55A7/gV1zTvRyUbBC3ICYeiba651Ll08Bhz+T9k8BwizhWsIdD18ul327jzDZWA5QVhdfdrMcaQH5AjrkjPAsAKhC99XJmH0jzWZkFWHL5rPpEFB7nke5DptAuISH2KGaHWCCrpNqT2ApJThsloKCvuiqJ86TC/9vkohRDXAZUkNxDDAvLvwwXcpCzvXY6eS3C+glSaH4o6jKn80Ohgjsk6d1YZT+i4ezGg3x4N75U3wWHwSjU8DOIurjux7j+2OK1ta4gacwhs+odsUeXvWk+WhbsgAoKO1zydh8R4YpSRJ1K2stf56dcEXce49FfcF5pfzGAFtFu9qwf982Ja+W2fnOCAE/zCdMqDAU2Sa///LHH0X9kgxRKVKCicJtWa/ag3YNt8kQZFAzC3QPv7Ksg1XJgoaoUvLEuj7Sbg8d/+4IBvj/0dlFpsmsl5NDjF8aJPNZ08oBRoOSEnNRiD0JlSp/Yw=', 'Sql queries', 3, '3', '12IS64'),
('ISE001', '570fbec67e', 8, 3, 'BAKLyca+D1f4W9sLU8152kew370r0HBsN+zGMwcmVXTN+nJJY5GZmt0anAfY3l3oASvLb+6Yb5eurKc6SbTlp4wTNhhXoDX8oavHsCS2Bo4xbyA0mfDTvgUXQFDRMx0=', 'Sql', 3, '3', '12IS64'),
('ISE001', '570fbec688', 8, 2, 'MgIsFMa+D1d8smGheh3JJLXc9ifJngGwzRX429fAW2rFE56hAh4raRv5MzsD2YOjQMdFrDM4MBoHq/neSpBX23IXArZQ4Pe184xOEOfajEd5i1h1ACzsT3LFN31gaXle5bqBkU107wiyCJpBqD+Ewa/dh1WTWaWtRY+Fgtw+2/42yoVQ0MOJJUueHdZFvUow1hlIe8p9mmd07+Pbsz2JLpOtklARm8IYZv+OrhjevNl35PSNRFiuy/UT6d69u5s2oKXGh6Dx3F7QvPZs8uJ+KEzFBCpwY/stQa8DMbteszKqD4u5Gb0qzEx1l+COnDZyErWQMESi8uKOx+aVel4o5/TXbpbqqdVnkJ1zqntZXCfSmQXWnuG1kXxzisEiCxyoe2JfYfslKz0wVZa32BuxmMXbsZaCm3OZ4o2MjCvlyo5+RxiCCuzVHDj9x67qwy3OMqlcltdNrrcPZvw1lXgsrCXRTE0rfystOPs5K6bnAqq3jY+D9Mwogv8hf36MZFXhNBordMsjBQEf4PRT3lpw8VURTc4=', 'Sql', 3, '3', '12IS64'),
('ISE001', '570fbec699', 4, 3, 'dALpRca+D1fxZ1NqDL39MIxI3bOLwSTxxhvbFdg5ekS+hNuCyDkm6W24p4uo1GjZ', 'Sql programming', 2, '3', '12IS64'),
('ISE001', '570fbec6a4', 4, 2, 'oAKNMMa+D1c5nrVAcIV3GZymQtgyDQpqsiZEY1oTdt2dYBQH/zqgIiCKU6lWVrfpWnAVTrQQMCYr4g==', 'Sql programming', 2, '3', '12IS64'),
('ISE001', '570fbec6ae', 4, 1, 'zQJF1Ma+D1fhfsvq7aC59Vkp18riBWT8cYGAchL6BWqcRgY1iICrMoMBhRGK', 'Sql programming', 1, '3', '12IS64'),
('ISE001', '570fbec6b9', 4, 1, '+QJJCca+D1eS49eR1EhMn87y48po0mPXwtmyPw==', 'Sql programming', 1, '3', '12IS64'),
('ISE001', '570fbec6c4', 4, 1, 'JgP0a8a+D1f5bCW+69fZhhdtl6tPmaHvkSSuK8Q=', 'Sql programming', 1, '3', '12IS64'),
('ISE001', '570fbec6cc', 4, 2, 'SANcHMa+D1enzYgaB9fyiQsq2S/W/63slHwyYzkZOg==', 'Sql programming', 1, '3', '12IS64'),
('ISE001', '570fbec6d5', 4, 2, 'aQMyo8a+D1ee5mO/CorO1kvew/lGb5E84Yg8y6nj4ONGJW8=', 'Sql programming', 1, '3', '12IS64'),
('ISE001', '570fbec6dd', 4, 2, 'iwMoE8a+D1dTlamR4NmmEvfgE4Iam6CVesrHlA==', 'Sql programming', 1, '3', '12IS64'),
('ISE001', '570fbec6e5', 10, 2, 'rANsZ8a+D1euKMRUItomLMlsAvBhktFCwrsHFYechYoB7Pd2Yg==', 'Checkpoint', 2, '4', '12IS64'),
('ISE001', '570fbec6ed', 10, 3, 'zQPMssa+D1eW5BOukfJwOkM6Y3kDDN2HslOxx2vdY8wPf4BDaK2Fb4/YkAopEXV/364=', 'Deadlocks', 2, '4', '12IS64'),
('ISE001', '570fbec701', 6, 2, 'BwDMGMe+D1dyyaH6qNNo30/rUS1wo12Cf65orwd1KemDF5Zvp0A=', 'Crash recovery', 2, '4', '12IS64'),
('ISE001', '570fbec709', 4, 1, 'KQDYa8e+D1dPRfn6AaE6Jue3PZMw5r2kLhnzhUe9eo8ZOkKiGdCL', 'Crash recovery', 2, '4', '12IS64'),
('ISE001', '570fbec711', 4, 2, 'SgC75Me+D1ck8KoXTDqTGE8hQWiWPcWN4gjTH63TerkcwWa8KwM=', 'Crash recovery', 2, '4', '12IS64'),
('ISE001', '570fbec71c', 4, 3, 'dgDKg8e+D1cMRQJi6zKqU+4hNbawZYV1kiw4zbLoXe940sD0uuYimzVLYmeNB6dpW6xNv2pIr9f/JkGxjjB6', 'Conurrency control', 2, '4', '12IS64'),
('ISE001', '570fbec727', 4, 3, 'owDol8e+D1eWMVRguPo41R6t7nnzgnDYdOACfc7seu3DiGwl06/Ne4wid+kdX0g/', 'Conurrency control', 3, '4', '12IS64'),
('ISE001', '570fbec72f', 4, 3, 'xAD/+8e+D1fywJEs/JA76gHvUPWfG9M5GT/D9+Y58niSa+9Xk/06vA==', 'Conurrency control', 2, '4', '12IS64'),
('ISE001', '570fbec738', 4, 4, '5gD8Nce+D1cj8RCQB0jfO3qSOvcw6aarQO1ZBF4fBvjai5lJVBENvyc9jkABwg==', 'Conurrency control', 3, '4', '12IS64'),
('ISE001', '570fbec740', 4, 2, 'BwG0Gse+D1cqNEIIZCw+6OZhtg11WQi514CRttsJlPTNnSWc4NaXP4qsZc599PL2J3Q=', 'Crash recovery', 2, '4', '12IS64'),
('ISE001', '570fbec74b', 4, 2, 'NQGrRce+D1dXshTYc3r5rePLWYkjldBguLfHyhRLmJg9wOZDVJMlR8433QM7HMjcYw==', 'Crash recovery', 2, '4', '12IS64'),
('ISE001', '570fbec755', 8, 1, 'YAHDyce+D1frTlOFkTzH2hurfP/z3Tz24mXZ7c0cDGQ=', 'Database security', 1, '5', '12IS64'),
('ISE001', '570fbec75e', 8, 2, 'ggEJQ8e+D1eWQoBX1SJYIlo1QnmQrlJtE54Du+ljNauhcrLrME99JwsCPHEsoBM6Xqy257MViXBv', 'Enhanced database models', 2, '5', '12IS64'),
('ISE001', '570fbec766', 4, 1, 'owHFDse+D1ced6xvV8r444mC5rvK5r6cwnIycUSfdwJgQfVbCVdVZKudOwZ79ZBU', 'Database security', 2, '5', '12IS64'),
('ISE001', '570fbec76e', 4, 2, 'xAFy5ce+D1fAcK+iZ0GsKQjjnApvoDgm3WgX25YOLs/6M1gozoEGIxWsAE8PMVrdrLEmBg==', 'Database security', 2, '5', '12IS64'),
('ISE001', '570fbec776', 4, 3, '5gHkYMe+D1fTA6wbiFLF0HgWHiz7UwP/r2mb+bDrQZB04VcOS7Z0tTsfMnuFnbLJkCivEMY=', 'Database security', 2, '5', '12IS64'),
('ISE001', '570fbec77e', 4, 2, 'BwJyD8e+D1e8qaLKx99Ah2Dsbs0fzGePsiJAGEwG2fdBMBzIUqWQV0r82QiZ', 'Database security', 2, '5', '12IS64'),
('ISE001', '570fbec786', 4, 2, 'KQIzsce+D1cwwKkBmTZ9XGYCRTt+XMgTbjOMBdkIT2a1wwHOqyQNSMhrEZzSvrtXcQ==', 'Database security', 2, '5', '12IS64'),
('ISE001', '570fbec78f', 4, 2, 'SgJRGMe+D1ckhJEOUyJ3LPPx9AyX9zFFD7ki1IhFLlQPD4PSFWMaj9Al3S3KiidcWhYW82M=', 'Enhanced database models', 2, '5', '12IS64'),
('ISE001', '570fbec79a', 4, 1, 'dwKVJse+D1d6Mo9OvhvaCHwe3lJb+1srQ0AGyiPucop4Ql2mrbcL5EHzesDqocCHPdrk', 'Enhanced database models', 2, '5', '12IS64'),
('ISE001', '570fbec7a2', 4, 1, 'mQJn98e+D1dfosAiBasC5VEhHuGzDD0SqEJghFUL1ZZTS3MjRtyBxDXXlHkdheS8o8Y=', 'Enhanced database models', 2, '5', '12IS64'),
('ISE001', '572230774b', 4, 3, 'CACOstIwIldfD3kfEJS4CSt3mmt+dm1kqgNuG7FDhclS', 'MAC', 1, '5', '12IS64'),
('ISE001', '5722de3e82', 5, 3, 'dQP/sKzeIlelyf8eAzhSeSR2hkDQg/IGUjD1gsWaIA==', 'dbms', 2, '5', '12IS64'),
('ISE003', '5726789adf', 1, 2, 'FwGACpp4JldjRQG3IIoS3PZg4ectYjEZBlFNes9x', 'RSA', 1, '1', '12IS63');

-- --------------------------------------------------------

--
-- Table structure for table `question_paper`
--

CREATE TABLE `question_paper` (
  `S_ID` varchar(20) DEFAULT NULL,
  `QP_ID` varchar(20) NOT NULL,
  `Course_ID` varchar(10) DEFAULT NULL,
  `Eval_ID` varchar(20) DEFAULT NULL,
  `Content` longtext NOT NULL,
  `L1` int(10) NOT NULL,
  `L2` int(10) NOT NULL,
  `L3` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_paper`
--

INSERT INTO `question_paper` (`S_ID`, `QP_ID`, `Course_ID`, `Eval_ID`, `Content`, `L1`, `L2`, `L3`) VALUES
('ISE001', '57032b8ab4304', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>The __________ model was developed to meet the need of manipulating complex data types.</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>Differentiate between weak and normal entity</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Write one difference between file storage and database storage.</td><td>1</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define an entity.</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example of ternary relation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example of converting a M:N cardinality relation to Schema</td><td>2</td><td>3</td><td>2</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Illustrate natural join with an example</td><td>2</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Describe candidate key ?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Give an example that illustrates referential integrity constrai</td><td>2</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Give 1 difference between natural join and equi join</td><td>2</td><td>1</td><td>2</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Give the advantages of database design</td ><td>8</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What are the disadvantages of database systems?</td ><td>2</td><td>3</td><td>3</td></tr><tr><td style=''width:1000px''>Write a note on different database interfaces.</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give different attributes in a database</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain the three normal forms with examples</td ><td>6</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Why do practical database designs typically aim for BCNF and not aim for higher normal forms?</td ><td>4</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define the following terms with respect to the tuple calculus: tuple variable, range relation, atom, formula, and expression.</td ><td>5</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Explain the UNION, INTERSECTION, and MINUS Operations with examples</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Explain ER-to-Relational Mapping Algorithm</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate natural join with an example</td ><td>2</td><td>3</td><td>1</td></tr>', 6, 7, 7),
('ISE001', '5707a5a8e5d3e', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Give an example of converting a M:N cardinality relation to Schema</td><td>2</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Define an entity.</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example of ternary relation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Write one difference between file storage and database storage.</td><td>1</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define schema</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Expand DBMS</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is a relation</td><td>1</td><td>1</td><td>1</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Give an example of division operation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example that illustrates referential integrity constrai</td><td>2</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>What is the difference between composite and simple attributes?</td><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>Illustrate natural join with an example</td><td>2</td><td>3</td><td>1</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Explain with neat diagrams different architectures of database management systems.</td ><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>How is physical and logical data dependencies maintained in a three schema architecture.</td ><td>4</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give the characteristics of database design</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>What are the disadvantages of database systems?</td ><td>2</td><td>3</td><td>3</td></tr><tr><td style=''width:1000px''>What is join operation? What are its variations? Explain with examples</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain the UNION, INTERSECTION, and MINUS Operations with examples</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Explain characteristics of a relation</td ><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>What is multivalued dependency? When does it arise?</td ><td>4</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Explain Mapping EER Model Constructs to Relations with example</td ><td>8</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>What are the various types of attributes?</td ><td>2</td><td>3</td><td>2</td></tr>', 8, 5, 8),
('ISE001', '5707ab24dfa63', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>List a few security mechanisms </td><td>2</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Write one difference between file storage and database storage.</td><td>1</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define an entity.</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Differentiate between weak and normal entity</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>A DBMS is an interface between ______ and ______ requests.</td><td>2</td><td>1</td><td>2</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Which constraint is violated in a delete operation operation involving a key referenced as foreign key</td><td>2</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Duplicates are removed in which operation</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate natural join with an example</td><td>2</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example that illustrates referential integrity constrai</td><td>2</td><td>2</td><td>4</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Write a note on different database interfaces.</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give different attributes in a database</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain with neat diagrams different architectures of database management systems.</td ><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Give any four basis in which DBMSs are classified</td ><td>4</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Write a note on different database constraints</td ><td>8</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give 1 difference between natural join and equi join</td ><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>Explain characteristics of a relation</td ><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Define fourth normal form. When is it violated? When is it typically applicable?</td ><td>4</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain ER-to-Relational Mapping Algorithm</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Which constraint is violated in a delete operation operation involving a key referenced as foreign key</td ><td>2</td><td>2</td><td>1</td></tr>', 7, 7, 5),
('ISE001', '5707aec7130df', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>The __________ model was developed to meet the need of manipulating complex data types.</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>What is a relation</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What are the responsibilities of DBA?</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define database management system?</td><td>1</td><td>2</td><td>3</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Describe candidate key ?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Define domain</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>Write a query to get the student name of the student second highest gpa.</td><td>2</td><td>1</td><td>3</td></tr><tr><td style=''width:1000px''>Give 1 difference between select and project</td><td>1</td><td>3</td><td>3</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Illustrate the use of rename operation</td><td>1</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>Illustrate use of any two schema change statements</td><td>2</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Illustrate use of any one aggregate function with an example</td><td>2</td><td>1</td><td>4</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Write a note on different database interfaces.</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give different attributes in a database</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give the characteristics of database design</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate the relation between generalization and specialization with example</td ><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Explain ER-to-Relational Mapping Algorithm</td ><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give 1 difference between natural join and equi join</td ><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>Explain with examples aggregate functions in SQL</td ><td>6</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is the impedance mismatch problem? Which of the three program- ming approaches minimizes this problem?</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is ODBC? How is it related to SQL/CLI?</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What are triggers, and what  are its three parts? What are the differences between row-level and statement-level triggers?</td ><td>5</td><td>1</td><td>1</td></tr>', 11, 8, 2),
('ISE001', '5707af747062c', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr>', 11, 8, 2),
('ISE001', '570fc1b429ba4', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>What is DBMS</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define schema</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>List the different classifications of DBMS.</td><td>2</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>Give an example of ternary relation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Differentiate between weak and normal entity</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Expand DBMS</td><td>1</td><td>1</td><td>1</td></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Give an example of division operation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give 1 difference between natural join and equi join</td><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>What are the various types of attributes?</td><td>2</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Give an example that illustrates referential integrity constrai</td><td>2</td><td>2</td><td>4</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Explain the typical components module of a dbms, with a neat diagram</td ><td>10</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is database? Explain the implicite properties of database.</td ><td>10</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>What is join operation? What are its variations? Explain with examples</td ><td>5</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Define the following terms with respect to the tuple calculus: tuple variable, range relation, atom, formula, and expression.</td ><td>5</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Discuss insertion, deletion, and modification anomalies. Why are they con- sidered bad? Illustrate with examples.</td ><td>6</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define fourth normal form. When is it violated? When is it typically applicable?</td ><td>4</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain second and third normal forms with examples</td ><td>10</td><td>3</td><td>3</td></tr>', 7, 6, 4),
('ISE001', '570ffdcd51dba', '12IS64', '56f635b74e31d', '<center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : 6</strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part 1</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>A DBMS is an interface between ______ and ______ requests.</td><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>Differentiate between weak and normal entity</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>The __________ model was developed to meet the need of manipulating complex data types.</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>What are the responsibilities of DBA?</td><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define meta data?</td><td>1</td><td>2</td><td>2</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script><tr><td style=''width:1000px''>Give example of a DDL</td><td>2</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Write a SQL query to get the name of student with highest gpa in the class</td><td>2</td><td>1</td><td>2</td></tr><tr><td style=''width:1000px''>What is dynamic SQL?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Give an example of UPDATE statement</td><td>2</td><td>3</td><td>4</td></tr><script>console.log(''Here1'');</script><script>console.log(''Here1'');</script></table></center><br><center><strong>Part 2</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>What is database? Explain the implicite properties of database.</td ><td>10</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>Give the important phases in database design with a neat diagram</td ><td>8</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate the relation between generalization and specialization with example</td ><td>2</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Consider the following relational schema. An employee can work in more than one department; the pcLtime field of the Works relation shows the percentage of time that a given employee works in a given department. \nEmp(eid: integer, ename: string, age: integer, salary: real) \nWorks(eid: integer, did: integer, pet_time: integer)\nDept(did.Ã‚Â· integer, budget: real, managerid: integer) \n\nWrite the following queries in SQL: \n1. Print the names and ages of each employee who works in both the Hardware department and the Software department. \n2. For each department with more than 20 full-time-equivalent employees (i.e., where the part~time and full-time employees add up to at least that many full-time employees), print the did together with the number of employees that work in that department.                               3. Print the name of each employee whose salary exceeds the budget of all of the depart-\nments that he or she works in.\n4. Find the managerids of managers who manage only departments with budgets greater\nthan $1 million.\n5. Find the enames of managers who manage the departments with the largest budgets.</td ><td>5</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>What is ODBC? How is it related to SQL/CLI?</td ><td>5</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Write the sql query for the following database schema : works (pname, cname, salary) lives (pname, street, city) located in (cname, city) manager (pname, mgrname) i) find the names of all persons who live in the city &quot;bangalore&quot;. ii) retrieve the names of all person of &quot;infosys&quot; whose salary is between rs 50,000 and rs 90,000. iii) find the names of all persons who lives and work in same city.</td ><td>8</td><td>4</td><td>2</td></tr><tr><td style=''width:1000px''>Give an example of schema creation statement</td ><td>2</td><td>3</td><td>5</td></tr><tr><td style=''width:1000px''>Consider the following schema and writ the relational algebra expressions for the queries given below: suppliers (sid : integer. sname : string. address : string) parts (pid : integer, pname : string. color : string) catalog (sid : integer, pid : integer, cost : real) write queries for the following:i) find the names of suppliers who supply some red parts.\nIi) find the sids of suppliers who supply some red parts or at22l packer street.\nIii) find the sids of suppliers who supply some red part and some greenpa</td ><td>8</td><td>4</td><td>2</td></tr><tr><td style=''width:1000px''>List the different data types in SQL</td ><td>2</td><td>1</td><td>4</td></tr>', 7, 3, 6),
('ISE001', '57245a7eee574', '12IS64', '56f693570a954', '<head><meta http-equiv=''Content-type'' content=''text/html; charset=utf-8'' /></head><center><table border=''1'' style=''border-collapse: collapse;''><tr><td style=''width:1115px''><img src=''logo.JPG''></img><center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br></center></strong><center><strong>SEE Question Paper<br></center></strong></tr><tr><td style=''width:1115px''><strong>Course : 12IS64  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; DataBase Management System  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : </strong></td></tr><tr><td style=''width:1115px''><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 3   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> <tr><td style=''width:1115px''><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 20 + 80</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr></table><br><center><strong>Part-A</strong></center><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>What is a relation</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define Database</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Define schema</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Expand DBMS</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>What is meant by foreign key?</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>Describe candidate key ?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Duplicates are removed in which operation</td><td>1</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Give an example of division operation</td><td>1</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>List the different data types in SQL</td><td>2</td><td>1</td><td>4</td></tr><tr><td style=''width:1000px''>What is dynamic SQL?</td><td>1</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>What is a co-related nested query?</td><td>1</td><td>2</td><td>3</td></tr><tr><td style=''width:1000px''>Define Atomicity</td><td>1</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>Why is log useful?</td><td>1</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>List the possible transaction states.</td><td>2</td><td>3</td><td>5</td></tr><tr><td style=''width:1000px''>List applications of spatial database concepts</td><td>2</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>An active database allows users to make the __________,________and ______ changes to triggers </td><td>2</td><td>2</td><td>3</td></tr></table></center><br><center><strong>Part-B</strong></center><br><br><center><table border=''1'' style=''border-collapse: collapse;''><tr><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr><tr><td style=''width:1000px''>Explain with neat diagrams different architectures of database management systems.</td><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Give any four basis in which DBMSs are classified</td><td>4</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Give three instances of when to and when not to use database approach</td><td>6</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Write a brief note on three schema architecture</td><td>6</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Write a note on different database utilities</td><td>4</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Explain with sketch the different phases of database design</td><td>6</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>Discuss insertion, deletion, and modification anomalies. Why are they con- sidered bad? Illustrate with examples.</td><td>6</td><td>1</td><td>1</td></tr><tr><td style=''width:1000px''>Illustrate division operation with example</td><td>4</td><td>3</td><td>3</td></tr><tr><td style=''width:1000px''>Explain the three normal forms with examples</td><td>6</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Explain second and third normal forms with examples</td><td>10</td><td>3</td><td>3</td></tr><tr><td style=''width:1000px''>Explain characteristics of a relation</td><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Consider the following schema and writ the relational algebra expressions for the queries given below: suppliers (sid : integer. sname : string. address : string) parts (pid : integer, pname : string. color : string) catalog (sid : integer, pid : integer, cost : real) write queries for the following:i) find the names of suppliers who supply some red parts.\nIi) find the sids of suppliers who supply some red parts or at22l packer street.\nIii) find the sids of suppliers who supply some red part and some greenpa</td><td>8</td><td>3</td><td>2</td></tr><tr><td style=''width:1000px''>How is a view created and dropped? What problems are associated with updating of views?</td><td>8</td><td>3</td><td>3</td></tr><tr><td style=''width:1000px''>Write a note on various data definition statements in sql</td><td>10</td><td>3</td><td>4</td></tr><tr><td style=''width:1000px''>Consider the following schema:                                                          Suppliers( sid: integer, sname: string, address: string)                                 Parts(pid: integer, pname: string, color: string)                                                  Catalog( sid: integer, pid: integer, cost: real)                                              The Catalog relation lists the prices charged for parts by Suppliers.                          Write the following                                                                          1. Find the pnames of parts for which there is some supplier.                                  2. Find the snames of suppliers who supply every part.                                       3. Find the snames of suppliers who supply every red part.                                   4. Find the pnamcs of parts supplied by Acme Widget Suppliers and no one else.                5. Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over all the suppliers who supply that part).                                      6. For each part, find the sname of the supplier who charges the most for that part.</td><td>6</td><td>3</td><td>1</td></tr><tr><td style=''width:1000px''>Explain with example the Strict Two-Phase Locking (Strict 2PL)</td><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>How is the log used in transaction rollback and crash recovery?</td><td>8</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Write a note on media recovery</td><td>6</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>Write a note on recoverability</td><td>4</td><td>2</td><td>2</td></tr><tr><td style=''width:1000px''>What is the phantom problem? Can it occur in a database where the set of database objects is fixed and only the values of objects can be changed?</td><td>6</td><td>1</td><td>3</td></tr><tr><td style=''width:1000px''>Explain spatial data indexing and mining</td><td>6</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>Mention few measures to protect privacy in a database</td><td>4</td><td>2</td><td>1</td></tr><tr><td style=''width:1000px''>What are fact-defined predicates and rule-defined predicates?</td><td>6</td><td>2</td><td>4</td></tr><tr><td style=''width:1000px''>Explain a few spatial database concepts</td><td>10</td><td>1</td><td>4</td></tr><tr><td style=''width:1000px''>What preventive measures are possible against SQL injection attacks?</td><td>6</td><td>1</td><td>1</td></tr>', 11, 19, 11);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `FName` varchar(20) DEFAULT NULL,
  `MName` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `Teacher_ID` varchar(20) NOT NULL,
  `Designation` varchar(20) DEFAULT NULL,
  `Dep_ID` varchar(10) DEFAULT NULL,
  `HOD_ID` varchar(20) DEFAULT NULL,
  `Password` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`FName`, `MName`, `LName`, `Teacher_ID`, `Designation`, `Dep_ID`, `HOD_ID`, `Password`) VALUES
('Cauvery', 'N', 'K', 'ISE001', 'Dr', 'RVCEISE', 'ISE001', 'f5d1278e8109edd94e1e4197e04873b9'),
('Smitha', 'G', 'R', 'ISE002', 'Professor', 'RVCEISE', 'ISE001', 'f5d1278e8109edd94e1e4197e04873b9'),
('Geetha', NULL, 'V', 'ISE003', 'Professor', 'RVCEISE', 'ISE001', 'f5d1278e8109edd94e1e4197e04873b9'),
('Merin', 'M', 'Meleet', 'ISE004', 'Professor', 'RVCEISE', 'ISE001', 'f5d1278e8109edd94e1e4197e04873b9');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `Unit_Number` varchar(5) NOT NULL DEFAULT '',
  `Course_Id` varchar(10) NOT NULL DEFAULT '',
  `Description` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`Unit_Number`, `Course_Id`, `Description`) VALUES
('1', '12IS63', 'Computer Networks and Security'),
('1', '12IS64', 'Introduction to Database Systems- Databases and Database users: Introduction, An example, Characteristics of Database Approach, Actors on the scene, Workers behind the scene, Advantages of using the DBMS Approach, A brief history of Database applications, When not to use a DBMS. Database System—Concepts and Architecture: Data Models, Schemas and Instances, Three-schema Architecture and Data Independence,  Database Languages and Interfaces, The Database System Environment, Centralized and Client/Server Architectures for DBMSs, Classification of Database Management Systems.\r\n\r\nEntity-Relationship Model 	Using High-Level Conceptual Data Models for Database Design; An Example Database Application; Entity Types, Entity Sets, Attributes and Keys; Relationship types, Relationship Sets, Roles and Structural Constraints; Weak Entity Types; Refining the ER Design for the COMPANY Database; ER Diagrams, Naming Conventions and Design Issues, Enhanced Entity Relationship(EER) Modeling, An Example UNIVERSITY EER Schema and Formal Definitions for the EER Model. Subclasses, Superclasses, and Inheritance, Specialization and Generalization ,Constraints and Characteristics of Specialization and Generalization. Subclasses, Superclasses, and Inheritance, Specialization and Generalization, Constraints and Characteristics of Specialization and Generalization'),
('2', '12IS64', 'Relational Model and Relational Algebra 	Relational Model Concepts; Relational Model Constraints and Relational Database Schemas; Update Operations and Dealing with Constraint Violations;  Unary Relational Operations: SELECT and PROJECT; Relational Algebra Operations from Set Theory; Binary Relational Operations : JOIN and DIVISION ;Additional Relational Operations; Examples of Queries in Relational Algebra; Relational Database Design Using ER- to-Relational Mapping, Mapping EER Model Constructs to Relations	\r\nRelational Database Design 	Informal Design Guidelines for Relation Schemas; Functional Dependencies; Normal Forms Based on Primary Keys; General Definitions of Second and Third Normal Forms; Boyce-Codd Normal Form; Properties of Relational Decompositions; Algorithms for Relational Database Schema Design; Multivalued Dependencies and Fourth Normal Form; Join Dependencies and Fifth Normal Form, Inclusion Dependencies, Other Dependencies and Normal Forms.'),
('3', '12IS64', 'Sql-99: Schema Definition, Basic Constraints and Queries SQL Data Definition, Specifying Basic Constraints in SQL, Schema Change Statements in SQL; Basic Queries in SQL; More Complex SQL Queries; Insert, Delete and Update Statements in SQL; 	\r\nIntroduction to SQL programming Techniques- Data base programming: Issues and Techniques, Embedded SQL, Dynamic SQL and SQLJ, Database programming with function calls: SQL/CLI and JDBC, database stored procedures and SQL/PSM.	\r\n'),
('4', '12IS64', 'Overview of Transaction Management :  The ACID property, Transaction and schedules, Concurrent Execution of Transactions, Lock based Concurrency control, performance of locking, Transaction support in SQL, Introduction to crash recovery. \r\nConcurrency Control: 2PL, Serializability, recoverability, Introduction to Lock management , Lock conversions, Dealing with Deadlocks, Specialized Locking Techniques, Concurrency control without Locking. \r\nCrash Recovery :  Introduction to ARIES, the LOG, Other recovery related structures, The Write-Ahead Log protocol, checkpointing, Recovery from a system Crash, media recovery, other approaches and interaction with concurrency control. 	'),
('5', '12IS64', 'Database Security and Authorization : Introduction to Database Security Issues, Discretionary Access Control based on Granting and Revoking Privileges, Mandatory Access Control and Role-Based Access Control for Multilevel Security.\r\nEnhanced Data model for advanced applications : Active Database concepts and triggers, temporal database concepts, Spatial Database, Multimedia database.');

-- --------------------------------------------------------

--
-- Table structure for table `update_history`
--

CREATE TABLE `update_history` (
  `Teacher_ID` varchar(20) DEFAULT NULL,
  `Course_ID` varchar(10) DEFAULT NULL,
  `Question_id` varchar(10) DEFAULT NULL,
  `Time_of_update` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `update_history`
--

INSERT INTO `update_history` (`Teacher_ID`, `Course_ID`, `Question_id`, `Time_of_update`) VALUES
('ISE001', '12IS64', '56f4e47277', NULL),
('Teacher', '12IS64', '570fa4d1e2', '2016/04/17 21:39:17'),
('ISE001', '12IS64', '572230774b', '2016/04/28 21:18:34'),
('ISE001', '12IS64', '5722393b52', '2016/04/28 21:56:08'),
('ISE001', '12IS64', '5722de3e82', '2016/04/29 09:40:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`QP_ID`,`Ques_ID`),
  ADD KEY `Ques_ID` (`Ques_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Dept_ID` (`Dept_ID`);

--
-- Indexes for table `course_outcome`
--
ALTER TABLE `course_outcome`
  ADD PRIMARY KEY (`Course_ID`,`CO_No`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_ID`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`Eval_ID`);

--
-- Indexes for table `handled_by`
--
ALTER TABLE `handled_by`
  ADD PRIMARY KEY (`Teacher_ID`,`Course_ID`,`Course_Year`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `prev_qp`
--
ALTER TABLE `prev_qp`
  ADD PRIMARY KEY (`QP_ID`,`Eval_ID`,`Course_ID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Ques_ID`),
  ADD KEY `Teacher_ID` (`Teacher_ID`),
  ADD KEY `Unit_No` (`Unit_No`,`Course_Id`);

--
-- Indexes for table `question_paper`
--
ALTER TABLE `question_paper`
  ADD PRIMARY KEY (`QP_ID`),
  ADD KEY `S_ID` (`S_ID`),
  ADD KEY `Eval_ID` (`Eval_ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`Teacher_ID`),
  ADD KEY `HOD_ID` (`HOD_ID`),
  ADD KEY `Dep_ID` (`Dep_ID`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`Unit_Number`,`Course_Id`),
  ADD KEY `Course_Id` (`Course_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD CONSTRAINT `Belongs_To_ibfk_1` FOREIGN KEY (`QP_ID`) REFERENCES `question_paper` (`QP_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Belongs_To_ibfk_2` FOREIGN KEY (`Ques_ID`) REFERENCES `questions` (`Ques_ID`) ON DELETE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`) ON DELETE SET NULL;

--
-- Constraints for table `course_outcome`
--
ALTER TABLE `course_outcome`
  ADD CONSTRAINT `Course_Outcome_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE;

--
-- Constraints for table `handled_by`
--
ALTER TABLE `handled_by`
  ADD CONSTRAINT `Handled_By_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Handled_By_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `Questions_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `Questions_ibfk_2` FOREIGN KEY (`Unit_No`,`Course_Id`) REFERENCES `topics` (`Unit_Number`, `Course_Id`) ON DELETE SET NULL;

--
-- Constraints for table `question_paper`
--
ALTER TABLE `question_paper`
  ADD CONSTRAINT `Question_Paper_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `teacher` (`Teacher_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `Question_Paper_ibfk_2` FOREIGN KEY (`Eval_ID`) REFERENCES `evaluation` (`Eval_ID`) ON DELETE SET NULL;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `Teacher_ibfk_1` FOREIGN KEY (`HOD_ID`) REFERENCES `teacher` (`Teacher_ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `Teacher_ibfk_2` FOREIGN KEY (`Dep_ID`) REFERENCES `department` (`Dept_ID`) ON DELETE SET NULL;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `Topics_ibfk_1` FOREIGN KEY (`Course_Id`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
