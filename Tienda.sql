CREATE TABLE `provedor` (
  `ProvedorID` varchar(255) PRIMARY KEY,
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255)
);

CREATE TABLE `producto` (
  `productoID` varchar(255) PRIMARY KEY,
  `nombre` varchar(255),
  `descripcion` text,
  `categoriaID` varchar(255),
  `ProvedorID` varchar(255)
);

CREATE TABLE `categoria` (
  `categoriaID` varchar(255) PRIMARY KEY,
  `nombre` varchar(255),
  `descripcion` varchar(255)
);

CREATE TABLE `empleados` (
  `empleadoID` varchar(255) PRIMARY KEY,
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255)
);

CREATE TABLE `ticket` (
  `ticketID` varchar(255) PRIMARY KEY,
  `clienteID` varchar(255),
  `empleadoID` varchar(255),
  `fecha` date,
  `hora` time,
  `lugar` varchar(255)
);

CREATE TABLE `detalle_ticket` (
  `ticketID` varchar(255),
  `productoID` varchar(255),
  PRIMARY KEY (`ticketID`, `productoID`)
);

CREATE TABLE `cliente` (
  `clienteID` varchar(255) PRIMARY KEY,
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255),
  `telefono` varchar(255)
);

ALTER TABLE `producto` ADD FOREIGN KEY (`ProvedorID`) REFERENCES `provedor` (`ProvedorID`);

ALTER TABLE `producto` ADD FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`categoriaID`);

ALTER TABLE `ticket` ADD FOREIGN KEY (`empleadoID`) REFERENCES `empleados` (`empleadoID`);

ALTER TABLE `ticket` ADD FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`clienteID`);

ALTER TABLE `detalle_ticket` ADD FOREIGN KEY (`ticketID`) REFERENCES `ticket` (`ticketID`);

ALTER TABLE `detalle_ticket` ADD FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`);
