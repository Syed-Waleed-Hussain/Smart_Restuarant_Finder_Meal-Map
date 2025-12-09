

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


SET foreign_key_checks = 0;

--
-- Database: `smart_restaurant_finder`

-- Table structure for table `address`
--
DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `StreetAddress` varchar(512) DEFAULT NULL,
  `Area` varchar(200) DEFAULT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT 'Pakistan',
  `ZipCode` varchar(20) DEFAULT NULL,
  `Latitude` decimal(10,7) DEFAULT NULL,
  `Longitude` decimal(10,7) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `address` (`AddressID`, `StreetAddress`, `Area`, `City`, `State`, `Country`, `ZipCode`, `Latitude`, `Longitude`, `CreatedAt`, `UpdatedAt`) VALUES
(4001, 'Street 1', 'Clifton', 'Karachi', 'Sindh', 'Pakistan', '75000', 24.8065320, 67.0362650, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4002, 'Street 2', 'DHA', 'Karachi', 'Sindh', 'Pakistan', '75001', 24.8366370, 67.0946270, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4003, 'Street 3', 'Gulshan-e-Iqbal', 'Karachi', 'Sindh', 'Pakistan', '75002', 24.9283130, 67.0823950, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4004, 'Street 4', 'North Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '75003', 24.9406810, 67.0401030, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4005, 'Street 5', 'Bahadurabad', 'Karachi', 'Sindh', 'Pakistan', '75004', 24.9043990, 67.0698900, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4006, 'Street 6', 'PECHS', 'Karachi', 'Sindh', 'Pakistan', '75005', 24.8618620, 67.0627310, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4007, 'Street 7', 'Karachi Cantt', 'Karachi', 'Sindh', 'Pakistan', '75006', 24.8621850, 67.0122170, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4008, 'Street 8', 'Korangi', 'Karachi', 'Sindh', 'Pakistan', '75007', 24.8552790, 67.1388940, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4009, 'Street 9', 'Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '75008', 24.9345340, 67.0483410, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4010, 'Street 10', 'Malir', 'Karachi', 'Sindh', 'Pakistan', '75009', 24.9770180, 67.2018350, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4011, 'Street 11', 'Gulberg', 'Karachi', 'Sindh', 'Pakistan', '75010', 24.8856230, 67.0616990, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4012, 'Street 12', 'Jetty', 'Karachi', 'Sindh', 'Pakistan', '75011', 24.8067900, 67.0303210, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4013, 'Street 13', 'Saddar', 'Karachi', 'Sindh', 'Pakistan', '75012', 24.8644640, 67.0186470, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4014, 'Street 14', 'Garden', 'Karachi', 'Sindh', 'Pakistan', '75013', 24.8731890, 67.0345490, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4015, 'Street 15', 'Clifton Block 4', 'Karachi', 'Sindh', 'Pakistan', '75014', 24.8149940, 67.0351930, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4016, 'Street 16', 'University Road', 'Karachi', 'Sindh', 'Pakistan', '75015', 24.9145280, 67.0516000, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4017, 'Street 17', 'Sindhi Muslim', 'Karachi', 'Sindh', 'Pakistan', '75016', 24.9179590, 67.0716800, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4018, 'Street 18', 'Shahrah-e-Faisal', 'Karachi', 'Sindh', 'Pakistan', '75017', 24.8723480, 67.0812090, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4019, 'Street 19', 'Gulistan-e-Johar', 'Karachi', 'Sindh', 'Pakistan', '75018', 24.9170370, 67.1279380, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4020, 'Street 20', 'Boat Basin', 'Karachi', 'Sindh', 'Pakistan', '75019', 24.8216260, 67.0368050, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4021, 'Street 21', 'Bahadurabad Block 2', 'Karachi', 'Sindh', 'Pakistan', '75020', 24.9053940, 67.0747860, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4022, 'Street 22', 'Dhoraji', 'Karachi', 'Sindh', 'Pakistan', '75021', 24.8301190, 67.0306300, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4023, 'Street 23', 'Liaquatabad', 'Karachi', 'Sindh', 'Pakistan', '75022', 24.9494690, 67.0208570, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4024, 'Street 24', 'Sultanabad', 'Karachi', 'Sindh', 'Pakistan', '75023', 24.9282840, 67.0417530, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4025, 'Street 25', 'Gizri', 'Karachi', 'Sindh', 'Pakistan', '75024', 24.8122310, 67.0151180, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4026, 'Street 26', 'PECHS Block 2', 'Karachi', 'Sindh', 'Pakistan', '75025', 24.8614990, 67.0553810, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4027, 'Street 27', 'Korangi Industrial', 'Karachi', 'Sindh', 'Pakistan', '75026', 24.8483810, 67.1608830, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4028, 'Street 28', 'Clifton Seaside', 'Karachi', 'Sindh', 'Pakistan', '75027', 24.8075890, 67.0266740, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4029, 'Street 29', 'Gulshan Block 13', 'Karachi', 'Sindh', 'Pakistan', '75028', 24.9266900, 67.0821420, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4030, 'Street 30', 'Nazimabad Block 3', 'Karachi', 'Sindh', 'Pakistan', '75029', 24.9339040, 67.0359690, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4031, 'Street 31', 'Model Colony', 'Karachi', 'Sindh', 'Pakistan', '75030', 24.8665420, 67.0375350, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4032, 'Street 32', 'Frere Town', 'Karachi', 'Sindh', 'Pakistan', '75031', 24.8530060, 67.0145930, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4033, 'Street 33', 'KDA Scheme', 'Karachi', 'Sindh', 'Pakistan', '75032', 24.8268350, 67.0196260, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4034, 'Street 34', 'Hill Park', 'Karachi', 'Sindh', 'Pakistan', '75033', 24.8809790, 67.0395210, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4035, 'Street 35', 'Mehmoodabad', 'Karachi', 'Sindh', 'Pakistan', '75034', 24.9016630, 67.0198560, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4036, 'Street 36', 'Civic Center', 'Karachi', 'Sindh', 'Pakistan', '75035', 24.8550220, 67.0289040, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4037, 'Street 37', 'Bahadurabad Market', 'Karachi', 'Sindh', 'Pakistan', '75036', 24.9109540, 67.0715580, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4038, 'Street 38', 'PECHS Block 6', 'Karachi', 'Sindh', 'Pakistan', '75037', 24.8626870, 67.0617920, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4039, 'Street 39', 'Gulshan-e-Maymar', 'Karachi', 'Sindh', 'Pakistan', '75038', 24.9008420, 67.0500290, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4040, 'Street 40', 'Clifton Block 7', 'Karachi', 'Sindh', 'Pakistan', '75039', 24.8205130, 67.0316850, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4041, 'Street 41', 'Boat Basin Road', 'Karachi', 'Sindh', 'Pakistan', '75040', 24.8154620, 67.0329450, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4042, 'Street 42', 'Hyderi', 'Karachi', 'Sindh', 'Pakistan', '75041', 24.9302280, 67.0243470, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4043, 'Street 43', 'Saba', 'Karachi', 'Sindh', 'Pakistan', '75042', 24.8917170, 67.0380000, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4044, 'Street 44', 'Karsaz', 'Karachi', 'Sindh', 'Pakistan', '75043', 24.8649610, 67.0707330, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4045, 'Street 45', 'Khyaban-e-Iqbal', 'Karachi', 'Sindh', 'Pakistan', '75044', 24.9137930, 67.1186950, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4046, 'Street 46', 'Shireen Jinnah Colony', 'Karachi', 'Sindh', 'Pakistan', '75045', 24.9366170, 67.0648720, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4047, 'Street 47', 'Clifton', 'Karachi', 'Sindh', 'Pakistan', '75046', 24.8136180, 67.0299360, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4048, 'Street 48', 'DHA', 'Karachi', 'Sindh', 'Pakistan', '75047', 24.8372540, 67.0951180, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4049, 'Street 49', 'Gulshan-e-Iqbal', 'Karachi', 'Sindh', 'Pakistan', '75048', 24.9263540, 67.0807110, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4050, 'Street 50', 'North Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '75049', 24.9341410, 67.0400360, '2025-10-26 19:09:51', '2025-10-27 17:11:27'),
(4051, 'Shop 12, Khayaban-e-Shahbaz, Lane 4', 'DHA Phase 6', 'Karachi', 'Sindh', 'Pakistan', '75500', 24.8123567, 67.0678923, '2024-02-10 14:25:32', '2024-05-18 11:12:09'),
(4052, 'Plot 18-C, Bukhari Commercial Lane 2', 'DHA Phase 6', 'Karachi', 'Sindh', 'Pakistan', '75500', 24.8167453, 67.0602748, '2024-03-02 10:18:41', '2024-07-25 16:27:59'),
(4053, 'Shop 4, Main Zamzama Boulevard', 'DHA Phase 5', 'Karachi', 'Sindh', 'Pakistan', '75600', 24.8129134, 67.0459832, '2024-01-14 09:10:15', '2024-08-01 14:46:50'),
(4054, 'Ground Floor, Dolmen Mall Clifton', 'Clifton Block 4', 'Karachi', 'Sindh', 'Pakistan', '75600', 24.8145709, 67.0301278, '2024-04-20 11:05:33', '2024-06-22 12:35:48'),
(4055, 'Main Khayaban-e-Ittehad Road', 'DHA Phase 2 Extension', 'Karachi', 'Sindh', 'Pakistan', '75500', 24.8213098, 67.0687211, '2024-02-28 16:09:24', '2024-05-12 10:47:32'),
(4056, 'Shop 7, LuckyOne Mall, Rashid Minhas Road', 'Gulshan-e-Iqbal Block 21', 'Karachi', 'Sindh', 'Pakistan', '75300', 24.9257102, 67.0965417, '2024-03-15 13:45:12', '2024-08-03 09:15:59'),
(4057, 'Plot 11, Main University Road', 'Gulistan-e-Johar Block 15', 'Karachi', 'Sindh', 'Pakistan', '75290', 24.9123145, 67.1367108, '2024-01-22 15:17:46', '2024-04-11 17:56:21'),
(4058, 'Shop 22, Ocean Mall, Clifton', 'Clifton Block 9', 'Karachi', 'Sindh', 'Pakistan', '75600', 24.8165403, 67.0291456, '2024-03-29 09:35:44', '2024-07-30 10:42:27'),
(4059, 'Shop 9, Tariq Road, near Dolmen Center', 'PECHS Block 2', 'Karachi', 'Sindh', 'Pakistan', '75400', 24.8695021, 67.0641179, '2024-04-07 18:28:36', '2024-07-12 14:58:59'),
(4060, 'Building 34, Korangi Industrial Area', 'Korangi Sector 24', 'Karachi', 'Sindh', 'Pakistan', '74900', 24.8314578, 67.1236509, '2024-02-19 08:12:18', '2024-05-21 11:10:49'),
(4061, 'Shop 5, Hill Park Road', 'Hill Park', 'Karachi', 'Sindh', 'Pakistan', '75350', 24.8801290, 67.0418720, '2024-03-05 10:45:12', '2024-06-20 13:15:27'),
(4062, 'Plot 16, Mehmoodabad Main Street', 'Mehmoodabad', 'Karachi', 'Sindh', 'Pakistan', '75410', 24.9012240, 67.0201100, '2024-01-18 14:22:39', '2024-05-01 16:47:55'),
(4063, 'Shop 11, Frere Town Lane 3', 'Frere Town', 'Karachi', 'Sindh', 'Pakistan', '75060', 24.8535120, 67.0150010, '2024-02-22 09:13:57', '2024-07-08 12:55:44'),
(4064, 'Ground Floor, KDA Scheme Plot 45', 'KDA Scheme', 'Karachi', 'Sindh', 'Pakistan', '75070', 24.8265120, 67.0194120, '2024-03-30 11:55:20', '2024-06-30 10:33:28'),
(4065, 'Shop 7, Gulshan-e-Maymar Main Road', 'Gulshan-e-Maymar', 'Karachi', 'Sindh', 'Pakistan', '75100', 24.9004120, 67.0498750, '2024-04-10 08:44:33', '2024-07-21 15:42:11'),
(4066, 'Plot 22, Boat Basin Road', 'Boat Basin', 'Karachi', 'Sindh', 'Pakistan', '75020', 24.8152100, 67.0369000, '2024-02-28 12:17:45', '2024-05-17 11:25:39'),
(4067, 'Shop 9, Bahadurabad Block 2', 'Bahadurabad', 'Karachi', 'Sindh', 'Pakistan', '75020', 24.9051700, 67.0741200, '2024-01-25 16:33:21', '2024-06-05 13:47:52'),
(4068, 'Plot 14, PECHS Block 6 Main Street', 'PECHS Block 6', 'Karachi', 'Sindh', 'Pakistan', '75405', 24.8625100, 67.0615000, '2024-03-12 10:05:36', '2024-06-28 12:16:18'),
(4069, 'Shop 8, Clifton Seaside Lane 2', 'Clifton Seaside', 'Karachi', 'Sindh', 'Pakistan', '75600', 24.8079500, 67.0265200, '2024-04-15 09:48:59', '2024-07-19 14:20:44'),
(4070, 'Plot 10, North Nazimabad Block 3', 'North Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '75029', 24.9341000, 67.0359000, '2024-02-10 11:20:47', '2024-05-22 13:55:21'),
(4071, 'Shop 3, Gulberg Main Road', 'Gulberg', 'Karachi', 'Sindh', 'Pakistan', '75320', 24.8852100, 67.0615000, '2024-03-18 10:22:15', '2024-06-12 12:44:28'),
(4072, 'Plot 7, Jetty Road', 'Jetty', 'Karachi', 'Sindh', 'Pakistan', '75011', 24.8069000, 67.0304000, '2024-01-30 09:45:37', '2024-05-05 11:33:49'),
(4073, 'Shop 5, Saddar Main Street', 'Saddar', 'Karachi', 'Sindh', 'Pakistan', '75012', 24.8645000, 67.0186000, '2024-02-22 11:17:54', '2024-06-20 10:25:33'),
(4074, 'Ground Floor, Garden Road', 'Garden', 'Karachi', 'Sindh', 'Pakistan', '75013', 24.8732000, 67.0345000, '2024-03-08 08:55:12', '2024-07-01 13:10:27'),
(4075, 'Plot 2, Clifton Block 4', 'Clifton Block 4', 'Karachi', 'Sindh', 'Pakistan', '75014', 24.8150000, 67.0352000, '2024-04-02 12:35:44', '2024-07-15 14:55:36'),
(4076, 'Shop 9, University Road', 'University Road', 'Karachi', 'Sindh', 'Pakistan', '75015', 24.9145000, 67.0516000, '2024-01-28 13:45:27', '2024-06-08 11:10:18'),
(4077, 'Plot 14, Sindhi Muslim Society', 'Sindhi Muslim', 'Karachi', 'Sindh', 'Pakistan', '75016', 24.9180000, 67.0716800, '2024-03-12 09:22:48', '2024-05-29 12:44:52'),
(4078, 'Shop 6, Shahrah-e-Faisal', 'Shahrah-e-Faisal', 'Karachi', 'Sindh', 'Pakistan', '75017', 24.8723000, 67.0812000, '2024-02-14 10:17:33', '2024-06-19 14:05:28'),
(4079, 'Plot 11, Gulistan-e-Johar', 'Gulistan-e-Johar', 'Karachi', 'Sindh', 'Pakistan', '75018', 24.9170300, 67.1279000, '2024-04-18 11:35:21', '2024-07-03 15:20:44'),
(4080, 'Shop 2, Boat Basin', 'Boat Basin', 'Karachi', 'Sindh', 'Pakistan', '75019', 24.8216000, 67.0368000, '2024-03-05 08:55:12', '2024-06-22 13:48:59'),
(4081, 'Shop 8, Bahadurabad Main Street', 'Bahadurabad', 'Karachi', 'Sindh', 'Pakistan', '75020', 24.9054000, 67.0747800, '2024-01-20 10:15:33', '2024-05-12 12:45:27'),
(4082, 'Plot 15, PECHS Block 2', 'PECHS Block 2', 'Karachi', 'Sindh', 'Pakistan', '75405', 24.8615000, 67.0553800, '2024-02-10 09:25:47', '2024-06-01 11:32:50'),
(4083, 'Shop 4, Korangi Industrial Area', 'Korangi Industrial', 'Karachi', 'Sindh', 'Pakistan', '75026', 24.8483800, 67.1608800, '2024-03-05 11:10:12', '2024-06-15 14:05:36'),
(4084, 'Plot 7, Clifton Seaside', 'Clifton Seaside', 'Karachi', 'Sindh', 'Pakistan', '75027', 24.8075900, 67.0266700, '2024-04-12 08:55:44', '2024-07-10 13:48:59'),
(4085, 'Shop 3, Gulshan Block 13', 'Gulshan-e-Iqbal', 'Karachi', 'Sindh', 'Pakistan', '75028', 24.9266900, 67.0821400, '2024-01-28 12:35:21', '2024-05-30 14:22:18'),
(4086, 'Plot 9, Nazimabad Block 3', 'North Nazimabad', 'Karachi', 'Sindh', 'Pakistan', '75029', 24.9339040, 67.0359690, '2024-02-15 10:42:33', '2024-06-20 13:15:44'),
(4087, 'Shop 5, Model Colony Main Street', 'Model Colony', 'Karachi', 'Sindh', 'Pakistan', '75030', 24.8665420, 67.0375350, '2024-03-20 09:18:12', '2024-07-01 12:48:59'),
(4088, 'Plot 12, Frere Town Lane 4', 'Frere Town', 'Karachi', 'Sindh', 'Pakistan', '75031', 24.8530060, 67.0145930, '2024-04-05 11:55:33', '2024-07-20 14:05:21'),
(4089, 'Shop 8, KDA Scheme', 'KDA Scheme', 'Karachi', 'Sindh', 'Pakistan', '75032', 24.8268350, 67.0196260, '2024-02-28 08:45:12', '2024-06-12 11:25:44'),
(4090, 'Plot 4, Hill Park Main Road', 'Hill Park', 'Karachi', 'Sindh', 'Pakistan', '75033', 24.8809790, 67.0395210, '2024-01-18 10:22:44', '2024-05-08 13:48:12'),
(4091, 'Shop 6, Mehmoodabad Market', 'Mehmoodabad', 'Karachi', 'Sindh', 'Pakistan', '75034', 24.9016630, 67.0198560, '2024-03-12 09:45:21', '2024-06-18 12:55:33'),
(4092, 'Plot 10, Civic Center Main Road', 'Civic Center', 'Karachi', 'Sindh', 'Pakistan', '75035', 24.8550220, 67.0289040, '2024-01-28 10:12:44', '2024-05-25 13:42:19'),
(4093, 'Shop 2, Bahadurabad Market', 'Bahadurabad', 'Karachi', 'Sindh', 'Pakistan', '75036', 24.9109540, 67.0715580, '2024-02-15 11:35:12', '2024-06-20 14:22:33'),
(4094, 'Plot 8, PECHS Block 6 Main Street', 'PECHS Block 6', 'Karachi', 'Sindh', 'Pakistan', '75037', 24.8626870, 67.0617920, '2024-03-05 08:55:44', '2024-07-10 12:48:59'),
(4095, 'Shop 9, Gulshan-e-Maymar Main Road', 'Gulshan-e-Maymar', 'Karachi', 'Sindh', 'Pakistan', '75038', 24.9008420, 67.0500290, '2024-04-10 10:35:21', '2024-07-18 14:15:42'),
(4096, 'Plot 11, Clifton Block 7', 'Clifton Block 7', 'Karachi', 'Sindh', 'Pakistan', '75039', 24.8205130, 67.0316850, '2024-02-20 09:18:33', '2024-06-25 13:42:11'),
(4097, 'Shop 3, Boat Basin Road', 'Boat Basin', 'Karachi', 'Sindh', 'Pakistan', '75040', 24.8154620, 67.0329450, '2024-03-15 08:55:12', '2024-07-01 12:48:36'),
(4098, 'Plot 7, Hyderi Main Street', 'Hyderi', 'Karachi', 'Sindh', 'Pakistan', '75041', 24.9302280, 67.0243470, '2024-01-22 11:10:44', '2024-05-30 14:05:21'),
(4099, 'Shop 5, Saba Road', 'Saba', 'Karachi', 'Sindh', 'Pakistan', '75042', 24.8917170, 67.0380000, '2024-03-05 09:25:33', '2024-06-18 12:55:44'),
(4100, 'Plot 12, Karsaz Main Street', 'Karsaz', 'Karachi', 'Sindh', 'Pakistan', '75043', 24.8649610, 67.0707330, '2024-02-10 10:35:12', '2024-06-12 13:48:19');


-- Table structure for table `cuisine`
DROP TABLE IF EXISTS `cuisine`;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `cuisine` (
  `CuisineID` int(11) NOT NULL,
  `CuisineType` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `cuisine` (`CuisineID`, `CuisineType`, `Description`, `CreatedAt`) VALUES
(1, 'Pakistani', 'Pakistani cuisine', '2025-10-26 19:09:50'),
(2, 'BBQ', 'BBQ cuisine', '2025-10-26 19:09:50'),
(3, 'Chinese', 'Chinese cuisine', '2025-10-26 19:09:50'),
(4, 'Italian', 'Italian cuisine', '2025-10-26 19:09:50'),
(5, 'Fast Food', 'Fast Food cuisine', '2025-10-26 19:09:50'),
(6, 'Cafe', 'Cafe cuisine', '2025-10-26 19:09:50'),
(7, 'Continental', 'Continental cuisine', '2025-10-26 19:09:50'),
(8, 'Seafood', 'Seafood cuisine', '2025-10-26 19:09:50'),
(9, 'Desserts', 'Desserts cuisine', '2025-10-26 19:09:50'),
(10, 'Middle Eastern', 'Middle Eastern cuisine', '2025-10-26 19:09:50'),
(11, 'Japanese', 'Japanese cuisine', '2025-10-26 19:09:50'),
(12, 'Thai', 'Thai cuisine', '2025-10-26 19:09:50'),
(13, 'Mexican', 'Mexican cuisine', '2025-10-26 19:09:50'),
(14, 'Indian', 'Indian cuisine', '2025-10-26 19:09:50'),
(15, 'Mediterranean', 'Mediterranean cuisine', '2025-10-26 19:09:50'),
(16, 'Lebanese', 'Lebanese cuisine', '2025-10-26 19:09:50'),
(17, 'Korean', 'Korean cuisine', '2025-10-26 19:09:50'),
(18, 'Vietnamese', 'Vietnamese cuisine', '2025-10-26 19:09:50');

-- Table structure for table `favorite`

DROP TABLE IF EXISTS `favorite`;

CREATE TABLE `favorite` (
  `FavoriteID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
INSERT INTO `favorite` (`FavoriteID`, `UserID`, `RestaurantID`, `CreatedAt`) VALUES
(6001, 2001, 3003, '2025-05-15 12:40:00'),
(6002, 2001, 3007, '2025-05-18 09:22:10'),
(6003, 2002, 3010, '2025-05-19 10:45:31'),
(6004, 2002, 3012, '2025-05-22 17:33:50'),
(6005, 2003, 3005, '2025-05-21 14:12:20'),
(6006, 2003, 3014, '2025-05-23 11:15:44'),
(6007, 2004, 3021, '2025-05-20 16:30:09'),
(6008, 2004, 3023, '2025-05-25 18:45:28'),
(6009, 2005, 3019, '2025-05-27 15:40:32'),
(6010, 2005, 3022, '2025-05-29 19:10:44'),
(6011, 2006, 3030, '2025-06-01 13:12:11'),
(6012, 2006, 3032, '2025-06-02 09:40:33'),
(6013, 2007, 3028, '2025-06-03 11:28:21'),
(6014, 2007, 3035, '2025-06-04 16:17:52'),
(6015, 2008, 3037, '2025-06-05 14:44:02'),
(6016, 2008, 3041, '2025-06-06 12:20:36'),
(6017, 2009, 3040, '2025-06-08 09:45:01'),
(6018, 2009, 3043, '2025-06-10 18:15:54'),
(6019, 2010, 3044, '2025-06-12 15:12:42'),
(6020, 2010, 3046, '2025-06-13 10:23:09'),
(6021, 2011, 3047, '2025-06-14 12:42:37'),
(6022, 2011, 3050, '2025-06-16 11:29:55'),
(6023, 2012, 3052, '2025-06-17 17:33:18'),
(6024, 2012, 3055, '2025-06-19 10:17:49'),
(6025, 2013, 3057, '2025-06-20 14:41:12'),
(6026, 2013, 3060, '2025-06-21 09:20:30'),
(6027, 2014, 3061, '2025-06-22 12:10:18'),
(6028, 2014, 3064, '2025-06-23 18:32:42'),
(6029, 2015, 3065, '2025-06-24 14:28:36'),
(6030, 2015, 3069, '2025-06-25 16:44:59'),
(6031, 2016, 3070, '2025-06-27 09:45:41'),
(6032, 2016, 3073, '2025-06-28 15:16:07'),
(6033, 2017, 3075, '2025-06-29 13:20:55'),
(6034, 2017, 3078, '2025-06-30 17:12:29'),
(6035, 2018, 3080, '2025-07-01 10:32:40'),
(6036, 2018, 3082, '2025-07-02 11:55:12'),
(6037, 2019, 3083, '2025-07-03 13:25:17'),
(6038, 2019, 3087, '2025-07-04 15:49:55'),
(6039, 2020, 3089, '2025-07-05 09:45:22'),
(6040, 2020, 3092, '2025-07-06 16:30:00'),
(6041, 2021, 3093, '2025-07-07 14:14:38'),
(6042, 2021, 3095, '2025-07-08 10:28:19'),
(6043, 2022, 3096, '2025-07-09 11:52:01'),
(6044, 2022, 3098, '2025-07-10 17:45:27'),
(6045, 2023, 3002, '2025-07-11 13:10:12'),
(6046, 2023, 3004, '2025-07-12 09:39:23'),
(6047, 2024, 3008, '2025-07-13 15:44:40'),
(6048, 2024, 3011, '2025-07-14 17:19:55'),
(6049, 2025, 3013, '2025-07-15 10:47:07'),
(6050, 2025, 3015, '2025-07-16 14:22:18'),
(6051, 2026, 3020, '2025-07-17 12:45:22'),
(6052, 2026, 3024, '2025-07-18 09:33:14'),
(6053, 2027, 3026, '2025-07-19 11:05:46'),
(6054, 2027, 3029, '2025-07-20 18:42:33'),
(6055, 2028, 3031, '2025-07-21 13:25:09'),
(6056, 2028, 3034, '2025-07-22 16:10:44'),
(6057, 2029, 3036, '2025-07-23 12:55:30'),
(6058, 2029, 3039, '2025-07-24 15:33:22'),
(6059, 2030, 3042, '2025-07-25 10:15:16'),
(6060, 2030, 3045, '2025-07-26 14:09:58'),
(6061, 2031, 3048, '2025-07-27 11:40:24'),
(6062, 2031, 3051, '2025-07-28 16:33:11'),
(6063, 2032, 3054, '2025-07-29 09:49:40'),
(6064, 2032, 3056, '2025-07-30 13:18:56'),
(6065, 2033, 3058, '2025-07-31 12:20:00'),
(6066, 2033, 3062, '2025-08-01 18:07:22'),
(6067, 2034, 3063, '2025-08-02 10:34:40'),
(6068, 2034, 3066, '2025-08-03 14:20:11'),
(6069, 2035, 3068, '2025-08-04 09:44:27'),
(6070, 2035, 3071, '2025-08-05 17:35:18'),
(6071, 2036, 3074, '2025-08-06 13:22:29'),
(6072, 2036, 3077, '2025-08-07 15:49:12'),
(6073, 2037, 3079, '2025-08-08 12:33:36'),
(6074, 2037, 3081, '2025-08-09 18:44:10'),
(6075, 2038, 3084, '2025-08-10 10:41:00'),
(6076, 2038, 3086, '2025-08-11 14:55:19'),
(6077, 2039, 3088, '2025-08-12 13:23:48'),
(6078, 2039, 3090, '2025-08-13 15:14:33'),
(6079, 2040, 3091, '2025-08-14 10:55:01'),
(6080, 2040, 3094, '2025-08-15 12:20:20'),
(6081, 2041, 3097, '2025-08-16 18:35:44'),
(6082, 2041, 3099, '2025-08-17 14:00:55'),
(6083, 2042, 3100, '2025-08-18 11:49:39'),
(6084, 2042, 3095, '2025-08-19 17:12:18'),
(6085, 2043, 3083, '2025-08-20 10:10:42'),
(6086, 2043, 3089, '2025-08-21 12:44:09'),
(6087, 2044, 3072, '2025-08-22 14:22:16'),
(6088, 2044, 3076, '2025-08-23 09:37:55'),
(6089, 2045, 3067, '2025-08-24 15:11:43'),
(6090, 2045, 3070, '2025-08-25 10:42:20'),
(6091, 2046, 3059, '2025-08-26 11:35:09'),
(6092, 2046, 3061, '2025-08-27 13:14:41'),
(6093, 2047, 3049, '2025-08-28 15:23:56'),
(6094, 2047, 3053, '2025-08-29 09:54:24'),
(6095, 2048, 3040, '2025-08-30 12:12:33'),
(6096, 2048, 3047, '2025-08-31 16:45:10'),
(6097, 2049, 3038, '2025-09-01 10:31:50'),
(6098, 2049, 3044, '2025-09-02 17:27:19'),
(6099, 2050, 3033, '2025-09-03 11:49:40'),
(6100, 2050, 3035, '2025-09-04 15:32:20'),
(6101, 2051, 3025, '2025-09-05 10:29:12'),
(6102, 2051, 3027, '2025-09-06 14:18:44'),
(6103, 2052, 3009, '2025-09-07 12:05:50'),
(6104, 2052, 3018, '2025-09-08 16:50:00');

--
-- Table structure for table `menu`

DROP TABLE IF EXISTS `menuitem`;
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `MenuID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `Title` varchar(200) DEFAULT 'Main Menu',
  `Description` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menu` (`MenuID`, `RestaurantID`, `Title`, `Description`, `CreatedAt`) VALUES
(5001, 3001, 'Main Menu', 'Explore our finest dishes made with fresh ingredients, crafted to delight your taste buds.', '2025-10-26 19:09:52'),
(5002, 3002, 'Main Menu', 'Savor the authentic flavors with every bite from our carefully curated menu.', '2025-10-26 19:09:52'),
(5003, 3003, 'Main Menu', 'A perfect blend of classic and modern recipes to satisfy every craving.', '2025-10-26 19:09:52'),
(5004, 3003, 'Specials', 'Exclusive chef specials that bring a unique taste experience.', '2025-10-26 19:09:52'),
(5005, 3004, 'Main Menu', 'Fresh, flavorful, and full of variety – something for everyone.', '2025-10-26 19:09:52'),
(5006, 3004, 'Specials', 'Limited-time seasonal delights prepared with love.', '2025-10-26 19:09:52'),
(5007, 3005, 'Main Menu', 'Classic dishes made to perfection for a memorable meal.', '2025-10-26 19:09:52'),
(5008, 3005, 'Specials', 'Our chef’s hand-picked specials to tantalize your taste buds.', '2025-10-26 19:09:52'),
(5009, 3006, 'Main Menu', 'A journey of flavors from traditional to modern culinary delights.', '2025-10-26 19:09:52'),
(5010, 3007, 'Main Menu', 'Indulge in our signature dishes prepared with the freshest ingredients.', '2025-10-26 19:09:52'),
(5011, 3008, 'Main Menu', 'From appetizers to desserts, enjoy a complete dining experience.', '2025-10-26 19:09:52'),
(5012, 3009, 'Main Menu', 'Every dish tells a story – fresh, delicious, and unforgettable.', '2025-10-26 19:09:52'),
(5013, 3010, 'Main Menu', 'Delicious meals crafted to satisfy all your cravings.', '2025-10-26 19:09:52'),
(5014, 3010, 'Specials', 'Chef’s specials prepared with seasonal and fresh ingredients.', '2025-10-26 19:09:52'),
(5015, 3011, 'Main Menu', 'Experience classic flavors elevated with modern twists.', '2025-10-26 19:09:52'),
(5016, 3011, 'Specials', 'Try our limited-time offerings, specially curated for you.', '2025-10-26 19:09:52'),
(5017, 3012, 'Main Menu', 'Freshly prepared dishes that bring comfort and delight in every bite.', '2025-10-26 19:09:52'),
(5018, 3013, 'Main Menu', 'A wide variety of flavors to satisfy every palate.', '2025-10-26 19:09:52'),
(5019, 3014, 'Main Menu', 'Enjoy our signature dishes made from premium ingredients.', '2025-10-26 19:09:52'),
(5020, 3015, 'Main Menu', 'Delightful meals crafted to make every dining moment special.', '2025-10-26 19:09:52'),
(5021, 3016, 'Main Menu', 'Traditional recipes combined with modern culinary techniques.', '2025-10-26 19:09:52'),
(5022, 3017, 'Main Menu', 'A menu full of flavor, freshness, and variety.', '2025-10-26 19:09:52'),
(5023, 3018, 'Main Menu', 'Perfectly balanced dishes for breakfast, lunch, and dinner.', '2025-10-26 19:09:52'),
(5024, 3018, 'Specials', 'Seasonal delights crafted with care to surprise your palate.', '2025-10-26 19:09:52'),
(5025, 3019, 'Main Menu', 'Classic favorites with a touch of innovation.', '2025-10-26 19:09:52'),
(5026, 3019, 'Specials', 'Limited-edition specials, only available for a short time.', '2025-10-26 19:09:52'),
(5027, 3020, 'Main Menu', 'A menu designed for food lovers with diverse tastes.', '2025-10-26 19:09:52'),
(5028, 3021, 'Main Menu', 'Tantalizing flavors and fresh ingredients in every dish.', '2025-10-26 19:09:52'),
(5029, 3022, 'Main Menu', 'Every dish is a masterpiece, crafted to perfection.', '2025-10-26 19:09:52'),
(5030, 3023, 'Main Menu', 'A delightful combination of traditional and contemporary cuisine.', '2025-10-26 19:09:52'),
(5031, 3024, 'Main Menu', 'Satisfy your hunger with our deliciously prepared meals.', '2025-10-26 19:09:52'),
(5032, 3025, 'Main Menu', 'Fresh, tasty, and unforgettable – enjoy every bite.', '2025-10-26 19:09:52'),
(5033, 3026, 'Main Menu', 'Our main menu offers a variety of flavors for every craving.', '2025-10-26 19:09:52'),
(5034, 3026, 'Specials', 'Chef’s specials featuring unique and seasonal ingredients.', '2025-10-26 19:09:52'),
(5035, 3027, 'Main Menu', 'Classic dishes reimagined with a modern twist.', '2025-10-26 19:09:52'),
(5036, 3028, 'Main Menu', 'Delicious recipes made with love and quality ingredients.', '2025-10-26 19:09:52'),
(5037, 3029, 'Main Menu', 'Experience the best flavors from our signature menu.', '2025-10-26 19:09:52'),
(5038, 3030, 'Main Menu', 'Freshly prepared meals to delight your senses.', '2025-10-26 19:09:52'),
(5039, 3031, 'Main Menu', 'Dishes designed to satisfy every craving and appetite.', '2025-10-26 19:09:52'),
(5040, 3032, 'Main Menu', 'Savor delicious meals crafted with premium ingredients.', '2025-10-26 19:09:52'),
(5041, 3032, 'Specials', 'Limited specials prepared by our master chefs.', '2025-10-26 19:09:52'),
(5042, 3033, 'Main Menu', 'From appetizers to desserts, enjoy our diverse offerings.', '2025-10-26 19:09:52'),
(5043, 3033, 'Specials', 'Seasonal dishes crafted to surprise and delight.', '2025-10-26 19:09:52'),
(5044, 3034, 'Main Menu', 'A wide variety of dishes for every taste and preference.', '2025-10-26 19:09:52'),
(5045, 3035, 'Main Menu', 'Delicious meals made from fresh, locally sourced ingredients.', '2025-10-26 19:09:52'),
(5046, 3036, 'Main Menu', 'Every meal prepared to bring joy and flavor to your table.', '2025-10-26 19:09:52'),
(5047, 3037, 'Main Menu', 'Satisfy your cravings with our wide variety of dishes.', '2025-10-26 19:09:52'),
(5048, 3038, 'Main Menu', 'Fresh, flavorful, and exciting dishes await you.', '2025-10-26 19:09:52'),
(5049, 3039, 'Main Menu', 'Enjoy classic flavors made with premium ingredients.', '2025-10-26 19:09:52'),
(5050, 3040, 'Main Menu', 'A delightful menu full of flavor and variety.', '2025-10-26 19:09:52'),
(5051, 3041, 'Main Menu', 'Dishes crafted with care to provide a memorable dining experience.', '2025-10-26 19:09:52'),
(5052, 3042, 'Main Menu', 'A menu designed to satisfy every appetite and craving.', '2025-10-26 19:09:52'),
(5053, 3043, 'Main Menu', 'Classic and contemporary dishes for an unforgettable meal.', '2025-10-26 19:09:52'),
(5054, 3043, 'Specials', 'Exclusive chef specials, only available for a limited time.', '2025-10-26 19:09:52'),
(5055, 3044, 'Main Menu', 'Freshly prepared dishes that bring comfort and joy.', '2025-10-26 19:09:52'),
(5056, 3045, 'Main Menu', 'Savor the finest flavors in every dish.', '2025-10-26 19:09:52'),
(5057, 3046, 'Main Menu', 'Delicious meals made to delight your taste buds.', '2025-10-26 19:09:52'),
(5058, 3046, 'Specials', 'Specially crafted dishes to create a unique dining experience.', '2025-10-26 19:09:52'),
(5059, 3047, 'Main Menu', 'Experience a wide variety of fresh and tasty dishes.', '2025-10-26 19:09:52'),
(5060, 3047, 'Specials', 'Limited-time specials made with premium ingredients.', '2025-10-26 19:09:52'),
(5061, 3048, 'Main Menu', 'Enjoy traditional and modern dishes prepared to perfection.', '2025-10-26 19:09:52'),
(5062, 3049, 'Main Menu', 'A diverse selection of dishes for every palate.', '2025-10-26 19:09:52'),
(5063, 3049, 'Specials', 'Chefs specials featuring unique flavors and ingredients.', '2025-10-26 19:09:52'),
(5064, 3050, 'Main Menu', 'Fresh, flavorful dishes crafted to impress every diner.', '2025-10-26 19:09:52'),
(5065, 3051, 'Main Menu', 'Satisfy your cravings with our variety of classic and modern dishes.', '2025-10-26 19:09:52'),
(5066, 3052, 'Main Menu', 'A perfect blend of flavors for breakfast, lunch, and dinner.', '2025-10-26 19:09:52'),
(5067, 3052, 'Specials', 'Chefs specials featuring seasonal and unique ingredients.', '2025-10-26 19:09:52'),
(5068, 3053, 'Main Menu', 'Freshly prepared dishes that bring joy to every meal.', '2025-10-26 19:09:52'),
(5069, 3054, 'Main Menu', 'Tantalizing flavors crafted with the freshest ingredients.', '2025-10-26 19:09:52'),
(5070, 3055, 'Main Menu', 'Delicious dishes made to satisfy all tastes.', '2025-10-26 19:09:52'),
(5071, 3055, 'Specials', 'Limited-time chef specials to delight your senses.', '2025-10-26 19:09:52'),
(5072, 3056, 'Main Menu', 'A wide variety of flavors to suit every craving.', '2025-10-26 19:09:52'),
(5073, 3057, 'Main Menu', 'Experience the perfect balance of taste and freshness.', '2025-10-26 19:09:52'),
(5074, 3058, 'Main Menu', 'Classic dishes prepared with premium ingredients.', '2025-10-26 19:09:52'),
(5075, 3058, 'Specials', 'Seasonal delights crafted to surprise your palate.', '2025-10-26 19:09:52'),
(5076, 3059, 'Main Menu', 'Fresh, flavorful, and satisfying meals for all.', '2025-10-26 19:09:52'),
(5077, 3060, 'Main Menu', 'A delightful menu full of classic and modern dishes.', '2025-10-26 19:09:52'),
(5078, 3061, 'Main Menu', 'Dishes prepared to delight your taste buds.', '2025-10-26 19:09:52'),
(5079, 3062, 'Main Menu', 'Indulge in our signature flavors and freshly made meals.', '2025-10-26 19:09:52'),
(5080, 3062, 'Specials', 'Limited-time specials crafted by our master chefs.', '2025-10-26 19:09:52'),
(5081, 3063, 'Main Menu', 'Delicious meals crafted with fresh and high-quality ingredients.', '2025-10-26 19:09:52'),
(5082, 3064, 'Main Menu', 'Experience the perfect combination of flavors in every dish.', '2025-10-26 19:09:52'),
(5083, 3065, 'Main Menu', 'A menu full of fresh and tasty options for every palate.', '2025-10-26 19:09:52'),
(5084, 3066, 'Main Menu', 'Enjoy classic and modern dishes prepared with care.', '2025-10-26 19:09:52'),
(5085, 3066, 'Specials', 'Chef specials made with seasonal and premium ingredients.', '2025-10-26 19:09:52'),
(5086, 3067, 'Main Menu', 'Freshly prepared dishes that delight your senses.', '2025-10-26 19:09:52'),
(5087, 3068, 'Main Menu', 'A diverse selection of flavors and ingredients.', '2025-10-26 19:09:52'),
(5088, 3069, 'Main Menu', 'Classic dishes made with the finest ingredients.', '2025-10-26 19:09:52'),
(5089, 3070, 'Main Menu', 'Tasty meals crafted to satisfy all cravings.', '2025-10-26 19:09:52'),
(5090, 3070, 'Specials', 'Limited-time specials to surprise your taste buds.', '2025-10-26 19:09:52'),
(5091, 3071, 'Main Menu', 'Enjoy our freshly prepared dishes for breakfast, lunch, and dinner.', '2025-10-26 19:09:52'),
(5092, 3072, 'Main Menu', 'A menu full of flavors to satisfy every appetite.', '2025-10-26 19:09:52'),
(5093, 3073, 'Main Menu', 'Deliciously prepared meals for a memorable dining experience.', '2025-10-26 19:09:52'),
(5094, 3074, 'Main Menu', 'Fresh and tasty dishes made to perfection.', '2025-10-26 19:09:52'),
(5095, 3074, 'Specials', 'Exclusive chef specials crafted for a unique experience.', '2025-10-26 19:09:52'),
(5096, 3075, 'Main Menu', 'Delightful dishes made from fresh, quality ingredients.', '2025-10-26 19:09:52'),
(5097, 3076, 'Main Menu', 'Savor every bite with our diverse menu options.', '2025-10-26 19:09:52'),
(5098, 3077, 'Main Menu', 'Classic flavors with modern culinary techniques.', '2025-10-26 19:09:52'),
(5099, 3078, 'Main Menu', 'Freshly prepared meals to delight your senses.', '2025-10-26 19:09:52'),
(5100, 3078, 'Specials', 'Limited-time seasonal dishes made with care.', '2025-10-26 19:09:52'),
(5101, 3079, 'Main Menu', 'A diverse menu with freshly prepared dishes for every taste.', '2025-10-26 19:09:52'),
(5102, 3080, 'Main Menu', 'Indulge in our flavorful dishes crafted to perfection.', '2025-10-26 19:09:52'),
(5103, 3080, 'Specials', 'Chefs specials featuring seasonal and unique ingredients.', '2025-10-26 19:09:52'),
(5104, 3081, 'Main Menu', 'Classic and contemporary dishes to satisfy all cravings.', '2025-10-26 19:09:52'),
(5105, 3082, 'Main Menu', 'Fresh ingredients combined to create delightful meals.', '2025-10-26 19:09:52'),
(5106, 3082, 'Specials', 'Limited-time specials crafted by our expert chefs.', '2025-10-26 19:09:52'),
(5107, 3083, 'Main Menu', 'Delicious meals designed to excite your taste buds.', '2025-10-26 19:09:52'),
(5108, 3084, 'Main Menu', 'Satisfy your hunger with our diverse menu options.', '2025-10-26 19:09:52'),
(5109, 3085, 'Main Menu', 'A perfect combination of flavors for lunch and dinner.', '2025-10-26 19:09:52'),
(5110, 3085, 'Specials', 'Exclusive chef specials with unique flavors.', '2025-10-26 19:09:52'),
(5111, 3086, 'Main Menu', 'Freshly prepared dishes that delight every palate.', '2025-10-26 19:09:52'),
(5112, 3087, 'Main Menu', 'Classic dishes with a modern twist, full of flavor.', '2025-10-26 19:09:52'),
(5113, 3088, 'Main Menu', 'A wide variety of dishes to satisfy all tastes.', '2025-10-26 19:09:52'),
(5114, 3088, 'Specials', 'Seasonal specials created to surprise and delight.', '2025-10-26 19:09:52'),
(5115, 3089, 'Main Menu', 'Delicious meals made from fresh and high-quality ingredients.', '2025-10-26 19:09:52'),
(5116, 3090, 'Main Menu', 'Experience the perfect blend of flavors in every dish.', '2025-10-26 19:09:52'),
(5117, 3091, 'Main Menu', 'Savor our signature dishes prepared with care.', '2025-10-26 19:09:52'),
(5118, 3091, 'Specials', 'Limited-time chef specials to create a unique experience.', '2025-10-26 19:09:52'),
(5119, 3092, 'Main Menu', 'Freshly prepared dishes that bring joy to every meal.', '2025-10-26 19:09:52'),
(5120, 3093, 'Main Menu', 'Tantalizing flavors crafted to delight your senses.', '2025-10-26 19:09:52'),
(5121, 3093, 'Specials', 'Chefs specials featuring seasonal ingredients.', '2025-10-26 19:09:52'),
(5122, 3094, 'Main Menu', 'Delicious dishes made to satisfy all tastes and cravings.', '2025-10-26 19:09:52'),
(5123, 3095, 'Main Menu', 'A variety of fresh and flavorful dishes for every palate.', '2025-10-26 19:09:52'),
(5124, 3096, 'Main Menu', 'Classic dishes prepared with premium ingredients.', '2025-10-26 19:09:52'),
(5125, 3096, 'Specials', 'Limited-time specials to surprise your taste buds.', '2025-10-26 19:09:52'),
(5126, 3097, 'Main Menu', 'Freshly prepared dishes that excite your senses.', '2025-10-26 19:09:52'),
(5127, 3098, 'Main Menu', 'Enjoy classic flavors crafted to perfection.', '2025-10-26 19:09:52'),
(5128, 3099, 'Main Menu', 'A menu full of flavor, freshness, and variety.', '2025-10-26 19:09:52'),
(5129, 3100, 'Main Menu', 'Delightful dishes made to satisfy every craving.', '2025-10-26 19:09:52'),
(5130, 3100, 'Specials', 'Exclusive chef specials with unique and seasonal ingredients.', '2025-10-26 19:09:52');


-- Table structure for table `menuitem`
--
DROP TABLE IF EXISTS `menuitem`;
CREATE TABLE `menuitem` (
  `MenuItemID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT 1,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Restaurant 3001 (Pakistani, Fast Food, Continental)
INSERT INTO `menuitem` (`MenuItemID`, `MenuID`, `Name`, `Description`, `image`, `Price`, `IsAvailable`, `CreatedAt`) VALUES
(6001, 5001, 'Chicken Biryani', 'Aromatic Pakistani chicken biryani with traditional spices.', 'images/chicken_biryani.jpg', 12.50, 1, '2025-10-26 20:00:00'),
(6002, 5001, 'Beef Burger', 'Juicy beef patty with lettuce, tomato, and cheese.', 'images/beef_burger.jpg', 10.99, 1, '2025-10-26 20:00:00'),
(6003, 5001, 'Grilled Veg Sandwich', 'Fresh vegetables with creamy dressing in toasted bread.', 'images/veg_sandwich.jpg', 7.50, 1, '2025-10-26 20:00:00'),
(6004, 5001, 'Continental Salad', 'Fresh greens with olive oil and vinaigrette dressing.', 'images/continental_salad.jpg', 8.99, 1, '2025-10-26 20:00:00'),

-- Restaurant 3002 (Pakistani, Fast Food, Seafood)
(6005, 5002, 'Grilled Fish', 'Freshly grilled fish with lemon butter sauce.', 'images/grilled_fish.jpg', 14.50, 1, '2025-10-26 20:01:00'),
(6006, 5002, 'Chicken Shawarma', 'Tender chicken wrapped with garlic sauce and veggies.', 'images/chicken_shawarma.jpg', 9.99, 1, '2025-10-26 20:01:00'),
(6007, 5002, 'French Fries', 'Crispy golden fries served with ketchup.', 'images/french_fries.jpg', 4.99, 1, '2025-10-26 20:01:00'),
(6008, 5002, 'Prawn Curry', 'Spicy prawn curry with authentic Pakistani flavors.', 'images/prawn_curry.jpg', 13.50, 1, '2025-10-26 20:01:00'),

-- Restaurant 3003 (Middle Eastern, Japanese)
(6009, 5003, 'Falafel Wrap', 'Crispy falafel with hummus and fresh vegetables.', 'images/falafel_wrap.jpg', 8.50, 1, '2025-10-26 20:02:00'),
(6010, 5003, 'Sushi Platter', 'Assorted sushi rolls with fresh fish and vegetables.', 'images/sushi_platter.jpg', 15.99, 1, '2025-10-26 20:02:00'),
(6011, 5004, 'Shawarma Platter', 'Grilled meat with rice and garlic sauce.', 'images/shawarma_platter.jpg', 12.99, 1, '2025-10-26 20:02:00'),

-- Restaurant 3004 (Italian, Middle Eastern)
(6012, 5005, 'Margherita Pizza', 'Classic Italian pizza with mozzarella, tomatoes, and basil.', 'images/margherita_pizza.jpg', 11.50, 1, '2025-10-26 20:03:00'),
(6013, 5006, 'Pasta Alfredo', 'Creamy pasta with parmesan and garlic.', 'images/pasta_alfredo.jpg', 12.99, 1, '2025-10-26 20:03:00'),
(6014, 5005, 'Hummus Plate', 'Traditional Middle Eastern hummus with pita bread.', 'images/hummus_plate.jpg', 7.50, 1, '2025-10-26 20:03:00'),

-- Restaurant 3005 (BBQ, Chinese, Fast Food)
(6015, 5007, 'BBQ Ribs', 'Tender BBQ ribs glazed with smoky sauce.', 'images/bbq_ribs.jpg', 14.99, 1, '2025-10-26 20:04:00'),
(6016, 5008, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts and vegetables.', 'images/kung_pao_chicken.jpg', 11.99, 1, '2025-10-26 20:04:00'),
(6017, 5007, 'Veggie Burger', 'Delicious burger with fresh veggies and special sauce.', 'images/veggie_burger.jpg', 9.50, 1, '2025-10-26 20:04:00'),

-- Restaurant 3006 (Pakistani, Fast Food, Seafood)
(6018, 5009, 'Seekh Kabab', 'Grilled spiced beef kababs served with chutney.', 'images/seekh_kabab.jpg', 13.50, 1, '2025-10-26 20:05:00'),
(6019, 5009, 'Fried Fish', 'Crispy fried fish with spicy dip.', 'images/fried_fish.jpg', 12.50, 1, '2025-10-26 20:05:00'),
(6020, 5009, 'Chicken Nuggets', 'Golden crispy chicken nuggets.', 'images/chicken_nuggets.jpg', 7.99, 1, '2025-10-26 20:05:00'),

-- Restaurant 3007 (Middle Eastern, Thai)
(6021, 5010, 'Tom Yum Soup', 'Spicy and sour Thai soup with shrimp.', 'images/tom_yum_soup.jpg', 9.50, 1, '2025-10-26 20:06:00'),
(6022, 5010, 'Grilled Lamb Kebab', 'Tender Middle Eastern lamb skewers.', 'images/lamb_kebab.jpg', 14.99, 1, '2025-10-26 20:06:00'),
(6023, 5010, 'Thai Green Curry', 'Fragrant Thai curry with coconut milk and chicken.', 'images/green_curry.jpg', 12.50, 1, '2025-10-26 20:06:00'),

-- Restaurant 3008 (BBQ, Chinese)
(6024, 5011, 'Char Siu Pork', 'Chinese BBQ pork with a sweet glaze.', 'images/char_siu_pork.jpg', 13.99, 1, '2025-10-26 20:07:00'),
(6025, 5011, 'Spicy Szechuan Chicken', 'Chicken stir-fried in Szechuan sauce.', 'images/szechuan_chicken.jpg', 11.50, 1, '2025-10-26 20:07:00'),
(6026, 5011, 'Beef Skewers', 'Grilled BBQ beef skewers with special spices.', 'images/beef_skewers.jpg', 12.99, 1, '2025-10-26 20:07:00'),

-- Restaurant 3009 (Cafe, Continental)
(6027, 5012, 'Cappuccino', 'Rich espresso with steamed milk and froth.', 'images/cappuccino.jpg', 3.99, 1, '2025-10-26 20:08:00'),
(6028, 5012, 'Caesar Salad', 'Crisp romaine lettuce with parmesan and croutons.', 'images/caesar_salad.jpg', 7.50, 1, '2025-10-26 20:08:00'),
(6029, 5012, 'Club Sandwich', 'Triple-layer sandwich with chicken, bacon, and lettuce.', 'images/club_sandwich.jpg', 8.99, 1, '2025-10-26 20:08:00'),

-- Restaurant 3010 (Italian, Mexican)
(6030, 5013, 'Spaghetti Carbonara', 'Classic Italian pasta with creamy sauce and bacon.', 'images/carbonara.jpg', 12.50, 1, '2025-10-26 20:09:00'),
(6031, 5014, 'Tacos Al Pastor', 'Mexican tacos with marinated pork and pineapple.', 'images/tacos_al_pastor.jpg', 9.99, 1, '2025-10-26 20:09:00'),

-- Restaurant 3011 (Desserts, Indian)
(6032, 5015, 'Gulab Jamun', 'Soft and sweet Indian dumplings soaked in rose syrup.', 'images/gulab_jamun.jpg', 4.50, 1, '2025-10-26 20:10:00'),
(6033, 5015, 'Ras Malai', 'Soft cheese patties in sweetened milk, garnished with nuts.', 'images/ras_malai.jpg', 5.50, 1, '2025-10-26 20:10:00'),
(6034, 5016, 'Chocolate Brownie', 'Rich and gooey chocolate brownie with ice cream.', 'images/chocolate_brownie.jpg', 6.50, 1, '2025-10-26 20:10:00'),
(6035, 5016, 'Mango Kulfi', 'Traditional Indian mango ice cream with a creamy texture.', 'images/mango_kulfi.jpg', 4.99, 1, '2025-10-26 20:10:00'),

-- Restaurant 3012 (Desserts, Middle Eastern)
(6036, 5017, 'Baklava', 'Crispy filo pastry layered with nuts and honey.', 'images/baklava.jpg', 5.99, 1, '2025-10-26 20:11:00'),
(6037, 5017, 'Kunafa', 'Sweet cheese dessert soaked in fragrant sugar syrup.', 'images/kunafa.jpg', 6.50, 1, '2025-10-26 20:11:00'),

-- Restaurant 3013 (Chinese, Fast Food)
(6038, 5018, 'Sweet & Sour Chicken', 'Crispy chicken bites in a tangy sweet and sour sauce.', 'images/sweet_sour_chicken.jpg', 11.50, 1, '2025-10-26 20:12:00'),
(6039, 5018, 'Spring Rolls', 'Crispy rolls stuffed with vegetables and served with sauce.', 'images/spring_rolls.jpg', 6.99, 1, '2025-10-26 20:12:00'),
(6040, 5018, 'Fried Noodles', 'Stir-fried noodles with veggies and choice of meat.', 'images/fried_noodles.jpg', 10.50, 1, '2025-10-26 20:12:00'),

-- Restaurant 3014 (Fast Food, Cafe)
(6041, 5019, 'Cheese Pizza', 'Classic cheesy pizza with tomato sauce and herbs.', 'images/cheese_pizza.jpg', 9.99, 1, '2025-10-26 20:13:00'),
(6042, 5019, 'Club Sandwich', 'Triple-layer sandwich with chicken, bacon, and veggies.', 'images/club_sandwich.jpg', 8.99, 1, '2025-10-26 20:13:00'),
(6043, 5019, 'Cappuccino', 'Rich espresso with steamed milk and frothy top.', 'images/cappuccino.jpg', 3.99, 1, '2025-10-26 20:13:00'),

-- Restaurant 3015 (Seafood, Mediterranean)
(6044, 5020, 'Grilled Salmon', 'Perfectly grilled salmon with herbs and lemon.', 'images/grilled_salmon.jpg', 15.99, 1, '2025-10-26 20:14:00'),
(6045, 5020, 'Seafood Paella', 'Mediterranean rice dish with shrimp, mussels, and spices.', 'images/seafood_paella.jpg', 16.50, 1, '2025-10-26 20:14:00'),
(6046, 5020, 'Greek Salad', 'Fresh vegetables with feta cheese, olives, and olive oil.', 'images/greek_salad.jpg', 7.99, 1, '2025-10-26 20:14:00'),

-- Restaurant 3016 (Chinese, Lebanese)
(6047, 5021, 'Beef Chow Mein', 'Stir-fried noodles with beef and vegetables.', 'images/beef_chow_mein.jpg', 10.99, 1, '2025-10-26 20:15:00'),
(6048, 5021, 'Chicken Shawarma', 'Tender chicken wrapped in pita with garlic sauce.', 'images/chicken_shawarma2.jpg', 9.50, 1, '2025-10-26 20:15:00'),
(6049, 5021, 'Hummus with Pita', 'Creamy hummus served with warm pita bread.', 'images/hummus_pita.jpg', 6.99, 1, '2025-10-26 20:15:00'),

-- Restaurant 3017 (Continental, Korean)
(6050, 5022, 'Grilled Chicken', 'Juicy grilled chicken served with seasonal vegetables.', 'images/grilled_chicken.jpg', 12.99, 1, '2025-10-26 20:16:00'),
(6051, 5022, 'Bibimbap', 'Korean rice bowl with vegetables, beef, and fried egg.', 'images/bibimbap.jpg', 13.50, 1, '2025-10-26 20:16:00'),
(6052, 5022, 'Caesar Salad', 'Crisp romaine lettuce with parmesan and croutons.', 'images/caesar_salad2.jpg', 7.99, 1, '2025-10-26 20:16:00'),

-- Restaurant 3018 (BBQ, Cafe, Continental)
(6053, 5023, 'BBQ Chicken', 'Smoky BBQ chicken served with garlic sauce.', 'images/bbq_chicken.jpg', 11.99, 1, '2025-10-26 20:17:00'),
(6054, 5023, 'Espresso', 'Strong espresso shot with rich aroma.', 'images/espresso.jpg', 3.50, 1, '2025-10-26 20:17:00'),
(6055, 5024, 'Continental Burger', 'Beef patty with cheese, lettuce, and special sauce.', 'images/continental_burger.jpg', 9.99, 1, '2025-10-26 20:17:00'),

-- Restaurant 3019 (Fast Food, Japanese)
(6056, 5025, 'Chicken Nuggets', 'Crispy golden chicken nuggets served with dip.', 'images/chicken_nuggets2.jpg', 6.99, 1, '2025-10-26 20:18:00'),
(6057, 5025, 'Sushi Roll', 'Fresh sushi rolls with fish and vegetables.', 'images/sushi_roll.jpg', 12.50, 1, '2025-10-26 20:18:00'),

-- Restaurant 3020 (BBQ, Cafe, Seafood)
(6058, 5027, 'Grilled Ribs', 'Tender BBQ ribs with smoky glaze.', 'images/grilled_ribs.jpg', 14.99, 1, '2025-10-26 20:19:00'),
(6059, 5027, 'Cappuccino', 'Rich espresso with steamed milk.', 'images/cappuccino2.jpg', 3.99, 1, '2025-10-26 20:19:00'),
(6060, 5027, 'Garlic Prawns', 'Sauteed prawns in garlic butter sauce.', 'images/garlic_prawns.jpg', 15.50, 1, '2025-10-26 20:19:00'),

-- Restaurant 3021 (Fast Food, Cafe, Continental)
(6061, 5028, 'Cheeseburger', 'Juicy beef patty with cheddar cheese, lettuce, and tomato.', 'images/cheeseburger.jpg', 8.99, 1, '2025-10-26 20:20:00'),
(6062, 5028, 'French Fries', 'Crispy golden fries with seasoning.', 'images/french_fries.jpg', 3.50, 1, '2025-10-26 20:20:00'),
(6063, 5028, 'Latte', 'Smooth espresso with steamed milk.', 'images/latte.jpg', 4.00, 1, '2025-10-26 20:20:00'),

-- Restaurant 3022 (Italian)
(6064, 5029, 'Margherita Pizza', 'Classic pizza with tomato, mozzarella, and basil.', 'images/margherita_pizza.jpg', 10.50, 1, '2025-10-26 20:21:00'),
(6065, 5029, 'Spaghetti Bolognese', 'Pasta with rich meat sauce and parmesan.', 'images/spaghetti_bolognese.jpg', 11.99, 1, '2025-10-26 20:21:00'),

-- Restaurant 3023 (Pakistani)
(6066, 5030, 'Biryani', 'Fragrant basmati rice cooked with spices and chicken.', 'images/biryani.jpg', 12.50, 1, '2025-10-26 20:22:00'),
(6067, 5030, 'Seekh Kebab', 'Grilled spiced minced meat skewers.', 'images/seekh_kebab.jpg', 9.50, 1, '2025-10-26 20:22:00'),

-- Restaurant 3024 (Italian, Middle Eastern)
(6068, 5031, 'Lasagna', 'Layers of pasta, cheese, and rich tomato meat sauce.', 'images/lasagna.jpg', 12.99, 1, '2025-10-26 20:23:00'),
(6069, 5031, 'Falafel Wrap', 'Crispy chickpea patties wrapped with veggies and tahini.', 'images/falafel_wrap.jpg', 7.50, 1, '2025-10-26 20:23:00'),

-- Restaurant 3025 (BBQ, Fast Food, Seafood)
(6070, 5032, 'BBQ Chicken Wings', 'Spicy and smoky wings, perfect appetizer.', 'images/bbq_chicken_wings.jpg', 9.99, 1, '2025-10-26 20:24:00'),
(6071, 5032, 'Fish & Chips', 'Golden fried fish served with fries and tartar sauce.', 'images/fish_chips.jpg', 11.50, 1, '2025-10-26 20:24:00'),

-- Restaurant 3026 (BBQ, Chinese, Continental)
(6072, 5033, 'Grilled Lamb Chops', 'Tender lamb chops with BBQ glaze.', 'images/lamb_chops.jpg', 15.50, 1, '2025-10-26 20:25:00'),
(6073, 5034, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts and vegetables.', 'images/kung_pao_chicken.jpg', 12.99, 1, '2025-10-26 20:25:00'),

-- Restaurant 3027 (Pakistani, Japanese)
(6074, 5035, 'Chicken Karahi', 'Spicy chicken cooked in traditional wok with tomatoes and spices.', 'images/chicken_karahi.jpg', 11.50, 1, '2025-10-26 20:26:00'),
(6075, 5035, 'Sushi Platter', 'Assorted sushi rolls with fresh fish and vegetables.', 'images/sushi_platter.jpg', 14.50, 1, '2025-10-26 20:26:00'),

-- Restaurant 3028 (BBQ, Seafood)
(6076, 5036, 'Grilled Prawns', 'Juicy prawns grilled with garlic butter.', 'images/grilled_prawns2.jpg', 15.99, 1, '2025-10-26 20:27:00'),
(6077, 5036, 'BBQ Beef Ribs', 'Slow-cooked ribs with BBQ sauce.', 'images/bbq_beef_ribs.jpg', 16.50, 1, '2025-10-26 20:27:00'),

-- Restaurant 3029 (Italian, Mexican)
(6078, 5037, 'Tacos', 'Soft tacos with beef, cheese, and salsa.', 'images/tacos.jpg', 9.50, 1, '2025-10-26 20:28:00'),
(6079, 5037, 'Penne Alfredo', 'Pasta in creamy alfredo sauce.', 'images/penne_alfredo.jpg', 11.50, 1, '2025-10-26 20:28:00'),

-- Restaurant 3030 (Chinese, BBQ, Seafood)
(6080, 5038, 'Sweet & Sour Pork', 'Crispy pork in tangy sweet sauce.', 'images/sweet_sour_pork.jpg', 12.50, 1, '2025-10-26 20:29:00'),
(6081, 5038, 'BBQ Salmon', 'Grilled salmon with BBQ glaze.', 'images/bbq_salmon.jpg', 16.99, 1, '2025-10-26 20:29:00'),
(6082, 5038, 'Garlic Mussels', 'Fresh mussels sautéed in garlic sauce.', 'images/garlic_mussels.jpg', 14.50, 1, '2025-10-26 20:29:00'),

-- Restaurant 3031 (Continental, Desserts)
(6083, 5039, 'Grilled Chicken Salad', 'Fresh greens with grilled chicken and light vinaigrette.', 'images/grilled_chicken_salad.jpg', 10.99, 1, '2025-10-26 20:30:00'),
(6084, 5039, 'Chocolate Lava Cake', 'Warm chocolate cake with molten center.', 'images/chocolate_lava_cake.jpg', 6.50, 1, '2025-10-26 20:30:00'),

-- Restaurant 3032 (BBQ, Chinese, Continental)
(6085, 5040, 'BBQ Chicken Pizza', 'Pizza topped with BBQ chicken and cheese.', 'images/bbq_chicken_pizza.jpg', 12.50, 1, '2025-10-26 20:31:00'),
(6086, 5041, 'Stir Fried Noodles', 'Egg noodles with vegetables and soy sauce.', 'images/stir_fried_noodles.jpg', 10.50, 1, '2025-10-26 20:31:00'),

-- Restaurant 3033 (Continental, Middle Eastern)
(6087, 5042, 'Grilled Salmon', 'Fresh salmon grilled to perfection.', 'images/grilled_salmon2.jpg', 16.50, 1, '2025-10-26 20:32:00'),
(6088, 5043, 'Shawarma Wrap', 'Juicy chicken wrapped with veggies and tahini sauce.', 'images/shawarma_wrap.jpg', 8.99, 1, '2025-10-26 20:32:00'),

-- Restaurant 3034 (Pakistani, Cafe)
(6089, 5044, 'Nihari', 'Slow-cooked beef stew with aromatic spices.', 'images/nihari.jpg', 12.50, 1, '2025-10-26 20:33:00'),
(6090, 5044, 'Cappuccino', 'Espresso with steamed milk and foam.', 'images/cappuccino.jpg', 4.50, 1, '2025-10-26 20:33:00'),

-- Restaurant 3035 (Seafood, Indian)
(6091, 5045, 'Butter Chicken', 'Creamy tomato chicken curry.', 'images/butter_chicken.jpg', 11.99, 1, '2025-10-26 20:34:00'),
(6092, 5045, 'Grilled Fish Tikka', 'Marinated fish grilled with spices.', 'images/grilled_fish_tikka.jpg', 13.50, 1, '2025-10-26 20:34:00'),

-- Restaurant 3036 (Italian, Cafe)
(6093, 5046, 'Pesto Pasta', 'Pasta with fresh basil pesto sauce.', 'images/pesto_pasta.jpg', 10.99, 1, '2025-10-26 20:35:00'),
(6094, 5046, 'Espresso', 'Strong coffee shot to energize your day.', 'images/espresso.jpg', 3.50, 1, '2025-10-26 20:35:00'),

-- Restaurant 3037 (Cafe, Mediterranean)
(6095, 5047, 'Mediterranean Salad', 'Fresh veggies with feta cheese and olive oil.', 'images/mediterranean_salad.jpg', 9.50, 1, '2025-10-26 20:36:00'),
(6096, 5047, 'Latte Macchiato', 'Layered coffee with milk and espresso.', 'images/latte_macchiato.jpg', 4.50, 1, '2025-10-26 20:36:00'),

-- Restaurant 3038 (Pakistani, Cafe, Continental)
(6097, 5048, 'Chapli Kebab', 'Spiced minced meat patty, grilled to perfection.', 'images/chapli_kebab.jpg', 9.50, 1, '2025-10-26 20:37:00'),
(6098, 5048, 'Grilled Sandwich', 'Toasted sandwich with veggies and cheese.', 'images/grilled_sandwich.jpg', 5.99, 1, '2025-10-26 20:37:00'),

-- Restaurant 3039 (BBQ, Italian)
(6099, 5049, 'BBQ Ribs', 'Juicy pork ribs with smoky BBQ sauce.', 'images/bbq_ribs.jpg', 16.50, 1, '2025-10-26 20:38:00'),
(6100, 5049, 'Lasagna', 'Baked layers of pasta, cheese, and meat sauce.', 'images/lasagna2.jpg', 12.99, 1, '2025-10-26 20:38:00'),

-- Restaurant 3040 (BBQ, Italian)
(6101, 5050, 'BBQ Chicken Pizza', 'Pizza topped with smoky BBQ chicken and cheese.', 'images/bbq_chicken_pizza2.jpg', 12.50, 1, '2025-10-26 20:39:00'),
(6102, 5050, 'Spaghetti Carbonara', 'Classic Italian pasta with creamy egg sauce and bacon.', 'images/spaghetti_carbonara.jpg', 11.50, 1, '2025-10-26 20:39:00'),

-- Restaurant 3041 (Pakistani, Desserts, Lebanese)
(6103, 5051, 'Chicken Biryani', 'Fragrant rice cooked with aromatic spices and chicken.', 'images/chicken_biryani2.jpg', 12.99, 1, '2025-10-26 20:40:00'),
(6104, 5051, 'Baklava', 'Sweet layered pastry with nuts and honey syrup.', 'images/baklava.jpg', 5.50, 1, '2025-10-26 20:40:00'),

-- Restaurant 3042 (Chinese, Italian)
(6105, 5052, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts and vegetables.', 'images/kung_pao_chicken2.jpg', 12.50, 1, '2025-10-26 20:41:00'),
(6106, 5052, 'Penne Arrabbiata', 'Pasta in spicy tomato sauce.', 'images/penne_arrabbiata.jpg', 10.99, 1, '2025-10-26 20:41:00'),

-- Restaurant 3043 (BBQ, Italian, Middle Eastern)
(6107, 5053, 'Grilled Lamb Chops', 'Tender lamb chops with BBQ glaze.', 'images/lamb_chops2.jpg', 15.99, 1, '2025-10-26 20:42:00'),
(6108, 5054, 'Shish Tawook', 'Marinated grilled chicken skewers with Middle Eastern spices.', 'images/shish_tawook.jpg', 11.50, 1, '2025-10-26 20:42:00'),

-- Restaurant 3044 (Italian, Cafe, Middle Eastern)
(6109, 5055, 'Fettuccine Alfredo', 'Pasta in creamy white sauce with parmesan.', 'images/fettuccine_alfredo.jpg', 11.50, 1, '2025-10-26 20:43:00'),
(6110, 5055, 'Mint Lemonade', 'Refreshing lemonade with fresh mint leaves.', 'images/mint_lemonade.jpg', 3.99, 1, '2025-10-26 20:43:00'),

-- Restaurant 3045 (Middle Eastern, Korean)
(6111, 5056, 'Hummus with Pita', 'Creamy chickpea dip served with warm pita bread.', 'images/hummus_pita.jpg', 6.50, 1, '2025-10-26 20:44:00'),
(6112, 5056, 'Bibimbap', 'Korean mixed rice bowl with vegetables and egg.', 'images/bibimbap.jpg', 12.50, 1, '2025-10-26 20:44:00'),

-- Restaurant 3046 (Fast Food, Mediterranean)
(6113, 5057, 'Veggie Burger', 'Grilled veggie patty with fresh lettuce and tomato.', 'images/veggie_burger.jpg', 8.50, 1, '2025-10-26 20:45:00'),
(6114, 5058, 'Greek Salad', 'Crisp salad with feta, olives, and olive oil.', 'images/greek_salad.jpg', 7.99, 1, '2025-10-26 20:45:00'),

-- Restaurant 3047 (Pakistani, BBQ)
(6115, 5059, 'Chicken Tikka', 'Tender chicken marinated in spices and grilled.', 'images/chicken_tikka.jpg', 10.50, 1, '2025-10-26 20:46:00'),
(6116, 5060, 'Beef Ribs', 'Slow-cooked ribs with spicy BBQ sauce.', 'images/beef_ribs.jpg', 16.50, 1, '2025-10-26 20:46:00'),

-- Restaurant 3048 (Pakistani)
(6117, 5061, 'Karahi Gosht', 'Spicy mutton curry cooked in traditional wok.', 'images/karahi_gosht.jpg', 12.99, 1, '2025-10-26 20:47:00'),

-- Restaurant 3049 (Pakistani, Chinese, Middle Eastern)
(6118, 5062, 'Chicken Biryani', 'Spiced rice cooked with chicken and aromatic herbs.', 'images/chicken_biryani3.jpg', 12.50, 1, '2025-10-26 20:48:00'),
(6119, 5063, 'Sweet and Sour Chicken', 'Crispy chicken in sweet & sour sauce.', 'images/sweet_sour_chicken.jpg', 11.99, 1, '2025-10-26 20:48:00'),

-- Restaurant 3050 (Italian, Cafe)
(6120, 5064, 'Mushroom Risotto', 'Creamy Italian rice with fresh mushrooms.', 'images/mushroom_risotto.jpg', 11.50, 1, '2025-10-26 20:49:00'),

-- Restaurant 3051 (Pakistani, Japanese)
(6121, 5065, 'Chapli Kebab', 'Spiced beef patties, fried to perfection.', 'images/chapli_kebab2.jpg', 9.50, 1, '2025-10-26 20:50:00'),
(6122, 5065, 'California Roll', 'Sushi roll with crab, avocado, and cucumber.', 'images/california_roll.jpg', 12.50, 1, '2025-10-26 20:50:00'),

-- Restaurant 3052 (BBQ, Thai, Fast Food)
(6123, 5066, 'BBQ Chicken Wings', 'Spicy grilled chicken wings with BBQ glaze.', 'images/bbq_chicken_wings.jpg', 10.50, 1, '2025-10-26 20:51:00'),
(6124, 5066, 'Pad Thai', 'Thai stir-fried noodles with shrimp, peanuts, and tamarind sauce.', 'images/pad_thai.jpg', 11.99, 1, '2025-10-26 20:51:00'),

-- Restaurant 3053 (Chinese, Mexican)
(6125, 5067, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts and veggies.', 'images/kung_pao_chicken3.jpg', 12.50, 1, '2025-10-26 20:52:00'),
(6126, 5067, 'Tacos Al Pastor', 'Soft tacos with marinated pork and pineapple.', 'images/tacos_al_pastor.jpg', 9.50, 1, '2025-10-26 20:52:00'),

-- Restaurant 3054 (Italian, Indian)
(6127, 5068, 'Margherita Pizza', 'Classic pizza with tomato, basil, and mozzarella.', 'images/margherita_pizza.jpg', 11.50, 1, '2025-10-26 20:53:00'),
(6128, 5068, 'Paneer Butter Masala', 'Cottage cheese cubes in creamy tomato gravy.', 'images/paneer_butter_masala.jpg', 10.99, 1, '2025-10-26 20:53:00'),

-- Restaurant 3055 (Fast Food, Mediterranean)
(6129, 5069, 'Cheeseburger', 'Grilled beef patty with cheese, lettuce, and tomato.', 'images/cheeseburger.jpg', 8.50, 1, '2025-10-26 20:54:00'),
(6130, 5069, 'Falafel Wrap', 'Crispy chickpea patties with fresh veggies in flatbread.', 'images/falafel_wrap.jpg', 7.50, 1, '2025-10-26 20:54:00'),

-- Restaurant 3056 (Cafe, Lebanese, BBQ)
(6131, 5070, 'Cappuccino', 'Rich espresso topped with steamed milk foam.', 'images/cappuccino2.jpg', 4.50, 1, '2025-10-26 20:55:00'),
(6132, 5070, 'Lamb Kofta', 'Grilled lamb meatballs served with sauce.', 'images/lamb_kofta.jpg', 12.99, 1, '2025-10-26 20:55:00'),

-- Restaurant 3057 (Continental, Korean)
(6133, 5071, 'Grilled Steak', 'Juicy steak served with herb butter.', 'images/grilled_steak.jpg', 18.50, 1, '2025-10-26 20:56:00'),
(6134, 5071, 'Kimchi Fried Rice', 'Korean stir-fried rice with kimchi and vegetables.', 'images/kimchi_fried_rice.jpg', 10.50, 1, '2025-10-26 20:56:00'),

-- Restaurant 3058 (Seafood, Vietnamese, Chinese)
(6135, 5072, 'Grilled Prawns', 'Fresh prawns grilled with garlic butter.', 'images/grilled_prawns.jpg', 15.50, 1, '2025-10-26 20:57:00'),
(6136, 5072, 'Pho Bo', 'Vietnamese beef noodle soup with fresh herbs.', 'images/pho_bo.jpg', 11.99, 1, '2025-10-26 20:57:00'),

-- Restaurant 3059 (Desserts, Japanese)
(6137, 5073, 'Matcha Ice Cream', 'Green tea flavored ice cream, creamy and refreshing.', 'images/matcha_ice_cream.jpg', 5.50, 1, '2025-10-26 20:58:00'),
(6138, 5073, 'Mochi', 'Japanese rice cakes filled with sweet red bean paste.', 'images/mochi.jpg', 4.99, 1, '2025-10-26 20:58:00'),

-- Restaurant 3060 (Middle Eastern, Thai)
(6139, 5074, 'Chicken Shawarma', 'Marinated grilled chicken in wrap with garlic sauce.', 'images/chicken_shawarma.jpg', 9.99, 1, '2025-10-26 20:59:00'),
(6140, 5074, 'Green Curry', 'Thai coconut milk curry with chicken and veggies.', 'images/green_curry.jpg', 12.50, 1, '2025-10-26 20:59:00'),

-- Restaurant 3061 (Pakistani, Mexican)
(6141, 5075, 'Seekh Kebab', 'Spiced minced meat skewers, grilled to perfection.', 'images/seekh_kebab.jpg', 10.50, 1, '2025-10-26 21:00:00'),
(6142, 5075, 'Chicken Quesadilla', 'Grilled tortilla with chicken and melted cheese.', 'images/chicken_quesadilla.jpg', 9.50, 1, '2025-10-26 21:00:00'),

-- Restaurant 3062 (BBQ, Indian)
(6143, 5076, 'BBQ Ribs', 'Tender pork ribs glazed with smoky BBQ sauce.', 'images/bbq_ribs.jpg', 14.50, 1, '2025-10-26 21:01:00'),
(6144, 5076, 'Butter Chicken', 'Creamy Indian chicken curry with spices.', 'images/butter_chicken.jpg', 11.99, 1, '2025-10-26 21:01:00'),

-- Restaurant 3063 (Chinese, Mediterranean, Continental)
(6145, 5077, 'Sweet & Sour Pork', 'Classic Chinese pork in tangy sweet & sour sauce.', 'images/sweet_sour_pork.jpg', 12.50, 1, '2025-10-26 21:02:00'),
(6146, 5077, 'Grilled Veggie Platter', 'Mediterranean grilled vegetables with herbs.', 'images/grilled_veggie_platter.jpg', 10.50, 1, '2025-10-26 21:02:00'),

-- Restaurant 3064 (Italian, Lebanese)
(6147, 5078, 'Spaghetti Carbonara', 'Classic Italian pasta with creamy sauce and bacon.', 'images/spaghetti_carbonara.jpg', 11.50, 1, '2025-10-26 21:03:00'),
(6148, 5078, 'Chicken Shawarma Plate', 'Marinated chicken with Lebanese spices and pita.', 'images/chicken_shawarma_plate.jpg', 12.50, 1, '2025-10-26 21:03:00'),

-- Restaurant 3065 (Fast Food, Korean)
(6149, 5079, 'Cheese Pizza', 'Hot cheesy pizza with fresh toppings.', 'images/cheese_pizza.jpg', 8.50, 1, '2025-10-26 21:04:00'),
(6150, 5079, 'Bibimbap', 'Korean rice bowl with veggies and egg.', 'images/bibimbap.jpg', 10.99, 1, '2025-10-26 21:04:00'),

-- Restaurant 3066 (Cafe, Vietnamese)
(6151, 5080, 'Espresso', 'Rich espresso coffee shot with aromatic flavor.', 'images/espresso.jpg', 3.50, 1, '2025-10-26 21:05:00'),
(6152, 5080, 'Vietnamese Spring Rolls', 'Fresh rolls with shrimp, herbs, and rice paper.', 'images/vietnamese_spring_rolls.jpg', 7.50, 1, '2025-10-26 21:05:00'),

-- Restaurant 3067 (Pakistani, BBQ, Japanese)
(6153, 5081, 'Nihari', 'Slow-cooked beef stew with rich spices.', 'images/nihari.jpg', 12.50, 1, '2025-10-26 21:06:00'),
(6154, 5081, 'Yakitori', 'Japanese grilled chicken skewers.', 'images/yakitori.jpg', 9.99, 1, '2025-10-26 21:06:00'),

-- Restaurant 3068 (Chinese, Thai)
(6155, 5082, 'Chow Mein', 'Stir-fried noodles with vegetables and soy sauce.', 'images/chow_mein.jpg', 10.50, 1, '2025-10-26 21:07:00'),
(6156, 5082, 'Tom Yum Soup', 'Spicy Thai soup with shrimp and herbs.', 'images/tom_yum_soup.jpg', 9.99, 1, '2025-10-26 21:07:00'),

-- Restaurant 3069 (Italian, Indian, Seafood)
(6157, 5083, 'Lasagna', 'Layered pasta with cheese and meat sauce.', 'images/lasagna.jpg', 12.50, 1, '2025-10-26 21:08:00'),
(6158, 5083, 'Prawn Masala', 'Spicy prawn curry with aromatic spices.', 'images/prawn_masala.jpg', 14.99, 1, '2025-10-26 21:08:00'),

-- Restaurant 3070 (Fast Food, Indian)
(6159, 5084, 'Veg Burger', 'Fresh vegetable patty with lettuce and tomato.', 'images/veg_burger.jpg', 6.50, 1, '2025-10-26 21:09:00'),
(6160, 5084, 'Chole Bhature', 'Fluffy bread served with spicy chickpea curry.', 'images/chole_bhature.jpg', 7.99, 1, '2025-10-26 21:09:00'),

-- Restaurant 3071 (Cafe, Mediterranean, Continental)
(6161, 5085, 'Café Latte', 'Smooth coffee with steamed milk.', 'images/cafe_latte.jpg', 4.50, 1, '2025-10-26 21:10:00'),
(6162, 5085, 'Mediterranean Quinoa Salad', 'Fresh salad with quinoa, feta, and olives.', 'images/mediterranean_quinoa_salad.jpg', 9.99, 1, '2025-10-26 21:10:00'),

-- Restaurant 3072 (Continental, Lebanese)
(6163, 5086, 'Grilled Chicken Sandwich', 'Continental-style grilled chicken sandwich with fresh veggies.', 'images/grilled_chicken_sandwich.jpg', 10.50, 1, '2025-10-26 21:11:00'),
(6164, 5086, 'Hummus Platter', 'Classic Lebanese hummus with pita bread and olive oil.', 'images/hummus_platter.jpg', 8.99, 1, '2025-10-26 21:11:00'),

-- Restaurant 3073 (Seafood, Korean)
(6165, 5087, 'Grilled Salmon', 'Fresh Atlantic salmon grilled to perfection.', 'images/grilled_salmon.jpg', 16.50, 1, '2025-10-26 21:12:00'),
(6166, 5087, 'Bulgogi Beef', 'Korean marinated beef with sweet and savory flavors.', 'images/bulgogi_beef.jpg', 12.99, 1, '2025-10-26 21:12:00'),

-- Restaurant 3074 (Desserts, Vietnamese)
(6167, 5088, 'Chocolate Lava Cake', 'Molten chocolate cake served with ice cream.', 'images/chocolate_lava_cake.jpg', 6.50, 1, '2025-10-26 21:13:00'),
(6168, 5088, 'Vietnamese Iced Coffee', 'Strong coffee mixed with sweetened condensed milk and ice.', 'images/vietnamese_iced_coffee.jpg', 4.99, 1, '2025-10-26 21:13:00'),

-- Restaurant 3075 (Italian, Japanese, Pakistani)
(6169, 5089, 'Fettuccine Alfredo', 'Creamy Italian pasta with Parmesan cheese.', 'images/fettuccine_alfredo.jpg', 11.99, 1, '2025-10-26 21:14:00'),
(6170, 5089, 'Sushi Platter', 'Assorted sushi rolls with fresh fish and vegetables.', 'images/sushi_platter.jpg', 14.99, 1, '2025-10-26 21:14:00'),
(6171, 5089, 'Chicken Karahi', 'Traditional Pakistani chicken curry cooked with spices.', 'images/chicken_karahi.jpg', 12.50, 1, '2025-10-26 21:14:00'),

-- Restaurant 3076 (BBQ, Thai)
(6172, 5090, 'BBQ Lamb Chops', 'Tender lamb chops marinated in BBQ sauce.', 'images/bbq_lamb_chops.jpg', 15.50, 1, '2025-10-26 21:15:00'),
(6173, 5090, 'Thai Green Curry', 'Spicy coconut milk curry with chicken and vegetables.', 'images/thai_green_curry.jpg', 12.50, 1, '2025-10-26 21:15:00'),

-- Restaurant 3077 (Chinese, Mexican)
(6174, 5091, 'Sweet Chili Chicken', 'Crispy chicken tossed in sweet chili sauce.', 'images/sweet_chili_chicken.jpg', 11.50, 1, '2025-10-26 21:16:00'),
(6175, 5091, 'Beef Burrito', 'Flour tortilla filled with beef, beans, and cheese.', 'images/beef_burrito.jpg', 9.99, 1, '2025-10-26 21:16:00'),

-- Restaurant 3078 (Italian, Indian)
(6176, 5092, 'Penne Arrabbiata', 'Penne pasta in spicy tomato sauce.', 'images/penne_arrabbiata.jpg', 10.50, 1, '2025-10-26 21:17:00'),
(6177, 5092, 'Chicken Tikka Masala', 'Tender chicken in creamy spiced tomato gravy.', 'images/chicken_tikka_masala.jpg', 12.50, 1, '2025-10-26 21:17:00'),

-- Restaurant 3079 (Fast Food, Mediterranean)
(6178, 5093, 'Double Cheeseburger', 'Juicy beef burger with double cheese and fresh toppings.', 'images/double_cheeseburger.jpg', 9.50, 1, '2025-10-26 21:18:00'),
(6179, 5093, 'Grilled Veg Wrap', 'Mediterranean-style wrap with grilled vegetables and hummus.', 'images/grilled_veg_wrap.jpg', 8.99, 1, '2025-10-26 21:18:00'),

-- Restaurant 3080 (Cafe, Lebanese)
(6180, 5094, 'Cappuccino', 'Smooth espresso topped with milk froth.', 'images/cappuccino.jpg', 4.50, 1, '2025-10-26 21:19:00'),
(6181, 5094, 'Beef Kafta', 'Grilled Lebanese beef skewers served with sauce.', 'images/beef_kafta.jpg', 12.50, 1, '2025-10-26 21:19:00'),

-- Restaurant 3081 (Pakistani, Korean)
(6182, 5095, 'Chapli Kebab', 'Spicy minced meat patties, pan-fried.', 'images/chapli_kebab.jpg', 10.50, 1, '2025-10-26 21:20:00'),
(6183, 5095, 'Kimchi Stew', 'Spicy Korean stew with kimchi and pork.', 'images/kimchi_stew.jpg', 11.50, 1, '2025-10-26 21:20:00'),

-- Restaurant 3082 (BBQ, Vietnamese)
(6184, 5096, 'Grilled BBQ Ribs', 'Tender pork ribs glazed with smoky BBQ sauce.', 'images/grilled_bbq_ribs.jpg', 15.50, 1, '2025-10-26 21:21:00'),
(6185, 5096, 'Pho Bo', 'Vietnamese beef noodle soup with fresh herbs.', 'images/pho_bo.jpg', 11.50, 1, '2025-10-26 21:21:00'),

-- Restaurant 3083 (Chinese, Japanese, Italian)
(6186, 5097, 'Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts.', 'images/kung_pao_chicken.jpg', 12.50, 1, '2025-10-26 21:22:00'),
(6187, 5097, 'California Roll', 'Classic sushi roll with crab and avocado.', 'images/california_roll.jpg', 9.99, 1, '2025-10-26 21:22:00'),
(6188, 5097, 'Margherita Pizza', 'Italian pizza with fresh mozzarella and basil.', 'images/margherita_pizza.jpg', 11.50, 1, '2025-10-26 21:22:00'),

-- Restaurant 3084 (Italian, Thai)
(6189, 5098, 'Spaghetti Carbonara', 'Creamy spaghetti with pancetta and Parmesan.', 'images/spaghetti_carbonara.jpg', 12.50, 1, '2025-10-26 21:23:00'),
(6190, 5098, 'Pad Thai', 'Stir-fried Thai rice noodles with shrimp and peanuts.', 'images/pad_thai.jpg', 11.99, 1, '2025-10-26 21:23:00'),

-- Restaurant 3085 (Fast Food, Mexican)
(6191, 5099, 'Chicken Quesadilla', 'Grilled tortilla filled with chicken, cheese, and veggies.', 'images/chicken_quesadilla.jpg', 9.99, 1, '2025-10-26 21:24:00'),
(6192, 5099, 'Fries with Cheese', 'Crispy golden fries topped with melted cheese.', 'images/fries_with_cheese.jpg', 5.50, 1, '2025-10-26 21:24:00'),

-- Restaurant 3086 (Cafe, Indian)
(6193, 5100, 'Espresso', 'Strong and rich coffee served hot.', 'images/espresso.jpg', 3.99, 1, '2025-10-26 21:25:00'),
(6194, 5100, 'Butter Chicken', 'Creamy and spicy Indian butter chicken.', 'images/butter_chicken.jpg', 12.50, 1, '2025-10-26 21:25:00'),

-- Restaurant 3087 (Continental, Mediterranean)
(6195, 5101, 'Caesar Salad', 'Crisp romaine lettuce with Caesar dressing and croutons.', 'images/caesar_salad.jpg', 8.50, 1, '2025-10-26 21:26:00'),
(6196, 5101, 'Grilled Lamb', 'Mediterranean-style grilled lamb chops with herbs.', 'images/grilled_lamb.jpg', 16.50, 1, '2025-10-26 21:26:00'),

-- Restaurant 3088 (Seafood, Lebanese)
(6197, 5102, 'Garlic Butter Shrimp', 'Juicy shrimp sautéed in garlic butter sauce.', 'images/garlic_butter_shrimp.jpg', 14.99, 1, '2025-10-26 21:27:00'),
(6198, 5102, 'Tabbouleh Salad', 'Fresh parsley salad with bulgur, tomatoes, and lemon.', 'images/tabbouleh_salad.jpg', 7.99, 1, '2025-10-26 21:27:00'),

-- Restaurant 3089 (Desserts, Korean)
(6199, 5103, 'Chocolate Mousse', 'Smooth and creamy chocolate mousse dessert.', 'images/chocolate_mousse.jpg', 6.50, 1, '2025-10-26 21:28:00'),
(6200, 5103, 'Bingsu', 'Korean shaved ice dessert with toppings of choice.', 'images/bingsu.jpg', 5.99, 1, '2025-10-26 21:28:00'),

-- Restaurant 3090 (Italian, Vietnamese)
(6201, 5104, 'Lasagna', 'Layers of pasta, meat sauce, and cheese baked to perfection.', 'images/lasagna.jpg', 13.50, 1, '2025-10-26 21:29:00'),
(6202, 5104, 'Spring Rolls', 'Vietnamese spring rolls with shrimp and herbs.', 'images/spring_rolls.jpg', 7.99, 1, '2025-10-26 21:29:00'),

-- Restaurant 3091 (Pakistani, Japanese)
(6203, 5105, 'Nihari', 'Slow-cooked Pakistani beef stew with rich spices.', 'images/nihari.jpg', 11.50, 1, '2025-10-26 21:30:00'),
(6204, 5105, 'Teriyaki Chicken', 'Japanese grilled chicken with teriyaki glaze.', 'images/teriyaki_chicken.jpg', 12.50, 1, '2025-10-26 21:30:00'),

-- Restaurant 3092 (BBQ, Thai)
(6205, 5106, 'BBQ Chicken Wings', 'Spicy and smoky chicken wings.', 'images/bbq_chicken_wings.jpg', 9.99, 1, '2025-10-26 21:31:00'),
(6206, 5106, 'Tom Yum Soup', 'Hot and sour Thai soup with shrimp.', 'images/tom_yum_soup.jpg', 7.50, 1, '2025-10-26 21:31:00'),

-- Restaurant 3093 (Chinese, Mexican)
(6207, 5107, 'Beef Chow Mein', 'Stir-fried noodles with beef and vegetables.', 'images/beef_chow_mein.jpg', 11.50, 1, '2025-10-26 21:32:00'),
(6208, 5107, 'Chicken Tacos', 'Soft tortillas filled with spiced chicken and veggies.', 'images/chicken_tacos.jpg', 9.50, 1, '2025-10-26 21:32:00'),

-- Restaurant 3094 (Italian, Indian)
(6209, 5108, 'Ravioli', 'Pasta pockets filled with cheese and herbs.', 'images/ravioli.jpg', 12.50, 1, '2025-10-26 21:33:00'),
(6210, 5108, 'Palak Paneer', 'Indian spinach curry with paneer cheese.', 'images/palak_paneer.jpg', 10.50, 1, '2025-10-26 21:33:00'),

-- Restaurant 3095 (Fast Food, Mediterranean)
(6211, 5109, 'Veggie Burger', 'Grilled veggie patty with fresh toppings.', 'images/veggie_burger.jpg', 8.50, 1, '2025-10-26 21:34:00'),
(6212, 5109, 'Falafel Wrap', 'Mediterranean falafel wrapped in fresh flatbread.', 'images/falafel_wrap.jpg', 7.99, 1, '2025-10-26 21:34:00'),

-- Restaurant 3096 (Cafe, Lebanese)
(6213, 5110, 'Latte', 'Smooth coffee with steamed milk.', 'images/latte.jpg', 4.50, 1, '2025-10-26 21:35:00'),
(6214, 5110, 'Shawarma', 'Grilled Lebanese meat wrap with garlic sauce.', 'images/shawarma.jpg', 9.99, 1, '2025-10-26 21:35:00'),

-- Restaurant 3097 (Continental, Korean)
(6215, 5111, 'Grilled Veg Sandwich', 'Continental-style sandwich with fresh vegetables.', 'images/grilled_veg_sandwich.jpg', 8.50, 1, '2025-10-26 21:36:00'),
(6216, 5111, 'Bibimbap', 'Korean rice bowl with vegetables and egg.', 'images/bibimbap.jpg', 11.50, 1, '2025-10-26 21:36:00'),

-- Restaurant 3098 (BBQ, Vietnamese)
(6217, 5112, 'BBQ Beef Skewers', 'Tender beef skewers with smoky marinade.', 'images/bbq_beef_skewers.jpg', 13.50, 1, '2025-10-26 21:37:00'),
(6218, 5112, 'Vietnamese Summer Rolls', 'Fresh rice paper rolls with shrimp and herbs.', 'images/summer_rolls.jpg', 8.99, 1, '2025-10-26 21:37:00'),

-- Restaurant 3099 (Chinese, Japanese)
(6219, 5113, 'General Tso Chicken', 'Crispy chicken in sweet and spicy sauce.', 'images/general_tso_chicken.jpg', 12.50, 1, '2025-10-26 21:38:00'),
(6220, 5113, 'Salmon Nigiri', 'Fresh salmon slices over sushi rice.', 'images/salmon_nigiri.jpg', 11.50, 1, '2025-10-26 21:38:00'),

-- Restaurant 3100 (Italian, Thai, Fast Food)
(6221, 5114, 'Spaghetti Bolognese', 'Classic Italian pasta with rich meat sauce.', 'images/spaghetti_bolognese.jpg', 12.50, 1, '2025-10-26 21:39:00'),
(6222, 5114, 'Green Curry', 'Thai green curry with chicken and vegetables.', 'images/green_curry.jpg', 12.00, 1, '2025-10-26 21:39:00'),
(6223, 5114, 'Cheese Pizza', 'Oven-baked pizza topped with mozzarella cheese.', 'images/cheese_pizza.jpg', 10.50, 1, '2025-10-26 21:39:00');

-- Table structure for table `photo`

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `PhotoID` int(11) NOT NULL,
  `RestaurantID` int(11) DEFAULT NULL,
  `ReviewID` int(11) DEFAULT NULL,
  `MenuItemID` int(11) DEFAULT NULL,
  `UploadedByUserId` int(11) DEFAULT NULL,
  `Url` varchar(1024) NOT NULL,
  `Caption` varchar(512) DEFAULT NULL,
  `IsPrimary` tinyint(1) DEFAULT 0,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `promotion`

DROP TABLE IF EXISTS `promotion`;
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `PromotionID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `DiscountPercent` decimal(5,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `RatingScore` tinyint(4) NOT NULL CHECK (`RatingScore` between 1 and 5),
  `ReviewID` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `rating` (`RatingID`, `UserID`, `RestaurantID`, `RatingScore`, `ReviewID`, `Date`) VALUES
(7001, 2001, 3001, 5, 9101, '2025-06-01 12:15:00'),
(7002, 2001, 3002, 4, 9102, '2025-06-03 13:20:00'),
(7003, 2002, 3001, 4, 9103, '2025-06-02 14:45:00'),
(7004, 2002, 3003, 3, 9104, '2025-06-05 15:30:00'),
(7005, 2003, 3002, 5, 9105, '2025-06-01 16:10:00'),
(7006, 2003, 3004, 4, 9106, '2025-06-06 17:05:00'),
(7007, 2004, 3003, 2, 9107, '2025-06-03 12:50:00'),
(7008, 2004, 3005, 4, 9108, '2025-06-07 18:00:00'),
(7009, 2005, 3004, 5, 9109, '2025-06-02 14:00:00'),
(7010, 2005, 3006, 3, 9110, '2025-06-08 19:20:00'),
(7011, 2006, 3005, 4, 9111, '2025-06-04 13:10:00'),
(7012, 2006, 3007, 5, 9112, '2025-06-09 15:30:00'),
(7013, 2007, 3006, 5, 9113, '2025-06-01 11:30:00'),
(7014, 2007, 3008, 4, 9114, '2025-06-05 14:45:00'),
(7015, 2008, 3007, 3, 9115, '2025-06-03 12:00:00'),
(7016, 2008, 3009, 4, 9116, '2025-06-06 16:50:00'),
(7017, 2009, 3008, 5, 9117, '2025-06-02 13:25:00'),
(7018, 2009, 3010, 4, 9118, '2025-06-07 18:40:00'),
(7019, 2010, 3009, 3, 9119, '2025-06-04 14:15:00'),
(7020, 2010, 3001, 4, 9120, '2025-06-08 12:35:00'),
(7021, 2011, 3011, 5, 9121, '2025-06-01 13:15:00'),
(7022, 2012, 3011, 4, 9122, '2025-06-02 14:20:00'),
(7023, 2013, 3012, 3, 9123, '2025-06-03 15:30:00'),
(7024, 2014, 3012, 4, 9124, '2025-06-04 16:10:00'),
(7025, 2011, 3013, 5, 9125, '2025-06-05 12:45:00'),
(7026, 2015, 3013, 4, 9126, '2025-06-06 13:50:00'),
(7027, 2016, 3014, 3, 9127, '2025-06-07 14:35:00'),
(7028, 2012, 3014, 4, 9128, '2025-06-08 15:40:00'),
(7029, 2017, 3015, 5, 9129, '2025-06-02 16:25:00'),
(7030, 2018, 3015, 4, 9130, '2025-06-03 17:10:00'),
(7031, 2013, 3016, 3, 9131, '2025-06-04 12:50:00'),
(7032, 2019, 3016, 4, 9132, '2025-06-05 13:30:00'),
(7033, 2020, 3017, 5, 9133, '2025-06-06 14:15:00'),
(7034, 2014, 3017, 4, 9134, '2025-06-07 15:00:00'),
(7035, 2015, 3018, 3, 9135, '2025-06-08 16:20:00'),
(7036, 2016, 3018, 5, 9136, '2025-06-02 17:45:00'),
(7037, 2017, 3019, 4, 9137, '2025-06-03 12:35:00'),
(7038, 2018, 3019, 5, 9138, '2025-06-04 13:50:00'),
(7039, 2019, 3020, 3, 9139, '2025-06-05 14:40:00'),
(7040, 2020, 3020, 4, 9140, '2025-06-06 15:25:00'),
(7041, 2001, 3021, 5, 9141, '2025-06-01 12:20:00'),
(7042, 2002, 3021, 4, 9142, '2025-06-02 13:25:00'),
(7043, 2003, 3022, 3, 9143, '2025-06-03 14:30:00'),
(7044, 2004, 3022, 4, 9144, '2025-06-04 15:35:00'),
(7045, 2005, 3023, 5, 9145, '2025-06-05 16:40:00'),
(7046, 2006, 3023, 4, 9146, '2025-06-06 17:45:00'),
(7047, 2007, 3024, 3, 9147, '2025-06-07 12:50:00'),
(7048, 2008, 3024, 5, 9148, '2025-06-08 13:55:00'),
(7049, 2009, 3025, 4, 9149, '2025-06-02 14:00:00'),
(7050, 2010, 3025, 5, 9150, '2025-06-03 15:05:00'),
(7051, 2011, 3026, 3, 9151, '2025-06-04 16:10:00'),
(7052, 2012, 3026, 4, 9152, '2025-06-05 17:15:00'),
(7053, 2013, 3027, 5, 9153, '2025-06-06 12:20:00'),
(7054, 2014, 3027, 4, 9154, '2025-06-07 13:25:00'),
(7055, 2015, 3028, 3, 9155, '2025-06-08 14:30:00'),
(7056, 2016, 3028, 5, 9156, '2025-06-02 15:35:00'),
(7057, 2017, 3029, 4, 9157, '2025-06-03 16:40:00'),
(7058, 2018, 3029, 5, 9158, '2025-06-04 17:45:00'),
(7059, 2019, 3030, 3, 9159, '2025-06-05 12:50:00'),
(7060, 2020, 3030, 4, 9160, '2025-06-06 13:55:00'),
(7061, 2001, 3031, 5, 9161, '2025-06-01 12:15:00'),
(7062, 2002, 3031, 4, 9162, '2025-06-02 13:20:00'),
(7063, 2003, 3032, 3, 9163, '2025-06-03 14:25:00'),
(7064, 2004, 3032, 5, 9164, '2025-06-04 15:30:00'),
(7065, 2005, 3033, 4, 9165, '2025-06-05 16:35:00'),
(7066, 2006, 3033, 5, 9166, '2025-06-06 17:40:00'),
(7067, 2007, 3034, 3, 9167, '2025-06-07 12:45:00'),
(7068, 2008, 3034, 4, 9168, '2025-06-08 13:50:00'),
(7069, 2009, 3035, 5, 9169, '2025-06-02 14:55:00'),
(7070, 2010, 3035, 4, 9170, '2025-06-03 16:00:00'),
(7071, 2011, 3036, 3, 9171, '2025-06-04 17:05:00'),
(7072, 2012, 3036, 5, 9172, '2025-06-05 12:10:00'),
(7073, 2013, 3037, 4, 9173, '2025-06-06 13:15:00'),
(7074, 2014, 3037, 5, 9174, '2025-06-07 14:20:00'),
(7075, 2015, 3038, 3, 9175, '2025-06-08 15:25:00'),
(7076, 2016, 3038, 4, 9176, '2025-06-02 16:30:00'),
(7077, 2017, 3039, 5, 9177, '2025-06-03 17:35:00'),
(7078, 2018, 3039, 4, 9178, '2025-06-04 12:40:00'),
(7079, 2019, 3040, 3, 9179, '2025-06-05 13:45:00'),
(7080, 2020, 3040, 5, 9180, '2025-06-06 14:50:00'),
(7081, 2001, 3041, 5, 9181, '2025-06-01 12:10:00'),
(7082, 2002, 3041, 4, 9182, '2025-06-02 13:15:00'),
(7083, 2003, 3042, 3, 9183, '2025-06-03 14:20:00'),
(7084, 2004, 3042, 4, 9184, '2025-06-04 15:25:00'),
(7085, 2005, 3043, 5, 9185, '2025-06-05 16:30:00'),
(7086, 2006, 3043, 4, 9186, '2025-06-06 17:35:00'),
(7087, 2007, 3044, 3, 9187, '2025-06-07 12:40:00'),
(7088, 2008, 3044, 5, 9188, '2025-06-08 13:45:00'),
(7089, 2009, 3045, 4, 9189, '2025-06-02 14:50:00'),
(7090, 2010, 3045, 5, 9190, '2025-06-03 15:55:00'),
(7091, 2011, 3046, 3, 9191, '2025-06-04 16:00:00'),
(7092, 2012, 3046, 4, 9192, '2025-06-05 17:05:00'),
(7093, 2013, 3047, 5, 9193, '2025-06-06 12:10:00'),
(7094, 2014, 3047, 4, 9194, '2025-06-07 13:15:00'),
(7095, 2015, 3048, 3, 9195, '2025-06-08 14:20:00'),
(7096, 2016, 3048, 5, 9196, '2025-06-02 15:25:00'),
(7097, 2017, 3049, 4, 9197, '2025-06-03 16:30:00'),
(7098, 2018, 3049, 5, 9198, '2025-06-04 17:35:00'),
(7099, 2019, 3050, 3, 9199, '2025-06-05 12:40:00'),
(7100, 2020, 3050, 4, 9200, '2025-06-06 13:45:00');


-- Table structure for table `restaurant`
--
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `RestaurantID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `PriceRange` int(11) DEFAULT 0,
  `Owner_ID` int(11) DEFAULT NULL,
  `ParentRestaurantID` int(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Website` varchar(512) DEFAULT NULL,
  `AvgRating` decimal(2,1) DEFAULT 0.0,
  `TotalRatings` int(11) DEFAULT 0,
  `IsActive` tinyint(1) DEFAULT 1,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`RestaurantID`, `Name`, `Description`, `AddressID`, `PriceRange`, `Owner_ID`, `ParentRestaurantID`, `Email`, `Phone`, `Website`, `AvgRating`, `TotalRatings`, `IsActive`, `CreatedAt`, `UpdatedAt`) VALUES
(3001, 'Aroma Bistro', 'Aroma Bistro offers delicious local cuisine in Clifton, Karachi.', 4001,50000, 1001, NULL, 'aromabistro@example.com', '0213026225', 'https://www.aromabistro.com', 4.5, 300, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3002, 'Seaside Grill', 'Seaside Grill offers delicious local cuisine in DHA, Karachi.', 4002,7000, 1002, NULL, 'seasidegrill@example.com', '0213619176', 'https://www.seasidegrill.com', 4.0, 80, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3003, 'Spice Avenue', 'Spice Avenue offers delicious local cuisine in Gulshan-e-Iqbal, Karachi.', 4003, 80000, 1003, NULL, 'spiceavenue@example.com', '0213588508', 'https://www.spiceavenue.com', 3.8, 715, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3004, 'Urban Tandoor', 'Urban Tandoor offers delicious fusion cuisine in North Nazimabad, Karachi.', 4004,10000, 1004, NULL, 'urbantandoor@example.com', '0213848749', 'https://www.urbantandoor.com', 4.6, 213, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3005, 'The Noodle House', 'The Noodle House offers delicious international cuisine in Bahadurabad, Karachi.', 4005, 4000, 1005, NULL, 'thenoodlehouse@example.com', '0213800581', 'https://www.thenoodlehouse.com', 3.9, 144, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3006, 'Bella Pizza', 'Bella Pizza offers delicious fusion cuisine in PECHS, Karachi.', 4006, 10000, 1006, NULL, 'bellapizza@example.com', '0213846335', 'https://www.bellapizza.com', 3.6, 520, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3007, 'Burger Hub', 'Burger Hub offers delicious local cuisine in Karachi Cantt, Karachi.', 4007,50000, 1007, NULL, 'burgerhub@example.com', '0213578856', 'https://www.burgerhub.com', 3.9, 693, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3008, 'Saffron Delight', 'Saffron Delight offers delicious international cuisine in Korangi, Karachi.', 4008, 3000, 1008, NULL, 'saffrondelight@example.com', '0213738797', 'https://www.saffrondelight.com', 3.6, 727, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3009, 'Taste of Lahore', 'Taste of Lahore offers delicious international cuisine in Nazimabad, Karachi.', 4009, 2000, 1009, NULL, 'tasteoflahore@example.com', '0213908573', 'https://www.tasteoflahore.com', 3.6, 334, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3010, 'Crave Cafe', 'Crave Cafe offers delicious fusion cuisine in Malir, Karachi.', 4010, 6000, 1010, NULL, 'cravecafe@example.com', '0213372528', 'https://www.cravecafe.com', 3.8, 323, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3011, 'Karachi Biryani', 'Karachi Biryani offers delicious international cuisine in Gulberg, Karachi.', 4011, 60000, 1001, NULL, 'karachibiryani@example.com', '0213560086', 'https://www.karachibiryani.com', 4.4, 217, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3012, 'Ocean\'s Catch', 'Ocean\'s Catch offers delicious international cuisine in Jetty, Karachi.', 4012, 60000, 1002, NULL, 'oceanscatch@example.com', '0213717870', 'https://www.oceanscatch.com', 3.9, 107, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3013, 'The Kebab Factory', 'The Kebab Factory offers delicious authentic cuisine in Saddar, Karachi.', 4013, 20000, 1003, NULL, 'thekebabfactory@example.com', '0213280746', 'https://www.thekebabfactory.com', 3.6, 630, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3014, 'Chopsticks', 'Chopsticks offers delicious authentic cuisine in Garden, Karachi.', 4014, 10000, 1004, NULL, 'chopsticks@example.com', '0213414850', 'https://www.chopsticks.com', 4.7, 708, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3015, 'Green Garden', 'Green Garden offers delicious fusion cuisine in Clifton Block 4, Karachi.', 4015, 1000, 1005, NULL, 'greengarden@example.com', '0213783300', 'https://www.greengarden.com', 4.3, 647, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3016, 'The Pasta Place', 'The Pasta Place offers delicious authentic cuisine in University Road, Karachi.', 4016, 8000, 1006, NULL, 'thepastaplace@example.com', '0213095325', 'https://www.thepastaplace.com', 4.5, 162, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3017, 'Grill Master', 'Grill Master offers delicious authentic cuisine in Sindhi Muslim, Karachi.', 4017, 9000, 1007, NULL, 'grillmaster@example.com', '0213625380', 'https://www.grillmaster.com', 3.6, 440, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3018, 'Dough & Sauce', 'Dough & Sauce offers delicious local cuisine in Shahrah-e-Faisal, Karachi.', 4018, 9000, 1008, NULL, 'dough&sauce@example.com', '0213713328', 'https://www.dough&sauce.com', 4.4, 748, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3019, 'Sizzle Shack', 'Sizzle Shack offers delicious fusion cuisine in Gulistan-e-Johar, Karachi.', 4019, 5000, 1009, NULL, 'sizzleshack@example.com', '0213116970', 'https://www.sizzleshack.com', 3.9, 211, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3020, 'Royal Dhaba', 'Royal Dhaba offers delicious fusion cuisine in Boat Basin, Karachi.', 4020, 10000, 1010, NULL, 'royaldhaba@example.com', '0213524902', 'https://www.royaldhaba.com', 4.5, 569, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3021, 'Tea Terrace', 'Tea Terrace offers delicious international cuisine in Bahadurabad Block 2, Karachi.', 4021, 20000, 1001, NULL, 'teaterrace@example.com', '0213160263', 'https://www.teaterrace.com', 4.0, 215, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3022, 'Deli Corner', 'Deli Corner offers delicious local cuisine in Dhoraji, Karachi.', 4022, 8000, 1002, NULL, 'delicorner@example.com', '0213628038', 'https://www.delicorner.com', 3.9, 69, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3023, 'Skyline Diner', 'Skyline Diner offers delicious international cuisine in Liaquatabad, Karachi.', 4023, 20000, 1003, NULL, 'skylinediner@example.com', '0213060738', 'https://www.skylinediner.com', 3.8, 630, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3024, 'Masala Mix', 'Masala Mix offers delicious local cuisine in Sultanabad, Karachi.', 4024, 8000, 1004, NULL, 'masalamix@example.com', '0213797549', 'https://www.masalamix.com', 4.2, 178, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3025, 'Fusion Feast', 'Fusion Feast offers delicious international cuisine in Gizri, Karachi.', 4025, 1000, 1005, NULL, 'fusionfeast@example.com', '0213277932', 'https://www.fusionfeast.com', 4.2, 671, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3026, 'Curry Club', 'Curry Club offers delicious international cuisine in PECHS Block 2, Karachi.', 4026, 9000, 1006, NULL, 'curryclub@example.com', '0213747581', 'https://www.curryclub.com', 3.9, 737, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3027, 'Rice & Roll', 'Rice & Roll offers delicious authentic cuisine in Korangi Industrial, Karachi.', 4027, 40000, 1007, NULL, 'rice&roll@example.com', '0213126882', 'https://www.rice&roll.com', 3.8, 115, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3028, 'Smokey Barrels', 'Smokey Barrels offers delicious international cuisine in Clifton Seaside, Karachi.', 4028, 9000, 1008, NULL, 'smokeybarrels@example.com', '0213007540', 'https://www.smokeybarrels.com', 3.6, 696, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3029, 'Mediterranean Kitchen', 'Mediterranean Kitchen offers delicious fusion cuisine in Gulshan Block 13, Karachi.', 4029, 8000, 1009, NULL, 'mediterraneankitchen@example.com', '0213074299', 'https://www.mediterraneankitchen.com', 4.2, 335, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3030, 'Sweet Tooth', 'Sweet Tooth offers delicious authentic cuisine in Nazimabad Block 3, Karachi.', 4030, 10000, 1010, NULL, 'sweettooth@example.com', '0213254801', 'https://www.sweettooth.com', 4.5, 466, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3031, 'Falafel Corner', 'Falafel Corner offers delicious fusion cuisine in Model Colony, Karachi.', 4031, 1000, 1001, NULL, 'falafelcorner@example.com', '0213444154', 'https://www.falafelcorner.com', 4.0, 796, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3032, 'Kabob & Co', 'Kabob & Co offers delicious local cuisine in Frere Town, Karachi.', 4032, 8000, 1002, NULL, 'kabob&co@example.com', '0213063556', 'https://www.kabob&co.com', 4.0, 397, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3033, 'The Deli Slice', 'The Deli Slice offers delicious international cuisine in KDA Scheme, Karachi.', 4033, 5000, 1003, NULL, 'thedelislice@example.com', '0213562336', 'https://www.thedelislice.com', 4.1, 482, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3034, 'Paneer Palace', 'Paneer Palace offers delicious authentic cuisine in Hill Park, Karachi.', 4034, 8000, 1004, NULL, 'paneerpalace@example.com', '0213847272', 'https://www.paneerpalace.com', 4.6, 613, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3035, 'Street Bites', 'Street Bites offers delicious local cuisine in Mehmoodabad, Karachi.', 4035, 5000, 1005, NULL, 'streetbites@example.com', '0213097793', 'https://www.streetbites.com', 4.7, 292, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3036, 'YumYum', 'YumYum offers delicious authentic cuisine in Civic Center, Karachi.', 4036, 1000, 1006, NULL, 'yumyum@example.com', '0213946279', 'https://www.yumyum.com', 3.6, 438, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3037, 'Ocean Breeze', 'Ocean Breeze offers delicious fusion cuisine in Bahadurabad Market, Karachi.', 4037, 4000, 1007, NULL, 'oceanbreeze@example.com', '0213443555', 'https://www.oceanbreeze.com', 4.4, 798, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3038, 'Hidden Gem', 'Hidden Gem offers delicious authentic cuisine in PECHS Block 6, Karachi.', 4038, 10000, 1008, NULL, 'hiddengem@example.com', '0213162316', 'https://www.hiddengem.com', 3.7, 272, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3039, 'Spice Route', 'Spice Route offers delicious local cuisine in Gulshan-e-Maymar, Karachi.', 4039, 40000, 1009, NULL, 'spiceroute@example.com', '0213784309', 'https://www.spiceroute.com', 3.9, 101, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3040, 'Crust & Crumb', 'Crust & Crumb offers delicious international cuisine in Clifton Block 7, Karachi.', 4040, 7000, 1010, NULL, 'crust&crumb@example.com', '0213059642', 'https://www.crust&crumb.com', 4.7, 132, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3041, 'Chili House', 'Chili House offers delicious international cuisine in Boat Basin Road, Karachi.', 4041, 4000, 1001, NULL, 'chilihouse@example.com', '0213423389', 'https://www.chilihouse.com', 3.7, 633, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3042, 'Brewed Awakenings', 'Brewed Awakenings offers delicious local cuisine in Hyderi, Karachi.', 4042, 20000, 1002, NULL, 'brewedawakenings@example.com', '0213439589', 'https://www.brewedawakenings.com', 4.4, 628, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3043, 'Sam\'s BBQ', 'Sam\'s BBQ offers delicious fusion cuisine in Saba, Karachi.', 4043, 10000, 1003, NULL, 'samsbbq@example.com', '0213250280', 'https://www.samsbbq.com', 3.8, 184, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3044, 'Momo House', 'Momo House offers delicious local cuisine in Karsaz, Karachi.', 4044, 4000, 1004, NULL, 'momohouse@example.com', '0213009767', 'https://www.momohouse.com', 4.1, 626, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3045, 'Gourmet Hub', 'Gourmet Hub offers delicious fusion cuisine in Khyaban-e-Iqbal, Karachi.', 4045, 6000, 1005, NULL, 'gourmethub@example.com', '0213138890', 'https://www.gourmethub.com', 4.7, 120, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3046, 'Tikka Town', 'Tikka Town offers delicious authentic cuisine in Shireen Jinnah Colony, Karachi.', 4046, 5000, 1006, NULL, 'tikkatown@example.com', '0213874244', 'https://www.tikkatown.com', 4.2, 359, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3047, 'Grains & Greens', 'Grains & Greens offers delicious local cuisine in Clifton, Karachi.', 4047, 5000, 1007, NULL, 'grains&greens@example.com', '0213700305', 'https://www.grains&greens.com', 4.6, 356, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3048, 'Naan & Beyond', 'Naan & Beyond offers delicious fusion cuisine in DHA, Karachi.', 4048, 7000, 1008, NULL, 'naan&beyond@example.com', '0213121035', 'https://www.naan&beyond.com', 4.7, 616, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3049, 'Mama Mia Pizzeria', 'Mama Mia Pizzeria offers delicious fusion cuisine in Gulshan-e-Iqbal, Karachi.', 4049, 8000, 1009, NULL, 'mamamiapizzeria@example.com', '0213213487', 'https://www.mamamiapizzeria.com', 4.4, 320, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3050, 'Sultan\'s Grill', 'Sultan\'s Grill offers delicious local cuisine in North Nazimabad, Karachi.', 4050, 9000, 1010, NULL, 'sultansgrill@example.com', '0213665095', 'https://www.sultansgrill.com', 4.1, 333, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3051, 'Cafe Delights', 'Cafe Delights offers a variety of coffees and desserts in Korangi, Karachi.', 4051, 4500, 1001, NULL, 'cafedelights@example.com', '0213765432', 'https://www.cafedelights.com', 4.2, 412, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3052, 'BBQ Nation', 'BBQ Nation offers delicious BBQ cuisine in DHA Phase 1, Karachi.', 4052, 18000, 1002, NULL, 'bbqnation@example.com', '0213456789', 'https://www.bbqnation.com', 4.5, 598, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3053, 'Noodle Express', 'Noodle Express serves authentic Chinese noodles in Gulshan-e-Iqbal, Karachi.', 4053, 3200, 1003, NULL, 'noodleexpress@example.com', '0213567890', 'https://www.noodleexpress.com', 3.9, 276, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3054, 'Pasta Corner', 'Pasta Corner offers Italian specialties in Clifton Block 5, Karachi.', 4054, 12500, 1004, NULL, 'pastacorner@example.com', '0213678901', 'https://www.pastacorner.com', 4.3, 498, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3055, 'Sweet Escape', 'Sweet Escape serves desserts and pastries in PECHS, Karachi.', 4055, 4000, 1005, NULL, 'sweetescape@example.com', '0213789012', 'https://www.sweetescape.com', 4.6, 355, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3056, 'Grill & Chill', 'Grill & Chill offers BBQ and fast food options in Korangi Industrial Area, Karachi.', 4056, 7000, 1006, NULL, 'grill&chill@example.com', '0213890123', 'https://www.grillandchill.com', 4.1, 412, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3057, 'Cafe Aroma', 'Cafe Aroma serves coffees, shakes and desserts in Clifton, Karachi.', 4057, 16000, 1007, NULL, 'cafearoma@example.com', '0213901234', 'https://www.cafearoma.com', 4.4, 524, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3058, 'Tandoori Flames', 'Tandoori Flames offers authentic Pakistani cuisine in Gulistan-e-Johar, Karachi.', 4058, 14000, 1008, NULL, 'tandooriflames@example.com', '0213012345', 'https://www.tandooriflames.com', 4.0, 423, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3059, 'Sushi House', 'Sushi House offers fresh sushi and Japanese dishes in Clifton Seaside, Karachi.', 4059, 19000, 1009, NULL, 'sushihouse@example.com', '0213123456', 'https://www.sushihouse.com', 4.5, 311, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3060, 'Burger Express', 'Burger Express serves fast food and burgers in Nazimabad, Karachi.', 4060, 5000, 1010, NULL, 'burgerexpress@example.com', '0213234567', 'https://www.burgerexpress.com', 3.8, 289, 1, '2025-10-26 19:10:00', '2025-10-26 19:10:00'),
(3061, 'Pizzeria Roma', 'Pizzeria Roma serves authentic Italian pizza in Bahadurabad, Karachi.', 4061, 12000, 1001, NULL, 'pizzeriaroma@example.com', '0213345678', 'https://www.pizzeriaroma.com', 4.3, 415, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3062, 'Green Bowl', 'Green Bowl offers healthy salads and bowls in DHA Phase 2, Karachi.', 4062, 8500, 1002, NULL, 'greenbowl@example.com', '0213456789', 'https://www.greenbowl.com', 4.6, 298, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3063, 'Momo Magic', 'Momo Magic serves traditional momos and fast food in Gulshan-e-Iqbal, Karachi.', 4063, 6000, 1003, NULL, 'momomagic@example.com', '0213567890', 'https://www.momomagic.com', 4.1, 360, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3064, 'Cafe Latte', 'Cafe Latte serves coffee and pastries in Clifton Block 2, Karachi.', 4064, 9000, 1004, NULL, 'cafelatte@example.com', '0213678901', 'https://www.cafelatte.com', 4.2, 412, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3065, 'Tikka Express', 'Tikka Express offers Pakistani BBQ and fast food in PECHS Block 1, Karachi.', 4065, 7000, 1005, NULL, 'tikkaexpress@example.com', '0213789012', 'https://www.tikkaexpress.com', 4.0, 388, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3066, 'Saffron Lounge', 'Saffron Lounge offers Middle Eastern and fusion cuisine in Korangi, Karachi.', 4066, 16000, 1006, NULL, 'saffronlounge@example.com', '0213890123', 'https://www.saffronlounge.com', 4.4, 321, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3067, 'Pasta Fresca', 'Pasta Fresca serves fresh pasta dishes in Gulistan-e-Johar, Karachi.', 4067, 13000, 1007, NULL, 'pastafresca@example.com', '0213901234', 'https://www.pastafresca.com', 4.5, 299, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3068, 'Burger Town', 'Burger Town serves fast food burgers and fries in Clifton Seaside, Karachi.', 4068, 5000, 1008, NULL, 'burgertown@example.com', '0213012345', 'https://www.burgertown.com', 3.9, 375, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3069, 'Royal Biryani', 'Royal Biryani offers authentic Pakistani biryani in Bahadurabad, Karachi.', 4069, 11000, 1009, NULL, 'royalbiryani@example.com', '0213123456', 'https://www.royalbiryani.com', 4.6, 480, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3070, 'Sweet Haven', 'Sweet Haven serves desserts, cakes, and pastries in North Nazimabad, Karachi.', 4070, 4000, 1010, NULL, 'sweethaven@example.com', '0213234567', 'https://www.sweethaven.com', 4.3, 360, 1, '2025-10-26 19:11:00', '2025-10-26 19:11:00'),
(3071, 'Noodle Mania', 'Noodle Mania offers authentic Chinese and fusion noodles in Gulshan-e-Iqbal, Karachi.', 4071, 7500, 1001, NULL, 'noodlemania@example.com', '0213345670', 'https://www.noodlemania.com', 4.1, 420, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3072, 'Cafe Mocha', 'Cafe Mocha serves coffee, tea, and light snacks in DHA Phase 6, Karachi.', 4072, 9000, 1002, NULL, 'cafemocha@example.com', '0213456781', 'https://www.cafemocha.com', 4.5, 390, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3073, 'Kebab House', 'Kebab House offers Pakistani BBQ and grilled dishes in Clifton Block 5, Karachi.', 4073, 13000, 1003, NULL, 'kebabhouse@example.com', '0213567892', 'https://www.kebabhouse.com', 4.3, 450, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3074, 'Choco Delight', 'Choco Delight serves desserts and sweet treats in Bahadurabad, Karachi.', 4074, 4000, 1004, NULL, 'chocodelight@example.com', '0213678903', 'https://www.chocodelight.com', 4.6, 310, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3075, 'Grill & Chill', 'Grill & Chill offers BBQ and fast food in PECHS Block 3, Karachi.', 4075, 12000, 1005, NULL, 'grill&chill@example.com', '0213789014', 'https://www.grillandchill.com', 4.2, 370, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3076, 'Italiano Bistro', 'Italiano Bistro serves authentic Italian cuisine in Gulistan-e-Johar, Karachi.', 4076, 18000, 1006, NULL, 'italianobistro@example.com', '0213890125', 'https://www.italianobistro.com', 4.7, 295, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3077, 'Wrap & Roll', 'Wrap & Roll offers sandwiches and wraps in Clifton Seaside, Karachi.', 4077, 6000, 1007, NULL, 'wrap&roll@example.com', '0213901236', 'https://www.wrapandroll.com', 4.0, 410, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3078, 'Sushi Point', 'Sushi Point serves authentic Japanese sushi in Bahadurabad, Karachi.', 4078, 20000, 1008, NULL, 'sushipoint@example.com', '0213012347', 'https://www.sushipoint.com', 4.5, 340, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3079, 'Veggie Delight', 'Veggie Delight offers vegetarian and vegan meals in North Nazimabad, Karachi.', 4079, 8000, 1009, NULL, 'veggiedelight@example.com', '0213123458', 'https://www.veggiedelight.com', 4.3, 380, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3080, 'Cupcake Heaven', 'Cupcake Heaven serves cupcakes and desserts in Gulshan Block 14, Karachi.', 4080, 5000, 1010, NULL, 'cupcakeheaven@example.com', '0213234569', 'https://www.cupcakeheaven.com', 4.4, 355, 1, '2025-10-26 19:12:00', '2025-10-26 19:12:00'),
(3081, 'Tandoori Flames', 'Tandoori Flames offers Pakistani BBQ and traditional dishes in Clifton Block 2, Karachi.', 4081,14000, 1001, NULL, 'tandooriflames@example.com', '0213345671', 'https://www.tandooriflames.com', 4.6, 420, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3082, 'Pasta Fresca', 'Pasta Fresca serves authentic Italian pasta and pizzas in DHA Phase 5, Karachi.', 4082, 16000, 1002, NULL, 'pastafresca@example.com', '0213456782', 'https://www.pastafresca.com', 4.5, 395, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3083, 'Burger Palace', 'Burger Palace offers fast food burgers and sandwiches in Gulshan-e-Iqbal, Karachi.', 4083, 8000, 1003, NULL, 'burgerpalace@example.com', '0213567893', 'https://www.burgerpalace.com', 4.0, 450, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3084, 'Curry House', 'Curry House serves Pakistani and Indian curries in Bahadurabad, Karachi.', 4084, 12000, 1004, NULL, 'curryhouse@example.com', '0213678904', 'https://www.curryhouse.com', 4.3, 360, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3085, 'Choco Mania', 'Choco Mania offers desserts, chocolates, and sweet treats in PECHS Block 4, Karachi.', 4085, 5000, 1005, NULL, 'chocomania@example.com', '0213789015', 'https://www.chocomania.com', 4.7, 410, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3086, 'Grill & Go', 'Grill & Go offers BBQ and fast food in Gulistan-e-Johar, Karachi.', 4086, 13000, 1006, NULL, 'grill&go@example.com', '0213890126', 'https://www.grillandgo.com', 4.2, 375, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3087, 'Sushi Express', 'Sushi Express serves Japanese sushi and seafood in Clifton Seaside, Karachi.', 4087, 19000, 1007, NULL, 'sushiexpress@example.com', '0213901237', 'https://www.sushiexpress.com', 4.6, 340, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3088, 'Veggie Bowl', 'Veggie Bowl offers vegetarian and vegan meals in North Nazimabad, Karachi.', 4088, 7000, 1008, NULL, 'veggiebowl@example.com', '0213012348', 'https://www.veggiebowl.com', 4.3, 380, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3089, 'Dessert Factory', 'Dessert Factory serves desserts, cakes, and pastries in Gulshan Block 13, Karachi.', 4089, 6000, 1009, NULL, 'dessertfactory@example.com', '0213123459', 'https://www.dessertfactory.com', 4.4, 355, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3090, 'Spice Junction', 'Spice Junction offers Pakistani and Indian fusion cuisine in Clifton Block 7, Karachi.', 4090, 15000, 1010, NULL, 'spicejunction@example.com', '0213234570', 'https://www.spicejunction.com', 4.5, 400, 1, '2025-10-26 19:13:00', '2025-10-26 19:13:00'),
(3091, 'Cafe Aroma', 'Cafe Aroma offers delicious local cuisine in Clifton, Karachi.', 4091, 8500, 1011, NULL, 'cafearoma@example.com', '0213012345', 'https://www.cafearoma.com', 4.3, 410, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3092, 'Spice Hub', 'Spice Hub offers delicious authentic cuisine in DHA, Karachi.', 4092, 12000, 1012, NULL, 'spicehub@example.com', '0213023456', 'https://www.spicehub.com', 4.0, 380, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3093, 'Grill & Chill', 'Grill & Chill offers delicious BBQ cuisine in Gulshan-e-Iqbal, Karachi.', 4093, 10500, 1013, NULL, 'grillchill@example.com', '0213034567', 'https://www.grillchill.com', 3.9, 220, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3094, 'Pasta Fiesta', 'Pasta Fiesta offers delicious Italian cuisine in North Nazimabad, Karachi.', 4094, 16000, 1014, NULL, 'pastafiesta@example.com', '0213045678', 'https://www.pastafiesta.com', 4.5, 295, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3095, 'Burger Town', 'Burger Town offers delicious fast food in Bahadurabad, Karachi.', 4095, 7500, 1015, NULL, 'burgertown@example.com', '0213056789', 'https://www.burgertown.com', 4.1, 410, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3096, 'Sushi Express', 'Sushi Express offers delicious international cuisine in PECHS, Karachi.', 4096, 18000, 1016, NULL, 'sushiexpress@example.com', '0213067890', 'https://www.sushiexpress.com', 4.6, 155, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3097, 'Tandoori Nights', 'Tandoori Nights offers delicious Pakistani cuisine in Karachi Cantt, Karachi.', 4097, 9500, 1017, NULL, 'tandoorinights@example.com', '0213078901', 'https://www.tandoorinights.com', 4.2, 375, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3098, 'Cafe Delight', 'Cafe Delight offers delicious desserts in Korangi, Karachi.', 4098, 6000, 1018, NULL, 'cafedelight@example.com', '0213089012', 'https://www.cafedelight.com', 4.0, 290, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3099, 'Royal Bites', 'Royal Bites offers delicious fusion cuisine in Nazimabad, Karachi.', 4099, 14000, 1019, NULL, 'royalbites@example.com', '0213090123', 'https://www.royalbites.com', 4.4, 330, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51'),
(3100, 'The Sweet Spot', 'The Sweet Spot offers delicious desserts in Malir, Karachi.', 4100, 7200, 1020, NULL, 'thesweetspot@example.com', '0213101234', 'https://www.thesweetspot.com', 4.5, 260, 1, '2025-10-26 19:09:51', '2025-10-26 19:09:51');

-- Table structure for table `restaurantcuisine`
DROP TABLE IF EXISTS `restaurantcuisine`;
CREATE TABLE `restaurantcuisine` (
  `RestaurantID` int(11) NOT NULL,
  `CuisineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `restaurantcuisine` (`RestaurantID`, `CuisineID`) VALUES
(3001, 1),(3001, 5),(3001, 7),
(3002, 1),(3002, 5),(3002, 8),
(3003, 10),(3003, 11),
(3004, 4),(3004, 10),
(3005, 2),(3005, 3),(3005, 5),
(3006, 1),(3006, 5),(3006, 8),
(3007, 10),(3007, 12),
(3008, 2),(3008, 3),
(3009, 6),(3009, 7),
(3010, 4),(3010, 13),
(3011, 9),(3011, 14),
(3012, 9),(3012, 10),
(3013, 3),(3013, 5),
(3014, 5),(3014, 6),
(3015, 8),(3015, 15),
(3016, 3),(3016, 16),
(3017, 7),(3017, 17),
(3018, 2),(3018, 6),(3018, 7),
(3019, 5),(3019, 11),
(3020, 2),(3020, 6),(3020, 8),
(3021, 5),(3021, 6),(3021, 7),
(3022, 4),(3022, 12),
(3023, 1),(3023, 9),
(3024, 4),(3024, 10),
(3025, 2),(3025, 5),(3025, 8),
(3026, 2),(3026, 3),(3026, 7),
(3027, 1),(3027, 11),
(3028, 2),(3028, 8),
(3029, 4),(3029, 13),
(3030, 3),(3030, 7),(3030, 8),
(3031, 7),(3031, 9),
(3032, 2),(3032, 3),(3032, 7),
(3033, 7),(3033, 10),
(3034, 1),(3034, 6),
(3035, 8),(3035, 14),
(3036, 4),(3036, 6),
(3037, 6),(3037, 15),
(3038, 1),(3038, 6),(3038, 7),
(3039, 2),(3039, 4),
(3040, 2),(3040, 4),
(3041, 1),(3041, 9),(3041, 16),
(3042, 3),(3042, 4),
(3043, 2),(3043, 4),(3043, 10),
(3044, 4),(3044, 6),(3044, 10),
(3045, 10),(3045, 17),
(3046, 5),
(3047, 3),
(3048, 2),(3048, 3),(3048, 5),
(3049, 1),(3049, 3),(3049, 10),
(3050, 4),(3050, 6),
(3051, 1),(3051, 11),
(3052, 2),(3052, 12),(3052, 5),
(3053, 3),(3053, 13),
(3054, 4),(3054, 14),
(3055, 5),(3055, 15),
(3056, 6),(3056, 16),(3056, 2),
(3057, 7),(3057, 17),
(3058, 8),(3058, 18),(3058, 3),
(3059, 9),(3059, 11),
(3060, 10),(3060, 12),
(3061, 1),(3061, 13),
(3062, 2),(3062, 14),
(3063, 3),(3063, 15),(3063, 7),
(3064, 4),(3064, 16),
(3065, 5),(3065, 17),
(3066, 6),(3066, 18),
(3067, 1),(3067, 2),(3067, 11),
(3068, 3),(3068, 12),
(3069, 4),(3069, 13),(3069, 8),
(3070, 5),(3070, 14),
(3071, 6),(3071, 15),(3071, 7),
(3072, 7),(3072, 16),
(3073, 8),(3073, 17),
(3074, 9),(3074, 18),
(3075, 10),(3075, 11),(3075, 1),
(3076, 2),(3076, 12),
(3077, 3),(3077, 13),
(3078, 4),(3078, 14),
(3079, 5),(3079, 15),
(3080, 6),(3080, 16),
(3081, 1),(3081, 17),
(3082, 2),(3082, 18),
(3083, 3),(3083, 11),(3083, 4),
(3084, 4),(3084, 12),
(3085, 5),(3085, 13),
(3086, 6),(3086, 14),
(3087, 7),(3087, 15),
(3088, 8),(3088, 16),
(3089, 9),(3089, 17),
(3090, 10),(3090, 18),
(3091, 1),(3091, 11),
(3092, 2),(3092, 12),
(3093, 3),(3093, 13),
(3094, 4),(3094, 14),
(3095, 5),(3095, 15),
(3096, 6),(3096, 16),
(3097, 1),(3097, 17),
(3098, 2),(3098, 18),
(3099, 3),(3099, 11),
(3100, 4),(3100, 12),(3100, 5);

-- Table structure for table `restaurantopeninghours`
DROP TABLE IF EXISTS `restaurantopeninghours`;
CREATE TABLE `restaurantopeninghours` (
  `OpeningID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `DayOfWeek` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') NOT NULL,
  `OpenTime` time DEFAULT NULL,
  `CloseTime` time DEFAULT NULL,
  `IsClosed` tinyint(1) DEFAULT 0,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(1, 3001, 'Mon', '11:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(2, 3001, 'Tue', '11:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(3, 3001, 'Wed', '11:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(4, 3001, 'Thu', '11:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(5, 3001, 'Fri', '11:00:00', '23:59:00', 0, 'Special Friday hours'),
(6, 3001, 'Sat', '11:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(7, 3001, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(8, 3002, 'Mon', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(9, 3002, 'Tue', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(10, 3002, 'Wed', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(11, 3002, 'Thu', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(12, 3002, 'Fri', '10:00:00', '23:00:00', 0, 'Extended Friday hours'),
(13, 3002, 'Sat', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(14, 3002, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(15, 3003, 'Mon', '12:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(16, 3003, 'Tue', '12:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(17, 3003, 'Wed', '12:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(18, 3003, 'Thu', '12:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(19, 3003, 'Fri', '12:00:00', '23:00:00', 0, 'Extended Friday hours'),
(20, 3003, 'Sat', '12:00:00', '22:00:00', 0, 'Lunch & Dinner');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(21, 3004, 'Mon', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(22, 3004, 'Tue', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(23, 3004, 'Wed', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(24, 3004, 'Thu', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(25, 3004, 'Fri', '11:30:00', '23:30:00', 0, 'Extended Friday hours'),
(26, 3004, 'Sat', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(27, 3004, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(28, 3005, 'Mon', '10:00:00', '21:00:00', 0, 'Breakfast & Dinner'),
(29, 3005, 'Tue', '10:00:00', '21:00:00', 0, 'Breakfast & Dinner'),
(30, 3005, 'Wed', '10:00:00', '21:00:00', 0, 'Breakfast & Dinner'),
(31, 3005, 'Thu', '10:00:00', '21:00:00', 0, 'Breakfast & Dinner'),
(32, 3005, 'Fri', '10:00:00', '22:00:00', 0, 'Extended Friday hours'),
(33, 3005, 'Sat', '10:00:00', '21:00:00', 0, 'Breakfast & Dinner'),
(34, 3005, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(35, 3006, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(36, 3006, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(37, 3006, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(38, 3006, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(39, 3006, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(40, 3006, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(41, 3007, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(42, 3007, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(43, 3007, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(44, 3007, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(45, 3007, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(46, 3007, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(47, 3007, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(48, 3008, 'Mon', '10:30:00', '21:30:00', 0, 'Lunch & Dinner'),
(49, 3008, 'Tue', '10:30:00', '21:30:00', 0, 'Lunch & Dinner'),
(50, 3008, 'Wed', '10:30:00', '21:30:00', 0, 'Lunch & Dinner'),
(51, 3008, 'Thu', '10:30:00', '21:30:00', 0, 'Lunch & Dinner'),
(52, 3008, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(53, 3008, 'Sat', '10:30:00', '21:30:00', 0, 'Lunch & Dinner'),
(54, 3008, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(55, 3009, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(56, 3009, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(57, 3009, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(58, 3009, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(59, 3009, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(60, 3009, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(61, 3010, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(62, 3010, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(63, 3010, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(64, 3010, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(65, 3010, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(66, 3010, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(67, 3010, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(68, 3011, 'Mon', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(69, 3011, 'Tue', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(70, 3011, 'Wed', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(71, 3011, 'Thu', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(72, 3011, 'Fri', '10:00:00', '22:30:00', 0, 'Extended Friday hours'),
(73, 3011, 'Sat', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(74, 3011, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(75, 3012, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(76, 3012, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(77, 3012, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(78, 3012, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(79, 3012, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(80, 3012, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(81, 3013, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(82, 3013, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(83, 3013, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(84, 3013, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(85, 3013, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(86, 3013, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(87, 3013, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(88, 3014, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(89, 3014, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(90, 3014, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(91, 3014, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(92, 3014, 'Fri', '12:00:00', '23:30:00', 0, 'Extended Friday hours'),
(93, 3014, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(94, 3014, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(95, 3015, 'Mon', '10:30:00', '21:00:00', 0, 'Breakfast & Dinner'),
(96, 3015, 'Tue', '10:30:00', '21:00:00', 0, 'Breakfast & Dinner'),
(97, 3015, 'Wed', '10:30:00', '21:00:00', 0, 'Breakfast & Dinner'),
(98, 3015, 'Thu', '10:30:00', '21:00:00', 0, 'Breakfast & Dinner'),
(99, 3015, 'Fri', '10:30:00', '22:00:00', 0, 'Extended Friday hours'),
(100, 3015, 'Sat', '10:30:00', '21:00:00', 0, 'Breakfast & Dinner'),
(101, 3015, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(102, 3016, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(103, 3016, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(104, 3016, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(105, 3016, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(106, 3016, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(107, 3016, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(108, 3016, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(109, 3017, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(110, 3017, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(111, 3017, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(112, 3017, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(113, 3017, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(114, 3017, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(115, 3017, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(116, 3018, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(117, 3018, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(118, 3018, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(119, 3018, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(120, 3018, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(121, 3018, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(122, 3018, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(123, 3019, 'Mon', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(124, 3019, 'Tue', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(125, 3019, 'Wed', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(126, 3019, 'Thu', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(127, 3019, 'Fri', '10:00:00', '23:00:00', 0, 'Extended Friday hours'),
(128, 3019, 'Sat', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(129, 3019, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(130, 3020, 'Mon', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(131, 3020, 'Tue', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(132, 3020, 'Wed', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(133, 3020, 'Thu', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(134, 3020, 'Fri', '11:30:00', '23:30:00', 0, 'Extended Friday hours'),
(135, 3020, 'Sat', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(136, 3020, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(137, 3021, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(138, 3021, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(139, 3021, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(140, 3021, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(141, 3021, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(142, 3021, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(143, 3021, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(144, 3022, 'Mon', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(145, 3022, 'Tue', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(146, 3022, 'Wed', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(147, 3022, 'Thu', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(148, 3022, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(149, 3022, 'Sat', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(150, 3022, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(151, 3023, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(152, 3023, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(153, 3023, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(154, 3023, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(155, 3023, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(156, 3023, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(157, 3023, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(158, 3024, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(159, 3024, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(160, 3024, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(161, 3024, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(162, 3024, 'Fri', '12:00:00', '23:30:00', 0, 'Extended Friday hours'),
(163, 3024, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(164, 3024, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(165, 3025, 'Mon', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(166, 3025, 'Tue', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(167, 3025, 'Wed', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(168, 3025, 'Thu', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(169, 3025, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(170, 3025, 'Sat', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(171, 3025, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(172, 3026, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(173, 3026, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(174, 3026, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(175, 3026, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(176, 3026, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(177, 3026, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(178, 3026, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(179, 3027, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(180, 3027, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(181, 3027, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(182, 3027, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(183, 3027, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(184, 3027, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(185, 3027, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(186, 3028, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(187, 3028, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(188, 3028, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(189, 3028, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(190, 3028, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(191, 3028, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(192, 3028, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(193, 3029, 'Mon', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(194, 3029, 'Tue', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(195, 3029, 'Wed', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(196, 3029, 'Thu', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(197, 3029, 'Fri', '10:00:00', '23:00:00', 0, 'Extended Friday hours'),
(198, 3029, 'Sat', '10:00:00', '22:00:00', 0, 'Breakfast & Dinner'),
(199, 3029, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(200, 3030, 'Mon', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(201, 3030, 'Tue', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(202, 3030, 'Wed', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(203, 3030, 'Thu', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(204, 3030, 'Fri', '11:30:00', '23:30:00', 0, 'Extended Friday hours'),
(205, 3030, 'Sat', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(206, 3030, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(207, 3031, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(208, 3031, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(209, 3031, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(210, 3031, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(211, 3031, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(212, 3031, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(213, 3031, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(214, 3032, 'Mon', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(215, 3032, 'Tue', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(216, 3032, 'Wed', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(217, 3032, 'Thu', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(218, 3032, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(219, 3032, 'Sat', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(220, 3032, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(221, 3033, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(222, 3033, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(223, 3033, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(224, 3033, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(225, 3033, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(226, 3033, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(227, 3033, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(228, 3034, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(229, 3034, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(230, 3034, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(231, 3034, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(232, 3034, 'Fri', '12:00:00', '23:30:00', 0, 'Extended Friday hours'),
(233, 3034, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(234, 3034, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(235, 3035, 'Mon', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(236, 3035, 'Tue', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(237, 3035, 'Wed', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(238, 3035, 'Thu', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(239, 3035, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(240, 3035, 'Sat', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(241, 3035, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(242, 3036, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(243, 3036, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(244, 3036, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(245, 3036, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(246, 3036, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(247, 3036, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(248, 3036, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(249, 3037, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(250, 3037, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(251, 3037, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(252, 3037, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(253, 3037, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(254, 3037, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(255, 3037, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(256, 3038, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(257, 3038, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(258, 3038, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(259, 3038, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(260, 3038, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(261, 3038, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(262, 3038, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(263, 3039, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(264, 3039, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(265, 3039, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(266, 3039, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(267, 3039, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(268, 3039, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(269, 3039, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(270, 3040, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(271, 3040, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(272, 3040, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(273, 3040, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(274, 3040, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(275, 3040, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(276, 3040, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(277, 3041, 'Mon', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(278, 3041, 'Tue', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(279, 3041, 'Wed', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(280, 3041, 'Thu', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(281, 3041, 'Fri', '10:00:00', '22:30:00', 0, 'Extended Friday hours'),
(282, 3041, 'Sat', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(283, 3041, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(284, 3042, 'Mon', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(285, 3042, 'Tue', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(286, 3042, 'Wed', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(287, 3042, 'Thu', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(288, 3042, 'Fri', '11:30:00', '23:30:00', 0, 'Extended Friday hours'),
(289, 3042, 'Sat', '11:30:00', '22:30:00', 0, 'Lunch & Dinner'),
(290, 3042, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(291, 3043, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(292, 3043, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(293, 3043, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(294, 3043, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(295, 3043, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(296, 3043, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(297, 3043, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(298, 3044, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(299, 3044, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(300, 3044, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(301, 3044, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(302, 3044, 'Fri', '12:00:00', '23:30:00', 0, 'Extended Friday hours'),
(303, 3044, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(304, 3044, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(305, 3045, 'Mon', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(306, 3045, 'Tue', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(307, 3045, 'Wed', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(308, 3045, 'Thu', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(309, 3045, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(310, 3045, 'Sat', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(311, 3045, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(312, 3046, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(313, 3046, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(314, 3046, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(315, 3046, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(316, 3046, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(317, 3046, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(318, 3046, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(319, 3047, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(320, 3047, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(321, 3047, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(322, 3047, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(323, 3047, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(324, 3047, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(325, 3047, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(326, 3048, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(327, 3048, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(328, 3048, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(329, 3048, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(330, 3048, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(331, 3048, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(332, 3048, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(333, 3049, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(334, 3049, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(335, 3049, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(336, 3049, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(337, 3049, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(338, 3049, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(339, 3049, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(340, 3050, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(341, 3050, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(342, 3050, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(343, 3050, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(344, 3050, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(345, 3050, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(346, 3050, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(347, 3051, 'Mon', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(348, 3051, 'Tue', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(349, 3051, 'Wed', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(350, 3051, 'Thu', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(351, 3051, 'Fri', '10:00:00', '22:30:00', 0, 'Extended Friday hours'),
(352, 3051, 'Sat', '10:00:00', '21:30:00', 0, 'Breakfast & Dinner'),
(353, 3051, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(354, 3052, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(355, 3052, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(356, 3052, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(357, 3052, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(358, 3052, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(359, 3052, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(360, 3052, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(361, 3053, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(362, 3053, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(363, 3053, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(364, 3053, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(365, 3053, 'Fri', '12:00:00', '23:30:00', 0, 'Extended Friday hours'),
(366, 3053, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(367, 3053, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(368, 3054, 'Mon', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(369, 3054, 'Tue', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(370, 3054, 'Wed', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(371, 3054, 'Thu', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(372, 3054, 'Fri', '10:30:00', '22:30:00', 0, 'Extended Friday hours'),
(373, 3054, 'Sat', '10:30:00', '21:30:00', 0, 'Breakfast & Dinner'),
(374, 3054, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(375, 3055, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(376, 3055, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(377, 3055, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(378, 3055, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(379, 3055, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(380, 3055, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(381, 3055, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(382, 3056, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(383, 3056, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(384, 3056, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(385, 3056, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(386, 3056, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(387, 3056, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(388, 3056, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(389, 3057, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(390, 3057, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(391, 3057, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(392, 3057, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(393, 3057, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(394, 3057, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(395, 3057, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(396, 3058, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(397, 3058, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(398, 3058, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(399, 3058, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(400, 3058, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(401, 3058, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(402, 3058, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(403, 3059, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(404, 3059, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(405, 3059, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(406, 3059, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(407, 3059, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(408, 3059, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(409, 3059, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(410, 3060, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(411, 3060, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(412, 3060, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(413, 3060, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(414, 3060, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(415, 3060, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(416, 3060, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(417, 3061, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(418, 3061, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(419, 3061, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(420, 3061, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(421, 3061, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(422, 3061, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(423, 3061, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(424, 3062, 'Mon', '10:30:00', '22:30:00', 0, 'Breakfast & Dinner'),
(425, 3062, 'Tue', '10:30:00', '22:30:00', 0, 'Breakfast & Dinner'),
(426, 3062, 'Wed', '10:30:00', '22:30:00', 0, 'Breakfast & Dinner'),
(427, 3062, 'Thu', '10:30:00', '22:30:00', 0, 'Breakfast & Dinner'),
(428, 3062, 'Fri', '10:30:00', '23:30:00', 0, 'Extended Friday hours'),
(429, 3062, 'Sat', '10:30:00', '22:30:00', 0, 'Breakfast & Dinner'),
(430, 3062, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(431, 3063, 'Mon', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(432, 3063, 'Tue', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(433, 3063, 'Wed', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(434, 3063, 'Thu', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(435, 3063, 'Fri', '11:00:00', '23:00:00', 0, 'Extended Friday hours'),
(436, 3063, 'Sat', '11:00:00', '22:00:00', 0, 'Lunch & Dinner'),
(437, 3063, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(438, 3064, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(439, 3064, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(440, 3064, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(441, 3064, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(442, 3064, 'Fri', '12:00:00', '23:30:00', 0, 'Extended Friday hours'),
(443, 3064, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(444, 3064, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(445, 3065, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(446, 3065, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(447, 3065, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(448, 3065, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(449, 3065, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(450, 3065, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(451, 3065, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(452, 3066, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(453, 3066, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(454, 3066, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(455, 3066, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(456, 3066, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(457, 3066, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(458, 3066, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(459, 3067, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(460, 3067, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(461, 3067, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(462, 3067, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(463, 3067, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(464, 3067, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(465, 3067, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(466, 3068, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(467, 3068, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(468, 3068, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(469, 3068, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(470, 3068, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(471, 3068, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(472, 3068, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(473, 3069, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(474, 3069, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(475, 3069, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(476, 3069, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(477, 3069, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(478, 3069, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(479, 3069, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(480, 3070, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(481, 3070, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(482, 3070, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(483, 3070, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(484, 3070, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(485, 3070, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(486, 3070, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(487, 3071, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(488, 3071, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(489, 3071, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(490, 3071, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(491, 3071, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(492, 3071, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(493, 3071, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(494, 3072, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(495, 3072, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(496, 3072, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(497, 3072, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(498, 3072, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(499, 3072, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(500, 3072, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(501, 3073, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(502, 3073, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(503, 3073, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(504, 3073, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(505, 3073, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(506, 3073, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(507, 3073, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(508, 3074, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(509, 3074, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(510, 3074, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(511, 3074, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(512, 3074, 'Fri', '12:00:00', '23:30:00', 0, 'Special Friday hours'),
(513, 3074, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(514, 3074, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(515, 3075, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(516, 3075, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(517, 3075, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(518, 3075, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(519, 3075, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(520, 3075, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(521, 3075, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(522, 3076, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(523, 3076, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(524, 3076, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(525, 3076, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(526, 3076, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(527, 3076, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(528, 3076, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(529, 3077, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(530, 3077, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(531, 3077, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(532, 3077, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(533, 3077, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(534, 3077, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(535, 3077, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(536, 3078, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(537, 3078, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(538, 3078, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(539, 3078, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(540, 3078, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(541, 3078, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(542, 3078, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(543, 3079, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(544, 3079, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(545, 3079, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(546, 3079, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(547, 3079, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(548, 3079, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(549, 3079, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(550, 3080, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(551, 3080, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(552, 3080, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(553, 3080, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(554, 3080, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(555, 3080, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(556, 3080, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(557, 3081, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(558, 3081, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(559, 3081, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(560, 3081, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(561, 3081, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(562, 3081, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(563, 3081, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(564, 3082, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(565, 3082, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(566, 3082, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(567, 3082, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(568, 3082, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(569, 3082, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(570, 3082, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(571, 3083, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(572, 3083, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(573, 3083, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(574, 3083, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(575, 3083, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(576, 3083, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(577, 3083, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(578, 3084, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(579, 3084, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(580, 3084, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(581, 3084, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(582, 3084, 'Fri', '12:00:00', '23:30:00', 0, 'Special Friday hours'),
(583, 3084, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(584, 3084, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(585, 3085, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(586, 3085, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(587, 3085, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(588, 3085, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(589, 3085, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(590, 3085, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(591, 3085, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(592, 3086, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(593, 3086, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(594, 3086, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(595, 3086, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(596, 3086, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(597, 3086, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(598, 3086, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(599, 3087, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(600, 3087, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(601, 3087, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(602, 3087, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(603, 3087, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(604, 3087, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(605, 3087, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(606, 3088, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(607, 3088, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(608, 3088, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(609, 3088, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(610, 3088, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(611, 3088, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(612, 3088, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(613, 3089, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(614, 3089, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(615, 3089, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(616, 3089, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(617, 3089, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(618, 3089, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(619, 3089, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(620, 3090, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(621, 3090, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(622, 3090, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(623, 3090, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(624, 3090, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(625, 3090, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(626, 3090, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(627, 3091, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(628, 3091, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(629, 3091, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(630, 3091, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(631, 3091, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(632, 3091, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(633, 3091, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');
INSERT INTO `restaurantopeninghours` (`OpeningID`, `RestaurantID`, `DayOfWeek`, `OpenTime`, `CloseTime`, `IsClosed`, `Notes`) VALUES
(634, 3092, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(635, 3092, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(636, 3092, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(637, 3092, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(638, 3092, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(639, 3092, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(640, 3092, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(641, 3093, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(642, 3093, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(643, 3093, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(644, 3093, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(645, 3093, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(646, 3093, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(647, 3093, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(648, 3094, 'Mon', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(649, 3094, 'Tue', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(650, 3094, 'Wed', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(651, 3094, 'Thu', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(652, 3094, 'Fri', '12:00:00', '23:30:00', 0, 'Special Friday hours'),
(653, 3094, 'Sat', '12:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(654, 3094, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(655, 3095, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(656, 3095, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(657, 3095, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(658, 3095, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(659, 3095, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(660, 3095, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(661, 3095, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(662, 3096, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(663, 3096, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(664, 3096, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(665, 3096, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(666, 3096, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(667, 3096, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(668, 3096, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(669, 3097, 'Mon', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(670, 3097, 'Tue', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(671, 3097, 'Wed', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(672, 3097, 'Thu', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(673, 3097, 'Fri', '11:00:00', '23:30:00', 0, 'Extended Friday hours'),
(674, 3097, 'Sat', '11:00:00', '22:30:00', 0, 'Lunch & Dinner'),
(675, 3097, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(676, 3098, 'Mon', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(677, 3098, 'Tue', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(678, 3098, 'Wed', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(679, 3098, 'Thu', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(680, 3098, 'Fri', '12:00:00', '23:59:00', 0, 'Special Friday hours'),
(681, 3098, 'Sat', '12:00:00', '23:00:00', 0, 'Lunch & Dinner'),
(682, 3098, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(683, 3099, 'Mon', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(684, 3099, 'Tue', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(685, 3099, 'Wed', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(686, 3099, 'Thu', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(687, 3099, 'Fri', '11:00:00', '22:30:00', 0, 'Extended Friday hours'),
(688, 3099, 'Sat', '11:00:00', '21:30:00', 0, 'Lunch & Dinner'),
(689, 3099, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday'),

(690, 3100, 'Mon', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(691, 3100, 'Tue', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(692, 3100, 'Wed', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(693, 3100, 'Thu', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(694, 3100, 'Fri', '10:30:00', '23:00:00', 0, 'Extended Friday hours'),
(695, 3100, 'Sat', '10:30:00', '22:00:00', 0, 'Breakfast & Dinner'),
(696, 3100, 'Sun', 'Closed', NULL, 1, 'Closed on Sunday');

-- Table structure for table `restauranttable`

DROP TABLE IF EXISTS `restauranttable`;
CREATE TABLE `restauranttable` (
  `TableID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `TableNumber` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `restauranttable` (`TableID`, `RestaurantID`, `TableNumber`, `Capacity`, `IsAvailable`) VALUES
(7001, 3001, 1, 4, 1),
(7002, 3001, 2, 6, 1),
(7003, 3001, 3, 2, 1),
(7004, 3001, 4, 4, 1),
(7005, 3002, 1, 8, 1),
(7006, 3002, 2, 2, 1),
(7007, 3002, 3, 2, 1),
(7008, 3002, 4, 8, 1),
(7009, 3002, 5, 8, 1),
(7010, 3002, 6, 6, 1),
(7011, 3002, 7, 2, 1),
(7012, 3002, 8, 8, 1),
(7013, 3002, 9, 4, 1),
(7014, 3003, 1, 2, 1),
(7015, 3003, 2, 6, 1),
(7016, 3003, 3, 8, 1),
(7017, 3003, 4, 2, 1),
(7018, 3003, 5, 2, 1),
(7019, 3003, 6, 8, 1),
(7020, 3003, 7, 8, 1),
(7021, 3003, 8, 8, 1),
(7022, 3004, 1, 2, 1),
(7023, 3004, 2, 8, 1),
(7024, 3004, 3, 8, 1),
(7025, 3004, 4, 2, 1),
(7026, 3004, 5, 2, 1),
(7027, 3004, 6, 6, 1),
(7028, 3004, 7, 4, 1),
(7029, 3004, 8, 2, 1),
(7030, 3004, 9, 4, 1),
(7031, 3005, 1, 6, 1),
(7032, 3005, 2, 8, 1),
(7033, 3005, 3, 6, 1),
(7034, 3005, 4, 8, 1),
(7035, 3005, 5, 8, 1),
(7036, 3005, 6, 2, 1),
(7037, 3006, 1, 2, 1),
(7038, 3006, 2, 4, 1),
(7039, 3006, 3, 8, 1),
(7040, 3006, 4, 8, 1),
(7041, 3006, 5, 4, 1),
(7042, 3006, 6, 8, 1),
(7043, 3006, 7, 6, 1),
(7044, 3006, 8, 8, 1),
(7045, 3006, 9, 8, 1),
(7046, 3006, 10, 8, 1),
(7047, 3007, 1, 2, 1),
(7048, 3007, 2, 6, 1),
(7049, 3007, 3, 8, 1),
(7050, 3007, 4, 6, 1),
(7051, 3007, 5, 6, 1),
(7052, 3007, 6, 6, 1),
(7053, 3007, 7, 4, 1),
(7054, 3007, 8, 8, 1),
(7055, 3007, 9, 2, 1),
(7056, 3008, 1, 2, 1),
(7057, 3008, 2, 2, 1),
(7058, 3008, 3, 8, 1),
(7059, 3008, 4, 2, 1),
(7060, 3009, 1, 6, 1),
(7061, 3009, 2, 4, 1),
(7062, 3009, 3, 2, 1),
(7063, 3009, 4, 6, 1),
(7064, 3009, 5, 2, 1),
(7065, 3009, 6, 8, 1),
(7066, 3009, 7, 6, 1),
(7067, 3009, 8, 8, 1),
(7068, 3009, 9, 2, 1),
(7069, 3010, 1, 6, 1),
(7070, 3010, 2, 6, 1),
(7071, 3010, 3, 2, 1),
(7072, 3010, 4, 4, 1),
(7073, 3010, 5, 4, 1),
(7074, 3010, 6, 8, 1),
(7075, 3011, 1, 2, 1),
(7076, 3011, 2, 6, 1),
(7077, 3011, 3, 6, 1),
(7078, 3011, 4, 2, 1),
(7079, 3011, 5, 6, 1),
(7080, 3012, 1, 4, 1),
(7081, 3012, 2, 8, 1),
(7082, 3012, 3, 2, 1),
(7083, 3012, 4, 6, 1),
(7084, 3012, 5, 2, 1),
(7085, 3012, 6, 4, 1),
(7086, 3012, 7, 6, 1),
(7087, 3012, 8, 6, 1),
(7088, 3013, 1, 6, 1),
(7089, 3013, 2, 2, 1),
(7090, 3013, 3, 4, 1),
(7091, 3013, 4, 4, 1),
(7092, 3013, 5, 8, 1),
(7093, 3013, 6, 2, 1),
(7094, 3014, 1, 2, 1),
(7095, 3014, 2, 2, 1),
(7096, 3014, 3, 4, 1),
(7097, 3014, 4, 8, 1),
(7098, 3014, 5, 8, 1),
(7099, 3015, 1, 6, 1),
(7100, 3015, 2, 4, 1),
(7101, 3015, 3, 6, 1),
(7102, 3015, 4, 6, 1),
(7103, 3015, 5, 6, 1),
(7104, 3015, 6, 2, 1),
(7105, 3015, 7, 2, 1),
(7106, 3016, 1, 4, 1),
(7107, 3016, 2, 2, 1),
(7108, 3016, 3, 2, 1),
(7109, 3016, 4, 6, 1),
(7110, 3016, 5, 8, 1),
(7111, 3017, 1, 8, 1),
(7112, 3017, 2, 8, 1),
(7113, 3017, 3, 8, 1),
(7114, 3017, 4, 8, 1),
(7115, 3017, 5, 6, 1),
(7116, 3017, 6, 4, 1),
(7117, 3017, 7, 2, 1),
(7118, 3017, 8, 6, 1),
(7119, 3017, 9, 8, 1),
(7120, 3018, 1, 6, 1),
(7121, 3018, 2, 8, 1),
(7122, 3018, 3, 6, 1),
(7123, 3018, 4, 2, 1),
(7124, 3019, 1, 8, 1),
(7125, 3019, 2, 2, 1),
(7126, 3019, 3, 2, 1),
(7127, 3019, 4, 4, 1),
(7128, 3019, 5, 6, 1),
(7129, 3020, 1, 4, 1),
(7130, 3020, 2, 6, 1),
(7131, 3020, 3, 6, 1),
(7132, 3020, 4, 6, 1),
(7133, 3020, 5, 2, 1),
(7134, 3021, 1, 8, 1),
(7135, 3021, 2, 8, 1),
(7136, 3021, 3, 4, 1),
(7137, 3021, 4, 4, 1),
(7138, 3022, 1, 4, 1),
(7139, 3022, 2, 6, 1),
(7140, 3022, 3, 2, 1),
(7141, 3022, 4, 8, 1),
(7142, 3022, 5, 2, 1),
(7143, 3022, 6, 8, 1),
(7144, 3022, 7, 2, 1),
(7145, 3023, 1, 2, 1),
(7146, 3023, 2, 6, 1),
(7147, 3023, 3, 8, 1),
(7148, 3023, 4, 8, 1),
(7149, 3023, 5, 8, 1),
(7150, 3023, 6, 6, 1),
(7151, 3023, 7, 2, 1),
(7152, 3024, 1, 2, 1),
(7153, 3024, 2, 6, 1),
(7154, 3024, 3, 4, 1),
(7155, 3024, 4, 8, 1),
(7156, 3024, 5, 6, 1),
(7157, 3024, 6, 2, 1),
(7158, 3024, 7, 8, 1),
(7159, 3025, 1, 2, 1),
(7160, 3025, 2, 4, 1),
(7161, 3025, 3, 8, 1),
(7162, 3025, 4, 8, 1),
(7163, 3025, 5, 2, 1),
(7164, 3025, 6, 8, 1),
(7165, 3025, 7, 6, 1),
(7166, 3025, 8, 6, 1),
(7167, 3025, 9, 4, 1),
(7168, 3025, 10, 6, 1),
(7169, 3026, 1, 4, 1),
(7170, 3026, 2, 2, 1),
(7171, 3026, 3, 2, 1),
(7172, 3026, 4, 4, 1),
(7173, 3026, 5, 6, 1),
(7174, 3026, 6, 6, 1),
(7175, 3026, 7, 4, 1),
(7176, 3026, 8, 4, 1),
(7177, 3026, 9, 2, 1),
(7178, 3026, 10, 4, 1),
(7179, 3027, 1, 4, 1),
(7180, 3027, 2, 4, 1),
(7181, 3027, 3, 4, 1),
(7182, 3027, 4, 2, 1),
(7183, 3027, 5, 4, 1),
(7184, 3027, 6, 8, 1),
(7185, 3028, 1, 8, 1),
(7186, 3028, 2, 6, 1),
(7187, 3028, 3, 6, 1),
(7188, 3028, 4, 4, 1),
(7189, 3028, 5, 8, 1),
(7190, 3028, 6, 2, 1),
(7191, 3028, 7, 8, 1),
(7192, 3029, 1, 6, 1),
(7193, 3029, 2, 6, 1),
(7194, 3029, 3, 2, 1),
(7195, 3029, 4, 6, 1),
(7196, 3029, 5, 2, 1),
(7197, 3029, 6, 6, 1),
(7198, 3029, 7, 8, 1),
(7199, 3030, 1, 2, 1),
(7200, 3030, 2, 2, 1),
(7201, 3030, 3, 6, 1),
(7202, 3030, 4, 6, 1),
(7203, 3030, 5, 2, 1),
(7204, 3030, 6, 2, 1),
(7205, 3030, 7, 8, 1),
(7206, 3031, 1, 2, 1),
(7207, 3031, 2, 8, 1),
(7208, 3031, 3, 4, 1),
(7209, 3031, 4, 6, 1),
(7210, 3031, 5, 8, 1),
(7211, 3031, 6, 4, 1),
(7212, 3031, 7, 2, 1),
(7213, 3032, 1, 2, 1),
(7214, 3032, 2, 6, 1),
(7215, 3032, 3, 2, 1),
(7216, 3032, 4, 4, 1),
(7217, 3032, 5, 2, 1),
(7218, 3032, 6, 4, 1),
(7219, 3032, 7, 8, 1),
(7220, 3033, 1, 4, 1),
(7221, 3033, 2, 6, 1),
(7222, 3033, 3, 6, 1),
(7223, 3033, 4, 6, 1),
(7224, 3033, 5, 8, 1),
(7225, 3033, 6, 8, 1),
(7226, 3033, 7, 6, 1),
(7227, 3034, 1, 2, 1),
(7228, 3034, 2, 6, 1),
(7229, 3034, 3, 2, 1),
(7230, 3034, 4, 6, 1),
(7231, 3034, 5, 2, 1),
(7232, 3034, 6, 8, 1),
(7233, 3034, 7, 6, 1),
(7234, 3034, 8, 6, 1),
(7235, 3034, 9, 4, 1),
(7236, 3035, 1, 2, 1),
(7237, 3035, 2, 4, 1),
(7238, 3035, 3, 6, 1),
(7239, 3035, 4, 6, 1),
(7240, 3035, 5, 8, 1),
(7241, 3035, 6, 4, 1),
(7242, 3036, 1, 2, 1),
(7243, 3036, 2, 6, 1),
(7244, 3036, 3, 8, 1),
(7245, 3036, 4, 6, 1),
(7246, 3036, 5, 4, 1),
(7247, 3036, 6, 2, 1),
(7248, 3036, 7, 8, 1),
(7249, 3036, 8, 6, 1),
(7250, 3037, 1, 6, 1),
(7251, 3037, 2, 6, 1),
(7252, 3037, 3, 4, 1),
(7253, 3037, 4, 4, 1),
(7254, 3038, 1, 8, 1),
(7255, 3038, 2, 4, 1),
(7256, 3038, 3, 4, 1),
(7257, 3038, 4, 4, 1),
(7258, 3038, 5, 4, 1),
(7259, 3038, 6, 2, 1),
(7260, 3039, 1, 2, 1),
(7261, 3039, 2, 2, 1),
(7262, 3039, 3, 6, 1),
(7263, 3039, 4, 4, 1),
(7264, 3039, 5, 8, 1),
(7265, 3039, 6, 4, 1),
(7266, 3040, 1, 4, 1),
(7267, 3040, 2, 4, 1),
(7268, 3040, 3, 8, 1),
(7269, 3040, 4, 2, 1),
(7270, 3040, 5, 8, 1),
(7271, 3041, 1, 4, 1),
(7272, 3041, 2, 8, 1),
(7273, 3041, 3, 6, 1),
(7274, 3041, 4, 8, 1),
(7275, 3041, 5, 4, 1),
(7276, 3041, 6, 4, 1),
(7277, 3042, 1, 8, 1),
(7278, 3042, 2, 4, 1),
(7279, 3042, 3, 6, 1),
(7280, 3042, 4, 8, 1),
(7281, 3042, 5, 8, 1),
(7282, 3042, 6, 6, 1),
(7283, 3043, 1, 8, 1),
(7284, 3043, 2, 8, 1),
(7285, 3043, 3, 4, 1),
(7286, 3043, 4, 4, 1),
(7287, 3043, 5, 4, 1),
(7288, 3043, 6, 6, 1),
(7289, 3043, 7, 2, 1),
(7290, 3043, 8, 8, 1),
(7291, 3043, 9, 6, 1),
(7292, 3043, 10, 2, 1),
(7293, 3044, 1, 2, 1),
(7294, 3044, 2, 6, 1),
(7295, 3044, 3, 2, 1),
(7296, 3044, 4, 4, 1),
(7297, 3044, 5, 6, 1),
(7298, 3044, 6, 8, 1),
(7299, 3044, 7, 4, 1),
(7300, 3044, 8, 8, 1),
(7301, 3044, 9, 2, 1),
(7302, 3045, 1, 8, 1),
(7303, 3045, 2, 6, 1),
(7304, 3045, 3, 2, 1),
(7305, 3045, 4, 8, 1),
(7306, 3045, 5, 2, 1),
(7307, 3046, 1, 6, 1),
(7308, 3046, 2, 4, 1),
(7309, 3046, 3, 8, 1),
(7310, 3046, 4, 2, 1),
(7311, 3046, 5, 6, 1),
(7312, 3046, 6, 4, 1),
(7313, 3046, 7, 2, 1),
(7314, 3047, 1, 2, 1),
(7315, 3047, 2, 6, 1),
(7316, 3047, 3, 4, 1),
(7317, 3047, 4, 4, 1),
(7318, 3047, 5, 2, 1),
(7319, 3047, 6, 6, 1),
(7320, 3048, 1, 8, 1),
(7321, 3048, 2, 4, 1),
(7322, 3048, 3, 8, 1),
(7323, 3048, 4, 8, 1),
(7324, 3048, 5, 2, 1),
(7325, 3048, 6, 2, 1),
(7326, 3048, 7, 2, 1),
(7327, 3048, 8, 6, 1),
(7328, 3048, 9, 4, 1),
(7329, 3048, 10, 4, 1),
(7330, 3049, 1, 8, 1),
(7331, 3049, 2, 2, 1),
(7332, 3049, 3, 6, 1),
(7333, 3049, 4, 4, 1),
(7334, 3049, 5, 6, 1),
(7335, 3049, 6, 2, 1),
(7336, 3049, 7, 2, 1),
(7337, 3049, 8, 4, 1),
(7338, 3050, 1, 8, 1),
(7339, 3050, 2, 2, 1),
(7340, 3050, 3, 2, 1),
(7341, 3050, 4, 8, 1),
(7342, 3050, 5, 2, 1),
(7343, 3050, 6, 4, 1),
(7344, 3050, 7, 4, 1),
(7345, 3051, 1, 4, 1),
(7346, 3051, 2, 6, 1),
(7347, 3051, 3, 2, 1),
(7348, 3051, 4, 4, 1),
(7349, 3051, 5, 6, 1),
(7350, 3051, 6, 2, 1),
(7351, 3052, 1, 4, 1),
(7352, 3052, 2, 8, 1),
(7353, 3052, 3, 2, 1),
(7354, 3052, 4, 6, 1),
(7355, 3052, 5, 4, 1),
(7356, 3053, 1, 2, 1),
(7357, 3053, 2, 6, 1),
(7358, 3053, 3, 4, 1),
(7359, 3053, 4, 8, 1),
(7360, 3053, 5, 6, 1),
(7361, 3053, 6, 4, 1),
(7362, 3054, 1, 2, 1),
(7363, 3054, 2, 6, 1),
(7364, 3054, 3, 8, 1),
(7365, 3054, 4, 4, 1),
(7366, 3054, 5, 2, 1),
(7367, 3055, 1, 6, 1),
(7368, 3055, 2, 4, 1),
(7369, 3055, 3, 8, 1),
(7370, 3055, 4, 2, 1),
(7371, 3055, 5, 4, 1),
(7372, 3056, 1, 2, 1),
(7373, 3056, 2, 4, 1),
(7374, 3056, 3, 6, 1),
(7375, 3056, 4, 2, 1),
(7376, 3056, 5, 8, 1),
(7377, 3057, 1, 4, 1),
(7378, 3057, 2, 6, 1),
(7379, 3057, 3, 2, 1),
(7380, 3057, 4, 4, 1),
(7381, 3057, 5, 6, 1),
(7382, 3058, 1, 2, 1),
(7383, 3058, 2, 4, 1),
(7384, 3058, 3, 8, 1),
(7385, 3058, 4, 6, 1),
(7386, 3058, 5, 2, 1),
(7387, 3059, 1, 4, 1),
(7388, 3059, 2, 6, 1),
(7389, 3059, 3, 8, 1),
(7390, 3059, 4, 2, 1),
(7391, 3059, 5, 4, 1),
(7392, 3060, 1, 6, 1),
(7393, 3060, 2, 4, 1),
(7394, 3060, 3, 8, 1),
(7395, 3060, 4, 6, 1),
(7396, 3060, 5, 2, 1),
(7397, 3061, 1, 4, 1),
(7398, 3061, 2, 6, 1),
(7399, 3061, 3, 2, 1),
(7400, 3061, 4, 4, 1),
(7401, 3061, 5, 8, 1),
(7402, 3062, 1, 2, 1),
(7403, 3062, 2, 4, 1),
(7404, 3062, 3, 6, 1),
(7405, 3062, 4, 8, 1),
(7406, 3062, 5, 2, 1),
(7407, 3063, 1, 4, 1),
(7408, 3063, 2, 6, 1),
(7409, 3063, 3, 8, 1),
(7410, 3063, 4, 2, 1),
(7411, 3063, 5, 6, 1),
(7412, 3064, 1, 2, 1),
(7413, 3064, 2, 4, 1),
(7414, 3064, 3, 6, 1),
(7415, 3064, 4, 8, 1),
(7416, 3064, 5, 4, 1),
(7417, 3065, 1, 4, 1),
(7418, 3065, 2, 6, 1),
(7419, 3065, 3, 2, 1),
(7420, 3065, 4, 4, 1),
(7421, 3065, 5, 8, 1),
(7422, 3066, 1, 2, 1),
(7423, 3066, 2, 4, 1),
(7424, 3066, 3, 6, 1),
(7425, 3066, 4, 8, 1),
(7426, 3066, 5, 2, 1),
(7427, 3067, 1, 4, 1),
(7428, 3067, 2, 6, 1),
(7429, 3067, 3, 8, 1),
(7430, 3067, 4, 2, 1),
(7431, 3067, 5, 4, 1),
(7432, 3068, 1, 6, 1),
(7433, 3068, 2, 4, 1),
(7434, 3068, 3, 8, 1),
(7435, 3068, 4, 6, 1),
(7436, 3068, 5, 2, 1),
(7437, 3069, 1, 4, 1),
(7438, 3069, 2, 6, 1),
(7439, 3069, 3, 8, 1),
(7440, 3069, 4, 2, 1),
(7441, 3069, 5, 4, 1),
(7442, 3070, 1, 2, 1),
(7443, 3070, 2, 4, 1),
(7444, 3070, 3, 6, 1),
(7445, 3070, 4, 8, 1),
(7446, 3070, 5, 2, 1),
(7447, 3071, 1, 4, 1),
(7448, 3071, 2, 6, 1),
(7449, 3071, 3, 2, 1),
(7450, 3071, 4, 4, 1),
(7451, 3071, 5, 8, 1),
(7452, 3072, 1, 2, 1),
(7453, 3072, 2, 4, 1),
(7454, 3072, 3, 6, 1),
(7455, 3072, 4, 8, 1),
(7456, 3072, 5, 2, 1),
(7457, 3073, 1, 4, 1),
(7458, 3073, 2, 6, 1),
(7459, 3073, 3, 8, 1),
(7460, 3073, 4, 2, 1),
(7461, 3073, 5, 4, 1),
(7462, 3074, 1, 6, 1),
(7463, 3074, 2, 4, 1),
(7464, 3074, 3, 8, 1),
(7465, 3074, 4, 6, 1),
(7466, 3074, 5, 2, 1),
(7467, 3075, 1, 4, 1),
(7468, 3075, 2, 6, 1),
(7469, 3075, 3, 8, 1),
(7470, 3075, 4, 2, 1),
(7471, 3075, 5, 4, 1),
(7472, 3076, 1, 2, 1),
(7473, 3076, 2, 4, 1),
(7474, 3076, 3, 6, 1),
(7475, 3076, 4, 8, 1),
(7476, 3076, 5, 2, 1),
(7477, 3077, 1, 4, 1),
(7478, 3077, 2, 6, 1),
(7479, 3077, 3, 8, 1),
(7480, 3077, 4, 2, 1),
(7481, 3077, 5, 4, 1),
(7482, 3078, 1, 6, 1),
(7483, 3078, 2, 4, 1),
(7484, 3078, 3, 8, 1),
(7485, 3078, 4, 6, 1),
(7486, 3078, 5, 2, 1),
(7487, 3079, 1, 4, 1),
(7488, 3079, 2, 6, 1),
(7489, 3079, 3, 8, 1),
(7490, 3079, 4, 2, 1),
(7491, 3079, 5, 4, 1),
(7492, 3080, 1, 2, 1),
(7493, 3080, 2, 4, 1),
(7494, 3080, 3, 6, 1),
(7495, 3080, 4, 8, 1),
(7496, 3080, 5, 2, 1),
(7497, 3081, 1, 4, 1),
(7498, 3081, 2, 6, 1),
(7499, 3081, 3, 2, 1),
(7500, 3081, 4, 4, 1),
(7501, 3081, 5, 8, 1),
(7502, 3082, 1, 2, 1),
(7503, 3082, 2, 4, 1),
(7504, 3082, 3, 6, 1),
(7505, 3082, 4, 8, 1),
(7506, 3082, 5, 2, 1),
(7507, 3083, 1, 4, 1),
(7508, 3083, 2, 6, 1),
(7509, 3083, 3, 8, 1),
(7510, 3083, 4, 2, 1),
(7511, 3083, 5, 4, 1),
(7512, 3084, 1, 6, 1),
(7513, 3084, 2, 4, 1),
(7514, 3084, 3, 8, 1),
(7515, 3084, 4, 6, 1),
(7516, 3084, 5, 2, 1),
(7517, 3085, 1, 4, 1),
(7518, 3085, 2, 6, 1),
(7519, 3085, 3, 8, 1),
(7520, 3085, 4, 2, 1),
(7521, 3085, 5, 4, 1),
(7522, 3086, 1, 2, 1),
(7523, 3086, 2, 4, 1),
(7524, 3086, 3, 6, 1),
(7525, 3086, 4, 8, 1),
(7526, 3086, 5, 2, 1),
(7527, 3087, 1, 4, 1),
(7528, 3087, 2, 6, 1),
(7529, 3087, 3, 8, 1),
(7530, 3087, 4, 2, 1),
(7531, 3087, 5, 4, 1),
(7532, 3088, 1, 6, 1),
(7533, 3088, 2, 4, 1),
(7534, 3088, 3, 8, 1),
(7535, 3088, 4, 6, 1),
(7536, 3088, 5, 2, 1),
(7537, 3089, 1, 4, 1),
(7538, 3089, 2, 6, 1),
(7539, 3089, 3, 8, 1),
(7540, 3089, 4, 2, 1),
(7541, 3089, 5, 4, 1),
(7542, 3090, 1, 2, 1),
(7543, 3090, 2, 4, 1),
(7544, 3090, 3, 6, 1),
(7545, 3090, 4, 8, 1),
(7546, 3090, 5, 2, 1),
(7547, 3091, 1, 4, 1),
(7548, 3091, 2, 6, 1),
(7549, 3091, 3, 2, 1),
(7550, 3091, 4, 4, 1),
(7551, 3091, 5, 8, 1),
(7552, 3092, 1, 2, 1),
(7553, 3092, 2, 4, 1),
(7554, 3092, 3, 6, 1),
(7555, 3092, 4, 8, 1),
(7556, 3092, 5, 2, 1),
(7557, 3093, 1, 4, 1),
(7558, 3093, 2, 6, 1),
(7559, 3093, 3, 8, 1),
(7560, 3093, 4, 2, 1),
(7561, 3093, 5, 4, 1),
(7562, 3094, 1, 6, 1),
(7563, 3094, 2, 4, 1),
(7564, 3094, 3, 8, 1),
(7565, 3094, 4, 6, 1),
(7566, 3094, 5, 2, 1),
(7567, 3095, 1, 4, 1),
(7568, 3095, 2, 6, 1),
(7569, 3095, 3, 8, 1),
(7570, 3095, 4, 2, 1),
(7571, 3095, 5, 4, 1),
(7572, 3096, 1, 2, 1),
(7573, 3096, 2, 4, 1),
(7574, 3096, 3, 6, 1),
(7575, 3096, 4, 8, 1),
(7576, 3096, 5, 2, 1),
(7577, 3097, 1, 4, 1),
(7578, 3097, 2, 6, 1),
(7579, 3097, 3, 8, 1),
(7580, 3097, 4, 2, 1),
(7581, 3097, 5, 4, 1),
(7582, 3098, 1, 6, 1),
(7583, 3098, 2, 4, 1),
(7584, 3098, 3, 8, 1),
(7585, 3098, 4, 6, 1),
(7586, 3098, 5, 2, 1),
(7587, 3099, 1, 4, 1),
(7588, 3099, 2, 6, 1),
(7589, 3099, 3, 8, 1),
(7590, 3099, 4, 2, 1),
(7591, 3099, 5, 4, 1),
(7592, 3100, 1, 2, 1),
(7593, 3100, 2, 4, 1),
(7594, 3100, 3, 6, 1),
(7595, 3100, 4, 8, 1),
(7596, 3100, 5, 2, 1);


-- Table structure for table `review`

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `Comment` text DEFAULT NULL,
  `Timestamp` datetime DEFAULT current_timestamp(),
  `IsEdited` tinyint(1) DEFAULT 0,
  `EditedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `review` (`ReviewID`, `UserID`, `RestaurantID`, `Comment`, `Timestamp`, `IsEdited`, `EditedAt`) VALUES
(9200, 2001, 3001, 'Highly recommend the biryani here.', '2025-01-28 12:45:57', 1, '2025-05-21 13:54:01'),
(9201, 2002, 3001, 'Did not like the salad dressing.', '2024-11-17 06:05:42', 0, NULL),
(9202, 2003, 3001, 'Great location and friendly staff.', '2025-03-15 18:22:11', 0, NULL),

(9203, 2004, 3002, 'Amazing food and ambiance.', '2025-10-29 12:52:04', 1, '2025-09-10 21:32:42'),
(9204, 2005, 3002, 'Service could be faster.', '2025-05-16 09:04:52', 0, NULL),

(9205, 2006, 3003, 'Will come back for sure!', '2025-04-26 07:57:43', 0, NULL),
(9206, 2007, 3003, 'Average experience.', '2025-10-03 04:02:06', 0, NULL),

(9207, 2008, 3004, 'Great location and view.', '2025-06-20 16:52:11', 0, NULL),
(9208, 2009, 3004, 'Ambiance was nice and quiet.', '2025-07-28 11:53:54', 0, NULL),

(9209, 2010, 3005, 'Too spicy for my taste.', '2024-11-22 05:19:43', 1, '2025-03-12 13:22:15'),
(9210, 2011, 3005, 'Great location and friendly staff.', '2025-01-31 04:30:17', 0, NULL),
(9211, 2012, 3005, 'Loved the dessert.', '2025-10-19 21:37:45', 0, NULL),

(9212, 2013, 3006, 'Not worth the price.', '2025-02-12 13:44:22', 1, '2025-06-05 09:22:15'),
(9213, 2014, 3006, 'Will come back for sure.', '2025-08-11 17:02:11', 0, NULL),

(9214, 2015, 3007, 'Great service and ambiance.', '2025-03-30 10:22:55', 0, NULL),
(9215, 2016, 3007, 'Food took too long to arrive.', '2025-05-19 12:12:44', 0, NULL),

(9216, 2017, 3008, 'Amazing food and friendly staff.', '2025-04-02 18:33:22', 1, '2025-09-01 15:22:11'),
(9217, 2018, 3008, 'Loved the desserts!', '2025-07-12 09:55:31', 0, NULL),

(9218, 2019, 3009, 'Highly recommend this place.', '2025-06-23 20:12:01', 0, NULL),
(9219, 2020, 3009, 'Service could improve.', '2025-05-15 08:22:17', 0, NULL),

(9220, 2021, 3010, 'Not worth the price.', '2025-02-14 13:44:33', 0, NULL),
(9221, 2022, 3010, 'Amazing food and ambiance.', '2025-06-01 17:22:55', 1, '2025-10-02 11:44:00'),

(9222, 2023, 3011, 'Will come back again!', '2025-05-21 14:05:33', 0, NULL),
(9223, 2024, 3011, 'Great location.', '2025-07-13 16:22:11', 0, NULL),

(9224, 2025, 3012, 'Too spicy for my taste.', '2025-03-18 12:12:12', 0, NULL),
(9225, 2026, 3012, 'Loved the desserts.', '2025-09-20 18:33:55', 0, NULL),

(9226, 2027, 3013, 'Highly recommend the biryani.', '2025-02-11 09:44:22', 1, '2025-06-14 10:12:33'),
(9227, 2028, 3013, 'Average experience.', '2025-08-01 20:22:44', 0, NULL),

(9228, 2029, 3014, 'Good service and food.', '2025-04-23 07:44:22', 0, NULL),
(9229, 2030, 3014, 'Loved the location.', '2025-10-12 16:55:11', 0, NULL),

(9230, 2031, 3015, 'Amazing ambiance.', '2025-01-31 10:22:44', 1, '2025-05-22 13:15:22'),
(9231, 2032, 3015, 'Will come back for sure!', '2025-06-18 19:44:33', 0, NULL),

(9232, 2033, 3016, 'Food was okay.', '2025-03-02 12:11:22', 0, NULL),
(9233, 2034, 3016, 'Great staff.', '2025-07-12 18:55:11', 0, NULL),

(9234, 2035, 3017, 'Highly recommend this place.', '2025-05-28 13:44:22', 0, NULL),
(9235, 2036, 3017, 'Loved the dessert.', '2025-09-11 14:22:11', 1, '2025-10-18 17:33:44'),

(9236, 2037, 3018, 'Good location and service.', '2025-02-14 12:22:11', 0, NULL),
(9237, 2038, 3018, 'Average experience.', '2025-04-29 16:55:22', 0, NULL),

(9238, 2039, 3019, 'Will visit again.', '2025-06-05 09:44:33', 0, NULL),
(9239, 2040, 3019, 'Food was delicious.', '2025-08-17 18:22:11', 0, NULL),

(9240, 2041, 3020, 'Highly recommend.', '2025-01-11 12:11:22', 1, '2025-03-20 11:44:00'),
(9241, 2042, 3020, 'Good location.', '2025-05-29 16:22:33', 0, NULL),

(9242, 2043, 3021, 'Average service.', '2025-04-17 08:44:22', 0, NULL),
(9243, 2044, 3021, 'Loved the dessert.', '2025-09-09 14:22:11', 0, NULL),

(9244, 2045, 3022, 'Will come back!', '2025-02-26 13:22:11', 0, NULL),
(9245, 2046, 3022, 'Amazing food.', '2025-06-08 18:44:22', 0, NULL),

(9246, 2047, 3023, 'Not worth the price.', '2025-01-14 12:11:22', 1, '2025-04-21 16:33:11'),
(9247, 2048, 3023, 'Great ambiance.', '2025-05-12 14:22:33', 0, NULL),

(9248, 2049, 3024, 'Will come back again!', '2025-03-18 10:11:22', 0, NULL),
(9249, 2050, 3024, 'Food was good.', '2025-07-09 15:22:44', 0, NULL),

(9250, 2051, 3025, 'Loved the dessert.', '2025-02-21 12:44:33', 0, NULL),
(9251, 2052, 3025, 'Good service.', '2025-06-19 18:22:11', 0, NULL),

(9377, 2001, 3026, 'Amazing food and ambiance.', '2025-01-12 12:22:33', 0, NULL),
(9378, 2002, 3026, 'Service could be faster.', '2025-03-18 14:55:22', 1, '2025-06-10 11:44:00'),
(9379, 2003, 3026, 'Will come back for sure!', '2025-05-22 09:44:11', 0, NULL),

(9380, 2004, 3027, 'Highly recommend this place.', '2025-02-16 10:11:22', 0, NULL),
(9381, 2005, 3027, 'Loved the dessert.', '2025-06-19 16:33:44', 1, '2025-09-10 13:22:11'),

(9382, 2006, 3028, 'Good location and staff.', '2025-03-25 12:33:11', 0, NULL),
(9383, 2007, 3028, 'Average experience.', '2025-07-14 18:22:33', 0, NULL),

(9384, 2008, 3029, 'Too spicy for my taste.', '2025-01-28 08:22:44', 0, NULL),
(9385, 2009, 3029, 'Loved the dessert.', '2025-05-20 15:44:11', 1, '2025-08-05 12:22:33'),

(9386, 2010, 3030, 'Amazing ambiance.', '2025-02-12 14:33:22', 0, NULL),
(9387, 2011, 3030, 'Will come back for sure!', '2025-06-15 17:44:55', 0, NULL),

(9388, 2012, 3031, 'Not worth the price.', '2025-03-10 11:22:11', 0, NULL),
(9389, 2013, 3031, 'Great location and view.', '2025-07-28 09:44:33', 1, '2025-09-19 10:55:22'),

(9390, 2014, 3032, 'Amazing food.', '2025-01-18 10:11:44', 0, NULL),
(9391, 2015, 3032, 'Service could improve.', '2025-05-11 13:22:33', 0, NULL),
(9392, 2016, 3032, 'Loved the dessert.', '2025-06-29 16:33:22', 1, '2025-08-15 12:44:11'),

(9393, 2017, 3033, 'Will come back again!', '2025-02-21 12:44:33', 0, NULL),
(9394, 2018, 3033, 'Good ambiance.', '2025-06-17 14:22:11', 0, NULL),

(9395, 2019, 3034, 'Highly recommend the biryani.', '2025-01-25 09:22:44', 0, NULL),
(9396, 2020, 3034, 'Too spicy for my taste.', '2025-03-29 18:33:11', 1, '2025-06-21 11:22:55'),

(9397, 2021, 3035, 'Amazing location.', '2025-02-14 16:44:22', 0, NULL),
(9398, 2022, 3035, 'Service was average.', '2025-07-13 12:22:33', 0, NULL),

(9399, 2023, 3036, 'Loved the dessert.', '2025-03-05 13:33:44', 0, NULL),
(9400, 2024, 3036, 'Will come back for sure!', '2025-06-19 15:44:11', 1, '2025-09-01 12:33:22'),

(9401, 2025, 3037, 'Good service and ambiance.', '2025-01-12 11:22:33', 0, NULL),
(9402, 2026, 3037, 'Not worth the price.', '2025-05-08 17:44:22', 0, NULL),
(9403, 2027, 3037, 'Highly recommend this place.', '2025-07-22 13:33:11', 1, '2025-09-12 10:22:44'),

(9404, 2028, 3038, 'Amazing food.', '2025-02-19 12:22:33', 0, NULL),
(9405, 2029, 3038, 'Service could be faster.', '2025-06-18 15:44:22', 0, NULL),

(9406, 2030, 3039, 'Loved the dessert.', '2025-03-25 09:33:11', 0, NULL),
(9407, 2031, 3039, 'Average experience.', '2025-07-20 14:22:33', 1, '2025-08-28 12:44:11'),

(9408, 2032, 3040, 'Will come back again!', '2025-01-31 13:22:44', 0, NULL),
(9409, 2033, 3040, 'Good service.', '2025-05-15 16:33:22', 0, NULL),
(9410, 2034, 3040, 'Great location and ambiance.', '2025-07-29 12:44:11', 1, '2025-09-21 11:33:55'),

(9411, 2035, 3041, 'Too spicy for my taste.', '2025-02-08 12:22:33', 0, NULL),
(9412, 2036, 3041, 'Loved the dessert.', '2025-06-10 15:44:22', 0, NULL),

(9413, 2037, 3042, 'Amazing location.', '2025-03-20 09:33:11', 0, NULL),
(9414, 2038, 3042, 'Service was average.', '2025-07-18 14:22:33', 1, '2025-09-12 12:44:11'),

(9415, 2039, 3043, 'Highly recommend this place.', '2025-01-16 13:22:44', 0, NULL),
(9416, 2040, 3043, 'Loved the ambiance.', '2025-05-20 16:33:22', 0, NULL),
(9417, 2041, 3043, 'Will come back for sure!', '2025-07-25 12:44:11', 1, '2025-09-30 10:33:22'),

(9418, 2042, 3044, 'Amazing food and ambiance.', '2025-01-18 14:22:11', 0, NULL),
(9419, 2043, 3044, 'Service could be faster.', '2025-04-12 16:33:22', 1, '2025-07-01 11:44:33'),
(9420, 2044, 3044, 'Will come back again!', '2025-06-20 12:11:55', 0, NULL),

(9421, 2045, 3045, 'Highly recommend this place.', '2025-02-10 10:22:33', 0, NULL),
(9422, 2046, 3045, 'Loved the dessert.', '2025-05-15 13:33:44', 1, '2025-08-02 12:22:11'),

(9423, 2047, 3046, 'Good location and staff.', '2025-03-08 09:11:22', 0, NULL),
(9424, 2048, 3046, 'Average experience.', '2025-06-18 15:44:33', 0, NULL),

(9425, 2049, 3047, 'Too spicy for my taste.', '2025-01-25 12:22:44', 0, NULL),
(9426, 2050, 3047, 'Loved the dessert.', '2025-05-22 14:33:22', 1, '2025-07-12 13:44:11'),

(9427, 2051, 3048, 'Amazing ambiance.', '2025-02-12 11:22:33', 0, NULL),
(9428, 2052, 3048, 'Will come back for sure!', '2025-06-16 16:44:22', 0, NULL),

(9429, 2001, 3049, 'Not worth the price.', '2025-03-18 10:33:11', 0, NULL),
(9430, 2002, 3049, 'Great location and view.', '2025-07-20 15:44:33', 1, '2025-09-05 12:33:22'),

(9431, 2003, 3050, 'Amazing food.', '2025-01-20 12:22:44', 0, NULL),
(9432, 2004, 3050, 'Service could improve.', '2025-05-11 14:33:22', 0, NULL),
(9433, 2005, 3050, 'Loved the dessert.', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),

(9434, 2006, 3051, 'Will come back again!', '2025-02-21 11:22:33', 0, NULL),
(9435, 2007, 3051, 'Good ambiance.', '2025-06-17 15:44:22', 0, NULL),
(9436, 2008, 3051, 'Amazing service.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22'),
(9437, 2009, 3052, 'Amazing food and ambiance.', '2025-01-18 14:22:11', 0, NULL),
(9438, 2010, 3052, 'Service could be faster.', '2025-04-12 16:33:22', 1, '2025-07-01 11:44:33'),

(9439, 2011, 3053, 'Will come back again!', '2025-03-08 09:11:22', 0, NULL),
(9440, 2012, 3053, 'Loved the dessert.', '2025-06-18 15:44:33', 0, NULL),

(9441, 2013, 3054, 'Good location and staff.', '2025-01-25 12:22:44', 0, NULL),
(9442, 2014, 3054, 'Average experience.', '2025-05-22 14:33:22', 1, '2025-07-12 13:44:11'),

(9443, 2015, 3055, 'Too spicy for my taste.', '2025-02-12 11:22:33', 0, NULL),
(9444, 2016, 3055, 'Loved the dessert.', '2025-06-16 16:44:22', 0, NULL),

(9445, 2017, 3056, 'Amazing ambiance.', '2025-03-18 10:33:11', 0, NULL),
(9446, 2018, 3056, 'Will come back for sure!', '2025-07-20 15:44:33', 1, '2025-09-05 12:33:22'),

(9447, 2019, 3057, 'Not worth the price.', '2025-01-20 12:22:44', 0, NULL),
(9448, 2020, 3057, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),
(9449, 2021, 3057, 'Loved the dessert.', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),

(9450, 2022, 3058, 'Will come back again!', '2025-02-21 11:22:33', 0, NULL),
(9451, 2023, 3058, 'Good ambiance.', '2025-06-17 15:44:22', 0, NULL),

(9452, 2024, 3059, 'Amazing service.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22'),
(9453, 2025, 3059, 'Highly recommend this place.', '2025-03-12 13:22:11', 0, NULL),

(9454, 2026, 3060, 'Loved the food.', '2025-04-05 12:33:22', 0, NULL),
(9455, 2027, 3060, 'Service could improve.', '2025-05-15 14:44:33', 1, '2025-08-02 12:22:11'),

(9456, 2028, 3061, 'Good location.', '2025-02-18 11:22:33', 0, NULL),
(9457, 2029, 3061, 'Too noisy.', '2025-06-20 16:44:22', 0, NULL),

(9458, 2030, 3062, 'Amazing ambiance.', '2025-03-21 10:33:11', 0, NULL),
(9459, 2031, 3062, 'Loved the dessert.', '2025-07-25 15:44:33', 1, '2025-09-05 12:33:22'),

(9460, 2032, 3063, 'Not worth the price.', '2025-01-12 12:22:44', 0, NULL),
(9461, 2033, 3063, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),

(9462, 2034, 3064, 'Will come back again!', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),
(9463, 2035, 3064, 'Good ambiance.', '2025-02-21 11:22:33', 0, NULL),

(9464, 2036, 3065, 'Amazing service.', '2025-06-17 15:44:22', 0, NULL),
(9465, 2037, 3065, 'Highly recommend this place.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22'),

(9466, 2038, 3066, 'Loved the food.', '2025-03-12 13:22:11', 0, NULL),
(9467, 2039, 3066, 'Service could improve.', '2025-04-05 12:33:22', 0, NULL),

(9468, 2040, 3067, 'Good location.', '2025-05-15 14:44:33', 1, '2025-08-02 12:22:11'),
(9469, 2041, 3067, 'Too noisy.', '2025-02-18 11:22:33', 0, NULL),

(9470, 2042, 3068, 'Amazing ambiance.', '2025-06-20 16:44:22', 0, NULL),
(9471, 2043, 3068, 'Loved the dessert.', '2025-03-21 10:33:11', 1, '2025-09-05 12:33:22'),

(9472, 2044, 3069, 'Not worth the price.', '2025-01-12 12:22:44', 0, NULL),
(9473, 2045, 3069, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),

(9474, 2046, 3070, 'Amazing ambiance.', '2025-02-14 12:22:33', 0, NULL),
(9475, 2047, 3070, 'Will come back for sure!', '2025-06-05 15:44:22', 1, '2025-09-01 11:33:11'),

(9476, 2048, 3071, 'Not worth the price.', '2025-03-18 10:33:11', 0, NULL),
(9477, 2049, 3071, 'Loved the dessert.', '2025-07-25 16:44:33', 0, NULL),

(9478, 2050, 3072, 'Good location and view.', '2025-04-22 11:22:44', 0, NULL),
(9479, 2001, 3072, 'Did not like the salad dressing.', '2025-06-03 18:07:28', 1, '2025-08-10 12:33:11'),

(9480, 2002, 3073, 'Amazing food and ambiance.', '2025-01-30 14:33:22', 0, NULL),
(9481, 2003, 3073, 'Service could improve.', '2025-05-17 12:44:33', 0, NULL),

(9482, 2004, 3074, 'Loved the dessert.', '2025-03-21 10:22:11', 0, NULL),
(9483, 2005, 3074, 'Too spicy for my taste.', '2025-07-05 15:44:22', 1, '2025-09-12 11:22:33'),

(9484, 2006, 3075, 'Great location and staff.', '2025-02-18 11:33:44', 0, NULL),
(9485, 2007, 3075, 'Average experience.', '2025-06-22 16:44:11', 0, NULL),

(9486, 2008, 3076, 'Will come back again!', '2025-01-25 12:22:33', 1, '2025-08-01 10:33:22'),
(9487, 2009, 3076, 'Amazing ambiance.', '2025-05-18 14:44:11', 0, NULL),

(9488, 2010, 3077, 'Loved the food.', '2025-03-12 13:22:11', 0, NULL),
(9489, 2011, 3077, 'Service could improve.', '2025-06-05 12:33:22', 1, '2025-09-10 11:44:33'),

(9490, 2012, 3078, 'Good location.', '2025-02-14 10:22:33', 0, NULL),
(9491, 2013, 3078, 'Too noisy.', '2025-06-18 15:44:22', 0, NULL),

(9492, 2014, 3079, 'Amazing ambiance.', '2025-03-21 12:33:11', 0, NULL),
(9493, 2015, 3079, 'Loved the dessert.', '2025-07-25 16:44:33', 1, '2025-09-05 12:33:22'),

(9494, 2016, 3080, 'Not worth the price.', '2025-01-12 12:22:44', 0, NULL),
(9495, 2017, 3080, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),

(9496, 2018, 3081, 'Will come back again!', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),
(9497, 2019, 3081, 'Good ambiance.', '2025-02-21 11:22:33', 0, NULL),

(9498, 2020, 3082, 'Amazing service.', '2025-06-17 15:44:22', 0, NULL),
(9499, 2021, 3082, 'Highly recommend this place.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22'),

(9500, 2022, 3083, 'Loved the food.', '2025-03-12 13:22:11', 0, NULL),
(9501, 2023, 3083, 'Service could improve.', '2025-04-05 12:33:22', 0, NULL),

(9502, 2024, 3084, 'Good location.', '2025-05-15 14:44:33', 1, '2025-08-02 12:22:11'),
(9503, 2025, 3084, 'Too noisy.', '2025-02-18 11:22:33', 0, NULL),

(9504, 2026, 3085, 'Amazing ambiance.', '2025-06-20 16:44:22', 0, NULL),
(9505, 2027, 3085, 'Loved the dessert.', '2025-03-21 10:33:11', 1, '2025-09-05 12:33:22'),

(9506, 2028, 3086, 'Not worth the price.', '2025-01-12 12:22:44', 0, NULL),
(9507, 2029, 3086, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),

(9508, 2030, 3087, 'Will come back again!', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),
(9509, 2031, 3087, 'Good ambiance.', '2025-02-21 11:22:33', 0, NULL),

(9510, 2032, 3088, 'Amazing service.', '2025-06-17 15:44:22', 0, NULL),
(9511, 2033, 3088, 'Highly recommend this place.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22'),

(9512, 2034, 3089, 'Loved the food.', '2025-03-12 13:22:11', 0, NULL),
(9513, 2035, 3089, 'Service could improve.', '2025-04-05 12:33:22', 0, NULL),

(9514, 2036, 3090, 'Good location.', '2025-05-15 14:44:33', 1, '2025-08-02 12:22:11'),
(9515, 2037, 3090, 'Too noisy.', '2025-02-18 11:22:33', 0, NULL),

(9516, 2038, 3091, 'Amazing ambiance.', '2025-06-20 16:44:22', 0, NULL),
(9517, 2039, 3091, 'Loved the dessert.', '2025-03-21 10:33:11', 1, '2025-09-05 12:33:22'),

(9518, 2040, 3092, 'Not worth the price.', '2025-01-12 12:22:44', 0, NULL),
(9519, 2041, 3092, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),

(9520, 2042, 3093, 'Will come back again!', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),
(9521, 2043, 3093, 'Good ambiance.', '2025-02-21 11:22:33', 0, NULL),

(9522, 2044, 3094, 'Amazing service.', '2025-06-17 15:44:22', 0, NULL),
(9523, 2045, 3094, 'Highly recommend this place.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22'),

(9524, 2046, 3095, 'Loved the food.', '2025-03-12 13:22:11', 0, NULL),
(9525, 2047, 3095, 'Service could improve.', '2025-04-05 12:33:22', 0, NULL),

(9526, 2048, 3096, 'Good location.', '2025-05-15 14:44:33', 1, '2025-08-02 12:22:11'),
(9527, 2049, 3096, 'Too noisy.', '2025-02-18 11:22:33', 0, NULL),

(9528, 2050, 3097, 'Amazing ambiance.', '2025-06-20 16:44:22', 0, NULL),
(9529, 2051, 3097, 'Loved the dessert.', '2025-03-21 10:33:11', 1, '2025-09-05 12:33:22'),

(9530, 2052, 3098, 'Not worth the price.', '2025-01-12 12:22:44', 0, NULL),
(9531, 2001, 3098, 'Great location and view.', '2025-05-11 14:33:22', 0, NULL),

(9532, 2002, 3099, 'Will come back again!', '2025-06-25 16:44:11', 1, '2025-08-15 12:22:33'),
(9533, 2003, 3099, 'Good ambiance.', '2025-02-21 11:22:33', 0, NULL),

(9534, 2004, 3100, 'Amazing service.', '2025-06-17 15:44:22', 0, NULL),
(9535, 2005, 3100, 'Highly recommend this place.', '2025-07-25 12:33:11', 1, '2025-09-18 10:44:22');

-- Table structure for table `useraccount`

DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `ContactNo` varchar(30) DEFAULT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `IsEmailVerified` tinyint(1) DEFAULT 0,
  `Role` enum('user','owner','admin') DEFAULT 'user',
  `Status` enum('Active','Inactive','Suspended') DEFAULT 'Active',
  `ProfileImageURL` varchar(512) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `useraccount` 
(`Id`, `FirstName`, `LastName`, `Email`, `ContactNo`, `PasswordHash`, `IsEmailVerified`, `Role`, `Status`, `ProfileImageURL`, `CreatedAt`, `UpdatedAt`)
VALUES
(2001, 'Ali', 'Raza', 'ali.raza@gmail.com', '+923001234567', '5e884898da28047151d0e56f8dc62927', 1, 'user', 'Active', 'https://example.com/images/ali.jpg', '2024-08-12 10:15:00', '2024-08-12 10:15:00'),
(2002, 'Ayesha', 'Khan', 'ayesha.khan@yahoo.com', '+923112345678', '6dcd4ce23d88e2ee9568ba546c007c63', 1, 'user', 'Active', 'https://example.com/images/ayesha.jpg', '2024-07-15 11:30:00', '2024-07-15 11:30:00'),
(2003, 'Bilal', 'Ahmed', 'bilal.ahmed@gmail.com', '+923232220987', '8f14e45fceea167a5a36dedd4bea2543', 1, 'user', 'Active', 'https://example.com/images/bilal.jpg', '2024-06-10 09:45:00', '2024-06-10 09:45:00'),
(2004, 'Fatima', 'Zahid', 'fatima.zahid@gmail.com', '+923134561234', '098f6bcd4621d373cade4e832627b4f6', 0, 'user', 'Active', 'https://example.com/images/fatima.jpg', '2024-05-20 08:25:00', '2024-05-20 08:25:00'),
(2005, 'Usman', 'Ali', 'usman.ali@hotmail.com', '+923447891234', 'ad0234829205b9033196ba818f7a872b', 1, 'owner', 'Active', 'https://example.com/images/usman.jpg', '2024-07-28 14:40:00', '2024-07-28 14:40:00'),
(2006, 'Sana', 'Javed', 'sana.javed@gmail.com', '+923009871236', 'e99a18c428cb38d5f260853678922e03', 1, 'user', 'Active', 'https://example.com/images/sana.jpg', '2024-08-05 16:20:00', '2024-08-05 16:20:00'),
(2007, 'Hamza', 'Iqbal', 'hamza.iqbal@yahoo.com', '+923125678901', 'c20ad4d76fe97759aa27a0c99bff6710', 0, 'user', 'Active', 'https://example.com/images/hamza.jpg', '2024-06-22 17:35:00', '2024-06-22 17:35:00'),
(2008, 'Zara', 'Malik', 'zara.malik@gmail.com', '+923213456789', '45c48cce2e2d7fbdea1afc51c7c6ad26', 1, 'user', 'Active', 'https://example.com/images/zara.jpg', '2024-07-19 18:55:00', '2024-07-19 18:55:00'),
(2009, 'Hassan', 'Rizvi', 'hassan.rizvi@gmail.com', '+923334567890', '6512bd43d9caa6e02c990b0a82652dca', 1, 'owner', 'Active', 'https://example.com/images/hassan.jpg', '2024-05-12 19:15:00', '2024-05-12 19:15:00'),
(2010, 'Maryam', 'Ali', 'maryam.ali@yahoo.com', '+923004567890', 'd8578edf8458ce06fbc5bb76a58c5ca4', 0, 'user', 'Active', 'https://example.com/images/maryam.jpg', '2024-07-09 11:05:00', '2024-07-09 11:05:00'),
(2011, 'Tahir', 'Mehmood', 'tahir.mehmood@gmail.com', '+923126789012', '900150983cd24fb0d6963f7d28e17f72', 1, 'user', 'Active', 'https://example.com/images/tahir.jpg', '2024-08-02 10:25:00', '2024-08-02 10:25:00'),
(2012, 'Iqra', 'Shahid', 'iqra.shahid@gmail.com', '+923175891234', 'aab3238922bcc25a6f606eb525ffdc56', 1, 'user', 'Active', 'https://example.com/images/iqra.jpg', '2024-06-15 14:35:00', '2024-06-15 14:35:00'),
(2013, 'Ahmed', 'Nadeem', 'ahmed.nadeem@gmail.com', '+923345678901', 'c9f0f895fb98ab9159f51fd0297e236d', 0, 'user', 'Active', 'https://example.com/images/ahmed.jpg', '2024-07-20 16:15:00', '2024-07-20 16:15:00'),
(2014, 'Sara', 'Khalid', 'sara.khalid@hotmail.com', '+923008765432', '45c48cce2e2d7fbdea1afc51c7c6ad26', 1, 'user', 'Active', 'https://example.com/images/sara.jpg', '2024-07-25 12:45:00', '2024-07-25 12:45:00'),
(2015, 'Noman', 'Aslam', 'noman.aslam@gmail.com', '+923237654321', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'owner', 'Active', 'https://example.com/images/noman.jpg', '2024-05-29 09:10:00', '2024-05-29 09:10:00'),
(2016, 'Hina', 'Rauf', 'hina.rauf@gmail.com', '+923019876543', 'e1671797c52e15f763380b45e841ec32', 1, 'user', 'Active', 'https://example.com/images/hina.jpg', '2024-06-30 13:05:00', '2024-06-30 13:05:00'),
(2017, 'Imran', 'Khalil', 'imran.khalil@yahoo.com', '+923456789012', 'a87ff679a2f3e71d9181a67b7542122c', 0, 'user', 'Active', 'https://example.com/images/imran.jpg', '2024-07-03 10:50:00', '2024-07-03 10:50:00'),
(2018, 'Rabia', 'Farooq', 'rabia.farooq@gmail.com', '+923234445555', '1679091c5a880faf6fb5e6087eb1b2dc', 1, 'user', 'Active', 'https://example.com/images/rabia.jpg', '2024-08-09 11:40:00', '2024-08-09 11:40:00'),
(2019, 'Faisal', 'Malik', 'faisal.malik@gmail.com', '+923445566778', '8f14e45fceea167a5a36dedd4bea2543', 1, 'owner', 'Active', 'https://example.com/images/faisal.jpg', '2024-07-18 09:55:00', '2024-07-18 09:55:00'),
(2020, 'Laiba', 'Naseer', 'laiba.naseer@gmail.com', '+923018889999', 'c20ad4d76fe97759aa27a0c99bff6710', 0, 'user', 'Active', 'https://example.com/images/laiba.jpg', '2024-05-13 08:10:00', '2024-05-13 08:10:00'),
(2021, 'Zain', 'Abbas', 'zain.abbas@gmail.com', '+923225667788', 'c51ce410c124a10e0db5e4b97fc2af39', 1, 'user', 'Active', 'https://example.com/images/zain.jpg', '2024-07-14 13:55:00', '2024-07-14 13:55:00'),
(2022, 'Mehak', 'Arif', 'mehak.arif@yahoo.com', '+923119998877', 'aab3238922bcc25a6f606eb525ffdc56', 1, 'user', 'Active', 'https://example.com/images/mehak.jpg', '2024-06-22 15:30:00', '2024-06-22 15:30:00'),
(2023, 'Kashif', 'Anwar', 'kashif.anwar@gmail.com', '+923332224445', 'c9f0f895fb98ab9159f51fd0297e236d', 1, 'user', 'Active', 'https://example.com/images/kashif.jpg', '2024-05-09 12:50:00', '2024-05-09 12:50:00'),
(2024, 'Sadia', 'Imtiaz', 'sadia.imtiaz@gmail.com', '+923445553333', 'e99a18c428cb38d5f260853678922e03', 0, 'user', 'Active', 'https://example.com/images/sadia.jpg', '2024-07-02 10:30:00', '2024-07-02 10:30:00'),
(2025, 'Adnan', 'Rauf', 'adnan.rauf@hotmail.com', '+923128887777', 'd8578edf8458ce06fbc5bb76a58c5ca4', 1, 'owner', 'Active', 'https://example.com/images/adnan.jpg', '2024-06-11 09:35:00', '2024-06-11 09:35:00'),
(2026, 'Noor', 'Fatima', 'noor.fatima@gmail.com', '+923009991111', '900150983cd24fb0d6963f7d28e17f72', 1, 'user', 'Active', 'https://example.com/images/noor.jpg', '2024-08-04 17:15:00', '2024-08-04 17:15:00'),
(2027, 'Rehan', 'Khan', 'rehan.khan@gmail.com', '+923114447777', '45c48cce2e2d7fbdea1afc51c7c6ad26', 0, 'user', 'Active', 'https://example.com/images/rehan.jpg', '2024-05-10 08:25:00', '2024-05-10 08:25:00'),
(2028, 'Hira', 'Qureshi', 'hira.qureshi@gmail.com', '+923225553333', '5f4dcc3b5aa765d61d8327deb882cf99', 1, 'user', 'Active', 'https://example.com/images/hira.jpg', '2024-06-13 11:20:00', '2024-06-13 11:20:00'),
(2029, 'Shahzaib', 'Rafiq', 'shahzaib.rafiq@gmail.com', '+923333667788', '5d41402abc4b2a76b9719d911017c592', 1, 'user', 'Active', 'https://example.com/images/shahzaib.jpg', '2024-08-01 09:45:00', '2024-08-01 09:45:00'),
(2030, 'Maham', 'Khalid', 'maham.khalid@yahoo.com', '+923118889000', '098f6bcd4621d373cade4e832627b4f6', 1, 'user', 'Active', 'https://example.com/images/maham.jpg', '2024-07-17 16:25:00', '2024-07-17 16:25:00'),
(2031, 'Rizwan', 'Ali', 'rizwan.ali@gmail.com', '+923115556666', '25d55ad283aa400af464c76d713c07ad', 0, 'user', 'Active', 'https://example.com/images/rizwan.jpg', '2024-05-18 12:50:00', '2024-05-18 12:50:00'),
(2032, 'Sahar', 'Nadeem', 'sahar.nadeem@gmail.com', '+923226661111', '21232f297a57a5a743894a0e4a801fc3', 1, 'user', 'Active', 'https://example.com/images/sahar.jpg', '2024-06-09 13:45:00', '2024-06-09 13:45:00'),
(2033, 'Junaid', 'Khalid', 'junaid.khalid@gmail.com', '+923334446666', '81dc9bdb52d04dc20036dbd8313ed055', 1, 'owner', 'Active', 'https://example.com/images/junaid.jpg', '2024-05-19 09:20:00', '2024-05-19 09:20:00'),
(2034, 'Nida', 'Ali', 'nida.ali@gmail.com', '+923004443333', 'e99a18c428cb38d5f260853678922e03', 1, 'user', 'Active', 'https://example.com/images/nida.jpg', '2024-06-14 15:05:00', '2024-06-14 15:05:00'),
(2035, 'Farhan', 'Rashid', 'farhan.rashid@gmail.com', '+923335551111', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'user', 'Active', 'https://example.com/images/farhan.jpg', '2024-07-10 14:30:00', '2024-07-10 14:30:00'),
(2036, 'Asma', 'Yousaf', 'asma.yousaf@gmail.com', '+923116661234', '5d41402abc4b2a76b9719d911017c592', 1, 'user', 'Active', 'https://example.com/images/asma.jpg', '2024-07-01 11:00:00', '2024-07-01 11:00:00'),
(2037, 'Saad', 'Ahmed', 'saad.ahmed@gmail.com', '+923218887777', '098f6bcd4621d373cade4e832627b4f6', 1, 'owner', 'Active', 'https://example.com/images/saad.jpg', '2024-06-12 13:10:00', '2024-06-12 13:10:00'),
(2038, 'Hafsa', 'Riaz', 'hafsa.riaz@gmail.com', '+923115554444', '21232f297a57a5a743894a0e4a801fc3', 0, 'user', 'Active', 'https://example.com/images/hafsa.jpg', '2024-05-22 17:00:00', '2024-05-22 17:00:00'),
(2039, 'Arslan', 'Malik', 'arslan.malik@gmail.com', '+923333447788', 'c20ad4d76fe97759aa27a0c99bff6710', 1, 'user', 'Active', 'https://example.com/images/arslan.jpg', '2024-06-25 15:15:00', '2024-06-25 15:15:00'),
(2040, 'Minal', 'Tariq', 'minal.tariq@gmail.com', '+923004449999', 'c51ce410c124a10e0db5e4b97fc2af39', 1, 'user', 'Active', 'https://example.com/images/minal.jpg', '2024-07-08 11:45:00', '2024-07-08 11:45:00'),
(2041, 'Furqan', 'Hameed', 'furqan.hameed@gmail.com', '+923339445555', 'e99a18c428cb38d5f260853678922e03', 1, 'user', 'Active', 'https://example.com/images/furqan.jpg', '2024-05-30 12:55:00', '2024-05-30 12:55:00'),
(2042, 'Amna', 'Yaseen', 'amna.yaseen@gmail.com', '+923114442222', 'c9f0f895fb98ab9159f51fd0297e236d', 1, 'user', 'Active', 'https://example.com/images/amna.jpg', '2024-06-20 13:35:00', '2024-06-20 13:35:00'),
(2043, 'Rashid', 'Ali', 'rashid.ali@gmail.com', '+923227776666', '8f14e45fceea167a5a36dedd4bea2543', 0, 'user', 'Active', 'https://example.com/images/rashid.jpg', '2024-07-11 10:10:00', '2024-07-11 10:10:00'),
(2044, 'Nimra', 'Saeed', 'nimra.saeed@gmail.com', '+923114443333', '098f6bcd4621d373cade4e832627b4f6', 1, 'user', 'Active', 'https://example.com/images/nimra.jpg', '2024-06-08 09:40:00', '2024-06-08 09:40:00'),
(2045, 'Tariq', 'Hussain', 'tariq.hussain@gmail.com', '+923335559999', '45c48cce2e2d7fbdea1afc51c7c6ad26', 1, 'admin', 'Active', 'https://example.com/images/tariq.jpg', '2024-08-10 08:55:00', '2024-08-10 08:55:00'),
(2046, 'Muzammil', 'Asghar', 'muzammil.asghar@gmail.com', '+923224446666', '827ccb0eea8a706c4c34a16891f84e7b', 1, 'user', 'Active', 'https://example.com/images/muzammil.jpg', '2024-07-07 09:20:00', '2024-07-07 09:20:00'),
(2047, 'Aiman', 'Sajid', 'aiman.sajid@gmail.com', '+923118887777', 'e1671797c52e15f763380b45e841ec32', 0, 'user', 'Active', 'https://example.com/images/aiman.jpg', '2024-05-26 10:00:00', '2024-05-26 10:00:00'),
(2048, 'Shoaib', 'Khan', 'shoaib.khan@gmail.com', '+923332224444', '5d41402abc4b2a76b9719d911017c592', 1, 'owner', 'Active', 'https://example.com/images/shoaib.jpg', '2024-06-27 13:25:00', '2024-06-27 13:25:00'),
(2049, 'Maira', 'Rashid', 'maira.rashid@gmail.com', '+92311444555', '900150983cd24fb0d6963f7d28e17f72', 1, 'user', 'Active', 'https://example.com/images/maira.jpg', '2024-07-13 15:10:00', '2024-07-13 15:10:00'),
(2050, 'Haris', 'Shah', 'haris.shah@gmail.com', '+923335558888', 'c51ce410c124a10e0db5e4b97fc2af39', 1, 'user', 'Active', 'https://example.com/images/haris.jpg', '2024-06-17 17:00:00', '2024-06-17 17:00:00'),
(2051, 'Iqbal', 'Naseer', 'iqbal.naseer@gmail.com', '+923224446777', '21232f297a57a5a743894a0e4a801fc3', 0, 'user', 'Active', 'https://example.com/images/iqbal.jpg', '2024-05-28 09:50:00', '2024-05-28 09:50:00'),
(2052, 'Zoya', 'Rehman', 'zoya.rehman@gmail.com', '+923115556999', '25d55ad283aa400af464c76d713c07ad', 1, 'user', 'Active', 'https://example.com/images/zoya.jpg', '2024-06-29 11:25:00', '2024-06-29 11:25:00');


-- Table structure for table `useractivity`

DROP TABLE IF EXISTS `useractivity`;
CREATE TABLE `useractivity` (
  `ActivityID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RestaurantID` int(11) DEFAULT NULL,
  `ActivityType` enum('view','search','click','rating','review','favorite') NOT NULL,
  `Timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `useractivity` (`ActivityID`, `UserID`, `RestaurantID`, `ActivityType`, `Timestamp`) VALUES
(5001, 2001, 3005, 'view', '2025-03-14 13:45:22'),
(5002, 2002, 3008, 'search', '2025-03-14 14:10:55'),
(5003, 2003, 3010, 'click', '2025-03-14 15:22:11'),
(5004, 2004, 3002, 'favorite', '2025-03-15 10:12:47'),
(5005, 2005, 3003, 'view', '2025-03-15 11:30:10'),
(5006, 2006, 3001, 'review', '2025-03-16 09:55:45'),
(5007, 2007, 3004, 'rating', '2025-03-16 10:30:22'),
(5008, 2008, 3007, 'view', '2025-03-17 11:40:00'),
(5009, 2009, 3009, 'search', '2025-03-17 13:20:15'),
(5010, 2010, 3011, 'click', '2025-03-18 12:35:50'),
(5011, 2011, 3013, 'rating', '2025-03-18 14:12:21'),
(5012, 2012, 3014, 'view', '2025-03-19 15:41:37'),
(5013, 2013, 3016, 'favorite', '2025-03-19 17:09:22'),
(5014, 2014, 3018, 'review', '2025-03-20 09:47:10'),
(5015, 2015, 3020, 'click', '2025-03-20 10:12:32'),
(5016, 2016, 3021, 'view', '2025-03-21 11:35:29'),
(5017, 2017, 3022, 'search', '2025-03-21 12:28:11'),
(5018, 2018, 3024, 'rating', '2025-03-21 14:00:18'),
(5019, 2019, 3025, 'view', '2025-03-22 09:20:45'),
(5020, 2020, 3028, 'favorite', '2025-03-22 10:45:37'),
(5021, 2021, 3030, 'review', '2025-03-23 11:15:22'),
(5022, 2022, 3031, 'search', '2025-03-23 13:10:41'),
(5023, 2023, 3033, 'click', '2025-03-23 15:00:32'),
(5024, 2024, 3035, 'view', '2025-03-24 10:42:56'),
(5025, 2025, 3036, 'rating', '2025-03-24 11:30:15'),
(5026, 2026, 3038, 'search', '2025-03-24 13:27:10'),
(5027, 2027, 3040, 'favorite', '2025-03-25 09:15:08'),
(5028, 2028, 3042, 'view', '2025-03-25 10:09:33'),
(5029, 2029, 3044, 'review', '2025-03-25 12:25:50'),
(5030, 2030, 3045, 'click', '2025-03-25 13:19:21'),
(5031, 2031, 3046, 'view', '2025-03-26 11:10:02'),
(5032, 2032, 3047, 'rating', '2025-03-26 12:25:44'),
(5033, 2033, 3048, 'favorite', '2025-03-26 13:35:27'),
(5034, 2034, 3049, 'view', '2025-03-27 09:47:11'),
(5035, 2035, 3050, 'search', '2025-03-27 10:19:30'),
(5036, 2036, 3051, 'review', '2025-03-27 11:42:58'),
(5037, 2037, 3052, 'click', '2025-03-28 10:55:19'),
(5038, 2038, 3054, 'view', '2025-03-28 11:40:07'),
(5039, 2039, 3056, 'rating', '2025-03-28 12:25:48'),
(5040, 2040, 3058, 'favorite', '2025-03-29 10:15:35'),
(5041, 2041, 3060, 'view', '2025-03-29 11:12:22'),
(5042, 2042, 3062, 'search', '2025-03-29 13:20:44'),
(5043, 2043, 3064, 'review', '2025-03-30 09:50:08'),
(5044, 2044, 3066, 'click', '2025-03-30 10:30:59'),
(5045, 2045, 3068, 'view', '2025-03-30 12:25:27'),
(5046, 2046, 3070, 'rating', '2025-03-31 09:40:14'),
(5047, 2047, 3072, 'favorite', '2025-03-31 11:12:03'),
(5048, 2048, 3074, 'review', '2025-03-31 12:30:50'),
(5049, 2049, 3076, 'click', '2025-04-01 10:14:11'),
(5050, 2050, 3078, 'view', '2025-04-01 11:42:08');


-- Table structure for table `useraddress`

DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `UserAddressID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `Label` varchar(100) DEFAULT NULL,
  `IsPrimary` tinyint(1) DEFAULT 0,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `useraddress` (`UserAddressID`, `UserID`, `AddressID`, `Label`, `IsPrimary`, `CreatedAt`) VALUES
(1, 2001, 1001, 'Clifton', 1, '2025-05-10 09:20:00'),
(2, 2002, 1002, 'DHA Phase 6', 1, '2025-05-11 12:30:00'),
(3, 2003, 1003, 'Gulshan-e-Iqbal', 1, '2025-05-11 14:45:00'),
(4, 2004, 1004, 'North Nazimabad', 1, '2025-05-12 09:00:00'),
(5, 2005, 1005, 'PECHS', 1, '2025-05-12 10:10:00'),
(6, 2006, 1006, 'Bahadurabad', 1, '2025-05-12 18:30:00'),
(7, 2007, 1007, 'Saddar', 1, '2025-05-13 11:45:00'),
(8, 2008, 1008, 'Nazimabad', 1, '2025-05-14 15:00:00'),
(9, 2009, 1009, 'Gulistan-e-Johar', 1, '2025-05-14 17:20:00'),
(10, 2010, 1010, 'Korangi', 1, '2025-05-15 10:30:00'),
(11, 2011, 1011, 'Malir Cantt', 1, '2025-05-15 13:00:00'),
(12, 2012, 1012, 'Nazimabad', 1, '2025-05-15 15:10:00'),
(13, 2013, 1013, 'Gulshan-e-Iqbal', 1, '2025-05-16 10:00:00'),
(14, 2014, 1014, 'Clifton', 1, '2025-05-16 12:45:00'),
(15, 2015, 1015, 'DHA Phase 5', 1, '2025-05-17 09:15:00'),
(16, 2016, 1016, 'North Karachi', 1, '2025-05-17 14:25:00'),
(17, 2017, 1017, 'PECHS', 1, '2025-05-18 11:50:00'),
(18, 2018, 1018, 'Gulshan-e-Maymar', 1, '2025-05-18 17:40:00'),
(19, 2019, 1019, 'Federal B Area', 1, '2025-05-19 08:50:00'),
(20, 2020, 1020, 'Korangi', 1, '2025-05-19 09:35:00'),
(21, 2021, 1021, 'Clifton', 1, '2025-05-20 10:40:00'),
(22, 2022, 1022, 'Gulistan-e-Johar', 1, '2025-05-20 12:00:00'),
(23, 2023, 1023, 'North Nazimabad', 1, '2025-05-21 09:00:00'),
(24, 2024, 1024, 'DHA Phase 2', 1, '2025-05-21 11:10:00'),
(25, 2025, 1025, 'Gulshan-e-Iqbal', 1, '2025-05-22 14:30:00'),
(26, 2026, 1026, 'Saddar', 1, '2025-05-22 17:00:00'),
(27, 2027, 1027, 'PECHS', 1, '2025-05-23 08:20:00'),
(28, 2028, 1028, 'North Karachi', 1, '2025-05-23 11:30:00'),
(29, 2029, 1029, 'Clifton', 1, '2025-05-24 09:45:00'),
(30, 2030, 1030, 'DHA Phase 8', 1, '2025-05-24 13:50:00'),
(31, 2031, 1031, 'Gulshan-e-Iqbal', 1, '2025-05-25 09:55:00'),
(32, 2032, 1032, 'Federal B Area', 1, '2025-05-25 12:25:00'),
(33, 2033, 1033, 'Korangi', 1, '2025-05-26 10:30:00'),
(34, 2034, 1034, 'Saddar', 1, '2025-05-26 14:50:00'),
(35, 2035, 1035, 'DHA Phase 6', 1, '2025-05-27 09:10:00'),
(36, 2036, 1036, 'Gulistan-e-Johar', 1, '2025-05-27 10:40:00'),
(37, 2037, 1037, 'Malir', 1, '2025-05-27 15:00:00'),
(38, 2038, 1038, 'Gulshan-e-Maymar', 1, '2025-05-28 09:25:00'),
(39, 2039, 1039, 'North Nazimabad', 1, '2025-05-28 10:50:00'),
(40, 2040, 1040, 'DHA Phase 5', 1, '2025-05-29 09:35:00'),
(41, 2041, 1041, 'Clifton', 1, '2025-05-29 12:15:00'),
(42, 2042, 1042, 'Gulistan-e-Johar', 1, '2025-05-30 08:30:00'),
(43, 2043, 1043, 'Nazimabad', 1, '2025-05-30 11:45:00'),
(44, 2044, 1044, 'PECHS', 1, '2025-05-30 13:00:00'),
(45, 2045, 1045, 'DHA Phase 7', 1, '2025-05-31 09:15:00'),
(46, 2046, 1046, 'North Karachi', 1, '2025-05-31 12:25:00'),
(47, 2047, 1047, 'Clifton', 1, '2025-06-01 09:30:00'),
(48, 2048, 1048, 'Saddar', 1, '2025-06-01 11:40:00'),
(49, 2049, 1049, 'Korangi', 1, '2025-06-02 09:50:00'),
(50, 2050, 1050, 'Gulshan-e-Iqbal', 1, '2025-06-02 10:30:00'),
(51, 2051, 1051, 'Federal B Area', 1, '2025-06-03 09:10:00'),
(52, 2052, 1052, 'Gulistan-e-Johar', 1, '2025-06-03 11:00:00');


-- Table structure for table `usersession`


DROP TABLE IF EXISTS `usersession`;
CREATE TABLE `usersession` (
  `SessionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Token` varchar(512) NOT NULL,
  `ExpiresAt` datetime NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `IsRevoked` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `usersession` (`SessionID`, `UserID`, `Token`, `ExpiresAt`, `CreatedAt`, `IsRevoked`) VALUES
(1, 2001, 'session2001_token', '2025-11-24 12:15:00', '2025-11-09 12:15:00', 0),
(2, 2002, 'session2002_token', '2025-11-25 09:42:00', '2025-11-10 09:42:00', 0),
(3, 2003, 'session2003_token', '2025-11-26 15:31:00', '2025-11-11 15:31:00', 0),
(4, 2004, 'session2004_token', '2025-11-27 11:10:00', '2025-11-12 11:10:00', 0),
(5, 2005, 'session2005_token', '2025-11-20 13:45:00', '2025-11-05 13:45:00', 1),
(6, 2006, 'session2006_token', '2025-11-22 14:20:00', '2025-11-07 14:20:00', 0),
(7, 2007, 'session2007_token', '2025-11-28 19:10:00', '2025-11-13 19:10:00', 0),
(8, 2008, 'session2008_token', '2025-11-29 10:00:00', '2025-11-14 10:00:00', 0),
(9, 2009, 'session2009_token', '2025-11-30 08:45:00', '2025-11-15 08:45:00', 0),
(10, 2010, 'session2010_token', '2025-12-01 17:22:00', '2025-11-16 17:22:00', 0),
(11, 2011, 'session2011_token', '2025-11-26 09:40:00', '2025-11-11 09:40:00', 1),
(12, 2012, 'session2012_token', '2025-11-25 12:00:00', '2025-11-10 12:00:00', 0),
(13, 2013, 'session2013_token', '2025-11-28 15:30:00', '2025-11-13 15:30:00', 0),
(14, 2014, 'session2014_token', '2025-12-02 18:00:00', '2025-11-17 18:00:00', 0),
(15, 2015, 'session2015_token', '2025-12-03 19:50:00', '2025-11-18 19:50:00', 0),
(16, 2016, 'session2016_token', '2025-12-04 14:10:00', '2025-11-19 14:10:00', 0),
(17, 2017, 'session2017_token', '2025-11-27 11:20:00', '2025-11-12 11:20:00', 1),
(18, 2018, 'session2018_token', '2025-12-05 09:05:00', '2025-11-20 09:05:00', 0),
(19, 2019, 'session2019_token', '2025-12-06 10:45:00', '2025-11-21 10:45:00', 0),
(20, 2020, 'session2020_token', '2025-12-07 11:15:00', '2025-11-22 11:15:00', 0),
(21, 2021, 'session2021_token', '2025-12-08 12:40:00', '2025-11-23 12:40:00', 0),
(22, 2022, 'session2022_token', '2025-11-29 09:35:00', '2025-11-14 09:35:00', 1),
(23, 2023, 'session2023_token', '2025-12-09 13:15:00', '2025-11-24 13:15:00', 0),
(24, 2024, 'session2024_token', '2025-12-10 14:30:00', '2025-11-25 14:30:00', 0),
(25, 2025, 'session2025_token', '2025-12-11 16:00:00', '2025-11-26 16:00:00', 0),
(26, 2026, 'session2026_token', '2025-12-12 17:10:00', '2025-11-27 17:10:00', 0),
(27, 2027, 'session2027_token', '2025-12-13 10:00:00', '2025-11-28 10:00:00', 0),
(28, 2028, 'session2028_token', '2025-12-14 09:45:00', '2025-11-29 09:45:00', 0),
(29, 2029, 'session2029_token', '2025-12-15 08:50:00', '2025-11-30 08:50:00', 0),
(30, 2030, 'session2030_token', '2025-12-16 09:00:00', '2025-12-01 09:00:00', 0),
(31, 2031, 'session2031_token', '2025-12-17 15:00:00', '2025-12-02 15:00:00', 0),
(32, 2032, 'session2032_token', '2025-12-18 10:15:00', '2025-12-03 10:15:00', 0),
(33, 2033, 'session2033_token', '2025-12-19 11:30:00', '2025-12-04 11:30:00', 0),
(34, 2034, 'session2034_token', '2025-12-20 12:40:00', '2025-12-05 12:40:00', 0),
(35, 2035, 'session2035_token', '2025-12-21 13:25:00', '2025-12-06 13:25:00', 0),
(36, 2036, 'session2036_token', '2025-12-22 14:50:00', '2025-12-07 14:50:00', 0),
(37, 2037, 'session2037_token', '2025-12-23 15:15:00', '2025-12-08 15:15:00', 0),
(38, 2038, 'session2038_token', '2025-12-24 10:20:00', '2025-12-09 10:20:00', 0),
(39, 2039, 'session2039_token', '2025-12-25 11:45:00', '2025-12-10 11:45:00', 0),
(40, 2040, 'session2040_token', '2025-12-26 12:15:00', '2025-12-11 12:15:00', 0),
(41, 2041, 'session2041_token', '2025-12-27 14:10:00', '2025-12-12 14:10:00', 0),
(42, 2042, 'session2042_token', '2025-12-28 15:30:00', '2025-12-13 15:30:00', 0),
(43, 2043, 'session2043_token', '2025-12-29 16:10:00', '2025-12-14 16:10:00', 0),
(44, 2044, 'session2044_token', '2025-12-30 17:25:00', '2025-12-15 17:25:00', 0),
(45, 2045, 'session2045_token', '2025-12-31 18:45:00', '2025-12-16 18:45:00', 0),
(46, 2046, 'session2046_token', '2026-01-01 09:10:00', '2025-12-17 09:10:00', 0),
(47, 2047, 'session2047_token', '2026-01-02 10:40:00', '2025-12-18 10:40:00', 0),
(48, 2048, 'session2048_token', '2026-01-03 11:30:00', '2025-12-19 11:30:00', 0),
(49, 2049, 'session2049_token', '2026-01-04 12:15:00', '2025-12-20 12:15:00', 0),
(50, 2050, 'session2050_token', '2026-01-05 13:10:00', '2025-12-21 13:10:00', 0),
(51, 2051, 'session2051_token', '2026-01-06 14:20:00', '2025-12-22 14:20:00', 0),
(52, 2052, 'session2052_token', '2026-01-07 15:35:00', '2025-12-23 15:35:00', 0);

-- Table structure for table `reservation`
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `RestaurantID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TableID` int(11) DEFAULT NULL,
  `GuestCount` smallint(6) NOT NULL DEFAULT 1,
  `ReservationTime` datetime NOT NULL,
  `Status` enum('Pending','Confirmed','Cancelled','NoShow') DEFAULT 'Pending',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `Notes` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `reservation` (`ReservationID`, `RestaurantID`, `UserID`, `TableID`, `GuestCount`, `ReservationTime`, `Status`, `CreatedAt`, `Notes`) VALUES
(8001, 3001, 2001, 7101, 2, '2025-11-15 19:00:00', 'Confirmed', '2025-11-01 12:00:00', 'Birthday celebration'),
(8002, 3001, 2002, 7102, 4, '2025-11-16 20:30:00', 'Pending', '2025-11-02 09:15:00', NULL),
(8003, 3002, 2003, 7201, 3, '2025-11-17 18:45:00', 'Cancelled', '2025-11-03 14:20:00', 'Late arrival'),
(8004, 3002, 2004, 7202, 5, '2025-11-18 19:30:00', 'Confirmed', '2025-11-04 16:35:00', 'Window seat requested'),
(8005, 3003, 2005, 7301, 2, '2025-11-19 20:00:00', 'NoShow', '2025-11-05 11:10:00', NULL),
(8006, 3003, 2006, 7302, 6, '2025-11-20 21:15:00', 'Pending', '2025-11-06 12:45:00', 'Anniversary dinner'),
(8007, 3004, 2007, 7401, 3, '2025-11-21 19:45:00', 'Confirmed', '2025-11-07 13:30:00', NULL),
(8008, 3004, 2008, 7402, 4, '2025-11-22 18:30:00', 'Pending', '2025-11-08 15:50:00', 'High chair needed'),
(8009, 3005, 2009, 7501, 2, '2025-11-23 20:00:00', 'Confirmed', '2025-11-09 10:25:00', 'Vegan menu requested'),
(8010, 3005, 2010, 7502, 5, '2025-11-24 19:15:00', 'Cancelled', '2025-11-10 14:10:00', 'Birthday cake requested'),
(8011, 3001, 2011, 7103, 2, '2025-11-25 19:00:00', 'Confirmed', '2025-11-01 12:30:00', 'Birthday celebration'),
(8012, 3001, 2012, 7104, 4, '2025-11-26 20:30:00', 'Pending', '2025-11-02 09:45:00', 'Near window'),
(8013, 3002, 2013, 7203, 3, '2025-11-27 18:45:00', 'Cancelled', '2025-11-03 14:50:00', 'Late arrival'),
(8014, 3002, 2014, 7204, 5, '2025-11-28 19:30:00', 'Confirmed', '2025-11-04 16:55:00', NULL),
(8015, 3003, 2015, 7303, 2, '2025-11-29 20:00:00', 'NoShow', '2025-11-05 11:30:00', 'Vegan meal requested'),
(8016, 3003, 2016, 7304, 6, '2025-11-30 21:15:00', 'Pending', '2025-11-06 12:55:00', 'Anniversary dinner'),
(8017, 3004, 2017, 7403, 3, '2025-12-01 19:45:00', 'Confirmed', '2025-11-07 13:50:00', NULL),
(8018, 3004, 2018, 7404, 4, '2025-12-02 18:30:00', 'Pending', '2025-11-08 16:10:00', 'High chair needed'),
(8019, 3005, 2019, 7503, 2, '2025-12-03 20:00:00', 'Confirmed', '2025-11-09 10:50:00', 'Vegan menu requested'),
(8020, 3005, 2020, 7504, 5, '2025-12-04 19:15:00', 'Cancelled', '2025-11-10 14:40:00', 'Birthday cake requested'),
(8021, 3006, 2021, 7403, 3, '2025-12-05 19:30:00', 'Confirmed', '2025-11-11 09:20:00', NULL),
(8022, 3006, 2022, 7405, 4, '2025-12-06 20:45:00', 'Pending', '2025-11-12 11:35:00', 'Window seat preferred'),
(8023, 3007, 2023, 7406, 2, '2025-12-07 18:15:00', 'NoShow', '2025-11-13 10:50:00', NULL),
(8024, 3007, 2024, 7407, 6, '2025-12-08 21:00:00', 'Confirmed', '2025-11-14 12:05:00', 'Anniversary'),
(8025, 3008, 2025, 7408, 3, '2025-12-09 19:00:00', 'Confirmed', '2025-11-15 13:25:00', 'Vegan options'),
(8026, 3008, 2026, 7409, 4, '2025-12-10 20:30:00', 'Pending', '2025-11-16 15:40:00', NULL),
(8027, 3009, 2027, 7410, 2, '2025-12-11 18:45:00', 'Cancelled', '2025-11-17 14:50:00', 'Late arrival'),
(8028, 3009, 2028, 7411, 5, '2025-12-12 19:30:00', 'Confirmed', '2025-11-18 16:55:00', NULL),
(8029, 3010, 2029, 7412 , 3, '2025-12-13 20:00:00', 'NoShow', '2025-11-19 11:30:00', 'Anniversary'),
(8030, 3010, 2030, 7413, 6, '2025-12-14 21:15:00', 'Pending', '2025-11-20 12:55:00', 'Birthday dinner'),
(8031, 3011, 2031, 7414, 2, '2025-12-15 19:45:00', 'Confirmed', '2025-11-21 13:50:00', 'Window seat requested'),
(8032, 3011, 2032, 7415, 4, '2025-12-16 18:30:00', 'Pending', '2025-11-22 16:10:00', NULL),
(8033, 3012, 2033, 7416, 2, '2025-12-17 20:00:00', 'Confirmed', '2025-11-23 10:50:00', 'Vegan menu'),
(8034, 3012, 2034, 7417, 5, '2025-12-18 19:15:00', 'Cancelled', '2025-11-24 14:40:00', NULL),
(8035, 3013, 2035, 7418, 3, '2025-12-19 19:30:00', 'Confirmed', '2025-11-25 09:20:00', 'Birthday celebration'),
(8036, 3013, 2036, 7419, 4, '2025-12-20 20:45:00', 'Pending', '2025-11-26 11:35:00', NULL),
(8037, 3014, 2037, 7420, 2, '2025-12-21 18:15:00', 'NoShow', '2025-11-27 10:50:00', 'Late arrival'),
(8038, 3014, 2038, 7421, 6, '2025-12-22 21:00:00', 'Confirmed', '2025-11-28 12:05:00', 'Anniversary dinner'),
(8039, 3015, 2039, 7422, 3, '2025-12-23 19:00:00', 'Confirmed', '2025-11-29 13:25:00', 'Special request'),
(8040, 3015, 2040, 7423, 4, '2025-12-24 20:30:00', 'Pending', '2025-11-30 15:40:00', NULL),
(8041, 3041, 2041, 7424, 2, '2025-12-25 19:00:00', 'Confirmed', '2025-12-01 12:30:00', 'Birthday dinner'),
(8042, 3041, 2042, 7425, 4, '2025-12-26 20:30:00', 'Pending', '2025-12-02 09:45:00', 'Window seat requested'),
(8043, 3042, 2043, 7426, 3, '2025-12-27 18:45:00', 'Cancelled', '2025-12-03 14:50:00', 'Late arrival'),
(8044, 3042, 2044, 7427, 5, '2025-12-28 19:30:00', 'Confirmed', '2025-12-04 16:55:00', NULL),
(8045, 3043, 2045, 7428, 2, '2025-12-29 20:00:00', 'NoShow', '2025-12-05 11:30:00', 'Vegan options requested'),
(8046, 3043, 2046, 7429, 6, '2025-12-30 21:15:00', 'Pending', '2025-12-06 12:55:00', 'Anniversary dinner'),
(8047, 3044, 2047, 7430, 3, '2025-12-31 19:45:00', 'Confirmed', '2025-12-07 13:50:00', NULL),
(8048, 3044, 2048, 7431, 4, '2026-01-01 18:30:00', 'Pending', '2025-12-08 16:10:00', 'High chair needed'),
(8049, 3045, 2049, 7432, 2, '2026-01-02 20:00:00', 'Confirmed', '2025-12-09 10:50:00', 'Vegan menu requested'),
(8050, 3045, 2050, 7433, 5, '2026-01-03 19:15:00', 'Cancelled', '2025-12-10 14:40:00', 'Birthday cake requested'),
(8051, 3046, 2051, 7434, 3, '2026-01-04 19:30:00', 'Confirmed', '2025-12-11 09:20:00', NULL),
(8052, 3046, 2052, 7435, 4, '2026-01-05 20:45:00', 'Pending', '2025-12-12 11:35:00', 'Window seat preferred'),
(8053, 3047, 2001, 7436, 2, '2026-01-06 18:15:00', 'NoShow', '2025-12-13 10:50:00', NULL),
(8054, 3047, 2002, 7437, 6, '2026-01-07 21:00:00', 'Confirmed', '2025-12-14 12:05:00', 'Anniversary dinner'),
(8055, 3048, 2003, 7438, 3, '2026-01-08 19:00:00', 'Confirmed', '2025-12-15 13:25:00', 'Vegan options requested'),
(8056, 3048, 2004, 7439, 4, '2026-01-09 20:30:00', 'Pending', '2025-12-16 15:40:00', NULL),
(8057, 3049, 2005, 7440, 2, '2026-01-10 18:45:00', 'Cancelled', '2025-12-17 14:50:00', 'Late arrival'),
(8058, 3049, 2006, 7441, 5, '2026-01-11 19:30:00', 'Confirmed', '2025-12-18 16:55:00', NULL),
(8059, 3050, 2008, 7442, 3, '2026-01-12 20:00:00', 'NoShow', '2025-12-19 11:30:00', 'Anniversary celebration'),
(8060, 3050, 2009, 7443, 6, '2026-01-13 21:15:00', 'Pending', '2025-12-20 12:55:00', 'Birthday dinner'),
(8061, 3051, 2010, 7444, 2, '2026-01-14 19:45:00', 'Confirmed', '2025-12-21 13:50:00', 'Window seat requested'),
(8062, 3051, 2011, 7445, 4, '2026-01-15 18:30:00', 'Pending', '2025-12-22 16:10:00', NULL),
(8063, 3052, 2012, 7446, 2, '2026-01-16 20:00:00', 'Confirmed', '2025-12-23 10:50:00', 'Vegan menu requested'),
(8064, 3052, 2013, 7447, 5, '2026-01-17 19:15:00', 'Cancelled', '2025-12-24 14:40:00', NULL),
(8065, 3053, 2014, 7448, 3, '2026-01-18 19:30:00', 'Confirmed', '2025-12-25 09:20:00', 'Birthday celebration'),
(8066, 3053, 2015, 7449, 4, '2026-01-19 20:45:00', 'Pending', '2025-12-26 11:35:00', NULL),
(8067, 3054, 2016, 7450, 2, '2026-01-20 18:15:00', 'NoShow', '2025-12-27 10:50:00', 'Late arrival'),
(8068, 3054, 2017, 7451, 6, '2026-01-21 21:00:00', 'Confirmed', '2025-12-28 12:05:00', 'Anniversary dinner'),
(8069, 3055, 2018, 7452, 3, '2026-01-22 19:00:00', 'Confirmed', '2025-12-29 13:25:00', 'Special request'),
(8070, 3055, 2019, 7453, 4, '2026-01-23 20:30:00', 'Pending', '2025-12-30 15:40:00', NULL),
(8071, 3056, 2020, 7454, 2, '2026-01-24 18:45:00', 'Cancelled', '2025-12-31 14:50:00', 'Late arrival'),
(8072, 3056, 2021, 7455, 5, '2026-01-25 19:30:00', 'Confirmed', '2026-01-01 16:55:00', NULL),
(8073, 3057, 2022, 7456, 3, '2026-01-26 20:00:00', 'NoShow', '2026-01-02 11:30:00', 'Anniversary celebration'),
(8074, 3057, 2023, 7457, 6, '2026-01-27 21:15:00', 'Pending', '2026-01-03 12:55:00', 'Birthday dinner'),
(8075, 3058, 2024, 7458, 2, '2026-01-28 19:45:00', 'Confirmed', '2026-01-04 13:50:00', 'Window seat requested'),
(8076, 3058, 2025, 7459, 4, '2026-01-29 18:30:00', 'Pending', '2026-01-05 16:10:00', NULL),
(8077, 3081, 2026, 7460, 3, '2026-01-30 19:00:00', 'Confirmed', '2026-01-06 12:30:00', 'Birthday celebration'),
(8078, 3081, 2027, 7461, 5, '2026-01-31 20:30:00', 'Pending', '2026-01-07 14:50:00', 'Window seat preferred'),
(8079, 3082, 2028, 7462, 2, '2026-02-01 18:45:00', 'Cancelled', '2026-01-08 11:20:00', 'Late arrival'),
(8080, 3082, 2029, 7463, 4, '2026-02-02 19:30:00', 'Confirmed', '2026-01-09 13:10:00', NULL),
(8081, 3083, 2030, 7464, 3, '2026-02-03 20:00:00', 'NoShow', '2026-01-10 10:45:00', 'Vegan menu requested'),
(8082, 3083, 2031, 7465, 6, '2026-02-04 21:15:00', 'Pending', '2026-01-11 12:30:00', 'Anniversary dinner'),
(8083, 3084, 2032, 7466, 2, '2026-02-05 19:45:00', 'Confirmed', '2026-01-12 13:25:00', NULL),
(8084, 3084, 2033, 7467, 4, '2026-02-06 18:30:00', 'Pending', '2026-01-13 15:40:00', 'High chair needed'),
(8085, 3085, 2034, 7468, 3, '2026-02-07 20:00:00', 'Confirmed', '2026-01-14 11:15:00', 'Birthday dinner'),
(8086, 3085, 2035, 7469, 5, '2026-02-08 19:15:00', 'Cancelled', '2026-01-15 14:50:00', NULL),
(8087, 3086, 2036, 7470, 2, '2026-02-09 19:30:00', 'Confirmed', '2026-01-16 10:20:00', 'Window seat requested'),
(8088, 3086, 2037, 7471, 4, '2026-02-10 20:45:00', 'Pending', '2026-01-17 12:35:00', NULL),
(8089, 3087, 2038, 7472, 3, '2026-02-11 18:15:00', 'NoShow', '2026-01-18 11:50:00', 'Late arrival'),
(8090, 3087, 2039, 7473, 6, '2026-02-12 21:00:00', 'Confirmed', '2026-01-19 13:05:00', 'Anniversary dinner'),
(8091, 3088, 2040, 7474, 2, '2026-02-13 19:00:00', 'Confirmed', '2026-01-20 14:20:00', NULL),
(8092, 3088, 2041, 7475, 4, '2026-02-14 20:30:00', 'Pending', '2026-01-21 15:40:00', 'Vegan options requested'),
(8093, 3089, 2042, 7476, 3, '2026-02-15 18:45:00', 'Cancelled', '2026-01-22 10:50:00', NULL),
(8094, 3089, 2043, 7477, 5, '2026-02-16 19:30:00', 'Confirmed', '2026-01-23 13:55:00', 'Birthday cake requested'),
(8095, 3090, 2044, 7478, 2, '2026-02-17 20:00:00', 'NoShow', '2026-01-24 11:30:00', 'Late arrival'),
(8096, 3090, 2045, 7479, 6, '2026-02-18 21:15:00', 'Pending', '2026-01-25 12:55:00', 'Anniversary dinner'),
(8097, 3091, 2046, 7480, 3, '2026-02-19 19:45:00', 'Confirmed', '2026-01-26 13:50:00', NULL),
(8098, 3091, 2048, 7481, 4, '2026-02-20 18:30:00', 'Pending', '2026-01-27 16:10:00', 'Window seat preferred'),
(8099, 3092, 2049, 7482, 2, '2026-02-21 20:00:00', 'Confirmed', '2026-01-28 10:50:00', 'Vegan menu requested'),
(8100, 3092, 2050, 7483, 5, '2026-02-22 19:15:00', 'Cancelled', '2026-01-29 14:40:00', NULL);

-- --------------------------------------------------------

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `City` (`City`),
  ADD KEY `Area` (`Area`);

--
-- Indexes for table `cuisine`
--
ALTER TABLE `cuisine`
  ADD PRIMARY KEY (`CuisineID`),
  ADD UNIQUE KEY `CuisineType` (`CuisineType`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`FavoriteID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`RestaurantID`),
  ADD KEY `fk_fav_rest` (`RestaurantID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuID`),
  ADD KEY `fk_menu_rest` (`RestaurantID`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`MenuItemID`),
  ADD KEY `fk_menuitem_menu` (`MenuID`),
  ADD KEY `Name` (`Name`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`PhotoID`),
  ADD KEY `fk_photo_review` (`ReviewID`),
  ADD KEY `RestaurantID` (`RestaurantID`),
  ADD KEY `UploadedByUserId` (`UploadedByUserId`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`PromotionID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `RestaurantID` (`RestaurantID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `fk_res_table` (`TableID`),
  ADD KEY `RestaurantID` (`RestaurantID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ReservationTime` (`ReservationTime`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`RestaurantID`),
  ADD KEY `fk_restaurant_address` (`AddressID`),
  ADD KEY `fk_restaurant_parent` (`ParentRestaurantID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `restaurantcuisine`
--
ALTER TABLE `restaurantcuisine`
  ADD PRIMARY KEY (`RestaurantID`,`CuisineID`),
  ADD KEY `fk_rc_cuisine` (`CuisineID`);

--
-- Indexes for table `restaurantopeninghours`
--
ALTER TABLE `restaurantopeninghours`
  ADD PRIMARY KEY (`OpeningID`),
  ADD UNIQUE KEY `RestaurantID` (`RestaurantID`,`DayOfWeek`,`OpenTime`,`CloseTime`);

--
-- Indexes for table `restauranttable`
--
ALTER TABLE `restauranttable`
  ADD PRIMARY KEY (`TableID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `RestaurantID` (`RestaurantID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `ContactNo` (`ContactNo`),
  ADD KEY `Email_2` (`Email`),
  ADD KEY `ContactNo_2` (`ContactNo`);

--
-- Indexes for table `useractivity`
--
ALTER TABLE `useractivity`
  ADD PRIMARY KEY (`ActivityID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `RestaurantID` (`RestaurantID`);

--
-- Indexes for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD PRIMARY KEY (`UserAddressID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`AddressID`),
  ADD KEY `UserID_2` (`UserID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- Indexes for table `usersession`
--
ALTER TABLE `usersession`
  ADD PRIMARY KEY (`SessionID`),
  ADD KEY `UserID` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4051;

--
-- AUTO_INCREMENT for table `cuisine`
--
ALTER TABLE `cuisine`
  MODIFY `CuisineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `FavoriteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `MenuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5065;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `MenuItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6375;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `PhotoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `PromotionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `RatingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11881;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `RestaurantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3051;

--
-- AUTO_INCREMENT for table `restaurantopeninghours`
--
ALTER TABLE `restaurantopeninghours`
  MODIFY `OpeningID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restauranttable`
--
ALTER TABLE `restauranttable`
  MODIFY `TableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7345;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10573;

--
-- AUTO_INCREMENT for table `useraccount`
--
ALTER TABLE `useraccount`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2101;

--
-- AUTO_INCREMENT for table `useractivity`
--
ALTER TABLE `useractivity`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `useraddress`
--
ALTER TABLE `useraddress`
  MODIFY `UserAddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `usersession`
--
ALTER TABLE `usersession`
  MODIFY `SessionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `fk_fav_rest` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_fav_user` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_rest` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE;

--
-- Constraints for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD CONSTRAINT `fk_menuitem_menu` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`) ON DELETE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_photo_review` FOREIGN KEY (`ReviewID`) REFERENCES `review` (`ReviewID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_photo_user` FOREIGN KEY (`UploadedByUserId`) REFERENCES `useraccount` (`Id`) ON DELETE SET NULL;

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rating_user` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation`
--
-- Step 1: Temporarily allow NULL for TableID
ALTER TABLE reservation MODIFY TableID int(11) NULL;

-- Step 2: Fix invalid TableID values
UPDATE reservation
SET TableID = NULL
WHERE TableID IS NOT NULL
  AND TableID NOT IN (SELECT TableID FROM restauranttable);

-- Step 3: Add foreign key constraints (reservation)
ALTER TABLE reservation
  ADD CONSTRAINT fk_res_rest FOREIGN KEY (RestaurantID) REFERENCES restaurant(RestaurantID) ON DELETE CASCADE,
  ADD CONSTRAINT fk_res_table FOREIGN KEY (TableID) REFERENCES restauranttable(TableID),
  ADD CONSTRAINT fk_res_user FOREIGN KEY (UserID) REFERENCES useraccount(Id) ON DELETE CASCADE;

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `fk_restaurant_address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_restaurant_owner` FOREIGN KEY (`Owner_ID`) REFERENCES `useraccount` (`Id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_restaurant_parent` FOREIGN KEY (`ParentRestaurantID`) REFERENCES `restaurant` (`RestaurantID`);

--
-- Constraints for table `restaurantcuisine`
--
ALTER TABLE `restaurantcuisine`
  ADD CONSTRAINT `fk_rc_cuisine` FOREIGN KEY (`CuisineID`) REFERENCES `cuisine` (`CuisineID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rc_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE;

--
-- Constraints for table `restaurantopeninghours`
--
ALTER TABLE `restaurantopeninghours`
  ADD CONSTRAINT `fk_openings_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE;

--
-- Constraints for table `restauranttable`
--
ALTER TABLE `restauranttable`
  ADD CONSTRAINT `restauranttable_ibfk_1` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_review_user` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `useractivity`
--
ALTER TABLE `useractivity`
  ADD CONSTRAINT `useractivity_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`Id`),
  ADD CONSTRAINT `useractivity_ibfk_2` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`);

--
-- Constraints for table `useraddress`
--
ALTER TABLE `useraddress`
  ADD CONSTRAINT `fk_useraddress_address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_useraddress_user` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `usersession`
--
ALTER TABLE `usersession`
  ADD CONSTRAINT `usersession_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `useraccount` (`Id`) ON DELETE CASCADE;
COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
