-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2024 a las 06:41:41
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
(56, 'Can view categoria', 14, 'view_categoria');

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
(1, 'pbkdf2_sha256$720000$IZKdcOFHMLXrw5jX3NRpPO$kDce0Qi13QlpT1XnD6FRneym2UmC8q3xDH9fe7oFaC4=', '2024-11-16 21:39:51.293036', 1, 'izu', '', '', 'sebastianaguirremundaca@gmail.com', 1, 1, '2024-10-24 02:16:55.609888'),
(2, 'pbkdf2_sha256$720000$f6zC74nLDNRxo8BZrJRn0v$0W71/MeDlKjRn9l012qUysju38Mu/IyozKU4ewPHLl8=', NULL, 0, 'Administrador', '', '', '', 0, 1, '2024-10-24 02:21:16.189092'),
(3, 'pbkdf2_sha256$720000$4bWz07ILlzGJDXox8COF9n$nw/mizOzY0xgeJ/ufCX7YMVUu4qHdNpaiqF+lvmRzKs=', NULL, 0, 'cajero', '', '', '', 0, 1, '2024-10-24 02:25:38.755472'),
(4, 'pbkdf2_sha256$720000$P8MwPKKWqV87ZmdJFZZqkL$MKqXqcr5j/LoPgbf9AXygCxOGPWbYv1Hz2jHl4SHwv0=', NULL, 0, 'Empleado', '', '', '', 0, 1, '2024-10-24 02:26:51.021477');

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
-- Estructura de tabla para la tabla `cafeteriaapp_categoria`
--

CREATE TABLE `cafeteriaapp_categoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
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
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `calle_direccion` varchar(90) NOT NULL,
  `calle_numero` varchar(10) NOT NULL,
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_menu`
--

