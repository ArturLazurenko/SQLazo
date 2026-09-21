USE new_schema2;

CREATE TABLE clientes (
    id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    cliente INT NULL,
    monto DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (cliente)
        REFERENCES clientes(id_clientes)
        ON DELETE SET NULL
);

INSERT INTO clientes (id_clientes, nombre) VALUES
(1, "Ana"),
(2, "Carlos"),
(3, "Beatris"),
(4, "David");

INSERT INTO pedidos (id_pedido, cliente, monto) VALUES
(101, "1", 150.00),
(102, "1", 200.00),
(103, "2", 50.00),
(104, null, 80.00);

SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT c.nombre,p.id_pedido, p.monto
FROM clientes c
 JOIN pedidos p ON c.id_clientes = p.cliente;
 
SELECT c.nombre,p.id_pedido, p.monto
FROM clientes c, pedidos p 
 WHERE c.id_clientes = p.cliente;
 
SELECT c.nombre,p.id_pedido, p.monto
FROM clientes c
 RIGHT JOIN pedidos p ON c.id_clientes = p.cliente;
 
SELECT c.nombre,p.id_pedido, p.monto
FROM clientes c
 RIGHT JOIN pedidos p ON c.id_clientes = p.cliente;
 
SELECT c.nombre,p.id_pedido, p.monto
FROM clientes c
left JOIN pedidos p ON c.id_clientes = p.cliente
UNION
SELECT c.nombre,p.id_pedido, p.monto
FROM clientes c
  JOIN pedidos p ON c.id_clientes = p.cliente;
  
  
  
SELECT c.nombre,p.id_pedido
FROM clientes c
  CROSS JOIN pedidos p
  ORDER BY c.nombre;
  
SELECT c.nombre,p.id_pedido
FROM clientes c
  CROSS JOIN pedidos p
  ORDER BY p.id_pedido;
  
  
CREATE TABLE proveedores (
    id_provedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

INSERT INTO proveedores (nombre) VALUES
('ALEJANDRO'),
('GABRIELA'),
('PAOLA'),
('DAVID');

SELECT * FROM clientes
UNION
SELECT * FROM proveedores;

SELECT * FROM clientes
UNION ALL
SELECT * FROM proveedores;

select * from pedidos
order by monto DESC
limit 2
offset 1;

SELECT p.cliente,
count(p.id_pedido) as pedidos,
sum(p.monto) as suma,
ROUND(avg(p.monto),2) as avg
from pedidos p
WHERE cliente IS NOT NULL
  GROUP BY p.cliente
  ORDER BY suma DESC;

SELECT * 
from pedidos 
where monto > 40;

SELECT cliente,
sum(monto) AS suma
from pedidos p
group by cliente
HAVING suma > 100 AND cliente is not null;

SELECT 
    c.nombre,
    SUM(p.monto) AS suma,
    CASE
        WHEN SUM(p.monto) > 300 THEN 'VIP'
        WHEN SUM(p.monto) BETWEEN 0 AND 300 THEN 'NORMAL'
        ELSE 'sin compras'
    END AS tipo_cliente
FROM clientes c LEFT JOIN pedidos p ON c.id_clientes = p.cliente
GROUP BY c.id_clientes, c.nombre
;
