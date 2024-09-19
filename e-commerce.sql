-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 08:08 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `position`, `department`) VALUES
(1, 'John Doe', 'Software Engineer', 'Engineering'),
(2, 'Steven Broad', 'IT Engineer', 'Engineering'),
(3, 'Jane Warner', 'Software Engineer', 'Engineering'),
(4, 'Ben Doe', 'Software Engineer', 'Engineering'),
(5, 'John Smith', 'IT Engineer', 'Engineering'),
(6, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(7, 'Jonahan', 'Software Engineer', 'Engineering'),
(8, 'John Doe', 'Software Engineer', 'Engineering'),
(9, 'Steven Broad', 'IT Engineer', 'Engineering'),
(10, 'Jane Warner', 'Software Engineer', 'Engineering'),
(11, 'Ben Doe', 'Software Engineer', 'Engineering'),
(12, 'John Smith', 'IT Engineer', 'Engineering'),
(13, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(14, 'Steven Broad', 'IT Engineer', 'Engineering'),
(15, 'Jane Warner', 'Software Engineer', 'Engineering'),
(16, 'Ben Doe', 'Software Engineer', 'Engineering'),
(17, 'John Smith', 'IT Engineer', 'Engineering'),
(18, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(19, 'Steven Broad', 'IT Engineer', 'Engineering'),
(20, 'Jane Warner', 'Software Engineer', 'Engineering'),
(21, 'Ben Doe', 'Software Engineer', 'Engineering'),
(22, 'John Smith', 'IT Engineer', 'Engineering'),
(23, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(24, 'Steven Broad', 'IT Engineer', 'Engineering'),
(25, 'Jane Warner', 'Software Engineer', 'Engineering'),
(26, 'Ben Doe', 'Software Engineer', 'Engineering'),
(27, 'John Smith', 'IT Engineer', 'Engineering'),
(28, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(29, 'Steven Broad', 'IT Engineer', 'Engineering'),
(30, 'Jane Warner', 'Software Engineer', 'Engineering'),
(31, 'Ben Doe', 'Software Engineer', 'Engineering'),
(32, 'John Smith', 'IT Engineer', 'Engineering'),
(33, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(34, 'Steven Broad', 'IT Engineer', 'Engineering'),
(35, 'Jane Warner', 'Software Engineer', 'Engineering'),
(36, 'Ben Doe', 'Software Engineer', 'Engineering'),
(37, 'John Smith', 'IT Engineer', 'Engineering'),
(38, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(39, 'Steven Broad', 'IT Engineer', 'Engineering'),
(40, 'Jane Warner', 'Software Engineer', 'Engineering'),
(41, 'Ben Doe', 'Software Engineer', 'Engineering'),
(42, 'John Smith', 'IT Engineer', 'Engineering'),
(43, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(44, 'Steven Broad', 'IT Engineer', 'Engineering'),
(45, 'Jane Warner', 'Software Engineer', 'Engineering'),
(46, 'Ben Doe', 'Software Engineer', 'Engineering'),
(47, 'John Smith', 'IT Engineer', 'Engineering'),
(48, 'Ben Marsh', 'Software Engineer', 'Engineering'),
(49, 'Steven Broad', 'IT Engineer', 'Engineering'),
(50, 'Jane Warner', 'Software Engineer', 'Engineering'),
(51, 'Ben Doe', 'Software Engineer', 'Engineering'),
(52, 'John Smith', 'IT Engineer', 'Engineering'),
(53, 'Ben Marsh', 'Software Engineer', 'Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240510123112-create-user.js'),
('20240514112529-add_mobilenumber_and_adhar_columns.js'),
('20240515074619-add_paassword.js'),
('20240517121135-create-t-personal-access-tokens.js'),
('20240521051257-create-t-user-role.js'),
('20240521073555-add_user_role.js'),
('20240524053050-create-t-user-permission.js'),
('20240524054858-create-t-user-role-mapping.js'),
('20240528054745-create-t-assign-role-permission-mapping.js'),
('20240528121717-create-t-assign-user-role-mapping.js');

-- --------------------------------------------------------

--
-- Table structure for table `t_assign_role_permission_mappings`
--

CREATE TABLE `t_assign_role_permission_mappings` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_assign_role_permission_mappings`
--

INSERT INTO `t_assign_role_permission_mappings` (`id`, `role_id`, `permission_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2024-05-28 12:43:15', '2024-05-28 12:43:15'),
(2, 1, 2, '2024-05-28 12:43:15', '2024-05-28 12:43:15'),
(3, 1, 3, '2024-05-28 12:43:15', '2024-05-28 12:43:15'),
(4, 1, 5, '2024-05-28 12:43:15', '2024-05-28 12:43:15'),
(5, 1, 4, '2024-05-28 12:43:15', '2024-05-28 12:43:15'),
(6, 2, 2, '2024-05-28 12:43:49', '2024-05-28 12:43:49'),
(7, 2, 6, '2024-05-28 12:43:49', '2024-05-28 12:43:49'),
(8, 2, 7, '2024-05-28 12:43:49', '2024-05-28 12:43:49'),
(9, 3, 2, '2024-05-28 12:58:39', '2024-05-28 12:58:39'),
(10, 3, 4, '2024-05-28 12:58:39', '2024-05-28 12:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `t_assign_user_role__mappings`
--

CREATE TABLE `t_assign_user_role__mappings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_assign_user_role__mappings`
--

INSERT INTO `t_assign_user_role__mappings` (`id`, `user_id`, `role_id`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2024-05-28 12:42:34', '2024-05-28 12:42:34'),
(2, 1, 3, '2024-05-28 12:42:34', '2024-05-28 12:42:34'),
(3, 2, 1, '2024-05-29 05:33:59', '2024-05-29 05:33:59'),
(4, 2, 3, '2024-05-29 05:33:59', '2024-05-29 05:33:59'),
(5, 12, 2, '2024-05-29 05:33:59', '2024-05-29 05:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `t_personal_access_tokens`
--

CREATE TABLE `t_personal_access_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `detect_browser` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_personal_access_tokens`
--

INSERT INTO `t_personal_access_tokens` (`id`, `token`, `status`, `created_by`, `detect_browser`, `createdAt`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjQ0NDIwMH0.0QjlOqxY35U-KRq_Bj6Eq8N77wIUtUeymRqkgpSDnpI', 1, 1, 'PostmanRuntime', '2024-05-23 06:03:20', '2024-05-23 06:03:20'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjQ1MDM4NX0.25JyfACXthaaom5ILIhWB1ts019-e7W1JVLI5y_pLxs', 1, 1, 'PostmanRuntime', '2024-05-23 07:46:25', '2024-05-23 07:46:25'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjQ1MDQzNX0.uU9c98hQISMo5i1gKlR-UoaQg1R3AbkJcqUQ_CdVhWA', 1, 1, 'PostmanRuntime', '2024-05-23 07:47:15', '2024-05-23 07:47:15'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjUyNzY1Nn0.KWtjUbJ9qrqp1GUlmsf9A-PjouHabe0O6v7AnoBUu9w', 1, 1, 'PostmanRuntime', '2024-05-24 05:14:16', '2024-05-24 05:14:16'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg3NTQzOH0._YaS5rQPLZTG-RgqGh3hP3T_6tnUTQ2IPOpQuQbH2N4', 1, 1, 'PostmanRuntime', '2024-05-28 05:50:38', '2024-05-28 05:50:38'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg3NTQ2NX0.AFhbpJ7iukzkzc2qfhXicq6wZsHpudcSpX4ui_RwQSY', 1, 1, 'PostmanRuntime', '2024-05-28 05:51:05', '2024-05-28 05:51:05'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg3NjIwNH0.3avp8B4WVpi4qggMNZ5Qb8jKsB3MNZCYshMXyWMeSb4', 1, 1, 'PostmanRuntime', '2024-05-28 06:03:24', '2024-05-28 06:03:24'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg3OTgyNn0.8qF71v4F1u0dJ5Qye8IUEPNdap45D6KwFjGrSnbwkFo', 1, 1, 'PostmanRuntime', '2024-05-28 07:03:46', '2024-05-28 07:03:46'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg4ODE5MX0.Mh7WrfLIOmLlpHQXWtngyGSYy4x4tISkjGK2xOQqrIM', 1, 1, 'PostmanRuntime', '2024-05-28 09:23:11', '2024-05-28 09:23:11'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg5MjQ4OH0.6lanQJYx-nF9u4A9DG4rCJAxjkQfQqcKMNRgQFbl7ro', 1, 1, 'PostmanRuntime', '2024-05-28 10:34:48', '2024-05-28 10:34:48'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjg5NzMxNH0.SYFgdIpFaNcoJ6fUVIrOw7KqE_4c_8ChelkOtM3p_xw', 1, 1, 'PostmanRuntime', '2024-05-28 11:55:14', '2024-05-28 11:55:14'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjkwMDk0MH0.WzfyxBKLlgNNtlSGsDJmBgcqZBsZukgHJMv1RqgrrcQ', 1, 1, 'PostmanRuntime', '2024-05-28 12:55:40', '2024-05-28 12:55:40'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjk1NjU5Nn0.U-B1opiAEL18gE2CGjyNG1wOzPH3A5Ja9W2MRcrefbg', 1, 1, 'PostmanRuntime', '2024-05-29 04:23:16', '2024-05-29 04:23:16'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjk2MDgwNn0.q6_ul8N3PvgD0EL9E5R3saV5x1MceSvSulHc2m06LN0', 1, 1, 'PostmanRuntime', '2024-05-29 05:33:26', '2024-05-29 05:33:26'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjk2NDU4OH0._Qh6f5JNn2MDa-izvzWQvcSL3rOmHW0xTXIkf5NIrkM', 1, 1, 'PostmanRuntime', '2024-05-29 06:36:28', '2024-05-29 06:36:28'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjk2ODg5N30.9okASKN63kDhnA161o6ZTyrncdcWrCJdShBg4nG4-qQ', 1, 1, 'PostmanRuntime', '2024-05-29 07:48:17', '2024-05-29 07:48:17'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNjk4NDc4NH0.NXPaIIJP4JoZgqjjzHBoPr2YB4m8QE69FL_alCkVHSQ', 1, 1, 'PostmanRuntime', '2024-05-29 12:13:04', '2024-05-29 12:13:04'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNzA0MzU0Nn0.cKiAG5k3tcY7qe7pse9iJmxdWth4trVuFEEUJn2cdQU', 1, 1, 'PostmanRuntime', '2024-05-30 04:32:26', '2024-05-30 04:32:26'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcxNzA0NzE1MX0.T9rKrGkZrNTOlEXMLRU4WrzZyharEjidpZCD9teDDF8', 1, 1, 'PostmanRuntime', '2024-05-30 05:32:31', '2024-05-30 05:32:31'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcyMjIzNjEyNH0.WlsXHb1nf4CUh7fK9ykz1A7I2cmGrJOcCmXzXNbjV5I', 1, 1, 'PostmanRuntime', '2024-07-29 06:55:24', '2024-07-29 06:55:24'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcyMjIzOTgwN30.GqKcC5k_hVKnlbX29jmRHHvasml2ElxfBKWTO55ZTHc', 1, 1, 'PostmanRuntime', '2024-07-29 07:56:47', '2024-07-29 07:56:47'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcyMjI0OTA2MH0.JmuDrFO0fR40fNCb0-BgBh3N8DPmsczGq2ShI6qS7C4', 1, 1, 'PostmanRuntime', '2024-07-29 10:31:00', '2024-07-29 10:31:00'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcyMjI1NjgwM30.MOiagOidxDLi-BMSnK_FCPblewxvuBCeRAur84rezOg', 1, 1, 'PostmanRuntime', '2024-07-29 12:40:03', '2024-07-29 12:40:03'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzSW4iOjM2MDAsInVzZXIiOnsidXNlcklkIjoxLCJ1c2VyRmlyc3ROYW1lIjoiU3VzbWl0YSIsInVzZXJMYXN0TmFtZSI6Ik5heWFrIn0sImlhdCI6MTcyNjcyNjA0NX0.lSQsVs-aJRdGiNxiULdZswU79f0tpqxZNtYyGAMad0o', 1, 1, 'PostmanRuntime', '2024-09-19 06:07:25', '2024-09-19 06:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_permissions`
--

CREATE TABLE `t_user_permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_user_permissions`
--

INSERT INTO `t_user_permissions` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Manage Users', '2024-05-24 05:41:26', '2024-05-24 05:41:26'),
(2, 'Manage Products', '2024-05-24 05:41:44', '2024-05-24 05:41:44'),
(3, 'View Orders', '2024-05-24 05:41:51', '2024-05-24 05:41:51'),
(4, 'Edit Content', '2024-05-24 05:41:57', '2024-05-24 05:41:57'),
(5, 'Process Refunds', '2024-05-24 05:42:04', '2024-05-24 05:42:04'),
(6, 'Access Reports', '2024-05-24 05:42:10', '2024-05-24 05:42:10'),
(7, 'Make Purchases', '2024-05-24 05:42:17', '2024-05-24 05:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_roles`
--

CREATE TABLE `t_user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_user_roles`
--

INSERT INTO `t_user_roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2024-05-24 05:22:55', '2024-05-24 05:22:55'),
(2, 'Vendor', '2024-05-24 05:24:25', '2024-05-24 05:24:25'),
(3, 'Customer', '2024-05-24 05:24:34', '2024-05-24 05:24:34'),
(4, 'Customer Support', '2024-05-24 05:24:49', '2024-05-24 05:24:49'),
(5, 'Store Manager', '2024-05-24 05:25:10', '2024-05-24 05:25:10'),
(6, 'Guest', '2024-05-24 05:43:11', '2024-05-24 05:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_role_mappings`
--

CREATE TABLE `t_user_role_mappings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_role` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `mobileNumber` varchar(255) NOT NULL,
  `adhara_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_role`, `firstName`, `lastName`, `email`, `password`, `createdAt`, `updatedAt`, `mobileNumber`, `adhara_number`) VALUES
(1, 1, 'Susmita', 'Nayak', 'susmitanayak3051@gmail.com', '$2b$10$a.2sQ66KEVS5Dc7BmwynhuroNkhipPu6.zpqAUQLgCkduAR91GguS', '2024-05-21 07:34:54', '2024-05-21 07:34:54', '89176469651', '1234567865411'),
(2, 2, 'Prasanna', 'Ghose', 'prasannaghose123@gmail.com', '$2b$10$9nSAPSdX5NKztwrjopak5O1x8zYRzfHzi1Rkvj0n4gkjm2mU83ccC', '2024-05-29 12:11:46', '2024-05-29 12:11:46', '98536469651', '12345678654129');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `t_assign_role_permission_mappings`
--
ALTER TABLE `t_assign_role_permission_mappings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_assign_user_role__mappings`
--
ALTER TABLE `t_assign_user_role__mappings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_personal_access_tokens`
--
ALTER TABLE `t_personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_permissions`
--
ALTER TABLE `t_user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_roles`
--
ALTER TABLE `t_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_role_mappings`
--
ALTER TABLE `t_user_role_mappings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobileNumber` (`mobileNumber`),
  ADD UNIQUE KEY `adhara_number` (`adhara_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `t_assign_role_permission_mappings`
--
ALTER TABLE `t_assign_role_permission_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_assign_user_role__mappings`
--
ALTER TABLE `t_assign_user_role__mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_personal_access_tokens`
--
ALTER TABLE `t_personal_access_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `t_user_permissions`
--
ALTER TABLE `t_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_user_roles`
--
ALTER TABLE `t_user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_user_role_mappings`
--
ALTER TABLE `t_user_role_mappings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
