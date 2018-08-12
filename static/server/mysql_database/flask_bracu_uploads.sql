-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2018 at 11:56 AM
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
-- Table structure for table `class_room`
--

CREATE TABLE `class_room` (
  `class_room_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
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
  `student_phone_no` int(11) NOT NULL,
  `student_profile_pic` varchar(256) NOT NULL,
  `student_dpt` varchar(4) NOT NULL,
  `student_sem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_availability`
--

CREATE TABLE `teacher_availability` (
  `teacher_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `teacher_phone` int(11) NOT NULL,
  `teacher_room` varchar(10) NOT NULL,
  `teacher_consultation` varchar(256) NOT NULL,
  `teacher_profile_pic` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `class_room`
--
ALTER TABLE `class_room`
  ADD PRIMARY KEY (`class_room_id`),
  ADD KEY `student_id` (`student_id`),
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
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_info`
--
ALTER TABLE `teacher_info`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wall_post`
--
ALTER TABLE `wall_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_room`
--
ALTER TABLE `class_room`
  ADD CONSTRAINT `class_room_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
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
