-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2025 at 02:45 PM
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
-- Database: `book_store_db`
--
CREATE DATABASE IF NOT EXISTS `book_store_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `book_store_db`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(1, '4,1', 'The Midnight Library', 'Matt Haig', 'Between life and death, there is a library. And within that library, the shelves go on forever. Each book offers a chance to try another life you could have lived. For Nora Seed, faced with regret and despair, this library becomes a chance to explore the endless possibilities of her life—and find out what truly makes it worth living. The Midnight Library is a moving and thought-provoking novel that blends philosophy, fantasy, and the search for meaning into a deeply human story.', 0, 2500, '1604631420_books-1419613.jpg', '2020-11-06 10:57:51'),
(2, '1,2', 'Python Programming', 'Anthony Brun', 'A Step by Step Guide from Beginner to  Expert', 0, 1800, '1604631960_python_book.jpg', '2020-11-06 11:06:58'),
(3, '1', 'Aspects in Communication', 'A.A. Agboola, T.G. Akano', 'Aspects in Communication | Literature and Oral Presentation by A.A. Agboola & T.G. Akano.\r\n2025 Edition', 0, 2700, '1754641980_gns.jpg', '2025-08-08 09:33:31'),
(4, '1', 'Precious Seeds', 'Vine Branch Ministry', 'Precious Seeds Literature for Youths and Teenagers', 0, 2200, '1754642100_lit.jpg', '2025-08-08 09:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `book_id`, `qty`, `price`, `customer_id`) VALUES
(2, 1, 1, 2500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Educational', 'Educational'),
(2, 'Programming', 'Programming'),
(3, 'Fantasy', 'Fantasy'),
(4, 'Business', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(1, 'Bisola', '20 ovation quarters', '09022004994', 'bisola@gmail.com', '2e45aa74779d17ffc65de6866db9c667', '2025-08-19 13:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(1, 1, '20 ovation quarters', 0, 1, '2025-08-19 13:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(1, 1, 4, 1, 2200);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Poly Venture', 'info@gmail.com', '+234805-5654-555', '', '&lt;p&gt;Welcome to Poly Ibadan Book Venture, your trusted destination for academic and general-interest books. We provide a curated collection of titles to support learning, research, and personal growth. From textbooks to literature, our offerings meet the needs of students, educators, and knowledge seekers across disciplines. Each title is carefully selected to ensure quality and relevance.&lt;/p&gt;&lt;p&gt;Our user-friendly online platform makes browsing and purchasing books convenient and secure. Whether you&amp;#39;re preparing for exams or expanding your personal library, our shop is tailored for your success. Search by category, author, or title, and enjoy quick access to the materials you need. We also offer digital formats to suit your reading preference.&lt;/p&gt;&lt;p&gt;At Poly Ibadan Book Venture, we believe education is a lifelong journey. That&amp;#39;s why we keep updating our catalog with the latest publications. Our experienced team works closely with publishers and institutions to bring you authentic and up-to-date resources. Looking for hard-to-find academic texts? We&amp;rsquo;re here to help source them efficiently.&lt;/p&gt;&lt;p&gt;We offer fast delivery and affordable prices. Choose from a wide range of payment options and enjoy peace of mind with our reliable service. You can also track your orders and receive notifications on new arrivals and exclusive offers. Join our growing community of readers and learners who trust us for quality and service.&lt;/p&gt;&lt;p&gt;We are proud to serve the academic community within and beyond The Polytechnic, Ibadan. Our goal is to empower learners at every stage. Visit us today and experience the future of book shopping. Whether online or in-store, Poly Ibadan Book Venture is your partner in learning. Thank you for choosing us as your go-to bookstore. Explore. Learn. Grow &amp;mdash; with us.&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://localhost/book_store/admin/assets/uploads/1604629260_books-1419613.jpg&quot; style=&quot;width: 465px;&quot; class=&quot;fr-fic fr-dib&quot;&gt;&lt;/p&gt;&lt;p data-end=&quot;625&quot; data-start=&quot;212&quot;&gt;At Poly Ibadan Book Venture, discovering the right book is simple and rewarding. Our curated bookstore blends convenience with quality, offering a broad range of academic, professional, and leisure titles. Whether you&amp;rsquo;re studying for exams or exploring new ideas, we have the resources to support your journey. Our books are carefully selected to ensure they meet academic standards and personal enrichment goals.&lt;/p&gt;&lt;p data-end=&quot;1019&quot; data-start=&quot;627&quot;&gt;Browse effortlessly through our online store. With categories covering science, engineering, business, arts, and more, you&amp;rsquo;ll find titles suited to your needs. Search with ease, order securely, and enjoy timely delivery. We also offer digital formats for readers who prefer eBooks. Designed with users in mind, our platform ensures a smooth, stress-free experience from selection to checkout.&lt;/p&gt;&lt;p data-end=&quot;1337&quot; data-start=&quot;1021&quot;&gt;We are committed to meeting the unique demands of the academic environment. Our catalog is regularly updated with new and relevant titles, including recommended texts for The Polytechnic, Ibadan and beyond. Can&amp;rsquo;t find what you need? Let us know, and we&amp;rsquo;ll help you locate it through our extended publishing partners.&lt;/p&gt;&lt;p data-end=&quot;1629&quot; data-start=&quot;1339&quot;&gt;More than just a bookstore, Poly Ibadan Book Venture is a learning ally. We believe in making education accessible and affordable. Our services include discounts, bulk order support, and updates on new arrivals. Whether you&amp;#39;re an individual buyer or an institution, we&amp;rsquo;re here to serve you.&lt;/p&gt;&lt;p data-end=&quot;1878&quot; data-start=&quot;1631&quot;&gt;Join a growing number of readers who trust Poly Ibadan Book Venture for reliable service, authentic books, and a personalized shopping experience. From textbooks to test prep, fiction to nonfiction, we connect you with the knowledge that empowers.&lt;/p&gt;&lt;p data-end=&quot;1968&quot; data-start=&quot;1880&quot;&gt;Explore. Discover. Learn &amp;mdash; only with Poly Ibadan Book Venture, where books meet purpose.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'Sales', 'sales', '9ed083b1436e5f40ef984b28255eef18', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `dblms`
--
CREATE DATABASE IF NOT EXISTS `dblms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dblms`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `font_awesome_class` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `name`, `parent`, `slug`, `date_added`, `last_modified`, `font_awesome_class`, `thumbnail`) VALUES
(1, 'b3bc111cf7', 'Programming', 0, 'programming', 1740092400, 1740092400, 'fab fa-app-store', '7645876787d5f8a8155804255d9f86f7.jpg'),
(2, '6680cd730d', 'Science', 0, 'science', 1740092400, NULL, 'fab fa-accusoft', '67f6227ad931511e788616545b1d0b12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('u7jn4j62nnbfstbc61ei1vcs7arisqdn', '::1', 1561169011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536313136383934313b636172745f6974656d737c613a303a7b7d757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b61646d696e5f6c6f67696e7c733a313a2231223b),
('dpb2fi40qktdgagl2fgvv3nhce4dfun4', '::1', 1561300719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536313330303731393b636172745f6974656d737c613a303a7b7d),
('2k91kfslkj6l19jl9rnc2ivrnb8pna7r', '::1', 1561351070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536313335313032363b636172745f6974656d737c613a303a7b7d757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b61646d696e5f6c6f67696e7c733a313a2231223b),
('jg8qlcl9tjvjms9r5g3jlofig4s84a6k', '::1', 1740145848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134353834383b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32333a2253797374656d2053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b),
('lihupcip2fnfnmcp9c1k6b7o00ag12jq', '::1', 1740146644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134363634343b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32333a2253797374656d2053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b),
('truet8ggnv7tru17c1dmdveg08bkh634', '::1', 1740146971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134363937313b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32353a22446174612055706461746564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b),
('438fcai0c4e6k84kf3ucut5grss5h63p', '::1', 1740147352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134373335323b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32333a2244617461204164646564205375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b),
('korterkporhacn6an0eapl7o8d253ahc', '::1', 1740147674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134373637343b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32373a22496e7374727563746f722053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b),
('dknjum8glrj06njdiqiiavuie6d1457v', '::1', 1740148019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134383031393b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32373a22496e7374727563746f722053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b),
('abhbt3ktniueoffpund38b1j5k4gif8l', '::1', 1740147992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134373639393b636172745f6974656d737c613a303a7b7d666c6173685f6d6573736167657c733a31373a2257656c636f6d2044616e69656c204f6c61223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d757365725f69647c733a313a2232223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31303a2244616e69656c204f6c61223b757365725f6c6f67696e7c733a313a2231223b6c61796f75747c733a343a226c697374223b),
('0tut7b5jjcencadd674acvcu7m175l70', '::1', 1740148041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134383031393b636172745f6974656d737c613a303a7b7d6c61796f75747c733a343a226c697374223b757365725f69647c733a313a2231223b726f6c655f69647c733a313a2231223b726f6c657c733a353a2241646d696e223b6e616d657c733a31313a2261646d696e2061646d696e223b666c6173685f6d6573736167657c733a32373a22496e7374727563746f722053657474696e67732055706461746564223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d61646d696e5f6c6f67696e7c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `outcomes` longtext DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `section` longtext DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_flag` int(11) DEFAULT 0,
  `discounted_price` int(11) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `is_top_course` int(11) DEFAULT 0,
  `is_admin` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `course_overview_provider` varchar(255) DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `is_free_course` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`) VALUES
(1, 'Leke', 'ALL', 'Lek', 0, 1),
(2, 'Dollars', 'USD', '$', 1, 1),
(3, 'Afghanis', 'AFN', '؋', 0, 1),
(4, 'Pesos', 'ARS', '$', 0, 1),
(5, 'Guilders', 'AWG', 'ƒ', 0, 1),
(6, 'Dollars', 'AUD', '$', 1, 1),
(7, 'New Manats', 'AZN', 'ман', 0, 1),
(8, 'Dollars', 'BSD', '$', 0, 1),
(9, 'Dollars', 'BBD', '$', 0, 1),
(10, 'Rubles', 'BYR', 'p.', 0, 0),
(11, 'Euro', 'EUR', '€', 1, 1),
(12, 'Dollars', 'BZD', 'BZ$', 0, 1),
(13, 'Dollars', 'BMD', '$', 0, 1),
(14, 'Bolivianos', 'BOB', '$b', 0, 1),
(15, 'Convertible Marka', 'BAM', 'KM', 0, 1),
(16, 'Pula', 'BWP', 'P', 0, 1),
(17, 'Leva', 'BGN', 'лв', 0, 1),
(18, 'Reais', 'BRL', 'R$', 1, 1),
(19, 'Pounds', 'GBP', '£', 1, 1),
(20, 'Dollars', 'BND', '$', 0, 1),
(21, 'Riels', 'KHR', '៛', 0, 1),
(22, 'Dollars', 'CAD', '$', 1, 1),
(23, 'Dollars', 'KYD', '$', 0, 1),
(24, 'Pesos', 'CLP', '$', 0, 1),
(25, 'Yuan Renminbi', 'CNY', '¥', 0, 1),
(26, 'Pesos', 'COP', '$', 0, 1),
(27, 'Colón', 'CRC', '₡', 0, 1),
(28, 'Kuna', 'HRK', 'kn', 0, 1),
(29, 'Pesos', 'CUP', '₱', 0, 0),
(30, 'Koruny', 'CZK', 'Kč', 1, 1),
(31, 'Kroner', 'DKK', 'kr', 1, 1),
(32, 'Pesos', 'DOP ', 'RD$', 0, 1),
(33, 'Dollars', 'XCD', '$', 0, 1),
(34, 'Pounds', 'EGP', '£', 0, 1),
(35, 'Colones', 'SVC', '$', 0, 0),
(36, 'Pounds', 'FKP', '£', 0, 1),
(37, 'Dollars', 'FJD', '$', 0, 1),
(38, 'Cedis', 'GHC', '¢', 0, 0),
(39, 'Pounds', 'GIP', '£', 0, 1),
(40, 'Quetzales', 'GTQ', 'Q', 0, 1),
(41, 'Pounds', 'GGP', '£', 0, 0),
(42, 'Dollars', 'GYD', '$', 0, 1),
(43, 'Lempiras', 'HNL', 'L', 0, 1),
(44, 'Dollars', 'HKD', '$', 1, 1),
(45, 'Forint', 'HUF', 'Ft', 1, 1),
(46, 'Kronur', 'ISK', 'kr', 0, 1),
(47, 'Rupees', 'INR', 'Rp', 0, 1),
(48, 'Rupiahs', 'IDR', 'Rp', 0, 1),
(49, 'Rials', 'IRR', '﷼', 0, 0),
(50, 'Pounds', 'IMP', '£', 0, 0),
(51, 'New Shekels', 'ILS', '₪', 1, 1),
(52, 'Dollars', 'JMD', 'J$', 0, 1),
(53, 'Yen', 'JPY', '¥', 1, 1),
(54, 'Pounds', 'JEP', '£', 0, 0),
(55, 'Tenge', 'KZT', 'лв', 0, 1),
(56, 'Won', 'KPW', '₩', 0, 0),
(57, 'Won', 'KRW', '₩', 0, 1),
(58, 'Soms', 'KGS', 'лв', 0, 1),
(59, 'Kips', 'LAK', '₭', 0, 1),
(60, 'Lati', 'LVL', 'Ls', 0, 0),
(61, 'Pounds', 'LBP', '£', 0, 1),
(62, 'Dollars', 'LRD', '$', 0, 1),
(63, 'Switzerland Francs', 'CHF', 'CHF', 1, 1),
(64, 'Litai', 'LTL', 'Lt', 0, 0),
(65, 'Denars', 'MKD', 'ден', 0, 1),
(66, 'Ringgits', 'MYR', 'RM', 1, 1),
(67, 'Rupees', 'MUR', '₨', 0, 1),
(68, 'Pesos', 'MXN', '$', 1, 1),
(69, 'Tugriks', 'MNT', '₮', 0, 1),
(70, 'Meticais', 'MZN', 'MT', 0, 1),
(71, 'Dollars', 'NAD', '$', 0, 1),
(72, 'Rupees', 'NPR', '₨', 0, 1),
(73, 'Guilders', 'ANG', 'ƒ', 0, 1),
(74, 'Dollars', 'NZD', '$', 1, 1),
(75, 'Cordobas', 'NIO', 'C$', 0, 1),
(76, 'Nairas', 'NGN', '₦', 0, 1),
(77, 'Krone', 'NOK', 'kr', 1, 1),
(78, 'Rials', 'OMR', '﷼', 0, 0),
(79, 'Rupees', 'PKR', '₨', 0, 1),
(80, 'Balboa', 'PAB', 'B/.', 0, 1),
(81, 'Guarani', 'PYG', 'Gs', 0, 1),
(82, 'Nuevos Soles', 'PEN', 'S/.', 0, 1),
(83, 'Pesos', 'PHP', 'Php', 1, 1),
(84, 'Zlotych', 'PLN', 'zł', 1, 1),
(85, 'Rials', 'QAR', '﷼', 0, 1),
(86, 'New Lei', 'RON', 'lei', 0, 1),
(87, 'Rubles', 'RUB', 'руб', 0, 1),
(88, 'Pounds', 'SHP', '£', 0, 1),
(89, 'Riyals', 'SAR', '﷼', 0, 1),
(90, 'Dinars', 'RSD', 'Дин.', 0, 1),
(91, 'Rupees', 'SCR', '₨', 0, 1),
(92, 'Dollars', 'SGD', '$', 1, 1),
(93, 'Dollars', 'SBD', '$', 0, 1),
(94, 'Shillings', 'SOS', 'S', 0, 1),
(95, 'Rand', 'ZAR', 'R', 0, 1),
(96, 'Rupees', 'LKR', '₨', 0, 1),
(97, 'Kronor', 'SEK', 'kr', 1, 1),
(98, 'Dollars', 'SRD', '$', 0, 1),
(99, 'Pounds', 'SYP', '£', 0, 0),
(100, 'New Dollars', 'TWD', 'NT$', 1, 1),
(101, 'Baht', 'THB', '฿', 1, 1),
(102, 'Dollars', 'TTD', 'TT$', 0, 1),
(103, 'Lira', 'TRY', 'TL', 0, 1),
(104, 'Liras', 'TRL', '£', 0, 0),
(105, 'Dollars', 'TVD', '$', 0, 0),
(106, 'Hryvnia', 'UAH', '₴', 0, 1),
(107, 'Pesos', 'UYU', '$U', 0, 1),
(108, 'Sums', 'UZS', 'лв', 0, 1),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', 0, 0),
(110, 'Dong', 'VND', '₫', 0, 1),
(111, 'Rials', 'YER', '﷼', 0, 1),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `enrol`
--

CREATE TABLE `enrol` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`) VALUES
(1, 'banner_title', 'Learn on your schedule'),
(2, 'banner_sub_title', 'Study any topic, anytime. Explore thousands of courses for the lowest price ever!'),
(4, 'about_us', '<p></p><h2>This is about us</h2><p><span xss=\"removed\" xss=removed>Welcome to Academy. It will help you to learn in a new ways</span></p>'),
(10, 'terms_and_condition', '<h2>Terms and Condition</h2>This is the Terms and condition page for your companys'),
(11, 'privacy_policy', '<h2>Privacy Policy</h2>This is the Privacy Policy page for your companys'),
(13, 'theme', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext DEFAULT NULL,
  `english` longtext DEFAULT NULL,
  `Bengali` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `Bengali`) VALUES
