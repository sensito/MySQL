DROP DATABASE IF EXISTS cafeteria;
CREATE DATABASE IF NOT EXISTS cafeteria;
USE cafeteria;


CREATE TABLE IF NOT EXISTS services(
  `service` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `product` VARCHAR(50) NOT NULL,
  `price`DOUBLE NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `description` TEXT
)CHARSET=utf8mb4;

INSERT INTO `services` VALUES (1,"Torta",356,"2019-01-11 04:36:41","2020-05-26 21:43:25",0,"a purus. Duis elementum, dui quis accumsan convallis,"),(2,"Expreso",495,"2019-02-01 08:57:47","2020-05-07 04:26:32",1,"libero est, congue a, aliquet"),(3,"Late",312,"2019-11-19 03:20:23","2019-07-07 12:15:25",0,"libero mauris, aliquam eu, accumsan sed, facilisis"),(4,"Te",408,"2020-02-11 13:57:52","2019-08-08 01:08:27",0,"ipsum. Phasellus vitae mauris sit amet lorem semper"),(5,"Ensalada",157,"2019-08-12 01:30:45","2018-10-31 09:21:57",0,"Duis"),(6,"Chai late",360,"2020-10-05 05:11:31","2019-06-02 09:22:38",0,"ultricies dignissim lacus. Aliquam rutrum"),(7,"Shot",137,"2018-10-23 02:28:34","2019-05-05 04:16:49",0,"Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc"),(8,"Cafe Frio", 299,"2019-08-06 23:59:01","2020-06-05 00:30:26",1,"non, egestas a, dui. Cras pellentesque. Sed"),(9,"Cold Breuw",213,"2020-06-23 11:05:50","2018-12-09 22:48:41",1,"In faucibus. Morbi"),(10,"Cortado",473,"2019-07-22 15:20:59","2020-05-30 20:03:48",0,"nulla at sem molestie sodales."),(11,"Americano",170,"2019-12-05 19:22:47","2019-11-19 12:04:19",0,"egestas lacinia."),(12,"cappuccino",489,"2019-09-14 14:13:14","2020-09-23 13:25:23",1,"Etiam bibendum fermentum metus. Aenean sed pede nec"),(13,"mocha",389,"2020-04-16 19:23:53","2019-01-17 05:17:49",0,"egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam"),(14,"mocha",107,"2019-02-02 19:29:49","2020-02-29 11:24:23",1,"Suspendisse dui. Fusce"),(15,"pastel",382,"2019-07-04 19:04:31","2019-09-17 21:21:13",1,"sem molestie sodales.");


CREATE TABLE IF NOT EXISTS zones(
  `zone` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `state` VARCHAR(27) COMMENT 'ISO 3166-2',
  `municipality` VARCHAR(50)
)CHARSET=utf8mb4;
INSERT INTO `zones` VALUES (1,"Barrow-in-Furness","Apdo.:397-9084 In Av."),(2,"Wanzele","262-3989 Nunc "),(3,"Lelystad","653-6637 Adipiscing C/"),(4,"Cañete","980-4771 Aliquam Calle"),(5,"Chemnitz","Apartado núm.: 977, 4017 Hendrerit Calle"),(6,"Chambord","Apartado núm.: 142, 4576 Cubilia Av."),(7,"Sete Lagoas","Apdo.:660-4222 Phasellus Avenida"),(8,"Lillianes","701-9724 Odio. Calle"),(9,"Biggleswade","649-919 Ut Avenida"),(10,"Acquasparta","Apdo.:922-105 Nunc. "),(11,"Maltignano","993-1322 Sed C/"),(12,"Dover","975-776 Vulputate"),(13,"General Lagos","6483 Integer "),(14,"Koningshooikt","Apdo.:620-5883 Rutrum. Av."),(15,"Tuscaloosa","Apartado núm.: 421, 7848 At, Av.");


CREATE TABLE IF NOT EXISTS users(
  `user` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name`  VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` VARCHAR(20) DEFAULT NULL,
  `gender` ENUM('M','F','NP') DEFAULT NULL,
  `address` VARCHAR(80) DEFAULT NULL,
  `PHOTO` VARCHAR(100),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `email` (`email`)
)CHARSET=utf8mb4;

