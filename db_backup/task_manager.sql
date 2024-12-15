-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2024 at 12:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
(1, 'sattu123', 'shiva83023@gmail.com', '$2y$10$esUG/78BajNYGDdLs01SKeGDaNvp2zDA49U8ag0Xk.arP/5UZRukO', '2024-12-13 17:42:51', '2024-12-13 17:42:51'),
(2, 'Shubham Vishwakarma', 'shiva83023@gmail.com', '$2y$10$oldbhZHyv4r7nV3SHpXKouei7fCIig3buKeJ0P2UxFtiLZRD6GMsa', '2024-12-13 17:43:05', '2024-12-13 17:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `email_notifications`
--

CREATE TABLE `email_notifications` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('pending','sent','failed') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_notifications`
--

INSERT INTO `email_notifications` (`id`, `task_id`, `sender`, `recipient`, `subject`, `body`, `task_name`, `due_date`, `status`, `created_at`, `updated_at`) VALUES
(2, 0, 'shivam.v@nirvaat.com', 'shiva83023@gmail.com', 'Urgent: Task Notification - Due Tomorrow: xcvbfd', 'Hello Shivam,\n\nThis is a reminder that your task \"xcvbfd\" is due tomorrow, 2024-12-16.\n\nTask Description: dfgdfgfgd\n\nPlease make sure to complete it before the due date.\n\nBest Regards, Nirvaat Internet Private Limited', 'xcvbfd', '2024-12-16', 'pending', '2024-12-15 17:18:09', '2024-12-15 17:18:09'),
(3, 2, 'shivam.v@nirvaat.com', 'shiva83023@gmail.com', 'Urgent: Task Notification - Due Tomorrow: xcvbfd', 'Hello Shivam,\n\nThis is a reminder that your task \"xcvbfd\" is due tomorrow, 2024-12-16.\n\nTask Description: dfgdfgfgd\n\nPlease make sure to complete it before the due date.\n\nBest Regards, Nirvaat Internet Private Limited', 'xcvbfd', '2024-12-16', 'pending', '2024-12-15 17:19:15', '2024-12-15 17:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','completed') DEFAULT 'pending',
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `due_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `priority`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'shiva', 'cvdssdf', 'completed', 'high', '2024-12-12', '2024-12-13 18:20:13', '2024-12-13 19:21:00'),
(2, 1, 'xcvbfd', 'dfgdfgfgd', 'pending', 'medium', '2024-12-16', '2024-12-13 19:21:16', '2024-12-15 10:34:00'),
(3, 1, 'czcvz', 'zvzxvzxv', 'completed', 'low', '2024-12-15', '2024-12-13 19:22:57', '2024-12-15 10:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('0','1') DEFAULT '1',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shivam', 'shiva83023@gmail.com', '$2y$10$eJbuHTuphHU7EAbcLfxt..s3LfwPY6oHB62P3hi7gNfzH5n2yf/qK', '1', '2024-12-13 18:02:58', '2024-12-13 19:24:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_notifications`
--
ALTER TABLE `email_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_notifications`
--
ALTER TABLE `email_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
