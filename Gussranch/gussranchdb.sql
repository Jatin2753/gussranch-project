/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 5.5.41 : Database - gussranchdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gussranchdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gussranchdb`;

/*Table structure for table `tbladmin` */

DROP TABLE IF EXISTS `tbladmin`;

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbladmin` */

insert  into `tbladmin`(`id`,`name`,`email`,`password`,`mobile`,`dateon`) values 
(1,'admin','arsaifi@gmail.com','admin','8077715318','2024-04-06');

/*Table structure for table `tblcategory` */

DROP TABLE IF EXISTS `tblcategory`;

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  `catdescription` varchar(1000) DEFAULT NULL,
  `categoryorder` int(11) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tblcategory` */

insert  into `tblcategory`(`id`,`categoryname`,`catdescription`,`categoryorder`,`dateon`) values 
(2,'Man','Item for Man',1,'2023-12-08'),
(4,'Woman','Item for Woman',2,'2023-12-08'),
(5,'Kids','Item for Kids',3,'2023-12-12'),
(6,'Phone','Smart Phone ',0,'2024-01-09');

/*Table structure for table `tblorderitem` */

DROP TABLE IF EXISTS `tblorderitem`;

CREATE TABLE `tblorderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` float DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `tblorderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `tblproducts` (`id`),
  CONSTRAINT `tblorderitem_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `tblorders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tblorderitem` */

insert  into `tblorderitem`(`id`,`rate`,`qty`,`total`,`pid`,`orderid`) values 
(1,34343,44,12121,7,6),
(2,34343,44,12121,7,6),
(3,5555,44,12121,7,6),
(4,399,3,1197,3,28),
(5,399,2,798,3,29),
(6,11200,2,22400,4,29);

/*Table structure for table `tblorders` */

DROP TABLE IF EXISTS `tblorders`;

CREATE TABLE `tblorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` int(11) DEFAULT NULL,
  `ordertotal` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `orderstatus` varchar(50) DEFAULT NULL,
  `paymentstatus` varchar(50) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `tblorders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tbluser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `tblorders` */

insert  into `tblorders`(`id`,`orderno`,`ordertotal`,`tax`,`userid`,`orderstatus`,`paymentstatus`,`paymentmode`,`dateon`) values 
(1,0,1,NULL,1,'cancel','cod','cod','2024-01-24'),
(2,1,0,2394,2,'success','success','COD','2024-01-25'),
(3,2,109200,0,2,'success','success','COD','2023-01-25'),
(4,3,163800,0,2,'success','success','COD','2024-01-25'),
(5,4,54600,0,2,'success','success','COD','2024-01-25'),
(6,5,22400,0,2,'cancel','success','COD','2024-01-25'),
(7,6,33600,0,2,'success','success','COD','2024-01-25'),
(8,7,22400,0,2,'cancel','success','COD','2024-01-25'),
(9,8,22400,0,2,'success','success','COD','2024-01-25'),
(10,9,22400,0,2,'success','success','COD','2024-01-25'),
(11,10,22400,0,2,'success','success','COD','2024-01-25'),
(12,11,22400,0,2,'delivered','success','COD','2024-01-25'),
(13,12,56000,0,2,'success','success','COD','2024-01-25'),
(14,13,56000,0,2,'success','success','COD','2024-01-25'),
(15,14,56000,0,2,'success','success','COD','2024-01-25'),
(16,15,56000,0,2,'delivered','success','COD','2024-01-25'),
(17,16,56000,0,2,'success','success','COD','2024-01-25'),
(18,17,1197,0,2,'success','success','COD','2024-01-29'),
(19,18,1197,0,2,'delivered','success','COD','2024-01-29'),
(20,19,1197,0,2,'success','success','COD','2024-02-29'),
(21,20,1197,0,2,'success','success','COD','2024-01-29'),
(22,21,1197,0,2,'pending','success','COD','2024-01-29'),
(23,22,1197,0,2,'success','success','COD','2024-01-29'),
(24,23,1197,0,2,'success','success','COD','2024-02-29'),
(25,24,1197,0,2,'pending','success','COD','2024-01-29'),
(26,25,1197,0,2,'success','success','COD','2024-01-29'),
(27,26,1197,0,2,'pending','success','COD','2024-01-29'),
(28,27,1197,0,2,'success','success','COD','2024-01-29'),
(29,28,23198,0,2,'cancel','success','COD','2024-01-29');