INSERT INTO `users` (`user`,`name`,`email`,`birthdate`,`phone`,`gender`,`address`,`created_at`,`update_at`,`active`) VALUES (1,"Sloane, MacKenzie, Tatum, Colin","eu.placerat.eget@nislsem.com","2019-11-03","76-52-97-99-47","F","100-3650 Imperdiet Carretera","2019-04-17 09:51:58","2020-07-28 20:27:36",1),(2,"Hannah, Kuame, Tiger, Griffith","nec.orci.Donec@euismodetcommodo.org","2020-06-29","28-25-71-35-69","F","Apdo.:787-5395 Suscipit, Ctra.","2019-03-20 07:09:31","2020-08-29 20:02:12",1),(3,"Oren, Brock, Unity, Roanna","Aliquam.erat.volutpat@orci.org","2019-02-28","38-74-48-44-51","F","Apdo.:653-5760 Pede, Av.","2019-04-19 10:40:27","2018-11-13 17:28:25",1),(4,"Zelda, Maite, Devin, Frances","pharetra@facilisiSedneque.co.uk","2018-11-26","26-84-83-69-45","F","Apartado núm.: 618, 6307 Quisque Carretera","2020-01-03 22:42:50","2019-07-28 21:29:36",0),(5,"Talon, Palmer, Zeph, Maggie","aliquet.odio@ipsumDonec.ca","2020-07-18","14-86-21-06-29","F","Apartado núm.: 488, 7485 Donec Calle","2019-04-16 21:09:31","2019-07-09 16:12:42",0),(6,"Jason, Ima, Quon, Yardley","malesuada.malesuada@ac.com","2019-06-21","33-81-58-59-59","M","486 Tristique Av.","2019-11-17 20:04:38","2019-09-03 18:21:21",1),(7,"Clarke, Janna, Aileen, Emery","dictum@vulputate.ca","2019-06-23","84-05-83-88-42","F","Apdo.:148-7674 Interdum. Avenida","2019-10-08 15:23:46","2019-11-22 21:46:23",0),(8,"Rooney, Sharon, Trevor, Aileen","vulputate@consequatpurus.co.uk","2019-01-02","56-76-40-61-61","F","718-8263 In Avda.","2019-02-16 01:13:18","2019-12-17 10:31:06",1),(9,"Thaddeus, Angelica, Tate, Medge","dolor.dapibus@Cras.ca","2019-11-21","87-84-30-40-85","M","695-1329 Adipiscing, C/","2020-09-21 08:15:04","2019-06-26 22:35:41",0),(10,"Breanna, Dalton, Marny, Janna","eu.eleifend@aliquam.co.uk","2020-04-11","64-25-65-40-74","M","213-6417 Suspendisse ","2019-02-15 13:46:21","2020-03-10 23:06:00",1),(11,"Ruby, Lacy, Montana, Whilemina","sit.amet@orcilacus.com","2020-03-06","18-63-99-39-77","F","7611 A ","2020-06-01 16:56:00","2019-02-08 05:50:08",1),(12,"Aspen, Chandler, Yardley, Amy","feugiat.nec.diam@Aliquamtincidunt.co.uk","2020-01-23","32-74-73-03-82","M","Apartado núm.: 106, 7233 Mauris ","2019-11-25 03:39:51","2020-04-10 09:04:09",0),(13,"Ashton, Gavin, Mariko, Sophia","Class.aptent.taciti@portaelit.edu","2019-06-11","17-68-83-50-47","M","Apdo.:270-1297 Montes, Av.","2020-04-23 11:39:59","2019-08-15 05:04:55",0),(14,"Owen, Maggie, Julian, Emily","Nullam.velit.dui@vitaesodalesnisi.ca","2018-11-04","92-48-51-03-25","M","Apartado núm.: 478, 4709 Maecenas Avenida","2019-02-07 10:30:40","2019-06-21 18:14:19",1),(15,"Nathan, Iris, Tashya, Russell","lacus.Nulla@dictummi.com","2020-02-12","53-63-00-84-39","F","616-8054 Lobortis Avda.","2019-01-05 05:11:22","2019-07-13 12:59:35",1);


CREATE TABLE IF NOT EXISTS coffee_shops (
  `coffee_shop` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `address` VARCHAR(100) NOT NULL,
  `zone` INT UNSIGNED NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `finish` TIME NOT NULL,
  `start` TIME NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `description` TEXT,
  FOREIGN KEY (zone) REFERENCES zones(zone)
)CHARSET=utf8mb4;

