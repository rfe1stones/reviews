-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'reviews'
--
-- ---

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `product_id` INTEGER NULL DEFAULT NULL,
  `rating` VARCHAR NULL DEFAULT NULL,
  `date` VARCHAR NULL DEFAULT NULL,
  `summary` TINYINT NULL DEFAULT NULL,
  `body` VARCHAR NULL DEFAULT NULL,
  `recommend` VARCHAR NULL DEFAULT NULL,
  `reported` INTEGER NULL DEFAULT NULL,
  `reviewer_name` INTEGER NULL DEFAULT NULL,
  `reviewer_email` INTEGER NULL DEFAULT NULL,
  `response` INTEGER NULL DEFAULT NULL,
  `helpfulness` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'reviews_photos'
--
-- ---

DROP TABLE IF EXISTS `reviews_photos`;

CREATE TABLE `reviews_photos` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `review_id` INTEGER NULL DEFAULT NULL,
  `url` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'characteristics'
--
-- ---

DROP TABLE IF EXISTS `characteristics`;

CREATE TABLE `characteristics` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `product_id` INTEGER NULL DEFAULT NULL,
  `name` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'characteristic_reviews'
--
-- ---

DROP TABLE IF EXISTS `characteristic_reviews`;

CREATE TABLE `characteristic_reviews` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `characteristic_id` INTEGER NULL DEFAULT NULL,
  `review_id` INTEGER NULL DEFAULT NULL,
  `value` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `reviews_photos` ADD FOREIGN KEY (review_id) REFERENCES `reviews` (`id`);
ALTER TABLE `characteristic_reviews` ADD FOREIGN KEY (characteristic_id) REFERENCES `characteristics` (`id`);
ALTER TABLE `characteristic_reviews` ADD FOREIGN KEY (review_id) REFERENCES `reviews` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `reviews` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `reviews_photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `characteristics` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `characteristic_reviews` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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