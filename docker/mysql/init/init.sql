CREATE DATABASE `test-db`;
USE `test-db`;

CREATE TABLE `counter` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `count` int NOT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `counter` VALUES (1,7);
