-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: greenproduct
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `MaHoaDon` int(11) NOT NULL,
  `MaSanPham` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SoLuongMua` int(11) NOT NULL,
  PRIMARY KEY (`MaHoaDon`,`MaSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (1,'1',2),(1,'2',5),(1,'5',5),(1,'6',1),(2,'11',2),(2,'12',3),(2,'2',3),(2,'9',2),(3,'2',1),(3,'5',3),(3,'6',2),(3,'8',2),(4,'1',4),(4,'2',1),(4,'3',1),(4,'4',3),(5,'3',2),(5,'4',1),(5,'5',2),(5,'7',1),(6,'1',1),(6,'5',65),(10,'2',1),(11,'2',1),(11,'37',1),(12,'1',1),(12,'2',4),(12,'4',1),(13,'2',6),(14,'1',2),(15,'12',1),(15,'6',1),(16,'1',1),(17,'1',1),(17,'3',3),(17,'33',1),(18,'32',1),(19,'7',1);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmucsp`
--

DROP TABLE IF EXISTS `danhmucsp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmucsp` (
  `MaDanhMuc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TenDanhMuc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaDanhMuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmucsp`
--

LOCK TABLES `danhmucsp` WRITE;
/*!40000 ALTER TABLE `danhmucsp` DISABLE KEYS */;
INSERT INTO `danhmucsp` VALUES ('DM1','Ống hút'),('DM2','Bình đựng nước'),('DM3','Túi đựng'),('DM4','Đồ gia dụng'),('DM5','Mỹ phẩm');
/*!40000 ALTER TABLE `danhmucsp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `MaHoaDon` int(11) NOT NULL AUTO_INCREMENT,
  `NgayTao` date DEFAULT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoDienThoai` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TenKhachHang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DiaChi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TinhTrangHD` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHoaDon`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,'2019-02-03','abc1@gmail.com','0353488887','Nguyễn Văn A','12 Trần Hưng Đạo',1),(2,'2019-02-04','abc2@gmail.com','0353488888','Nguyễn Văn B','11 Trần Hưng Đạo',1),(3,'2019-02-05','abc3@gmail.com','0353488886','Nguyễn Văn C','10 Trần Hưng Đạo',1),(4,'2019-02-06','abc4@gmail.com','0353488885','Nguyễn Văn D','9 Trần Hưng Đạo',1),(5,'2019-02-07','abc5@gmail.com','0353488884','Nguyễn Văn E','8 Trần Hưng Đạo',1),(6,'2019-11-21','đư','dưe','adsed','đư',1),(7,NULL,NULL,NULL,NULL,NULL,0),(8,NULL,NULL,NULL,NULL,NULL,0),(9,NULL,NULL,NULL,NULL,NULL,0),(10,'2019-11-21',';lk\';',';k\'','klj;',';k\'',1),(11,'2019-11-21','ưe','r','ewr','r',1),(12,'2019-11-21','hoang thi','03534','thi','qrư',1),(13,'2019-11-21','thi','123','thi','360',1),(14,'2019-11-25','hoangthi@gmail.com','0353488887','hoàng thi','Quy Nhơn',1),(15,'2019-11-30','nguyenphuonghoangthi@gmail.com','0353488887','hoàng thi','Quy Nhơn',1),(16,'2019-12-05','nguyenphuonghoangthi@gmail.com','0353488887','thi','Quy Nhơn',1),(17,'2019-12-06','nguyenphuonghoangthi@gmail.com','0353488887','hoàng thi','Quy Nhơn',1),(18,'2019-12-07','nguyenphuonghoangthi@gmail.com','0353488887','thi','Quy Nhơn',1),(19,'2019-12-07','nguyenphuonghoangthi@gmail.com','0353488887','hoàng thi','Quy Nhơn',1);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `MaDanhMuc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TenSanPham` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DonGia` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `HinhAnh` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MoTa` longtext COLLATE utf8_unicode_ci,
  `DonViTinh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (1,'DM1','Ống hút cỏ',80000,44,'onghutco.jpg','Ống hút cỏ được chế tạo từ cây cỏ bàng, được sử dụng nhiều và rộng rãi trong một vài năm trở lại đây. Cây cỏ bàng làm ống cỏ có độ tuổi phải từ 1-2 năm mới được sử dụng làm ống cỏ, cây chủ yếu mọc nhiều ở vùng đồng bằng sông cửu long. Ống hút cỏ có 02 loại chính là loại ống tươi và ống khô.','hộp'),(2,'DM3','Túi vải không dệt',20000,8,'tuivai.jpg','Túi vải không dệt hay còn có tên gọi khác là túi vải môi trường. Túi vải không dệt được làm từ vải không dệt, đây là vật liệu thân thiện với môi trường.','cái'),(3,'DM3','Túi vải bố',100000,7,'tuivaibo.jpg','Năm 2017 là một năm đáng dấu sự phát triển hưởng ứng môi trường xanh – sạch – đẹp, túi nilon hiện nay đang có xu hướng được thay thế vì những tác hại của nó tạo ra cho môi trường là quá lớn. Chính vì thế con người ta không ngừng đưa ra phương pháp cải tiến, bảo đảm một môi trường không ô nhiễm. Và kể từ đó túi vải bố môi trường được sản xuất ra để đảm nhiểm vai trò thay thế túi nilon giúp bảo vệ môi trường.','cái'),(4,'DM3','Túi Tote vải',150000,4,'tuitote.jpg','Túi kích thước là: 35 x 31 x 7 để được tầm 3 bộ đồ nhé. Chất vải Canvas dầy dặn chứ không mỏng như các shop khác. Túi thiết kế 2 dây đeo quai, có kéo ngoài và trong. - Đi học hay đi dã ngoại đều được nhé. Có dây kéo ngoài, ngăn nhỏ trong. Để vừa sơ mi hồ sơ a4 thoải mái vô tư.','cái'),(5,'DM3','Túi Canvas',120000,5,'tuicanvas.jpg','Túi vải canvas là xu hướng lựa chọn thời trang hiện đại của các bạn trẻ. Sản phẩm bền, có tính thẩm mỹ cao. Giá túi vải bố canvas phù hợp để sử dụng nhiều loại.','cái'),(6,'DM4','Hộp kim loại',200000,9,'hopkimloai.jpg','Trong rất nhiều loại vật liệu bền vững mà chúng ta đang sử dụng để thay thế cho nhựa hay các vật liệu dùng-một-lần, Thép không gỉ chính là một vật liệu bền vững có thể được tái chế 100%.  ','cái'),(7,'DM4','Bàn chải tre',50000,9,'banchaitre.jpg','Bàn chải cán tre có thể tái chế, phân huỷ và thật sự đem lại giá trị môi trường cho một tương lai bền vững. Chỉ cần bảo quản đúng cách, những chiếc bàn chải eco này có thể sử dụng lâu như bàn chải đánh răng bình thường. Và vì vấn đề sức khoẻ răng miệng thì bạn nên đổi bàn chải đánh răng mỗi 3 tháng hay khi lông bàn chải bị mòn nhé.','cái'),(8,'DM4','Hộp thức ăn thủy tinh',250000,5,'hopthuytinh.jpg','Được sản xuất theo công nghệ hiện đại với chất liệu thủy tinh cao cấp, trong suốt chịu được nhiệt độ lên đến 600 độ C, có khả năng kháng vỡ. Hợp vệ sinh an toàn thực phẩm, không gây hại đến sức khỏe người sử dụng.','bộ'),(9,'DM4','Hộp cơm giấy',1000,50,'hopcomgiay.jpg','Hộp cơm giấy cơ bản là được làm bằng giấy. Hộp cơm bảo vệ môi trường làm từ giấy thường được dùng để đồ ăn khô hơn là đồ ăn nước. Loại hộp cơm giấy này có ưu thế là khả năng phân hủy cao cũng như thân thiện với môi trường. Tuy nhiên hộp cơm giấy có nhược điểm là kết cấu yếu mềm dễ rách cũng như không chịu được nhiệt độ tốt, khả năng để đồ ăn lỏng kém.','cái'),(10,'DM5','Nước hoa thực vật',450000,5,'nuochoathucvat.jpg','Dung tích: 10 ml. Xuất xứ: Việt Nam. Thành phần chính: Dầu nền thực vật, tinh dầu nguyên chất, Vitamin A, Vitamin B, Vitamin B12.','chai'),(11,'DM5','Dầu gội gừng',350000,5,'daugoigung.jpg','Bộ dầu gội - dầu xả Weilaiya được nấu từ nước gừng tươi, và dầu hạt trà ép hoàn toàn không chứa silicon đặc trị cho tóc rụng, giúp kiềm dầu, trị gầu, phục hồi tóc, mượt tóc và kích thích mọc nhanh. Sản phẩm của thương hiệu nổi tiếng Weilaiya Hong Kong.','chai'),(12,'DM1','Ống hút giấy',60000,49,'onghutgiay.jpg','Ống hút giấy có dạng ống trụ dài và rỗng và tất nhiên nó được tạo nên từ chất liệu giấy như vốn dĩ tên gọi của nó rồi. Chất liệu giấy để làm ống hút cũng rất đa dạng và phong phú. Có nhiều loại ống hút giấy dày và cứng, chịu nhiệt tốt kể cả khi cho vào dung dịch nóng như trà nóng, sữa nóng hay ca cao nóng, đặc biệt phù hợp cho các cửa hàng kinh doanh sử dụng thay thế các vật liệu như ống hút nhựa. Ống hút giấy có nhiều màu sắc rực rỡ, rất phù hợp với các bữa tiệc lung linh, nhà hàng, khách sạn, các sự kiện, quán trà sữa, quán cafe, … Tính thẩm mỹ và tiện lợi của nó cực kỳ phù hợp với giới trẻ. Hãy chung tay bảo vệ trái đất xanh bằng những việc nhỏ như dùng ống hút giấy.','hộp'),(13,'DM5','Son dưỡng gấc',50000,10,'sonduonggac.jpg','Son dưỡng trị thâm môi TIPI có mùi thơm dễ chiu, không những giúp môi mềm mịn, căng mọng mà còn giúp cho màu môi thêm hồng hào, giảm bớt thâm môi.','cây'),(14,'DM1','Ống hút bột gạo',70000,50,'onghutbotgao.jpg','Ống hút bột gạo là sản phẩm được dùng để làm vòi hút các loại nước thường hay dùng trong các quán Coffe, bar, nhà hàng....được sản xuất 100% từ gạo, tác dụng là sử dụng một lần, có thể ăn được, nếu người dùng không muốn ăn có thể bỏ đi nhưng thời gian phân hủy sẽ rất ngắn, giúp bảo vệ môi trường tốt hơn. Sản phẩm được sản xuất trong nước và có thể thay thế hoàn toàn ống hút nhựa. ','hộp'),(15,'DM1','Ống hút thủy tinh',75000,5,'onghutthuytinh.jpg','Ống hút thủy tinh có hình dáng trụ và rỗng như các loại ống hút khác. Tuy nhiên nó được cấu tạo từ thủy tinh khá dày và cứng. Thường ống có độ dài khoảng 20cm, đường kính khoảng 6.5 mm, độ dày hơn so với các loại ống khác (khoảng 1.5 mm). Ống thủy tinh được chế tạo nên từ loại thủy tinh có độ giãn nở thấp để tránh hiện tượng nứt khi cho vào cốc nước nóng.','bộ'),(16,'DM1','Ống hút inox',85000,10,'onghutinox.jpg','Bộ sản phẩm gồm có 04 ống hút với chất liệu cao cấp inox không gỉ, độ dài đa dạng giúp người dùng dễ dàng lựa chọn, khách hàng khi mua sản phẩm 04 ống hút tại cửa hàng còn được tặng kèm 01 cọ rửa chuyên dụng dùng để vệ sinh ống và một túy nhung cao cấp dễ thương để bảo quản sản phẩm tránh bụi, mốc và có thể mang theo bên mình.','bộ'),(17,'DM2','Bình đựng nước My Bottle',50000,10,'mybottle.jpg','Bình nước in chữ My Bottle xinh xắn, tiện lợi, đang được giới trẻ đặc biệt ưa thích. Chất liệu thủy tinh cao cấp dày dặn, bóng bẩy, chịu được nhiệt từ -40 độ C đến 100 độ C, an toàn cho sức khỏe. Thích hợp dùng để đựng nước, nước ép, sinh tố, trái cây, bánh kẹo…Có thể dùng làm đồ trang trí, quà tặng… theo ý thích.','cái'),(18,'DM2','Bình đựng nước Hello Master',70000,8,'hello.jpg','Bình nước thủy tinh Hello Master có hình dáng và màu sắc dễ thương, ấn tượngThông tin sản phẩm:- Bình nước thủy tinh thiết kết trẻ trung năng động, tiện lợi đi học đi làm hay dã ngoại- Dung tích: 400ml- Kích thước: 6 x 23 cm (Rộng x Cao)- Chất liệu: Thủy tinh mờ. Nắp bằng nhựa PU. Có dây đeo thiết kế cầm tay- Màu sắc: Trắng, Xanh Dương, Xanh Lá, Hồng.Ứng dụng:- Rất thích hợp với gia đình bạn sử dụng, hoặc quán trà sữa để sử dụng thay thế các loại ly mang lại vẻ đẹp hiện đại cho quán của bạn.- Bạn hoàn toàn an tâm khi dùng đựng thức uống, hoàn toàn không chảy nước khi bạn để nghiên bình.','cái'),(19,'DM2','Bình đựng nước Donald Trump ',65000,5,'chaithuytinh.jpg','CHAI TỔNG THỐNG DONALD TRUMP - KIM JONG UN(dung tích 500ml)Bạn có muốn sở hữu ngay chai Tổng thống Donald Trump – Kim Jong un để lưu lại kỉ niệm hội nghị thượng đỉnh của hai nhà lãnh đạo Mỹ - Triều tới Việt Nam. Khi sử dụng chai bạn có thể ngắm nhìn chân dung hai nguyên thủ quốc gia trên mọi hành trình. Đây là một trải nghiệm vô cùng thích thú mang lại cho bạn nhiều cung bậc cảm xúc về một thế giới Hoà Bình cùng tổng thống Donald Trump – Kim Jong un.Bạn có thể dùng chai lọ thủy tinh để đựng nước, nước ép, sinh tố, trưng bày, trang trí trong phòng ngủ, trên bàn làm việc, hay mang theo bên mình trong những chuyến đi mà bạn yêu thích.','cái'),(20,'DM2','Bình đựng nước hoạt hình',50000,6,'hoathinh.png','Bình nước thủy tinh bọc túi giữ nhiệt, thiết kế trẻ trung, cá tính, nhiều màu sắc cho bạn lựa chọn.','cái'),(21,'DM1','Ống hút tre',60000,10,'onghuttre.jpg','Dài 20cm; Bó 10 chiếc. 100% tự nhiên, không chất tạo màu, không tẩy trắng.','hộp'),(22,'DM4','Ly nước sợi tre',30000,15,'lysoitre.jpg','Một chiếc ly làm từ sợi tre là đồ dùng thân thiện môi trường lý tưởng nhất. Chất liệu này bền, nhẹ và rất dễ dàng phân hủy. Ngoài ra cũng rất thuận tiện cho bạn vì nó không dễ vỡ như ly sứ. Chỉ với việc mang ly sợi tre và mua cà phê thì cũng đã góp phần làm xanh trái đất.','cái'),(23,'DM4','Hộp cơm lúa mạch',150000,10,'hopluamach.jpeg','Giới văn phòng bận rộn thường có thói quen ăn trưa bằng những phần cơm được đựng trong hộp xốp. Tuy nhiên chất liệu này lại cực kỳ độc hại. Nhất là vì thức ăn nhiệt độ cao, chất liệu xốp sẽ sinh ra vô số chất độc. Chính vì thế hãy thủ sẵn cho mình một bộ hộp cơm thân thiện với môi trường và không độc hại. Hộp cơm lúa mạch là một lựa chọn hoàn hảo.','cái'),(24,'DM3','Túi giấy',3000,50,'tuigiay.jpg','Một đồ dùng thân thiện môi trường nữa cần có chính là những chiếc túi vải hoặc túi giấy. Thói quen sử dụng túi nhựa hay bao nilon khiến lượng rác không tái chế ở Việt Nam rất khủng khiếp. Chưa kể túi nilon lại rất lâu phân hủy. Chúng còn gây hại cho môi trường ở nhiều phương diện khác.','cái'),(25,'DM4','Bộ dụng cụ nấu ăn',180000,15,'dungcunau.jpg','Bộ sản phẩm có thiết kế cán dài, dày, giúp bạn tránh nóng khi thao tác. Bộ sản phẩm gồm 5 món: 1 xẻng chiên, 1 muỗng trộn, 1 nĩa, 1 muôi, 1 muôi có rãnh. Trên cán mỗi sản phẩm đều thiết kế từng ô rỗng, thích hợp cho bạn treo.','bộ'),(26,'DM2','Bình giữ nhiệt Delites',120000,10,'binhdelites.jpg','Dung tích 500 ml có thể đựng trà, cà phê, nước trái cây đủ cho 1 người dùng. Ở nhiệt độ phòng 25 độ C, bình giữ nhiệt giữ nhiệt nóng và lạnh từ 20 - 24 giờ. Vỏ bình inox 201, lớp giữa chân không, lòng bình inox 304 cao cấp, an toàn sức khỏe. 2 tầng nắp giữ nhiệt tốt, nhấn rót nước không cần mở nắp, nắp ngoài dùng được như ly uống nước.','cái'),(27,'DM2','Bình giữ nhiệt inox',90000,10,'binhmauhong.jpg','Bình giữ nhiệt có dung tích 500 ml, đặt gọn trong túi xách, cặp xách, balo, tiện mang theo khi đi làm, đi học, đi chơi.. Có khả năng giữ nóng, giữ lạnh từ 10 - 15 giờ trong môi trường 25 độ C, bảo quản được trà, cà phê, cháo loãng, sữa...Nắp đậy khít với ron cao su giúp ngăn rò rỉ nước tối đa.','cái'),(28,'DM2','Bình giữ nhiệt inox xanh',100000,5,'binhdmx.jpg','Bình giữ nhiệt có dung tích 500 ml, đặt gọn trong túi xách, cặp xách, balo, tiện mang theo khi đi làm, đi học, đi chơi.. Có khả năng giữ nóng, giữ lạnh từ 10 - 15 giờ trong môi trường 25 độ C, bảo quản được trà, cà phê, cháo loãng, sữa...Nắp đậy khít với ron cao su giúp ngăn rò rỉ nước tối đa.','cái'),(29,'DM1','Ống hút giấy Spring',22000,20,'onghutspring.jpg','Ống hút dùng 1 lần, đường kính 8 mm dùng hút sinh tố, uống trà sữa có thạch nhỏ... dễ dàng. Lốc 15 cái tiện sử dụng. Màu xanh lá nổi bật, bắt mắt với họa tiết chấm tròn trắng dọc thân ống hút. Làm từ nguyên liệu giấy tự nhiên dễ phân hủy, an toàn sức khoẻ, thân thiện hơn với môi trường.','hộp'),(30,'DM1','Ống hút inox Spring',90000,10,'onghutinoxspring.jpg','Ống hút có bộ 4 sản phẩm gồm 2 ống cong đầu và 2 ống thẳng, sử dụng tiện lợi, uống hút dễ dàng, sạch sẽ. Chất liệu inox bóng sáng, chống rỉ sét, an toàn cho sức khỏe, làm sạch đơn giản. Đi kèm cọ rửa, vệ sinh ống hút tiện lợi, nhanh chóng hơn, góp phần bảo vệ môi trường.','bộ'),(31,'DM4','Hộp chia ngăn',110000,10,'hopchiangan.jpg','Hộp đựng thực phẩm hình chữ nhật, dung tích lớn 1000 ml, dùng đựng thức ăn cho 1 - 2 người dùng. Làm bằng chất liệu thủy tinh chịu nhiệt tốt, an toàn cho sức khỏe, dễ làm sạch sau khi dùng.','cái'),(32,'DM3','Túi sinh học tự hủy',55000,19,'tuisinhhoc.jpg','Túi rác làm bằng nilon tự hủy sinh học, thân thiện môi trường và an toàn người dùng. Dùng để đựng rác gọn sạch trong gia đình, công ty, nhà hàng,...1 gói túi rác có 3 cuộn, mỗi cuộn gồm 25 túi, mỗi túi dài 78 cm x rộng 65 cm.','gói'),(33,'DM3','Túi lưới mua sắm',150000,14,'tuiluoi.jpg','Túi lưới với từ chất liệu 100% Cotton, được làm thủ công, cắt tỉ mỉ theo từng mắt lưới, có khả năng chịu lực vừa. Túi lưới dùng thay thế túi nylon khi đi mua sắm, đi chợ... đựng hoa quả, rau củ, thức ăn... hoặc vật dụng cá nhân.','bộ'),(34,'DM3','Túi xách gấp',100000,10,'tuixachgap.jpg','Túi xách gấp gọn bảo vệ môi trường Anse LA002 có thiết kế dạng đeo vai đơn giản nhưng không kém phần tinh tế. Sản phẩm được làm từ chất liệu vải Ripstop mỏng nhẹ, vải dệt sử dụng kỹ thuật gia cố đặc biệt mang đến khả năng chống rách cao, bền bỉ và cho thời gian sử dụng lâu dài. Ngoài ra, chất liệu này còn giúp hạn chế tối đa việc thấm nước vào bên trong, giúp bảo quản đồ dùng tốt hơn.','cái'),(35,'DM4','Ly nước Lock&Lock',400000,10,'lylock.jpg','Combo Ly Lock&Lock và Bộ ống hút inox kèm Túi Đựng, Quai Vải và Cọ Rửa mong muốn được thay thế túi nylon, ống hút nhựa, ly nhựa dùng để thưởng thức đồ uống và mang đi tiện lợi, thân thiện với môi trường, góp phần nhỏ giúp Trái Đất thêm xanh.','cái'),(36,'DM5','Kem tẩy trang TheFaceShop',130000,5,'kemtaytrang.jpg','Kem tẩy trang chiết xuất trái cây Herb Day 365 Cleansing Cream Fruit Mix giàu hỗn hợp Vitamin trái cây có tác dụng làm sạch và làm thanh khiết da với hương thơm ngọt ngào, đem lại làn da sáng đều màu và nuôi dưỡng da. Sản phẩm phù hợp với mọi loại da.','hộp'),(37,'DM5','Tinh dầu thiên nhiên',560000,4,'tinhdauthiennhien.jpg','Rửa mặt sạch, dùng giấy mềm hoặc bông cotton lau khô nhẹ nhàng. Cho 1 lượng kem vừa đủ ra lòng bàn tay, mát-xa nhẹ hai bàn tay tạo hơi ấm, úp lòng bàn tay và mát-xa nhẹ nhàng khắp mặt. Mùi hương đặc trưng của các loại tinh dầu thiên nhiên, bên cạnh việc hỗ trợ làm đẹp da, còn mang lại cảm giác sảng khoái, thư giãn.','chai'),(38,'DM5','Sữa rửa mặt Olive',350000,5,'suaruamatolive.jpg','Sữa rửa mặt cho da khô Botáni Olive Soothing Cleanser với thành phần chiết xuất 100% tự nhiên và hữu cơ như tinh dầu jojoba, olive, hoa cúc La Mã, cúc Địa Trung Hải, cúc dại tím nên rất dịu nhẹ, phù hợp cho những làn da nhạy cảm và cả da em bé. Sản phẩm giúp nhẹ nhàng làm sạch bụi bẩn, tạp chất tận sâu lỗ chân lông mà không làm mất đi lớp dầu sinh học trên da, giữ da luôn ẩm mượt, mịn màng, tránh tình trạng khô da.','chai');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taikhoan` (
  `TaiKhoan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VaiTro` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`TaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-09 13:12:40
