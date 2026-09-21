USE Paqueteria;

CREATE TABLE `CLIENTE` (
  `curp_cliente` varchar(18) PRIMARY KEY,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100)
);

CREATE TABLE `DIRECCION` (
  `curp_cliente` varchar(18) PRIMARY KEY NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
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
  `modelo` varchar(100),
  `marca` varchar(100),
  `anio` int,
  `color` varchar(50),
  `kilometraje` int
);

CREATE TABLE `PAQUETE` (
  `no_seguimiento` varchar(50) PRIMARY KEY,
  `curp_cliente` varchar(18) NOT NULL,
  `id_repartidor` int NOT NULL,
  `contenido` varchar(255),
  `cantidad` int,
  `peso` decimal(10,2),
  `es_fragil` boolean,
  `estado_paquete` varchar(50)
);

CREATE TABLE `REPARTIDOR_VEHICULO` (
  `id_repartidor` int NOT NULL,
  `vin` varchar(17) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_repartidor`, `vin`, `fecha`)
);

ALTER TABLE `DIRECCION` ADD FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`);

ALTER TABLE `PAQUETE` ADD FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`);

ALTER TABLE `PAQUETE` ADD FOREIGN KEY (`id_repartidor`) REFERENCES `REPARTIDOR` (`id_repartidor`);

ALTER TABLE `REPARTIDOR_VEHICULO` ADD FOREIGN KEY (`id_repartidor`) REFERENCES `REPARTIDOR` (`id_repartidor`);

ALTER TABLE `REPARTIDOR_VEHICULO` ADD FOREIGN KEY (`vin`) REFERENCES `VEHICULO` (`vin`);

INSERT INTO CLIENTE (curp_cliente, nombre, apellido_paterno, apellido_materno) VALUES
('GARC850412HDFRRL09', 'Carlos', 'García', 'Ramírez'),
('LOPM920715MDFPNS08', 'Mariana', 'López', 'Pérez'),
('HERM880923HQTNRL05', 'Jorge', 'Hernández', 'Morales'),
('SARM950306MQTNRL07', 'Sofía', 'Sánchez', 'Martínez'),
('TORL910821HDFRNS04', 'Luis', 'Torres', 'Rodríguez');

INSERT INTO DIRECCION 
(curp_cliente, estado, pais, municipio, calle, numero_int, numero_ext, codigo_postal) VALUES
('GARC850412HDFRRL09', 'Querétaro', 'México', 'Querétaro', 'Av. Constituyentes', '4B', '125', '76000'),
('LOPM920715MDFPNS08', 'Querétaro', 'México', 'Corregidora', 'Paseo de los Olivos', NULL, '218', '76900'),
('HERM880923HQTNRL05', 'Ciudad de México', 'México', 'Coyoacán', 'Av. Miguel Ángel de Quevedo', '12', '453', '04360'),
('SARM950306MQTNRL07', 'Guanajuato', 'México', 'León', 'Blvd. Campestre', NULL, '876', '37150'),
('TORL910821HDFRNS04', 'Jalisco', 'México', 'Guadalajara', 'Av. Vallarta', '3A', '1450', '44110');

INSERT INTO REPARTIDOR 
(nombre, apellido_paterno, apellido_materno, curp) VALUES
('Alejandro', 'Ramírez', 'Gómez', 'RAGA900214HQTMML06'),
('Daniela', 'Martínez', 'Hernández', 'MAHD940728MDFRNR03'),
('Ricardo', 'González', 'López', 'GOLR870519HDFNPC02'),
('Fernanda', 'Vargas', 'Sánchez', 'VASF960311MQTRRN09'),
('Miguel', 'Castillo', 'Torres', 'CATM890925HDFSRG05');

INSERT INTO VEHICULO 
(vin, modelo, marca, anio, color, kilometraje) VALUES
('3N1CN7AP5KL856421', 'Versa', 'Nissan', 2019, 'Blanco', 98500),
('1G1ZE5ST8LF123874', 'Malibu', 'Chevrolet', 2020, 'Gris', 76200),
('JTDBR32E720145963', 'Corolla', 'Toyota', 2021, 'Rojo', 58400),
('9BWZZZ377VT004251', 'Saveiro', 'Volkswagen', 2018, 'Blanco', 113700),
('3VW2B7AJ5KM214683', 'Jetta', 'Volkswagen', 2019, 'Azul', 89600);

INSERT INTO PAQUETE 
(no_seguimiento, curp_cliente, id_repartidor, contenido, cantidad, peso, es_fragil, estado_paquete) VALUES
('MX202608270001', 'GARC850412HDFRRL09', 1, 'Laptop Lenovo ThinkPad', 1, 2.40, TRUE, 'En tránsito'),
('MX202608270002', 'LOPM920715MDFPNS08', 2, 'Ropa y accesorios', 6, 3.75, FALSE, 'Entregado'),
('MX202608270003', 'HERM880923HQTNRL05', 3, 'Libros y material escolar', 8, 5.20, FALSE, 'En tránsito'),
('MX202608270004', 'SARM950306MQTNRL07', 4, 'Cristalería y artículos decorativos', 4, 4.60, TRUE, 'En almacén'),
('MX202608270005', 'TORL910821HDFRNS04', 5, 'Audífonos y accesorios electrónicos', 3, 1.35, TRUE, 'Entregado');

INSERT INTO REPARTIDOR_VEHICULO 
(id_repartidor, vin, fecha) VALUES
(1, '3N1CN7AP5KL856421', '2026-08-25'),
(2, '1G1ZE5ST8LF123874', '2026-08-25'),
(3, 'JTDBR32E720145963', '2026-08-26'),
(4, '9BWZZZ377VT004251', '2026-08-26'),
(5, '3VW2B7AJ5KM214683', '2026-08-27');

SELECT * FROM CLIENTE;

SELECT * FROM DIRECCION;

SELECT * FROM REPARTIDOR;

SELECT * FROM VEHICULO;

SELECT * FROM PAQUETE;x	

SELECT * FROM REPARTIDOR_VEHICULO;


