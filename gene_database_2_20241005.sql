CREATE DATABASE  IF NOT EXISTS `genedatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `genedatabase`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: genedatabase
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `gene_info`
--

DROP TABLE IF EXISTS `gene_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gene_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Gene` varchar(255) DEFAULT NULL,
  `Function` text DEFAULT NULL,
  `Disease` varchar(255) DEFAULT NULL,
  `Types_of_alterations` text DEFAULT NULL,
  `Targeted_therapy` text DEFAULT NULL,
  `MRD_Marker_status` varchar(50) DEFAULT NULL,
  `CHIP_status` varchar(50) DEFAULT NULL,
  `ELN_2022_RISK` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gene_info`
--

LOCK TABLES `gene_info` WRITE;
/*!40000 ALTER TABLE `gene_info` DISABLE KEYS */;
INSERT INTO `gene_info` VALUES (1,'ABL1','non-receptor tyrosine kinase','Acute Myeloid Leukemia','Fusions, Kinase domain mutations','Tyrosine kinase inhibitors: Imatinib, Dasatinib, nilotinib, Ponatinib, Bosutinib, Asciminib','Yes','No','Adverse'),(2,'ABL2','non-receptor tyrosine kinase','Acute Lymphoblastic Leukemia','Fusions','Tyrosine kinase inhibitors: Imatinib, Dasatinib, nilotinib, Ponatinib, Bosutinib','Yes','No',''),(3,'ANKRD26','ankyrin repeat domain protein that is involved in regulation of megakaryopoiesis','Acute Myeloid Leukemia','Mutations and Copy number gain','No','No','No','Intermediate'),(4,'ASXL1','tumor suppressor and epigenetic regulator','Acute Myeloid Leukemia','Mutations','No','No','Yes','Adverse'),(5,'ASXL2','tumor suppressor and epigenetic regulator','Acute Myeloid Leukemia','Mutations','No','No','Yes','Adverse'),(6,'BCL2','anti-apoptotic protein','NHL','Fusion','No','Yes','No',''),(7,'BCOR','transcriptional repressor','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(8,'BCR|ABL1','chimeric fusion','Acute Myeloid Leukemia','Fusion','Tyrosine kinase inhibitors effect unknown','Yes','No','Adverse'),(9,'CALR','calreticulin, is a calcium-binding protein: molecular chaperoneÂ ','Myeloproliferative Neoplasm','Mutations','No','Yes','No',''),(10,'CBFB|MYH11','chimeric fusion: core binding factor AML','Acute Myeloid Leukemia','Fusion','Yes: Gemtuzumab Ozogamicin','Yes','No','Favorable'),(11,'CBL','tumor suppressor and ubiquitin ligase','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Intermediate'),(12,'CCND1','cell cycle regulator','Mantle Cell Lymphoma','Fusion','No','Yes','No',''),(13,'CEBPA','tumor suppressor and transcription factor','Acute Myeloid Leukemia','Mutations','No','Yes','No','Favorable'),(14,'CREBBP','tumor suppressor and transcriptional co-activator','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(15,'CSF3R','transmembrane receptor for cytokine colony-stimulating factor 3','Acute Myeloid Leukemia','Mutations','Yes: Proximal membrane: Ruxolitinib; Distal membrane: Dasatinib','Yes','Yes','Intermediate'),(16,'DDX41','RNA helicase involved in innate immunity','Acute Myeloid Leukemia','Mutations','No','Yes*','No','Intermediate'),(17,'DNMT3A','tumor suppressor and DNA methyltransferase','Acute Myeloid Leukemia','Mutations','No','No','Yes',''),(18,'EP300|ZNF384','chimeric fusion','Acute Lymphoblastic Leukemia','Fusion','No','No','Yes',''),(19,'ETV6','transcription factor','Acute Myeloid Leukemia','Mutation | Fusion','No in Mutation | Yes in Fusion','Yes','No','Intermediate'),(20,'EZH2','Polycomb repressive complex 2Â ','Acute Myeloid Leukemia','Mutations','Yes: Tazmetostat','Yes','No','Adverse'),(21,'FGFR1','Â receptor tyrosine kinase','Acute Myeloid Leukemia','Fusion','Yes: Ponatinib','Yes','No','Intermediate'),(22,'FGFR2','Â receptor tyrosine kinase','Acute Myeloid Leukemia','Fusion','Yes: Ponatinib','Yes','No','Intermediate'),(23,'FLT3-ITD','receptor tyrosine kinase','Acute Myeloid Leukemia','Mutations','Yes: Midostaurin, giltertinib, sorafenib','Yes','Yes','Intermediate'),(24,'FLT3-TKD','receptor tyrosine kinase','Acute Myeloid Leukemia','Mutations','Yes: Midostaurin, giltertinib, sorafenib','Yes','Yes','Intermediate'),(25,'FUS','RNA-binding protein','Acute Myeloid Leukemia','Fusion','No','Yes','No','Intermediate'),(26,'GATA2','transcription factor involved in red blood cell and platelet development','Acute Myeloid Leukemia','Mutations','No','Yes*','No','Intermediate'),(27,'HMGA2','chromatin remodeling protein','Acute Myeloid Leukemia','Fusion','No','Yes','No','Intermediate'),(28,'HRAS','membrane-associated GTPase','Acute Myeloid Leukemia','Mutations','No','Yes','No','Intermediate'),(29,'IDH1','cell metabolism enzyme','Acute Myeloid Leukemia','Mutations','Yes: Ivosidenib','Yes','Yes','Intermediate'),(30,'IDH2','cell metabolism enzyme','Acute Myeloid Leukemia','Mutations','Yes: Enasidenib','Yes','Yes','Intermediate'),(31,'IKZF1','transcription factor involved in lymphocyte development','Acute Lymphoblastic Leukemia','Deletion','No','No','No',''),(32,'JAK2','non-receptor tyrosine kinase','Acute Myeloid Leukemia','Mutations | Fusion','Yes: Ruxolitinib','Yes','Yes in Mutations | No in Fusion','Intermediate'),(33,'KAT6A','histone acetyltransferase','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(34,'KAT6B','histone acetyltransferase','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(35,'KIT','receptor tyrosine kinase','Acute Myeloid Leukemia','Mutations','Yes: Sorafenib, Avapritinib, Imatinib, Nilotinib, ','Yes','No','Intermediate'),(36,'KMT2A -R','histone methyltransferase','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(37,'KMT2A-PTD','histone methyltransferase','Acute Myeloid Leukemia','Partial Tandem Duplication','No','Yes','No','Adverse'),(38,'KRAS','RAS family of small GTPases','Acute Myeloid Leukemia','Mutations','No','Yes','No','Intermediate'),(39,'MECOM','transcription factor expressed in hematopoietic stem cells','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(40,'MLLT10','histone methyltransferase cofactor','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(41,'MPL','transmembrane protein receptor','Myeloproliferative Neoplasm','Mutations','No','Yes','No',''),(42,'MYBL1','transcription factor','Blastic Plasmacytoid Dendritic Cell Neoplasm','Fusion','No','Yes','No','Intermediate'),(43,'MYD88','signaling adaptor protein','Lymphoma','Mutations','No','Yes','No',''),(44,'NF1','Â negative regulator of RAS','Acute Myeloid Leukemia','Mutations','No','Yes','No','Intermediate'),(45,'NPM1','nucleolar phosphoprotein','Acute Myeloid Leukemia','Mutations','No','Yes','No','Favorable'),(46,'NRAS','RAS family of small GTPases','Acute Myeloid Leukemia','Mutations','No','Yes','No','Intermediate'),(47,'NTRK2','Â receptor tyrosine kinase','Acute Myeloid Leukemia','Fusion','Yes: Entrectinib, Larotrectinib','Yes','No','Intermediate'),(48,'NTRK3','Â receptor tyrosine kinase','Acute Myeloid Leukemia','Fusion','Yes: Entrectinib, Larotrectinib','Yes','No','Intermediate'),(49,'NUP214','nucleoporin protein','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(50,'NUP98','nuclear pore and nuclear-cytoplasmic trafficking','Acute Myeloid Leukemia','Fusion','No','Yes','No','Intermediate'),(51,'PAX5','transcription factorÂ ','Acute Lymphoblastic Leukemia','Fusion','No','Yes','No',''),(52,'PDGFRA','receptor tyrosine kinase','Acute Myeloid Leukemia','Fusion','Yes: Sorafenib, Avapritinib, Imatinib, Nilotinib, ','Yes','No','Intermediate'),(53,'PDGFRB','receptor tyrosine kinase','Acute Myeloid Leukemia','Fusion','Yes: Sorafenib, Avapritinib, Imatinib, Nilotinib, ','Yes','No','Intermediate'),(54,'PHF6','chromatin binding protein','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(55,'PML|RARA','chimeric fusion','Acute Myeloid Leukemia','Fusion','Yes: ATRA, ATO','Yes','No','Favorable'),(56,'PPM1D','protein phosphatase','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(57,'PRPF8','core component of spliceosome complexes','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(58,'PTPN11','protein tyrosine phosphatase','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Intermediate'),(59,'RAD21','subunit of the cohesin complexÂ ','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Intermediate'),(60,'RARA','transcription factor','Acute Myeloid Leukemia','Fusion','Yes: ATRA, ATO','Yes','No','Favorable'),(61,'RB1','regulator of the cell cycle','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(62,'RBM15|MTRFA','chimeric fusion','Acute Myeloid Leukemia','Fusion','No','Yes','No','Adverse'),(63,'RUNX1','transcription factor','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(64,'RUNX1|RUNX1T1','chimeric fusion','Acute Myeloid Leukemia','Fusion','Yes: Gemtuzumab Ozogamicin','Yes','No','Favorable'),(65,'SETBP1','DNA binding protein that functions as an epigenetic remodeler','Acute Myeloid Leukemia','Mutations','No','No','Yes','Adverse'),(66,'SF3B1','component of the spliceosome complex','Acute Myeloid Leukemia','Mutations','Yes: Luspatercept','Yes','Yes','Adverse'),(67,'SH2B3','plasma membrane-associated adaptor protein','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(68,'SMC1A','component of the cohesin complex','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(69,'SMC3','component of the cohesin complex','Acute Myeloid Leukemia','Mutations','No','No','Yes','Intermediate'),(70,'SRSF2','RNA splicing factor','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(71,'STAG2','component of the cohesin complex','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(72,'TCF3','transcription factor','Acute Lymphoblastic Leukemia','Fusion','No','No','Yes',''),(73,'TET2','tumor suppressor and DNA demethylase','Acute Myeloid Leukemia','Mutations','No','No','Yes','Adverse'),(74,'TFE3','transcription factor','Acute Lymphoblastic Leukemia','Fusion','No','No','Yes',''),(75,'TP53','tumor suppressor in the DNA damage pathway','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(76,'U2AF1','splicing factor','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(77,'WT1','transcription factor','Acute Myeloid Leukemia','Mutations','No','Yes','Yes','Adverse'),(78,'ZRSR2','splicing factor U2 small nuclear ribonucleoprotein','Acute Myeloid Leukemia','Mutations','No','No','Yes','Adverse');
/*!40000 ALTER TABLE `gene_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Gene` varchar(255) DEFAULT NULL,
  `User_Notes` text DEFAULT NULL,
  `Date_Submitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_name` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_profession` varchar(45) DEFAULT NULL,
  `user_organisation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'ABL1','','2024-09-25 15:55:00',NULL,NULL,NULL,NULL),(2,'ABL1','More information','2024-09-25 15:56:38',NULL,NULL,NULL,NULL),(3,'ABL1','','2024-09-25 15:56:55',NULL,NULL,NULL,NULL),(4,'ABL1','Hello','2024-09-30 15:00:38',NULL,NULL,NULL,NULL),(5,'JAK2','SDASDS','2024-10-04 14:27:55',NULL,NULL,NULL,NULL),(6,'JAK2','','2024-10-04 20:12:08',NULL,NULL,NULL,NULL),(7,'JAK2','','2024-10-04 20:15:26',NULL,NULL,NULL,NULL),(8,'ABL1','Done','2024-10-04 20:31:48',NULL,NULL,NULL,NULL),(9,'ABL1','This is a gene','2024-10-04 20:32:29',NULL,NULL,NULL,NULL),(10,'ABL1','s','2024-10-04 20:33:21',NULL,NULL,NULL,NULL),(11,'ABL1','sa','2024-10-04 20:33:33',NULL,NULL,NULL,NULL),(12,'ABL1','sdsa','2024-10-04 20:33:42',NULL,NULL,NULL,NULL),(13,'ABL1','sdsds','2024-10-04 20:34:22',NULL,NULL,NULL,NULL),(14,'ABL1','dasd','2024-10-04 20:34:57',NULL,NULL,NULL,NULL),(15,'RUNX1','run','2024-10-04 20:37:21',NULL,NULL,NULL,NULL),(16,'RUNX1','dasd','2024-10-04 20:37:52',NULL,NULL,NULL,NULL),(17,'ABL1','Thank you','2024-10-04 21:02:12',NULL,NULL,NULL,NULL),(18,'ABL1','','2024-10-04 21:02:55',NULL,NULL,NULL,NULL),(19,'ABL1','','2024-10-04 21:04:11',NULL,NULL,NULL,NULL),(20,'ABL2','I don\'t have additional information','2024-10-04 21:10:47','Swarsat','swarsatkn@gmail.com',NULL,NULL),(21,'ABL2','cds','2024-10-04 21:12:53','Dr Arun Verma','arun_verma@gmail.com',NULL,NULL),(22,'SMC1A','More information on SMC1A','2024-10-04 21:24:06','','','bioinformatician','Amity Institute of Biotechnology');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'genedatabase'
--

--
-- Dumping routines for database 'genedatabase'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-05  3:14:01
