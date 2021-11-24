CREATE DATABASE luanaCake;

USE luanaCake;

CREATE TABLE `categories` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
    `id` INT,
    `category_id` INT,
    `flavor_id` INT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `stock` INT NOT NULL,
    `price` FLOAT NOT NULL,
    `status` TINYINT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `flavors` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `admin` TINYINT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `profiles` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT,
    `name` VARCHAR(100),
    `lastname` VARCHAR(100),
    `phone` VARCHAR(100),
    `facebook` VARCHAR(255),
    `twitter` VARCHAR(255),
    `instagram` VARCHAR(255),
    `image` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `product_sale` (
    `id` INT NOT NULL,
    `product_id` INT,
    `sale_id` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `sales` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `total` FLOAT NOT NULL,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
);

CREATE TABLE `company` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(255),
    `cuit` VARCHAR(255),
    `email` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `images` (
    `id` INT AUTO_INCREMENT,
    `product_id` INT NOT NULL,
    `url` VARCHAR(255),
    PRIMARY KEY (`id`)
);

ALTER TABLE
    `products`
ADD
    CONSTRAINT `FK_64b604e1-d03a-4015-9c76-d465ed791884` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `products`
ADD
    CONSTRAINT `FK_d099272a-94cb-45a0-9123-dffe1d2cb438` FOREIGN KEY (`flavor_id`) REFERENCES `flavors`(`id`) ON DELETE
SET
    NULL ON UPDATE
SET
    NULL;

ALTER TABLE
    `profiles`
ADD
    CONSTRAINT `FK_938139e6-c9f9-46a7-9a42-93d5607bbe91` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `product_sale`
ADD
    CONSTRAINT `FK_1bd3ca30-9b5c-4108-aabc-da3c4b19a8c5` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `product_sale`
ADD
    CONSTRAINT `FK_03885168-bcd9-4813-9b43-175c0e4bec04` FOREIGN KEY (`sale_id`) REFERENCES `sales`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `sales`
ADD
    CONSTRAINT `FK_51709938-45de-4455-88ea-469b021eac1f` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    `images`
ADD
    CONSTRAINT `FK_ef05006e-3501-463d-bfd1-70931406daae` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;