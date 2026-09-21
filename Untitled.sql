USE paquetes2;

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
  `color` varchar(50) NOT NULL,
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
  `fecha_estimada` date NOT NULL,
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


INSERT INTO CLIENTE
(curp_cliente, nombre, apellido_paterno, apellido_materno)
VALUES
('GARC010203HQRMLN01', 'Carlos', 'García', 'López'),
('MART020304MQTRRN02', 'Mariana', 'Martínez', 'Ramírez'),
('LOPE030405HDFPNS03', 'Luis', 'López', 'Pérez'),
('HERN040506MQTRSN04', 'Ana', 'Hernández', 'Torres'),
('GONZ050607HQRNML05', 'Jorge', 'González', 'Morales'),
('SANC060708MQTRNZ06', 'Sofía', 'Sánchez', 'Núñez'),
('RODR070809HDFMRL07', 'Diego', 'Rodríguez', 'Mendoza'),
('PERE080910MQTRRL08', 'Laura', 'Pérez', 'Ramírez'),
('CRUZ091011HQRZNS09', 'Miguel', 'Cruz', NULL),
('FLOR101112MQTRRS10', 'Fernanda', 'Flores', 'Ruiz');

INSERT INTO DIRECCION
(id_direccion, curp_cliente, estado, pais, municipio, ciudad,
 calle, numero_int, numero_ext, codigo_postal)
VALUES
('DIR001', 'GARC010203HQRMLN01', 'Querétaro', 'México',
 'Querétaro', 'Santiago de Querétaro', 'Av. Constituyentes',
 '2A', '125', '76000'),

('DIR002', 'MART020304MQTRRN02', 'Querétaro', 'México',
 'Corregidora', 'El Pueblito', 'Av. Candiles',
 NULL, '245', '76900'),

('DIR003', 'LOPE030405HDFPNS03', 'Jalisco', 'México',
 'Guadalajara', 'Guadalajara', 'Av. Vallarta',
 '4B', '830', '44100'),

('DIR004', 'HERN040506MQTRSN04', 'Ciudad de México', 'México',
 'Coyoacán', 'Ciudad de México', 'Av. Universidad',
 NULL, '1500', '04350'),

('DIR005', 'GONZ050607HQRNML05', 'Nuevo León', 'México',
 'Monterrey', 'Monterrey', 'Av. Garza Sada',
 '1C', '500', '64700'),

('DIR006', 'SANC060708MQTRNZ06', 'Querétaro', 'México',
 'Querétaro', 'Santiago de Querétaro', '5 de Febrero',
 NULL, '120', '76150'),

('DIR007', 'RODR070809HDFMRL07', 'Puebla', 'México',
 'Puebla', 'Puebla', 'Blvd. Atlixco',
 '3A', '720', '72400'),

('DIR008', 'PERE080910MQTRRL08', 'Guanajuato', 'México',
 'León', 'León de los Aldama', 'Av. Insurgentes',
 NULL, '310', '37000'),

('DIR009', 'CRUZ091011HQRZNS09', 'Querétaro', 'México',
 'San Juan del Río', 'San Juan del Río', 'Av. Central',
 '5B', '88', '76800'),

('DIR010', 'FLOR101112MQTRRS10', 'Querétaro', 'México',
 'Corregidora', 'El Pueblito', 'Av. Zaragoza',
 NULL, '450', '76900');

INSERT INTO REPARTIDOR
(nombre, apellido_paterno, apellido_materno, curp)
VALUES
('Pedro', 'Ramírez', 'Soto', 'RASP900101HQRMTD01'),
('Ricardo', 'Mendoza', 'López', 'MELR910202HDFPNC02'),
('Daniel', 'Torres', 'García', 'TOGD920303HQRRRL03'),
('Andrés', 'Morales', 'Pérez', 'MOPA930404HDFRND04'),
('Fernando', 'Núñez', 'Sánchez', 'NUSF940505HQRNDR05'),
('Alejandro', 'Ruiz', 'Hernández', 'RUHA950606HDFZLC06'),
('Javier', 'Soto', 'Flores', 'SOFJ960707HQRTRL07'),
('Manuel', 'García', 'Cruz', 'GACM970808HDFRNL08'),
('Roberto', 'Pérez', 'Mendoza', 'PEMR980909HQRNBB09'),
('Emilio', 'López', NULL, 'LOEE990101HDFMML10');

INSERT INTO VEHICULO
(vin, modelo, marca, año, color, kilometraje)
VALUES
('1HGCM82633A123456', 'Civic', 'Honda', 2021, 'Blanco', 45200),
('1HGCM82634A234567', 'City', 'Honda', 2022, 'Gris', 31800),
('3N1CN7AP5KL345678', 'Versa', 'Nissan', 2020, 'Rojo', 67100),
('3N1AB7AP8KY456789', 'Sentra', 'Nissan', 2021, 'Negro', 52300),
('9BWZZZ377VT567890', 'Jetta', 'Volkswagen', 2019, 'Azul', 80400),
('9BWZZZ377WV678901', 'Vento', 'Volkswagen', 2020, 'Blanco', 61200),
('KMHCT4AE1HU789012', 'Accent', 'Hyundai', 2022, 'Plata', 28500),
('KMHDN45D3GU890123', 'Elantra', 'Hyundai', 2021, 'Negro', 39700),
('3VW2K7AJ5EM901234', 'Golf', 'Volkswagen', 2018, 'Negro', 95600),
('JH4TB2H26CC012345', 'CR-V', 'Honda', 2023, 'Gris', 90765);