(1, 'manage_profile', NULL, NULL),
(140, 'category_code', NULL, NULL),
(3, 'dashboard', NULL, NULL),
(4, 'categories', NULL, NULL),
(5, 'courses', NULL, NULL),
(6, 'students', NULL, NULL),
(7, 'enroll_history', NULL, NULL),
(8, 'message', NULL, NULL),
(9, 'settings', NULL, NULL),
(10, 'system_settings', NULL, NULL),
(11, 'frontend_settings', NULL, NULL),
(12, 'payment_settings', NULL, NULL),
(13, 'manage_language', NULL, NULL),
(14, 'edit_profile', NULL, NULL),
(15, 'log_out', NULL, NULL),
(16, 'first_name', NULL, NULL),
(17, 'last_name', NULL, NULL),
(18, 'email', NULL, NULL),
(19, 'facebook_link', NULL, NULL),
(20, 'twitter_link', NULL, NULL),
(21, 'linkedin_link', NULL, NULL),
(22, 'a_short_title_about_yourself', NULL, NULL),
(23, 'biography', NULL, NULL),
(24, 'photo', NULL, NULL),
(25, 'select_image', NULL, NULL),
(26, 'change', NULL, NULL),
(27, 'remove', NULL, NULL),
(28, 'update_profile', NULL, NULL),
(29, 'change_password', NULL, NULL),
(30, 'current_password', NULL, NULL),
(31, 'new_password', NULL, NULL),
(32, 'confirm_new_password', NULL, NULL),
(33, 'delete', NULL, NULL),
(34, 'cancel', NULL, NULL),
(35, 'are_you_sure_to_update_this_information', NULL, NULL),
(36, 'yes', NULL, NULL),
(37, 'no', NULL, NULL),
(38, 'system settings', NULL, NULL),
(39, 'system_name', NULL, NULL),
(40, 'system_title', NULL, NULL),
(41, 'slogan', NULL, NULL),
(42, 'system_email', NULL, NULL),
(43, 'address', NULL, NULL),
(44, 'phone', NULL, NULL),
(45, 'youtube_api_key', NULL, NULL),
(46, 'get_youtube_api_key', NULL, NULL),
(47, 'vimeo_api_key', NULL, NULL),
(48, 'purchase_code', NULL, NULL),
(49, 'language', NULL, NULL),
(50, 'text-align', NULL, NULL),
(51, 'update_system_settings', NULL, NULL),
(52, 'update_product', NULL, NULL),
(53, 'file', NULL, NULL),
(54, 'install_update', NULL, NULL),
(55, 'system_logo', NULL, NULL),
(56, 'update_logo', NULL, NULL),
(57, 'get_vimeo_api_key', NULL, NULL),
(58, 'add_category', NULL, NULL),
(59, 'category_title', NULL, NULL),
(60, 'sub_categories', NULL, NULL),
(61, 'actions', NULL, NULL),
(62, 'action', NULL, NULL),
(63, 'manage_sub_categories', NULL, NULL),
(64, 'edit', NULL, NULL),
(65, 'add_course', NULL, NULL),
(66, 'select_category', NULL, NULL),
(67, 'title', NULL, NULL),
(68, 'category', NULL, NULL),
(69, '#_section', NULL, NULL),
(70, '#_lesson', NULL, NULL),
(71, '#_enrolled_user', NULL, NULL),
(72, 'view_course_details', NULL, NULL),
(73, 'manage_section', NULL, NULL),
(74, 'manage_lesson', NULL, NULL),
(75, 'student', NULL, NULL),
(76, 'add_student', NULL, NULL),
(77, 'name', NULL, NULL),
(78, 'date_added', NULL, NULL),
(79, 'enrolled_courses', NULL, NULL),
(80, 'view_profile', NULL, NULL),
(81, 'admin_dashboard', NULL, NULL),
(82, 'total_courses', NULL, NULL),
(83, 'number_of_courses', NULL, NULL),
(84, 'total_lessons', NULL, NULL),
(85, 'number_of_lessons', NULL, NULL),
(86, 'total_enrollment', NULL, NULL),
(87, 'number_of_enrollment', NULL, NULL),
(88, 'total_student', NULL, NULL),
(89, 'number_of_student', NULL, NULL),
(90, 'manage_sections', NULL, NULL),
(91, 'manage sections', NULL, NULL),
(92, 'course', NULL, NULL),
(93, 'add_section', NULL, NULL),
(94, 'lessons', NULL, NULL),
(95, 'serialize_sections', NULL, NULL),
(96, 'add_lesson', NULL, NULL),
(97, 'edit_section', NULL, NULL),
(98, 'delete_section', NULL, NULL),
(99, 'course_details', NULL, NULL),
(100, 'course details', NULL, NULL),
(101, 'details', NULL, NULL),
(102, 'instructor', NULL, NULL),
(103, 'sub_category', NULL, NULL),
(104, 'enrolled_user', NULL, NULL),
(105, 'last_modified', NULL, NULL),
(106, 'manage language', NULL, NULL),
(107, 'language_list', NULL, NULL),
(108, 'add_phrase', NULL, NULL),
(109, 'add_language', NULL, NULL),
(110, 'option', NULL, NULL),
(111, 'edit_phrase', NULL, NULL),
(112, 'delete_language', NULL, NULL),
(113, 'phrase', NULL, NULL),
(114, 'value_required', NULL, NULL),
(115, 'frontend settings', NULL, NULL),
(116, 'banner_title', NULL, NULL),
(117, 'banner_sub_title', NULL, NULL),
(118, 'about_us', NULL, NULL),
(119, 'blog', NULL, NULL),
(120, 'update_frontend_settings', NULL, NULL),
(121, 'update_banner', NULL, NULL),
(122, 'banner_image', NULL, NULL),
(123, 'update_banner_image', NULL, NULL),
(124, 'payment settings', NULL, NULL),
(125, 'paypal_settings', NULL, NULL),
(126, 'client_id', NULL, NULL),
(127, 'sandbox', NULL, NULL),
(128, 'production', NULL, NULL),
(129, 'active', NULL, NULL),
(130, 'mode', NULL, NULL),
(131, 'stripe_settings', NULL, NULL),
(132, 'testmode', NULL, NULL),
(133, 'on', NULL, NULL),
(134, 'off', NULL, NULL),
(135, 'test_secret_key', NULL, NULL),
(136, 'test_public_key', NULL, NULL),
(137, 'live_secret_key', NULL, NULL),
(138, 'live_public_key', NULL, NULL),
(139, 'save_changes', NULL, NULL),
(141, 'update_phrase', NULL, NULL),
(142, 'check', NULL, NULL),
(143, 'settings_updated', NULL, NULL),
(144, 'checking', NULL, NULL),
(145, 'phrase_added', NULL, NULL),
(146, 'language_added', NULL, NULL),
(147, 'language_deleted', NULL, NULL),
(148, 'add course', NULL, NULL),
(149, 'add_courses', NULL, NULL),
(150, 'add_course_form', NULL, NULL),
(151, 'basic_info', NULL, NULL),
(152, 'short_description', NULL, NULL),
(153, 'description', NULL, NULL),
(154, 'level', NULL, NULL),
(155, 'beginner', NULL, NULL),
(156, 'advanced', NULL, NULL),
(157, 'intermediate', NULL, NULL),
(158, 'language_made_in', NULL, NULL),
(159, 'is_top_course', NULL, NULL),
(160, 'outcomes', NULL, NULL),
(161, 'category_and_sub_category', NULL, NULL),
(162, 'select_a_category', NULL, NULL),
(163, 'select_a_category_first', NULL, NULL),
(164, 'requirements', NULL, NULL),
(165, 'price_and_discount', NULL, NULL),
(166, 'price', NULL, NULL),
(167, 'has_discount', NULL, NULL),
(168, 'discounted_price', NULL, NULL),
(169, 'course_thumbnail', NULL, NULL),
(170, 'note', NULL, NULL),
(171, 'thumbnail_size_should_be_600_x_600', NULL, NULL),
(172, 'course_overview_url', NULL, NULL),
(173, '0%', NULL, NULL),
(174, 'manage profile', NULL, NULL),
(175, 'edit_course', NULL, NULL),
(176, 'edit course', NULL, NULL),
(177, 'edit_courses', NULL, NULL),
(178, 'edit_course_form', NULL, NULL),
(179, 'update_course', NULL, NULL),
(180, 'course_updated', NULL, NULL),
(181, 'number_of_sections', NULL, NULL),
(182, 'number_of_enrolled_users', NULL, NULL),
(183, 'add section', NULL, NULL),
(184, 'section', NULL, NULL),
(185, 'add_section_form', NULL, NULL),
(186, 'update', NULL, NULL),
(187, 'serialize_section', NULL, NULL),
(188, 'serialize section', NULL, NULL),
(189, 'submit', NULL, NULL),
(190, 'sections_have_been_serialized', NULL, NULL),
(191, 'select_course', NULL, NULL),
(192, 'search', NULL, NULL),
(193, 'thumbnail', NULL, NULL),
(194, 'duration', NULL, NULL),
(195, 'provider', NULL, NULL),
(196, 'add lesson', NULL, NULL),
(197, 'add_lesson_form', NULL, NULL),
(198, 'video_type', NULL, NULL),
(199, 'select_a_course', NULL, NULL),
(200, 'select_a_course_first', NULL, NULL),
(201, 'video_url', NULL, NULL),
(202, 'invalid_url', NULL, NULL),
(203, 'your_video_source_has_to_be_either_youtube_or_vimeo', NULL, NULL),
(204, 'for', NULL, NULL),
(205, 'of', NULL, NULL),
(206, 'edit_lesson', NULL, NULL),
(207, 'edit lesson', NULL, NULL),
(208, 'edit_lesson_form', NULL, NULL),
(209, 'login', NULL, NULL),
(210, 'password', NULL, NULL),
(211, 'forgot_password', NULL, NULL),
(212, 'back_to_website', NULL, NULL),
(213, 'send_mail', NULL, NULL),
(214, 'back_to_login', NULL, NULL),
(215, 'student_add', NULL, NULL),
(216, 'student add', NULL, NULL),
(217, 'add_students', NULL, NULL),
(218, 'student_add_form', NULL, NULL),
(219, 'login_credentials', NULL, NULL),
(220, 'social_information', NULL, NULL),
(221, 'facebook', NULL, NULL),
(222, 'twitter', NULL, NULL),
(223, 'linkedin', NULL, NULL),
(224, 'user_image', NULL, NULL),
(225, 'add_user', NULL, NULL),
(226, 'user_update_successfully', NULL, NULL),
(227, 'user_added_successfully', NULL, NULL),
(228, 'student_edit', NULL, NULL),
(229, 'student edit', NULL, NULL),
(230, 'edit_students', NULL, NULL),
(231, 'student_edit_form', NULL, NULL),
(232, 'update_user', NULL, NULL),
(233, 'enroll history', NULL, NULL),
(234, 'filter', NULL, NULL),
(235, 'user_name', NULL, NULL),
(236, 'enrolled_course', NULL, NULL),
(237, 'enrollment_date', NULL, NULL),
(238, 'biography2', NULL, NULL),
(239, 'home', NULL, NULL),
(240, 'search_for_courses', NULL, NULL),
(241, 'total', NULL, NULL),
(242, 'go_to_cart', NULL, NULL),
(243, 'your_cart_is_empty', NULL, NULL),
(244, 'log_in', NULL, NULL),
(245, 'sign_up', NULL, NULL),
(246, 'what_do_you_want_to_learn', NULL, NULL),
(247, 'online_courses', NULL, NULL),
(248, 'explore_a_variety_of_fresh_topics', NULL, NULL),
(249, 'expert_instruction', NULL, NULL),
(250, 'find_the_right_course_for_you', NULL, NULL),
(251, 'lifetime_access', NULL, NULL),
(252, 'learn_on_your_schedule', NULL, NULL),
(253, 'top_courses', NULL, NULL),
(254, 'last_updater', NULL, NULL),
(255, 'hours', NULL, NULL),
(256, 'add_to_cart', NULL, NULL),
(257, 'top', NULL, NULL),
(258, 'latest_courses', NULL, NULL),
(259, 'added_to_cart', NULL, NULL),
(260, 'admin', NULL, NULL),
(261, 'log_in_to_your_udemy_account', NULL, NULL),
(262, 'by_signing_up_you_agree_to_our', NULL, NULL),
(263, 'terms_of_use', NULL, NULL),
(264, 'and', NULL, NULL),
(265, 'privacy_policy', NULL, NULL),
(266, 'do_not_have_an_account', NULL, NULL),
(267, 'sign_up_and_start_learning', NULL, NULL),
(268, 'check_here_for_exciting_deals_and_personalized_course_recommendations', NULL, NULL),
(269, 'already_have_an_account', NULL, NULL),
(270, 'checkout', NULL, NULL),
(271, 'paypal', NULL, NULL),
(272, 'stripe', NULL, NULL),
(273, 'step', NULL, NULL),
(274, 'how_would_you_rate_this_course_overall', NULL, NULL),
(275, 'write_a_public_review', NULL, NULL),
(276, 'describe_your_experience_what_you_got_out_of_the_course_and_other_helpful_highlights', NULL, NULL),
(277, 'what_did_the_instructor_do_well_and_what_could_use_some_improvement', NULL, NULL),
(278, 'next', NULL, NULL),
(279, 'previous', NULL, NULL),
(280, 'publish', NULL, NULL),
(281, 'search_results', NULL, NULL),
(282, 'ratings', NULL, NULL),
(283, 'search_results_for', NULL, NULL),
(284, 'category_page', NULL, NULL),
(285, 'all', NULL, NULL),
(286, 'category_list', NULL, NULL),
(287, 'by', NULL, NULL),
(288, 'go_to_wishlist', NULL, NULL),
(289, 'hi', NULL, NULL),
(290, 'my_courses', NULL, NULL),
(291, 'my_wishlist', NULL, NULL),
(292, 'my_messages', NULL, NULL),
(293, 'purchase_history', NULL, NULL),
(294, 'user_profile', NULL, NULL),
(295, 'already_purchased', NULL, NULL),
(296, 'all_courses', NULL, NULL),
(297, 'wishlists', NULL, NULL),
(298, 'search_my_courses', NULL, NULL),
(299, 'students_enrolled', NULL, NULL),
(300, 'created_by', NULL, NULL),
(301, 'last_updated', NULL, NULL),
(302, 'what_will_i_learn', NULL, NULL),
(303, 'view_more', NULL, NULL),
(304, 'other_related_courses', NULL, NULL),
(305, 'updated', NULL, NULL),
(306, 'curriculum_for_this_course', NULL, NULL),
(307, 'about_the_instructor', NULL, NULL),
(308, 'reviews', NULL, NULL),
(309, 'student_feedback', NULL, NULL),
(310, 'average_rating', NULL, NULL),
(311, 'preview_this_course', NULL, NULL),
(312, 'includes', NULL, NULL),
(313, 'on_demand_videos', NULL, NULL),
(314, 'full_lifetime_access', NULL, NULL),
(315, 'access_on_mobile_and_tv', NULL, NULL),
(316, 'course_preview', NULL, NULL),
(317, 'instructor_page', NULL, NULL),
(318, 'buy_now', NULL, NULL),
(319, 'shopping_cart', NULL, NULL),
(320, 'courses_in_cart', NULL, NULL),
(321, 'student_name', NULL, NULL),
(322, 'amount_to_pay', NULL, NULL),
(323, 'payment_successfully_done', NULL, NULL),
(324, 'filter_by', NULL, NULL),
(325, 'instructors', NULL, NULL),
(326, 'reset', NULL, NULL),
(327, 'your', NULL, NULL),
(328, 'rating', NULL, NULL),
(329, 'course_detail', NULL, NULL),
(330, 'start_lesson', NULL, NULL),
(331, 'show_full_biography', NULL, NULL),
(332, 'terms_and_condition', NULL, NULL),
(333, 'about', NULL, NULL),
(334, 'terms_&_condition', NULL, NULL),
(335, 'sub categories', NULL, NULL),
(336, 'add_sub_category', NULL, NULL),
(337, 'sub_category_title', NULL, NULL),
(338, 'add sub category', NULL, NULL),
(339, 'add_sub_category_form', NULL, NULL),
(340, 'sub_category_code', NULL, NULL),
(341, 'data_deleted', NULL, NULL),
(342, 'edit_category', NULL, NULL),
(343, 'edit category', NULL, NULL),
(344, 'edit_category_form', NULL, NULL),
(345, 'font', NULL, NULL),
(346, 'awesome class', NULL, NULL),
(347, 'update_category', NULL, NULL),
(348, 'data_updated_successfully', NULL, NULL),
(349, 'edit_sub_category', NULL, NULL),
(350, 'edit sub category', NULL, NULL),
(351, 'sub_category_edit', NULL, NULL),
(352, 'update_sub_category', NULL, NULL),
(353, 'course_added', NULL, NULL),
(354, 'user_deleted_successfully', NULL, NULL),
(355, 'private_messaging', NULL, NULL),
(356, 'private messaging', NULL, NULL),
(357, 'messages', NULL, NULL),
(358, 'select_message_to_read', NULL, NULL),
(359, 'new_message', NULL, NULL),
(360, 'email_duplication', NULL, NULL),
(361, 'your_registration_has_been_successfully_done', NULL, NULL),
(362, 'profile', NULL, NULL),
(363, 'account', NULL, NULL),
(364, 'add_information_about_yourself_to_share_on_your_profile', NULL, NULL),
(365, 'basics', NULL, NULL),
(366, 'add_your_twitter_link', NULL, NULL),
(367, 'add_your_facebook_link', NULL, NULL),
(368, 'add_your_linkedin_link', NULL, NULL),
(369, 'credentials', NULL, NULL),
(370, 'edit_your_account_settings', NULL, NULL),
(371, 'enter_current_password', NULL, NULL),
(372, 'enter_new_password', NULL, NULL),
(373, 're-type_your_password', NULL, NULL),
(374, 'save', NULL, NULL),
(375, 'update_user_photo', NULL, NULL),
(376, 'update_your_photo', NULL, NULL),
(377, 'upload_image', NULL, NULL),
(378, 'updated_successfully', NULL, NULL),
(379, 'invalid_login_credentials', NULL, NULL),
(380, 'blank_page', NULL, NULL),
(381, 'no_section_found', NULL, NULL),
(382, 'select_a_message_thread_to_read_it_here', NULL, NULL),
(383, 'send', NULL, NULL),
(384, 'type_your_message', NULL, NULL),
(385, 'date', NULL, NULL),
(386, 'total_price', NULL, NULL),
(387, 'payment_type', NULL, NULL),
(388, 'edit section', NULL, NULL),
(389, 'edit_section_form', NULL, NULL),
(390, 'reply_message', NULL, NULL),
(391, 'reply', NULL, NULL),
(392, 'log_in_to_your_account', NULL, NULL),
(393, 'no_result_found', NULL, NULL),
(394, 'enrollment', NULL, NULL),
(395, 'enroll_a_student', NULL, NULL),
(396, 'report', NULL, NULL),
(397, 'admin_revenue', NULL, NULL),
(398, 'instructor_revenue', NULL, NULL),
(399, 'instructor_settings', NULL, NULL),
(400, 'view_frontend', NULL, NULL),
(401, 'number_of_active_courses', NULL, NULL),
(402, 'number_of_pending_courses', NULL, NULL),
(403, 'all_instructor', NULL, NULL),
(404, 'active_courses', NULL, NULL),
(405, 'pending_courses', NULL, NULL),
(406, 'no_data_found', NULL, NULL),
(407, 'view_course_on_frontend', NULL, NULL),
(408, 'mark_as_pending', NULL, NULL),
(409, 'add category', NULL, NULL),
(410, 'add_categories', NULL, NULL),
(411, 'category_add_form', NULL, NULL),
(412, 'icon_picker', NULL, NULL),
(413, 'enroll a student', NULL, NULL),
(414, 'enrollment_form', NULL, NULL),
(415, 'admin revenue', NULL, NULL),
(416, 'total_amount', NULL, NULL),
(417, 'instructor revenue', NULL, NULL),
(418, 'status', NULL, NULL),
(419, 'instructor settings', NULL, NULL),
(420, 'allow_public_instructor', NULL, NULL),
(421, 'instructor_revenue_percentage', NULL, NULL),
(422, 'admin_revenue_percentage', NULL, NULL),
(423, 'update_instructor_settings', NULL, NULL),
(424, 'payment_info', NULL, NULL),
(425, 'required_for_instructors', NULL, NULL),
(426, 'paypal_client_id', NULL, NULL),
(427, 'stripe_public_key', NULL, NULL),
(428, 'stripe_secret_key', NULL, NULL),
(429, 'mark_as_active', NULL, NULL),
(430, 'mail_subject', NULL, NULL),
(431, 'mail_body', NULL, NULL),
(432, 'paid', NULL, NULL),
(433, 'pending', NULL, NULL),
(434, 'this_instructor_has_not_provided_valid_paypal_client_id', NULL, NULL),
(435, 'pay_with_paypal', NULL, NULL),
(436, 'this_instructor_has_not_provided_valid_public_key_or_secret_key', NULL, NULL),
(437, 'pay_with_stripe', NULL, NULL),
(438, 'create_course', NULL, NULL),
(439, 'payment_report', NULL, NULL),
(440, 'instructor_dashboard', NULL, NULL),
(441, 'draft', NULL, NULL),
(442, 'view_lessons', NULL, NULL),
(443, 'course_title', NULL, NULL),
(444, 'update_your_payment_settings', NULL, NULL),
(445, 'edit_course_detail', NULL, NULL),
(446, 'edit_basic_informations', NULL, NULL),
(447, 'publish_this_course', NULL, NULL),
(448, 'save_to_draft', NULL, NULL),
(449, 'update_section', NULL, NULL),
(450, 'analyzing_given_url', NULL, NULL),
(451, 'select_a_section', NULL, NULL),
(452, 'update_lesson', NULL, NULL),
(453, 'website_name', NULL, NULL),
(454, 'website_title', NULL, NULL),
(455, 'website_keywords', NULL, NULL),
(456, 'website_description', NULL, NULL),
(457, 'author', NULL, NULL),
(458, 'footer_text', NULL, NULL),
(459, 'footer_link', NULL, NULL),
(460, 'update_backend_logo', NULL, NULL),
(461, 'update_favicon', NULL, NULL),
(462, 'favicon', NULL, NULL),
(463, 'active courses', NULL, NULL),
(464, 'product_updated_successfully', NULL, NULL),
(465, 'course_overview_provider', NULL, NULL),
(466, 'youtube', NULL, NULL),
(467, 'vimeo', NULL, NULL),
(468, 'html5', NULL, NULL),
(469, 'meta_keywords', NULL, NULL),
(470, 'meta_description', NULL, NULL),
(471, 'lesson_type', NULL, NULL),
(472, 'video', NULL, NULL),
(473, 'select_type_of_lesson', NULL, NULL),
(474, 'text_file', NULL, NULL),
(475, 'pdf_file', NULL, NULL),
(476, 'document_file', NULL, NULL),
(477, 'image_file', NULL, NULL),
(478, 'lesson_provider', NULL, NULL),
(479, 'select_lesson_provider', NULL, NULL),
(480, 'analyzing_the_url', NULL, NULL),
(481, 'attachment', NULL, NULL),
(482, 'summary', NULL, NULL),
(483, 'download', NULL, NULL),
(484, 'system_settings_updated', NULL, NULL),
(485, 'course_updated_successfully', NULL, NULL),
(486, 'please_wait_untill_admin_approves_it', NULL, NULL),
(487, 'pending courses', NULL, NULL),
(488, 'course_status_updated', NULL, NULL),
(489, 'smtp_settings', NULL, NULL),
(490, 'free_course', NULL, NULL),
(491, 'free', NULL, NULL),
(492, 'get_enrolled', NULL, NULL),
(493, 'course_added_successfully', NULL, NULL),
(494, 'update_frontend_logo', NULL, NULL),
(495, 'system_currency_settings', NULL, NULL),
(496, 'select_system_currency', NULL, NULL),
(497, 'currency_position', NULL, NULL),
(498, 'left', NULL, NULL),
(499, 'right', NULL, NULL),
(500, 'left_with_a_space', NULL, NULL),
(501, 'right_with_a_space', NULL, NULL),
(502, 'paypal_currency', NULL, NULL),
(503, 'select_paypal_currency', NULL, NULL),
(504, 'stripe_currency', NULL, NULL),
(505, 'select_stripe_currency', NULL, NULL),
(506, 'heads_up', NULL, NULL),
(507, 'please_make_sure_that', NULL, NULL),
(508, 'system_currency', NULL, NULL),
(509, 'are_same', NULL, NULL),
(510, 'smtp settings', NULL, NULL),
(511, 'protocol', NULL, NULL),
(512, 'smtp_host', NULL, NULL),
(513, 'smtp_port', NULL, NULL),
(514, 'smtp_user', NULL, NULL),
(515, 'smtp_pass', NULL, NULL),
(516, 'update_smtp_settings', NULL, NULL),
(517, 'phrase_updated', NULL, NULL),
(518, 'registered_user', NULL, NULL),
(519, 'provide_your_valid_login_credentials', NULL, NULL),
(520, 'registration_form', NULL, NULL),
(521, 'provide_your_email_address_to_get_password', NULL, NULL),
(522, 'reset_password', NULL, NULL),
(523, 'want_to_go_back', NULL, NULL),
(524, 'message_sent!', NULL, NULL),
(525, 'selected_icon', NULL, NULL),
(526, 'pick_another_icon_picker', NULL, NULL),
(527, 'show_more', NULL, NULL),
(528, 'show_less', NULL, NULL),
(529, 'all_category', NULL, NULL),
(530, 'price_range', NULL, NULL),
(531, 'price_range_withing', NULL, NULL),
(532, 'all_categories', NULL, NULL),
(533, 'all_sub_category', NULL, NULL),
(534, 'number_of_results', NULL, NULL),
(535, 'showing_on_this_page', NULL, NULL),
(536, 'welcome', NULL, NULL),
(537, 'my_account', NULL, NULL),
(538, 'logout', NULL, NULL),
(539, 'visit_website', NULL, NULL),
(540, 'navigation', NULL, NULL),
(541, 'add_new_category', NULL, NULL),
(542, 'enrolment', NULL, NULL),
(543, 'enrol_history', NULL, NULL),
(544, 'enrol_a_student', NULL, NULL),
(545, 'language_settings', NULL, NULL),
(546, 'congratulations', NULL, NULL),
(547, 'oh_snap', NULL, NULL),
(548, 'close', NULL, NULL),
(549, 'parent', NULL, NULL),
(550, 'none', NULL, NULL),
(551, 'category_thumbnail', NULL, NULL),
(552, 'the_image_size_should_be', NULL, NULL),
(553, 'choose_thumbnail', NULL, NULL),
(554, 'data_added_successfully', NULL, NULL),
(555, '', NULL, NULL),
(556, 'update_category_form', NULL, NULL),
(557, 'student_list', NULL, NULL),
(558, 'choose_user_image', NULL, NULL),
(559, 'finish', NULL, NULL),
(560, 'thank_you', NULL, NULL),
(561, 'you_are_almost_there', NULL, NULL),
(562, 'you_are_just_one_click_away', NULL, NULL),
(563, 'country', NULL, NULL),
(564, 'website_settings', NULL, NULL),
(565, 'write_down_facebook_url', NULL, NULL),
(566, 'write_down_twitter_url', NULL, NULL),
(567, 'write_down_linkedin_url', NULL, NULL),
(568, 'google_link', NULL, NULL),
(569, 'write_down_google_url', NULL, NULL),
(570, 'instagram_link', NULL, NULL),
(571, 'write_down_instagram_url', NULL, NULL),
(572, 'pinterest_link', NULL, NULL),
(573, 'write_down_pinterest_url', NULL, NULL),
(574, 'update_settings', NULL, NULL),
(575, 'upload_banner_image', NULL, NULL),
(576, 'update_light_logo', NULL, NULL),
(577, 'upload_light_logo', NULL, NULL),
(578, 'update_dark_logo', NULL, NULL),
(579, 'upload_dark_logo', NULL, NULL),
(580, 'update_small_logo', NULL, NULL),
(581, 'upload_small_logo', NULL, NULL),
(582, 'upload_favicon', NULL, NULL),
(583, 'logo_updated', NULL, NULL),
(584, 'favicon_updated', NULL, NULL),
(585, 'banner_image_update', NULL, NULL),
(586, 'frontend_settings_updated', NULL, NULL),
(587, 'setup_payment_informations', NULL, NULL),
(588, 'update_system_currency', NULL, NULL),
(589, 'setup_paypal_settings', NULL, NULL),
(590, 'update_paypal_keys', NULL, NULL),
(591, 'setup_stripe_settings', NULL, NULL),
(592, 'test_mode', NULL, NULL),
(593, 'update_stripe_keys', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `sender` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext DEFAULT NULL,
  `sender` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `last_message_timestamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) DEFAULT NULL,
  `instructor_revenue` varchar(255) DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number_of_options` int(11) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `correct_answers` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) UNSIGNED NOT NULL,
  `rating` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ratable_id` int(11) DEFAULT NULL,
  `ratable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `review` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `date_added`, `last_modified`) VALUES
