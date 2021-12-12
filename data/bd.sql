CREATE DATABASE luanaCake;

USE luanaCake;

CREATE TABLE `categories` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `products` (
    `id` INT AUTO_INCREMENT,
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

insert into categories (id, name) values (1, 'Tortas');
insert into categories (id, name) values (2, 'Cookie');
insert into categories (id, name) values (3, 'Postres');

insert into flavors (id, name) values (1, 'Vainilla');
insert into flavors (id, name) values (2, 'Chocolate');
insert into flavors (id, name) values (3, 'Frutilla');
insert into flavors (id, name) values (4, 'Dulce de leche');
insert into flavors (id, name) values (5, 'Limon');

insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (1, 1, 5, 'Dodge', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 72, 541.49, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (2, 2, 2, 'Dodge', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 49, 504.65, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (3, 3, 1, 'Mercury', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 97, 507.04, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (4, 3, 5, 'Chrysler', 'Nunc rhoncus dui vel sem. Sed sagittis.', 96, 371.63, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (5, 3, 1, 'Subaru', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 37, 336.19, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (6, 2, 1, 'Mitsubishi', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 85, 223.44, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (7, 2, 4, 'Isuzu', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 3, 335.46, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (8, 3, 3, 'Chevrolet', 'Morbi ut odio.', 97, 606.19, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (9, 3, 2, 'Mitsubishi', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 40, 425.81, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (10, 3, 1, 'Honda', 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 39, 324.66, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (11, 1, 1, 'Ford', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 42, 214.0, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (12, 2, 2, 'Toyota', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 25, 412.24, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (13, 3, 2, 'Subaru', 'Cras non velit nec nisi vulputate nonummy.', 54, 701.59, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (14, 2, 1, 'Toyota', 'Nullam varius.', 10, 503.79, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (15, 2, 4, 'Pontiac', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 60, 165.41, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (16, 1, 5, 'Volkswagen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 63, 264.69, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (17, 3, 1, 'GMC', 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 35, 719.57, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (18, 3, 4, 'Hyundai', 'Pellentesque ultrices mattis odio.', 68, 532.42, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (19, 3, 4, 'Mitsubishi', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 27, 507.34, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (20, 2, 5, 'Dodge', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 100, 607.81, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (21, 1, 1, 'Mercedes-Benz', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 57, 797.28, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (22, 1, 1, 'Lexus', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 71, 187.0, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (23, 1, 1, 'Mercedes-Benz', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 98, 213.95, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (24, 1, 5, 'Mercury', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2, 723.41, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (25, 2, 2, 'Cadillac', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 18, 677.34, true);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (26, 3, 3, 'Toyota', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 86, 80.01, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (27, 3, 4, 'Ford', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 38, 387.46, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (28, 1, 2, 'Mercury', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 48, 229.16, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (29, 1, 2, 'Ford', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 50, 610.5, false);
insert into products (id, category_id, flavor_id, name, description, stock, price, status) values (30, 3, 5, 'Mitsubishi', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 8, 252.01, true);

insert into users (id, email, password, admin) values (1, 'uminero0@icio.us', '5FghH2Vvn5', false);
insert into users (id, email, password, admin) values (2, 'kglader1@china.com.cn', 'NwIK8lwX7qdl', true);
insert into users (id, email, password, admin) values (3, 'mgoligher2@domainmarket.com', 'pcsXQ2UkPu', true);
insert into users (id, email, password, admin) values (4, 'cruvel3@chicagotribune.com', 'T8Bc6eg', true);
insert into users (id, email, password, admin) values (5, 'rsuarez4@answers.com', 'hq4c8sRcGhcn', false);
insert into users (id, email, password, admin) values (6, 'awoodyer5@simplemachines.org', 'N6YQK3', false);
insert into users (id, email, password, admin) values (7, 'ckilian6@usatoday.com', 'DJKH7JgGcvEO', false);
insert into users (id, email, password, admin) values (8, 'dvasilchikov7@marketwatch.com', 'nijjSh', true);
insert into users (id, email, password, admin) values (9, 'rgoodlud8@aol.com', 'RvpMpJ9', false);
insert into users (id, email, password, admin) values (10, 'swarren9@cisco.com', 'BjGF2EnsO', true);
insert into users (id, email, password, admin) values (11, 'dtogwella@slideshare.net', 'Uq2YRsSKI', false);
insert into users (id, email, password, admin) values (12, 'cfilewoodb@ed.gov', 'qr1EZgzc', false);
insert into users (id, email, password, admin) values (13, 'mgreenlyc@mapy.cz', 'Tg0TGp43', false);
insert into users (id, email, password, admin) values (14, 'acarland@technorati.com', 'OwR1uRWdKm3', true);
insert into users (id, email, password, admin) values (15, 'aconachiee@mac.com', 'l0ahx0Mr', false);
insert into users (id, email, password, admin) values (16, 'bkaganf@fc2.com', 'GnFzd3ZYHfM', false);
insert into users (id, email, password, admin) values (17, 'fmairg@prnewswire.com', 'TG1di1R', true);
insert into users (id, email, password, admin) values (18, 'gbushellh@berkeley.edu', 'CgAqcuDg', true);
insert into users (id, email, password, admin) values (19, 'cabbotsi@mediafire.com', 'ufWs6PC', true);
insert into users (id, email, password, admin) values (20, 'eroantreej@behance.net', 'uQixgs18', false);

insert into sales (id, user_id, total, created_at, updated_at) values (1, 11, 5551.6, '8/1/2021', '1/9/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (2, 16, 2094.23, '2/10/2021', '7/31/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (3, 7, 4181.89, '12/5/2020', '10/10/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (4, 16, 8915.47, '3/20/2021', '5/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (5, 19, 3447.74, '3/30/2021', '3/5/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (6, 16, 3662.48, '4/12/2021', '8/20/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (7, 5, 9636.31, '2/3/2021', '4/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (8, 11, 5416.65, '2/2/2021', '6/18/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (9, 13, 4961.42, '5/4/2021', '5/5/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (10, 9, 6761.37, '6/3/2021', '4/4/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (11, 20, 2667.24, '6/26/2021', '6/27/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (12, 16, 549.51, '1/8/2021', '10/5/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (13, 9, 7949.38, '12/8/2020', '11/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (14, 5, 5915.84, '3/3/2021', '6/11/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (15, 15, 6072.62, '2/27/2021', '11/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (16, 12, 6442.87, '6/27/2021', '8/19/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (17, 3, 4763.8, '12/15/2020', '1/2/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (18, 7, 1764.09, '4/11/2021', '6/20/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (19, 3, 6624.81, '1/13/2021', '8/27/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (20, 15, 4580.75, '7/30/2021', '9/9/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (21, 16, 5312.28, '10/6/2021', '12/19/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (22, 17, 5861.17, '12/20/2020', '5/15/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (23, 6, 2708.56, '2/15/2021', '12/26/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (24, 6, 2142.01, '2/25/2021', '3/22/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (25, 3, 5617.33, '4/6/2021', '1/15/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (26, 3, 456.12, '5/14/2021', '5/9/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (27, 17, 6158.59, '9/7/2021', '9/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (28, 9, 1211.95, '5/11/2021', '1/18/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (29, 14, 9025.66, '8/21/2021', '12/1/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (30, 3, 7613.59, '3/2/2021', '5/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (31, 6, 8542.33, '12/5/2020', '11/25/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (32, 8, 6856.96, '1/26/2021', '2/27/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (33, 13, 8101.44, '5/24/2021', '9/18/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (34, 18, 498.33, '8/22/2021', '4/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (35, 18, 9517.41, '11/9/2021', '5/1/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (36, 18, 4715.45, '5/29/2021', '7/22/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (37, 16, 7265.24, '10/28/2021', '12/7/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (38, 1, 8666.26, '6/24/2021', '10/21/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (39, 7, 9620.44, '1/25/2021', '4/7/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (40, 2, 9520.35, '1/31/2021', '2/8/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (41, 19, 5298.56, '11/18/2021', '7/7/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (42, 9, 756.55, '4/5/2021', '10/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (43, 19, 2495.66, '2/1/2021', '10/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (44, 15, 4600.95, '1/10/2021', '1/27/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (45, 1, 663.88, '2/18/2021', '4/7/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (46, 19, 5431.66, '6/12/2021', '3/12/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (47, 15, 7609.6, '4/23/2021', '12/5/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (48, 14, 8721.48, '10/24/2021', '6/12/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (49, 19, 3783.61, '9/25/2021', '1/26/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (50, 1, 4905.81, '7/31/2021', '10/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (51, 13, 9050.69, '10/11/2021', '6/19/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (52, 5, 6630.15, '12/11/2020', '2/28/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (53, 4, 5380.67, '9/5/2021', '7/24/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (54, 11, 4519.46, '9/18/2021', '8/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (55, 10, 6835.75, '9/12/2021', '7/13/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (56, 19, 3084.45, '11/26/2020', '3/9/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (57, 2, 8282.74, '5/11/2021', '10/19/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (58, 8, 4576.26, '6/30/2021', '4/15/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (59, 5, 8538.74, '4/26/2021', '5/25/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (60, 4, 1665.41, '2/8/2021', '4/24/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (61, 4, 5480.5, '8/31/2021', '3/1/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (62, 6, 4403.91, '7/7/2021', '9/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (63, 3, 8741.15, '2/1/2021', '5/18/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (64, 5, 5782.42, '11/3/2021', '1/1/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (65, 8, 6337.46, '4/5/2021', '5/27/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (66, 14, 939.56, '9/19/2021', '1/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (67, 16, 8201.05, '7/31/2021', '8/18/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (68, 15, 895.94, '5/16/2021', '3/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (69, 15, 8486.92, '11/5/2021', '7/12/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (70, 18, 8775.67, '5/9/2021', '8/11/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (71, 9, 1597.03, '8/30/2021', '9/7/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (72, 10, 4191.85, '1/28/2021', '9/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (73, 13, 4431.77, '7/9/2021', '10/17/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (74, 12, 3235.66, '1/18/2021', '4/26/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (75, 20, 233.41, '8/16/2021', '7/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (76, 6, 8266.0, '3/29/2021', '11/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (77, 12, 5411.42, '8/8/2021', '10/23/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (78, 10, 3343.11, '3/11/2021', '7/1/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (79, 9, 891.55, '2/17/2021', '4/19/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (80, 4, 9648.77, '5/21/2021', '5/22/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (81, 7, 195.33, '1/11/2021', '7/29/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (82, 8, 7991.63, '8/5/2021', '8/28/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (83, 1, 9546.79, '5/29/2021', '7/13/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (84, 16, 2314.15, '7/19/2021', '10/30/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (85, 4, 1016.42, '9/24/2021', '8/9/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (86, 2, 576.72, '8/6/2021', '8/26/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (87, 9, 80.68, '3/17/2021', '12/1/2020');
insert into sales (id, user_id, total, created_at, updated_at) values (88, 4, 1710.07, '8/4/2021', '8/5/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (89, 5, 6581.82, '4/15/2021', '1/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (90, 3, 1486.31, '5/18/2021', '4/1/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (91, 19, 1964.09, '8/19/2021', '8/6/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (92, 18, 1417.23, '7/24/2021', '4/27/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (93, 4, 2449.76, '3/3/2021', '1/5/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (94, 1, 5222.93, '4/30/2021', '8/4/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (95, 3, 285.14, '1/3/2021', '8/24/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (96, 7, 5055.17, '3/16/2021', '7/22/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (97, 14, 1275.28, '12/5/2020', '5/16/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (98, 7, 6973.73, '1/27/2021', '7/7/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (99, 13, 4849.37, '12/4/2020', '2/18/2021');
insert into sales (id, user_id, total, created_at, updated_at) values (100, 3, 2723.37, '9/5/2021', '11/1/2021');

insert into product_sale (id, product_id, sale_id) values (1, 25, 86.06);
insert into product_sale (id, product_id, sale_id) values (2, 3, 94.32);
insert into product_sale (id, product_id, sale_id) values (3, 1, 86.86);
insert into product_sale (id, product_id, sale_id) values (4, 28, 82.25);
insert into product_sale (id, product_id, sale_id) values (5, 14, 99.08);
insert into product_sale (id, product_id, sale_id) values (6, 14, 86.05);
insert into product_sale (id, product_id, sale_id) values (7, 17, 95.8);
insert into product_sale (id, product_id, sale_id) values (8, 1, 88.45);
insert into product_sale (id, product_id, sale_id) values (9, 3, 84.5);
insert into product_sale (id, product_id, sale_id) values (10, 22, 92.54);
insert into product_sale (id, product_id, sale_id) values (11, 1, 95.88);
insert into product_sale (id, product_id, sale_id) values (12, 12, 82.39);
insert into product_sale (id, product_id, sale_id) values (13, 27, 80.64);
insert into product_sale (id, product_id, sale_id) values (14, 6, 84.38);
insert into product_sale (id, product_id, sale_id) values (15, 27, 85.28);
insert into product_sale (id, product_id, sale_id) values (16, 6, 88.41);
insert into product_sale (id, product_id, sale_id) values (17, 22, 92.67);
insert into product_sale (id, product_id, sale_id) values (18, 22, 92.07);
insert into product_sale (id, product_id, sale_id) values (19, 21, 82.62);
insert into product_sale (id, product_id, sale_id) values (20, 2, 88.7);
insert into product_sale (id, product_id, sale_id) values (21, 20, 81.83);
insert into product_sale (id, product_id, sale_id) values (22, 7, 92.11);
insert into product_sale (id, product_id, sale_id) values (23, 6, 81.62);
insert into product_sale (id, product_id, sale_id) values (24, 14, 98.4);
insert into product_sale (id, product_id, sale_id) values (25, 1, 91.0);
insert into product_sale (id, product_id, sale_id) values (26, 21, 81.21);
insert into product_sale (id, product_id, sale_id) values (27, 3, 93.01);
insert into product_sale (id, product_id, sale_id) values (28, 1, 94.59);
insert into product_sale (id, product_id, sale_id) values (29, 5, 99.05);
insert into product_sale (id, product_id, sale_id) values (30, 2, 93.08);
insert into product_sale (id, product_id, sale_id) values (31, 15, 84.79);
insert into product_sale (id, product_id, sale_id) values (32, 8, 98.38);
insert into product_sale (id, product_id, sale_id) values (33, 13, 94.53);
insert into product_sale (id, product_id, sale_id) values (34, 25, 90.63);
insert into product_sale (id, product_id, sale_id) values (35, 2, 85.77);
insert into product_sale (id, product_id, sale_id) values (36, 17, 95.76);
insert into product_sale (id, product_id, sale_id) values (37, 29, 85.01);
insert into product_sale (id, product_id, sale_id) values (38, 16, 83.62);
insert into product_sale (id, product_id, sale_id) values (39, 25, 80.86);
insert into product_sale (id, product_id, sale_id) values (40, 19, 88.3);
insert into product_sale (id, product_id, sale_id) values (41, 5, 99.25);
insert into product_sale (id, product_id, sale_id) values (42, 16, 80.7);
insert into product_sale (id, product_id, sale_id) values (43, 27, 93.88);
insert into product_sale (id, product_id, sale_id) values (44, 25, 97.19);
insert into product_sale (id, product_id, sale_id) values (45, 20, 84.07);
insert into product_sale (id, product_id, sale_id) values (46, 23, 90.64);
insert into product_sale (id, product_id, sale_id) values (47, 7, 95.71);
insert into product_sale (id, product_id, sale_id) values (48, 2, 84.8);
insert into product_sale (id, product_id, sale_id) values (49, 2, 95.11);
insert into product_sale (id, product_id, sale_id) values (50, 22, 87.06);
insert into product_sale (id, product_id, sale_id) values (51, 26, 91.23);
insert into product_sale (id, product_id, sale_id) values (52, 19, 92.94);
insert into product_sale (id, product_id, sale_id) values (53, 28, 90.05);
insert into product_sale (id, product_id, sale_id) values (54, 22, 86.06);
insert into product_sale (id, product_id, sale_id) values (55, 4, 92.65);
insert into product_sale (id, product_id, sale_id) values (56, 25, 84.26);
insert into product_sale (id, product_id, sale_id) values (57, 12, 99.06);
insert into product_sale (id, product_id, sale_id) values (58, 7, 89.5);
insert into product_sale (id, product_id, sale_id) values (59, 10, 89.31);
insert into product_sale (id, product_id, sale_id) values (60, 14, 85.33);
insert into product_sale (id, product_id, sale_id) values (61, 16, 96.57);
insert into product_sale (id, product_id, sale_id) values (62, 27, 83.66);
insert into product_sale (id, product_id, sale_id) values (63, 6, 98.85);
insert into product_sale (id, product_id, sale_id) values (64, 2, 95.39);
insert into product_sale (id, product_id, sale_id) values (65, 30, 82.64);
insert into product_sale (id, product_id, sale_id) values (66, 13, 98.02);
insert into product_sale (id, product_id, sale_id) values (67, 2, 89.61);
insert into product_sale (id, product_id, sale_id) values (68, 10, 82.63);
insert into product_sale (id, product_id, sale_id) values (69, 2, 99.23);
insert into product_sale (id, product_id, sale_id) values (70, 5, 92.8);
insert into product_sale (id, product_id, sale_id) values (71, 29, 87.93);
insert into product_sale (id, product_id, sale_id) values (72, 26, 80.07);
insert into product_sale (id, product_id, sale_id) values (73, 16, 98.79);
insert into product_sale (id, product_id, sale_id) values (74, 9, 97.58);
insert into product_sale (id, product_id, sale_id) values (75, 10, 94.34);
insert into product_sale (id, product_id, sale_id) values (76, 21, 87.24);
insert into product_sale (id, product_id, sale_id) values (77, 12, 99.29);
insert into product_sale (id, product_id, sale_id) values (78, 27, 91.17);
insert into product_sale (id, product_id, sale_id) values (79, 11, 87.29);
insert into product_sale (id, product_id, sale_id) values (80, 8, 97.44);
insert into product_sale (id, product_id, sale_id) values (81, 16, 99.43);
insert into product_sale (id, product_id, sale_id) values (82, 26, 98.08);
insert into product_sale (id, product_id, sale_id) values (83, 25, 83.37);
insert into product_sale (id, product_id, sale_id) values (84, 20, 85.11);
insert into product_sale (id, product_id, sale_id) values (85, 17, 81.96);
insert into product_sale (id, product_id, sale_id) values (86, 15, 97.87);
insert into product_sale (id, product_id, sale_id) values (87, 29, 96.02);
insert into product_sale (id, product_id, sale_id) values (88, 29, 80.76);
insert into product_sale (id, product_id, sale_id) values (89, 10, 84.88);
insert into product_sale (id, product_id, sale_id) values (90, 2, 96.69);
insert into product_sale (id, product_id, sale_id) values (91, 10, 93.4);
insert into product_sale (id, product_id, sale_id) values (92, 22, 93.41);
insert into product_sale (id, product_id, sale_id) values (93, 11, 83.94);
insert into product_sale (id, product_id, sale_id) values (94, 5, 94.86);
insert into product_sale (id, product_id, sale_id) values (95, 27, 93.21);
insert into product_sale (id, product_id, sale_id) values (96, 28, 89.1);
insert into product_sale (id, product_id, sale_id) values (97, 23, 82.56);
insert into product_sale (id, product_id, sale_id) values (98, 22, 84.03);
insert into product_sale (id, product_id, sale_id) values (99, 17, 81.88);
insert into product_sale (id, product_id, sale_id) values (100, 19, 92.52);

insert into images (id, product_id, url) values (1, 30, 'https://robohash.org/abenimiusto.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (2, 20, 'https://robohash.org/enimperspiciatisadipisci.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (3, 29, 'https://robohash.org/sapientequasiqui.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (4, 28, 'https://robohash.org/estitaquedolorem.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (5, 1, 'https://robohash.org/doloresutdolorem.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (6, 14, 'https://robohash.org/harumvoluptatesmagnam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (7, 12, 'https://robohash.org/quiaofficiisconsequatur.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (8, 6, 'https://robohash.org/voluptatemrepellatdebitis.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (9, 16, 'https://robohash.org/blanditiisconsequaturtempore.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (10, 2, 'https://robohash.org/minimaprovidentconsectetur.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (11, 3, 'https://robohash.org/liberodoloremquidem.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (12, 24, 'https://robohash.org/atquelaboriosamea.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (13, 7, 'https://robohash.org/etliberoquam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (14, 6, 'https://robohash.org/atquedoloremquebeatae.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (15, 11, 'https://robohash.org/suntmagninon.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (16, 13, 'https://robohash.org/aliquamatquelaboriosam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (17, 19, 'https://robohash.org/omnisplaceatquam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (18, 24, 'https://robohash.org/quidemmodireiciendis.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (19, 20, 'https://robohash.org/temporibusipsumodio.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (20, 12, 'https://robohash.org/nonaut.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (21, 16, 'https://robohash.org/itaquevoluptasvoluptatibus.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (22, 24, 'https://robohash.org/etipsumad.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (23, 13, 'https://robohash.org/blanditiisremut.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (24, 8, 'https://robohash.org/repellatvoluptatumet.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (25, 3, 'https://robohash.org/remillofacilis.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (26, 6, 'https://robohash.org/estearumest.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (27, 11, 'https://robohash.org/vitaeutquas.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (28, 24, 'https://robohash.org/veletsoluta.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (29, 8, 'https://robohash.org/necessitatibusrerumalias.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (30, 19, 'https://robohash.org/distinctioblanditiismolestiae.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (31, 24, 'https://robohash.org/maximeestquis.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (32, 15, 'https://robohash.org/doloreserroraperiam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (33, 4, 'https://robohash.org/solutaabmaxime.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (34, 27, 'https://robohash.org/animirerumsequi.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (35, 25, 'https://robohash.org/nesciuntfacilisharum.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (36, 13, 'https://robohash.org/quasdolorqui.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (37, 22, 'https://robohash.org/quiavoluptasvoluptatem.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (38, 9, 'https://robohash.org/etdeseruntcorrupti.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (39, 9, 'https://robohash.org/evenietfugitconsequuntur.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (40, 28, 'https://robohash.org/providentetsed.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (41, 22, 'https://robohash.org/temporibussedvoluptatibus.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (42, 18, 'https://robohash.org/rationeassumendaaperiam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (43, 30, 'https://robohash.org/magnamnostrumdolore.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (44, 22, 'https://robohash.org/quodveroexercitationem.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (45, 17, 'https://robohash.org/atvelquae.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (46, 27, 'https://robohash.org/nostrumdoloremsaepe.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (47, 24, 'https://robohash.org/reiciendiserroret.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (48, 6, 'https://robohash.org/repellatquibusdamfugit.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (49, 7, 'https://robohash.org/quibusdamautvitae.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (50, 26, 'https://robohash.org/suntutdignissimos.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (51, 19, 'https://robohash.org/quieiusqui.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (52, 3, 'https://robohash.org/voluptatemitaquedolorem.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (53, 8, 'https://robohash.org/commodilaboreet.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (54, 29, 'https://robohash.org/sitfacilisveniam.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (55, 25, 'https://robohash.org/similiqueinciduntadipisci.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (56, 7, 'https://robohash.org/sintipsumassumenda.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (57, 12, 'https://robohash.org/eligendilaudantiumadipisci.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (58, 28, 'https://robohash.org/atquedolorererum.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (59, 13, 'https://robohash.org/dolorexplicabotempore.png?size=50x50&set=set1');
insert into images (id, product_id, url) values (60, 4, 'https://robohash.org/quieteaque.png?size=50x50&set=set1')