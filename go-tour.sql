-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2025 at 11:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `go-tour`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `weatherType` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `nights` int(11) DEFAULT NULL,
  `imageUrl` text DEFAULT NULL,
  `overview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `name`, `slug`, `weatherType`, `price`, `nights`, `imageUrl`, `overview`) VALUES
(1, 'Munnar, Kerala, India', 'munnar', 'Colder, No Rain, Pollution free', 21000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/munnar-kerala-india.jpg', ''),
(2, 'Rajahmundry, Andhra Pradesh, India', 'rajahmundry', 'Warmer, No Snow, Rain', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajahmundry-andhra-pradesh-india.jpg', ''),
(3, 'Ayodhya, Uttar Pradesh, India', 'ayodhya', 'Warmer, No Snow, No Pollution', 13000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ayodhya-uttar-pradesh-india.jpg', ''),
(4, 'Dubai, Dubai, United Arab Emirates', 'dubai', 'Warmer, No Snow, No Rain, Pollution free', 55000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/dubai-dubai-united-arab-emirates.jpg', ''),
(5, 'Dandeli, Karnataka, India', 'dandeli', 'Warmer, Rain, No Snow', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/dandeli-karnataka-india.jpg', ''),
(6, 'Manali, Himachal Pradesh, India', 'manali', 'Colder, Snow, No Rain, Pollution free', 25000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/manali-himachal-pradesh-india.jpg', ''),
(7, 'Periyar, Kerala, India', 'periyar', 'Warmer, Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/periyar-kerala-india.jpg', ''),
(8, 'Khandala, Maharashtra, India', 'khandala', 'Colder, No Rain', 18600, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/khandala-maharashtra-india.jpg', ''),
(9, 'Vrindavan, Uttar Pradesh, India', 'vrindavan', 'Warmer, No Snow, No Pollution', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/vrindavan-uttar-pradesh-india.jpg', ''),
(10, 'New Delhi, Delhi, India', 'new-delhi', 'Pollution free, Colder, No Rain', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/new-delhi-delhi-india.jpg', ''),
(11, 'Abu Dhabi, Abu Dhabi, United Arab Emirates', 'abu-dhabi', 'Warmer, No Snow, No Rain, Pollution free', 72000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/abu-dhabi-abu-dhabi-united-arab-emirates.jpg', ''),
(12, 'Kushalnagar, Karnataka, India', 'kushalnagar', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kushalnagar-karnataka-india.jpg', ''),
(13, 'Morena, Madhya Pradesh, India', 'morena', 'Warmer, No Snow, No Rain, Pollution free', 7000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/morena-madhya-pradesh-india.jpg', ''),
(14, 'Kovalam, Kerala, India', 'kovalam', 'Warmer, Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kovalam-kerala-india.jpg', ''),
(15, 'Rajasthan, India', 'rajasthan', 'Hot, Dry, No Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajasthan-india.jpg', ''),
(16, 'Maldives, South Asia, Maldives', 'maldives', 'Warmer, No Rain, Pollution free', 100000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/maldives-south-asia-maldives.jpg', ''),
(17, 'Mahabaleshwar, Maharashtra, India', 'mahabaleshwar', 'Colder, No Rain', 21000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/mahabaleshwar-maharashtra-india.jpg', ''),
(18, 'Chennai, Tamil Nadu, India', 'chennai', 'Warmer, Rain, Pollution free', 14000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chennai-tamil-nadu-india.jpg', ''),
(19, 'Vengurla, Maharashtra, India', 'vengurla', 'Warmer, Rain, Pollution free', 10500, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/vengurla-maharashtra-india.jpg', ''),
(20, 'Maafushi, Kaafu Atoll, Maldives', 'maafushi', 'Warmer, No Snow, Rain', 77400, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/maafushi-kaafu-atoll-maldives.jpg', ''),
(21, 'Hampi, Karnataka, India', 'hampi', 'Hot, Dry, No Snow, No Rain', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/hampi-karnataka-india.jpg', ''),
(22, 'Varkala, Kerala, India', 'varkala', 'Warmer, Rain, Pollution free', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/varkala-kerala-india.jpg', ''),
(23, 'Pushkar, Rajasthan, India', 'pushkar', 'Warmer, No Rain, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/pushkar-rajasthan-india.jpg', ''),
(24, 'Negombo, Western Province, Sri Lanka', 'negombo', 'Warmer, Rain, No Snow', 55000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/negombo-western-province-sri-lanka.jpg', ''),
(25, 'Sri Lanka, Asia, Sri Lanka', 'sri-lanka', 'Warmer, Rain, Pollution free', 71000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sri-lanka-asia-sri-lanka.jpg', ''),
(26, 'Jaisalmer, Rajasthan, India', 'jaisalmer', 'Hot, Dry, No Rain, Pollution free', 19800, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/jaisalmer-rajasthan-india.jpg', ''),
(27, 'Galle, Southern Province, Sri Lanka', 'galle', 'Warmer, Rain, No Snow', 62000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/galle-southern-province-sri-lanka.jpg', ''),
(28, 'Unawatuna, Southern Province, Sri Lanka', 'unawatuna', 'Warmer, Rain, Pollution free', 75000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/unawatuna-southern-province-sri-lanka.jpg', ''),
(29, 'Kukke, Karnataka, India', 'kukke', 'Colder, No Rain', 14000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kukke-karnataka-india.jpg', ''),
(30, 'Devgad, Maharashtra, India', 'devgad', 'Warmer, No Snow, No Pollution', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/devgad-maharashtra-india.jpg', ''),
(31, 'Gulmarg, Jammu and Kashmir, India', 'gulmarg', 'Colder, Snow, No Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/gulmarg-jammu-and-kashmir-india.jpg', ''),
(32, 'Jaipur, Rajasthan, India', 'jaipur', 'Warmer, No Snow, No Rain, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/jaipur-rajasthan-india.jpg', ''),
(33, 'Ellora, Maharashtra, India', 'ellora', 'Warmer, No Snow, No Pollution', 12000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ellora-maharashtra-india.jpg', ''),
(34, 'Nathdwara, Rajasthan, India', 'nathdwara', 'Warmer, No Snow, No Pollution', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/nathdwara-rajasthan-india.jpg', ''),
(35, 'Kanipakam, Andhra Pradesh, India', 'kanipakam', 'Warmer, No Snow, No Pollution', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kanipakam-andhra-pradesh-india.jpg', ''),
(36, 'Ramanagara, Karnataka, India', 'ramanagara', 'Warmer, No Snow, No Rain, Pollution free', 8000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ramanagara-karnataka-india.jpg', ''),
(37, 'Araku, Andhra Pradesh, India', 'araku', 'Colder, No Rain', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/araku-andhra-pradesh-india.jpg', ''),
(38, 'Ramoji Film City, Hyderabad, India', 'ramoji-film-city', 'Warmer, No Snow, No Rain, Pollution free', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ramoji-film-city-hyderabad-india.jpg', ''),
(39, 'Malvan, Maharashtra, India', 'malvan', 'Warmer, Rain, Pollution free', 22000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/malvan-maharashtra-india.jpg', ''),
(40, 'Mirissa, Southern Province, Sri Lanka', 'mirissa', 'Warmer, Rain, Pollution free', 20000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/mirissa-southern-province-sri-lanka.jpg', ''),
(41, 'Andhra Pradesh, South India, India', 'andhra-pradesh', 'Warmer, No Snow, Rain', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/andhra-pradesh-south-india-india.jpg', ''),
(42, 'Madikeri, Karnataka, India', 'madikeri', 'Colder, Rain, No Snow, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/madikeri-karnataka-india.jpg', ''),
(43, 'Tarkarli, Maharashtra, India', 'tarkarli', 'Warmer, No Snow, Rain', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/tarkarli-maharashtra-india.jpg', ''),
(44, 'Sikkim, India', 'sikkim', 'Colder, Snow, No Rain, Pollution free', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sikkim-india.jpg', ''),
(45, 'Agra, Uttar Pradesh, India', 'agra', 'Warmer, No Snow, No Rain, Pollution free', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/agra-uttar-pradesh-india.jpg', ''),
(46, 'Lumbini, Rupandehi, Nepal', 'lumbini', 'Warmer, No Rain, Pollution free', 40000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lumbini-rupandehi-nepal.jpg', ''),
(47, 'Bahrain, Middle East, Bahrain', 'bahrain', 'Warmer, No Snow, No Rain, Pollution free', 60000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/bahrain-middle-east-bahrain.jpg', ''),
(48, 'Thailand, Southeast Asia, Thailand', 'thailand', 'Warmer, Rain, Pollution free', 60000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/thailand-southeast-asia-thailand.jpg', ''),
(49, 'Courtallam, Tamil Nadu, India', 'courtallam', 'Warmer, Rain, Pollution free', 14000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/courtallam-tamil-nadu-india.jpg', ''),
(50, 'Andaman and Nicobar, India', 'andaman-and-nicobar', 'Warmer, No Snow, Rain, Pollution free', 48000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/andaman-and-nicobar-india.jpg', ''),
(51, 'Mirzapur, Uttar Pradesh, India', 'mirzapur', 'Hot, Rainy, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/mirzapur-uttar-pradesh-india.jpg', ''),
(52, 'United Arab Emirates, Middle East, UAE', 'united-arab-emirates', 'Warmer, No Rain, Pollution free', 70000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/united-arab-emirates-middle-east-uae.jpg', ''),
(53, 'Lambasingi, Andhra Pradesh, India', 'lambasingi', 'Colder, No Rain, Foggy', 12000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lambasingi-andhra-pradesh-india.jpg', ''),
(54, 'Gokarna, Karnataka, India', 'gokarna', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/gokarna-karnataka-india.jpg', ''),
(55, 'Munnar, Kerala, India', 'munnar', 'Colder, No Rain, Pollution free', 21000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/munnar-kerala-india.jpg', ''),
(56, 'Rajahmundry, Andhra Pradesh, India', 'rajahmundry', 'Warmer, No Snow, Rain', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajahmundry-andhra-pradesh-india.jpg', ''),
(57, 'Dubai, Dubai, United Arab Emirates', 'dubai', 'Warmer, No Snow, No Rain, Pollution free', 55000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/dubai-dubai-united-arab-emirates.jpg', ''),
(58, 'Himachal Pradesh, North India, India', 'himachal-pradesh', 'Colder, Snow, No Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/himachal-pradesh-north-india-india.jpg', ''),
(59, 'Manali, Himachal Pradesh, India', 'manali', 'Colder, Snow, No Rain, Pollution free', 25000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/manali-himachal-pradesh-india.jpg', ''),
(60, 'Periyar, Kerala, India', 'periyar', 'Warmer, Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/periyar-kerala-india.jpg', ''),
(61, 'Nuwara Eliya, Central, Sri Lanka', 'nuwara-eliya', 'Colder, No Rain, Snow', 71000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/nuwara-eliya-central-sri-lanka.jpg', ''),
(62, 'Khandala, Maharashtra, India', 'khandala', 'Colder, No Rain', 18600, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/khandala-maharashtra-india.jpg', ''),
(63, 'New Delhi, Delhi, India', 'new-delhi', 'Pollution free, Colder, No Rain', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/new-delhi-delhi-india.jpg', ''),
(64, 'Andhra Pradesh, South India, India', 'andhra-pradesh', 'Warmer, No Snow, Rain', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/andhra-pradesh-south-india-india.jpg', ''),
(65, 'Abu Dhabi, Abu Dhabi, United Arab Emirates', 'abu-dhabi', 'Warmer, No Snow, No Rain, Pollution free', 72000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/abu-dhabi-abu-dhabi-united-arab-emirates.jpg', ''),
(66, 'Chikmagalur, Karnataka, India', 'chikmagalur', 'Colder, No Rain', 11500, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chikmagalur-karnataka-india.jpg', ''),
(67, 'Sikkim, India', 'sikkim', 'Colder, Snow, No Rain, Pollution free', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sikkim-india.jpg', ''),
(68, 'Lumbini, Rupandehi, Nepal', 'lumbini', 'Warmer, No Rain, Pollution free', 40000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lumbini-rupandehi-nepal.jpg', ''),
(69, 'Morena, Madhya Pradesh, India', 'morena', 'Warmer, No Snow, No Rain, Pollution free', 7000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/morena-madhya-pradesh-india.jpg', ''),
(70, 'Shimla, Himachal Pradesh, India', 'shimla', 'Colder, Snow, No Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/shimla-himachal-pradesh-india.jpg', ''),
(71, 'Bangkok, Bangkok, Thailand', 'bangkok', 'Warmer, Rain, Pollution free', 63500, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/bangkok-bangkok-thailand.jpg', ''),
(72, 'Kovalam, Kerala, India', 'kovalam', 'Warmer, Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kovalam-kerala-india.jpg', ''),
(73, 'Rajasthan, India', 'rajasthan', 'Hot, Dry, No Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajasthan-india.jpg', ''),
(74, 'Sakleshpur, Karnataka, India', 'sakleshpur', 'Warmer, Rain, No Snow', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sakleshpur-karnataka-india.jpg', ''),
(75, 'Maafushi, Kaafu Atoll, Maldives', 'maafushi', 'Warmer, No Snow, Rain', 77400, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/maafushi-kaafu-atoll-maldives.jpg', ''),
(76, 'Hampi, Karnataka, India', 'hampi', 'Hot, Dry, No Snow, No Rain', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/hampi-karnataka-india.jpg', ''),
(77, 'Varkala, Kerala, India', 'varkala', 'Warmer, Rain, Pollution free', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/varkala-kerala-india.jpg', ''),
(78, 'Udvada, Gujarat, India', 'udvada', 'Warmer, No Snow, No Rain, Pollution free', 10000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/udvada-gujarat-india.jpg', ''),
(79, 'Sri Lanka, Asia, Sri Lanka', 'sri-lanka', 'Warmer, Rain, Pollution free', 71000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sri-lanka-asia-sri-lanka.jpg', ''),
(80, 'Ramtek, Maharashtra, India', 'ramtek', 'Warmer, Rain, Pollution free', 10000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ramtek-maharashtra-india.jpg', ''),
(81, 'Devgad, Maharashtra, India', 'devgad', 'Warmer, No Snow, No Pollution', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/devgad-maharashtra-india.jpg', ''),
(82, 'Gulmarg, Jammu and Kashmir, India', 'gulmarg', 'Colder, Snow, No Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/gulmarg-jammu-and-kashmir-india.jpg', ''),
(83, 'Ellora, Maharashtra, India', 'ellora', 'Warmer, No Snow, No Pollution', 12000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ellora-maharashtra-india.jpg', ''),
(84, 'Nathdwara, Rajasthan, India', 'nathdwara', 'Warmer, No Snow, No Pollution', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/nathdwara-rajasthan-india.jpg', ''),
(85, 'Ramanagara, Karnataka, India', 'ramanagara', 'Warmer, No Snow, No Rain, Pollution free', 8000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ramanagara-karnataka-india.jpg', ''),
(86, 'Kushalnagar, Karnataka, India', 'kushalnagar', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kushalnagar-karnataka-india.jpg', ''),
(87, 'Bahrain, Middle East, Bahrain', 'bahrain', 'Warmer, No Snow, No Rain, Pollution free', 60000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/bahrain-middle-east-bahrain.jpg', ''),
(88, 'Thailand, Southeast Asia, Thailand', 'thailand', 'Warmer, Rain, Pollution free', 60000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/thailand-southeast-asia-thailand.jpg', ''),
(89, 'Courtallam, Tamil Nadu, India', 'courtallam', 'Warmer, Rain, Pollution free', 14000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/courtallam-tamil-nadu-india.jpg', ''),
(90, 'Konark, Odisha, India', 'konark', 'Warmer, No Rain, Pollution free', 14000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/konark-odisha-india.jpg', ''),
(91, 'Sringeri, Karnataka, India', 'sringeri', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sringeri-karnataka-india.jpg', ''),
(92, 'Somnath, Gujarat, India', 'somnath', 'Warmer, No Snow, No Pollution', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/somnath-gujarat-india.jpg', ''),
(93, 'Lalitpur, Bagmati, Nepal', 'lalitpur', 'Colder, No Rain', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lalitpur-bagmati-nepal.jpg', ''),
(94, 'Srikalahasti, Andhra Pradesh, India', 'srikalahasti', 'Warmer, No Snow, No Pollution', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/srikalahasti-andhra-pradesh-india.jpg', ''),
(95, 'Varanasi, Uttar Pradesh, India', 'varanasi', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/varanasi-uttar-pradesh-india.jpg', ''),
(96, 'Chitwan, Narayani, Nepal', 'chitwan', 'Warmer, Rain, Pollution free', 78000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chitwan-narayani-nepal.jpg', ''),
(97, 'Shimoga, Karnataka, India', 'shimoga', 'Warmer, Rain, No Snow', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/shimoga-karnataka-india.jpg', ''),
(98, 'Shivpuri, Madhya Pradesh, India', 'shivpuri', 'Warmer, No Snow, No Pollution', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/shivpuri-madhya-pradesh-india.jpg', ''),
(99, 'Chiang Mai, Chiang Mai, Thailand', 'chiang-mai', 'Warmer, No Snow, No Rain, Pollution free', 59000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chiang-mai-chiang-mai-thailand.jpg', ''),
(100, 'Rajkot, Gujarat, India', 'rajkot', 'Warmer, No Snow, Rain', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajkot-gujarat-india.jpg', ''),
(101, 'Sakleshpur, Karnataka, India', 'sakleshpur', 'Warmer, Rain, No Snow', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sakleshpur-karnataka-india.jpg', ''),
(102, 'Munnar, Kerala, India', 'munnar', 'Colder, No Rain, Pollution free', 21000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/munnar-kerala-india.jpg', ''),
(103, 'Rajahmundry, Andhra Pradesh, India', 'rajahmundry', 'Warmer, No Snow, Rain', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajahmundry-andhra-pradesh-india.jpg', ''),
(104, 'Maharashtra, India', 'maharashtra', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/maharashtra-india.jpg', ''),
(105, 'Dubai, Dubai, United Arab Emirates', 'dubai', 'Warmer, No Snow, No Rain, Pollution free', 55000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/dubai-dubai-united-arab-emirates.jpg', ''),
(106, 'Himachal Pradesh, North India, India', 'himachal-pradesh', 'Colder, Snow, No Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/himachal-pradesh-north-india-india.jpg', ''),
(107, 'Manali, Himachal Pradesh, India', 'manali', 'Colder, Snow, No Rain, Pollution free', 25000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/manali-himachal-pradesh-india.jpg', ''),
(108, 'Periyar, Kerala, India', 'periyar', 'Warmer, Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/periyar-kerala-india.jpg', ''),
(109, 'Nuwara Eliya, Central, Sri Lanka', 'nuwara-eliya', 'Colder, No Rain, Snow', 71000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/nuwara-eliya-central-sri-lanka.jpg', ''),
(110, 'Khandala, Maharashtra, India', 'khandala', 'Colder, No Rain', 18600, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/khandala-maharashtra-india.jpg', ''),
(111, 'New Delhi, Delhi, India', 'new-delhi', 'Pollution free, Colder, No Rain', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/new-delhi-delhi-india.jpg', ''),
(112, 'Abu Dhabi, Abu Dhabi, United Arab Emirates', 'abu-dhabi', 'Warmer, No Snow, No Rain, Pollution free', 72000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/abu-dhabi-abu-dhabi-united-arab-emirates.jpg', ''),
(113, 'Chikmagalur, Karnataka, India', 'chikmagalur', 'Colder, No Rain', 11500, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chikmagalur-karnataka-india.jpg', ''),
(114, 'Kushalnagar, Karnataka, India', 'kushalnagar', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kushalnagar-karnataka-india.jpg', ''),
(115, 'Morena, Madhya Pradesh, India', 'morena', 'Warmer, No Snow, No Rain, Pollution free', 7000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/morena-madhya-pradesh-india.jpg', ''),
(116, 'Bangkok, Bangkok, Thailand', 'bangkok', 'Warmer, Rain, Pollution free', 63500, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/bangkok-bangkok-thailand.jpg', ''),
(117, 'Kovalam, Kerala, India', 'kovalam', 'Warmer, Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kovalam-kerala-india.jpg', ''),
(118, 'Rajasthan, India', 'rajasthan', 'Hot, Dry, No Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajasthan-india.jpg', ''),
(119, 'Shimoga, Karnataka, India', 'shimoga', 'Warmer, Rain, No Snow', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/shimoga-karnataka-india.jpg', ''),
(120, 'West Bengal, India', 'west-bengal', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/west-bengal-india.jpg', ''),
(121, 'Maafushi, Kaafu Atoll, Maldives', 'maafushi', 'Warmer, No Snow, Rain', 77400, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/maafushi-kaafu-atoll-maldives.jpg', ''),
(122, 'Varkala, Kerala, India', 'varkala', 'Warmer, Rain, Pollution free', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/varkala-kerala-india.jpg', ''),
(123, 'Dandeli, Karnataka, India', 'dandeli', 'Warmer, Rain, No Snow', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/dandeli-karnataka-india.jpg', ''),
(124, 'Sri Lanka, Asia, Sri Lanka', 'sri-lanka', 'Warmer, Rain, Pollution free', 71000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sri-lanka-asia-sri-lanka.jpg', ''),
(125, 'Galle, Southern Province, Sri Lanka', 'galle', 'Warmer, Rain, No Snow', 62000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/galle-southern-province-sri-lanka.jpg', ''),
(126, 'Gulmarg, Jammu and Kashmir, India', 'gulmarg', 'Colder, Snow, No Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/gulmarg-jammu-and-kashmir-india.jpg', ''),
(127, 'Vrindavan, Uttar Pradesh, India', 'vrindavan', 'Warmer, No Snow, No Pollution', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/vrindavan-uttar-pradesh-india.jpg', ''),
(128, 'Nathdwara, Rajasthan, India', 'nathdwara', 'Warmer, No Snow, No Pollution', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/nathdwara-rajasthan-india.jpg', ''),
(129, 'Lambasingi, Andhra Pradesh, India', 'lambasingi', 'Colder, No Rain, Foggy', 12000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lambasingi-andhra-pradesh-india.jpg', ''),
(130, 'Bahrain, Middle East, Bahrain', 'bahrain', 'Warmer, No Snow, No Rain, Pollution free', 60000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/bahrain-middle-east-bahrain.jpg', ''),
(131, 'Thailand, Southeast Asia, Thailand', 'thailand', 'Warmer, Rain, Pollution free', 60000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/thailand-southeast-asia-thailand.jpg', ''),
(132, 'Courtallam, Tamil Nadu, India', 'courtallam', 'Warmer, Rain, Pollution free', 14000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/courtallam-tamil-nadu-india.jpg', ''),
(133, 'Sringeri, Karnataka, India', 'sringeri', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sringeri-karnataka-india.jpg', ''),
(134, 'Lalitpur, Bagmati, Nepal', 'lalitpur', 'Colder, No Rain', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lalitpur-bagmati-nepal.jpg', ''),
(135, 'Srikalahasti, Andhra Pradesh, India', 'srikalahasti', 'Warmer, No Snow, No Pollution', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/srikalahasti-andhra-pradesh-india.jpg', ''),
(136, 'Varanasi, Uttar Pradesh, India', 'varanasi', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/varanasi-uttar-pradesh-india.jpg', ''),
(137, 'Chitwan, Narayani, Nepal', 'chitwan', 'Warmer, Rain, Pollution free', 78000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chitwan-narayani-nepal.jpg', ''),
(138, 'Shivpuri, Madhya Pradesh, India', 'shivpuri', 'Warmer, No Snow, No Pollution', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/shivpuri-madhya-pradesh-india.jpg', ''),
(139, 'Mahabaleshwar, Maharashtra, India', 'mahabaleshwar', 'Colder, No Rain', 21000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/mahabaleshwar-maharashtra-india.jpg', ''),
(140, 'Vengurla, Maharashtra, India', 'vengurla', 'Warmer, Rain, Pollution free', 10500, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/vengurla-maharashtra-india.jpg', ''),
(141, 'Chiang Mai, Chiang Mai, Thailand', 'chiang-mai', 'Warmer, No Snow, No Rain, Pollution free', 59000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/chiang-mai-chiang-mai-thailand.jpg', ''),
(142, 'Rajkot, Gujarat, India', 'rajkot', 'Warmer, No Snow, Rain', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rajkot-gujarat-india.jpg', ''),
(143, 'Pushkar, Rajasthan, India', 'pushkar', 'Warmer, No Rain, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/pushkar-rajasthan-india.jpg', ''),
(144, 'Negombo, Western Province, Sri Lanka', 'negombo', 'Warmer, Rain, No Snow', 55000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/negombo-western-province-sri-lanka.jpg', ''),
(145, 'Mathura, Uttar Pradesh, India', 'mathura', 'Warmer, No Snow, No Pollution', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/mathura-uttar-pradesh-india.jpg', ''),
(146, 'Lataguri, West Bengal, India', 'lataguri', 'Warmer, Rain, Pollution free', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lataguri-west-bengal-india.jpg', ''),
(147, 'Jaisalmer, Rajasthan, India', 'jaisalmer', 'Hot, Dry, No Rain, Pollution free', 19800, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/jaisalmer-rajasthan-india.jpg', ''),
(148, 'Ooty, Tamil Nadu, India', 'ooty', 'Colder, No Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ooty-tamil-nadu-india.jpg', ''),
(149, 'Unawatuna, Southern Province, Sri Lanka', 'unawatuna', 'Warmer, Rain, Pollution free', 75000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/unawatuna-southern-province-sri-lanka.jpg', ''),
(150, 'Ujjain, Madhya Pradesh, India', 'ujjain', 'Warmer, No Snow, No Pollution', 13000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ujjain-madhya-pradesh-india.jpg', ''),
(151, 'Manali, Himachal Pradesh, India', 'manali', 'Colder, Snow, No Rain, Pollution free', 25000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/manali-himachal-pradesh-india.jpg', ''),
(152, 'Periyar, Kerala, India', 'periyar', 'Warmer, Rain, Pollution free', 18300, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/periyar-kerala-india.jpg', ''),
(153, 'Khandala, Maharashtra, India', 'khandala', 'Colder, No Rain', 18600, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/khandala-maharashtra-india.jpg', ''),
(154, 'Devgad, Maharashtra, India', 'devgad', 'Warmer, No Snow, No Pollution', 11000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/devgad-maharashtra-india.jpg', ''),
(155, 'Vrindavan, Uttar Pradesh, India', 'vrindavan', 'Warmer, No Snow, No Pollution', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/vrindavan-uttar-pradesh-india.jpg', ''),
(156, 'New Delhi, Delhi, India', 'new-delhi', 'Pollution free, Colder, No Rain', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/new-delhi-delhi-india.jpg', ''),
(157, 'Araku, Andhra Pradesh, India', 'araku', 'Colder, No Rain', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/araku-andhra-pradesh-india.jpg', ''),
(158, 'Ramoji Film City, Hyderabad, India', 'ramoji-film-city', 'Warmer, No Snow, No Rain, Pollution free', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ramoji-film-city-hyderabad-india.jpg', ''),
(159, 'Malvan, Maharashtra, India', 'malvan', 'Warmer, Rain, Pollution free', 22000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/malvan-maharashtra-india.jpg', ''),
(160, 'Madikeri, Karnataka, India', 'madikeri', 'Colder, Rain, No Snow, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/madikeri-karnataka-india.jpg', ''),
(161, 'Abu Dhabi, Abu Dhabi, United Arab Emirates', 'abu-dhabi', 'Warmer, No Snow, No Rain, Pollution free', 72000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/abu-dhabi-abu-dhabi-united-arab-emirates.jpg', ''),
(162, 'Tarkarli, Maharashtra, India', 'tarkarli', 'Warmer, No Snow, Rain', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/tarkarli-maharashtra-india.jpg', ''),
(163, 'Kushalnagar, Karnataka, India', 'kushalnagar', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kushalnagar-karnataka-india.jpg', ''),
(164, 'Morena, Madhya Pradesh, India', 'morena', 'Warmer, No Snow, No Rain, Pollution free', 7000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/morena-madhya-pradesh-india.jpg', ''),
(165, 'Andaman and Nicobar, India', 'andaman-and-nicobar', 'Warmer, No Snow, Rain, Pollution free', 48000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/andaman-and-nicobar-india.jpg', ''),
(166, 'Ratnagiri, Maharashtra, India', 'ratnagiri', 'Warmer, Rain, No Snow', 18600, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ratnagiri-maharashtra-india.jpg', ''),
(167, 'Kovalam, Kerala, India', 'kovalam', 'Warmer, Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kovalam-kerala-india.jpg', ''),
(168, 'Uttarakhand, India', 'uttarakhand', 'Colder, Snow, No Rain, Pollution free', 13000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/uttarakhand-india.jpg', ''),
(169, 'Rishikesh, Uttarakhand, India', 'rishikesh', 'Warmer, No Snow, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/rishikesh-uttarakhand-india.jpg', ''),
(170, 'Kanyakumari, Tamil Nadu, India', 'kanyakumari', 'Warmer, Rain, Pollution free', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kanyakumari-tamil-nadu-india.jpg', ''),
(171, 'Auroville, Tamil Nadu, India', 'auroville', 'Warmer, No Snow, No Pollution', 17000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/auroville-tamil-nadu-india.jpg', ''),
(172, 'Maafushi, Kaafu Atoll, Maldives', 'maafushi', 'Warmer, No Snow, Rain', 77400, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/maafushi-kaafu-atoll-maldives.jpg', ''),
(173, 'Ayodhya, Uttar Pradesh, India', 'ayodhya', 'Warmer, No Snow, No Pollution', 13000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ayodhya-uttar-pradesh-india.jpg', ''),
(174, 'Horsley Hills, Andhra Pradesh, India', 'horsley-hills', 'Colder, No Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/horsley-hills-andhra-pradesh-india.jpg', ''),
(175, 'Himachal Pradesh, North India, India', 'himachal-pradesh', 'Colder, Snow, No Rain, Pollution free', 27000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/himachal-pradesh-north-india-india.jpg', ''),
(176, 'Varkala, Kerala, India', 'varkala', 'Warmer, Rain, Pollution free', 19000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/varkala-kerala-india.jpg', ''),
(177, 'Haridwar, Uttarakhand, India', 'haridwar', 'Warmer, Rain, Pollution free', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/haridwar-uttarakhand-india.jpg', ''),
(178, 'Pushkar, Rajasthan, India', 'pushkar', 'Warmer, No Rain, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/pushkar-rajasthan-india.jpg', ''),
(179, 'Negombo, Western Province, Sri Lanka', 'negombo', 'Warmer, Rain, No Snow', 55000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/negombo-western-province-sri-lanka.jpg', ''),
(180, 'Sri Lanka, Asia, Sri Lanka', 'sri-lanka', 'Warmer, Rain, Pollution free', 71000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sri-lanka-asia-sri-lanka.jpg', ''),
(181, 'Galle, Southern Province, Sri Lanka', 'galle', 'Warmer, Rain, No Snow', 62000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/galle-southern-province-sri-lanka.jpg', ''),
(182, 'Unawatuna, Southern Province, Sri Lanka', 'unawatuna', 'Warmer, Rain, Pollution free', 75000, 5, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/unawatuna-southern-province-sri-lanka.jpg', ''),
(183, 'Palani, Tamil Nadu, India', 'palani', 'Warmer, No Snow, No Pollution', 16800, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/palani-tamil-nadu-india.jpg', ''),
(184, 'Pattadakal, Karnataka, India', 'pattadakal', 'Warmer, No Snow, No Rain, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/pattadakal-karnataka-india.jpg', ''),
(185, 'Puri, Odisha, India', 'puri', 'Warmer, Rain, Pollution free', 12000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/puri-odisha-india.jpg', ''),
(186, 'Jaipur, Rajasthan, India', 'jaipur', 'Warmer, No Snow, No Rain, Pollution free', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/jaipur-rajasthan-india.jpg', ''),
(187, 'Ellora, Maharashtra, India', 'ellora', 'Warmer, No Snow, No Pollution', 12000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ellora-maharashtra-india.jpg', ''),
(188, 'Lavasa, Maharashtra, India', 'lavasa', 'Warmer, No Snow, No Rain, Pollution free', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/lavasa-maharashtra-india.jpg', ''),
(189, 'Nathdwara, Rajasthan, India', 'nathdwara', 'Warmer, No Snow, No Pollution', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/nathdwara-rajasthan-india.jpg', ''),
(190, 'Kanipakam, Andhra Pradesh, India', 'kanipakam', 'Warmer, No Snow, No Pollution', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/kanipakam-andhra-pradesh-india.jpg', ''),
(191, 'Ramanagara, Karnataka, India', 'ramanagara', 'Warmer, No Snow, No Rain, Pollution free', 8000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/ramanagara-karnataka-india.jpg', ''),
(192, 'Alappuzha, Kerala, India', 'alappuzha', 'Warmer, Rain, Pollution free', 18000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/alappuzha-kerala-india.jpg', ''),
(193, 'Palakkad, Kerala, India', 'palakkad', 'Warmer, No Snow, Rain', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/palakkad-kerala-india.jpg', ''),
(194, 'Colva, Goa, India', 'colva', 'Warmer, No Snow, Rain', 17000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/colva-goa-india.jpg', ''),
(195, 'Andhra Pradesh, South India, India', 'andhra-pradesh', 'Warmer, No Snow, Rain', 16200, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/andhra-pradesh-south-india-india.jpg', ''),
(196, 'Mysuru, Karnataka, India', 'mysuru', 'Warmer, No Snow, No Pollution', 16000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/mysuru-karnataka-india.jpg', ''),
(197, 'Barsana, Uttar Pradesh, India', 'barsana', 'Warmer, Rain', 10000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/barsana-uttar-pradesh-india.jpg', ''),
(198, 'Sillery-Gaon, West Bengal, India', 'sillery-gaon', 'Colder, No Rain', 15000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sillery-gaon-west-bengal-india.jpg', ''),
(199, 'Sikkim, India', 'sikkim', 'Colder, Snow, No Rain, Pollution free', 17400, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/sikkim-india.jpg', ''),
(200, 'Agra, Uttar Pradesh, India', 'agra', 'Warmer, No Snow, No Rain, Pollution free', 9000, 3, 'https://images.ixigo.com/node_image/f_auto,w_500/imageURL?url=https://plan-cf.ixigo.com/images/agra-uttar-pradesh-india.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `uname`, `email`, `password`) VALUES
(1, 'test', 'test@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
(2, 'test-user', 'test-user@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');

-- --------------------------------------------------------

--
-- Table structure for table `user_clicks`
--

CREATE TABLE `user_clicks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `destination_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_clicks`
--

