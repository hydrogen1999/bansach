-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 10, 2020 lúc 04:34 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bansach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` int(11) NOT NULL,
  `ADMIN_NAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `PHONE` int(11) NOT NULL,
  `PASSWORD` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `TYPE` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`ADMIN_ID`, `ADMIN_NAME`, `EMAIL`, `PHONE`, `PASSWORD`, `TYPE`) VALUES
(1, 'Nguyễn Công Thịnh', 'nguyencongthinh1999@gmail.com', 705443301, '123456789', 'Admin'),
(2, 'Nguyễn Thị Phương ', 'nguyenthiphuong@gmail.com', 934366355, '1234567', 'Manager'),
(3, 'Nguyễn Văn An', 'nguyenvanan@gmail.com', 369008179, '456789', 'Manager');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `AUTHOR_ID` int(11) NOT NULL,
  `AUTHOR_NAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `OTHER_AUTHOR` varchar(500) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`AUTHOR_ID`, `AUTHOR_NAME`, `OTHER_AUTHOR`) VALUES
(1, ' Đông Tử', 'Đông Tử tên thật là Phạm Cảnh Vũ, làm công tác nghiên cứu giáo dục và viết văn; có khoảng 20 năm kinh nghiệm trong việc nghiên cứu giáo dục gia đình và tư vấn tâm lý thanh niên; năm 2009, là một trong 10 tác giả có ảnh hưởng lớn nhất Trung Quốc về giáo dục. Là người đề xuất và kiên trì quan niệm \"giáo dục của người cha\", \"giáo dục vui vẻ\". Con gái ông đã được các phương tiện thông tin đại chúng Trung Quốc gọi là \"cô bé vui vẻ nhất, thông minh nhất Trung Quốc\". Đã xuất bản hơn 30 cuốn sách, trong'),
(2, 'James Allen', 'James Allen là một nhà văn triết học người Anh nổi tiếng với những cuốn sách và thơ truyền cảm hứng và là người tiên phong của phong trào tự lực. Tác phẩm nổi tiếng nhất của ông, As a Man Thinketh, đã được sản xuất hàng loạt kể từ khi xuất bản năm 1903. Nó là nguồn cảm hứng cho các tác giả tự động viên và tự giúp đỡ'),
(3, ' Chin Ning Chu', 'Chin-Ning Chu là một nhà tư vấn kinh doanh người Mỹ gốc Hoa và là tác giả quản lý kinh doanh bán chạy nhất ở châu Á và Vành đai Thái Bình Dương. Sinh: 1947, Trung Quốc\r\nMất: 10 tháng 12, 2009, Đài Loan.'),
(4, 'Christopher McDougall', 'Christopher McDougall là một tác giả và nhà báo người Mỹ. Ông được biết đến nhiều nhất qua cuốn sách năm 2009 Sinh ra để chạy: Một bộ lạc ẩn giấu, Superathletes và Cuộc đua vĩ đại nhất mà thế giới chưa từng thấy. Sinh: 24 tháng 1, 1962 (58 tuổi)\r\nHọc vấn: Đại học Harvard\r\nThể loại: Nhạc Rock\r\nAlbum: It Starts Now\r\nĐề cử: Goodreads Choice Awards Best Nonfiction.'),
(5, 'David Niven', 'James David Graham Niven là một diễn viên, người viết sách và tiểu thuyết gia người Anh. Nhiều vai diễn của anh bao gồm Lãnh đạo Phi đội Peter Carter trong A Matter of Life and Death, Phileas Fogg trong Vòng quanh thế giới trong 80 Ngày, và Ngài Charles Lytton trong The Pink Panther. '),
(6, 'Mari Tamagawa', 'Mari Tamagawa là một nhà tâm lý học lâm sàng cho lực lượng phòng vệ Nhật Bản và chủ tịch hội đồng quản trị tổ chức phi lợi nhuận Heart Seeds . Cô sinh ra ở quận Okayama, Nhật Bản, năm 1973; Cha cô là một người nghiện rượu và mẹ cô đã tự tử vì chịu quá nhiều áp lực. Cô đã gia nhập vào Lực lượng Phòng vệ Nhật Bản vào năm 1991 với hy vọng xây dựng sức mạnh cần thiết để tự bảo vệ mình, trở thành người phụ nữ đầu tiên phục vụ trong Trung đoàn pháo binh trường. Năm 2008, cô trở thành một nhà tâm lý họ'),
(7, 'Robin Sharma', 'Robin Sharma là một nhà văn người Canada, nổi tiếng với bộ sách The Monk Who Sold Your Ferrari. Sharma làm luật sư tranh tụng cho đến năm 25 tuổi, khi anh tự xuất bản MegaLiving, một cuốn sách về quản lý căng thẳng và tâm linh. Sinh: 16 tháng 6, 1964 (56 tuổi), Port Hawkesbury, Ca-na-đa\r\nThể loại sở trường: Self-help/Động cơ\r\nQuốc tịch: Canada, Mauritius.'),
(8, 'Tina Seelig', 'Sinh: 1979 (41 tuổi)'),
(9, 'Virginia M. Axline', ''),
(10, 'Jason Jennings', ''),
(11, 'Niall Ferguson', ''),
(12, 'Paul Davidson', ''),
(13, 'Peter Navarro', ''),
(14, 'Jeremy Harbour', ''),
(15, 'Nguyễn Nhật Ánh', ''),
(16, 'Rosie Nguyễn', ''),
(17, 'Sói Xám Mọc Cánh', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CATEGORY_ID` int(11) NOT NULL,
  `CATEGORY_NAME` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CATEGORY_ID`, `CATEGORY_NAME`) VALUES
(1, 'Tâm Lý - Kỹ Năng Sống'),
(2, 'Y Học - Sức Khỏe'),
(3, 'Truyện Ngắn - Ngôn Tình'),
(4, 'Phiêu Lưu - Mạo Hiểm'),
(5, 'Triết Học'),
(6, 'Truyện Tranh'),
(7, 'Kinh Tế - Quản Lý'),
(8, 'Ngoại Ngữ'),
(9, 'Lịch Sử - Chính Trị'),
(10, 'Truyện Teen - Tuổi Học Trò'),
(11, 'Kiếm Hiệp - Tiên Hiệp'),
(12, 'Ẩm thực - Nấu ăn'),
(13, 'Khoa Học - Kỹ Thuật'),
(14, 'Văn Hóa - Tôn Giáo'),
(15, 'Văn Học Việt Nam'),
(16, 'Tiểu Thuyết Phương Tây'),
(17, 'Thiếu Nhi'),
(18, 'Tiểu Thuyết Trung Quốc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `MESS_ID` int(11) NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ORDER_ID` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `DATE` datetime NOT NULL,
  `TOTAL` int(11) NOT NULL,
  `METHOD` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `DIACHI` varchar(200) COLLATE utf8_vietnamese_ci NOT NULL,
  `STATUS` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`ORDER_ID`, `USER_ID`, `DATE`, `TOTAL`, `METHOD`, `DIACHI`, `STATUS`) VALUES
('1599560577052', 2, '2020-09-08 17:22:57', 50900, 'Trả bằng tiền mặt', 'hgv', 'Đã giao'),
('1599647239661', 2, '2020-09-09 17:27:19', 156350, 'Trả bằng tiền mặt', 'jhfhd', 'Hủy đơn'),
('1599700266916', 2, '2020-09-10 08:11:06', 68000, 'Trả bằng tiền mặt', 'aa', 'Đặt hàng'),
('1599701707142', 2, '2020-09-10 08:35:07', 167750, 'Trả bằng tiền mặt', 'aaa', 'Đang giao'),
('1599703371812', 2, '2020-09-10 09:02:51', 327750, 'Trả bằng tiền mặt', 'CCC', 'Đã xử lý'),
('1599704811792', 2, '2020-09-10 09:26:51', 570000, 'Trả bằng tiền mặt', 'nnnn', 'Đã xử lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `ID` int(11) NOT NULL,
  `ORDER_ID` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`ID`, `ORDER_ID`, `PRODUCT_ID`, `QUANTITY`, `PRICE`) VALUES
