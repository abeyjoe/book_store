-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2025 at 03:53 PM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
