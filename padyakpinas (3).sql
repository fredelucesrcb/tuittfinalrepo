-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2018 at 09:04 AM
-- Server version: 10.1.35-MariaDB
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
-- Database: `padyakpinas`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` int(11) DEFAULT NULL,
  `category_status_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `creator`, `category_status_id`) VALUES
(1, 'Dirt Biking', 'all about dirt bikes', '2018-09-14 06:04:55', '2018-09-14 06:05:25', 5, 1),
(2, 'Mountain Biking', 'Mountain Biking chu chu', '2018-09-14 06:04:55', '2018-09-14 06:05:25', 6, 1),
(3, 'Jona the Dyosa', 'hahahah', '2018-09-17 00:35:20', '2018-09-17 00:35:20', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_statuses`
--

CREATE TABLE `category_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_statuses`
--

INSERT INTO `category_statuses` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `description`, `user_id`, `location`, `created_at`, `updated_at`) VALUES
(4, 'asda', '25.00', '<p>THis item is brand spanking new</p>', 19, 'somewhere', '2018-09-20 19:09:08', '2018-09-20 19:09:08'),
(5, 'Rockshox fork', '9800.00', '<p>RockShox fork 90mm travel</p><p>with minimal battle scars.</p><p>Negotiable upon viewing</p>', 5, 'Quezon City', '2018-09-24 22:28:38', '2018-09-24 22:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `item_images`
--

CREATE TABLE `item_images` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_images`
--

INSERT INTO `item_images` (`id`, `image`, `item_id`) VALUES
(7, '/storage/images/marketplaceimages/NFGXu_030908.jpg', 4),
(8, '/storage/images/marketplaceimages/ZKoO0_030909.jpg', 4),
(9, '/storage/images/marketplaceimages/4bq9V_062838.png', 5),
(10, '/storage/images/marketplaceimages/TNFum_062839.jpg', 5),
(11, '/storage/images/marketplaceimages/iBRdc_062839.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `time_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `opened` int(11) NOT NULL DEFAULT '1',
  `recipient_delete` int(11) DEFAULT NULL,
  `sender_delete` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `time_sent`, `subject`, `message`, `opened`, `recipient_delete`, `sender_delete`, `from_id`, `to_id`) VALUES
(1, '2018-09-24 01:32:51', 'hell pre', 'musta?', 1, 0, NULL, 5, 6),
(2, '2018-09-24 00:30:32', 'Hello pre', 'hello', 1, 0, NULL, 5, 6),
(3, '2018-09-24 07:06:40', 'Re: hell pre', 'musta?\r\n<-------End of Message------->\r\n\r\nokay lang', 1, 0, NULL, 6, 5),
(4, '2018-09-24 00:30:36', 'Re: Re: hell pre', '<p>musta? &lt;-------End of Message-------&gt; okay lang &lt;-------End of Message-------&gt;</p><p>hahahah</p>', 1, 0, NULL, 5, 6),
(5, '2018-09-24 07:11:48', 'Re: Re: Re: hell pre', '<p>musta?&nbsp;</p><p>&lt;-------End of Message-------&gt;&nbsp;</p><p>okay lang&nbsp;</p><p>&lt;-------End of Message-------&gt;</p><p>hahahah</p><p>&lt;-------End of Message-------&gt;</p>', 1, 0, NULL, 6, 5),
(6, '2018-09-24 07:11:53', 'I\'m Interested in item3.', '<p>hello pre</p>', 1, 0, NULL, 6, 5),
(7, '2018-09-24 00:30:41', 'Re: I\'m Interested in item3.', '<p>hello pre</p><p>&lt;-------End of Message-------&gt;</p><p>&nbsp;</p><p>okay pre. PM details.</p>', 1, 0, NULL, 5, 6),
(8, '2018-09-24 07:11:56', 'I\'m Interested in item3.', '<p>Please send me details.</p>', 1, 0, NULL, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_status_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `updated_at`, `thread_id`, `user_id`, `post_status_id`) VALUES
(18, 'ahaha', '<p>saree</p>', '2018-09-21 00:04:02', '2018-09-21 00:04:11', 3, 5, 1),
(23, 'ahahaha', '<p>weee</p>', '2018-09-25 22:00:17', '2018-09-25 22:00:17', 9, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_statuses`
--

CREATE TABLE `post_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_statuses`
--

INSERT INTO `post_statuses` (`id`, `name`) VALUES
(1, '1'),
(2, 'Moderated');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Member'),
(2, 'Moderator'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `banner` varchar(255) NOT NULL DEFAULT '/images/padyaklogo.png',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `thread_status_id` int(11) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `subject`, `message`, `banner`, `created_at`, `updated_at`, `user_id`, `thread_status_id`, `category_id`) VALUES
(2, 'Best Mountain Bike Brand', 'What\'s the best MT Brand guys?', '/images/padyaklogo.png', '2018-09-14 06:11:25', '2018-09-24 01:18:42', 6, 1, 1),
(3, 'Broken Suspension', '<p>Hi. I\'m having a problem with my suspension. It bottomed out on a super rad jump. And well, it <strong>never came back up</strong>. Need advice on what you can do.</p>', '/images/padyaklogo.png', '2018-09-14 07:08:13', '2018-09-24 01:15:52', 5, 1, 1),
(6, 'enebeyen?', '<p>ahahahahaha</p>', '/images/padyaklogo.png', '2018-09-15 07:06:18', '2018-09-15 15:06:18', 5, 1, 2),
(8, 'Hello pre', '<p>kamusta po <strong>kayong lahat?</strong></p>', '/images/padyaklogo.png', '2018-09-20 22:53:01', '2018-09-21 06:53:11', 5, 3, 2),
(9, 'how are you?', '<p>ahahahaha<strong>. weeeew</strong></p>', '/images/padyaklogo.png', '2018-09-23 22:08:35', '2018-09-24 07:59:10', 5, 1, 1),
(12, 'ahahahah', '<p>weeee</p>', '/images/padyaklogo.png', '2018-09-24 19:06:57', '2018-09-26 06:43:31', 5, 1, 3),
(13, 'GG besh', '<p>asdasdas</p>', '/images/padyaklogo.png', '2018-09-24 19:10:01', '2018-09-25 03:10:01', 5, 1, 3),
(14, 'ddsa', '<p>ssasd</p>', '/images/padyaklogo.png', '2018-09-24 19:14:13', '2018-09-25 03:14:13', 5, 1, 3),
(16, 'ssd', '<p>asdad</p>', '/images/padyaklogo.png', '2018-09-24 20:57:27', '2018-09-25 04:57:27', 5, 1, 3),
(17, 'hello', '<p>ahahahahha</p>', '/storage/images/banners/17.png', '2018-09-25 21:36:17', '2018-09-26 05:36:18', 5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `thread_statuses`
--

CREATE TABLE `thread_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thread_statuses`
--

INSERT INTO `thread_statuses` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Duplicate'),
(3, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '/storage/images/defaults/default-avatar.jpg',
  `user_role_id` int(11) NOT NULL DEFAULT '1',
  `status_id` int(11) NOT NULL DEFAULT '1',
  `last_activity` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `avatar`, `user_role_id`, `status_id`, `last_activity`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'rcbfredeluces', 'rcbfredeluces@gmail.com', '2018-09-20 18:26:00', '$2y$10$6RFicvxXQBxRlgStVgZOvO0zPHarx1.3QosdZLrDlbLMdu.g4XWF2', '/storage/images/items/5.PNG', 3, 3, '2018-09-25 19:12:31', 'CfiaGcbCTjWUgXirsTPknmxqJ5ySoNrBZmqJtBmwfqMT2ojiMdlerGSaIbbw', '2018-09-13 04:30:36', '2018-09-25 21:12:58'),
(6, 'rcbfredeluceses', 'rcbfredeluces@gmail.coms', NULL, '$2y$10$NZqj/1SyR.gfOpPwIIBtjuWvrzwjTNuj2PUesMxrnQDILTnb6qVUe', '/storage/images/items/6.jpg', 3, 1, '2018-09-23 21:59:03', 'QjM12av21OCRjqkQ9b5pQQzwZMDPyWbfWiOrjWklggzTUIN4rRY4wsl28Qac', '2018-09-13 08:13:37', '2018-09-23 21:59:03'),
(7, 'royisadmin', 'rcbfredeluces@gmail.comsa', NULL, '$2y$10$KTgobnYF/WVzM5o6NbiSl.D8LGFFeFfljh6zXCDaGVMJiqK8PBwA6', '/storage/images/defaults/default-avatar.jpg', 2, 1, '2018-09-20 07:24:38', 'U44SVEnjfq15SgGx6xb6NgKI5PMYvqZM5Rd94hYK8gZ5ghWMbFyvNFWrYMEu', '2018-09-19 23:24:38', '2018-09-25 22:05:14'),
(9, 'royadmin', 'rcbfredeluceses@gmail.com', NULL, '$2y$10$8UIszY4oEBhXmdY4fgOzWeQtRLOWArvp0wkxmQUZFpwgMTgn1aMZ2', '/storage/images/defaults/default-avatar.jpg', 1, 1, '2018-09-20 07:42:50', '7pnwiT3cTX6W1WwPKpXdrvmE2iI03g9eos9xXCG4xMzqw9wuJW32LywUiEAJ', '2018-09-19 23:42:50', '2018-09-19 23:42:50'),
(19, 'fredelucesrcb', 'fredeluces.rcb@gmail.com', '2018-09-20 17:58:30', '$2y$10$nxR9bgtG6MpNBDpnHthW9OBtGmLxAgGDiE4DxCCjgdnhQ6gcUSrDS', '/storage/images/defaults/default-avatar.jpg', 2, 1, '2018-09-25 17:07:41', 'Tw6PyJBH2cAFulu6DgHlYC4jKS9adVIpsKhSTSVRAxYoGMZhZK9xcxXQbPBd', '2018-09-20 17:54:31', '2018-09-25 17:07:41'),
(20, 'testuser001', 'testuserpp01@gmail.com', '2018-09-25 16:53:29', '$2y$10$7qfzMwLr39weCn34UIoK0OhBu31TeRCBbVxIgQ5x5bfoKhuAl9z8.', '/storage/images/defaults/default-avatar.jpg', 1, 1, '2018-09-26 00:53:00', 'Q4L5CPkOaAfTQ5sZ8o1t2ozzIaJzC2eKvvpgRuyODpxCoQWlIyjADiau9SVP', '2018-09-25 16:52:59', '2018-09-25 16:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `nickname`, `user_id`, `address`, `contact_number`) VALUES
(2, 'Roy Fredeluces', 'royszsk', 5, 'Jasmin St. Surallah, South Cotabato', NULL),
(3, 'rcbfredeluces', 'ahahaha', 6, 'jasmin st., surallah south cotabato', '09561202200'),
(4, 'Roy Fredeluces', NULL, 7, NULL, NULL),
(5, 'Roy Fredeluces', NULL, 9, NULL, NULL),
(15, 'roooy', NULL, 19, NULL, NULL),
(16, 'Roy', NULL, 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_statuses`
--

CREATE TABLE `user_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_statuses`
--

INSERT INTO `user_statuses` (`id`, `name`) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Blocked'),
(4, 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `vote`, `post_id`, `user_id`) VALUES
(14, 0, 18, 5),
(15, 0, 23, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_fk0` (`creator`),
  ADD KEY `categories_fk1` (`category_status_id`);

--
-- Indexes for table `category_statuses`
--
ALTER TABLE `category_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_fk0` (`user_id`);

--
-- Indexes for table `item_images`
--
ALTER TABLE `item_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_images_fk0` (`item_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_fk0` (`from_id`),
  ADD KEY `messages_fk1` (`to_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_fk0` (`thread_id`),
  ADD KEY `posts_fk1` (`user_id`),
  ADD KEY `posts_fk2` (`post_status_id`);

--
-- Indexes for table `post_statuses`
--
ALTER TABLE `post_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_fk0` (`user_id`),
  ADD KEY `threads_fk1` (`thread_status_id`),
  ADD KEY `threads_fk2` (`category_id`);

--
-- Indexes for table `thread_statuses`
--
ALTER TABLE `thread_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `users_fk0` (`user_role_id`),
  ADD KEY `users_fk1` (`status_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_fk0` (`user_id`);

--
-- Indexes for table `user_statuses`
--
ALTER TABLE `user_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_fk0` (`post_id`),
  ADD KEY `votes_fk1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_statuses`
--
ALTER TABLE `category_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_images`
--
ALTER TABLE `item_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `post_statuses`
--
ALTER TABLE `post_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `thread_statuses`
--
ALTER TABLE `thread_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_statuses`
--
ALTER TABLE `user_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_fk0` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_fk1` FOREIGN KEY (`category_status_id`) REFERENCES `category_statuses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_images`
--
ALTER TABLE `item_images`
  ADD CONSTRAINT `item_images_fk0` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_fk0` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_fk1` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_fk0` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_fk2` FOREIGN KEY (`post_status_id`) REFERENCES `post_statuses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_fk1` FOREIGN KEY (`thread_status_id`) REFERENCES `thread_statuses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `threads_fk2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_fk0` FOREIGN KEY (`user_role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_fk1` FOREIGN KEY (`status_id`) REFERENCES `user_statuses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_fk0` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votes_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
