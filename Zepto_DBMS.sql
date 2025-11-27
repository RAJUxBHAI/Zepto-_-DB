/*
SQLyog Community v13.3.1 (64 bit)
MySQL - 8.0.44 : Database - quick_commerce_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`quick_commerce_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `quick_commerce_db`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `saved_address` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customers` */

insert  into `customers`(`customer_id`,`full_name`,`phone_number`,`saved_address`,`created_at`) values 
(1,'Babu Rao Ganpatrao Apte','9999911111','Star Garage, Khopdi Tod Saale Ka Gali, Mumbai','2025-11-28 03:18:55'),
(2,'Jethalal Gada','9898989898','B-202, Gokuldham Society, Powder Gali, Goregaon East','2025-11-28 03:18:55'),
(3,'Monisha Sarabhai','9000050000','Rosesh’s Mommy House, Bargain Bhavan, South Bombay','2025-11-28 03:18:55'),
(4,'Sharma Ji Ka Beta','9910099100','Topper House, 100/100 Marks Street, A grade City','2025-11-28 03:18:55'),
(5,'Vasooli Bhai','9822233344','50 Tola Nagar, Pachaas Rupiya Kaat Road, Dubai','2025-11-28 03:18:55'),
(6,'Crime Master Gogo','8888800000','Aankhen Nikal Ke Goti Khelunga Chowk, Andaz Apna Apna','2025-11-28 03:18:55'),
(7,'Kabir Singh','9996669999','Boys Hostel, Room 404, Preeti Ki Yaad Mein, Delhi','2025-11-28 03:18:55'),
(8,'Sima Taparia','9700012345','Rishta Manzil, Compromise Lane, Mumbai','2025-11-28 03:18:55'),
(9,'Chatur Ramalingam','9111122222','Balatkar Bhavan, Oont Patang Road, Ladakh','2025-11-28 03:18:55'),
(10,'Pappu Cant Dance','9876543210','Dance Floor, Muscular Road, Sala','2025-11-28 03:18:55'),
(11,'Kachra Seth','9123456789','Dedh Sau Rupiya Block, Phir Hera Pheri Colony','2025-11-28 03:18:55'),
(12,'Majnu Bhai','9898123123','Painting Studio, Ghoda Ke Upar Gadha Lane, Mumbai','2025-11-28 03:18:55'),
(13,'Anjali (Leave Me Alone)','9900990099','Summer Camp, Kuch Kuch Hota Hai Road, Shimla','2025-11-28 03:18:55'),
(14,'Gangadhar (Shaktimaan)','9119119119','News Office, Chhoti Chhoti Magar Moti Baatein, Mumbai','2025-11-28 03:18:55'),
(15,'Binod','9000000001','Comment Section, YouTube Nagar, Internet','2025-11-28 03:18:55');

/*Table structure for table `delivery_riders` */

DROP TABLE IF EXISTS `delivery_riders`;

CREATE TABLE `delivery_riders` (
  `rider_id` int NOT NULL AUTO_INCREMENT,
  `rider_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `current_status` enum('Available','Busy','Offline') DEFAULT 'Offline',
  PRIMARY KEY (`rider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `delivery_riders` */

insert  into `delivery_riders`(`rider_id`,`rider_name`,`phone_number`,`current_status`) values 
(1,'Dhoom Machale Ali','9800011111','Available'),
(2,'Heavy Driver Salmon','9800022222','Busy'),
(3,'Rocky Bhai','9800033333','Available'),
(4,'Late Lateef','9800044444','Offline'),
(5,'Flying Jatt','9800055555','Available'),
(6,'Radhe Bhaiya','9800066666','Busy'),
(7,'Circuit','9800077777','Available'),
(8,'Spider-Man (India)','9800088888','Busy');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity_in_stock` int DEFAULT '0',
  PRIMARY KEY (`inventory_id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `warehouses` (`store_id`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `inventory` */

insert  into `inventory`(`inventory_id`,`store_id`,`product_id`,`quantity_in_stock`) values 
(1,1,1,500),
(2,1,3,1000),
(3,2,2,50),
(4,3,7,200),
(5,3,14,10000),
(6,5,4,20),
(7,5,5,500),
(8,4,7,0);

/*Table structure for table `order_items` */

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order_items` */

insert  into `order_items`(`item_id`,`order_id`,`product_id`,`quantity`,`price_at_purchase`) values 
(1,5,14,1,10.00);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `rider_id` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_status` enum('Placed','Packing','Out for Delivery','Delivered','Cancelled') DEFAULT 'Placed',
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `rider_id` (`rider_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`rider_id`) REFERENCES `delivery_riders` (`rider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`customer_id`,`rider_id`,`total_price`,`order_status`,`order_time`) values 
(1,1,7,100.00,'Delivered','2023-10-25 10:00:00'),
(2,2,1,50.00,'Out for Delivery','2025-11-28 03:20:05'),
(3,4,3,270.00,'Placed','2025-11-28 03:20:05'),
(4,7,2,450.00,'Cancelled','2023-10-24 22:00:00'),
(5,14,8,10.00,'Delivered','2023-10-25 09:30:00');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `products` */

insert  into `products`(`product_id`,`product_name`,`price`,`category`,`image_url`) values 
(1,'Lays (90% Air, 10% Chips)',20.00,'Snacks','lays_air.jpg'),
(2,'Maggi (2 Min Jhooth)',12.00,'Instant Food','maggi_lie.jpg'),
(3,'Dolo 650 (National Snack)',30.00,'Pharma','dolo_fav.jpg'),
(4,'Fair & Lovely (Tubelight Glow)',85.00,'Beauty','glow_hard.jpg'),
(5,'Hajmola (Fart Starter)',5.00,'Digestive','bomb.jpg'),
(6,'Bournvita (Sugar Rush Pro)',240.00,'Health Drink','sugar_high.jpg'),
(7,'Old Monk (Cough Syrup)',450.00,'Beverage','emotional_support.jpg'),
(8,'Parle-G (Chai Dipper)',5.00,'Snacks','g_mane_genius.jpg'),
(9,'Kopi Luwak (Ameer Coffee)',1200.00,'Beverage','rich_bean.jpg'),
(10,'Elaichi (Biryani Saboteur)',50.00,'Spices','mouth_ruiner.jpg'),
(11,'Chyawanprash (Sticky Jam)',150.00,'Health','dabur_chy.jpg'),
(12,'Thums Up (Toofani Drink)',40.00,'Beverage','taste_the_thunder.jpg'),
(13,'Santoor Soap (Mummy Logic)',35.00,'Beauty','young_mom.jpg'),
(14,'Vimal Pan Masala (Zuban Kesari)',10.00,'Mouth Freshener','red_wall.jpg');

/*Table structure for table `warehouses` */

DROP TABLE IF EXISTS `warehouses`;

CREATE TABLE `warehouses` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) NOT NULL,
  `location_pin` varchar(20) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `warehouses` */

insert  into `warehouses`(`store_id`,`store_name`,`location_pin`) values 
(1,'Silk Board Junction (Stuck Forever Hub)','560068'),
(2,'Rajiv Chowk (Suffocation Center)','110001'),
(3,'Dadar Station (Push & Shove Depot)','400014'),
(4,'Goa (Plan Cancelled Hub)','403001'),
(5,'Andheri East (Traffic Jam Store)','400069');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