INSERT INTO `coffee_shops` (`coffee_shop`,`address`,`zone`,`phone`,`finish`,`start`,`created_at`,`update_at`,`active`,`description`) VALUES (1,"Apartado núm.: 614, 4847 Ac Carretera",1,"44-33-94-00-79","11:57:26","03:50:51","2020-04-06 14:52:37","2018-12-01 07:45:41",0,"mollis dui, in"),(2,"9799 Nunc C.",2,"12-88-59-62-91","10:58:33","13:47:13","2020-02-20 17:27:53","2020-06-16 19:41:48",0,"habitant morbi tristique senectus et netus et malesuada"),(3,"539-9275 Volutpat. Av.",3,"55-17-08-30-51","18:29:11","22:42:45","2018-11-07 06:53:41","2020-08-05 11:53:07",0,"Pellentesque"),(4,"4154 Vel, Avenida",4,"22-81-36-77-91","04:30:19","19:43:52","2019-02-15 00:46:05","2020-03-23 11:24:31",1,"Sed et libero. Proin mi. Aliquam gravida mauris"),(5,"156-1801 Bibendum Av.",5,"42-22-38-41-48","20:47:37","05:02:32","2019-04-22 01:03:30","2020-03-22 16:58:57",1,"habitant morbi tristique senectus et netus et malesuada"),(6,"630-2294 Vel Calle",6,"23-78-07-54-14","08:22:15","22:15:01","2019-10-06 12:09:47","2020-03-08 18:51:31",1,"magna."),(7,"8434 Maecenas ",7,"59-90-88-54-08","12:14:17","16:40:44","2019-04-04 16:07:39","2019-10-21 04:46:45",1,"purus. Nullam scelerisque neque sed sem egestas blandit. Nam"),(8,"326-1222 Cras C/",8,"66-49-03-50-71","23:13:23","13:20:39","2019-08-01 17:13:34","2018-11-20 18:36:46",0,"eleifend. Cras sed leo. Cras vehicula aliquet"),(9,"Apdo.:649-894 Non Av.",9,"21-56-32-19-14","04:20:53","18:51:23","2019-05-10 12:02:07","2019-03-08 16:08:01",1,"quis lectus. Nullam suscipit, est ac facilisis"),(10,"489-7786 Euismod Ctra.",10,"88-53-38-86-55","01:58:58","03:21:35","2020-02-20 01:19:22","2020-01-10 23:53:10",1,"urna. Nullam lobortis quam a"),(11,"1829 Egestas Avenida",11,"74-58-59-66-17","17:00:55","16:58:18","2019-08-31 07:33:16","2019-08-15 14:31:31",1,"a felis ullamcorper viverra. Maecenas iaculis"),(12,"Apdo.:250-5998 Dolor. Avda.",12,"26-70-68-44-53","22:21:38","00:40:46","2019-08-07 15:53:41","2020-03-07 08:08:43",1,"non sapien molestie orci"),(13,"Apartado núm.: 674, 8337 Aliquam Avda.",13,"49-33-71-59-34","19:34:13","06:38:01","2019-01-19 13:01:09","2018-11-17 22:56:10",1,"mollis. Duis"),(14,"Apdo.:611-139 Curabitur Avda.",14,"43-00-44-12-12","10:52:20","10:29:06","2019-08-25 07:16:17","2019-02-01 22:25:43",0,"In tincidunt congue turpis."),(15,"845-5213 Egestas Calle",15,"51-89-03-73-70","07:06:05","23:20:13","2019-09-02 17:46:37","2019-08-24 23:50:36",0,"ac tellus.");


CREATE TABLE IF NOT EXISTS sales(
  `sale`  INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `coffee_shop` INT UNSIGNED NOT NULL,
  `service` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  FOREIGN KEY (service) REFERENCES services(service),
  FOREIGN KEY (coffee_shop) REFERENCES coffee_shops(coffee_shop)
)CHARSET=utf8mb4;

INSERT INTO `sales` (`sale`,`coffee_shop`,`service`,`created_at`,`update_at`,`active`) VALUES (1,1,1,"2020-09-02 22:08:17","2019-10-07 00:10:04",1),(2,2,2,"2019-04-03 15:42:00","2020-04-20 19:17:23",1),(3,3,3,"2019-12-06 05:09:06","2020-01-26 03:21:47",0),(4,4,4,"2020-01-13 13:40:30","2019-09-03 05:44:36",0),(5,5,5,"2020-01-29 01:23:03","2019-06-07 19:06:48",1),(6,6,6,"2020-04-15 01:19:11","2020-08-02 23:12:47",0),(7,7,7,"2018-10-31 15:58:35","2019-02-07 00:54:03",1),(8,8,8,"2020-02-06 06:12:16","2020-01-27 07:51:00",1),(9,9,9,"2018-10-25 19:02:03","2020-01-05 08:26:06",0),(10,10,10,"2020-03-23 15:35:27","2019-04-15 23:30:34",0),(11,11,11,"2020-07-04 13:22:16","2019-06-06 09:21:49",0),(12,12,12,"2018-11-30 15:58:53","2019-12-22 22:09:12",0),(13,13,13,"2019-12-16 01:53:31","2020-05-24 13:15:51",1),(14,14,14,"2019-11-18 07:49:19","2019-05-07 10:10:23",0),(15,15,15,"2020-04-17 10:13:56","2019-03-02 03:28:35",1);
INSERT INTO `sales` VALUES (16,8,8,"2020-10-04 11:23:26","2019-01-08 18:56:25",0),(17,10,6,"2020-02-13 23:07:15","2020-04-10 02:19:53",1),(18,14,12,"2020-05-30 18:31:14","2020-08-03 03:35:52",0),(19,2,5,"2018-11-19 19:10:02","2020-03-01 22:06:04",1),(20,2,1,"2019-05-28 14:24:26","2020-03-04 20:48:03",0),(21,11,5,"2019-09-22 15:05:25","2020-06-26 01:08:42",0),(22,2,7,"2019-08-11 13:52:34","2020-08-02 10:10:12",0),(23,12,2,"2020-03-09 22:57:45","2019-10-30 02:22:14",0),(24,2,3,"2019-01-10 12:59:45","2020-09-16 20:48:36",1),(25,7,13,"2020-02-15 08:25:15","2019-11-07 10:16:11",1),(26,11,13,"2019-09-17 00:03:45","2018-12-14 10:31:02",1),(27,10,10,"2019-01-02 23:58:13","2019-08-13 20:16:24",0),(28,3,13,"2019-12-07 21:16:51","2019-10-08 18:58:54",0),(29,7,8,"2019-05-09 07:14:02","2019-05-05 20:37:02",0),(30,13,15,"2019-09-29 22:05:38","2018-11-01 12:17:39",1),(31,4,14,"2020-08-15 09:47:44","2019-06-27 15:53:35",1);
INSERT INTO `sales` VALUES (32,8,8,"2020-10-04 11:23:26","2019-01-08 18:56:25",0);

