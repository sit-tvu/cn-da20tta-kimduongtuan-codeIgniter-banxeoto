-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 10:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websellcar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`account`, `password`, `fullname`, `address`, `email`, `status`, `phone`) VALUES
('Admin', '202cb962ac59075b964b07152d234b70', 'Kim Dương Tuấn', 'Trà Vinh', 'Admin@gmail.com', '1', '0911096648');

-- --------------------------------------------------------

--
-- Table structure for table `automaker`
--

CREATE TABLE `automaker` (
  `autoMakerID` int(11) NOT NULL,
  `autoMakerName` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `slug` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `automaker`
--

INSERT INTO `automaker` (`autoMakerID`, `autoMakerName`, `status`, `slug`) VALUES
(1, 'Mazda', 1, 'mazda'),
(2, 'Toyota', 1, 'toyota'),
(3, 'Mercedes benz', 1, 'mercedes-benz'),
(4, 'Lexus', 1, 'lexus'),
(5, 'Ford', 1, 'ford');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoriesID` int(11) NOT NULL,
  `categoriesName` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `slug` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoriesID`, `categoriesName`, `status`, `slug`) VALUES
(1, 'Sedan', 1, 'sedan'),
(2, 'Hatchback', 1, 'hatchback'),
(3, 'SUV – xe thể thao đa dụng', 1, 'suv-xe-the-thao-da-dung'),
(4, 'Crossover (CUV)', 1, 'crossover-cuv'),
(5, 'Coupe – xe thể thao', 1, 'coupe-xe-the-thao'),
(6, 'Pickup – xe bán tải', 1, 'pickup-xe-ban-tai');

-- --------------------------------------------------------

--
-- Table structure for table `newsdetail`
--