INSERT INTO PAQUETE
(no_seguimiento, curp_cliente, id_direccion, id_repartidor,
 contenido, cantidad, peso, es_fragil, estado_paquete,
 costo_flete, fecha_envio, fecha_estimada, fecha_entrega,
 zona, ruta, es_demorado, es_dañado)
VALUES

('PKG000001', 'GARC010203HQRMLN01', 'DIR001', 1,
 'Laptop', 1, 3.50, TRUE, 'Entregado',
 180.00, '2026-08-20', '2026-08-22', '2026-08-22',
 'Centro', 'Ruta-01', FALSE, FALSE),

('PKG000002', 'MART020304MQTRRN02', 'DIR002', 2,
 'Ropa', 5, 2.20, FALSE, 'Entregado',
 120.00, '2026-08-21', '2026-08-23', '2026-08-24',
 'Sur', 'Ruta-02', TRUE, FALSE),

('PKG000003', 'LOPE030405HDFPNS03', 'DIR003', 3,
 'Celular', 1, 0.80, TRUE, 'En tránsito',
 150.00, '2026-08-25', '2026-08-28', NULL,
 'Centro', 'Ruta-03', FALSE, FALSE),

('PKG000004', 'HERN040506MQTRSN04', 'DIR004', 4,
 'Libros', 8, 4.50, FALSE, 'Entregado',
 200.00, '2026-08-18', '2026-08-21', '2026-08-21',
 'Sur', 'Ruta-04', FALSE, FALSE),

('PKG000005', 'GONZ050607HQRNML05', 'DIR005', 5,
 'Monitor', 1, 7.80, TRUE, 'Dañado',
 300.00, '2026-08-19', '2026-08-22', '2026-08-25',
 'Norte', 'Ruta-05', TRUE, TRUE),

('PKG000006', 'SANC060708MQTRNZ06', 'DIR006', 1,
 'Zapatos', 2, 1.90, FALSE, 'Entregado',
 110.00, '2026-08-23', '2026-08-25', '2026-08-25',
 'Centro', 'Ruta-01', FALSE, FALSE),

('PKG000007', 'RODR070809HDFMRL07', 'DIR007', 6,
 'Electrodoméstico', 1, 12.50, TRUE, 'En tránsito',
 350.00, '2026-08-26', '2026-08-30', NULL,
 'Norte', 'Ruta-06', FALSE, FALSE),

('PKG000008', 'PERE080910MQTRRL08', 'DIR008', 7,
 'Juguetes', 6, 5.30, FALSE, 'Entregado',
 175.00, '2026-08-17', '2026-08-20', '2026-08-20',
 'Occidente', 'Ruta-07', FALSE, FALSE),

('PKG000009', 'CRUZ091011HQRZNS09', 'DIR009', 8,
 'Computadora', 1, 8.70, TRUE, 'En revisión',
 280.00, '2026-08-24', '2026-08-27', NULL,
 'Centro', 'Ruta-08', TRUE, TRUE),

('PKG000010', 'FLOR101112MQTRRS10', 'DIR010', 2,
 'Ropa', 3, 2.20, FALSE, 'Entregado',
 120.00, '2026-08-21', '2026-08-23', '2026-08-23',
 'Sur', 'Ruta-02', FALSE, FALSE);

INSERT INTO REPARTIDOR_VEHICULO
(id_repartidor, vin, fecha_asignacion, fecha_fin)
VALUES
(1, '1HGCM82633A123456', '2026-01-10', NULL),
(2, '1HGCM82634A234567', '2026-02-15', NULL),
(3, '3N1CN7AP5KL345678', '2026-01-20', '2026-07-15'),
(4, '3N1AB7AP8KY456789', '2026-03-05', NULL),
(5, '9BWZZZ377VT567890', '2026-02-01', NULL),
(6, '9BWZZZ377WV678901', '2026-04-12', NULL),
(7, 'KMHCT4AE1HU789012', '2026-05-20', NULL),
(8, 'KMHDN45D3GU890123', '2026-03-18', '2026-08-01'),
(9, '3VW2K7AJ5EM901234', '2026-06-10', NULL),
(10, 'JH4TB2H26CC012345', '2026-07-01', NULL);

SELECT * FROM CLIENTE;

SELECT * FROM DIRECCION;

SELECT * FROM REPARTIDOR;

SELECT * FROM VEHICULO;

SELECT * FROM PAQUETE;

SELECT * FROM REPARTIDOR_VEHICULO;

SELECT
    v.vin,
    v.marca,
    v.modelo,
    COUNT(px.no_seguimiento) AS cantidad_entregas,
    MIN(rv.fecha_asignacion) AS inicio_uso
FROM PAQUETE px
RIGHT JOIN REPARTIDOR r
    ON px.id_repartidor = r.id_repartidor
RIGHT JOIN REPARTIDOR_VEHICULO rv
    ON r.id_repartidor = rv.id_repartidor
RIGHT JOIN VEHICULO v
    ON rv.vin = v.vin
GROUP BY
    v.vin,
    v.marca,
    v.modelo
ORDER BY cantidad_entregas DESC
LIMIT 5;

USE new_schema2;
DELIMITER //
CREATE PROCEDURE SO ()
BEGIN
	SELECT * FROM clientes;
END //

