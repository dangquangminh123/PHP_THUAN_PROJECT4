-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 07, 2023 lúc 08:38 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mystore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(4, 'adminvu', 'adminvu@gmail.com', '$2y$10$TEruCQgrJ8NaUTPccLYuHOw5qwm4dLk9EKYDIKfaYotttG53Wmfui');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Adidas'),
(2, 'NIKE'),
(3, 'BANDAI'),
(4, 'MEDICOMTOYS'),
(5, 'YAMAGUCHI-AMAZING'),
(6, 'Nong Lam Foods'),
(7, 'Vinacafe'),
(8, 'twister');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_details`
--

INSERT INTO `cart_details` (`product_id`, `ip_address`, `quantity`) VALUES
(2, '127.0.0.1', 1),
(3, '::1', 1),
(6, '127.0.0.1', 1),
(13, '::1', 1),
(19, '127.0.0.1', 1),
(24, '::1', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Fruits'),
(2, 'Vegetables'),
(3, 'drinks'),
(4, 'SHFIGUARTS'),
(5, 'MAFEX'),
(6, 'REVOLTECH'),
(7, 'Clothes'),
(8, 'Shoe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_pending`
--

INSERT INTO `orders_pending` (`order_id`, `user_id`, `invoice_number`, `product_id`, `quantity`, `order_status`) VALUES
(1, 2, 1711911252, 23, 1, 'pending'),
(2, 3, 1375389970, 14, 1, 'pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(200) NOT NULL,
  `product_description` text NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image1` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_price` varchar(155) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `brand_id`, `product_image1`, `product_image2`, `product_image3`, `product_price`, `date`, `status`) VALUES