/*Table structure for table `tblproducts` */

DROP TABLE IF EXISTS `tblproducts`;

CREATE TABLE `tblproducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `mrp` double DEFAULT NULL,
  `sellingprice` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `img1` varchar(500) DEFAULT NULL,
  `img2` varchar(500) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `subcatid` int(11) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `subcatid` (`subcatid`),
  CONSTRAINT `tblproducts_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `tblcategory` (`id`),
  CONSTRAINT `tblproducts_ibfk_2` FOREIGN KEY (`subcatid`) REFERENCES `tblsubcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tblproducts` */

insert  into `tblproducts`(`id`,`name`,`brands`,`mrp`,`sellingprice`,`qty`,`color`,`size`,`material`,`description`,`img1`,`img2`,`catid`,`subcatid`,`dateon`) values 
(3,'Tishirt-102','Brand-2',450,399,10,'black','xl','cotton','product description                                            \r\n                                        ','1.jpg','9.jpg',2,2,'2023-12-22'),
(4,'Samsung Galaxy M20','Samsung',12000,11200,5,'white','6.7 inches, 108.1 ','Metal','   Segment Best 108MP Quad Camera Setup, with exciting features like Single Take, Object Eraser, and Photo Remaster\r\n    6.7-inch Super AMOLED Plus Display, FHD+ resolution, 1080x2400 pixels with 120Hz Refresh Rate\r\n    MTK D900 Octa Core 2.4GHz 6nm Processor with 4x4 Mimo Band support for a HyperFast 5G experience\r\n    Massive 5000 mAh Battery | Memory, Storage & SIM: 6GB RAM | RAM Plus upto 6GB |128GB internal memory expandable up to 1TB\r\n    Latest Android v12.0, One UI 4 operating system\r\n','s2.png','s1.png',6,7,'2024-01-10'),
(6,'Samsung Galaxy G200','Samsung',20001,18201,22,'gray','6.7 inches, 108.2','Metall','galaxy-m/galaxy-m53-5g-blue-128gb-storage-6gb-ram-sm-m536bzbeinudddd\r\n                                        \r\n                                        ','428599388_994851685340070_4661713273965960148_n.jpg','multimedia-courses-job-guarantee.png',6,8,'2024-01-10'),
(7,'Samsung Galaxy H12','Samsung',10000,9200,12,'REd','6.7 inches, 108.1','Metal','galaxy-m/galaxy-m53-5g-blue-128gb-storage-6gb-ram-sm-m536bzbeinu\r\n                                        ','s1.png','s2.png',6,7,'2024-01-10');

/*Table structure for table `tblshopingcart` */

DROP TABLE IF EXISTS `tblshopingcart`;

