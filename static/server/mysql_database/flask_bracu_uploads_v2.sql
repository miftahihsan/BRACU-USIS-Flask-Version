-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2018 at 12:02 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask_bracu_uploads`
--

-- --------------------------------------------------------

--
-- Table structure for table `belongs_to`
--

CREATE TABLE `belongs_to` (
  `student_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_room`
--

CREATE TABLE `class_room` (
  `class_room_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_section` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_time` varchar(256) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_room` varchar(256) NOT NULL,
  `course_code` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_info`
--

CREATE TABLE `course_info` (
  `course_code` varchar(256) NOT NULL,
  `course_name` varchar(256) NOT NULL,
  `course_syllabus` varchar(256) NOT NULL,
  `course_description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notice_board`
--

CREATE TABLE `notice_board` (
  `notice_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `notice` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `commenter_id` int(11) NOT NULL,
  `user_identity` varchar(7) NOT NULL,
  `comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_mark`
--

CREATE TABLE `quiz_mark` (
  `quiz_row_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `quiz_number` int(11) NOT NULL,
  `quiz_marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(256) NOT NULL,
  `student_email` varchar(256) NOT NULL,
  `student_password` varchar(256) NOT NULL,
  `student_phone_no` varchar(11) NOT NULL,
  `student_profile_pic` varchar(256) NOT NULL,
  `student_dpt` varchar(4) NOT NULL,
  `student_sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`student_id`, `student_name`, `student_email`, `student_password`, `student_phone_no`, `student_profile_pic`, `student_dpt`, `student_sem`) VALUES
(1, 'Miftah Uddin Md Ihsan', 'miftahbk619@gmail.com', 'pbkdf2:sha256:50000$xmPsYomo$706d12932944b32abe56e194ad83609f1598a27ad16a16f8163b30ff5dbf7b8f', '01843661619', 'student_default.jpg', 'CSE', 8),
(2, 'Imam Hossain', 'imam@gmail.com', 'pbkdf2:sha256:50000$3pcdFOy8$dff465c02fb86fcf08c3db4c5db3d77a219048cd50097c8b70c8b6cc0c4e32c8', '01743661617', 'student_default.jpg', 'CSE', 11),
(3, 'Quazi Nafiz', 'nafiz@gmailcom', 'pbkdf2:sha256:50000$4UY2TFbv$4b0b6da9f97ceb51dd24770ee6d4d0fc6e741876fb8224a0f48abd7c3664500e', '01656775167', 'student_default.jpg', 'CS', 7);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_availability`
--

CREATE TABLE `teacher_availability` (
  `teacher_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_availability`
--

INSERT INTO `teacher_availability` (`teacher_id`, `availability`) VALUES
(1, 0),
(2, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_info`
--

CREATE TABLE `teacher_info` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(256) NOT NULL,
  `teacher_email` varchar(256) NOT NULL,
  `teacher_password` varchar(256) NOT NULL,
  `teacher_department` varchar(5) NOT NULL,
  `teacher_phone` varchar(11) NOT NULL,
  `teacher_room` varchar(256) NOT NULL,
  `teacher_consultation` varchar(256) NOT NULL,
  `teacher_profile_pic` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_info`
--

INSERT INTO `teacher_info` (`teacher_id`, `teacher_name`, `teacher_email`, `teacher_password`, `teacher_department`, `teacher_phone`, `teacher_room`, `teacher_consultation`, `teacher_profile_pic`) VALUES
(1, 'Walid Mohammad', 'walid.mohammad@bracu.ac.bd', 'pbkdf2:sha256:50000$W7xCrZwM$aa46c747913947429886c4d8f763acec0ef7df609ee1f535b244e9bc339c4231', 'CSE', '01843661619', 'Building - 5, Floor - 3rd,  UB50303', 'Sun 12:30-2 , monday 9:00 - 11:30', 'default.jpg'),
(2, 'Md.Saiful Islam', 'md.saiful.islam@bracu.ac.bd', 'pbkdf2:sha256:50000$NWEzZASv$450d25d59158f25f589b517f1c69dd6cffdf4a023625b8612c0e4cce5cf54e38', 'CSE', '02147483647', 'Building - 5, Floor - 3rd, UB50305', 'tuesday 12:30-2 , monday 5-9', 'default.jpg'),
(7, 'Sanjida Sabah', 'sanjidasaba@gmail.com', 'pbkdf2:sha256:50000$PFi4jjpR$3decefa7c8208092864bd8c4b58e3c490e8f58bd4e07aee70e771af650e02984', 'EEE', '02147483647', 'Building-5, Floor-4th, UB50409', 'Sun 12:30-2 | monday 5-9', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wall_post`
--

CREATE TABLE `wall_post` (
  `post_id` int(11) NOT NULL,
  `class_room_id` int(11) NOT NULL,
  `user_identity` varchar(7) NOT NULL,
  `poster_id` int(11) NOT NULL,
  `post` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`student_id`,`class_room_id`),
  ADD KEY `class_room_id` (`class_room_id`);

--
-- Indexes for table `class_room`
--
ALTER TABLE `class_room`
  ADD PRIMARY KEY (`class_room_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `course_info`
--
ALTER TABLE `course_info`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `notice_board`
--
ALTER TABLE `notice_board`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `class_room_id` (`class_room_id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `commenter_id` (`commenter_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `quiz_mark`
--
ALTER TABLE `quiz_mark`
  ADD PRIMARY KEY (`quiz_row_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_room_id` (`class_room_id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `teacher_availability`
--
ALTER TABLE `teacher_availability`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `teacher_info`
--
ALTER TABLE `teacher_info`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `wall_post`
--
ALTER TABLE `wall_post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `poster_id` (`poster_id`),
  ADD KEY `class_room_id` (`class_room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_room`
--
ALTER TABLE `class_room`
  MODIFY `class_room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_board`
--
ALTER TABLE `notice_board`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_mark`
--
ALTER TABLE `quiz_mark`
  MODIFY `quiz_row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_info`
--
ALTER TABLE `student_info`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teacher_info`
--
ALTER TABLE `teacher_info`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wall_post`
--
ALTER TABLE `wall_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`class_room_id`) REFERENCES `class_room` (`class_room_id`);

--
-- Constraints for table `class_room`
--
ALTER TABLE `class_room`
  ADD CONSTRAINT `class_room_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_info` (`teacher_id`),
  ADD CONSTRAINT `class_room_ibfk_3` FOREIGN KEY (`course_code`) REFERENCES `course_info` (`course_code`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_info` (`teacher_id`),
  ADD CONSTRAINT `course_ibfk_3` FOREIGN KEY (`course_code`) REFERENCES `course_info` (`course_code`);

--
-- Constraints for table `notice_board`
--
ALTER TABLE `notice_board`
  ADD CONSTRAINT `notice_board_ibfk_1` FOREIGN KEY (`class_room_id`) REFERENCES `class_room` (`class_room_id`);

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `wall_post` (`post_id`);

--
-- Constraints for table `quiz_mark`
--
ALTER TABLE `quiz_mark`
  ADD CONSTRAINT `quiz_mark_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  ADD CONSTRAINT `quiz_mark_ibfk_2` FOREIGN KEY (`class_room_id`) REFERENCES `class_room` (`class_room_id`);

--
-- Constraints for table `teacher_availability`
--
ALTER TABLE `teacher_availability`
  ADD CONSTRAINT `teacher_availability_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_info` (`teacher_id`);

--
-- Constraints for table `wall_post`
--
ALTER TABLE `wall_post`
  ADD CONSTRAINT `wall_post_ibfk_1` FOREIGN KEY (`class_room_id`) REFERENCES `class_room` (`class_room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