CREATE TABLE IF NOT EXISTS `likes` (
  `like` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `coffee_shop` INT UNSIGNED NOT NULL,
  `user` INT UNSIGNED NOT NULL,
  FOREIGN KEY (coffee_shop) REFERENCES coffee_shops(coffee_shop),
  FOREIGN KEY (`user`) REFERENCES users(`user`)
)CHARSET=utf8mb4;

INSERT INTO `likes` (`like`,`coffee_shop`,`user`) VALUES (1,"11","13"),(2,"15","10"),(3,"5","15"),(4,"8","11"),(5,"15","2"),(6,"14","2"),(7,"8","13"),(8,"5","5"),(9,"9","10"),(10,"11","12"),(11,"2","2"),(12,"11","11"),(13,"14","9"),(14,"12","15"),(15,"14","2");

SELECT coffee_shops.coffee_shop `Tienda`,COUNT(coffee_shops.coffee_shop) AS Ventas from coffee_shops
inner join sales on coffee_shops.coffee_shop = sales.coffee_shop
GROUP BY coffee_shops.coffee_shop
ORDER BY Ventas DESC;
#Tienda de ventas aun que esten canseladas

SELECT coffee_shops.coffee_shop `Tienda`,COUNT(coffee_shops.coffee_shop) AS Ventas from coffee_shops
inner join sales on coffee_shops.coffee_shop = sales.coffee_shop
WHERE sales.active = 1
GROUP BY coffee_shops.coffee_shop
ORDER BY Ventas DESC;
#Tienda con mas ventas solo activas

SELECT coffee_shops.coffee_shop `Tienda`,COUNT(coffee_shops.coffee_shop) AS Ventas from coffee_shops
inner join sales on coffee_shops.coffee_shop = sales.coffee_shop
WHERE sales.active = 0
GROUP BY coffee_shops.coffee_shop
ORDER BY Ventas DESC;
#Tienda con mas ventas canseladas

SELECT coffee_shops.coffee_shop `Tienda`,COUNT(coffee_shops.coffee_shop) AS Ventas from coffee_shops
inner join sales on coffee_shops.coffee_shop = sales.coffee_shop
WHERE sales.active = 1
GROUP BY coffee_shops.coffee_shop
ORDER BY coffee_shops.coffee_shop;
#Tienda y sus ventas(Activas)

SELECT services.service `Producto`,product `Producto`, COUNT(services.service) AS `vendido` from services
inner join sales on services.service = sales.service
GROUP BY services.service
ORDER BY `vendido` DESC;
#Producto vendidos

SELECT services.service `Producto`,product `Producto`, COUNT(services.service) AS `vendido` from services
inner join sales on services.service = sales.service
WHERE sales.active = 1
GROUP BY services.service
ORDER BY `vendido` DESC;
#Productos vendidos activos

SELECT services.service `Producto`,product `Producto`, COUNT(services.service) AS `vendido` from services
inner join sales on services.service = sales.service
WHERE sales.active = 0
GROUP BY services.service
ORDER BY `vendido` DESC;
#Producto que mas se cansela la venta


SELECT coffee_shops.coffee_shop `Tienda`, COUNT(coffee_shops.coffee_shop) AS `Gustos` from coffee_shops
inner join likes on likes.coffee_shop = coffee_shops.coffee_shop
GROUP BY coffee_shops.coffee_shop
ORDER BY `Gustos` DESC;
#La tienda que mas le guta a la gente 

