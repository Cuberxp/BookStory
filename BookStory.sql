CREATE DATABASE bookStore;
USE bookStore;

#用户表
CREATE TABLE `user` (
  `id` INT(11) AUTO_INCREMENT,
  `username` VARCHAR(20) ,
  `PASSWORD` VARCHAR(20) ,
  `gender` VARCHAR(10) ,
  `email` VARCHAR(50) ,
  `telephone` VARCHAR(20) ,
  `introduce` VARCHAR(100),
  `activeCode` VARCHAR(50) ,
  `state` INT(11) ,
  `role` VARCHAR(10) DEFAULT '普通用户',
  `registTime` TIMESTAMP ,
  PRIMARY KEY (`id`)
);

#商品表
CREATE TABLE `products` (
  `id` VARCHAR(100) ,
  `name` VARCHAR(40) ,
  `price` DOUBLE ,
  `category` VARCHAR(40) ,
  `pnum` INT(11) ,
  `imgurl` VARCHAR(100) ,
  `description` VARCHAR(255) ,
  PRIMARY KEY (`id`)
);
#订单表
CREATE TABLE `orders` (
  `id` VARCHAR(100) ,
  `money` DOUBLE ,
  `receiverAddress` VARCHAR(255) ,
  `receiverName` VARCHAR(20) ,
  `receiverPhone` VARCHAR(20) ,
  `paystate` INT(11) ,
  `ordertime` TIMESTAMP ,
  `user_id` INT(11) ,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

#订单详情表
CREATE TABLE `orderitem` (
  `order_id` VARCHAR(100) ,
  `product_id` VARCHAR(100),
  `buynum` INT(11) ,
  PRIMARY KEY (`order_id`,`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
);


INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (1,'Java入门基础-GYF',168.88,'计算机',3,"/101.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (2,'HTML入门到精通-GYF',168.88,'计算机',3,"/102.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (3,'JS入门到精通-GYF',168.88,'计算机',3,"/103.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (4,'PHP入门到精通-GYF',168.88,'计算机',3,"/104.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (5,'Android入门到精通-GYF',168.88,'计算机',3,"105.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (6,'iOS入门到精通-GYF',168.88,'计算机',3,"/106.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (7,'MySQL入门到精通-GYF',168.88,'计算机',3,"/107.jpg",'good book');
INSERT INTO products (id,NAME,price,category,pnum,"/bookcover.jpg",description) 
VALUES (8,'Oracle入门到精通-GYF',168.88,'计算机',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (9,'VMWare入门到精通-GYF',168.88,'计算机',3,NULL,'good book');


INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (11,'武炼巅峰',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (12,'绝世药神',8.88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (13,'王牌狙击之霸宠狂妻',8.88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (14,'非我倾城：王爷要休妃',8.88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (15,'超品相师',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (16,'最强弃少',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (17,'折锦春',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (18,'金陵春',16,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (19,'总裁的新妻',16,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (21,'武炼巅峰2',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (22,'绝世药神2',8.88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (23,'王牌狙击之霸宠狂妻2',8.88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (24,'非我倾城：王爷要休妃2',8.88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (25,'超品相师2',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (26,'最强弃少2',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (27,'折锦春2',88,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (28,'金陵春2',16,'文学',3,NULL,'good book');
INSERT INTO products (id,NAME,price,category,pnum,imgurl,description) 
VALUES (29,'总裁的新妻2',16,'文学',3,NULL,'good book');


SELECT * FROM products;
SELECT * FROM USER;
DELETE FROM products