(39, '1599560577052', 20, 1, 39900),
(40, '1599647239661', 3, 2, 39900),
(41, '1599647239661', 5, 1, 65550),
(42, '1599700266916', 1, 1, 57000),
(43, '1599701707142', 1, 2, 57000),
(44, '1599701707142', 2, 1, 42750),
(45, '1599703371812', 5, 5, 65550),
(46, '1599704811792', 1, 10, 57000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(500) COLLATE utf8_vietnamese_ci NOT NULL,
  `PRICE` int(11) NOT NULL,
  `OTHER` mediumtext COLLATE utf8_vietnamese_ci NOT NULL,
  `NUMBER` int(10) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `STATUS` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `DISCOUNT` float NOT NULL,
  `IMAGE` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_vietnamese_ci NOT NULL,
  `AVG_RATE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`PRODUCT_ID`, `PRODUCT_NAME`, `PRICE`, `OTHER`, `NUMBER`, `AUTHOR_ID`, `CATEGORY_ID`, `STATUS`, `DISCOUNT`, `IMAGE`, `DESCRIPTION`, `AVG_RATE`) VALUES
(1, 'Cùng Con Trưởng Thành', 60000, 'Cùng Con Trưởng Thành – Tác giả Đông Tử đã trở nên quen thuộc với đông đảo độc giả Việt Nam qua cuốn sách “Người cha tốt hơn là người thầy tốt”- một cuốn sách hay về giáo dục gia đình.Nếu như Người cha tốt hơn là người thầy tốt chia sẻ những vấn đề to lớn như: Làm thế nào để bảo vệ thế giới tâm hồn của trẻ? Bảo vệ lòng tự trọng của trẻ? Dạy trẻ tiết kiệm, dạy trẻ về tinh thần trách nhiệm…thì Cùng con trưởng thành sẽ nói rõ về vai trò của người cha trong từng giai đoạn phát triển của trẻ. Từ ', 88, 1, 1, 'Còn hàng', 0.05, 'cung-con-truong-thanh.jpg', '“Tình Cha ấm áp như vầng thái dương.  Ngọt ngào như dòng nước trôi đầu nguồn.  Suốt đời vì con gian nan.  Ân tình đậm sâu bao nhiêu.  Cha hỡi ! Cha già dấu yêu.” Những lời hát ấy là minh chứng đầy đủ và sâu sắc nhất về tình yêu bao la của cha dành cho con. Cha mẹ luôn yêu thương con vô điều kiện, dành hết tất cả những gì tốt đẹp nhất cho con. Tình yêu của cha thường không thể hiện cụ thể bằng những lời nói, tiếng yêu thương như mẹ mà cha yêu con bằng những hành động, việc làm, cha luôn dõi theo và nâng bước con đi trên suốt chặng đường đời. Đông Tử đã cho độc giả được lắng mình chiêm nghiệm và yêu thương cha hơn qua cuốn sách Cùng con trưởng thành.Cùng con trưởng thành nói về vai trò của người cha trong từng giai đoạn phát triển của trẻ. Ở bất cứ giai đoạn nào cũng không thể thiếu sự giáo dục của người cha. Cuộc sống có bao nhiêu niềm hạnh phúc, dù là cơm ngon áo ấm, cuộc sống như ý hay ước mơ thành sự thật đều là những thứ bên ngoài, còn tài sản thực sự chính là niềm hạnh phúc con cái mang đến cho chúng ta. Đọc cuốn sách này, mỗi người sẽ cảm nhận được những khoảnh khắc vô cùng ý nghĩa khi người đàn ông lần đầu tiên nghe tin mình sắp được làm cha, từ lúc con chào đời đến khi vào đại học. Ở mỗi thời điểm người làm cha không khỏi băn khoăn về chuyện học, chuyện chơi, sức khỏe của con. Tôi nên làm một người cha như thế nào? Nên cho con học như thế nào? Để con chơi hay học? Có nên cho con vào trường điểm không? Đó không chỉ là nỗi lo của riêng người cha Đông Tử với con gái Phạm Khương Quốc Nhất, mà đó là nỗi lòng chung của mọi người làm cha trên đời. Cùng con trưởng thành là câu chuyện cảm động về một người cha luôn mong muốn cho con lớn lên với niềm vui, thay vì những áp lực vô hình mà cuộc sống tạo ra. “Mặc dù cha không thể cho con cuộc sống vật chất đầy đủ, nhưng cha đã dạy cho con những phẩm chất đạo đức tốt và trang bị cho con những năng lực cần thiết, và đồng thời cha cũng tặng cho con một món quà vô cùng to lớn, món quà ấy có tên lniềm vui, và nó đã làm bạn cùng con mỗi ngày. Đây là những gì mà một người cha phải làm cho đứa con yêu của mình”. Cuốn sách Cùng con trưởng thành người đọc là cuốn sách hay và ý nghĩa về tình cha con, những người cha có vai trò vô cùng quan trọng, sự hi sinh và che chở của cha là tiền đề cho con tương lại tươi sáng, hạnh phúc', 0),
(2, 'Giải Pháp Keynes', 45000, 'Cuộc khủng hoảng tài chính hiện tại đã dẫn đến việc mất lòng tin vào chính sách kinh tế theo hình thái thị trường tự do. Trong giải pháp Keynes, tác giả Paul Davidson đã thể hiện một hiểu biết sâu sắc về việc chúng ta đã sa vào khủng hoảng như thế nào – và quan trọng hơn là chúng ta sẽ sử dụng triết lý kinh tế của Keynes như thế nào để thoát khỏi bớ bòng bong này. John Maynard Keynes chuyên tâm vào việc làm cho kinh tế thị trường đạt hiệu quả, nhưng hệ thống hiện tại của chúng ta là một thất bại', 49, 12, 7, 'Còn hàng', 0.05, 'giai-phap-keynes.jpg', 'Cuốn sách “Giải pháp của Keynes – Con đường dẫn đến sự thịnh vượng kinh tế toàn cầu” do tác giả Paul Davidson viết thể hiện vai trò của Keynes trong việc làm cho kinh tế thị trường đạt hiệu quả, Paul Davidson đã thể hiện rằng Keynes ủng hộ vai trò can thiệp của Nhà nước, kết hợp với sự chủ động của khu vực tư nhằm giảm bớt những ảnh hưởng tiêu cực của suy thoái khủng hoảng và tăng trưởng nóng. Chính sách kinh tế của Keynes như Paul Davidson đã trình bày từng giúp thế giới thoát khỏi cuộc đại khủng hoảng và là một tác nhân quan trọng dẫn đến chính sách kinh tế của Franklin D.Roosvelt vào những năm 1933 trở về sau.\r\nSau khi đọc xong cuốn sách của Davidson, chúng ta sẽ thấy được những đề xuất và kế hoạch chi tiết cho chính sách tài khóa, chính sách tiền tệ, luật, qui định cho thị trường tài chính của tác giả dựa trên nền tảng lý thuyết của Keynes.', 0),
(3, 'Làm Ít Được Nhiều', 42000, 'Trong thời đại thay đổi nhanh chóng và cạnh tranh gay gắt hiện nay, chúng ta thường tự vướng vào một quan điểm quá mệt mỏi là tin rằng thành công chỉ đến khi phải đánh đổi bằng sự cân bằng của cuộc sống. Tuy nhiên, hầu hết những người thành công lại không nhất thiết phải làm việc vất vả. Trong quyển Làm ít được nhiều, tác giả có sách bán chạy Ching-Nin-Chu giải thích cách làm thế nào để giải tỏa cái vòng lẩn quẩn đó và học cách để vừa bình an vừa hiệu quả cùng một lúc.\r\n\r\nHọc cách làm thế nào để', 70, 3, 1, 'Còn hàng', 0.05, 'lam-it-duoc-nhieu.jpg', 'Chắc hẳn câu thành ngữ “Cần cù bù thông minh” đã ăn sâu vào trong tiềm thức của rất nhiều người. Họ cho rằng, muốn thành công, chúng ta phải chăm chỉ, nỗ lực hết sức mình, toàn tâm toàn ý cho công việc, nhiều người đã làm việc quên cả chăm lo cho bản thân và gia đình, quên cả tận hưởng cuộc sống. Rất nhiều người luôn phải sống trong trạng thái căng thẳng, áp lực công việc luôn đè nặng trên vai. Bạn có biết làm cách nào để vừa giảm thiểu được lượng công việc chồng chất vừa đạt hiệu quả công việc cao nhất? Trong cuốn sách Làm ít Được nhiều, tác giả Jennifer White sẽ chỉ ra cách để bạn thành công nhất trong sự nghiệp mà vẫn có nhiều thời gian rảnh rỗi để tận hưởng cuộc sống, để phát triển bản thân và tạo dựng các mối quan hệ tốt đẹp với những người xung quanh.\r\n\r\nBí quyết ở đây rất đơn giản, nhưng vấn đề là bạn phải thực hành. Mỗi chương trong cuốn sách đều có các câu hỏi trắc nghiệm và các bài tập hướng dẫn giúp bạn đi đến đích nhanh nhất trong cuộc hành trình Làm ít Được nhiều. Tác giả cũng nhấn mạnh rằng “Đọc là một chuyện nhưng thực hành là chuyện khác. Vấn đề ở chỗ bạn phải áp dụng, đưa nó vào cuộc sống và biến nó thành công cụ của bạn.”\r\nCuốn sách gồm 2 phần: Làm ít và Được nhiều.\r\n\r\nPhần Làm ít giúp bạn nhận biết được những điểm yếu của mình để khắc phục giúp bạn cân bằng các kĩ năng, phát huy tối đa những thế mạnh của mình, tiết kiệm được nhiều thời gian nhất cho cùng một khối lượng công việc.\r\n\r\nPhần Được nhiều chỉ cho bạn cách tốt nhất để có được nguồn thu nhập cao. Jennifer White cho rằng, tiền bạc là một công cụ tuyệt vời để bạn được tự do lựa chọn một cuộc sống như mình mong muốn. Chương trình này sẽ giúp bạn không còn phải lo lắng về vấn đề tiền bạc nữa.', 0),
(4, 'Sinh Ra Để Chạy', 58000, 'Bất kỳ ai đọc Sinh ra để chạy cũng sẽ tìm thấy ở đâu đó hình bóng của chính mình trong sách. Cuốn sách không chỉ là một cuộc phiêu lưu, một cuộc tìm hiểu cội nguồn của chạy bộ, mà còn lột tả những cảm xúc chân thực, những nỗi niềm suy nghĩ, những tình cảm buồn vui, những vỡ òa của các nhân vật xoay quanh từng bước chạy. Với những ai chưa từng chạy bộ, cuốn sách có thể là một lời giải đáp cho băn khoăn “chạy để làm gì?” hoặc “chạy bộ có gì hay?”. Còn đối với những người đã trót đem lòng yêu môn c', 65, 4, 1, 'Còn hàng', 0.03, 'sinh-ra-de-chay.jpg', 'Sống ngăn cách với thế giới qua hẻm núi Copper Canyon (Mexico), người thổ dân Tarahumara đã tôi rèn khả năng chạy bộ hàng trăm dặm không ngơi nghỉ mà không gặp chấn thương nào. Nhà báo kỳ cựu đồng thời cũng là người chạy bộ hay mắc chấn thương Christopher McDougall đã lên đường tìm bí mật của họ. Dọc hành trình, anh đưa người đọc từ phòng thí nghiệm ở Đại học Harvard xuống thung lũng nóng như nung, lên những đỉnh cao buốt giá xuyên miền Bắc Mỹ, quê hương của người chạy bộ siêu phàm đẩy cơ thể đến cực hạn và cuối cùng là cuộc so tài thế kỷ trong hẻm núi Copper Canyon giữa những vận động viên chạy bộ cự phách nhất nước Mỹ và tộc người chạy bộ. Câu chuyện khó tin của McDougall không chỉ cuốn hút trí não mà còn tiếp sinh lực cho cơ thể khi bạn nhận ra từ thẳm sâu bên trong, mình được SINH RA ĐỂ CHẠY.\r\n\r\nSinh ra để chạy không phải là một cuốn sách giáo khoa về chạy bộ. Bạn sẽ không tìm thấy những kiến thức chuyên sâu, có tính kỹ thuật của môn chạy bộ, hay các bài tập, hướng dẫn giúp bạn chạy được nhanh hơn, xa hơn. Thay vào đó, tác giả Christopher McDougall lại dẫn dắt người đọc vào một câu chuyện vượt cả không gian và thời gian, tới các ngóc ngách tận cùng của Trái đất, đi ngược về lịch sử xa xưa của nhân loại, để tìm hiểu về chạy bộ như một trong những bản năng cơ bản nhất của con người. Đan quyện vào cuộc du hành xuyên thời gian, không gian đó, là câu chuyện về những cá nhân cụ thể, có đời sống xã hội bình thường như mỗi chúng ta, nhưng khi xỏ chân vào đôi giày chạy và lướt xuống đường mòn, họ bỗng lột xác thành dị nhân siêu đẳng, với khả năng chạy bộ ở cự ly siêu dài trong thời gian không tưởng. Và để đối chứng với những siêu nhân chạy bộ thời hiện đại ấy, Christopher đã tìm thấy một đối thủ hoàn hảo, một bộ tộc ẩn nấp sâu trong vùng núi cao Sierra ở Mexico, những người vẫn giữ được tác phong và lối sống thanh bạch như chính tổ tiên của họ hàng nghìn năm trước, người Tarahumara. Cao trào của cuốn sách, là một cuộc tỷ thí vượt thời gian, một giải chạy vô tiền khoáng hậu, giữa những người chạy bộ giỏi nhất thời hiện đại của nước Mỹ và những người thổ dân đại diện cho người chạy bộ nguyên thủy.\r\n\r\nDù kể chuyện về những dị nhân siêu phàm nhất, nhưng tác giả Christopher McDougall đã khéo léo phản chiếu chính hình ảnh của bản thân mình, một người chạy bộ nhập môn, vào mạch kể. Do đó, bất kỳ ai đọc Sinh ra để chạy cũng sẽ tìm thấy ở đâu đó hình bóng của chính mình trong sách. Cuốn sách không chỉ là một cuộc phiêu lưu, một cuộc tìm hiểu cội nguồn của chạy bộ, mà còn lột tả những cảm xúc chân thực, những nỗi niềm suy nghĩ, những tình cảm buồn vui, những vỡ òa của các nhân vật xoay quanh từng bước chạy.\r\n\r\nVới những ai chưa từng chạy bộ, cuốn sách có thể là một lời giải đáp cho băn khoăn “chạy để làm gì?” hoặc “chạy bộ có gì hay?”, còn đối với những người đã trót đem lòng yêu môn chạy bộ, cuốn sách là một thiên sử thi, vừa lãng mạn, vừa hùng tráng, tràn đầy lòng tự hào của một giống loài “Sinh ra để chạy”.', 0),
(5, 'Hành Trình Tình Yêu', 69000, 'Cuốn sách bao gồm 75 chương, mỗi chương vọn vẹn có 2-3 trang với kích thước sách 13x 20,5 cm. Mỗi chương sẽ là mỗi lời khuyên giúp bạn có thể có được tình yêu bền vững. Không hoa mỹ, không cầu kỳ, không giáo điều mà tất cả 75 lời khuyên đó rất thiết thực để mang lại cho bạn những nền tảng cơ bản trước và trong khi yêu.', 35, 5, 1, 'Còn hàng', 0.05, 'bi-mat-hanh-trinh-tinh-yeu.jpg', '“Tình yêu là một tình cảm cao cả, nó làm tái sinh những tâm hồn lạc lối và kiến tạo nên những giá trị vĩ đại nhất của con người.” -- Makarenko\r\n\r\n“Tình yêu là điều đặc biệt và kỳ diệu nhất của con người.\r\n\r\nCó được tình yêu đã khó – giữ được tình yêu bền vững còn khó hơn”.\r\n\r\nPhần lớn các cuộc hôn nhân được hình thành từ cảm xúc đặc biệt được gọi là tình yêu. Và như một quy luật tất yếu, hôn nhân và tình yêu luôn song hành với nhau để duy trì hạnh phúc gia đình. Khi yêu, người ta sống bằng cảm xúc, nhưng khi kết hôn thì tình yêu lại trở thành chất xúc tác để nuôi dưỡng hôn nhân, duy trì những cảm xúc tuyệt vời của thuở yêu nhau.\r\n\r\nVà con đường đi đến hạnh phúc trong hôn nhân rất gian khổ. Mâu thuẫn trong trong quan hệ hôn nhân rất đa dạng và phức tạp, không tuân theo nguyên tắc hay tiêu chí cụ thể nào. Vì thế, không ai có thể đảm bảo chắc rằng mình đã tìm được cuộc hôn nhân hạnh phúc trọn vẹn dù trước đó đã được tư vấn, học hỏi và tích lũy một số kinh nghiệm.\r\n\r\nHạnh phúc trong hôn nhân cũng giống như giọt nước rơi vào lòng bàn tay, nếu nắm chặt tay lại, giọt nước sẽ được được ấp ủ và ấm dần lên, nhưng nếu cứ để tự nhiên thì giọt nước sẽ trở nên lạnh lẽo và sớm biến mất. Vì vậy, xin hãy luôn biết nâng niu và nuôi dưỡng hôn nhân bằng tất cả tình cảm yêu thương và trân trọng.', 0),
(6, 'Mặc Kệ Thiên Hạ', 65000, 'Quyển sách dành cho ai cảm thấy mệt mỏi trong cuộc sống, trong công việc hay tình cảm. Như một người bạn thân tình, tác giả giúp giải quyết những cảm giác bất lực, không định hướng, không khả năng bắt kịp phản ứng với những thay đổi một cách khoa học. Là bác sĩ tâm lý tác giã đã làm tốt điều đó. Tuy nhiên, đôi khi cách viết không mạch lạc, hơi dài dòng. Nhưng quyển sách vẫn có nhiều ý hay.', 50, 6, 1, 'Còn hàng', 0, 'mac-ke-thien-ha-song-nhu-nguoi-nhat.jpg', 'Cuốn sách gối đầu giường cho những người hay lo lắng, sợ hãi và luôn thấy mình kém may mắn\r\n\r\nDành cho những ai muốn được sống là chính mình, cuộc đời của mình, tuổi trẻ của mình.\r\n\r\nĐã đến lúc bạn nên dừng tìm kiếm sự an ủi ở người khác, hoặc chờ đợi sự giúp đỡ từ một ai đó. Bởi an ủi hay giúp đỡ về mặt cảm xúc đôi khi giống như con dao hai lưỡi. Nó có thể giúp bạn chống đỡ lo âu hay muộn phiền nhất thời, nhưng lại đẩy bạn chìm sâu hơn vào những cảm xúc tiêu cực đó. Giống như một đứa trẻ khi vấp ngã, bạn mong đợi một sự xoa dịu từ người lớn, mà quên mất rằng sự “hỗ trợ” ấy chỉ càng khiến bạn mãi chẳng thể nào “biết đi”.\r\n\r\nVà Mặc hệ thiên hạ, sống như người Nhật chính là cuốn sách dành cho những người muốn đi bằng chính đôi chân mình. Dành cho những người muốn gạt bỏ những nỗi sợ bởi chính tay mình, chứ không cầu cứu bất kì sự trợ giúp nào.\r\n\r\nHãy thử sống một ngày “mặc kệ thiên hạ”, mặc kệ những lời nhận xét từ người khác. Hãy thử sống một ngày bạn cho phép mình từ bỏ, từ bỏ những thứ khó khăn, ngổn ngang lo lắng. Hãy thử sống một ngày bạn trân trọng mọi cung bậc cảm xúc bên trong con người bạn.\r\n\r\n“Nếu bạn có thể thẳng thắn đối diện với bản thân và từ bỏ những thứ đang giam cầm bạn, bạn sẽ trở thành con người có chính kiến, biết quý trọng hơn và đặt những cảm xúc của bản thân lên trên mọi ánh nhìn của người khác.”\r\n\r\nMari Tamagawa khuyến khích mỗi người nên sống thật và ngưng phán xét bản thân. Thật lãng phí khi bạn để cuộc đời mình phải trải qua những tháng ngày khổ sở chỉ vì cái nhìn của người khác. Cũng đừng tin vào những “chiếc phao” cứu cánh mà bạn nhầm tưởng rằng sẽ giúp mình rũ bỏ được mọi lo lắng. Tổn thương tâm lí, áp lực hay nỗi sợ… của bản thân, chúng ta phải đối mặt với nó, chiến đấu và tự chữa trị cho chính mình.\r\n\r\nĐã đến lúc bạn cần phải nói lời tạm biệt với cuộc sống đầy âu lo đang rút cạn năng lượng của bạn. Cuộc đời của bạn không thuộc về ai khác, cuộc đời của bạn thuộc về bạn. Tháng 3 này hãy để “Mặc kệ thiên hạ, sống như người Nhật” giúp bạn bắt đầu cuộc đời mới, cuộc đời mang tên chính mình.', 0),
(7, 'Đời Ngắn Đừng Ngủ Dài', 46000, '“Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải theo cách của ta. Hãy kiên nhẫn. Tin tưởng. Hãy giống như người thợ cắt đá, đều đặn từng nhịp, ngày qua ngày. Cuối cùng, một nhát cắt duy nhất sẽ phá vỡ tảng đá và lộ ra viên kim cương. Người tràn đầy nhiệt huyết và tận tâm với việc mình làm không bao giờ bị chối bỏ. Sự thật là thế.”\r\n\r\nBằng những lời chia sẻ thật ngắn gọn, dễ hiểu về những trải nghiệm và suy ngẫm trong đời, Robin Sharma tiế', 50, 7, 1, 'Còn hàng', 0.05, 'doi-ngan-dung-ngu-dai.jpg', 'Nhắc đến tác giả Robin Sharma, là chúng ta được biết đến một nhà tư tưởng lãnh đạo và cuộc sống hàng đầu hiện nay. Qua rất nhiều cuốn sách của ông, chúng ta thấy được từng lời văn chứa đựng rất nhiều năng lượng và đã truyền cảm hứng tích cực đến các độc giả của mình.\r\n\r\nVà đối với cuốn sách Đời ngắn đừng ngủ dài này, sẽ rất phù hợp dành cho những người nào đang cần nhiều động lực, những lời động viên bản thân thì đây sẽ là cuốn sách dành riêng cho bạn.\r\n\r\nCuốn sách bao gồm 101 câu chuyện được tác giả tự trải nghiệm và tổng hợp rất nhiều về các vấn đề từ cuộc sống, công việc, học tập cho đến cách sống của chính tác giả và những người xung quanh ông. Đó điều là những câu chuyện rất gần gũi và chân thực mà tác giả Robin Sharma muốn truyền tải tới các độc giả thân yêu của mình. Trong những câu chuyện của tác giả kể, người đọc đôi khi sẽ tự cảm thấy chính mình đang ở trong đó cùng với rất nhiều bài học triết lý được rút ra.\r\n\r\nCách viết của tác giả tuy không cầu kỳ hay chau chuốt về mặt ngôn từ, nhưng khi đọc vẫn giúp cho người đọc cảm giác rất sâu sắc và thấm thía, mà không hề tạo ra sự hoa mỹ, màu mè hay cảm giác nhàm chán khi đọc.\r\n\r\nCuốn sách Đời ngắn đừng ngủ dài chứa đựng nhiều câu chuyện khác nhau, nhưng điểm chung là chúng đều truyền cảm hứng và động lực cho người đọc rất thực tế, giúp chúng ta nhận ra rằng, trong cuộc sống bộn bề ngày nay, đôi khi chúng ta cũng nên dành thời gian để nghỉ ngơi và sống chậm lại, thay vì cứ cố gắng hết sức dù cho bản thân mình đã và đang rất mệt mỏi. ', 0),
(8, 'Bạn Thật Sự Có Tài!', 79000, 'Khả năng sáng tạo không phải một loại tài năng thiên bẩm chỉ dành cho một số người đặc biệt, nó là một kỹ năng bất cứ ai cũng có thể học hỏi. Dựa trên nền tảng đó, tác giả - một chuyên gia huấn luyện và cũng là một giáo sư của Đại học Stanford sẽ giúp độc giả hiểu đúng hơn về sự sáng tạo. Cùng với việc làm rõ bản chất của sáng tạo, bà còn cung cấp cho độc giả nhiều ví dụ cực kỳ thú vị về những ý tưởng đột phát ở khắp mọi nơi, trong đó có những công ty nổi tiếng như Google, Pixar, Facebook, IDEO…', 50, 8, 1, 'Còn hàng', 0.05, 'ban-that-su-co-tai-.jpg', 'Khả năng sáng tạo không phải một loại tài năng thiên bẩm chỉ dành cho một số người đặc biệt, nó là một kỹ năng bất cứ ai cũng có thể học hỏi. Dựa trên nền tảng đó, tác giả – một chuyên gia huấn luyện và cũng là một giáo sư của Đại học Stanford sẽ giúp độc giả hiểu đúng hơn về sự sáng tạo. Cùng với việc làm rõ bản chất của sáng tạo, bà còn cung cấp cho độc giả nhiều ví dụ cực kỳ thú vị về những ý tưởng đột phát ở khắp mọi nơi, trong đó có những công ty nổi tiếng như Google, Pixar, Facebook, IDEO… Ngoài ra, dựa trên rất nhiều bài tập và tình huống thực tế thú vị trong quá trình bà làm việc ở Stanford, Tina Seelig đã giới thiệu với chúng ta trong cuốn sách này nhiều công cụ và phương pháp để nâng cao khả năng sáng tạo. Mỗi con người chúng ta được sinh và lớn lên từng ngày . chúng ta bắt đâu làm những công việc để kiếm tiền , xây dựng cuộc sống gia đình nhưng nhiều lúc bạn thấy bế tắc trong cuộc sống , bạn muốn thoát ra khỏi sự bế tắc ấy , bạn muốn trở thành một người lãnh đạo có tài năng , bạn muốn trở thành một người kinh doanh giỏi nhưng không biết phải làm sao . vậy tại sao bạn không tìm đến sách . nó sẽ giúp bạn suy nghĩ lại , định hướng được bản thân , gợi cho bạn sẽ suy nghĩ sẽ biết làm gì . và cuốn sách “bạn thật sự có tài” cũng sẽ giúp bạn suy nghĩ tích cực lên rất nhiều trong cuộc sống này .', 0),
(9, 'Sa Mạc Nở Hoa', 69000, 'SA MẠC NỞ HOA (Dibs in Search of Self) của tác giả Virginia Axline - một nhà trị liệu nổi tiếng về kỹ thuật chữa trị cho trẻ em rối loạn tình cảm - là một trong những quyển sách kinh điển về trị liệu tâm lý cho trẻ em.\r\n\r\n\"Đây là một tài liệu trung thực và đầy đủ, với sự chính xác khoa học, vì tất cả những buổi trị liệu đều được ghi âm. Nhưng nó không chỉ dành cho các chuyên gia, vì cùng lúc nó diễn tả những chi tiết rất gần gũi với chúng ta [...]\" - Tiến sĩ Tô Thị Ánh.', 50, 9, 1, 'Còn hàng', 0.1, 'sa-mac-no-hoa.jpg', 'Viết cho em, cho Dibs nhỏ bé yêu thương\r\n\r\nDibs không nói,\r\nDibs lặng lẽ,\r\nDibs một mình,\r\nNgười ta nghĩ Dibs tự kỷ, hay thiểu năng trí tuệ\r\nCô A đến với thế giới của Dibs cùng những cơn gió lạ của chú giúp việc, cùng với cánh cửa đóng chặt của ba, cùng với ngọn cây bên vườn của Dibs,\r\nCô A đến gõ cánh cửa nơi tâm hồn em,\r\nCô A để em được là em, không phán xét, không áp đặt,\r\nCùng với chú lính và gia đình búp bê,\r\nEm mở cửa tâm hồn em cùng với những câu chuyện từ lâu em vẫn giấu,\r\nCùng với nụ cười của mẹ và những chia sẻ của ba,\r\nDibs trở về,\r\nKhông, em vẫn ở đấy thôi,\r\nNhưng người ta không thấy em,\r\nNgười ta không thấy tâm hồn em,\r\nNhư một đám mây che mất ánh trăng rực rỡ,\r\nNgười ta dùng định kiến, người ta dùng ánh mắt của mình để nhìn vào trái tim em,\r\nSao người ta thấy được những gì em đang che giấu,\r\nSao người ta hiểu được lòng em,\r\nBằng ánh mắt của họ...\r\nTâm hồn em thì vẫn xinh đẹp như thế,\r\nTrái tim em vẫn sáng như trăng rằm,\r\nVẫn đẹp,\r\nNhư sa mạt nở hoa,\r\n', 0),
(10, 'Ít Hoá Nhiều', 49000, 'Trong cuốn sách này, tác giả đã chia sẻ những bí quyết thành công được kiểm chứng từ những doanh nghiệp hùng mạnh và nêu bật lên xu thế mới trong hoạt động kinh doanh trên mọi quy mô.', 55, 10, 7, 'Còn hàng', 0.05, 'it-hoa-nhieu.jpg', 'Các giám đốc điều hành doanh nghiệp luôn tìm cách duy trì năng suất cao, và những  biến động trong hoàn cảnh kinh tế hiện nay càng khẳng định cho nhu cầu này. Trước thực trạng trên, Jason Jennings, chuyên viên tư vấn hàng đầu thế giới đã mang đến một góc nhìn mới mẻ về phương pháp thúc đẩy năng suất, cũng như củng cố năng lực cốt lõi.\r\nTrong cuốn sách này, tác giả đã chia sẻ những bí quyết thành công được kiểm chứng từ những doanh nghiệp hùng mạnh và nêu bật lên xu thế mới trong hoạt động kinh doanh trên mọi quy mô. \r\n\r\nQua đó, bạn sẽ có thể:\r\n- Tăng doanh số thêm 30% mà không cần tăng thêm nhân sự\r\n- Đạt hiệu suất cao hơn gấp 10 lần\r\n- Nắm rõ hướng đi của dòng tiền\r\n- Ứng dụng công nghệ tự động hóa như mong muốn\r\n\r\n***\r\n\r\nCăn cứ vào thành quả kinh doanh vô song liên tiếp của các doanh nghiệp được chúng tôi đề cập trong ấn bản đầu tiên của cuốn Ít hóa nhiều, tôi càng tin tưởng hơn bao giờ hết rằng bất kỳ ai hoạt động kinh doanh đều nên đọc và nghiên cứu cuốn sách này. Những công ty này và những cá nhân lãnh đạo kiệt xuất tại đó đã – một lần nữa! – chứng minh rằng họ là các doanh nghiệp xuất sắc nhất và đạt năng suất cao nhất trên toàn cầu.\r\n\r\nKhó khăn không chừa một ai.\r\nTrong giai đoạn kinh tế suy yếu ngay sau thời kỳ bùng nổ vào cuối thập niên 1990, đa phần các doanh nghiệp đều cố gắng kháng cự và vật lộn để tồn tại. Từ năm 2001 đến 2003, lợi nhuận của các doanh nghiệp Mỹ đã giảm hơn 20% và đa số phải làm tăng ca chỉ để chạm gần đến kết quả kinh doanh của (các) năm trước đó. Chúng tôi đã chứng kiến hàng đợt sóng cắt giảm nhân sự, giảm biên chế, tái cơ cấu và giảm chi tiêu. Chúng tôi cũng nghe thấy hồi chuông báo tử cho các phát kiến mới, và bất kỳ ai liều lĩnh đề nghị đầu tư vào công nghệ thông tin đều bị đe dọa “cho bay đầu”. Hàng nghìn tỉ đô-la vốn cổ đông tan thành mây khói. Và đối với hàng trăm nghìn doanh nghiệp, cuộc giằng co chỉ hóa vô ích và đầy chết chóc.\r\n\r\nNgược lại, mọi công ty được nghiên cứu và đề cập trong ấn bản đầu tiên không chỉ tồn tại mà còn phát triển rực rỡ. Tuy đối diện với cùng một nền kinh tế như bất kỳ đối thủ nào khác, nhưng các công ty này đã phát triển doanh thu, gia tăng lợi nhuận, cùng nhau tạo thêm hàng chục nghìn công việc, giới thiệu các sản phẩm và dịch vụ mới, mua lại các công ty khác cũng như tiếp tục tiến bước cao hơn và xa hơn. Tất cả đều do họ đã làm đúng.', 0),
(11, 'Đồng Tiền Lên Ngôi', 52000, 'Tiền thực sự là gì? Tiền từ đâu đến? Và chúng sẽ đi về đâu? Đồng tiền có bẩn thỉu như chúng ta vẫn thành kiến? Bất chấp tất cả, đồng tiền đã lên ngôi, và sự lên ngôi của đồng tiền là thiết yếu cho sự lên ngôi của loài người, đưa con người từ mức sống khốn khổ lên đỉnh cao của sự thịnh vượng vật chất.\r\n\r\nQua những sự kiện lịch sử vừa vinh quang vừa tăm tối, cùng những nhân vật lẫy lừng vừa có khả năng sáng tạo vừa có khả năng hủy diệt trong thế giới tài chính, Đồng tiền lên ngôi kể câu chuyện hấp', 30, 11, 7, 'Còn hàng', 0.03, 'dong-tien-len-ngoi.jpg', '\"Người ta nói tình yêu quan trọng hơn tiền bạc, nhưng bạn đã bao giờ thử thanh toán hóa đơn bằng một cái ôm chưa?” - Khuyết danh\r\nQuanh đi quẩn lại đến cuối ngày ta lại nói về tiền, cứ như một ngày bạn nhìn mặt đồng tiền chưa đủ vậy. Nhưng có bao giờ bạn rút tờ tiền ra khỏi ví, và tự hỏi đồng tiền này nằm ở đâu trong dòng chảy tiền tệ rộng lớn ngoài kia? Hay khi bạn nhìn chằm chằm vào tài khoản của mình vừa tăng lên vài con số, bạn mừng như điên vì cái cảm giác mình đang giàu lên. Bạn có chắc mình đang giàu lên theo đúng số tiền mà bạn vừa nhìn thấy không? \r\nĐầu năm 2008, Niall Ferguson đã viết trong cuốn sách Đồng tiền lên ngôi như thế này: “Năm 2007 thu nhập của một người Mỹ trung bình (dưới 34.000 đô la chút ít) chỉ tăng suýt soát 5%. Trong khi đó, chi phí sống tăng 4,1%, như vậy trên thực tế ông Mỹ trung bình chỉ giàu có hơn trước 0,9%.” Vậy là, mình chẳng giàu như mình nghĩ đâu.\r\nVới Đồng tiền lên ngôi, bạn sẽ hiểu tại sao, thật là nghịch lý, những người sống ở quốc gia an toàn nhất thế giới cũng là những người được bảo hiểm nhiều nhất trên thế giới. Bạn sẽ phát hiện ra từ bao giờ và tại sao những dân tộc nói tiếng Anh lại mang nỗi ám ảnh kỳ quặc với việc mua bán nhà. Có lẽ điều quan trọng hơn cả là bạn sẽ thấy quá trình toàn cầu hóa tài chính, cùng với nhiều hệ quả khác, đã xóa nhòa ranh giới ngày xưa giữa các thị trường phát triển và các thị trường mới nổi như thế nào, biến Trung Quốc trở thành chủ ngân hàng của nước Mỹ - chủ nợ cộng sản của con nợ tư bản, một sự đổi thay có tầm thời đại.', 0),
(12, 'Chết Bởi Trung Quốc', 75000, 'Death by China hay Chết bởi Trung Quốc được viết bởi Giáo sư Kinh tế và Chính sách Công cộng tại Đại học California, Irvine, Peter Navarro và đồng sự Greg Autry. Quyển sách dày 320 trang này đã thống kê một cách cặn kẽ những chiêu thức kinh tế, xã hội, chính trị, và quân sự của Trung Quốc đã làm mất đi hàng triệu việc làm của Hoa Kỳ cùng với 5 hiểm họa quân sự mà Hoa Kỳ và thế giới tự do phải đối đầu trong những thập niên tới. GS. Navarro cũng phản biện mạnh mẽ những ý kiến của Thomas Friedman v', 30, 13, 7, 'Còn hàng', 0.1, 'chet-boi-trung-quoc.jpg', '\"Chết bởi Trung Quốc\" là cuốn sách khá nổi tiếng của Peter Navarro và Greg Autry về sự trỗi dậy với vỏ bọc hòa bình của con rồng Trung Quốc. Các tác giả đã chỉ ra chính Hoa Kỳ đã/đang và sẽ bị chết bởi Trung Quốc như thế nào. Tác giả liệt kê lần lượt từ chết vì thuốc độc Trung Quốc, chết vì hàng tồi của Trung Quốc, chết vì Trung Quốc ép hạ tầng sản xuất Hoa Kỳ phải chết, chết vì thao túng tiền tệ của Trung Quốc, chết vì sự phản bội của chính các công ty Hòa Kỳ khi họ bán rẻ lương tâm và tổ quốc mình cho Trung Quốc, chết vì gián điệp Trung Quốc đến cái chết từ bọn tin tặc đỏ ... Không những thế, chính những người Trung Quốc cũng sẽ chết vì chính sách bất chấp tất cả để phát triển của chính quyền CS Trung Quốc. Rồi đến các quốc gia ở Châu Phi, Châu Mỹ La Tinh ... cũng sẽ chết bởi con Rồng thực dân đói khát tham lam Trung Quốc. Từ tác phẩm này, người đọc sẽ hiểu tại sao có đến ba nước Trung Quốc: Trung Quốc của Trung Quốc, Trung Quốc của thế giới và Trung Quốc của Việt Nam. Đoạn cuối, tác giả cũng nêu phương thức sống cùng Trung Quốc và chấm dứt những cái chết vì Trung Quốc.\r\n\r\nTác phẩm là lời cảnh báo với Hoa Kỳ, cộng đồng thế giới và với chính người dân Trung Quốc căn cứ từ thực tế nhãn tiền ở những bước đi và âm mưu của chính quyền Trung Quốc hiện tại. Cuốn sách này trở thành cẩm nang của Donald Trump khi đối phó với Trung Quốc. Cuối tháng 12 năm 2016, ông Trump đã bổ nhiệm Peter Navarro, tác giả cuốn sách này, vào vị trí lãnh đạo cơ quan Ủy ban thương mại Quốc gia Hoa Kỳ.\r\n', 0),
(13, 'Khởi Nghiệp Ngay', 42000, 'Nếu bạn mơ ước được làm chủ một công ty lớn, hãy hiện thực hóa ước mơ ấy với việc đọc cuốn sách này. Bằng giọng văn giản dị và hài hước, Khởi nghiệp ngay! mang đến cho bạn các thông tin, nguồn cảm hứng cần thiết đế bắt đầu. Sách khuyến khích bạn bước vào bóng tối, cùng lúc chiếu soi ánh sáng để giúp bạn - một chủ doanh nghiệp mới - chinh phục mọi khó khăn.\r\n\r\nKhởi nghiệp ngay! cho thấy những kỹ năng và chiến thuật mà các ông chủ lớn đã thực hiện. Họ từng khởi nghiệp mà không cần số vốn quá lớn. ', 30, 14, 7, 'Còn hàng', 0.06, 'khoi-nghiep-ngay-jeremy-harbour.jpg', 'Đây là một cuốn sách thú vị sẽ chia sẻ những kinh nghiệm khởi nghiệp cơ bản, chuyên sâu thực tế hiện nay, tránh sai lầm, thất bại, rủi ro trong kinh doanh, giúp cộng đồng khởi nghiệp bền vững!\r\n\r\nThất bại không có nghĩa là dấu chấm hết. Nhưng nó sẽ là dấu chấm hết nếu như các bạn gục ngã trước những áp lực của thất bại.\r\n\r\nNgười giỏi là người thành công nhưng để trở thành xuất chúng, bạn cần phải vượt qua những thất bại hay phá sản theo một cách trưởng thành và chuyên nghiệp. Các bại binh không bao giờ bại nếu họ biết chiến thắng chính mình.\r\n\r\nCùng là khởi nghiệp, cùng vất vả như nhau…Nhưng nếu thành công, sẽ được tung hô lên tận mây xanh Và người thất bại, không biết là đã cố gắng thế nào, cũng vẫn chỉ in trong trí nhớ người khác là “kẻ thua cuộc”.\r\n\r\nThế đấy, đâu cần biết chặng đường bạn đi đã gian nan ra sao, người ta chỉ cần biết cái kết của câu chuyện thế nào!\r\n\r\nKhởi nghiệp ngay – Sạt nghiệp luôn là cuốn sách tâm huyết của tác giả Vũ Tuấn Anh. Với hơn 20 năm kinh nghiệm. Tác giả không ngần ngại chia sẻ những điều đó cho công đồng khởi nghiệp. Bằng những khẳng định gây sốc nhưng không thể thực tế hơn. Cuốn sách mang lại cho đọc giả những khó khăn, những rủi ro, những sai lầm có thể gặp phải để cộng đồng khởi nghiệp trẻ không bối rối khi gặp phải.\r\n\r\nNhững bài học về sữ dụng tiền như một bà nội trợ, vượt qua áp lực của thất bại hay phá sản theo một cách trưởng thành và chuyên nghiệp… và muôn vàng những điều thú vị khác sẽ được chia sẽ một cách gàn gũi, thú vị. Dạy bạn biết khó nhưng không nản, biết cách chơi thật “nét” với tất cả nhệt huyết của tuổi trẻ nhưng biết nhìn trước, ngó sau để không thất bại một cách vô nghĩa.', 0),
(14, 'Mắt Biếc', 60000, 'Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát)', 150, 15, 10, 'Còn hàng', 0.05, 'mat-biec.jpg', 'Mắt biếc – Kết cục buồn cho những kẻ ôm mối tình si\r\nMắt biếc được tác giả Nguyễn Nhật Ánh sáng tác vào năm 1990. 30 năm sau, câu chuyện ngây thơ tình si ngày nào của Ngạn và Hà Lan cuối cùng đã được lên màn ảnh rộng.\r\nViết về Mắt biếc là viết về những mối tình si. Không chỉ một mà tới 3 câu chuyện tình. Và chỉ một trong số đó được cái kết có hậu.\r\n\r\nCâu chuyện mở đầu với tuổi thơ của Ngạn, một cậu bé thuộc trường phái cổ điển và cô gái hơi hướng hiện đại Hà Lan. Hai người bên nhau từ thời cởi truồng tắm mưa, những ngày tiểu học giành cái trống trường, cho đến những tháng ngày lặng lẽ làm đôi bạn cùng tiến, và nổi giông bão ở cái thời điểm Hà Lan lên thành phố học hành.\r\n\r\nCho dù Nguyễn Nhật Ánh đã cố giành lấy sự đồng cảm của độc giả khi để dành nhân vật “tôi” trong vai Ngạn tự kể về thời ấu thơ cho tới khi trưởng thành, kể về những tháng ngày được ở bên cạnh Hà Lan. Nhưng không thể phủ nhận một sự thật rằng, cậu bé Ngạn và cô bé Lan của ngày nào vốn dĩ đã sống ở 2 thế giới hoàn toàn khác nhau, cho dù khởi đầu chung một môi trường giáo dục.\r\n\r\nNgạn là một kẻ nhút nhát, rụt rè, sống nội tâm và không có gì nổi bật\r\n\r\nTrái lại, “mắt biếc” Hà Lan mang danh cô gái miền quê xa xứ, nhưng lại đặc biệt mến thương chốn xa hoa thị thành. Cô dường như được sinh ra để dành trọn tình yêu cho những gì đẹp đẽ ở thành phố, nơi mà Lan lần đầu tiên đi học đã quay về miêu tả rằng “đó là nơi huyền ảo, đẹp lung linh gấp trăm lần quê mình”.\r\n\r\nNgạn thích những gì cổ điển, những gì rụt rè, những gì âm thầm, những mối tình câm, ý tại ngôn ngoại.\r\n\r\nLan phá cách, lớn trước tuổi. Cô yêu Dũng ở độ tuổi trăng tròn, và sống chết với mối tình ấy một cách hết sức ngây thơ, nhàm chán.\r\n\r\nVà dĩ nhiên là 2 con người ấy, vốn ngay từ đầu định mệnh đã an bài rằng họ chỉ có thể làm bạn\r\n\r\nNgạn là bài học cảnh tỉnh cho những anh chàng thích đóng vai trai tốt\r\nNo love for good man – Không có tình yêu nào cho những trai tốt! Ông bà đã đúc kết thành câu châm ngôn như vậy từ xa xưa, nhưng vẫn không ít chàng trai thời đại bây giờ vẫn thích đóng vai trai tốt.\r\n\r\nBởi họ đang hiểu nhầm cái nghĩa thực sự của “trai tốt”\r\n\r\nVà Hà Lan đã định nghĩa được đúng đắn nhất cái danh xưng này, thông qua một nhân vật không thể thảm hại hơn, không ai khác chính là Ngạn!\r\n\r\nKhi nào Ngạn biết được Hà Lan không yêu mình? Đó là thời điểm mà cô nghe tiếng đàn của anh.\r\n\r\nCó cô gái nào nghe chàng trai bên cạnh đánh đàn cho mình hơn một năm trời, mà không hiểu ý tứ của anh ta? Chẳng ai hết. Hà Lan biết Ngạn yêu mình, và vô cùng thất vọng khi hơn 1 năm trời mà anh chàng lù đù cục mịch kia chỉ dám “gảy đàn”. Một lời thốt ra cũng tuyệt nhiên không có.\r\n\r\nreview sach mat biec by reviewsach.net\r\nẢnh: Instagram\r\nThậm chí đến phút cuối cùng, chán nản cô mới hỏi “rõ ràng bài này ông sáng tác phải hông”, thì Ngạn mới thành thật “ừ đúng rồi, tất cả những bài hát trước nay tôi đàn đều là do tui tự sáng tác”\r\n\r\nVà Hà Lan cũng biết tỏng từ lâu rồi. Trời ạ, cái giây phút đó mà Ngạn tỏ tình luôn, thì mối tình ấy đã kết thúc ngay từ lúc ấy, chứ nó không đau đớn thành một câu chuyện day dứt nhiều năm liền\r\n\r\nCó thể một anh chàng rụt rè như trường hợp này, vẫn còn có thể cứu vãn. Nhưng rồi khi Lan lên thành phố, khi bắt gặp Dũng, mọi cơ hội đã chính thức khép lại với chàng Ngạn tội nghiệp ngày nào! Bởi ngay lúc đó, Dũng hơn hẳn Ngạn về mọi mặt. Dù sau này Dũng lộ chân tướng là trai xấu, nhưng ít nhất hắn cũng thú vị hơn cậu bé rụt rè ở quê\r\n\r\nNhiều năm sau, khi mà con gái của Hà Lan đã lên lớp 9, khi mà Ngạn lẫn Hà Lan đều đã ngoài 30, Ngạn một lần nữa lại không thể lọt vào mắt xanh của cô gái năm ấy, một kết cục không thể thảm hại hơn!\r\n\r\nCái ngày định mệnh mà mẹ của Lan nói thẳng với cô về vấn đề yêu Ngạn đi, Hà Lan đáp “anh ấy quá tốt, con không xứng với anh ấy”\r\n\r\nCâu nói đó được dịch nghĩa đầy đủ là “cho dù con đã là mẹ đơn thân, đã có một cô con gái, nhưng anh giáo làng cục mịch tên là Ngạn kia vẫn không thể trở thành người xứng đôi với con được mẹ ạ. Anh ta quá nhạt, quá kém, không dám tỏ tình đến tận bây giờ, không dám giành lấy tình yêu, không chủ động. Một chàng trai như vậy thì ai dám đặt niềm tin để dựa vào?”.\r\n\r\nQuá đủ thảm hại cho những người trai tốt! Định nghĩa đúng đắn nhất cho từ trai tốt ở đây là “họ nhạt nhòa, thảm hại và họ tưởng rằng thế là tốt, thế là hay”\r\n\r\nCũng như trong bóng đá, một đội bóng không thể cứ tấn công ào ào, đan bóng đẹp mắt, rực lửa là hay. Cái mấu chốt ở đây là ghi bàn. Tán gái cũng vậy, hình ảnh Ngạn trong câu chuyện mắt biếc này chỉ là ôm mối tình si hàng chục năm trời, không dám mở lời quyết định, thì thất bại là 100%\r\n\r\nHà Lan – mối tình đầu và sau tất cả là cái kết có hậu\r\nYêu một cách dại khờ, đó là Hà Lan. Biết rõ Dũng là gã chẳng ra gì, lăng nhăng nhưng vẫn yêu, vẫn tha thứ nhiều lần. Ở cái tuổi 17, trao thân cho người chẳng xứng đáng, để rồi mang thai và làm mẹ đơn thân. Một cô gái dám yêu và biết yêu, nhưng lại có một mối tình buồn bởi vì đã chọn sai người.\r\n\r\nmắt biếc - hà lan - reviewsachonly\r\nẢnh: Instagran\r\nHà Lan yêu Dũng hệt như cái cách cô yêu thành phố, nơi cô thuộc về. Nhưng tình yêu đó khác hẳn hoàn toàn với tình yêu thành thị. Mưu cầu sự đẹp đẽ xa hoa ở thành phố không có gì sai. Cô hoàn toàn có quyền làm thế. Nhưng yêu một người không ra gì mà vẫn năm lần bảy lượt bỏ qua thì cô đã mù quáng hoàn toàn.\r\n\r\nThậm chí cái tình yêu của cô Mắt Biếc cũng si cuồng chẳng kém gì tình yêu của Ngạn đối với cô. Bởi vì nhiều năm sau, cô lại muốn tiến tới với một anh chàng khác tên là Linh, chỉ bởi vì Linh trông có nét gì đó rất giống vẻ phong lưu ngày xưa của Dũng!!!!!!!Nhưng điểm khác biệt ở đây là cô lí trí hơn Ngạn nhiều, và bởi vậy sau tất cả, cô đã có được thứ mình cần, một mối tình cuối cùng với người chồng chấp nhận được quá khứ của cô. Và Hà Lan xứng đáng với cái kết có hậu này, một cô gái có một cái hạnh phúc tuy muộn màng, nhưng vô cùng cần thiết.Cách cô từ chối Ngạn cũng rất tuyệt vời, thẳng thắn và lạnh lùng, đủ để thức tỉnh được những tâm hồn thích đóng vai “trai tốt”\r\n\r\nCái hay của Nguyễn Nhật Ánh là gợi mở từ từ số phận của từng người, đối với Hà Lan thì ngay từ đầu truyện đã tiết lộ theo cái phong cách Định mệnh an bài, y như người bà nội của Ngạn đã nói “số con bé nó khổ, nó có đôi mắt biếc, nên đời nó vậy, vất vả long đong”\r\n\r\nNhưng thực ra thì cô gái mắt biếc này còn mạnh mẽ hơn thế! Sau tất cả thì lời bà nội của Ngạn chưa hẳn đã đúng!\r\n\r\nXem thêm review sách: Bảy bước tới mùa hè\r\n\r\nĐiểm sáng trong câu chuyện – Trà Long & Ngạn\r\nAnh chàng Ngạn cũng may mắn hệt như một gã sư thúc nào đó trong câu chuyện kiếm hiệp Ỷ Thiên Đồ Long Ký của Kim Dung. Gã yêu mẹ, nhưng rồi lại kết hôn với con gái. Tất nhiên đó là kiếm hiệp, nơi chàng và nàng gặp nhau vài ngày là đã ôm mối tình si.\r\n\r\nCòn với Ngạn và Trà Long – cô con gái 16 tuổi của Hà Lan ngày nào, thì đó là một câu chuyện khác.', 0),
(15, 'Bồ Câu Không Đưa Thư', 70000, 'Hẳn bạn đọc ở lứa tuổi học trò đã từng quen thuộc với tác giả Nguyễn Nhật Ánh với những truyện ngắn và truyện dài đậm chất học trò như: Trại hoa vàng, Chú bé rắc rối, Phòng trọ ba người, Bồ câu không đưa thư, Những chàng trai xấu tính, Cô gái đến từ hôm qua, Trước vòng chung kết, Hạ đỏ, Hoa hồng xứ khác, Buổi chiều Windows, Ut Quyên và tôi...\r\n\r\nVới lối viết dung dị và cách chọn đề tài gần gũi với lứa tuổi học trò, như quan hệ thầy trò, trường lớp, bạn bè, gia đình... nên những truyện của ông ch', 40, 15, 10, 'Còn hàng', 0.05, 'bo-cau-khong-dua-thu.jpg', 'âu chuyện bắt đầu từ lá thư làm quen để trong học bàn của Thục, trong bộ ba Xuyến, Thục, Cúc Hương.\r\n\r\nLá thư chân tình đã thu hút sự tò mò của bộ ba, và họ bị cuốn hút vào trò chơi với người giấu mặt, dần hồi kéo theo Phán củi, anh chàng xấu xí vụng về của lớp làm quân sư và giúp xướng họa thơ. Cuộc truy tìm dẫn mọi người đến nhiều hiểu lầm tai hại và cả những bất ngờ thú vị. Và điều bất ngờ cuối cùng đã được phát hiện quá muộn. Vì sao? Xin để cho bạn đọc tự khám phá', 0),
(16, 'Bảy Bước Tới Mùa Hè', 69000, 'Bảy bước tới mùa hè là tác phẩm mới nhất của Nguyễn Nhật Ánh, được nhà văn đề tặng \"Những năm ấu thơ\", như một món quà dành tặng các bạn đọc thân thiết của mình nhân dịp đầu năm mới.\r\n\r\nCâu chuyện về một mùa hè ngọt ngào, những trò chơi nghịch ngợm và bâng khuâng tình cảm tuổi mới lớn. Chỉ vậy thôi nhưng chứng tỏ tác giả đúng là nhà kể chuyện hóm hỉnh, khiến độc giả cuốn hút từ trang đầu đến trang cuối cùng. Chúng ta sẽ bắt gặp giọng văn giản dị, trong trẻo của nhà văn Nguyễn Nhật Ánh và một kết', 50, 15, 10, 'Còn hàng', 0.05, 'bay-buoc-toi-mua-he.jpg', '“Bảy bước tới mùa hè”, có thể nói là chiếc cầu của miền kí ức mà Nguyễn Nhật Ánh đã dày công xây dựng để dành tặng cho những ai đã và đang đi quá xa tuổi thơ của mình nhưng lại ao ước được một lần quay trở lại để gặp lại chính mình của ngày xưa\r\nAi trong chúng ta chẳng có một thời để nhớ, để vấn vương suốt cả một đời người. Mỗi lần đọc “ bảy bước tới mùa hè” là lại một lần được nhìn thấy những vấn vương thời ấu thơ ấy, sôi nổi và nồng nhiệt, trầm mặc và yêu thương như mới xảy ra ngày hôm qua. Nguyễn Nhật Ánh không phải là một cái tên xa lạ đối với những người yêu mến văn học Việt Nam. Là nhà văn chuyên viết sách cho trẻ em, ông lặng lẽ đi tìm mật ngọt trong quá khứ, chắt chiu từng giọt nắng mà kết tinh thành những tác phẩm đi suốt cả một đời người. Không quá khi cho rằng “Bảy bước tới mùa hè” là một trong những tác phẩm thành công nhất của Nguyễn Nhật Ánh, về cả phương diện nghệ thuật và nội dung khi truyền tải xuất sắc những hình ảnh của tuổi thơ mà ai cũng đã từng trải qua.\r\n\r\nTính cách người lớn và trẻ con đan xen trong từng nhân vật\r\n“Bảy bước tới mùa hè”  xoay quanh những nhân vật ở độ tuổi mới lớn, độ tuổi mà những cơn mưa rào mới lạ ngày ngày vẫn rơi xuống để nuôi dưỡng những tâm hồn còn trẻ dại nhưng lại rất nhạy cảm với những cảm xúc mới- Khoa, Mừng, Bông, Trang và Đào\r\n\r\nKhoa- chàng trai si tình là nhân vật mở đầu tác phẩm. Xuất hiện với phong cách rất đặc biệt, của một phù thủy nhưng đầy vẻ lãng tử, gào thét những câu hát để gửi tới người mình thương: “Trên chiếc chổi bay này tôi nhớ em. Giữa cơn gió lạnh tê người này tôi nhớ em”. Phù thủy của chúng ta trong một kì nghỉ hè phải lòng cô bạn hàng xóm- Trang, vì cô nàng mà chàng đã làm những việc mà chẳng ai có thể ngờ tới. Nào là lừa ông để lấy tiền học lớp mà khoa đã học rồi chỉ để được gần với Trang. Nào là mong muốn được vào rừng làm cướp để nói chuyện với cô bạn vì bình thường Khoa không thể mở miệng được. Những tình cảm trẻ con, những thổn thức của mối tình đầu rơi xuống trái tim bé nhỏ của Khoa. Tác giả đã miêu tả rất thành công tâm trạng bối rối khi lần đầu tiên yêu một người của nhân vật. Biết ngại ngùng, biết lo âu, biết sợ hãi vì “mất hình tượng” trước người mình thương. Chàng trai năm nào còn ra suối tắm, bắt cá bắn chim nay đã biết ngồi vẩn vơ nghĩ về một người, biết đau buồn khi phải rời xa Trang, biết liều mình bảo vệ người mình thương. Bởi hè năm nay Khoa đã lớn….\r\nMừng- bạn thân của Khoa, được khắc họa là một nhân vật có tính cách phóng khoáng, ham chơi nhưng lại rất tốt bụng. Mừng đã từng giận Khoa khi Khoa đột nhiên lại đi thích con gái, cho rằng khoa là kẻ phản bội. Ấy vậy mà cuối cùng chàng cũng không thoát khỏi lưới tình của nhỏ Đào. Bởi cũng giống như Khoa, Mừng cũng đã lớn, năm nay, Mừng bắt gặp mình ngại ngùng khi gặp Đào, thấy bất ngờ khi đột nhiên mình quan tâm đến cô bạn nhiều hơn. Khác với Khoa, ngay khi chạm mặt những rung động ấy, Mừng đã biết mình thích Đào. Nhưng cũng giống như khoa, hai trường phái tính cách người lớn và trẻ con tồn tại trong Mừng. Anh chàng mê đắm truyện hiệp sĩ giang hồ, cùng Khoa và Bông vào rừng làm giả làm cướp, đánh bạn chặn thầy. Đương nhiên đó chỉ là những trò chơi trẻ con, xuất phát từ tấm lòng nghĩa hiệp muốn trả thù cho bạn. Khi khoác trên mình chiếc mặt nạ, Mừng can đảm là thế. Vậy mà khi đối diện nhỏ Đào, Mừng cũng chỉ là một chàng trai mới yêu, tìm mọi cách để lấy lòng cô bạn, nghĩ ra trăm phương ngàn kế, kể cả vào rừng làm cướp để lấy lòng cô bạn, để rồi lại buồn vẩn vơ khi không được để ý.Nhưng có một điều chắc chắn là tình cảm của Mừng rất chân thành và trong sáng. Có thể nói Nguyễn Nhật Ánh là bậc thầy trong miêu tả tâm lý những nhân vật mới lớn, khi rất trẻ con, khi lại rất trưởng thành trong suy nghĩ.\r\n\r\nTuyến nhân vật phụ – Trang và Đào là những nàng thơ trong câu chuyện tình của Khoa và Mừng. Được khắc họa là những nhân vật ngây thơ và dễ thương. Trong sáng và ngây thơ đến độ không ít lần làm các chàng trai hụt hẫng và đau đớn vì sự hững hờ của các nàng. Nhưng nói cho cùng, sự xuất hiện của họ đã trở thành một nốt nhạc trong nhất, tuyệt vời nhất trong bản nhạc cuộc đời của Khoa và Mừng.\r\n\r\nChất thơ dào dạt cất lên từ bối cảnh làng quê yên bình\r\nCó lẽ cuộc đời là một chiếc đồng hồ, chỉ có thể tiến chứ không thể lùi. Con người ta thường tiến về phía hào nhoáng của ánh đèn mà quên mất vẻ hiền dịu của ánh trăng. Nguyễn Nhật Ánh lại khác, ông lặng lẽ đi về miền quê dạt dào ánh nắng của tuổi thơ, thấm đẫm những cơn gió trải dài trên những con suối, nhẹ nhàng những tiếng cười khúc khích nơi thôn quê bình lặng. Ở nơi ấy, Khoa và Mừng thưởng thức một mùa hè tràn ngập nắng và gió, một mùa hè của sự đổi thay trong tâm hồn của những nhân vật. Là những buổi chiều Khoa và Mừng bàn bạc những kế hoạch tác chiến để gây ấn tượng vơi Trang và, Đào. Là cánh rừng ấm áp bao bọc lấy những tên tướng cướp con khi họ quyết định giả làm cướp. Là những trận đòn roi của dì Liên khi Khoa nghịch ngợm, những con đường dát vàng màu lúa khi Mừng dắt ông của Đào đi dạo. Tất cả những hình ảnh rất đỗi thân thương tưởng chừng đã đi vào dĩ vãng nay một lần nữa được tác giả làm sống dậy trong tròng độc giả. Làng quê thanh bình và yên ả đã chứng kiến tuổi thơ của các nhân vật, từ khi là trẻ con cho đến khi biết yêu và khi họ rời bỏ tuổi thơ của mình để trở thành người lớn.\r\n\r\nBảy bước tới mùa hè- sứ giả của kí ức\r\n\r\n“Bạn cũng biết rồi đó, kí ức là ngôi nhà quý báu, nơi cất giữ những gì đã xảy ra trong cuộc đời của mỗi người. Nói cách khác, kí ức cất giữ những kỉ niệm. Nhưng không phải những gì xảy ra trong cuộc đời đều hóa thành kỉ niệm. Chẳng hạn trước đây mười lăm năm, bạn từng khóc vì bị bụi bay vào mắt. Kí ức của bạn sẽ không lưu giữ trận khóc tầm thường đó. Nhưng nếu cách đây mười lăm năm bạn khóc vì chia tay mối tình đầu vụng dại, cơn mưa nước mắt ấy sẽ hóa thành cơn mưa kỉ niệm.”– Nguyễn Nhật Ánh\r\n\r\nNgôn từ vốn dĩ cũng có hồn, hồn của “ bảy bước tới mùa hè” là tuổi thơ. Nhà văn đã dày công thiết kế một chiếc tủ, ở nơi ấy cất giữ mối tình đầu vụng dại của Khoa và Mừng, có cả nước mắt lẫn nỗi buồn. Đồng thời, cũng bảo vệ những kí ức tuổi thơ, là những trò chơi mà chỉ trẻ con mới có thể nghĩ ra, nỗi giận hờn của Khoa và cũng là của học sinh nói chung đối với thầy Tám; là những buổi trưa trốn ngủ trèo cây hát nghêu ngao và những cuộc rượt đuổi không hồi kết của dì Liên vì Khoa quá nghịch ngợm; là một Bông nghiện bánh mì, một Ninh chuyên bắt nạt bạn… Nói cho cùng, kí ức là thứ đẹp nhất, dù ở thời điểm hiện tại, nó chỉ là những sự việc bạn cho rằng không đáng nhớ, thì ở tương lai khi bạn nghĩ lại, bạn sẽ cảm thấy đau lòng vì không thể quay lại để tận hưởng những kí ức đó thêm một lần nữa. Nói cho cùng, “bảy bước tới mùa hè” vẫn xứng đáng là một cỗ máy thời gian đưa ta về với tuổi ấu thơ, để lại vẩn vơ tự hỏi: “ Trò chuyện với đứa con gái mình thích sao khó ghê mày há”\r\n\r\nNgày hôm nay cũng có những người đang buồn rầu bỏ lại sau lưng cả một bầu trời sôi nổi và nồng nhiệt, ngọt ngào và hạnh phúc ở lại và dù đã cố gắng,  cũng không thể nào níu kéo. Với tất cả những ai đang phải dằn lòng bỏ lại tuổi thơ, xin hãy thử đọc “Bảy bước tới mùa hè”, và chắc chắn sẽ gặp lại mùa hè đã từng lãng quên.', 0),
(17, 'Buổi Chiều Windows', 55000, 'Hẳn bạn đọc ở lứa tuổi học trò đã từng quen thuộc với tác giả Nguyễn Nhật Anh với những truyện ngắn và truyện dài đậm chất học trò như: Trại hoa vàng, Chú bé rắc rối, Phòng trọ ba người, Bồ câu không đưa thư, Những chàng trai xấu tính, Cô gái đến từ hôm qua, Trước vòng chung kết, Hạ đỏ, Hoa hồng xứ khác, Buổi chiều Windows, Ut Quyên và tôi... Với lối viết dung dị và cách chọn đề tài gần gũi với lứa tuổi học trò, như quan hệ thầy trò, trường lớp, bạn bè, gia đình... nên những truyện của ông chiếm', 50, 15, 10, 'Còn hàng', 0.05, 'buoi-chieu-windows.jpg', 'Nói là áo trắng, nhưng câu chuyện nào có nói đến ai mặc cái áo màu trắng nào đâu! Thực ra, chuyện lại là về “tam đầu quậy” quen thuộc đi xin việc ở một công ty máy tính. Xin việc là để cho oai chứ thực ra cả 3 có biết gì về dăm thứ máy tính hay tin học gì đâu! Thật không ngờ, dù Xuyến đã lên kế hoạch sẵn trong đầu nhưng cái bí mật khủng khiếp này đã được “bật mí” ngay từ ngày đầu tiên đến xin việc. Nhưng, không ngờ hơn hết là hai anh chàng phụ trách mấy cô nương này lại đồng ý cho hai cô vào vừa làm vừa học. Rồi từ đó, cả ba lại không “thoát khỏi lưới tình”. Xuyến thì với chàng Thiếu hiền lành, Thục thì rơi vào tưởng tượng với nhà thơ Tóc Mây, Cúc Hương lại với anh Vân. Nhưng cuối cùng, Thục thì rơi từ 3 tầng mây xuống đất còn Cúc Hương lại không may rơi hẳn từ 9 tầng xuống. Chỉ có mỗi Xuyến, cô gái hệ “SECAM” thì lại may mắn hơn cả. Câu chuyện này bắt đầu với một bối cảnh vui tươi, tinh nghịch mà lại kết thúc hài hòa, đầy hy vọng!', 0),
(18, 'Hạ Đỏ', 39000, 'Mùa hè là khoảng thời gian mà học trò không còn lo lắng chuyện học hành và cũng là mùa để họ vui chơi giải trí. Mùa hè này, anh chàng Chương còm sẽ về quê ngoại để đổi gió và nghỉ ngơi sau chín tháng dài học hành căng thẳng với đầy nỗi âu lo. Nơi quê ngoại Chương sẽ làm gì và học hỏi được những gì ? Xin mời các bạn cùng đón đọc Hạ Ðỏ để biết được toàn bộ nội dung câu chuyện này.', 40, 15, 10, 'Còn hàng', 0.05, 'ha-do.jpg', 'Hạ đỏ, cũng như những mùa hạ khác của Nguyễn Nhật Ánh, ám ảnh, da diết và vỡ vụn. Có những mùa hạ trôi qua, đong đầy thương nhớ; cũng có những mùa hạ đến rồi lại gạn vợi niềm vui. Đọc câu chuyện, độc giả hẳn không thể nào cầm nổi nước mắt, lại thêm một chuyện tình buồn, khiến nhiều lúc lại bâng khuâng tự hỏi phải chăng tình đầu luôn là mối tình đớn đau nhất.\r\nCâu chuyện kể về Chương, trong một kì nghỉ hè về quê ngoại, vô tình phải lòng Út thêm, cô bạn cùng quê. Những câu chuyện vụn vặt, nhỏ bé góp thành những bức tranh đẹp, mà trong đó Chương và những người bạn của anh là Nhạn và Dế là nhân vật chính. Từ đó mở ra trong tác phẩm vừa là tuổi thơ tràn đầy sức sống, vừa là nỗi đau da diết khôn nguôi, cất lên từ mối tình buồn của Chương và Út Thêm.\r\n\r\nVụn vặt, nhỏ bé mà góp thành tuổi thơ\r\n“Tôi thấy Nguyễn Nhật Ánh trong tuổi thơ” – Hải Đăng\r\n\r\nCũng như con ong biến trăm hoa thành một mật, Nguyễn Nhật Ánh lặng lẽ đi tìm mật ngọt từ tuổi thơ của mỗi người, để kết tinh thành những trang sách làm lay động trái tim của biết bao thế hệ. Tuổi thơ đó là quê ngoại yên bình có Nhạn và Dế, được che chở bằng những lũy tre xanh mát, từng giọt vàng rơi xuống đường quê, khiến người ta nặng lòng không muốn rời. Là những buổi trưa cùng Nhạn vào vườn bắn trộm chim, hái trộm xoài. Là những trận đánh “kinh điển” với Dư, mỗi trận đều hấp dẫn như ngoài chiến trường. Và cả những rung động của tuổi mới lớn. Những kí ức đó là dư vị đã níu giữ chân người đọc mỗi lần đọc Hạ đỏ.\r\n\r\n Những câu chuyện hết sức bình dị nay được vẽ lại dưới ngòi bút của Nguyễn Nhật Ánh, nên thơ, đẹp đẽ và trong ngần. Ai trong chúng ta chẳng có một mùa hạ để mà nhớ, cũng giống như Chương thôi. Cứ như thế, mùa hạ đỏ lặng lẽ và trầm ngâm, từng chút một hiện ra dưới ngòi bút. Trong mùa hạ đẹp khôn cùng đó, điểm xuyết một vài thanh nhạc trầm đến từ tình yêu không vẹn tròn, nhưng dẫu sao cũng đã thành công dẫn người đọc vào địa hạt của tuổi thơ. Đó chính là mong ước cuối cùng của tác giả mỗi khi viết tác phẩm. Đâu phải ngẫu nhiên mà Nguyễn Nhật Ánh được ca tụng là người đi tìm kí ức. ', 0);
INSERT INTO `product` (`PRODUCT_ID`, `PRODUCT_NAME`, `PRICE`, `OTHER`, `NUMBER`, `AUTHOR_ID`, `CATEGORY_ID`, `STATUS`, `DISCOUNT`, `IMAGE`, `DESCRIPTION`, `AVG_RATE`) VALUES
(19, 'Tôi Là Bêtô', 60000, 'Tôi là Bêtô - lời tự giới thiệu và cũng là lời tự khẳng định về mình của một chú cún, xuất hiện ở chương cuối truyện, nhưng lại có ý nghĩa dẫn dắt ngay từ đầu cho câu chuyện được kể. Đó là chuyện cún với các bạn bè của cún, như Binô, cả hai cùng sống với cô chủ Ni và ba mẹ của cô, cùng bà cố - ở một nơi khác,  nơi cún có thêm một bạn mới là Laica. Nhìn, nghĩ và ứng xử theo cách của cún, ngoài hàng trăm \"điều thú vị ở đời\" ta còn nhận ra được sự phân biệt tốt - xấu trong thế giới người, một cảm n', 30, 15, 10, 'Còn hàng', 0.05, 'toi-la-beto.jpg', 'Tôi Là Bêtô là tác phẩm mới nhất của nhà văn chuyên viết cho thanh thiếu niên của Nguyễn Nhật Ánh. Anh đã được đông đảo bạn đọc biết đến qua các tác phẩm quen thuộc như Thằng quỷ nhỏ, Trại hoa vàng, Bong bóng lên trời, Cô gái đến từ hôm qua… và hai bộ truyện nhiều tập Kính vạn hoa và Chuyện xứ Lang Biang. Với Tôi là Bêtô, đây là lần đầu tiên anh viết một tác phẩm qua lời kể của một chú cún. Trong thiên truyện này, thế giới được nhìn một cách trong trẻo nhưng lồng trong đó không thiếu những ý tứ thâm trầm, khiến người đọc phải ngẫm nghĩ. Đây chắc chắn là tác phẩm không chỉ dành cho trẻ em.\r\n\r\n“Tôi xa quê từ rất sớm. Có lẽ vì vậy, đối với tôi tuổi thơ là một vùng trời luôn lung linh trong ký ức. Tôi vẫn còn nhớ rõ hình ảnh những trưa hè tuổi thơ, tôi ngồi trong vườn cây nhà dì chơi đùa ra sao với các anh chị con dì, nhớ những ngày trốn học đi tắm sông, mẹ tôi phải lặn lội đi tìm, nhớ những cánh diều trong sân trường tiểu học, nhớ cây trứng cá sai trái ở ngoài cửa sổ lớp tôi… Đến bây giờ, những lúc ngồi ôn lại những kỷ niệm ngày xưa còn bé, tôi luôn cảm thấy bồi hồi. Đó là tâm trạng nuối tiếc của kẻ đã rời xa sân ga tuổi nhỏ và biết mình vĩnh viễn không quay lại được.\r\n\r\nCó lẽ chính sự ám ảnh đó đã đi vào các trang sách của tôi và tự nhiên tôi trở thành nhà văn viết cho trẻ em. Mà thực ra cũng có một phần là viết cho chính mình, như một cách giải tỏa. Và đó chính là “thực tế” quan trọng nhất của tôi. Vì tôi nghĩ một nhà văn chỉ viết hay, viết xúc động nhất về những gì làm cho anh ta bức xúc, khao khát – những gì gần gũi, thân thuộc, máu thịt và giàu sức ám ảnh nhất.”\r\n\r\n(Nguyễn Nhật Ánh)', 0),
(20, 'Chỉ Vì Yêu', 42000, 'Bạn đã từng thử nắm tay người mình yêu, chạy trên phố xá sầm uất một cách điên cuồng chưa?\r\n\r\nHãy một lần thử xem.\r\n\r\nNhững người yêu nhau cuồng nhiệt chỉ cần xa nhau một thời gian cũng đã thấy bất an còn anh và cô mỗi người lại ở một phương trời suốt mười sáu năm.\r\n\r\nAnh hận cô đến mức không muốn nhắc đến cô nhưng con tim anh lại nhớ đến cô quay quắt, nỗi nhớ đã theo anh dai dẳng suốt sáu năm trời.\r\n\r\nCô yêu anh, yêu đến mức khi anh quay về, cô đã dùng mọi thủ đoạn để nối lại tình xưa, yêu đến ', 30, 17, 3, 'Còn hàng', 0.05, 'chi-vi-yeu.jpg', 'Sói xám mọc cánh – từ đầu năm đến giờ, truyện của tác giả này được xuất bản/dịch – edit online với rất nhiều truyện. Và trong tất cả những truyện mà tôi đã từng vô tình đọc được giới thiệu thì có lẽ “Chỉ vì yêu” là truyện tôi hứng thú đọc nhất, bởi đây là truyện nói về Cố Minh Châu.\r\n\r\nTrong bảng xếp hạng nào đó của Trung Quốc thì tác giả này có một truyện được xếp vị thứ khá cao là “Nở rộ” – chuyện tình của Cố Yên và Lương Phi Phàm. Vào thời điểm truyện này được chuyển ngữ sang tiếng Việt gần xong thì tôi mới đọc. Nhưng thú thực là tôi không tìm thấy hứng thú với truyện này, nên chỉ đọc được vài chương rồi bỏ dở. Những gì còn đọng lại trong tôi lúc bấy giờ là rất ấn tượng với một nhân vật phụ trong truyện – Cố Minh Châu – một người con gái có thể cứng rắn và lạnh lùng đến mức nào mới có thể bán người em gái của mình để cứu cha ra khỏi cảnh lao tù.\r\n\r\n“Chỉ vì yêu” là câu chuyện về cặp đôi Dung Lỗi và Cố Minh Châu. Hai người yêu nhau từ những ngày trẻ trung nhất, có ước mơ của riêng mình và cố gắng tất cả để thực hiện nó cùng với nhau. Giữa lúc mọi chuyện tưởng chừng như tốt đẹp nhất ấy thì biến cố đến với gia đình họ Cố, gánh nặng của cả gia tộc đè lên vai Cố Minh Châu và cô đã lựa chọn xa Dung Lỗi để gánh lấy trách nhiệm ấy. Sau 6 năm, anh quay về nước, có hận thù, có xa cánh với cô nhưng tất cả đều không thắng lại được tình yêu giữa họ.\r\n\r\nCố Minh Châu được nuôi dạy trong một gia đình có vai vế trong xã hội, chính vì vậy nên đã dần hình thành nên một nữ hoàng Minh Châu với tính cách có phần ngông cuồng. Khi Cố Bác Vân bị bắt và Nguyễn Vô Song qua đời, từ một người được chiều chuộng, cô gái ấy phải đứng ra lo lắng chu toàn cho các em, phải cố gắng mọi cách để đưa cha mình thoát khỏi rắc rối, thế nên cô phải gạt bỏ đi ước mơ của mình và rời bỏ người mình yêu, rời xa Đá của cô.\r\n\r\nCô đã bán Đá của mình để đối lấy tiền học phí cho cô em gái và trang trải nhiều thứ khi trụ cột gia đình mất đi, cô bán em gái của mình cho người vẫn luôn yêu thương cô bé ấy để đổi lại tự do cho Cố Bác Vân. Cố gắng chèo lái một công ty không có thực lực, bị buộc phải trưởng thành với những va chạm, những vấp ngã và lựa chọn đã tạo nên một Cố Minh Châu khôn khéo trong ứng xử, mạnh mẽ trong tính cách. Cứ tưởng như sẽ chẳng thể nào thấy được mặt yếu đuối của cô, vậy mà trước Dung Lỗi, cô có thể gỡ bỏ được lớp mặt nạ ấy xuống để cho anh thấy được sự sợ hãi của cô, thấy được những giọt nước mặt của cô.\r\n\r\nDung Lỗi trở về, sau chừng ấy thời gian xa cách thì anh đã không còn là anh của ngày xưa. Những cô vẫn muốn có anh, vẫn muốn ở bên anh như ngày xưa, bởi vì tình yêu của cô đối với anh chưa từng ngừng nghỉ. Cô làm mọi cách để đến được gần anh nhưng dần cô nhận ra rằng anh đã khác xưa, không còn là Dung Lỗi hiền hòa của xưa kia nữa. Giờ đây anh có toán tính mà cô không thể lường và không thể hiểu được, anh có tiền và quyền, anh đã mạnh mẽ và có thể che chở cho cô để cô có thể dựa vào anh trong lúc khó khăn, có thể tin tưởng anh có thể cho cô mọi điều tốt đẹp. Nhưng cuối cùng thì anh vẫn không phải là Đá ngày xưa của cô, cô không hiểu được anh của hiện tại.\r\n\r\nChỉ có một điều không thay đổi sau ngần ấy thời gian là tình yêu của cô không thay đổi, cũng như cảm nhận được rằng anh vẫn còn có quan tâm đến cô. Có hận cô vì những chuyện năm xưa khi ruồng bỏ anh nhưng đó cũng là quan tâm đến cô. Cô sợ anh không còn để ý đến mình nữa, khi đó thì cô thực sự không còn cơ hội nữa rồi. Nhưng anh vẫn để ý, có yêu mới có hận, có yêu cô nhiều hơn thì mới có ghen với Phương Phi Trì. Vậy nên cô tin vào quyết định của mình, tin vào cách làm của mình để anh trở về bên cô, bằng mọi cách.\r\n\r\nAnh trở về, chứng minh cho cô thấy rằng anh có thể cho cô một chỗ dựa, không còn là người chỉ có ước mơ để rồi phải thấy cô khi rơi vào cảnh khốn khó lại phải đi cầu cạnh người khác nữa. Bị cô bỏ rơi, Dung Lỗi cũng từ bỏ luôn ước mơ của mình để trở thành một người mới, một người đàn ông có thể bảo vệ cho người mình yêu. Con đường 6 năm xa cô, dù có hận cô, thì cuối cùng anh cũng trở thành người mà cô mong muốn. Anh hận cô đã không cho cô được đồng cam cộng khổ, san sẻ gánh nặng với anh nhưng khi biết cô đang tìm anh thì Dung Lỗi lại không dám để lộ tin tức, anh không dám cho cô biết là anh sống rất khổ sở khi không có cô ở bên.\r\n\r\nDung Lỗi muốn lạnh lùng, dửng dưng trước cô nhưng lại cố gắng như thế nào cũng vẫn bị cô thu hút. Những ký ức không hay trước đây về cuộc chia tay giữa hai người vẫn cứ vang vọng trong đầu anh. Đi cùng với nó là những hình ảnh thân thiết của Cố Minh Châu và Phương Phi Trì trong quá khứ và cả hiện tại. Anh vẫn luôn ghen với Phương Phi Trì khi anh ấy là người cô chọn khi Cố gia có biến cố, vẫn là người thân thiết với cô trong hiện tại.\r\n\r\nSuốt thời gian ở nước ngoài, không có cô ở bên cạnh, thời gian 6 năm không phải là ngắn ngủi gì, vậy mà mọi ký ức vẫn không thể phai nhòa trong anh. Anh nhớ cô nhưng rồi lại hận cô bởi cô không cho anh cơ hội được san sẻ cùng cô, hận cô bởi vì cô đã khiến anh trở thành một người sống không còn ước mơ nữa. Khi anh gặp lại cô thì sự đấu tranh giữa yêu – hận ấy lại càng mãnh liệt hơn. Cứ mỗi khi anh có một suy nghĩ tốt đẹp về tình cảm giữa họ thì ngay sau đó cô lại dội cho anh một gáo nước lạnh. Anh sợ anh lại yêu cô, anh sợ lại bị cô bỏ rơi giống như trước đây, anh sợ tình yêu của cô dành cho anh không còn trọn vẹn như ngày xưa nữa.\r\n\r\nTình cảm của họ cứ như một cuộc trốn tìm vậy. Khi ban đầu anh quay về nước thì cô theo đuổi anh, tìm mọi cách để tiếp cận anh nhưng anh không dám yêu cô như trước đây nữa, nên anh chần chừ, muốn thử tình cảm của cô dành cho anh. Nhưng khi anh đã sẵn sàng thì cô lại bối rối bởi giữa họ có những chuyện xen ngang.\r\n\r\nGiữa lúc mọi chuyện tưởng như đã ổn thỏa thì Nguyễn Hạ xuất hiện – là tình địch trong suy nghĩ của Cố Minh Châu nhưng cũng là em gái nhỏ thân thiết của cô. Cũng vào lúc ấy thì sự xuất hiện của Dung Dịch khiến cho kế hoạch của Minh Châu bị đảo lộn. Cô không còn đủ kiên nhẫn để chờ đợi anh nói tiếng yêu cô nữa, cô ép anh phải nói ra những điều mình suy nghĩ và đã gần như đạt được điều mình mong muốn. Chỉ có điều, cô băn khoăn về Nguyễn Hạ. Cô không thể nhượng bộ trong tình yêu của mình, nhưng lại không thể làm tổn thương người thân của mình, vậy nên cô lần lữa mãi. Chỉ khi Dung Lỗi thay cô giải quyết những vấn đề còn vướng mắc thì họ mới có thể được gắn kết lại bên nhau – như một gia đình thực sự – bằng sự ràng buộc của hôn nhân.\r\n\r\nĐối với cá nhân tôi, cách viết truyện của tác giả này không có gì đặc biệt, nội dung truyện cũng không có gì mới mẻ cả, nhưng tôi ấn tượng với cách xây dựng nhân vật.\r\n\r\nMột Cố Minh Châu rất mạnh mẽ, rất ương ngạnh, và cũng rất thủ đoạn. Cô có thể vì người thân, vì gia đình mình mà hy sinh ước mơ và hạnh phúc của mình. Cô có thể móc nối, có thể dùng nhiều cách để được ở bên cạnh Dung Lỗi, nhưng lại có thể hùng hổ, ra tay mạnh mẽ đánh anh khi hai người có bất đồng theo đúng phong cách của nữ hoàng. Cô vẫn cứng miệng, vô lễ trước mặt cha cô chỉ để che dấu nỗi sợ hãi khi không còn ông bên cạnh. Có thể rất giảo hoạt khi cư xử xã giao bên ngoài nhưng cũng rất khôn khéo và lễ phép với bậc trưởng bối. Cô Minh Châu là như vậy, cô không hối hận vì năm xưa đã bỏ rơi Dung Lỗi, nhưng có thể cố gắng hết sức để đưa mình về bên anh trong những năm tháng sau này. Cô vẫn mạnh miệng khi xua đuổi anh nhưng rồi ngay lập tức sau đó lại ôm Phương Phi Trì khóc òa vì không thể được ở cùng anh. Cô có thể thao thao bất tuyệt nói với những người cô thân quen trong lúc cô bị đau, nhưng chỉ một câu hỏi “đau không?” của anh lại có thể khiến cô xúc động đến nhường nào. Và cũng chỉ có anh mới có thể cho cô được có những lúc yếu đuối như vậy.\r\n\r\nMột Dung Lỗi rõ ràng là muốn hận cô lắm lắm thế nhưng lại không thể nào hận cô được, bởi tình yêu trong anh quá lớn. Ngay cả lúc nghi kỵ về tình yêu mà cô dành cho anh thì anh vẫn chiều chuộng cô, để cho cô đánh mình – dù cô thẳng tay ra sức, và anh cũng chẳng phải yếu đuối đến mức không đánh trả được cô. Anh vẫn bao che cho những việc làm không đúng đắn của cô mà chẳng hề cho cô biết, vẫn cứ lặng lẽ dõi theo cô suốt một thời gian dài xa cách.  Yêu thương có rất nhiều cách thể hiện như vậy đấy. Anh vốn tưởng rằng cô mạnh mẽ, cô tuyệt tình khi bỏ rơi anh, nhưng mọi thứ đã thay đổi khi anh nhìn thấy Dung Dịch – Đá nhỏ của anh. Anh không chấp nhận được việc cô dấu anh đứa con của họ lâu đến thế, nhưng anh hiểu được cô đã yêu anh nhiều như thế nào khi quyết định sinh con một mình, thậm chí cô nghĩ nếu sau này không gặp lại được anh đi nữa, thì cô đã có Đá nhỏ, vậy là đủ với cô. Thì ra cô vẫn yêu anh và vẫn luôn chỉ có mình anh mà thôi.\r\n\r\nTruyện này có hai điểm trừ với tôi.\r\n\r\nThứ nhất, nhân vật phụ trong truyện này quá nhiều. Tôi cũng biết rằng tác giả này có rất nhiều truyện viết có liên quan với nhau, kiểu như nhân vật phụ trong truyện này là nhân vật chính trong truyện khác, thế nên khi đọc truyện này gặp rất rất nhiều nhân vật siêu phụ, nhưng tác giả lại muốn xây dựng một thế giới nhỏ, nên nói chuyện về cặp đôi này một tí, cặp đôi khác một tẹo, và với tôi thì nó hơi loằng ngoằng, có thể không đọc những đoạn ấy cũng chẳng sao, bởi nó chẳng liên quan gì đến truyện cả.\r\n\r\nThứ hai, và là điều tôi không thích nhất khi đọc truyện này, đó là yếu tố sắc dục trong truyện. Không nhiều và dày đặc như trong “Nở rộ”, nhưng có những đoạn mà tôi tưởng chừng như tác giả viết để tăng độ hot cho truyện vậy. Vì khi không đọc những trang ấy, thì nội dung của chương bạn đang đọc vẫn chẳng có gì bị ngắt quãng cả. Và không biết là do đầu óc tôi có vấn đề hay không mà tôi cảm thấy phần sắc dục trong truyện này có phần thô và phô. Tự nhiên tôi lại nhớ đến một comment ở đâu đó mà tôi đã từng đọc khi bình chọn tác giả viết cảnh nóng hay nhất, comment ấy nói rằng, Cố Mạn là người viết hay nhất, vì luôn để độc giả suy nghĩ tất cả.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `REVIEW_ID` int(11) NOT NULL,
  `USER_NAME` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `CONTENT` varchar(10000) COLLATE utf8_vietnamese_ci NOT NULL,
  `RATE` int(11) NOT NULL,
  `DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `review`
--

INSERT INTO `review` (`REVIEW_ID`, `USER_NAME`, `PRODUCT_ID`, `EMAIL`, `CONTENT`, `RATE`, `DATE`) VALUES
(17, 'Nguyễn Công Thịnh', 4, 'nguyencongthinh1999@gmail.com', 'gfd', 5, '2020-09-10 01:38:29'),
(18, 'Nguyễn Công Thịnh', 1, 'nguyencongthinh1999@gmail.com', 'a', 5, '2020-09-10 09:16:50'),
(19, 'Nguyễn Công Thịnh', 1, 'nguyencongthinh1999@gmail.com', 'a', 1, '2020-09-10 09:20:39'),
(20, 'Nguyễn Công Thịnh', 1, 'nguyencongthinh1999@gmail.com', 'g', 4, '2020-09-10 09:23:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `PHONE` int(11) NOT NULL,
  `PASSWORD` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`USER_ID`, `USER_NAME`, `EMAIL`, `PHONE`, `PASSWORD`) VALUES
(2, 'Nguyễn Công Thịnh', 'nguyencongthinh1999@gmail.com', 90992351, '12');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AUTHOR_ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CATEGORY_ID`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`MESS_ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `AUTHOR_ID` (`AUTHOR_ID`,`CATEGORY_ID`),
  ADD KEY `CATEGORY_ID` (`CATEGORY_ID`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`REVIEW_ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `AUTHOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `MESS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `REVIEW_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `author` (`AUTHOR_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