CREATE TABLE `cafeteriaapp_menu` (
  `id` bigint(20) NOT NULL,
  `m_nombre` varchar(30) NOT NULL,
  `m_detalle` varchar(255) NOT NULL,
  `m_precio` int(10) UNSIGNED NOT NULL CHECK (`m_precio` >= 0),
  `m_stock` int(10) UNSIGNED NOT NULL CHECK (`m_stock` >= 0),
  `cantidad_piezas` int(10) UNSIGNED NOT NULL CHECK (`cantidad_piezas` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_orden`
--

CREATE TABLE `cafeteriaapp_orden` (
  `id` bigint(20) NOT NULL,
  `cod_orden` int(11) NOT NULL,
  `estado_orden` varchar(10) NOT NULL,
  `fk_cliente_id` bigint(20) NOT NULL,
  `fk_menu_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_producto`
--

CREATE TABLE `cafeteriaapp_producto` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `stock` int(10) UNSIGNED DEFAULT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `stock_ilimitado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_producto`
--

INSERT INTO `cafeteriaapp_producto` (`id`, `titulo`, `descripcion`, `precio`, `imagen`, `stock`, `categoria_id`, `stock_ilimitado`) VALUES
(1, 'cafe expreso', 'un cafe de calidad y renombre', 2500.00, 'productos/espresso-vs-expresso_r9JFP3s.jpg', 0, 1, 1),
(2, 'capuchino', 'Un Capuchino es el equilibrio perfecto entre espresso, leche vaporizada y espuma', 5000.00, 'productos/01911ee7-3c8a-7b37-8d61-02a742ecbdd8.png', 0, 1, 1),
(3, 'mocachino', 'bebida caliente que combina café, leche y chocolate', 5500.00, 'productos/como_hacer_mocachino_frio_32349_orig.jpg', 0, 1, 1),
(4, 'latte', 'bebida de café con leche, espresso, leche al vapor y una capa de espuma', 6000.00, 'productos/46349.jpg.jpg', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_spinneritem`
--

CREATE TABLE `cafeteriaapp_spinneritem` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cafeteriaapp_spinneritem`
--

INSERT INTO `cafeteriaapp_spinneritem` (`id`, `image`, `title`, `description`, `link`) VALUES
(1, 'spinner_images/cafeengrano.jpg', 'Cafe de especialidad', 'en nuestra cafeteria tenemos todo tipo de cafe para cada tipo de persona venga a disfrutar de nuestros sabores', NULL),
(2, 'spinner_images/sandwich.jpg', 'Sandwich de especialidad', 'Disfruta de nuestra gran variedad de sandwiches preparados de la casas con una gran variedad de productos de calidad y de primera mano todo esto en solo cafeteria JJS', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_usuario`
--

CREATE TABLE `cafeteriaapp_usuario` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `password_usuario` varchar(8) NOT NULL,
  `tipo_usuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cafeteriaapp_venta`
--

CREATE TABLE `cafeteriaapp_venta` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `total_original` int(10) UNSIGNED NOT NULL CHECK (`total_original` >= 0),
  `total_descuento` int(10) UNSIGNED NOT NULL CHECK (`total_descuento` >= 0),
  `total_final` int(11) NOT NULL,
  `fk_cliente_id` bigint(20) NOT NULL,
  `fk_orden_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(13, '2024-11-25 19:11:17.022480', '4', 'latte', 1, '[{\"added\": {}}]', 13, 1);

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
(14, 'cafeteriaApp', 'categoria'),
(7, 'cafeteriaApp', 'cliente'),
(8, 'cafeteriaApp', 'menu'),
(9, 'cafeteriaApp', 'orden'),
(13, 'cafeteriaApp', 'producto'),
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
(21, 'cafeteriaApp', '0003_producto_stock_ilimitado_alter_producto_stock', '2024-11-19 22:37:55.484009');

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
('nwr622bbx8c5eyjvj1xnww5a7v08wtxw', '.eJxVjEEOwiAQRe_C2hAGRKpL9z0DmRkGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxSuqiQB1-N0J-SN1AumO9Nc2tLvNEelP0TrseW5LndXf_Dgr28q2tA2_ZBhnY2SySHYHPmZP355yAHZPxxhiGk4AZxBpiJITgQjgKonp_APAgOGk:1t3nPr:RnDHMytR9siBaFbE5l93edV3z6y5fGv5I-KwO-E7t3Y', '2024-11-07 02:17:35.007668');

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
-- Indices de la tabla `cafeteriaapp_categoria`
--
ALTER TABLE `cafeteriaapp_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cafeteriaapp_cliente`
--
ALTER TABLE `cafeteriaapp_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cafeteriaapp_menu`
--
ALTER TABLE `cafeteriaapp_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cafeteriaapp_orden`
--
ALTER TABLE `cafeteriaapp_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafeteriaApp_orden_fk_cliente_id_c8862dd3_fk_cafeteria` (`fk_cliente_id`),
  ADD KEY `cafeteriaApp_orden_fk_menu_id_155e6937_fk_cafeteriaApp_menu_id` (`fk_menu_id`);

--
-- Indices de la tabla `cafeteriaapp_producto`
--
ALTER TABLE `cafeteriaapp_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafeteriaApp_product_categoria_id_2488dbc5_fk_cafeteria` (`categoria_id`);

--
-- Indices de la tabla `cafeteriaapp_spinneritem`
--
ALTER TABLE `cafeteriaapp_spinneritem`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cafeteriaapp_usuario`
--
ALTER TABLE `cafeteriaapp_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cafeteriaapp_venta`
--
ALTER TABLE `cafeteriaapp_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafeteriaApp_venta_fk_cliente_id_ae9f89cc_fk_cafeteria` (`fk_cliente_id`),
  ADD KEY `cafeteriaApp_venta_fk_orden_id_334bc1c6_fk_cafeteriaApp_orden_id` (`fk_orden_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT de la tabla `cafeteriaapp_categoria`
--
ALTER TABLE `cafeteriaapp_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_cliente`
--
ALTER TABLE `cafeteriaapp_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_menu`
--
ALTER TABLE `cafeteriaapp_menu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_orden`
--
ALTER TABLE `cafeteriaapp_orden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_producto`
--
ALTER TABLE `cafeteriaapp_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_spinneritem`
--
ALTER TABLE `cafeteriaapp_spinneritem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_usuario`
--
ALTER TABLE `cafeteriaapp_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cafeteriaapp_venta`
--
ALTER TABLE `cafeteriaapp_venta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- Filtros para la tabla `cafeteriaapp_orden`
--
ALTER TABLE `cafeteriaapp_orden`
  ADD CONSTRAINT `cafeteriaApp_orden_fk_cliente_id_c8862dd3_fk_cafeteria` FOREIGN KEY (`fk_cliente_id`) REFERENCES `cafeteriaapp_cliente` (`id`),
  ADD CONSTRAINT `cafeteriaApp_orden_fk_menu_id_155e6937_fk_cafeteriaApp_menu_id` FOREIGN KEY (`fk_menu_id`) REFERENCES `cafeteriaapp_menu` (`id`);

--
-- Filtros para la tabla `cafeteriaapp_producto`
--
ALTER TABLE `cafeteriaapp_producto`
  ADD CONSTRAINT `cafeteriaApp_product_categoria_id_2488dbc5_fk_cafeteria` FOREIGN KEY (`categoria_id`) REFERENCES `cafeteriaapp_categoria` (`id`);

--
-- Filtros para la tabla `cafeteriaapp_venta`
--
ALTER TABLE `cafeteriaapp_venta`
  ADD CONSTRAINT `cafeteriaApp_venta_fk_cliente_id_ae9f89cc_fk_cafeteria` FOREIGN KEY (`fk_cliente_id`) REFERENCES `cafeteriaapp_cliente` (`id`),
  ADD CONSTRAINT `cafeteriaApp_venta_fk_orden_id_334bc1c6_fk_cafeteriaApp_orden_id` FOREIGN KEY (`fk_orden_id`) REFERENCES `cafeteriaapp_orden` (`id`);

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
