/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.5.37 : Database - ttms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ttms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ttms`;

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_account` varchar(20) NOT NULL,
  `emp_pass` varchar(20) NOT NULL DEFAULT '111111',
  `emp_name` varchar(60) NOT NULL,
  `emp_position` varchar(100) NOT NULL,
  `emp_sex` varchar(5) DEFAULT NULL,
  `emp_dob` varchar(50) DEFAULT NULL,
  `emp_age` int(11) DEFAULT NULL,
  `emp_tel` varchar(50) DEFAULT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_addr` varchar(100) DEFAULT NULL,
  `emp_img` varchar(500) DEFAULT NULL,
  `emp_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `employees` */

insert  into `employees`(`emp_id`,`emp_account`,`emp_pass`,`emp_name`,`emp_position`,`emp_sex`,`emp_dob`,`emp_age`,`emp_tel`,`emp_email`,`emp_addr`,`emp_img`,`emp_flag`) values (1,'04143033','111111','杜ligang','管理员','男','1995-08-20',21,'150321236210','0012541253@qq.com','西安邮电大学',NULL,1),(2,'04143032','081266','少年','售票员','男','1995-11-24',22,'15230215362','25253614@qq.com','陕西省西安市高新区',NULL,2),(3,'04143030','123456','张三丰','售票员','男','1979-10-09',38,'12036251458','12536512@qq.com','陕西省西安市雁塔区',NULL,2),(4,'04143000','111111','张三','售票员','男','1995-5-26',22,'1523621254','12543695@qq.com','西安邮电大学',NULL,2),(5,'04143001','111111','李四','售票员','女','1996-5-6',21,'15091672137','1187033839@qq.com','西安邮电大学',NULL,2),(10,'120321456','111111','撒地方','普通员工','那','235',25,'123654','撒地方','阿斯蒂芬',NULL,0),(11,'04143027','111111','杜立刚','售票员','男','1995-8-12',22,'12591675236','125365472@qq.com','西安邮电大学',NULL,2),(12,'04143036','111111','代栋','售票员','男','1995-5-26',23,'15236521452','125436987@qq.com','西安邮电大学',NULL,2),(13,'04143027','111111','hello','售票员','男','1995-08-12',22,'15236521452','125463987@qq.com','西安',NULL,2),(15,'04143038','111111','jack','售票员','男','1995-08-12',25,'1253651254','12543698@qq.com','西安',NULL,2),(16,'04143038','111111','赵晓','售票员','女','1995-08-12',22,'1536251368','12536987@qq.com','西安邮电大学',NULL,2),(17,'04143039','123456','世界','普通员工','男','1995-08-16',25,'13698563258','1425398@qq.com','西安',NULL,0),(18,'04143035','111111','sdfjsdkljf','售票员','男','1996-12-20',20,'12345678910','fsddfsd@qq.com','sdfsdf',NULL,2);

/*Table structure for table `films` */

DROP TABLE IF EXISTS `films`;

CREATE TABLE `films` (
  `film_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_name` varchar(100) NOT NULL,
  `film_length` int(11) NOT NULL,
  `film_type` varchar(50) NOT NULL,
  `film_stars` varchar(200) NOT NULL,
  `film_desc` varchar(600) DEFAULT NULL,
  `film_price` float(3,1) NOT NULL,
  `film_datetime` varchar(50) DEFAULT NULL,
  `film_area` varchar(50) DEFAULT NULL,
  `film_img` varchar(500) DEFAULT NULL,
  `film_score` float(2,1) DEFAULT NULL,
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Data for the table `films` */

insert  into `films`(`film_id`,`film_name`,`film_length`,`film_type`,`film_stars`,`film_desc`,`film_price`,`film_datetime`,`film_area`,`film_img`,`film_score`) values (48,'讲课',126,'爱情,动画','少林','好看极了',25.9,'','日本','/ttms/film_img/201706090823214611.jpg',NULL),(49,'电脑3',127,'喜剧,犯罪','李良杰','好看极了sdfsdfdsf',36.8,'2017-6-5','韩国','/ttms/film_img/201706070932443791.jpg',NULL),(50,'少林寺',125,'剧情,惊悚,犯罪','李连杰','好看极了',36.9,'2017-6-5','大陆','/ttms/film_img/201706071653130751.jpg',NULL),(51,'你好',129,'动作,犯罪','康凯','非常好看啦',36.9,'2017-6-7','美国','/ttms/film_img/201706071656583701.jpg',NULL),(53,'傻瓜',126,'爱情,惊悚,犯罪','莉莉安家','哈是大多数',39.5,'2017-5-12','泰国','/ttms/film_img/201706071708553912.jpg',NULL),(54,'你好世界',126,'动作,惊悚','李连杰','好看死了',36.9,'2017-06-09','韩国','/ttms/film_img/201706090434358552.jpg',NULL);

/*Table structure for table `notices` */

DROP TABLE IF EXISTS `notices`;

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_name` varchar(50) DEFAULT NULL,
  `notice_time` varchar(50) DEFAULT NULL,
  `notice_title` varchar(100) DEFAULT NULL,
  `notice_content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `notices` */

insert  into `notices`(`notice_id`,`notice_name`,`notice_time`,`notice_title`,`notice_content`) values (1,NULL,'2017-06-08 22:39:12',NULL,'我们要开饭啦......'),(4,NULL,'2017-06-09 08:28:05',NULL,'sdfdsfsdj');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_time` varchar(50) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `order_price` float(4,1) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `schedules` */

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
  `sche_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_begintime` varchar(50) NOT NULL,
  `film_endtime` varchar(50) NOT NULL,
  `film_id` int(11) NOT NULL,
  `studio_id` int(11) DEFAULT NULL,
  `film_startdate` varchar(50) NOT NULL,
  PRIMARY KEY (`sche_id`),
  KEY `FK_film_SCHE` (`film_id`),
  KEY `FK_STUDIO_SCHE` (`studio_id`),
  CONSTRAINT `FK_film_SCHE` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`),
  CONSTRAINT `FK_STUDIO_SCHE` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `schedules` */

