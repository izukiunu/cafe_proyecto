-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2024 a las 21:56:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcafeteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add spinner item', 11, 'add_spinneritem'),
(26, 'Can change spinner item', 11, 'change_spinneritem'),
(27, 'Can delete spinner item', 11, 'delete_spinneritem'),
(28, 'Can view spinner item', 11, 'view_spinneritem'),
(29, 'Can add usuario', 12, 'add_usuario'),
(30, 'Can change usuario', 12, 'change_usuario'),
(31, 'Can delete usuario', 12, 'delete_usuario'),
(32, 'Can view usuario', 12, 'view_usuario'),
(33, 'Can add menu', 8, 'add_menu'),
(34, 'Can change menu', 8, 'change_menu'),
(35, 'Can delete menu', 8, 'delete_menu'),
(36, 'Can view menu', 8, 'view_menu'),
(37, 'Can add orden', 9, 'add_orden'),
(38, 'Can change orden', 9, 'change_orden'),
(39, 'Can delete orden', 9, 'delete_orden'),
(40, 'Can view orden', 9, 'view_orden'),
(41, 'Can add cliente', 7, 'add_cliente'),
(42, 'Can change cliente', 7, 'change_cliente'),
(43, 'Can delete cliente', 7, 'delete_cliente'),
(44, 'Can view cliente', 7, 'view_cliente'),
(45, 'Can add venta', 10, 'add_venta'),
(46, 'Can change venta', 10, 'change_venta'),
(47, 'Can delete venta', 10, 'delete_venta'),
(48, 'Can view venta', 10, 'view_venta'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto'),
(53, 'Can add categoria', 14, 'add_categoria'),
(54, 'Can change categoria', 14, 'change_categoria'),
(55, 'Can delete categoria', 14, 'delete_categoria'),
(56, 'Can view categoria', 14, 'view_categoria'),
(57, 'Can add carrito', 15, 'add_carrito'),
(58, 'Can change carrito', 15, 'change_carrito'),
(59, 'Can delete carrito', 15, 'delete_carrito'),
(60, 'Can view carrito', 15, 'view_carrito'),
(61, 'Can add pedido', 16, 'add_pedido'),
(62, 'Can change pedido', 16, 'change_pedido'),
(63, 'Can delete pedido', 16, 'delete_pedido'),
(64, 'Can view pedido', 16, 'view_pedido'),
(65, 'Can add spinner image', 17, 'add_spinnerimage'),
(66, 'Can change spinner image', 17, 'change_spinnerimage'),
(67, 'Can delete spinner image', 17, 'delete_spinnerimage'),
(68, 'Can view spinner image', 17, 'view_spinnerimage');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$jeJg9qe6jFfvS166HfO0HC$UP7EJQ1fegbQ5yU0MjbnTHoTRg+nURRT3rappO1tb4c=', '2024-12-10 20:46:54.174557', 1, 'izu', '', '', 'sebastianaguirremundaca@gmail.com', 1, 1, '2024-10-24 02:16:55.609888'),
(2, 'pbkdf2_sha256$720000$f6zC74nLDNRxo8BZrJRn0v$0W71/MeDlKjRn9l012qUysju38Mu/IyozKU4ewPHLl8=', '2024-12-08 21:03:22.851904', 0, 'Administrador', '', '', '', 0, 1, '2024-10-24 02:21:16.189092'),
(3, 'pbkdf2_sha256$720000$4bWz07ILlzGJDXox8COF9n$nw/mizOzY0xgeJ/ufCX7YMVUu4qHdNpaiqF+lvmRzKs=', NULL, 0, 'cajero', '', '', '', 0, 1, '2024-10-24 02:25:38.755472'),
(4, 'pbkdf2_sha256$720000$P8MwPKKWqV87ZmdJFZZqkL$MKqXqcr5j/LoPgbf9AXygCxOGPWbYv1Hz2jHl4SHwv0=', NULL, 0, 'Empleado', '', '', '', 0, 1, '2024-10-24 02:26:51.021477'),
(5, 'pbkdf2_sha256$720000$9FtPvX9ENmdphmmI9lD9VL$FGZ0uoODURJBfTJpLnGX9ktNLzjG+oo1zrLz2ScfPvA=', NULL, 0, 'default_user', '', '', 'default@example.com', 0, 1, '2024-12-08 04:35:24.633372'),
(13, 'pbkdf2_sha256$720000$fG4O0V3NLjJbC0nDvPni6M$3bxTbvYYqQnOCF1XsQsq790KtIbX2Px9UCQIhf81mfE=', '2024-12-10 20:50:47.926660', 0, 'cliente', '', '', 'sebastianaguirremundaca@gmail.com', 0, 1, '2024-12-10 20:50:34.919073');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_carrito`
--

CREATE TABLE `cafeteriaapp_carrito` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `producto_id` bigint(20) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_carrito`
--

INSERT INTO `cafeteriaapp_carrito` (`id`, `cantidad`, `producto_id`, `usuario_id`) VALUES
(15, 6, 1, 1),
(16, 5, 2, 1),
(17, 9, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_categoria`
--

CREATE TABLE `cafeteriaapp_categoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_categoria`
--

INSERT INTO `cafeteriaapp_categoria` (`id`, `nombre`, `descripcion`, `imagen`) VALUES
(1, 'Cafeteria', 'Todo tipo de cafe y preparaciones especiales con el mismo se encuentra aca', 'categorias/cafe-cafetera-express.jpg'),
(2, 'sandwiches', 'una especialidad de la casa', 'categorias/images_1.jpg'),
(3, 'Pasteles', 'echo directamente de nuestros especialistas', 'categorias/Pina-scaled.jpg'),
(4, 'Helados', 'Una gran variedad para gandres y chicos', 'categorias/helado_invierno-4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_cliente`
--

CREATE TABLE `cafeteriaapp_cliente` (
  `id` bigint(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `direccion` longtext DEFAULT NULL,
  `rut` varchar(12) DEFAULT NULL,
  `estado_compra` varchar(50) NOT NULL,
  `estado_pedido` varchar(50) NOT NULL,
  `total_pagar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_cliente`
--

INSERT INTO `cafeteriaapp_cliente` (`id`, `telefono`, `usuario_id`, `direccion`, `rut`, `estado_compra`, `estado_pedido`, `total_pagar`) VALUES
(1, '+56932454866', 1, 'calle abadia 9565', 'Sin RUT', 'pendiente', 'procesando', 0.00),
(2, '+5693245466', 2, 'calle abadia 9565', '21302986-k', 'pendiente', 'procesando', 0.00),
(3, '', 3, '', '', 'pendiente', 'procesando', 0.00),
(4, '', 4, '', '', 'pendiente', 'procesando', 0.00),
(5, '', 5, '', '', 'pendiente', 'procesando', 0.00),
(6, '+569345525', 13, NULL, NULL, 'pendiente', 'procesando', 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_pedido`
--

CREATE TABLE `cafeteriaapp_pedido` (
  `id` bigint(20) NOT NULL,
  `productos` longtext NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `codigo_pedido` varchar(8) NOT NULL,
  `confirmado_pago` tinyint(1) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_pedido`
--

INSERT INTO `cafeteriaapp_pedido` (`id`, `productos`, `total`, `direccion`, `rut`, `telefono`, `codigo_pedido`, `confirmado_pago`, `usuario_id`, `estado`) VALUES
(1, '[{\"titulo\": \"capuchino\", \"cantidad\": 3, \"precio_unitario\": 5000.0, \"subtotal\": 15000.0}]', 15000.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'RZJZMX3E', 0, 1, 'proceso'),
(5, '[{\"titulo\": \"latte\", \"cantidad\": 3, \"precio_unitario\": 6000.0, \"subtotal\": 18000.0}, {\"titulo\": \"capuchino\", \"cantidad\": 4, \"precio_unitario\": 5000.0, \"subtotal\": 20000.0}, {\"titulo\": \"cafe expreso\", \"cantidad\": 3, \"precio_unitario\": 2500.0, \"subtotal\": 7500.0}]', 45500.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'QTSPUN7G', 0, 1, 'proceso'),
(6, '[{\"titulo\": \"capuchino\", \"cantidad\": 4, \"precio_unitario\": 5000.0, \"subtotal\": 20000.0}]', 20000.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'RRXJ7CMN', 0, 1, 'proceso'),
(7, '[{\"titulo\": \"capuchino\", \"cantidad\": 4, \"precio_unitario\": 5000.0, \"subtotal\": 20000.0}]', 20000.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'AZJYJOFG', 0, 1, 'proceso'),
(8, '[{\"titulo\": \"cafe expreso\", \"cantidad\": 6, \"precio_unitario\": 2500.0, \"subtotal\": 15000.0}]', 15000.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'CN2GTWTD', 0, 1, 'proceso'),
(12, '[{\"titulo\": \"cafe expreso\", \"cantidad\": 5, \"precio_unitario\": 2500.0, \"subtotal\": 12500.0}]', 12500.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'TSF8GR0L', 0, 1, 'proceso'),
(13, '[{\"titulo\": \"cafe expreso\", \"cantidad\": 9, \"precio_unitario\": 2500.0, \"subtotal\": 22500.0}, {\"titulo\": \"capuchino\", \"cantidad\": 4, \"precio_unitario\": 5000.0, \"subtotal\": 20000.0}]', 42500.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'P9GOZAJW', 0, 1, 'proceso'),
(14, '[{\"titulo\": \"cafe expreso\", \"cantidad\": 5, \"precio_unitario\": 2500.0, \"subtotal\": 12500.0}]', 12500.00, 'calle abadia 9565', 'Sin RUT', '+56932454866', 'AUB59AXO', 0, 1, 'proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_producto`
--

CREATE TABLE `cafeteriaapp_producto` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_producto`
--

INSERT INTO `cafeteriaapp_producto` (`id`, `titulo`, `descripcion`, `precio`, `imagen`, `stock`, `categoria_id`) VALUES
(1, 'cafe expreso', 'un cafe de calidad y renombre', 2500.00, 'productos/espresso-vs-expresso_r9JFP3s.jpg', 9999, 1),
(2, 'capuchino', 'Un Capuchino es el equilibrio perfecto entre espresso, leche vaporizada y espuma', 5000.00, 'productos/01911ee7-3c8a-7b37-8d61-02a742ecbdd8.png', 9999, 1),
(3, 'mocachino', 'bebida caliente que combina café, leche y chocolate', 5500.00, 'productos/como_hacer_mocachino_frio_32349_orig.jpg', 9999, 1),
(4, 'latte', 'bebida de café con leche, espresso, leche al vapor y una capa de espuma', 6000.00, 'productos/46349.jpg_S40eeBq.jpg', 9999, 1),
(5, 'cafe de prueba', 'prueba prueba', 12000.00, 'productos/Captura_de_pantalla_2024-12-07_030326.png', 21, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_spinnerimage`
--

CREATE TABLE `cafeteriaapp_spinnerimage` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `width` int(10) UNSIGNED NOT NULL CHECK (`width` >= 0),
  `height` int(10) UNSIGNED NOT NULL CHECK (`height` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_spinnerimage`
--

INSERT INTO `cafeteriaapp_spinnerimage` (`id`, `title`, `description`, `image`, `width`, `height`) VALUES
(1, 'cafeteria', 'ven a disfrutar nuestros cafes de especialidad', 'spinner_images/UC8A1834.jpg', 300, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-24 02:21:16.655377', '2', 'Administrador', 1, '[{\"added\": {}}]', 4, 1),
(2, '2024-10-24 02:25:39.227080', '3', 'cajero', 1, '[{\"added\": {}}]', 4, 1),
(3, '2024-10-24 02:26:51.505866', '4', 'Empleado', 1, '[{\"added\": {}}]', 4, 1),
(4, '2024-11-16 23:20:15.503155', '1', 'Cafe de especialidad', 1, '[{\"added\": {}}]', 11, 1),
(5, '2024-11-17 00:21:35.841773', '2', 'Sandwich de especialidad', 1, '[{\"added\": {}}]', 11, 1),
(6, '2024-11-19 22:21:24.775756', '1', 'Cafeteria', 1, '[{\"added\": {}}]', 14, 1),
(7, '2024-11-19 22:42:08.541525', '1', 'cafe expreso', 1, '[{\"added\": {}}]', 13, 1),
(8, '2024-11-25 16:55:06.149678', '2', 'sandwiches', 1, '[{\"added\": {}}]', 14, 1),
(9, '2024-11-25 16:56:33.042364', '3', 'Pasteles', 1, '[{\"added\": {}}]', 14, 1),
(10, '2024-11-25 16:58:55.565680', '4', 'Helados', 1, '[{\"added\": {}}]', 14, 1),
(11, '2024-11-25 19:02:51.747880', '2', 'capuchino', 1, '[{\"added\": {}}]', 13, 1),
(12, '2024-11-25 19:09:02.251851', '3', 'mocachino', 1, '[{\"added\": {}}]', 13, 1),
(13, '2024-11-25 19:11:17.022480', '4', 'latte', 1, '[{\"added\": {}}]', 13, 1),
(14, '2024-12-08 05:09:40.972408', '4', 'latte', 2, '[]', 13, 1),
(15, '2024-12-08 15:12:50.331441', '5', 'cafe de prueba', 1, '[{\"added\": {}}]', 13, 1),
(16, '2024-12-08 16:08:17.689602', '4', 'latte', 2, '[{\"changed\": {\"fields\": [\"Stock ilimitado\"]}}]', 13, 1),
(17, '2024-12-08 16:08:53.406563', '4', 'latte', 2, '[{\"changed\": {\"fields\": [\"Stock ilimitado\"]}}]', 13, 1),
(18, '2024-12-10 07:29:24.702086', '4', 'latte', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 13, 1),
(19, '2024-12-10 14:10:55.104110', '4', 'Pedido GEDBKWFW - izu', 3, '', 16, 1),
(20, '2024-12-10 14:10:59.546207', '3', 'Pedido 3PMYHBKH - izu', 3, '', 16, 1),
(21, '2024-12-10 14:11:03.947202', '2', 'Pedido FSQWF0LL - izu', 3, '', 16, 1),
(22, '2024-12-10 14:46:23.705849', '9', 'Pedido UF7LDZXH - izu', 3, '', 16, 1),
(23, '2024-12-10 14:46:27.840176', '10', 'Pedido JTDFBEZ8 - izu', 3, '', 16, 1),
(24, '2024-12-10 14:46:31.086004', '11', 'Pedido IQXFVQID - izu', 3, '', 16, 1),
(25, '2024-12-10 17:16:49.926047', '2', 'Sandwich de especialidad', 3, '', 11, 1),
(26, '2024-12-10 17:16:53.560704', '1', 'Cafe de especialidad', 3, '', 11, 1),
(27, '2024-12-10 17:17:34.380344', '3', 'cafeteria', 1, '[{\"added\": {}}]', 11, 1),
(28, '2024-12-10 17:35:58.258789', '1', 'cafeteria', 1, '[{\"added\": {}}]', 17, 1),
(29, '2024-12-10 20:24:05.671716', '6', 'cliente', 3, '', 4, 1),
(30, '2024-12-10 20:26:38.098940', '8', 'cliente', 3, '', 4, 1),
(31, '2024-12-10 20:40:15.324924', '9', 'cliente', 3, '', 4, 1),
(32, '2024-12-10 20:47:01.243915', '10', 'cliente', 3, '', 4, 1),
(33, '2024-12-10 20:49:38.421155', '11', 'cliente', 3, '', 4, 1),
(34, '2024-12-10 20:50:09.179545', '12', 'cliente', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'cafeteriaApp', 'carrito'),
(14, 'cafeteriaApp', 'categoria'),
(7, 'cafeteriaApp', 'cliente'),
(8, 'cafeteriaApp', 'menu'),
(9, 'cafeteriaApp', 'orden'),
(16, 'cafeteriaApp', 'pedido'),
(13, 'cafeteriaApp', 'producto'),
(17, 'cafeteriaApp', 'spinnerimage'),
(11, 'cafeteriaApp', 'spinneritem'),
(12, 'cafeteriaApp', 'usuario'),
(10, 'cafeteriaApp', 'venta'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-24 02:11:48.946465'),
(2, 'auth', '0001_initial', '2024-10-24 02:11:49.668191'),
(3, 'admin', '0001_initial', '2024-10-24 02:11:49.850029'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-24 02:11:49.857091'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-24 02:11:49.863959'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-24 02:11:49.941669'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-24 02:11:50.025750'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-24 02:11:50.054322'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-24 02:11:50.063900'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-24 02:11:50.193034'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-24 02:11:50.197324'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-24 02:11:50.206649'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-24 02:11:50.224369'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-24 02:11:50.239460'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-24 02:11:50.257930'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-24 02:11:50.265523'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-24 02:11:50.283252'),
(18, 'sessions', '0001_initial', '2024-10-24 02:11:50.325859'),
(19, 'cafeteriaApp', '0001_initial', '2024-11-16 23:00:45.483169'),
(20, 'cafeteriaApp', '0002_categoria_producto', '2024-11-19 22:10:32.149197'),
(21, 'cafeteriaApp', '0003_producto_stock_ilimitado_alter_producto_stock', '2024-11-19 22:37:55.484009'),
(22, 'cafeteriaApp', '0004_remove_cliente_apellido_and_more', '2024-12-08 04:38:12.600048'),
(23, 'cafeteriaApp', '0005_cliente_direccion_cliente_rut_alter_producto_imagen', '2024-12-08 18:23:21.767954'),
(24, 'cafeteriaApp', '0006_cliente_alertas_cliente_motivo_eliminacion_and_more', '2024-12-08 19:16:21.723739'),
(25, 'cafeteriaApp', '0007_remove_orden_fk_menu_remove_venta_fk_cliente_and_more', '2024-12-08 20:11:38.221370'),
(26, 'cafeteriaApp', '0008_carrito_delete_usuario_remove_cliente_alertas_and_more', '2024-12-09 17:01:22.481279'),
(27, 'cafeteriaApp', '0009_remove_carrito_cliente_remove_carrito_subtotal_and_more', '2024-12-10 06:34:57.227932'),
(28, 'cafeteriaApp', '0010_cliente_estado_compra_cliente_estado_pedido_and_more', '2024-12-10 07:24:23.510008'),
(29, 'cafeteriaApp', '0011_pedido', '2024-12-10 13:59:30.641097'),
(30, 'cafeteriaApp', '0012_spinnerimage_delete_spinneritem', '2024-12-10 17:33:59.446162'),
(31, 'cafeteriaApp', '0013_pedido_estado', '2024-12-10 18:45:50.328439'),
(32, 'cafeteriaApp', '0014_alter_cliente_usuario', '2024-12-10 20:22:23.123855'),
(33, 'cafeteriaApp', '0015_alter_cliente_direccion', '2024-12-10 20:46:22.146804'),
(34, 'cafeteriaApp', '0016_alter_cliente_rut', '2024-12-10 20:50:18.355912');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ctpr1zgnofty9pm76b2xwmj01iv5w6f8', '.eJxVjEEOwiAQRe_C2hCgDNNx6d4zEKaAVA0kpV0Z765NutDtf-_9l_BhW4vfelr8HMVZaHH63ThMj1R3EO-h3pqcWl2XmeWuyIN2eW0xPS-H-3dQQi_fGhAGJLYjaVbIhAaYonEMiQebzRAZQCUaIZJDBGaHWlmjXDAuZyveH7iONso:1tCQWF:Bqf1AzEWDCkOCJwOhDSzIRX0KSHFsheFm46ocKJi82g', '2024-11-30 21:39:51.324702'),
('gpbiqrxdn89p0beju6f79eu4ncrhhxc4', '.eJxVjDEOwjAMAP-SGUVyk2KHkZ03RLaTkgJKpaadEH9HkTrAene6t4m8byXuLa9xTuZiwJnTLxTWZ67dpAfX-2J1qds6i-2JPWyztyXl1_Vo_waFW-nfQb0TQeWgxJA9Js1MwkQJnCcPgXVMQuQ8CI4Aeg6IwyTk1E1oPl8cXjg7:1tL7Bv:WNalHu563FKm1lVdSmiFH946rXfrsvJDhJ1CBYbDHGk', '2024-12-24 20:50:47.954993'),
('kkp64bvqa6a25b9uzyqaio4udbmg6ccz', 'e30:1tKMOV:eGtNqEMWLvzBEkr6MQfFFCxsim_Zod2tj7GBokn9OeI', '2024-12-22 18:52:39.212068'),
('nwr622bbx8c5eyjvj1xnww5a7v08wtxw', '.eJxVjEEOwiAQRe_C2hAGRKpL9z0DmRkGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxSuqiQB1-N0J-SN1AumO9Nc2tLvNEelP0TrseW5LndXf_Dgr28q2tA2_ZBhnY2SySHYHPmZP355yAHZPxxhiGk4AZxBpiJITgQjgKonp_APAgOGk:1t3nPr:RnDHMytR9siBaFbE5l93edV3z6y5fGv5I-KwO-E7t3Y', '2024-11-07 02:17:35.007668'),
('qih0yelm3bg1lw3dh9sk7n6n8dfchwud', 'e30:1tKMOc:lw_bAJeJ8XIlRFKIsrbUBcHJLuTLHNPuY68bKByzYKU', '2024-12-22 18:52:46.242473'),
('saldrycftn2sbqhsfro8bzluow0mnrwx', 'e30:1tKMPL:Co6iuOCjgVBQzxuZpasv_wdAS1UMBkCf_PIXAR9KARw', '2024-12-22 18:53:31.846480');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cafeteriaapp_carrito`
--
ALTER TABLE `cafeteriaapp_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafeteriaApp_carrito_producto_id_6fac0ace_fk_cafeteria` (`producto_id`),
  ADD KEY `cafeteriaApp_carrito_usuario_id_0c31786c_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `cafeteriaapp_categoria`
--
ALTER TABLE `cafeteriaapp_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cafeteriaapp_cliente`
--
ALTER TABLE `cafeteriaapp_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `cafeteriaapp_pedido`
--
ALTER TABLE `cafeteriaapp_pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_pedido` (`codigo_pedido`),
  ADD KEY `cafeteriaApp_pedido_usuario_id_bc16b179_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `cafeteriaapp_producto`
--
ALTER TABLE `cafeteriaapp_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafeteriaApp_product_categoria_id_2488dbc5_fk_cafeteria` (`categoria_id`);

--
-- Indices de la tabla `cafeteriaapp_spinnerimage`
--
ALTER TABLE `cafeteriaapp_spinnerimage`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_carrito`
--
ALTER TABLE `cafeteriaapp_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_categoria`
--
ALTER TABLE `cafeteriaapp_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_cliente`
--
ALTER TABLE `cafeteriaapp_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_pedido`
--
ALTER TABLE `cafeteriaapp_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_producto`
--
ALTER TABLE `cafeteriaapp_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_spinnerimage`
--
ALTER TABLE `cafeteriaapp_spinnerimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cafeteriaapp_carrito`
--
ALTER TABLE `cafeteriaapp_carrito`
  ADD CONSTRAINT `cafeteriaApp_carrito_producto_id_6fac0ace_fk_cafeteria` FOREIGN KEY (`producto_id`) REFERENCES `cafeteriaapp_producto` (`id`),
  ADD CONSTRAINT `cafeteriaApp_carrito_usuario_id_0c31786c_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cafeteriaapp_cliente`
--
ALTER TABLE `cafeteriaapp_cliente`
  ADD CONSTRAINT `cafeteriaApp_cliente_usuario_id_0ff9d405_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cafeteriaapp_pedido`
--
ALTER TABLE `cafeteriaapp_pedido`
  ADD CONSTRAINT `cafeteriaApp_pedido_usuario_id_bc16b179_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cafeteriaapp_producto`
--
ALTER TABLE `cafeteriaapp_producto`
  ADD CONSTRAINT `cafeteriaApp_product_categoria_id_2488dbc5_fk_cafeteria` FOREIGN KEY (`categoria_id`) REFERENCES `cafeteriaapp_categoria` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