(1, 'SHFIGUARTS ETERNALS IKARIS', 'Chủng tộc bất tử Eternals Ikaris', 'Ikaris Eternals SHF SHFIGUARTS', 4, 3, 'ikaris.jpg', 'ikaris2.jpg', 'eternalsikaris.jpg', '800000', '2023-05-29 09:32:46', 'true'),
(2, 'SHFIGUARTS CAPTAIN VS CAPTAIN', 'CAPTAIN VERSION CAP VS CAP ENDGAME', 'CAPTAIN ENDGAME SHFIGUARTS SHF ', 4, 3, 'cap_vs_cap2.jpg', 'cap_vs_cap.jpg', 'capvscap.jpg', '1860000', '2023-05-29 09:58:33', 'true'),
(3, 'SHFIGUARTS RESCUE ARMOR', 'RESCUE ARMOR AVENGERS ENDGAME', 'RESCUE AVENGERS SHFIGUARTS SHF', 4, 3, 'rescue3.jpg', 'rescue.jpg', 'rescue2.jpg', '1760000', '2023-05-29 09:59:52', 'true'),
(4, 'MAFEX SUPERMAN HUSH', 'SUPERMAN HUSH SERIRES BATMAN HUSH', 'SUPERMAN MAFEX HUSH', 5, 4, 'superman_hush.jpg', 'superman_hush2.jpg', 'sup_hush3.jpg', '1900000', '2023-05-29 10:01:02', 'true'),
(5, 'MAFEX BATMAN HUSH ', 'BATMAN HUSH IN SERIRES HUSH BATMAN', 'HUSH BATMAN MAFEX', 5, 4, 'hush_batman.jpg', 'batman_hush2.jpg', 'batman_hush3.jpg', '1950000', '2023-05-29 10:01:50', 'true'),
(6, 'MAFEX SUPERMAN THE DARK KNIGHT RETURNS', 'SUPERMAN IN THE DARK KNIGHTS RETURNS', 'SUPERMAN MAFEX THE DARK KNIGHTS', 5, 4, 'super_TDKR.jpg', 'super_TDKR2.jpg', 'superman_TDKR.jpg', '1630000', '2023-05-29 10:03:02', 'true'),
(7, 'MAFEX MERA', 'MERA AQUAMAN MOVIES', 'MERA MAFEX AQUAMAN', 5, 4, 'mera.jpg', 'mera2.jpg', 'mera3.jpg', '1700000', '2023-05-29 10:03:59', 'true'),
(8, '1690000', 'POISON IVY series hush', 'POISONIVY HUSH MAFEX', 0, 0, 'poison_ivy2.jpg', 'poison_ivy.jpg', 'Array', '1690000', '2023-06-05 11:07:47', 'true'),
(9, 'CAFE đen', 'Cà phê là thức uống dễ chiều lòng người song cũng thách thức người thưởng thức không kém. ', 'COFFE CAFE ', 3, 7, 'cafe_den.jpg', 'cafe_den2.png', 'capheden.png', '35000', '2023-05-29 10:31:17', 'true'),
(10, 'CAFE Sữa', 'Cà phê sữa là một món thức uống quen thuộc của người Việt. Để ngày mới bắt đầu thật tỉnh táo thì không thể nào bỏ qua 1 ly cà phê thơm ngon', 'CAFE COFFE', 3, 7, 'cafe_sua.jpg', 'cafesua2.jpg', 'cafesua3.png', '25000', '2023-05-29 10:32:49', 'true'),
(11, 'Nước dâu tây', 'Dâu tây với vị chua ngọt, giàu vitamin và chất xơ, rất tốt khi được sử dụng để làm các món nước ép thanh mát, giúp đẹp da, giải nhiệt vào những ngày nắng nóng', 'strawberry', 3, 8, 'dautay3.jpg', 'dautay.jpg', 'dautay2.jpg', '26000', '2023-05-29 10:36:17', 'true'),
(12, 'Nước cam', 'Nước cam còn được gọi là nước ép của ánh nắng mặt trời vì một ly nước cam có thể làm nên điều kỳ diệu cho cơ thể', 'Orange', 3, 8, 'nuoccam3.jpg', 'nuoccam2.jpg', 'nuoccam.jpg', '29000', '2023-05-29 10:37:40', 'true'),
(13, 'Quả chanh', 'Chanh làm giảm hôi miệng, chữa cảm, sốt, nhức đầu và làm sạch vi khuẩn trong miệng, do có tính axit nên không phù hợp người đau dạ dày. ', 'Lemon chanh', 2, 6, 'chanh.jpg', 'chanh2.jpg', 'chanh3.jpg', '25000', '2023-05-29 10:39:13', 'true'),
(14, 'Quả xoài', 'Quả xoài là một loại trái cây rất phổ biến và được ưa thích tại Việt Nam, nó được dùng để chế biến rất nhiền món ngon như làm nước ép, sinh tố, làm bánh, làm mứt hay ăn không cũng ngon.', 'Mangoes xoài', 2, 6, 'xoai1.jpg', 'xoai2.jpg', 'xoai3.jpg', '15000', '2023-05-29 10:40:59', 'true'),
(15, 'Áo superman', 'Nói đến siêu anh hùng marvel thì ắt hẳn superman sẽ là nhân vậy được nhớ đến nhiều nhất.', 'Clothes Superman', 7, 2, 'aosup2.jpg', 'aosup.jpg', 'aosup1.png', '30000', '2023-05-29 10:46:37', 'true'),
(16, 'Áo batman', 'Sử dụng công nghệ dệt vải Ultra Light ™ mang đến một sản phẩm áo thể thao siêu nhẹ, mềm mại tự nhiên, co giãn 4 chiều, màu sắc bền đẹp theo thời gian.', 'Clothes batman', 7, 2, 'aobatman.jpg', 'aobatman2.jpg', 'aobatman3.png', '27000', '2023-05-29 10:48:41', 'true'),
(17, 'Trang phục Spider Man', 'Mua Bộ thu xuất hàn hình SPIDER MAN dành cho bé trai sz 2- 8,9 tuổi giá tốt nhất tại cửa hàng thời trang quần áo trẻ em Mekids ', 'Clothes SpiderMan', 7, 2, 'trangphuc_nhen.jpg', 'trangphuc_nhen2.jpg', 'trangphuc_nhen3.jpg', '19000', '2023-05-29 10:50:13', 'true'),
(18, 'Giày Iron Man', 'adidas, in their ever-present fire to innovate, has tapped into the infinitely rising popularity of Marvel‘s', 'shoe IronMan', 8, 1, 'giayironman2.jpg', 'giayironman.jpg', 'giayironman3.jpg', '560000', '2023-05-29 11:02:26', 'true'),
(19, 'Giày Captain', 'Anta x Marvel Captain America là đôi giày bóng rổ được thiết kế dựa trên hình ảnh siêu anh', 'Shoe Captain', 8, 1, 'giay_cap.jpg', 'giaycaptain.jpg', 'giaycaptain2.jpg', '470000', '2023-05-29 11:03:36', 'true'),
(20, 'Giày Wonder Woman', 'mang đậm chất comic lẫn chút cổ điển của dải ngân hà xa xôi, không cầu kì những vẫn vô cùng nổi bật.', 'Shoe Wonder Woman', 8, 1, 'giay_wonderwoman3.jpg', 'giaywonderwoman.jpg', 'giaywonderwoman2.jpg', '590000', '2023-05-29 11:05:00', 'true'),
(21, 'SHFIGUARTS HULK INFINITY WAR', 'The Incredible Hulk, as seen in the Avengers films', 'SHF HULK INFINITY WAR', 4, 3, 'hulk_IW.jpg', 'hulk_IW2.jpg', 'hulk_IW3.jpg', '1780000', '2023-05-31 02:56:36', 'true'),
(22, 'SHFIGUARTS HULK ASSEMBLE', 'SH Figuarts gives us back the Hulk from AVENGERS ASSEMBLE in a completely new sculpt!', 'SHF HULK ASSEMBLE', 4, 3, 'hulk_A1.jpg', 'hulk_a1_3.jpg', 'hulk_A1_2.jpg', '1900000', '2023-05-31 02:57:49', 'true'),
(23, 'REVOLTECH SUPERMAN', 'Based on his appearance in DC Comics New 52 series', 'REVOLTECH SUPERMAN KAIYODO', 6, 5, 'revoltech_sup.jpg', 'revoltech_sup2.jpg', 'revoltech_sup3.jpg', '1890000', '2023-05-31 03:01:32', 'true'),
(24, 'SHFIGUARTS GREEN GOBLIN', 'No Way Home - Green Goblin (Spider-Man: No Way Home)', 'SHF, SHFIGUARTS, GREEN GOBLIN, NO WAY HOME', 4, 3, 'GOBLIN1.jpg', 'goblin2.jpg', 'goblin3.jpg', '2390000', '2023-06-05 12:58:39', 'true');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_orders`
--

INSERT INTO `user_orders` (`order_id`, `user_id`, `amount_due`, `invoice_number`, `total_products`, `order_date`, `order_status`) VALUES
(1, 2, 3545000, 1711911252, 3, '2023-06-04 12:29:56', 'Complete'),
(2, 3, 2675000, 1375389970, 3, '2023-06-04 12:56:59', 'Complete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_payments`
--

INSERT INTO `user_payments` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_mode`, `date`) VALUES
(1, 1, 1711911252, 3545000, 'Payoffline', '2023-06-04 12:29:56'),
(2, 2, 1375389970, 2675000, 'Payoffline', '2023-06-04 12:56:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(150) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_mobile` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_email`, `user_password`, `user_image`, `user_ip`, `user_address`, `user_mobile`) VALUES
(3, 'thanvu', 'uservu@gmail.com', '$2y$10$NPbHiqOspt0PSj0Q6grrAeU9qY51h7Mf20b0d0OeyCZkJiAqx5GHC', 'genshin.jpg', '::1', 'Binh Chanh Ho Chi Minh', '09492389124');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
