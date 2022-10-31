-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mdebis
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `generalannouncement`
--

DROP TABLE IF EXISTS `generalannouncement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generalannouncement` (
  `idgeneralAnnouncement` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext,
  `content` longtext,
  `link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idgeneralAnnouncement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalannouncement`
--

LOCK TABLES `generalannouncement` WRITE;
/*!40000 ALTER TABLE `generalannouncement` DISABLE KEYS */;
INSERT INTO `generalannouncement` VALUES (1,'2022-2023 Eğitim-Öğretim Yılı Güz Yarıyılı Yatay Geçiş Başvuru İşlemleri','Yatay geçiş başvuruları https://ogrbasvuru.deu.edu.tr/login.php internet üzerinden ONLINE yapılacaktır. (Belgeleri eksik olan ve/veya tercih yapmayan adayların başvuruları değerlendirmeye alınmaz).\n\n \n\n\n\n \n\nYatay geçiş başvuru kılavuzu için tıklayınız\n\n \n\nAyrıntılı bilgi için “DOKUZ EYLÜL ÜNİVERSİTESİ YATAY GEÇİŞ YÖNERGESİ” ni inceleyiniz\n\n \n\nKurumlararası Yurt İçi Yatay Geçiş Takvimi ile Başvuru Koşulları, Gerekli Belgeler ve Açıklamalar İçin Tıklayınız\n \n\n2022-2023 Eğitim-Öğretim Yılı Güz Yarıyılı Ön Lisans Programları Kurumlararası Yurt İçi Yatay Geçiş Kontenjanları İçin Tıklayınız\n\n2022-2023 Eğitim-Öğretim Yılı Güz Yarıyılı Lisans Programları Kurumlararası Yurt İçi Yatay Geçiş Kontenjanları İçin Tıklayınız\n\n \n\nYurt Dışı Yatay Geçiş Takvimi ile Başvuru Koşulları, Gerekli Belgeler ve Açıklamalar İçin Tıklayınız\n \n\n2022-2023 Eğitim-Öğretim Yılı Güz Yarıyılı Ön Lisans Programları Kurumlararası Yurt Dışı Yatay Geçiş Kontenjanları İçin Tıklayınız\n\n2022-2023 Eğitim-Öğretim Yılı Güz Yarıyılı Lisans Programları Kurumlararası Yurt Dışı Yatay Geçiş Kontenjanları İçin Tıklayınız\n\n \n\nMerkezi Yerleştirme Puanı ile (Ek Madde 1) Yatay Geçiş Takvimi, Başvuru Koşulları, Gerekli Belgeler ve Açıklamalar İçin Tıklayınız\n \n\nBaşvuru Tarihleri: 1-15 Ağustos 2022\n\n \n\nMerkezi yerleştirme puanı ile (Ek Madde 1) yatay geçiş için ayrıca bir kontenjan ilan edilmeyecek olup her bir diploma programının hazırlık sınıfı dahil her bir sınıfı için 90’ı geçmemek üzere, ilgili yıldaki Öğrenci Seçme ve Yerleştirme Sistemi Kılavuzlarında yayımlanan öğrenci kontenjanının %30’u kadar kontenjan bulunmaktadır.\n\n \n\nÜniversitemiz taban puanlarını öğrenmek için tıklayınız\n\n \n\n* Cumhurbaşkanı Kararı hükümleri saklı kalmak kaydıyla, yurt içi ve yurt dışı yükseköğretim kurumlarından üniversitemize yatay geçiş yapan yabancı uyruklu öğrenciler, Üniversite Yönetim Kurulu Kararı ile yurt dışından öğrenci kabul kontenjanları için belirlenen katkı payı/öğrenim ücretlerini öderler.\n\n** Yurt dışından öğrenci kabulü kontenjanları dahilinde Türkiye’deki bir yükseköğretim kurumuna kayıt yaptırmış olup üniversitemize yatay geçiş yapan öğrenciler, Üniversite Yönetim Kurulu Kararı ile yurt dışından öğrenci kabul kontenjanları için belirlenen katkı payı/öğrenim ücretlerini öderler.\n\n \n\n2022-2023 eğitim-öğretim yılında yabancı uyruklu/yurt dışından öğrenci kabulü kontenjanları dahilinde kayıt yaptıran öğrencilerden alınacak öğrenim ücretleri\n\n \n\nBirim İletişim Bilgileri için tıklayınız','https://www.deu.edu.tr/duyurular/2022-2023-egitim-ogretim-yili-guz-yariyili-yatay-gecis-basvuru-islemleri/'),(2,'Lisansüstü Programlara Öğrenci Kabulü (Student Admission to Graduate Programs)','2022-2023 eğitim-öğretim yılı güz yarıyılında Üniversitemize bağlı enstitülerin lisansüstü programlarına kabul edilecek öğrenci kontenjanları, başvuru ve kabul şartları aşağıda yer alan web sayfalarında ilan edilmiştir. (In the fall semester of the 2022-2023 academic year, the quota of students to be admitted to the graduate programs of the institutes of our university, application and admission requirements are announced on the following web pages.)\n\n \n\nAtatürk İlkeleri ve İnkılap Tarihi Enstitüsü (Principals of Atatürk and Revolution History Institute)\nEğitim Bilimleri Enstitüsü (Institute of Educational Sciences)\nFen Bilimleri Enstitüsü (The Graduate School of Natural and Applied Sciences)\nGüzel Sanatlar Enstitüsü (Graduate School of Fine Arts)\nİzmir Uluslararası Biyotıp ve Genom Enstitüsü (İzmir International Biomedicine and Genome Institute)\nSağlık Bilimleri Enstitüsü (Institute of Health Sciences)\nSosyal Bilimler Enstitüsü (Graduate School of Social Sciences)','https://www.deu.edu.tr/duyurular/lisansustu-programlara-ogrenci-kabulu-student-admission-to-graduate-programs-2/');
/*!40000 ALTER TABLE `generalannouncement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 23:54:09