(1, 'Admin', 1234567890, 1234567890),
(2, 'User', 1234567890, 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'language', 'english'),
(2, 'system_name', 'Learning Management System Online'),
(3, 'system_title', 'Learning Management System Online'),
(4, 'system_email', 'admin@example.com'),
(5, 'address', 'Learning Management System Online'),
(6, 'phone', '09024056004'),
(7, 'purchase_code', 'your-purchase-code'),
(8, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R\",\"production_client_id\":\"1234\"}]'),
(9, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"pk_test_c6VvBEbwHFdulFZ62q1IQrar\",\"secret_key\":\"sk_test_9IMkiM6Ykxr1LCe2dJ3PgaxS\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}]'),
(10, 'youtube_api_key', 'AIzaSyBBJrcS7AhGd1Cgd6GKH3G5aUUj9L9NrFQ'),
(11, 'vimeo_api_key', '39258384b69994dba483c10286825b5c'),
(12, 'slogan', 'A course based video CMS'),
(13, 'text_align', NULL),
(14, 'allow_instructor', '1'),
(15, 'instructor_revenue', '60'),
(16, 'system_currency', 'NGN'),
(17, 'paypal_currency', 'USD'),
(18, 'stripe_currency', 'USD'),
(19, 'author', 'Learning Management System Online'),
(20, 'currency_position', 'left'),
(21, 'website_description', 'Nice application'),
(22, 'website_keywords', 'LMS,Learning Management System,Creativeitem,demo,hello,How are you'),
(23, 'footer_text', NULL),
(24, 'footer_link', 'http://lms.com/'),
(25, 'protocol', 'smtp'),
(26, 'smtp_host', 'ssl://smtp.googlemail.com'),
(27, 'smtp_port', '465'),
(28, 'smtp_user', ''),
(29, 'smtp_pass', ''),
(30, 'version', '2.0.1'),
(31, 'student_email_verification', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tagable_id` int(11) DEFAULT NULL,
  `tagable_type` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `social_links` longtext DEFAULT NULL,
  `biography` longtext DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `watch_history` longtext DEFAULT NULL,
  `wishlist` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `paypal_keys` longtext DEFAULT NULL,
  `stripe_keys` longtext DEFAULT NULL,
  `verification_code` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `social_links`, `biography`, `role_id`, `date_added`, `last_modified`, `watch_history`, `wishlist`, `title`, `paypal_keys`, `stripe_keys`, `verification_code`, `status`) VALUES
(1, 'Abiodun', 'ADEDAPO', 'admin@example.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/abiodun.adedapo.127\",\"twitter\":\"https:\\/\\/x.com\\/AbeyjoeAbiodun\",\"linkedin\":\"https:\\/\\/www.instagram.com\\/adedapo_abiodun\\/\"}', 'I\'m Abeyjoe, a professional designer dedicated to crafting dynamic websites and custom web solutions', 1, NULL, 1740146789, NULL, NULL, 'I&#039;m a Software Enginer', '[{\"production_client_id\":null}]', '[{\"public_live_key\":null,\"secret_live_key\":null}]', NULL, 1),
(2, 'Daniel', 'Ola', 'daniel@gmail.com', '3d0f3b9ddcacec30c4008c5e030e6c13a478cb4f', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', NULL, 2, 1740147724, NULL, '[]', '[]', NULL, '[{\"production_client_id\":\"\"}]', '[{\"public_live_key\":\"\",\"secret_live_key\":\"\"}]', '30b4b5d57a564c0a90e319961a824b41', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrol`
--
ALTER TABLE `enrol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `enrol`
--
ALTER TABLE `enrol`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=594;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `ecom`
--
CREATE DATABASE IF NOT EXISTS `ecom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecom`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(200) NOT NULL,
  `author` varchar(25) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `title` varchar(80) NOT NULL,
  `price` int(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `author`, `keywords`, `title`, `price`, `image`, `description`, `category`) VALUES
(11, 'Margaret Mitchell ', 'gone, wind, margaret, mitchell', 'Gone With The Wind', 550, 'gonewithwind.jpg', '<p><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Since its original publication in 1936,&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Gone With the Wind</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&mdash;winner of the Pulitzer Prize and one of the bestselling novels of all time&mdash;has been heralded by readers everywhere as The Great American Novel.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Widely considered The Great American Novel, and often remembered for its epic film version,&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Gone With the Wind</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;explores the depth of human passions with an intensity as bold as its setting in the red hills of Georgia. A superb piece of storytelling, it vividly depicts the drama of the Civil War and Reconstruction.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">This is the tale of Scarlett O&rsquo;Hara, the spoiled, manipulative daughter of a wealthy plantation owner, who arrives at young womanhood just in time to see the Civil War forever change her way of life. A sweeping story of tangled passion and courage, in the pages of&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Gone With the Wind</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">, Margaret Mitchell brings to life the unforgettable characters that have captured readers for over seventy years.</span></p>', 'Romance'),
(17, 'Stephen King', 'Stephen, king, it', 'It', 320, 'it.jpg', '<p><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Soon to be a major motion picture&mdash;Stephen King&rsquo;s terrifying, classic #1&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">New York Times</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;bestseller, &ldquo;a landmark in American literature&rdquo; (</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Chicago Sun-Times</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">)&mdash;about seven adults who return to their hometown to confront a nightmare they had first stumbled on as teenagers&hellip;an evil without a name:&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">It</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Welcome to Derry, Maine. It&rsquo;s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But the promise they made twenty-eight years ago calls them reunite in the same place where, as teenagers, they battled an evil creature that preyed on the city&rsquo;s children. Now, children are being murdered again and their repressed memories of that terrifying summer return as they prepare to once again battle the monster lurking in Derry&rsquo;s sewers.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Readers of Stephen King know that Derry, Maine, is a place with a deep, dark hold on the author. It reappears in many of his books, including&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Bag of Bones</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">,&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Hearts in Atlantis</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">, and&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">11/22/63</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">. But it all starts with&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">It</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&ldquo;Stephen King&rsquo;s most mature work&rdquo; (</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">St. Petersburg Times</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">), &ldquo;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">It&nbsp;</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">will overwhelm you&hellip; to be read in a well-lit room only&rdquo; (</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Los Angeles Times</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">).</span></p>', 'Horror'),
(18, 'E L James', 'James, fifty, shades, grey', 'Fifty Shades Of Grey', 250, 'fiftyshades.jpg', '<p><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who is beautiful, brilliant, and intimidating. The unworldly, innocent Ana is startled to realize she wants this man and, despite his enigmatic reserve, finds she is desperate to get close to him. Unable to resist Ana&rsquo;s quiet beauty, wit, and independent spirit, Grey admits he wants her, too&mdash;but on his own terms.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Shocked yet thrilled by Grey&rsquo;s singular erotic tastes, Ana hesitates. For all the trappings of success&mdash;his multinational businesses, his vast wealth, his loving family&mdash;Grey is a man tormented by demons and consumed by the need to control. When the couple embarks on a daring, passionately physical affair, Ana discovers Christian Grey&rsquo;s secrets and explores her own dark desires.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">This book is intended for mature audiences.</span></p>', 'Romance'),
(19, ' John Grisham', 'Whistler,  John, Grisham', 'The Whistler', 280, 'the whistler.jpg', '<p><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">We expect our judges to be honest and wise.&nbsp;Their integrity and impartiality are the bedrock of the entire judicial system. We trust them to ensure fair trials, to protect the rights of all litigants, to punish those who do wrong, and to oversee the orderly and efficient flow of justice.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp; &nbsp;But what happens when a judge bends the law or takes a bribe?&nbsp;It&rsquo;s rare, but it happens.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp; &nbsp;Lacy Stoltz is an investigator for the Florida Board on Judicial Conduct. She is a lawyer, not a cop, and it is her job to respond to complaints dealing with judicial misconduct. After nine years with the Board, she knows that most problems are caused by incompetence, not corruption.&nbsp;</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp; &nbsp;But a corruption case eventually crosses her desk.&nbsp;A previously disbarred lawyer is back in business with a new identity. He now goes by the name Greg Myers, and he claims to know of a Florida judge who has stolen more money than all other crooked judges combined. And not just crooked judges in Florida.&nbsp;All judges, from all states, and throughout U.S. history.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp; &nbsp;What&rsquo;s the source of the ill-gotten gains? It seems the judge was secretly involved with the construction of a large casino on Native American land. The Coast Mafia financed the casino and is now helping itself to a sizable skim of each month&rsquo;s cash. The judge is getting a cut and looking the other way.&nbsp;It&rsquo;s a sweet deal: Everyone is making money.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp; &nbsp;But now Greg wants to put a stop to it. His only client is a person who knows the truth and wants to blow the whistle and collect millions under Florida law.&nbsp;Greg files a complaint with the Board on Judicial Conduct, and the case is assigned to Lacy Stoltz, who immediately suspects that this one could be dangerous.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp; &nbsp; &nbsp;Dangerous is one thing.&nbsp;Deadly is something else.</span></p>', 'Horror'),
(20, ' Sir Arthur Conan Doyle', ' Arthur, Conan, Doyle, Sherlock, Holmes', 'Sherlock Holmes', 600, 'sherlock.jpg', '<p><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Since his first appearance in&nbsp;</span><em style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Beeton&rsquo;s Christmas Annual</em><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;in 1887, Sir Arthur Conan Doyle&rsquo;s Sherlock Holmes has been one of the most beloved fictional characters ever created. Now, in two paperback volumes, Bantam presents all fifty-six short stories and four novels featuring Conan Doyle&rsquo;s classic hero--a truly complete collection of Sherlock Holmes&rsquo;s adventures in crime!</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Volume I includes the early novel&nbsp;</span><strong style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">A Study in Scarlet</strong><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">, which introduced the eccentric genius of Sherlock Holmes to the world. This baffling murder mystery, with the cryptic word Rache written in blood, first brought Holmes together with Dr. John Watson. Next,&nbsp;</span><strong style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">The Sign of Four</strong><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;presents Holmes&rsquo;s famous &ldquo;seven percent solution&rdquo; and the strange puzzle of Mary Morstan in the quintessential locked-room mystery.&nbsp;</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Also included are Holmes&rsquo;s feats of extraordinary detection in such famous cases as the chilling&nbsp;</span><strong style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&ldquo; The Adventure of the Speckled Band,&rdquo;</strong><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;the baffling riddle of&nbsp;</span><strong style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&ldquo;The Musgrave Ritual,&rdquo;</strong><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;and the ingeniously plotted&nbsp;</span><strong style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&ldquo;The Five Orange Pips,&rdquo;</strong><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">&nbsp;tales that bring to life a Victorian England of horse-drawn cabs, fogs, and the famous lodgings at 221B Baker Street, where Sherlock Holmes earned his undisputed reputation as the greatest fictional detective of all time.</span></p>', 'Mystery'),
(21, ' J.K. Rowling', 'Harry, Potter,Cursed, Child J.K., Rowling, ', 'Harry Potter and the Cursed Child', 460, 'hpcc.jpg', '<p><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">Based on an original new story by J.K. Rowling, John Tiffany and Jack Thorne, a new play by Jack Thorne, Harry Potter and the Cursed Child is the eighth story in the Harry Potter series and the first official Harry Potter story to be presented on stage. The play received its world premiere in London&rsquo;s West End on 30th July 2016.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">It was always difficult being Harry Potter and it isn&rsquo;t much easier now that he is an overworked employee of the Ministry of Magic, a husband and father of three school-age children.</span><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><br style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\" /><span style=\"color: #333333; font-family: Arial, sans-serif; font-size: 14px;\">While Harry grapples with a past that refuses to stay where it belongs, his youngest son Albus must struggle with the weight of a family legacy he never wanted. As past and present fuse ominously, both father and son learn the uncomfortable truth: sometimes, darkness comes from unexpected places.</span></p>', 'Science Fiction'),
(23, 'Timothy Zahn', 'Timothy, Zahn, Thrawn, star, war ', 'Thrawn (Star Wars)', 550, 'starwar.jpg', '<p>This is the most famous novel .this book needs no introduction.</p>\r\n<p>The Star Wars legacy with a deep look at Thrawn</p>', 'Science Fiction'),
(24, 'Half GirlFriend', 'Half, Girl,Friend, Chetan, Bhagat', 'Half Girlfriend', 300, 'half gf.jpg', '<p>Half Girlfriend is a story of Bihari boy Madhav whofalls in love with Ria.</p>\n<p>Madhav belongs to middle class family while Ria is from higher class and both have different lifestyles.</p>\n<p>The story revolves around how will Madhav make RIa fall in love with him to.</p>\n<p>To know more read the book.</p>', 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `bookid` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`name`) VALUES
('Drama'),
('Horror'),
('Mystery'),
('Romance'),
('Science Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(200) NOT NULL,
  `cust_ip` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(80) NOT NULL,
  `phone` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_ip`, `name`, `email`, `password`, `phone`) VALUES
(11, '::1', 'priyesh patel', 'safal.priyesh@gmail.com', '12341234', 9757104581),
(12, '::1', 'Krish Parekh', 'kp@gmail.com', '10101010', 9898989863),
(13, '::1', 'Abbey', 'abbey@gmail.com', 'qwertyui', 9022446688);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD UNIQUE KEY `bookid_2` (`bookid`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `cat` FOREIGN KEY (`category`) REFERENCES `category` (`name`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `bfk` FOREIGN KEY (`bookid`) REFERENCES `books` (`book_id`);
--
-- Database: `ecom_store`
--
CREATE DATABASE IF NOT EXISTS `ecom_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecom_store`;

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(10) NOT NULL,
  `about_heading` text NOT NULL,
  `about_short_desc` text NOT NULL,
  `about_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_id`, `about_heading`, `about_short_desc`, `about_desc`) VALUES
(1, 'About Us - Our Story', '\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n', 'Rhone was the collective vision of a small group of weekday warriors. For years, we were frustrated by the lack of activewear designed for men and wanted something better. With that in mind, we set out to design premium apparel that is made for motion and engineered to endure.\r\n\r\nAdvanced materials and state of the art technology are combined with heritage craftsmanship to create a new standard in activewear. Every product tells a story of premium performance, reminding its wearer to push themselves physically without having to sacrifice comfort and style.\r\n\r\nBeyond our product offering, Rhone is founded on principles of progress and integrity. Just as we aim to become better as a company, we invite men everywhere to raise the bar and join us as we move Forever Forward.');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_country` text NOT NULL,
  `admin_job` varchar(255) NOT NULL,
  `admin_about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(2, 'Administrator', 'admin@gmail.com', 'admin123', 'user-profile-min.png', '09024056004', 'Nigeria', 'Software Engineer', 'Results-driven Software Engineer with 7+ years of experience designing, developing, and maintaining scalable web applications in fast-paced e-commerce environments. Strong expertise in full-stack development, with a focus on creating high-performance, user-friendly shopping experiences that drive customer engagement and sales. Proficient in technologies such as PHP, JavaScript, MySQL, and modern frameworks (Laravel, React, Node.js), with a deep understanding of e-commerce workflows including shopping carts, payment integrations, product catalog management, and order processing.\r\n\r\nSkilled in collaborating with cross-functional teams (design, marketing, product) to deliver reliable, secure, and SEO-optimized solutions. Passionate about clean code, agile development, and continuously improving user experience and system performance.\r\nPortfolio: abeyjoe.netlify.app');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_product_relation`
--

CREATE TABLE `bundle_product_relation` (
  `rel_id` int(10) NOT NULL,
  `rel_title` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `bundle_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `p_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`, `p_price`, `size`) VALUES
(9, '::1', 2, '3500', 'Select a Size');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_top` text NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(2, 'Feminine', 'no', 'feminelg.png'),
(3, 'Kids', 'no', 'kidslg.jpg'),
(4, 'Others', 'yes', 'othericon.png'),
(5, 'Men', 'yes', 'malelg.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(10) NOT NULL,
  `contact_email` text NOT NULL,
  `contact_heading` text NOT NULL,
  `contact_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_email`, `contact_heading`, `contact_desc`) VALUES
(1, 'ecomstore@mail.com', 'Contact  To Us', 'If you have any questions, please feel free to contact us, our customer service center is working for you 24/7.');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(100) NOT NULL,
  `coupon_used` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(1, 13, 'AUGUST', '500', 'AUGUST ', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL,
  `customer_confirm_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`) VALUES
(1, 'Abiodun Adedapo', 'abeyjoe18@gmail.com', '12345678', 'Nigeria', 'Lagos', '09024056004', 'Ajah', 'close-up-man-working-computer-chips.jpg', '::1', '1918558851');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(1, 1, 2000, 200175609, 1, 'Medium', '2025-08-16 21:09:56', 'Complete'),
(2, 1, 90, 1961366845, 1, 'Large', '2025-08-16 21:08:50', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_types`
--

CREATE TABLE `enquiry_types` (
  `enquiry_id` int(10) NOT NULL,
  `enquiry_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `enquiry_types`
--

INSERT INTO `enquiry_types` (`enquiry_id`, `enquiry_title`) VALUES
(1, 'Order and Delivery Support'),
(2, 'Technical Support'),
(3, 'Price Concern');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) NOT NULL,
  `manufacturer_title` text NOT NULL,
  `manufacturer_top` text NOT NULL,
  `manufacturer_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_title`, `manufacturer_top`, `manufacturer_image`) VALUES
(2, 'Adidas', 'no', 'adilg.png'),
(3, 'Nike', 'no', 'niketransl.png'),
(4, 'Philip Plein', 'no', 'pplg.png'),
(5, 'Lacoste', 'no', 'lacostelg.png'),
(7, 'Polo', 'no', 'polobn.jpg'),
(8, 'Gildan 1800', 'no', 'sample_img360.png');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(1, 2147483647, 2000, 'Bank Code', 3, 709466, '2024-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(1, 1, 200175609, '13', 1, 'Medium', 'Complete'),
(2, 1, 1961366845, '13', 1, 'Large', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_url` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_psp_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_features` text NOT NULL,
  `product_video` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_label` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `manufacturer_id`, `date`, `product_title`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_psp_price`, `product_desc`, `product_features`, `product_video`, `product_keywords`, `product_label`, `status`) VALUES
(5, 7, 5, 5, '2025-08-16 20:50:35', 'Denim Borg Lined Western Jacket', 'product-url-5', 'Next-Denim-Borg-Lined-Western-Jacket-0463-0064553-1-pdp_slider_l.jpg', 'Next-Denim-Borg-Lined-Western-Jacket-0463-0064553-2-pdp_slider_l.jpg', 'Next-Denim-Borg-Lined-Western-Jacket-0465-0064553-3-pdp_slider_l.jpg', 25900, 10000, '\r\n\r\n\r\n<p>This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description.</p>\r\n\r\n\r\n', '\r\n\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n\r\n\r\n', '\r\n\r\n\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n\r\n\r\n', 'Jackets', 'Gift', 'product'),
(8, 4, 2, 4, '2025-08-16 20:50:51', 'Sleeveless Flaux Fur Hybrid Coat', 'product-url-8', 'Black Blouse Versace Coat1.jpg', 'Black Blouse Versace Coat2.jpg', 'Black Blouse Versace Coat3.jpg', 24500, 10000, '\r\n\r\n\r\n\r\n\r\n<p>This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. </p>\r\n\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n\r\n\r\n\r\n\r\n', 'Coats', 'New', 'product'),
(9, 5, 4, 7, '2025-08-16 20:51:04', 'Long Sleeves Polo Shirt for Men', 'product-url-9', 'product-1.jpg', 'product-2.jpg', 'product-3.jpg', 5000, 3500, '\r\n\r\n\r\n\r\n\r\n\r\n<p>This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description. This is a sample product description.</p>\r\n\r\n\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,\r\n\r\n\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n\r\n<iframe width=\"854\" height=\"480\" src=\"https://www.youtube.com/embed/qRswlmADRa8\" frameborder=\"0\" allowfullscreen></iframe>\r\n\r\n\r\n\r\n\r\n\r\n', 'T-Shirt', 'Sale', 'product'),
(12, 8, 5, 2, '2025-08-16 20:51:21', 'Ultraboost 21 PrimeBlue Shoes', 'ultraboost-21-adidas', 'Ultraboost_21.jpg', 'Ultraboost_21_2.jpg', 'Ultraboost_21_3.jpg', 15000, 18000, '\r\n\r\n\r\n\r\n\r\n\r\nThis product is made with Primeblue, a high-performance recycled material made in part with Parley Ocean Plastic. 50% of the upper is textile, 92% of the textile is Primeblue yarn. No virgin polyester. \r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n\r\nComfortable and responsive, Ultraboost became our first shoe to be as popular in streetwear style as it is in performance running.\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\nhttps://assets.adidas.com/videos/q_auto,f_auto,g_auto/599fff35a3cf432aa9bbac7c0091316f_d98c/Ultraboost_21_Primeblue_Shoes_Blue_FX7729_video.mp4\r\n\r\n\r\n\r\n\r\n', 'Sneakers adidas ultraboost shoes', 'New', 'product'),
(13, 9, 2, 3, '2025-08-16 20:51:34', 'Nike Sportswear Essential Collection', 'Nike-sportswear-essen-col', 'nike-s.jpg', 'nike-s2.jpg', 'nike-s02.jpg', 9000, 8500, '\r\n\r\n\r\n\r\n\r\nThis is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text. This is a sample text.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n\r\nThis is a sample text. This is a sample text. This is a sample text.This is a sample text. This is a sample text. This is a sample text.This is a sample text. This is a sample text. This is a sample text.This is a sample text. This is a sample text. This is a sample text.\r\n\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n\r\nThis is a sample text. This is a sample text. This is a sample text.\r\n\r\n\r\n\r\n\r\n\r\n', 'Nike sportswear', 'Featured', 'product'),
(15, 5, 5, 8, '2025-08-16 20:53:28', 'Gildan 1800 Ultra Cotton Polo Shirt', 'cotton-polo-shirt', 'g18bulk.jpg', 'g18bulk2.jpg', 'g18bulk3.jpg', 8800, 7500, '\r\n\r\n\r\nTHIS IS A DEMO DESCRIPTION \r\n\r\n\r\n', '\r\n\r\n\r\n\r\nDEMO FEATURES\r\n\r\n\r\n\r\n', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'polo shirt', 'Sale', 'bundle');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_top` text NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(4, 'Coats', 'no', 'coaticn.png'),
(5, 'T-Shirts', 'no', 'tshirticn.png'),
(6, 'Sweater', 'no', 'sweatericn.png'),
(7, 'Jackets', 'yes', 'jacketicn.png'),
(8, 'Sneakers', 'yes', 'sneakericn.png'),
(9, 'Trousers', 'no', 'trousericn.png');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(10) NOT NULL,
  `store_title` varchar(255) NOT NULL,
  `store_image` varchar(255) NOT NULL,
  `store_desc` text NOT NULL,
  `store_button` varchar(255) NOT NULL,
  `store_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_title`, `store_image`, `store_desc`, `store_button`, `store_url`) VALUES
(4, 'Lagos Store', 'store (3).jpg', '<p style=\"text-align: center;\"><strong>180-182 RECENTS STREET, LONDON, W1B 5BT</strong></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut libero erat, aliquet eget mauris ut, dictum sagittis libero. Nam at dui dapibus, semper dolor ac, malesuada mi. Duis quis lobortis arcu. Vivamus sed sodales orci, non varius dolor.</p>', 'View Map', 'http://www.thedailylux.com/ecommerce'),
(5, 'Ibadan Store', 'store (1).png', '<p style=\"text-align: center;\"><strong>109 COLUMBUS CIRCLE, NEW YORK, NY10023</strong></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut libero erat, aliquet eget mauris ut, dictum sagittis libero. Nam at dui dapibus, semper dolor ac, malesuada mi. Duis quis lobortis arcu. Vivamus sed sodales orci, non varius dolor.</p>', 'View Map', 'http://www.thedailylux.com/ecommerce'),
(6, 'Abuja Store', 'store (2).jpg', '<p style=\"text-align: center;\"><strong>2133 RUE SAINT-HONORE, 75001 PARIS&nbsp;</strong></p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut libero erat, aliquet eget mauris ut, dictum sagittis libero. Nam at dui dapibus, semper dolor ac, malesuada mi. Duis quis lobortis arcu. Vivamus sed sodales orci, non varius dolor.</p>', 'View Map', 'http://www.thedailylux.com/ecommerce');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(100) NOT NULL,
  `term_link` varchar(100) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(1, 'Rules And Regulations', 'rules', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.&nbsp;</p>'),
(2, 'Refund Policy', 'link2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on'),
(3, 'Pricing and Promotions Policy', 'link3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`) VALUES
(1, 1, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  MODIFY `rel_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  MODIFY `enquiry_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `hms`
--
CREATE DATABASE IF NOT EXISTS `hms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hms`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `employeeid` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`employeeid`, `password`) VALUES
('54672', '19MIS0240');

-- --------------------------------------------------------

--
-- Table structure for table `leaverequests`
--

CREATE TABLE `leaverequests` (
  `name` varchar(100) NOT NULL,
  `regno` varchar(100) NOT NULL,
  `block` varchar(100) NOT NULL,
  `roomno` varchar(100) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `reason` varchar(250) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(100) NOT NULL,
  `regno` varchar(9) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(100) NOT NULL,
  `password` varchar(16) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `block` varchar(100) DEFAULT NULL,
  `roomno` int(10) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `regno`, `email`, `phoneno`, `password`, `gender`, `block`, `roomno`) VALUES
('karthik', '19MIS0240', 'dasarikarthik559@gmail.com', '8885190228', 'BDs4922251@', 'male', 'Kblock', 1),
('divya', '19MIS0241', 'divya@gmail.com', '6305415082', 'BDs4922251@', 'female', 'Qblock', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`regno`);
--
-- Database: `hostel`
--
CREATE DATABASE IF NOT EXISTS `hostel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin123', '2024-04-10 22:31:45', '2024-06-22');

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) DEFAULT NULL,
  `course_sn` varchar(255) DEFAULT NULL,
  `course_fn` varchar(255) DEFAULT NULL,
  `posting_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(1, 'COM', 'COMP SCI', 'COMPUTER SCIENCE', '2024-06-22 08:15:30'),
(2, 'GEO', 'GEOLOGY', 'GEOLOGY AND GEOFORMATICS', '2024-06-22 08:16:03'),
(3, 'SLT', 'SCI LAB TECH', 'SCIENCE LABORATORY TECHNOLOGY', '2024-06-22 08:16:57'),
(4, 'MTH&STA', 'MATH AND STAT', 'MATHEMATICS AND STATISTICS', '2024-06-22 08:18:09'),
(5, 'PHY', 'PHYSICS', 'PHYSICS', '2024-06-22 08:18:30'),
(6, 'BIOCHEM', 'BIOCHEM', 'BIOCHEMISTRY', '2024-06-22 08:19:00'),
(7, 'MICROBIO', 'MICROBIO', 'MICROBIOLOGY', '2024-06-22 08:19:18'),
(8, 'BIO', 'BIOLOGY', 'BIOLOGY', '2024-06-22 08:19:30'),
(9, 'CHEM', 'CHEMISTRY', 'CHEMISTRY', '2024-06-22 08:19:40'),
(28, 'ACC', 'ACCOUNTANCY', 'COST ACCOUNTING', '2024-06-26 10:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` varchar(15) DEFAULT NULL,
  `seater` int(11) DEFAULT NULL,
  `feespm` int(11) DEFAULT NULL,
  `foodstatus` int(11) DEFAULT NULL,
  `stayfrom` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `course` varchar(500) DEFAULT NULL,
  `regno` varchar(15) DEFAULT NULL,
  `firstName` varchar(500) DEFAULT NULL,
  `middleName` varchar(500) DEFAULT NULL,
  `lastName` varchar(500) DEFAULT NULL,
  `gender` varchar(250) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `egycontactno` bigint(11) DEFAULT NULL,
  `guardianName` varchar(500) DEFAULT NULL,
  `guardianRelation` varchar(500) DEFAULT NULL,
  `guardianContactno` bigint(11) DEFAULT NULL,
  `corresAddress` varchar(500) DEFAULT NULL,
  `corresCIty` varchar(500) DEFAULT NULL,
  `corresState` varchar(500) DEFAULT NULL,
  `corresPincode` int(11) DEFAULT NULL,
  `pmntAddress` varchar(500) DEFAULT NULL,
  `pmntCity` varchar(500) DEFAULT NULL,
  `pmnatetState` varchar(500) DEFAULT NULL,
  `pmntPincode` int(11) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `feespm`, `foodstatus`, `stayfrom`, `duration`, `course`, `regno`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(1, 'A101 - OR', 4, 32000, NULL, '2024-07-08', 12, 'COMPUTER SCIENCE', '2023235020001', 'Abayomi', 'Stephen', 'Adebayo', 'male', 7080902039, 'abayomi@gmail.com', 7080902039, 'Mr Adebayo', 'Father', 7080902039, 'Lagos Island', 'Lagos', 'Lagos ', 12002, 'Lagos Island', 'Lagos', 'Lagos ', 12002, '2024-07-08 07:13:03', NULL),
(2, 'A101 - OL', 3, 2500, NULL, '2024-07-01', 12, 'SCIENCE LABORATORY TECHNOLOGY', '2019235020034', 'Grace', 'Simi', 'Omobayo', 'female', 8061691500, 'gracee@gmail.com', 8061691500, 'Mrs Omobayo', 'Mother', 8061691500, 'Adekunle crecent center, Ilupeju, Oshodi, Lagos', 'Lagos', 'Lagos ', 220390, 'Adekunle crecent center, Ilupeju, Oshodi, Lagos', 'Lagos', 'Lagos ', 220390, '2024-07-08 07:27:59', NULL),
(3, 'A101 - RA', 3, 2500, NULL, '2024-07-02', 12, 'BIOLOGY', '201829930146', 'Kadijat', 'Opeyemi', 'Alamu', 'female', 8059940330, 'kadijat@gmail.com', 8059940330, 'Mr AAremu', 'Brother', 8059940331, 'Oluyole, Ibadan', 'Ibadan', 'Oyo', 22345, 'Oluyole, Ibadan', 'Ibadan', 'Oyo', 22345, '2024-07-08 07:38:19', NULL),
(4, 'C107', 4, 30000, NULL, '0000-00-00', 12, 'PHYSICS', '2018705010190', 'Dayo', 'Segun', 'Kojo', 'male', 8070939943, 'kojo@gmail.com', 8070939943, 'Mr Segun', 'Brother', 8070939943, 'Apete ibadan', 'IBADAN', 'Oyo', 465789, 'Apete ibadan', 'IBADAN', 'Oyo', 465789, '2024-08-14 12:30:10', NULL),
(5, 'A202 - UN', 4, 5900, NULL, '2025-07-16', 12, 'COMPUTER SCIENCE', '2018705010135', 'Abiodun', 'Joseph', 'Adedapo', 'male', 9024056004, 'abeyjoe18@gmail.com', 8070939943, 'Mr Segun', 'Brother', 8070939943, 'Ajah', 'Lagos', 'Lagos ', 106104, 'Ajah', 'Lagos', 'Lagos ', 106104, '2025-07-20 03:03:24', NULL),
(6, 'B208', 1, 2500, NULL, '2025-07-24', 12, 'PHYSICS', '2018705010135', 'Abiodun', 'Joseph', 'Adedapo', 'male', 9024056004, 'abeyjoe18@gmail.com', 7080902039, 'Mrs. Kelechi', 'Aunty', 8059940331, '20 ovation quarters', 'Lagos', 'Lagos ', 22345, '20 ovation quarters', 'Lagos', 'Lagos ', 22345, '2025-07-22 03:41:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` varchar(11) DEFAULT NULL,
  `hall` varchar(15) DEFAULT NULL,
  `room_no` varchar(15) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `posting_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `hall`, `room_no`, `fees`, `posting_date`) VALUES
(15, '4', 'UNITY', 'A102 - UN', 2500, '2024-06-22 11:11:28'),
(16, '4', 'UNITY', 'A107 - UN', 2500, '2024-06-22 11:12:24'),
(17, '2', 'UNITY', 'A101 Pt - UN', 3000, '2024-06-22 11:14:26'),
(18, '2', 'UNITY', 'A201 Pt - UN', 3000, '2024-06-22 11:14:50'),
(21, '4', 'UNITY', 'A202 - UN', 2500, '2024-06-22 13:05:30'),
(23, '4', 'UNITY', 'C107', 30000, '2024-08-14 12:25:57'),
(24, '4', 'UNITY', 'B208', 70000, '2025-07-20 02:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Abia'),
(2, 'Adamawa '),
(3, 'Akwa-Ibom '),
(4, 'Anambra '),
(5, 'Bauchi '),
(6, 'Bayelsa '),
(7, 'Benue '),
(8, 'Bornu '),
(9, 'Cross River '),
(10, 'Delta '),
(11, 'Eboyin '),
(12, 'Enugu '),
(13, 'Gombe '),
(14, 'Imo '),
(15, 'Jigawa '),
(16, 'Kaduna '),
(17, 'Kano '),
(18, 'Katsina '),
(19, 'Kebbi '),
(20, 'Kogi '),
(21, 'Kwara '),
(22, 'Lagos '),
(23, 'Nasarawa '),
(24, 'Niger '),
(25, 'Ogun '),
(26, 'Ondo '),
(27, 'Osun'),
(28, 'Oyo'),
(29, 'Plateau'),
(30, 'Rivers'),
(31, 'Sokoto'),
(32, 'Taraba'),
(33, 'Yobe'),
(34, 'Zamfara'),
(35, 'Federal Capital Teritory'),
(36, 'FCT - Abuja');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userEmail`, `userIp`, `city`, `country`, `loginTime`) VALUES
(1, 1, 'abayomi@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:10:37'),
(2, 2, 'gracee@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:25:17'),
(3, 2, 'gracee@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:31:44'),
(4, 3, 'kadijat@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:40:11'),
(5, 3, 'kadijat@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:45:36'),
(6, 3, 'kadijat@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:46:01'),
(7, 3, 'kadijat@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:47:37'),
(8, 3, 'kadijat@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:47:57'),
(9, 3, 'kadijat@gmail.com', 0x3a3a31, '', '', '2024-07-08 07:48:16'),
(10, 4, 'kojo@gmail.com', 0x3a3a31, '', '', '2024-08-14 12:33:37'),
(11, 1, 'abayomi@gmail.com', 0x3a3a31, '', '', '2024-08-18 21:19:36'),
(12, 1, 'abayomi@gmail.com', 0x3a3a31, '', '', '2024-08-18 21:20:20'),
(13, 6, 'abeyjoe18@gmail.com', 0x3a3a31, '', '', '2025-07-20 03:05:25'),
(14, 6, 'abeyjoe18@gmail.com', 0x3a3a31, '', '', '2025-07-21 16:45:46'),
(15, 6, 'abeyjoe18@gmail.com', 0x3a3a31, '', '', '2025-07-22 03:59:35'),
(16, 6, 'abeyjoe18@gmail.com', 0x3a3a31, '', '', '2025-07-22 11:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `contactNo` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) DEFAULT NULL,
  `passUdateDate` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`id`, `regNo`, `firstName`, `middleName`, `lastName`, `gender`, `contactNo`, `email`, `password`, `regDate`, `updationDate`, `passUdateDate`) VALUES
(1, '2023235020001', 'Abayomi', 'Stephen', 'Adebayo', 'male', 7080902039, 'abayomi@gmail.com', '123', '2024-07-08 07:10:21', NULL, NULL),
(2, '2019235020034', 'Grace', 'Simi', 'Omobayo', 'female', 8061691500, 'gracee@gmail.com', '123', '2024-07-08 07:25:04', NULL, NULL),
(3, '201829930146', 'Kadijat', 'Opeyemi', 'Alamu', 'female', 8059940330, 'kadijat@gmail.com', '123', '2024-07-08 07:38:19', NULL, '08-07-2024 01:16:11'),
(4, '2018705010190', 'Dayo', 'Segun', 'Kojo', 'male', 8070939943, 'kojo@gmail.com', 'kojo', '2024-08-14 12:30:10', NULL, '14-08-2024 06:04:41'),
(5, '2018705010135', 'badejodaniel', 'segun', 'daniel', 'male', 9036423781, 'daniella@gmail.com', '09036423781', '2024-08-14 12:53:02', NULL, NULL),
(6, '2018705010135', 'Abiodun', 'Joseph', 'Adedapo', 'male', 9024056004, 'abeyjoe18@gmail.com', 'abbey', '2025-07-20 03:03:24', '21-07-2025 10:16:33', '20-07-2025 08:37:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `hostelmsphp`
--
CREATE DATABASE IF NOT EXISTS `hostelmsphp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostelmsphp`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'admin@gmail.com', 'D00F5D5217896FB7FD601412CB890830', '2025-05-08 20:31:45', '2025-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_sn` varchar(255) NOT NULL,
  `course_fn` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(1, 'CSC100', 'CSc', 'Computer Science', '2020-09-23 00:45:13'),
(7, 'CE100', 'CE', 'Computer Engineering', '2020-09-23 00:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `feespm` int(11) NOT NULL,
  `foodstatus` int(11) NOT NULL,
  `stayfrom` date NOT NULL,
  `duration` int(11) NOT NULL,
  `course` varchar(500) NOT NULL,
  `regno` varchar(255) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `middleName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `emailid` varchar(500) NOT NULL,
  `egycontactno` bigint(11) NOT NULL,
  `guardianName` varchar(500) NOT NULL,
  `guardianRelation` varchar(500) NOT NULL,
  `guardianContactno` bigint(11) NOT NULL,
  `corresAddress` varchar(500) NOT NULL,
  `corresCIty` varchar(500) NOT NULL,
  `corresState` varchar(500) NOT NULL,
  `corresPincode` int(11) NOT NULL,
  `pmntAddress` varchar(500) NOT NULL,
  `pmntCity` varchar(500) NOT NULL,
  `pmnatetState` varchar(500) NOT NULL,
  `pmntPincode` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `roomno`, `seater`, `feespm`, `foodstatus`, `stayfrom`, `duration`, `course`, `regno`, `firstName`, `middleName`, `lastName`, `gender`, `contactno`, `emailid`, `egycontactno`, `guardianName`, `guardianRelation`, `guardianContactno`, `corresAddress`, `corresCIty`, `corresState`, `corresPincode`, `pmntAddress`, `pmntCity`, `pmnatetState`, `pmntPincode`, `postingDate`, `updationDate`) VALUES
(15, 200, 2, 910, 1, '2021-03-07', 12, 'Bachelors In Information Technology', '11101', 'Mary', 'A.', 'Martin', 'female', 7455558855, 'marym@mail.com', 7412589650, 'James Martin', 'Father', 7896666600, '20 Patterson Street', 'Houston', '', 70067, '20 Patterson Street', 'Houston', '', 70067, '2022-04-02 17:06:43', ''),
(16, 112, 3, 1300, 1, '2022-04-04', 12, 'Master of Computer Application', 'CA003', 'Richard', 'J.', 'Summers', 'Male', 1325658800, 'richards@mail.com', 4785555500, 'Maren Summers', 'Father', 4125478555, '48 Wilkinson Street', 'Nashville', '', 32701, '48 Wilkinson Street', 'Nashville', '', 32701, '2022-04-03 13:16:45', ''),
(17, 132, 5, 1990, 0, '2022-04-04', 6, 'Master In Business Administration', 'CA006', 'Jennifer', 'J.', 'Frye', 'Female', 7895555544, 'jennifer@mail.com', 2224445585, 'Beverly Frye', 'Mother', 1478569888, '18 Hanifan Lane', 'Stone Mountain', '', 38803, '18 Hanifan Lane', 'Stone Mountain', '', 38803, '2022-04-03 14:37:56', ''),
(18, 269, 2, 910, 1, '2022-05-03', 12, 'Bachelor of Engineering', 'CA002', 'Bruce', 'E.', 'Murphy', 'Male', 1346565650, 'bruce@mail.com', 7850001450, 'Ellen Murphy', 'Mother', 7850001010, '25 Yorkie Lane', 'Savannah', '', 34001, '25 Yorkie Lane', 'Savannah', '', 34001, '2022-04-03 14:47:31', ''),
(19, 100, 5, 1990, 0, '2022-04-17', 8, 'Bachelor Of Commerce ', 'CA009', 'Nancy', 'W.', 'Vasquez', 'Female', 3547777770, 'nancy@mail.com', 4445554470, 'Jude Vasquez', 'Father', 4785698555, '109 Prudence Street', 'Dearborn', '', 44550, '109 Prudence Street', 'Dearborn', '', 44550, '2022-04-03 15:02:15', ''),
(20, 310, 1, 750, 0, '2022-04-10', 12, 'Master of Information Technology', 'CA014', 'Liam', 'K.', 'Moore', 'Male', 7854441014, 'liamoore@mail.com', 7412585500, 'Christine L. Moore', 'Mother', 7458888888, '77 Test Address', 'Democity', '', 70001, '77 Test Address', 'Democity', '', 70001, '2022-04-03 15:53:07', ''),
(21, 1000, 1, 7800, 1, '2022-09-24', 1, 'Bachelor  Of Technology', 'CD/2545/21', 'Erick', 'Omundi', 'Omari', 'male', 1245789632, 'resress4078@outlook.com', 1245789632, 'JOHN', 'FATHER', 1254789632, '816', 'Kisii', '', 40200, '816', 'Kisii', '', 40200, '2022-09-24 11:53:36', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `fees` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `room_no`, `fees`, `posting_date`) VALUES
(1, 4, 101, 5000, '2025-07-26 12:35:33'),
(2, 4, 102, 5000, '2025-07-26 12:35:50'),
(3, 4, 103, 5000, '2025-07-26 12:44:30'),
(4, 4, 104, 5000, '2025-07-26 12:44:50'),
(5, 4, 105, 5000, '2025-07-26 12:45:45'),
(6, 4, 106, 5000, '2025-07-26 12:45:54'),
(7, 4, 107, 5000, '2025-07-26 12:46:12'),
(8, 4, 108, 5000, '2025-07-26 12:46:51'),
(9, 4, 109, 5000, '2025-07-26 12:47:22'),
(10, 2, 1010, 5500, '2025-07-26 12:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa-Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Bornu'),
(9, 'Cross-River'),
(10, 'Delta'),
(11, 'Eboyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nasarawa'),
(26, 'New Jersey'),
(27, 'New York'),
(28, 'North Carolina'),
(29, 'North Dakota'),
(30, 'Ohio'),
(31, 'Oklahoma'),
(32, 'South Carolina'),
(33, 'South Dakota'),
(34, 'Texas'),
(35, 'Virginia'),
(36, 'Washington');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userIp` varbinary(16) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contactNo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) NOT NULL,
  `passUdateDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Database: `hostel_management_system`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system`;
--
-- Database: `hostel_management_system_application`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system_application` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system_application`;
--
-- Database: `hostel_management_system_hostel`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system_hostel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system_hostel`;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `Hostel_id` int(10) NOT NULL,
  `Hostel_name` varchar(255) NOT NULL,
  `current_no_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_students` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`Hostel_id`, `Hostel_name`, `current_no_of_rooms`, `No_of_rooms`, `No_of_students`) VALUES
(1, 'A', NULL, '400', NULL),
(2, 'B', NULL, '400', NULL),
(3, 'C', NULL, '400', NULL),
(4, 'D', NULL, '400', NULL),
(5, 'E', NULL, '400', NULL),
(6, 'F', NULL, '400', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`Hostel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `Hostel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `hostel_management_system_hostel_manager`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system_hostel_manager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system_hostel_manager`;
--
-- Database: `hostel_management_system_message`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system_message` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system_message`;
--
-- Database: `hostel_management_system_room`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system_room` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system_room`;
--
-- Database: `hostel_management_system_student`
--
CREATE DATABASE IF NOT EXISTS `hostel_management_system_student` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hostel_management_system_student`;
--
-- Database: `onlineshop`
--
CREATE DATABASE IF NOT EXISTS `onlineshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `onlineshop`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Electronics Gadgets');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'Abiodun J', 'abeyjoe18@gmail.com', 'TPI', 'Ibadan', 'Oyo', 223454, 'Abiodun', '2456776545567898', '05/28', 1, 5000, 790);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 1, 1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung galaxy s7 edge', 5000, 'Samsung galaxy s7 edge', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'iPhone 5s', 25000, 'iphone 5s', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple'),
(3, 1, 3, 'iPad air 2', 30000, 'ipad apple brand', 'da4371ffa192a115f922b1c0dff88193.png', 'apple ipad tablet'),
(4, 1, 3, 'iPhone 6s', 32000, 'Apple iPhone ', 'http___pluspng.com_img-png_iphone-6s-png-iphone-6s-gold-64gb-1000.png', 'iphone apple mobile'),
(5, 1, 2, 'iPad 2', 10000, 'samsung ipad', 'iPad-air.png', 'ipad tablet samsung'),
(6, 1, 1, 'samsung Laptop r series', 35000, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 1, 1, 'Laptop Pavillion', 50000, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(8, 1, 4, 'Sony', 40000, 'Sony Mobile', '530201353846AM_635_sony_xperia_z.png', 'sony mobile'),
(9, 1, 3, 'iPhone New', 12000, 'iphone', 'iphone-hd-png-iphone-apple-png-file-550.png', 'iphone apple mobile'),
(10, 2, 6, 'Red Ladies dress', 1000, 'red dress for girls', 'red dress.jpg', 'red dress '),
(11, 2, 6, 'Blue Heave dress', 1200, 'Blue dress', 'images.jpg', 'blue dress cloths'),
(12, 2, 6, 'Ladies Casual Cloths', 1500, 'ladies casual summer two colors pleted', '7475-ladies-casual-dresses-summer-two-colors-pleated.jpg', 'girl dress cloths casual'),
(13, 2, 6, 'SpringAutumnDress', 1200, 'girls dress', 'Spring-Autumn-Winter-Young-Ladies-Casual-Wool-Dress-Women-s-One-Piece-Dresse-Dating-Clothes-Medium.jpg_640x640.jpg', 'girl dress'),
(14, 2, 6, 'Casual Dress', 1400, 'girl dress', 'download.jpg', 'ladies cloths girl'),
(15, 2, 6, 'Formal Look', 1500, 'girl dress', 'shutterstock_203611819.jpg', 'ladies wears dress girl'),
(16, 3, 6, 'Sweter for men', 600, '2012-Winter-Sweater-for-Men-for-better-outlook', '2012-Winter-Sweater-for-Men-for-better-outlook.jpg', 'black sweter cloth winter'),
(17, 3, 6, 'Gents formal', 1000, 'gents formal look', 'gents-formal-250x250.jpg', 'gents wear cloths'),
(19, 3, 6, 'Formal Coat', 3000, 'ad', 'images (1).jpg', 'coat blazer gents'),
(20, 3, 6, 'Mens Sweeter', 1600, 'jg', 'Winter-fashion-men-burst-sweater.png', 'sweeter gents '),
(21, 3, 6, 'T shirt', 800, 'ssds', 'IN-Mens-Apparel-Voodoo-Tiles-09._V333872612_.jpg', 'formal t shirt black'),
(22, 4, 6, 'Yellow T shirt ', 1300, 'yello t shirt with pant', '1.0x0.jpg', 'kids yellow t shirt'),
(23, 4, 6, 'Girls cloths', 1900, 'sadsf', 'GirlsClothing_Widgets.jpg', 'formal kids wear dress'),
(24, 4, 6, 'Blue T shirt', 700, 'g', 'images.jpg', 'kids dress'),
(25, 4, 6, 'Yellow girls dress', 750, 'as', 'images (3).jpg', 'yellow kids dress'),
(27, 4, 6, 'Formal look', 690, 'sd', 'image28.jpg', 'formal kids dress'),
(32, 5, 0, 'Book Shelf', 2500, 'book shelf', 'furniture-book-shelf-250x250.jpg', 'book shelf furniture'),
(33, 6, 2, 'Refrigerator', 35000, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung'),
(34, 6, 4, 'Emergency Light', 1000, 'Emergency Light', 'emergency light.JPG', 'emergency light'),
(35, 6, 0, 'Vaccum Cleaner', 6000, 'Vaccum Cleaner', 'images (2).jpg', 'Vaccum Cleaner'),
(36, 6, 5, 'Iron', 1500, 'gj', 'iron.JPG', 'iron'),
(37, 6, 5, 'LED TV', 20000, 'LED TV', 'images (4).jpg', 'led tv lg'),
(38, 6, 4, 'Microwave Oven', 3500, 'Microwave Oven', 'images.jpg', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 2500, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(40, 2, 6, 'Formal girls dress', 3000, 'Formal girls dress', 'girl-walking.jpg', 'ladies'),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo'),
(46, 1, 2, 'Samsung Galaxy Note 3', 10000, '', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galxaxy note 3 neo'),
(47, 4, 6, 'Laptop', 650, 'nbk', 'product01.png', 'Dell Laptop'),
(48, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(49, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(50, 3, 6, 'boys shirts', 350, 'shirts', 'pm1.JPG', 'suit boys shirts'),
(51, 3, 6, 'boys shirts', 270, 'shirts', 'pm2.JPG', 'suit boys shirts'),
(52, 3, 6, 'boys shirts', 453, 'shirts', 'pm3.JPG', 'suit boys shirts'),
(53, 3, 6, 'boys shirts', 220, 'shirts', 'ms1.JPG', 'suit boys shirts'),
(54, 3, 6, 'boys shirts', 290, 'shirts', 'ms2.JPG', 'suit boys shirts'),
(55, 3, 6, 'boys shirts', 259, 'shirts', 'ms3.JPG', 'suit boys shirts'),
(56, 3, 6, 'boys shirts', 299, 'shirts', 'pm7.JPG', 'suit boys shirts'),
(57, 3, 6, 'boys shirts', 260, 'shirts', 'i3.JPG', 'suit boys shirts'),
(58, 3, 6, 'boys shirts', 350, 'shirts', 'pm9.JPG', 'suit boys shirts'),
(59, 3, 6, 'boys shirts', 855, 'shirts', 'a2.JPG', 'suit boys shirts'),
(60, 3, 6, 'boys shirts', 150, 'shirts', 'pm11.JPG', 'suit boys shirts'),
(61, 3, 6, 'boys shirts', 215, 'shirts', 'pm12.JPG', 'suit boys shirts'),
(62, 3, 6, 'boys shirts', 299, 'shirts', 'pm13.JPG', 'suit boys shirts'),
(63, 3, 6, 'boys Jeans Pant', 550, 'Pants', 'pt1.JPG', 'boys Jeans Pant'),
(64, 3, 6, 'boys Jeans Pant', 460, 'pants', 'pt2.JPG', 'boys Jeans Pant'),
(65, 3, 6, 'boys Jeans Pant', 470, 'pants', 'pt3.JPG', 'boys Jeans Pant'),
(66, 3, 6, 'boys Jeans Pant', 480, 'pants', 'pt4.JPG', 'boys Jeans Pant'),
(67, 3, 6, 'boys Jeans Pant', 360, 'pants', 'pt5.JPG', 'boys Jeans Pant'),
(68, 3, 6, 'boys Jeans Pant', 550, 'pants', 'pt6.JPG', 'boys Jeans Pant'),
(69, 3, 6, 'boys Jeans Pant', 390, 'pants', 'pt7.JPG', 'boys Jeans Pant'),
(70, 3, 6, 'boys Jeans Pant', 399, 'pants', 'pt8.JPG', 'boys Jeans Pant'),
(71, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(72, 7, 2, 'sony Headphones', 3500, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'HP i5 laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'HP i7 laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'sony note 6gb ram', 4500, 'sony note 6gb ram', 'product04.png', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'dell laptop 8gb ram intel integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(80, 1, 1, 'ytrfdkjsd', 12343, 'sdfhgh', '1542455446_thythtf .jpeg', 'dfgh'),
(81, 4, 6, 'Kids blue dress', 300, 'blue dress', '1543993724_pg4.jpg', 'kids blue dress');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Abiodun', 'J', 'abeyjoe18@gmail.com', 'qwertyuiop', '9024056004', 'TPI', 'Ibadan');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Abiodun', 'J', 'abeyjoe18@gmail.com', 'qwertyuiop', '9024056004', 'TPI', 'Ibadan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"book_store_db\",\"table\":\"users\"},{\"db\":\"book_store_db\",\"table\":\"orders\"},{\"db\":\"book_store_db\",\"table\":\"cart\"},{\"db\":\"book_store_db\",\"table\":\"categories\"},{\"db\":\"book_store_db\",\"table\":\"customers\"},{\"db\":\"book_store_db\",\"table\":\"order_list\"},{\"db\":\"ecom_store\",\"table\":\"admins\"},{\"db\":\"ecom_store\",\"table\":\"customers\"},{\"db\":\"ecom_store\",\"table\":\"customer_orders\"},{\"db\":\"ecom_store\",\"table\":\"categories\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-08-19 12:44:41', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":272}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `voting_db`
--
CREATE DATABASE IF NOT EXISTS `voting_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `voting_db`;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `category`) VALUES
(1, 'President'),
(3, 'Vice Presindent'),
(4, 'General Secretary'),
(5, 'Public Relation Officer 1'),
(6, 'Social Director 1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1+admin , 2 = users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1),
(2, 'John Smith', 'jsmith', 'admin123', 1),
(3, 'Voter 2', 'voter2', 'voter2', 2),
(4, 'Voter 1', 'voter1', 'voter1', 2),
(5, 'angel jude suarez', 'jude', '123', 2),
(6, 'abiodun', 'abiodun', '123', 2),
(7, 'Abioye', '0001', 'aaa', 2);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `voting_opt_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `voting_id`, `category_id`, `voting_opt_id`, `user_id`) VALUES
(1, 1, 1, 1, 3),
(2, 1, 3, 5, 3),
(3, 1, 4, 6, 3),
(4, 1, 4, 7, 3),
(5, 1, 4, 8, 3),
(6, 1, 4, 9, 3),
(7, 1, 1, 3, 4),
(8, 1, 3, 12, 4),
(9, 1, 4, 6, 4),
(10, 1, 4, 8, 4),
(11, 1, 4, 10, 4),
(12, 1, 4, 11, 4),
(13, 1, 1, 1, 5),
(14, 1, 3, 5, 5),
(15, 1, 4, 6, 5),
(16, 4, 1, 18, 6),
(17, 4, 3, 19, 6),
(18, 4, 1, 18, 7),
(19, 4, 3, 19, 7);

-- --------------------------------------------------------

--
-- Table structure for table `voting_cat_settings`
--

CREATE TABLE `voting_cat_settings` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `max_selection` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_cat_settings`
--

INSERT INTO `voting_cat_settings` (`id`, `voting_id`, `category_id`, `max_selection`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 1, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `voting_list`
--

CREATE TABLE `voting_list` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_list`
--

INSERT INTO `voting_list` (`id`, `title`, `description`, `is_default`) VALUES
(4, 'NACOS Election', '2025/2026 Election', 1);

-- --------------------------------------------------------

--
-- Table structure for table `voting_opt`
--

CREATE TABLE `voting_opt` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `image_path` text NOT NULL,
  `opt_txt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_opt`
--

INSERT INTO `voting_opt` (`id`, `voting_id`, `category_id`, `image_path`, `opt_txt`) VALUES
(1, 1, 1, '1600398180_no-image-available.png', 'James Smith'),
(3, 1, 1, '1600415460_avatar2.png', 'James Wilson'),
(5, 1, 3, '1600415520_avatar.jpg', 'George Walker'),
(6, 1, 4, '1600400340_no-image-available.png', 'Cadidate 1'),
(7, 1, 4, '1600400340_no-image-available.png', 'Cadidate 2'),
(8, 1, 4, '1600400340_no-image-available.png', 'Cadidate 3'),
(9, 1, 4, '1600400520_no-image-available.png', 'Cadidate  4'),
(10, 1, 4, '1600400640_no-image-available.png', 'Cadidate 5'),
(11, 1, 4, '1600400400_no-image-available.png', 'Cadidate 6'),
(12, 1, 3, '1600415520_no-image-available.png', 'Claire Blake'),
(18, 4, 1, '1752137640_Drawn To You.png', 'Adeola'),
(19, 4, 3, '1752137700_kenny-logo.PNG', 'Habeeb'),
(20, 4, 1, '1752137760_HIGHLY CONVERTING HEALTH INSURANCE LEADS MEDICAL INSURANCE SENIOR HEALTH INSURANCE LEADS.png', 'Daniel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_list`
--
ALTER TABLE `voting_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_opt`
--
ALTER TABLE `voting_opt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `voting_list`
--
ALTER TABLE `voting_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `voting_opt`
--
ALTER TABLE `voting_opt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
