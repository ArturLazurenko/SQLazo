CREATE TABLE `CLIENTE` (
  `curp_cliente` varchar(18) PRIMARY KEY,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100)
);

CREATE TABLE `DIRECCION` (
  `id_direccion` varchar(20) PRIMARY KEY NOT NULL,
  `curp_cliente` varchar(18) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `calle` varchar(150) NOT NULL,
  `numero_int` varchar(10),
  `numero_ext` varchar(10) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL
);

CREATE TABLE `REPARTIDOR` (
  `id_repartidor` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100),
  `curp` varchar(18) UNIQUE NOT NULL
);

CREATE TABLE `VEHICULO` (
  `vin` varchar(17) PRIMARY KEY,
  `modelo` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `año` int NOT NULL,
  `color` varchar(50),
  `kilometraje` int
);

CREATE TABLE `PAQUETE` (
  `no_seguimiento` varchar(50) PRIMARY KEY,
  `curp_cliente` varchar(18) NOT NULL,
  `id_direccion` varchar(20) NOT NULL,
  `id_repartidor` int NOT NULL,
  `contenido` varchar(255),
  `cantidad` int,
  `peso` decimal(10,2),
  `es_fragil` boolean,
  `estado_paquete` varchar(50) NOT NULL,
  `costo_flete` decimal(10,2) NOT NULL,
  `fecha_envio` date NOT NULL,
  `fecha_entrega` date,
  `zona` varchar(100) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `es_demorado` boolean NOT NULL,
  `es_dañado` boolean NOT NULL
);

CREATE TABLE `REPARTIDOR_VEHICULO` (
  `id_repartidor` int NOT NULL,
  `vin` varchar(17) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `fecha_fin` date,
  PRIMARY KEY (`id_repartidor`, `vin`, `fecha_asignacion`)
);

ALTER TABLE `PAQUETE` ADD FOREIGN KEY (`id_direccion`) REFERENCES `DIRECCION` (`id_direccion`);

ALTER TABLE `DIRECCION` ADD FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`);

ALTER TABLE `PAQUETE` ADD FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`);

ALTER TABLE `PAQUETE` ADD FOREIGN KEY (`id_repartidor`) REFERENCES `REPARTIDOR` (`id_repartidor`);

ALTER TABLE `REPARTIDOR_VEHICULO` ADD FOREIGN KEY (`id_repartidor`) REFERENCES `REPARTIDOR` (`id_repartidor`);

ALTER TABLE `REPARTIDOR_VEHICULO` ADD FOREIGN KEY (`vin`) REFERENCES `VEHICULO` (`vin`);