CREATE TABLE `tblshopingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `sessionid` varchar(100) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `tblshopingcart_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `tblproducts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `tblshopingcart` */

insert  into `tblshopingcart`(`id`,`pid`,`rate`,`qty`,`total`,`sessionid`,`dateon`) values 
(11,3,399,3,1197,'ranch615887334',NULL),
(12,3,399,2,798,'ranch615887334',NULL),
(14,4,11200,2,22400,'ranch-470189899','2024-01-19'),
(15,6,18200,3,54600,'ranch-470189899','2024-01-19'),
(16,7,9200,12,110400,'ranch982967355','2024-01-19'),
(17,3,399,3,1197,'ranch-1153159968','2024-01-19'),
(18,4,11200,2,22400,'ranch-1153159968','2024-01-19'),
(19,3,399,2,798,'ranch-86524012','2024-01-24'),
(20,3,399,10,3990,'ranch-86524012','2024-01-24'),
(21,3,399,1,399,'ranch709492887','2024-01-25'),
(22,4,11200,2,22400,'ranch193592880','2024-01-25'),
(23,4,11200,5,56000,'ranch1768643695','2024-01-25'),
(24,3,399,2,798,'ranch-1394704637','2024-01-25'),
(25,6,18200,2,36400,'ranch-677447473','2024-01-25'),
(26,6,18200,3,54600,'ranch1918678092','2024-01-25'),
(27,6,18200,2,36400,'ranch48848138','2024-01-25'),
(28,4,11200,2,22400,'ranch1052995412','2024-01-25'),
(29,4,11200,3,33600,'ranch1994979673','2024-01-25'),
(30,4,11200,2,22400,'ranch-358211163','2024-01-25'),
(31,4,11200,3,33600,'ranch-111985655','2024-01-25'),
(32,4,11200,2,22400,'ranch1352891662','2024-01-25'),
(33,4,11200,5,56000,'ranch-1076508642','2024-01-25'),
(34,4,11200,5,56000,'ranch1036551159','2024-01-25'),
(35,3,399,3,1197,'ranch1076070797','2024-01-29'),
(36,3,399,3,1197,'ranch206844894','2024-01-29'),
(37,3,399,10,3990,'ranch-971378582','2024-01-29'),
(38,3,399,10,3990,'ranch-1886345549','2024-01-29'),
(39,3,399,10,3990,'ranch-1886345549','2024-01-29'),
(40,3,399,3,1197,'ranch295787078','2024-01-29'),
(41,3,399,2,798,'ranch1420347598','2024-01-29'),
(42,4,11200,2,22400,'ranch1420347598','2024-01-29');

/*Table structure for table `tblsubcategory` */

DROP TABLE IF EXISTS `tblsubcategory`;

CREATE TABLE `tblsubcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcatname` varchar(50) DEFAULT NULL,
  `subcatdesc` varchar(1000) DEFAULT NULL,
  `subcatorder` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  CONSTRAINT `tblsubcategory_ibfk_1` FOREIGN KEY (`catid`) REFERENCES `tblcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tblsubcategory` */

insert  into `tblsubcategory`(`id`,`subcatname`,`subcatdesc`,`subcatorder`,`catid`,`dateon`) values 
(1,'subcatname','subcatdesc',1,4,'2023-12-12'),
(2,'T-Shirts','T-Shirts for Man',1,2,'2023-12-12'),
(3,'Jeans','jeans for man',2,2,'2023-12-12'),
(4,'shirts','shirts for man',3,2,'2023-12-12'),
(5,'Ladies Kurti','Kurties for Woman',4,4,'2023-12-12'),
(6,'Froks','froks for Kids',5,5,'2023-12-12'),
(7,'Smart Phone','Samrt Phone',1,6,'2024-01-09'),
(8,'Keypad Phone','Keypad Phone',2,6,'2024-01-09');

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `fulladdress` varchar(1000) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin` varchar(50) DEFAULT NULL,
  `landmark` varchar(500) DEFAULT NULL,
  `dateon` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbluser` */

insert  into `tbluser`(`id`,`name`,`email`,`password`,`mobile`,`fulladdress`,`city`,`pin`,`landmark`,`dateon`) values 
(1,'name','email','password','mobile','fulladdress','city','pin','landmark','2024-01-24'),
(2,'arsaifi','arsaifi@gmail.com','pass','9897786715','addresss','ghaziabad','201001','bhati more','2024-01-24'),
(3,'jatin Sharma','microvisiontechno@gmail.com','jatin123','8077715317','railway road','hapur','245101','cityplaza','2024-04-02');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