insert  into `schedules`(`sche_id`,`film_begintime`,`film_endtime`,`film_id`,`studio_id`,`film_startdate`) values (2,'14:00','16:06',48,4,'2017-06-09'),(3,'8:00','10:07',49,1,'2017-06-09'),(4,'14:00','16:09',51,1,'2017-06-09'),(13,'8:00','10:09',51,2,'2017-06-09'),(14,'17:00','19:07',49,2,'2017-06-10'),(15,'17:00','19:09',51,1,'2017-06-10');

/*Table structure for table `seats` */

DROP TABLE IF EXISTS `seats`;

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_status` int(11) NOT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_col` int(11) DEFAULT NULL,
  `studio_id` int(11) NOT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `FK_SEAT_STU` (`studio_id`),
  CONSTRAINT `FK_SEAT_STU` FOREIGN KEY (`studio_id`) REFERENCES `studios` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `seats` */

insert  into `seats`(`seat_id`,`seat_status`,`seat_row`,`seat_col`,`studio_id`) values (1,-1,1,1,1),(2,1,1,2,1),(18,1,9,9,1),(19,1,9,8,1),(21,0,5,6,1),(22,-1,1,3,1),(23,-1,1,4,1),(24,-1,1,5,1),(25,-1,2,1,1),(31,-1,1,2,1),(32,1,9,3,1),(33,1,7,5,2),(34,1,7,6,2),(35,1,7,7,2),(36,-1,10,5,2),(37,-1,10,6,2),(38,-1,9,6,1),(40,1,7,7,1),(41,1,7,6,1),(45,-1,9,6,1),(46,1,6,5,1),(47,-1,6,8,1),(48,-1,5,8,1),(49,1,7,3,1),(50,1,6,3,1);

/*Table structure for table `studios` */

DROP TABLE IF EXISTS `studios`;

CREATE TABLE `studios` (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(50) NOT NULL,
  `seat_rows` int(11) NOT NULL,
  `seat_cols` int(11) NOT NULL,
  `studio_type` varchar(50) NOT NULL,
  `studio_desc` varchar(600) DEFAULT NULL,
  `studio_img` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `studios` */

insert  into `studios`(`studio_id`,`studio_name`,`seat_rows`,`seat_cols`,`studio_type`,`studio_desc`,`studio_img`) values (1,'一号厅',9,10,'3D','很好用啦','/ttms/studio_img/201706062316330682.jpg'),(2,'二号厅',10,12,'3D','非常好用！','/ttms/studio_img/201706070859374251.jpg'),(4,'五号厅',10,12,'3D','环境真好！','/ttms/studio_img/201706071717166301.jpg'),(5,'八号厅',9,10,'刺激','非常好用啦','/ttms/studio_img/201706071721587052.jpg'),(7,'七号厅',9,10,'巨幕厅','sdlkfjdsklfjkl','/ttms/studio_img/201706090910340582.jpg');

/*Table structure for table `tickets` */

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `sche_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `seat_row` int(11) NOT NULL,
  `seat_col` int(11) NOT NULL,
  `ticket_date` varchar(50) NOT NULL,
  `ticket_price` float(2,1) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FK_ORDER_TICKET` (`order_id`),
  CONSTRAINT `FK_ORDER_TICKET` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tickets` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
