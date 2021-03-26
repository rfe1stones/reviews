-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'reviews'
--
-- ---
USE sdc;

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `rating` INT NULL,
  `date` VARCHAR(50) NULL,
  `summary` VARCHAR(150) NULL,
  `body` VARCHAR(500) NULL,
  `recommend` VARCHAR(10) NULL,
  `reported` VARCHAR(10) NULL,
  `reviewer_name` VARCHAR(50) NULL,
  `reviewer_email` VARCHAR(100) NULL,
  `response` VARCHAR(255) NULL,
  `helpfulness` INT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'reviews_photos'
--
-- ---

DROP TABLE IF EXISTS `reviews_photos`;

CREATE TABLE `reviews_photos` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `review_id` INTEGER NULL,
  `url` VARCHAR(225) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'characteristics'
--
-- ---

DROP TABLE IF EXISTS `characteristics`;

CREATE TABLE `characteristics` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `product_id` INTEGER NULL,
  `name` VARCHAR(40) NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'characteristic_reviews'
--
-- ---

DROP TABLE IF EXISTS `characteristic_reviews`;

CREATE TABLE `characteristic_reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `characteristic_id` INTEGER NULL,
  `review_id` INTEGER NULL,
  `value` INTEGER NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `reviews_photos` ADD FOREIGN KEY (review_id) REFERENCES `reviews` (`id`);
ALTER TABLE `characteristic_reviews` ADD FOREIGN KEY (characteristic_id) REFERENCES `characteristics` (`id`);
ALTER TABLE `characteristic_reviews` ADD FOREIGN KEY (review_id) REFERENCES `reviews` (`id`);

ALTER TABLE `characteristics` ADD INDEX (`id`);
ALTER TABLE `reviews` ADD INDEX (`product_id`);
ALTER TABLE `reviews_photos` ADD INDEX (`review_id`);
-- ---
-- Table Properties
-- ---

-- ALTER TABLE `reviews` ENGINE=InnoDL CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `reviews_photos` ENGINE=InnoDL CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `characteristics` ENGINE=InnoDL CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `characteristic_reviews` ENGINE=InnoDL CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `reviews` (`id`,`product_id`,`rating`,`date`,`summary`,`body`,`recommend`,`reported`,`reviewer_name`,`reviewer_email`,`response`,`helpfulness`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `reviews_photos` (`id`,`review_id`,`url`) VALUES
-- ('','','');
-- INSERT INTO `characteristics` (`id`,`product_id`,`name`) VALUES
-- ('','','');
-- INSERT INTO `characteristic_reviews` (`id`,`charcteristic_id`,`review_id`,`value`) VALUES
-- ('','','','');