INSERT INTO `user_clicks` (`id`, `user_id`, `destination`, `timestamp`, `destination_id`) VALUES
(2, 2, NULL, '2025-03-19 01:40:10', 2),
(3, 2, NULL, '2025-03-19 01:40:38', 6),
(4, 2, NULL, '2025-03-19 01:40:41', 8),
(5, 2, NULL, '2025-03-19 01:40:43', 1),
(6, 2, NULL, '2025-03-19 01:40:45', 17),
(7, 2, NULL, '2025-03-19 01:40:52', 31),
(8, 2, NULL, '2025-03-19 01:46:21', 1),
(9, 2, NULL, '2025-03-19 01:46:30', 1),
(10, 2, NULL, '2025-03-19 01:46:37', 1),
(11, 2, NULL, '2025-03-27 15:45:43', 11),
(12, 2, NULL, '2025-03-27 15:45:47', 6),
(13, 2, NULL, '2025-03-28 00:45:47', 3),
(14, 2, NULL, '2025-03-28 00:45:50', 3),
(15, 2, NULL, '2025-03-28 00:53:12', 3),
(16, 2, NULL, '2025-03-28 00:53:15', 2),
(17, 2, NULL, '2025-03-28 00:54:11', 6),
(18, 2, NULL, '2025-03-28 00:54:32', 2),
(19, 2, NULL, '2025-03-28 01:01:06', 2),
(20, 2, NULL, '2025-03-28 01:01:12', 5),
(21, 2, NULL, '2025-03-28 01:02:28', 3),
(22, 2, NULL, '2025-03-28 01:04:53', 3),
(23, 2, NULL, '2025-03-28 01:04:55', 3),
(24, 2, NULL, '2025-03-28 01:05:01', 5),
(25, 2, NULL, '2025-03-28 01:05:06', 9),
(26, 2, NULL, '2025-03-28 01:05:09', 10),
(27, 2, NULL, '2025-03-28 01:05:12', 10),
(28, 2, NULL, '2025-03-28 01:05:17', 11),
(29, 2, NULL, '2025-03-28 01:06:33', 3),
(30, 2, NULL, '2025-03-28 01:06:37', 3),
(31, 2, NULL, '2025-03-28 01:07:37', 2),
(32, 2, NULL, '2025-03-28 01:08:11', 2),
(33, 2, NULL, '2025-03-28 01:09:17', 3),
(34, 2, NULL, '2025-03-28 01:09:28', 14),
(35, 2, NULL, '2025-03-28 01:14:12', 3),
(36, 2, NULL, '2025-03-28 02:00:55', 2),
(37, 2, NULL, '2025-03-28 02:38:29', 5),
(38, 2, NULL, '2025-03-28 02:39:29', 8),
(39, 2, NULL, '2025-03-28 02:44:54', 10),
(40, 2, NULL, '2025-03-28 02:50:02', 11),
(41, 2, NULL, '2025-03-28 06:37:30', 1),
(42, 2, NULL, '2025-03-28 07:00:45', 1),
(52, 2, NULL, '2025-03-28 07:41:20', 11),
(53, 2, NULL, '2025-03-28 07:43:55', 3),
(54, 2, NULL, '2025-03-28 08:25:22', 15),
(55, 2, NULL, '2025-03-28 08:26:17', 6),
(56, 1, NULL, '2025-03-28 08:59:48', 2),
(57, 1, NULL, '2025-03-28 09:23:26', 3),
(58, 1, NULL, '2025-03-28 10:16:29', 1),
(59, 1, NULL, '2025-03-28 10:19:10', 2),
(60, 1, NULL, '2025-03-28 10:19:47', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `user_clicks`
--
ALTER TABLE `user_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_clicks`
--
ALTER TABLE `user_clicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_clicks`
--
ALTER TABLE `user_clicks`
  ADD CONSTRAINT `user_clicks_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
