-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: cozychapterdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123 Main St','Nairobi','00100',3),(2,'456 Abbey Rd','London','SW1A',2),('20 Ingram Street', 'Queens', '11377', 1),('10880 Malibu Point', 'Malibu', '90265', 2),('1 Wakandan Lane', 'Birnin Zana', '00001', 3),('456 Spy Alley', 'Moscow', '101000', 4);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `address_status`
--

LOCK TABLES `address_status` WRITE;
/*!40000 ALTER TABLE `address_status` DISABLE KEYS */;
INSERT INTO `address_status` VALUES (1,'Current'),(2,'Old'),(3,'Primary'),(4,'Secondary'),(5,'Temporary'),(6,'Permanent');
/*!40000 ALTER TABLE `address_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'George','Orwell'),(2,'Ngugi','wa Thiong\'o'),(3,'Chimamanda','Adichie'),(4,'George','Orwell'),(5,'Ngugi','wa Thiong\'o'),(6,'Chimamanda','Adichie'),(7, 'James Rocket', 'Author specializing in cosmic adventures and space operas.', '1978-05-21', 'American'),(8, 'Ariana Spellcaster', 'Known for her mystical fantasy books.', '1984-03-12', 'British'),(9,'T-Chaka Okoye', 'Writes about themes of legacy and leadership.', '1969-11-10', 'Nigerian'),(10, 'Scarlet Weaver', 'Fiction author crafting intricate tales.', '1990-07-15', 'American'),(11, 'Clint Arrowman', 'Author focusing on precision thrillers.', '1983-02-20', 'Canadian'),(12, 'Paul Quantum', 'Creative writer exploring the quantum realm.', '1975-09-08', 'Australian'),(13, 'Avengers Editorial Team', 'Collaboration of authors chronicling superhero adventures.', NULL, 'International');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'1984','0-596-52068-9',1,1,15.99,1949,10),(2,'Petals of Blood','978-0-596-52068-7',3,2,10.50,1977,7),(3,'Half of a Yellow Sun','1-23486-789-X',2,1,12.00,2006,5),(4,'Hulk: Unleashing the beast', 10.99, 16),(5,'Captain America: Shield of Honor', 17.20, 23),(6,'Black Widow: Shadow Spy Tales', 14.50, 21),(7,'Doctor Strange: Mystical Adventures', 16.99, 10),(8,'Black Panther: The Wakandan Legacy', 14.99, 14),(9,'Scarlet Witch: Woven Destinies', 12.99, 8),(10,'Hawkeye: Sharp Shootin’ Tales', 10.99, 20),(11,'Ant-Man and the Quantum Realm', 13.99, 9),(12,'Avengers: Endgame Epilogues', 24.99, 18),(13,'Guardians of the Galaxy: Cosmic Chronicles', 18.99, 12);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,1),(2,2),(3,3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(10, 10),(11, 11),(12, 12),(13, 13);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (1,'English'),(2,'Swahili'),(3,'French'),(4,'English'),(5,'Swahili'),(6,'French'),(7,'English'),(8,'Mandarin'),(9,'Igbo'),(10,'English'),(11,'Spanish'),(12,'Arabic'),(13,'English');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA'),(2,'United Kingdom'),(3,'Kenya'),(4,'USA'),(5,'United Kingdom'),(6,'Kenya'),(7,'South Africa'),(8,'France'),(9,'Germany'),(10,'India'),(11,'Brazil');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cust_order`
--

LOCK TABLES `cust_order` WRITE;
/*!40000 ALTER TABLE `cust_order` DISABLE KEYS */;
INSERT INTO `cust_order` VALUES (1,1,'2025-04-13 05:41:15',1,1),(2,2,'2025-04-13 05:41:15',3,2),(3, '2025-04-12 16:45:00', 1, 3),(4, '2025-04-13 10:00:00', 3, 2),(5, '2025-04-13 11:30:00', 1, 1);
/*!40000 ALTER TABLE `cust_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Alice','Kamau','alice@example.com','+254700000001'),(2,'John','Doe','john.doe@example.com','+447911123456'),(3,'Natasha', 'Williams', 'natashawilliams@gmail.com', '567-890-1234', 1),(4,'Isaac', 'Beck', 'isaac.beck@gmail.com', '789-123-4560', 2),(5,'Bruce', 'Wayne', 'brucewayne.5@gmail.com', '456-789-0123', 1),(6,'Mark', 'Odinson', 'mark.odinson@gmail.com', '012-345-6789', 3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,1,1),(2,2,1),(3, 3, 1),(4, 4, 1),(5, 5, 1),(6, 6, 1);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,1,'2025-04-13 05:41:15'),(2,2,3,'2025-04-13 05:41:15'),(3, 3, '2025-04-13 10:00:00');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,2,31.98),(2,3,1,12.00),(2, 3, 3, 13.22),(3, 4, 1, 14.99),(3, 5, 2, 17.20);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Pending'),(2,'Shipped'),(3,'Delivered'),(4,'Cancelled');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Penguin Books',NULL,1),(2,'Oxford Press',NULL,2),(3,'Nairobi Publishing House',NULL,3),(4,'Penguin Books',NULL,1),(5,'Oxford Press',NULL,2),(6,'Nairobi Publishing House',NULL,3);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'Standard',5.00),(2,'Express',10.00),('Overnight Delivery', 24.99),('Standard Shipping', 13.22),('International Shipping', 19.99);
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 18:02:10

