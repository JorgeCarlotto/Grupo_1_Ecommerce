-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-01-2022 a las 18:17:21
-- Versión del servidor: 8.0.25
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `luanaCake`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Tortas'),
(2, 'Cookie'),
(3, 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `name`, `phone`, `cuit`, `email`) VALUES
(1, 'LuanaCakes', '2995099607', '20364353473', 'contacto@luanacake.com.ar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flavors`
--

CREATE TABLE `flavors` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `flavors`
--

INSERT INTO `flavors` (`id`, `name`) VALUES
(1, 'Vainilla'),
(2, 'Chocolate'),
(3, 'Frutillas'),
(4, 'Dulce de leche'),
(5, 'Limon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `product_id`, `url`) VALUES
(1, 30, 'https://robohash.org/abenimiusto.png?size=50x50&set=set1'),
(2, 20, 'https://robohash.org/enimperspiciatisadipisci.png?size=50x50&set=set1'),
(3, 29, 'https://robohash.org/sapientequasiqui.png?size=50x50&set=set1'),
(4, 28, 'https://robohash.org/estitaquedolorem.png?size=50x50&set=set1'),
(6, 14, 'https://robohash.org/harumvoluptatesmagnam.png?size=50x50&set=set1'),
(7, 12, 'https://robohash.org/quiaofficiisconsequatur.png?size=50x50&set=set1'),
(8, 6, 'https://robohash.org/voluptatemrepellatdebitis.png?size=50x50&set=set1'),
(9, 16, 'https://robohash.org/blanditiisconsequaturtempore.png?size=50x50&set=set1'),
(10, 2, 'https://robohash.org/minimaprovidentconsectetur.png?size=50x50&set=set1'),
(11, 3, 'https://robohash.org/liberodoloremquidem.png?size=50x50&set=set1'),
(12, 24, 'https://robohash.org/atquelaboriosamea.png?size=50x50&set=set1'),
(13, 7, 'https://robohash.org/etliberoquam.png?size=50x50&set=set1'),
(14, 6, 'https://robohash.org/atquedoloremquebeatae.png?size=50x50&set=set1'),
(15, 11, 'https://robohash.org/suntmagninon.png?size=50x50&set=set1'),
(16, 13, 'https://robohash.org/aliquamatquelaboriosam.png?size=50x50&set=set1'),
(17, 19, 'https://robohash.org/omnisplaceatquam.png?size=50x50&set=set1'),
(18, 24, 'https://robohash.org/quidemmodireiciendis.png?size=50x50&set=set1'),
(19, 20, 'https://robohash.org/temporibusipsumodio.png?size=50x50&set=set1'),
(20, 12, 'https://robohash.org/nonaut.png?size=50x50&set=set1'),
(21, 16, 'https://robohash.org/itaquevoluptasvoluptatibus.png?size=50x50&set=set1'),
(22, 24, 'https://robohash.org/etipsumad.png?size=50x50&set=set1'),
(23, 13, 'https://robohash.org/blanditiisremut.png?size=50x50&set=set1'),
(24, 8, 'https://robohash.org/repellatvoluptatumet.png?size=50x50&set=set1'),
(25, 3, 'https://robohash.org/remillofacilis.png?size=50x50&set=set1'),
(26, 6, 'https://robohash.org/estearumest.png?size=50x50&set=set1'),
(27, 11, 'https://robohash.org/vitaeutquas.png?size=50x50&set=set1'),
(28, 24, 'https://robohash.org/veletsoluta.png?size=50x50&set=set1'),
(29, 8, 'https://robohash.org/necessitatibusrerumalias.png?size=50x50&set=set1'),
(30, 19, 'https://robohash.org/distinctioblanditiismolestiae.png?size=50x50&set=set1'),
(31, 24, 'https://robohash.org/maximeestquis.png?size=50x50&set=set1'),
(32, 15, 'https://robohash.org/doloreserroraperiam.png?size=50x50&set=set1'),
(33, 4, 'https://robohash.org/solutaabmaxime.png?size=50x50&set=set1'),
(34, 27, 'https://robohash.org/animirerumsequi.png?size=50x50&set=set1'),
(35, 25, 'https://robohash.org/nesciuntfacilisharum.png?size=50x50&set=set1'),
(36, 13, 'https://robohash.org/quasdolorqui.png?size=50x50&set=set1'),
(37, 22, 'https://robohash.org/quiavoluptasvoluptatem.png?size=50x50&set=set1'),
(38, 9, 'https://robohash.org/etdeseruntcorrupti.png?size=50x50&set=set1'),
(39, 9, 'https://robohash.org/evenietfugitconsequuntur.png?size=50x50&set=set1'),
(40, 28, 'https://robohash.org/providentetsed.png?size=50x50&set=set1'),
(41, 22, 'https://robohash.org/temporibussedvoluptatibus.png?size=50x50&set=set1'),
(42, 18, 'https://robohash.org/rationeassumendaaperiam.png?size=50x50&set=set1'),
(43, 30, 'https://robohash.org/magnamnostrumdolore.png?size=50x50&set=set1'),
(44, 22, 'https://robohash.org/quodveroexercitationem.png?size=50x50&set=set1'),
(45, 17, 'https://robohash.org/atvelquae.png?size=50x50&set=set1'),
(46, 27, 'https://robohash.org/nostrumdoloremsaepe.png?size=50x50&set=set1'),
(47, 24, 'https://robohash.org/reiciendiserroret.png?size=50x50&set=set1'),
(48, 6, 'https://robohash.org/repellatquibusdamfugit.png?size=50x50&set=set1'),
(49, 7, 'https://robohash.org/quibusdamautvitae.png?size=50x50&set=set1'),
(50, 26, 'https://robohash.org/suntutdignissimos.png?size=50x50&set=set1'),
(51, 19, 'https://robohash.org/quieiusqui.png?size=50x50&set=set1'),
(52, 3, 'https://robohash.org/voluptatemitaquedolorem.png?size=50x50&set=set1'),
(53, 8, 'https://robohash.org/commodilaboreet.png?size=50x50&set=set1'),
(54, 29, 'https://robohash.org/sitfacilisveniam.png?size=50x50&set=set1'),
(55, 25, 'https://robohash.org/similiqueinciduntadipisci.png?size=50x50&set=set1'),
(56, 7, 'https://robohash.org/sintipsumassumenda.png?size=50x50&set=set1'),
(57, 12, 'https://robohash.org/eligendilaudantiumadipisci.png?size=50x50&set=set1'),
(58, 28, 'https://robohash.org/atquedolorererum.png?size=50x50&set=set1'),
(59, 13, 'https://robohash.org/dolorexplicabotempore.png?size=50x50&set=set1'),
(60, 4, 'https://robohash.org/quieteaque.png?size=50x50&set=set1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `flavor_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text,
  `stock` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category_id`, `flavor_id`, `name`, `description`, `stock`, `price`, `status`, `img`) VALUES
(2, 2, 2, '1', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 49, 504.65, 1, ''),
(3, 3, 1, 'Mercury', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 97, 507.04, 1, NULL),
(4, 3, 5, 'Chrysler', 'Nunc rhoncus dui vel sem. Sed sagittis.', 96, 371.63, 0, NULL),
(5, 3, 1, 'Subaru', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 37, 336.19, 0, NULL),
(6, 2, 1, 'Mitsubishi', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 85, 223.44, 1, NULL),
(7, 2, 1, 'Isuzu', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', 3, 335.46, 1, ''),
(8, 3, 3, 'Chevrolet', 'Morbi ut odio.', 97, 606.19, 1, NULL),
(9, 3, 2, 'Mitsubishi', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 40, 425.81, 0, NULL),
(10, 3, 1, 'Honda', 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 39, 324.66, 0, NULL),
(11, 1, 1, 'Ford', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 42, 214, 1, NULL),
(12, 2, 2, 'Toyota', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 25, 412.24, 1, NULL),
(13, 3, 2, 'Subaru', 'Cras non velit nec nisi vulputate nonummy.', 54, 701.59, 0, NULL),
(14, 2, 1, 'Toyota', 'Nullam varius.', 10, 503.79, 0, NULL),
(15, 2, 4, 'Pontiac', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 60, 165.41, 1, NULL),
(16, 1, 5, 'Volkswagen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 63, 264.69, 0, NULL),
(17, 3, 1, 'GMC', 'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 35, 719.57, 1, NULL),
(18, 3, 4, 'Hyundai', 'Pellentesque ultrices mattis odio.', 68, 532.42, 0, NULL),
(19, 3, 4, 'Mitsubishi', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 27, 507.34, 0, NULL),
(20, 2, 5, 'Dodge', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 100, 607.81, 1, NULL),
(21, 1, 1, 'Mercedes-Benz', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 57, 797.28, 1, NULL),
(22, 1, 1, 'Lexus', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 71, 187, 0, NULL),
(23, 1, 1, 'Mercedes-Benz', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 98, 213.95, 0, NULL),
(24, 1, 5, 'Mercury', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 2, 723.41, 0, NULL),
(25, 2, 2, 'Cadillac', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 18, 677.34, 1, NULL),
(26, 3, 3, 'Toyota', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 86, 80.01, 0, NULL),
(27, 3, 4, 'Ford', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 38, 387.46, 0, NULL),
(28, 1, 2, 'Mercury', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 48, 229.16, 0, NULL),
(29, 1, 2, 'Ford', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 50, 610.5, 0, NULL),
(30, 3, 5, 'Mitsubishi', 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 8, 252.01, 1, NULL),
(33, 1, 2, 'Producto 33', 'dakjjkadsjldajlkjdkajkldjklasjkldakldkajkdjlsa', 321321, 1312, NULL, ''),
(34, 1, 1, 'producto 1231', 'daljkadkjlasdjkllka', 32, 12312, 1, ''),
(35, 2, 2, 'sin stock', 'jkladjklakjldklsadas', 0, 231232, 0, ''),
(39, 1, 1, '32132', 'dsadsasa', 321, 231, 1, ''),
(40, 1, 1, 'dsadas', 'dsadk3lj892yhdsadas', 2, 2, 1, NULL),
(41, 1, 1, 'dsadsadedk32', 'csaclñjalkxasla', 2, 2, 1, NULL),
(42, 1, 1, 'dskabdjd', 'sadnkladsa', 2, 2, 1, NULL),
(43, 1, 3, 'cadads', 'dasdas', 2, 2, 1, NULL),
(44, 2, 2, 'Juancho', 'dasdasdas', 2, 2, 1, NULL),
(45, 1, 2, 'Juanchito', 'dad3deasdas', 2, 2, 1, 'product-default.png'),
(46, 1, 2, 'PRO IMG', 'DEASDAS', 2, 2, 1, 'product-1642356144277.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_sale`
--

CREATE TABLE `product_sale` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `sale_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `product_sale`
--

INSERT INTO `product_sale` (`id`, `product_id`, `sale_id`) VALUES
(1, 25, 86),
(2, 3, 94),
(4, 28, 82),
(5, 14, 99),
(6, 14, 86),
(7, 17, 96),
(9, 3, 85),
(10, 22, 93),
(12, 12, 82),
(13, 27, 81),
(15, 27, 85),
(16, 6, 88),
(17, 22, 93),
(18, 22, 92),
(19, 21, 83),
(20, 2, 89),
(21, 20, 82),
(22, 7, 92),
(23, 6, 82),
(24, 14, 98),
(26, 21, 81),
(27, 3, 93),
(29, 5, 99),
(30, 2, 93),
(31, 15, 85),
(32, 8, 98),
(33, 13, 95),
(34, 25, 91),
(35, 2, 86),
(36, 17, 96),
(37, 29, 85),
(39, 25, 81),
(40, 19, 88),
(41, 5, 99),
(42, 16, 81),
(43, 27, 94),
(44, 25, 97),
(46, 23, 91),
(47, 7, 96),
(48, 2, 85),
(49, 2, 95),
(50, 22, 87),
(51, 26, 91),
(52, 19, 93),
(53, 28, 90),
(54, 22, 86),
(55, 4, 93),
(57, 12, 99),
(58, 7, 90),
(59, 10, 89),
(60, 14, 85),
(61, 16, 97),
(63, 6, 99),
(64, 2, 95),
(65, 30, 83),
(66, 13, 98),
(67, 2, 90),
(68, 10, 83),
(69, 2, 99),
(70, 5, 93),
(71, 29, 88),
(72, 26, 80),
(73, 16, 99),
(74, 9, 98),
(75, 10, 94),
(76, 21, 87),
(77, 12, 99),
(78, 27, 91),
(79, 11, 87),
(80, 8, 97),
(81, 16, 99),
(82, 26, 98),
(83, 25, 83),
(84, 20, 85),
(85, 17, 82),
(86, 15, 98),
(87, 29, 96),
(88, 29, 81),
(89, 10, 85),
(90, 2, 97),
(91, 10, 93),
(92, 22, 93),
(94, 5, 95),
(95, 27, 93),
(96, 28, 89),
(97, 23, 83),
(99, 17, 82),
(100, 19, 93);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `total` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `total`, `created_at`, `updated_at`) VALUES
(1, 11, 5551.6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 7, 4181.89, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 19, 3447.74, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 5, 9636.31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 11, 5416.65, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 13, 4961.42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 9, 6761.37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 20, 2667.24, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 9, 7949.38, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 5, 5915.84, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 15, 6072.62, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 12, 6442.87, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 3, 4763.8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 7, 1764.09, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 3, 6624.81, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 15, 4580.75, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 17, 5861.17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 6, 2708.56, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 6, 2142.01, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 3, 5617.33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 3, 456.12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 17, 6158.59, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 9, 1211.95, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 14, 9025.66, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 3, 7613.59, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 6, 8542.33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 8, 6856.96, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 13, 8101.44, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 18, 498.33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 18, 9517.41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 18, 4715.45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 1, 8666.26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 7, 9620.44, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 2, 9520.35, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 19, 5298.56, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 9, 756.55, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 19, 2495.66, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 15, 4600.95, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 1, 663.88, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 19, 5431.66, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 15, 7609.6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 14, 8721.48, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 19, 3783.61, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 1, 4905.81, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 13, 9050.69, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 5, 6630.15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 4, 5380.67, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 11, 4519.46, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 10, 6835.75, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 19, 3084.45, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 2, 8282.74, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 8, 4576.26, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 5, 8538.74, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 4, 1665.41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 4, 5480.5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 6, 4403.91, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 3, 8741.15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 5, 5782.42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 8, 6337.46, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 14, 939.56, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 15, 895.94, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 15, 8486.92, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 18, 8775.67, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 9, 1597.03, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 10, 4191.85, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 13, 4431.77, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 12, 3235.66, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 20, 233.41, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 6, 8266, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 12, 5411.42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 10, 3343.11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 9, 891.55, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 4, 9648.77, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 7, 195.33, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 8, 7991.63, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 1, 9546.79, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 4, 1016.42, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 2, 576.72, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 9, 80.68, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 4, 1710.07, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 5, 6581.82, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 3, 1486.31, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 19, 1964.09, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 18, 1417.23, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 4, 2449.76, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 1, 5222.93, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 3, 285.14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 7, 5055.17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 14, 1275.28, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 7, 6973.73, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 13, 4849.37, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 3, 2723.37, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `admin`) VALUES
(1, 'uminero0@icio.us', '5FghH2Vvn5', 0),
(2, 'kglader1@china.com.cn', 'NwIK8lwX7qdl', 1),
(3, 'mgoligher2@domainmarket.com', 'pcsXQ2UkPu', 1),
(4, 'cruvel3@chicagotribune.com', 'T8Bc6eg', 1),
(5, 'rsuarez4@answers.com', 'hq4c8sRcGhcn', 0),
(6, 'awoodyer5@simplemachines.org', 'N6YQK3', 0),
(7, 'ckilian6@usatoday.com', 'DJKH7JgGcvEO', 0),
(8, 'dvasilchikov7@marketwatch.com', 'nijjSh', 1),
(9, 'rgoodlud8@aol.com', 'RvpMpJ9', 0),
(10, 'swarren9@cisco.com', 'BjGF2EnsO', 1),
(11, 'dtogwella@slideshare.net', 'Uq2YRsSKI', 0),
(12, 'cfilewoodb@ed.gov', 'qr1EZgzc', 0),
(13, 'mgreenlyc@mapy.cz', 'Tg0TGp43', 0),
(14, 'acarland@technorati.com', 'OwR1uRWdKm3', 1),
(15, 'aconachiee@mac.com', 'l0ahx0Mr', 0),
(17, 'fmairg@prnewswire.com', 'TG1di1R', 1),
(18, 'gbushellh@berkeley.edu', 'CgAqcuDg', 1),
(19, 'cabbotsi@mediafire.com', 'ufWs6PC', 1),
(20, 'eroantreej@behance.net', 'uQixgs18', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flavors`
--
ALTER TABLE `flavors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ef05006e-3501-463d-bfd1-70931406daae` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_64b604e1-d03a-4015-9c76-d465ed791884` (`category_id`),
  ADD KEY `FK_d099272a-94cb-45a0-9123-dffe1d2cb438` (`flavor_id`);

--
-- Indices de la tabla `product_sale`
--
ALTER TABLE `product_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1bd3ca30-9b5c-4108-aabc-da3c4b19a8c5` (`product_id`),
  ADD KEY `FK_03885168-bcd9-4813-9b43-175c0e4bec04` (`sale_id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_51709938-45de-4455-88ea-469b021eac1f` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `flavors`
--
ALTER TABLE `flavors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_ef05006e-3501-463d-bfd1-70931406daae` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_64b604e1-d03a-4015-9c76-d465ed791884` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_d099272a-94cb-45a0-9123-dffe1d2cb438` FOREIGN KEY (`flavor_id`) REFERENCES `flavors` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Filtros para la tabla `product_sale`
--
ALTER TABLE `product_sale`
  ADD CONSTRAINT `FK_03885168-bcd9-4813-9b43-175c0e4bec04` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_1bd3ca30-9b5c-4108-aabc-da3c4b19a8c5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `FK_51709938-45de-4455-88ea-469b021eac1f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