CREATE TABLE `newsdetail` (
  `newsDetailID` int(11) NOT NULL,
  `newsDetailHeading` varchar(255) NOT NULL,
  `descriptionDetail` varchar(255) DEFAULT NULL,
  `newsDetailIMG` varchar(255) DEFAULT NULL,
  `newsID` int(11) NOT NULL,
  `create_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newslist`
--

CREATE TABLE `newslist` (
  `newsID` int(11) NOT NULL,
  `newsHeading` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `thumnail` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `shippingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderID`, `order_code`, `status`, `shippingID`) VALUES
(4, '90540', 3, 6),
(7, '22362', 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderDetailID` int(11) NOT NULL,
  `orderCode` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productCarID` int(11) NOT NULL,
  `orderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`orderDetailID`, `orderCode`, `quantity`, `productCarID`, `orderID`) VALUES
(1, '90540', 3, 1, NULL),
(4, '22362', 10, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productcar`
--

CREATE TABLE `productcar` (
  `productCarID` int(11) NOT NULL,
  `productCarName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `thumnail` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `create_at` varchar(255) DEFAULT NULL,
  `update_at` varchar(255) DEFAULT NULL,
  `deleted` smallint(6) DEFAULT NULL,
  `autoMakerID` int(11) NOT NULL,
  `categoriesID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productcar`
--

INSERT INTO `productcar` (`productCarID`, `productCarName`, `description`, `price`, `thumnail`, `slug`, `create_at`, `update_at`, `deleted`, `autoMakerID`, `categoriesID`, `status`) VALUES
(1, 'Toyota Camry 2.5Q', 'Toyota Camry 2.5Q 2022 là phiên bản cao cấp với mức giá đắt hơn khá nhiều so với 2.0G. Chính vì thế, xe được trang bị hàng loạt những công nghệ hàng đầu hiện nay bên cạnh những phẩm chất đã làm nên tên tuổi của dòng xe này.', '1000000000', '1703402468cac-dong-xe-toyota-27.jpg', 'toyota-camry-25q', '2023-02-22', NULL, NULL, 2, 1, 1),
(2, 'Lexus ES 250', 'Lexus ES 250 là một mẫu sedan hạng sang của thương hiệu xe Nhật Bản Lexus, được giới thiệu vào năm 2018. Đây là phiên bản nâng cấp của Lexus ES 200 và có sự khác biệt về động cơ và trang bị. Ngoài ra, xe còn được trang bị các tính năng tiện nghi cao cấp n', '2590000000', '1703579271Lexus-ES-1_red.jpg', 'lexus-es-250', '2023-12-12', NULL, NULL, 4, 1, 1),
(3, 'Lexus ES 300h', 'Lexus ES 300h là mẫu sedan hạng sang sử dụng động cơ hybrid của hãng xe Nhật Bản Lexus, được giới thiệu lần đầu tiên vào năm 2012. Hiện nay, Lexus ES 300h đã có mặt tại Việt Nam cũng như nhiều nước trên thế giới.Ở nước ngoài, Lexus ES 300h cũng được bán r', '3000000000', '1703579746lexus-es300h-13.jpg', 'lexus-es-300h', '2024-01-01', NULL, NULL, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productcardetail`
--

CREATE TABLE `productcardetail` (
  `productCarDetailID` int(11) NOT NULL,
  `productCarDetailName` varchar(255) NOT NULL,
  `productCarDetailTextEngine` varchar(800) DEFAULT NULL,
  `productCarDetailTextInterio` varchar(800) DEFAULT NULL,
  `productCarDetailTextTechniques` varchar(800) DEFAULT NULL,
  `images` varchar(500) DEFAULT NULL,
  `productCarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productcardetail`
--

INSERT INTO `productcardetail` (`productCarDetailID`, `productCarDetailName`, `productCarDetailTextEngine`, `productCarDetailTextInterio`, `productCarDetailTextTechniques`, `images`, `productCarID`) VALUES
(1, 'TOYOTA CAMRY 2.5Q', 'Đây là hạng mục mà xe không có quá nhiều sự cải tiến khi vẫn sử dụng động cơ 2AR-FE, 16 van DOHC, VVT-i, sản sinh công suất sản sinh công suất 178 mã lực tại 6.000 vòng/phút, mô-men xoắn cực đại 235 Nm tại 4.100 vòng/phút. Hệ thống động cơ này đi kèm hộp số tự động 6 cấp. Ngoài ra, xe còn được trang bị 03 chế độ lái là ECO (tiết kiệm), Normal (thông thường) và Sport (thể thao) nhằm thỏa mãn nhu cầu cá nhân của từng khách hàng. Bộ lốp thay đổi thành 235/45R18 có khả năng bám đường tốt hơn.', 'Sở hữu chiều dài trục cơ sở 2825 mm (Tăng 50 mm so với thế hệ trước), Toyota Camry 2.5Q 2022 đã rộng rãi nay càng rộng rãi hơn, chưa kể đến việc tự do chọn nội thất màu be hoặc đen tùy thích thay vì gắn chặt theo từng biến thể như trước đây. Lưới tản nhiệt phía trước cong và hẹp, kết hợp với hốc gió thấp và rộng bên dưới. Hiệu ứng của lưới tản nhiệt phía trên, kết hợp đèn pha mỏng và logo Toyota khiến xe nổi bật lên dáng vẻ trọng tâm rộng, thấp.Nhìn từ bên hông, Xe ô tô Toyota Camry 2.5Q 2022 khỏe khoắn và mạnh mẽ với những đường gân chạy dọc. Gương chiếu hậu hiện đại khi không chỉ chỉnh điện và tích hợp báo rẽ thông thường mà còn gập điện tự động, chống bám nước, nhớ 2 vị trí và tự động điều chỉnh khi lùi.', 'Là phiên bản cao cấp nên điều dễ hiểu là Toyota Camry bản 2.5Q được trang bị hàng loạt tiện nghi hiện đại như: Hệ thống dẫn đường lần đầu tiên được trang bị trên Camry 2.5Q mang đến cảm giác tự tin, an tâm cho người lái trên những lộ trình mới lạ. Tiếp theo là cửa sổ trời giúp hành khách trên xe dễ dàng hòa mình vào không gian thoáng đãng trong lành trong các hành trình. Hệ thống âm thanh JBL 9 loa với công nghệ Clari-Fi đem đến chất lượng âm thanh cao cấp “rót mật vào tai” hành khách, cũng như sự tiện lợi với bảng điều khiển cho cả hàng ghế sau. Xe còn sở hữu hệ thống điều hòa tự động 3 vùng độc lập có cửa gió sau với khả năng làm mát khoang nội thất nhanh, mạnh và sâu. Ngoài ra, hầu hết các tiện nghi thường thấy đều xuất hiện trên chiếc Toyota Camry 2.5Q 2022 này. Đáng chú ý là tính năng', '1703402704cac-dong-xe-toyota-27.jpg', 1),
(2, 'Lexus ES 250', 'Tên xe\r\n\r\nLexus ES 250 2021\r\n\r\nSố chỗ ngồi\r\n\r\n5\r\n\r\nKiểu xe\r\n\r\nSedan\r\n\r\nXuất xứ\r\n\r\nNhập khẩu nguyên chiếc từ Nhật Bản\r\n\r\nKích thước DxRxC (mm)\r\n\r\n4.975 x 1.865 x 1.445\r\n\r\nChiều dài cơ sở (mm)\r\n\r\n2.870 mm\r\n\r\nĐộng cơ\r\n\r\nI4 2.5L\r\n\r\nDung tích công tác\r\n\r\n2.5L\r\n\r\nLoại nhiên liệu\r\n\r\nXăng\r\n\r\nCông suất cực đại (hp)\r\n\r\n210\r\n\r\nMô-men xoắn cực đại (Nm)\r\n\r\n335\r\n\r\nHộp số\r\n\r\nTự động 8 cấp\r\n\r\nHệ dẫn động\r\n\r\nCầu trước\r\n\r\nTreo trước/sau\r\n\r\nMacpherson/tay đòn kép\r\n\r\nHệ thống lái\r\n\r\nTrợ lực điện\r\n\r\nCỡ mâm\r\n\r\n18 inch\r\n\r\nKhả năng tăng tốc 0-100 km/h\r\n\r\n9.1 giây\r\n\r\nTốc độ tối đa\r\n\r\n204 km/h\r\n\r\nMức tiêu hao nhiên liệu trung bình\r\n\r\n7,06 L/100 km', 'Nội thất của Lexus ES 250 được thiết kế với sự tinh tế và đẳng cấp, với các chi tiết cao cấp và tính năng tiên tiến để đảm bảo sự thoải mái và tiện nghi cho người lái và hành khách trên xe.\r\n\r\nGhế trước và sau của xe được bọc da cao cấp, tạo nên cảm giác êm ái và thoải mái khi ngồi. Ghế trước có tính năng điều chỉnh điện, tính năng sưởi và thông gió, và cả tính năng massage để giảm stress sau một ngày làm việc căng thẳng. Bên cạnh đó, bảng điều khiển trung tâm của xe được trang bị màn hình cảm ứng LCD kích thước lớn, cho phép người lái điều khiển các tính năng của xe một cách dễ dàng và nhanh chóng. Hệ thống giải trí trên xe cũng rất đa dạng, bao gồm hệ thống âm thanh cao cấp, kết nối Bluetooth, đài FM/AM, kết nối USB và AUX, và hỗ trợ Apple CarPlay và Android Auto.', 'Hệ thống âm thanh cao cấp: Xe được trang bị hệ thống âm thanh Mark Levinson với 17 loa và công suất lên tới 1800 watt, mang đến âm thanh rõ ràng và sống động.\r\n\r\nHệ thống giải trí: Lexus ES 250 có hệ thống giải trí với màn hình cảm ứng đa chức năng, kết nối Bluetooth, Apple CarPlay và Android Auto, giúp người sử dụng dễ dàng kết nối và điều khiển các thiết bị di động.\r\n\r\nHệ thống điều hòa tự động đa vùng: Hệ thống điều hòa tự động đa vùng giúp người sử dụng điều chỉnh nhiệt độ và lưu lượng gió cho từng vị trí khác nhau trong xe.\r\n\r\nGhế da cao cấp: Ghế lái và ghế hành khách được bọc da cao cấp, có tính năng sưởi ấm, làm mát, điều chỉnh điện và bộ nhớ vị trí.\r\n\r\nHệ thống cảm biến và camera: Xe được trang bị hệ thống cảm biến và camera giúp người sử dụng quan sát và giám sát toàn bộ khoang xe', '1703579403Lexus-ES-1_red.jpg', 2),
(3, 'Lexus ES 300h', 'Số chỗ ngồi\r\n\r\n05\r\n\r\nKiểu xe\r\n\r\nsedan\r\n\r\nXuất xứ\r\n\r\nNhập khẩu nguyên chiếc\r\n\r\nKích thước DxRxC\r\n\r\n4975 x 1865 x 1445 mm\r\n\r\nTự trọng\r\n\r\n1,680 – 1,740 kg\r\n\r\nChiều dài cơ sở\r\n\r\n2870 mm\r\n\r\nĐộng cơ\r\n\r\nXăng 2.5L 4 xy-lanh thẳng hàng kết hợp động cơ điện\r\n\r\nDung tích bình xăng\r\n\r\n50L\r\n\r\nCông suất cực đại\r\n\r\n214 mã lực tại 5700 vòng/phút\r\n\r\nMô-men xoắn cực đại\r\n\r\n221 Nm tại 3600-5200 vòng/phút\r\n\r\nHộp số\r\n\r\nVô cấp CVT\r\n\r\nTăng tốc 0-100km/h\r\n\r\n8.9 giây\r\n\r\nTốc độ tối đa\r\n\r\n180km/h\r\n\r\nTreo trước/sau\r\n\r\nMacpherson/tay đòn kép\r\n\r\nPhanh trước/sau\r\n\r\nĐĩa thông gió/đĩa thường\r\n\r\nCỡ mâm\r\n\r\n18 inch\r\n\r\nMức tiêu hao nhiên liệu trung bình\r\n\r\n4.7L/100km', 'Lexus ES 300h được trang bị các tiện nghi hiện đại và tiên tiến như hệ thống âm thanh Mark Levinson, hệ thống giải trí với màn hình cảm ứng kích thước lớn, kết nối Bluetooth, hệ thống điều hòa tự động đa vùng, hệ thống khởi động bằng nút bấm và hệ thống giảm ồn bên trong.\r\n\r\nBên cạnh đó, nội thất của Lexus ES 300h cũng được thiết kế với sự chú trọng đến chi tiết nhỏ nhặt và các tính năng tiện ích, như hệ thống giữa hai ghế trước có nhiều khay đựng đồ và cổng sạc USB, cửa sổ trời panorama rộng lớn, hệ thống thông tin giải trí với kết nối smartphone thông qua Apple CarPlay và Android Auto, và hệ thống âm thanh surround của Mark Levinson với 17 loa, tạo ra âm thanh chất lượng cao và không gian giải trí tuyệt vời.Đuôi xe Lexus ES 300h\r\nĐuôi xe Lexus ES 300h cũng được thiết kế khá tinh tế và đẳ', 'Hệ thống thông tin giải trí\r\nLexus ES 300h được trang bị màn hình cảm ứng kích thước lớn\r\nHệ thống âm thanh Mark Levinson\r\nHệ thống giải trí với kết nối Bluetooth.\r\nHệ thống điều hòa tự động đa vùng\r\nHệ thống giải trí với kết nối smartphone thông qua Apple CarPlay và Android Auto\r\nHệ thống âm thanh surround của Mark Levinson với 17 loa\r\nHệ thống lái: Lexus ES 300h được trang bị hệ thống lái chính xác và dễ dàng điều khiển. \r\nHệ thống lái trợ lực điện (Electric Power Steering)\r\nHệ thống khởi động bằng nút bấm (Push Start Button) \r\nHệ thống lái tự động (Adaptive Cruise Control)\r\nKhả năng tiết kiệm nhiên liệu: Lexus ES 300h được trang bị động cơ Hybrid Synergy Drive. Cho phép tiết kiệm nhiên liệu tốt hơn so với các loại động cơ truyền thống. Giúp giảm thiểu lượng khí thải và bảo vệ môi trường', '1703579819lexus-es300h-13.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shippingID` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shippingID`, `fullname`, `phone`, `address`, `email`, `method`) VALUES
(3, 'Nguyễn Văn A', '0922096645', 'Châu Thành, Trà Vinh', 'VanA@gmail.com', 'cod'),
(4, 'Nguyễn Văn A', '0922096645', 'Châu Thành, Trà Vinh', 'VanA@gmail.com', 'cod'),
(5, 'Kim Thị B', '0923123124', 'Trà Ôn, Vĩnh long', 'ThiB@gmail.com', 'cod'),
(6, 'Kim Thị B', '0923123124', 'Trà Ôn, Vĩnh long', 'ThiB@gmail.com', 'cod'),
(7, 'Kim Dương A', '0944093343', 'Châu thành, Trà Vinh', 'DuongA@gmail.com', 'cod'),
(8, 'Nguyễn Văn A', '0892321323', 'Châu thành, Thanh hóa', 'VanA@gmail.com', 'cod'),
(9, 'Trần Thanh A', '0923234334', 'An giang', 'ThanhA@gmail.com', 'vnpay');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`account`, `password`, `fullname`, `address`, `email`, `status`, `phone`, `avatar`) VALUES
('VanA', '202cb962ac59075b964b07152d234b70', 'Nguyễn Văn A', 'Châu thành, Trà Vinh', 'VanA@gmail.com', '1', '0922093345', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`account`);

--
-- Indexes for table `automaker`
--
ALTER TABLE `automaker`
  ADD PRIMARY KEY (`autoMakerID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoriesID`);

--
-- Indexes for table `newsdetail`
--
ALTER TABLE `newsdetail`
  ADD PRIMARY KEY (`newsDetailID`),
  ADD KEY `newsID` (`newsID`);

--
-- Indexes for table `newslist`
--
ALTER TABLE `newslist`
  ADD PRIMARY KEY (`newsID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `shippingID` (`shippingID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`orderDetailID`),
  ADD KEY `productCarID` (`productCarID`);

--
-- Indexes for table `productcar`
--
ALTER TABLE `productcar`
  ADD PRIMARY KEY (`productCarID`),
  ADD KEY `autoMakerID` (`autoMakerID`),
  ADD KEY `categoriesID` (`categoriesID`);

--
-- Indexes for table `productcardetail`
--
ALTER TABLE `productcardetail`
  ADD PRIMARY KEY (`productCarDetailID`),
  ADD KEY `productCarID` (`productCarID`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shippingID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`account`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `automaker`
--
ALTER TABLE `automaker`
  MODIFY `autoMakerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoriesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `newsdetail`
--
ALTER TABLE `newsdetail`
  MODIFY `newsDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newslist`
--
ALTER TABLE `newslist`
  MODIFY `newsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productcar`
--
ALTER TABLE `productcar`
  MODIFY `productCarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productcardetail`
--
ALTER TABLE `productcardetail`
  MODIFY `productCarDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shippingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `newsdetail`
--
ALTER TABLE `newsdetail`
  ADD CONSTRAINT `newsdetail_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `newslist` (`newsID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`shippingID`) REFERENCES `shipping` (`shippingID`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`productCarID`) REFERENCES `productcar` (`productCarID`);

--
-- Constraints for table `productcar`
--
ALTER TABLE `productcar`
  ADD CONSTRAINT `productcar_ibfk_1` FOREIGN KEY (`autoMakerID`) REFERENCES `automaker` (`autoMakerID`),
  ADD CONSTRAINT `productcar_ibfk_2` FOREIGN KEY (`categoriesID`) REFERENCES `categories` (`categoriesID`);

--
-- Constraints for table `productcardetail`
--
ALTER TABLE `productcardetail`
  ADD CONSTRAINT `productcardetail_ibfk_1` FOREIGN KEY (`productCarID`) REFERENCES `productcar` (`productCarID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
