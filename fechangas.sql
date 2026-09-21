use new_schema2;

ALTER TABLE pedidos ADD COLUMN fecha_pedido datetime;

SELECT * from pedidos;

UPDATE pedidos SET fecha_pedido = '2026-09-04 15:20:14'
WHERE id_pedido = 101;

UPDATE pedidos SET fecha_pedido = '2026-09-05 13:24:14'
WHERE id_pedido = 102;

UPDATE pedidos SET fecha_pedido = '2026-09-06 20:10:56'
WHERE id_pedido = 103;

UPDATE pedidos SET fecha_pedido = now()
WHERE id_pedido = 104;

select * from pedidos;

SELECT 
	now() AS fecha_actual
    FROM dual;

SELECT 
	curdate() AS fecha_actual
    FROM dual;
    
SELECT 
	curtime() AS fecha_actual
    FROM dual;
    
    
SELECT 
    CURTIME() AS hora,
    CASE
        WHEN curtime() BETWEEN '09:00:00' AND '18:00:00' THEN 'Abierto'
        ELSE 'Cerrado'
    END AS disponibilidad
FROM dual;

SELECT 
	* FROM pedidos
    WHERE DATE(fecha_pedido) = '2026-09-05';
    
SELECT 
	EXTRACT(YEAR FROM NOW()) AS AÑO,
    EXTRACT(MONTH FROM NOW()) AS MES,
    EXTRACT(DAY FROM NOW()) AS DIA,
    EXTRACT(HOUR FROM NOW()) AS HORA,
    EXTRACT(MINUTE FROM NOW()) AS MINUTO,
    EXTRACT(SECOND FROM NOW()) AS SEGUNDO,
    EXTRACT(QUARTER FROM '2026-01-01') AS TRIMESTRE
    FROM dual;


SELECT * FROM products;
SELECT count(ID) FROM products;

SELECT 
    EXTRACT(YEAR FROM RegisterDate) AS año,
    EXTRACT(QUARTER FROM RegisterDate) AS trimestre,
    COUNT(*) AS productos
FROM products
GROUP BY EXTRACT(YEAR FROM RegisterDate), EXTRACT(QUARTER FROM RegisterDate)
ORDER BY año, trimestre;

SELECT 
	DATE(DATE_ADD(NOW(), INTERVAL 4 DAY)) AS prox_fin_de_semana,
    DATE(DATE_SUB(NOW(), INTERVAL 2 DAY)) AS fin_de_semana_ant
    FROM dual;
    
SELECT
	ID,
    ProductName,
	DATE(DATE_ADD(RegisterDate, INTERVAL 6 MONTH)) AS fecha_vencimiento
    FROM products;
    
SELECT 
	ID,
    ProductName,
	RegisterDate
    FROM products
    WHERE RegisterDate >= DATE_SUB(NOW(), INTERVAL 1 YEAR);
    
SELECT 
	DATEDIFF('2026-12-31', now()) AS dias_para_mi_cumpleaños
FROM dual;

SELECT
	ProductName,
    RegisterDate,
    DATEDIFF(now(), RegisterDate) as dias_registrado
    FROM products
    ORDER BY dias_registrado DESC;
    
SELECT 
	DATEDIFF(now(),'2006-12-31') AS dias_para_mi_cumpleaños
FROM dual;

SELECT
	DATE_FORMAT(NOW(),'%Y-%m-%d') as "yyyy-mm-dd",
    DATE_FORMAT(NOW(),'%d-%m-%y') as "dd-mm-yyyy",
    DATE_FORMAT(NOW(),'%d/%m/%Y %H:%i:%s') as "dd/mm/yyyy hh:mm:ss",
    DATE_FORMAT(NOW(),'%W %M %Y') as "nombre_dia nombre_mes yyyy",
    DATE_FORMAT(NOW(),'%Y%m') as "Año_mes",
    DATE_FORMAT(NOW(),'%b ''%y') as "nom_mes_abv yy"
    from dual;
    
SELECT MID(ProductName,1,17) as NOM_GENERICO
from products;

SELECT MID(ProductName,19,255) as producto 
FROM products;

SELECT SUBSTRING(ProductName,19) AS NOM_DIFFERENTE
FROM products;

SELECT * from products;

ALTER TABLE clientes ADD COLUMN EMAIL varchar(255);

UPDATE clientes SET EMAIL = 'ana@gmail.com' WHERE id_clientes = 1;
UPDATE clientes SET EMAIL = 'carlos@hotmail.com' WHERE id_clientes = 2;
UPDATE clientes SET EMAIL = 'beatris@yahoo.com' WHERE id_clientes = 3;
UPDATE clientes SET EMAIL = 'david@apple.com' WHERE id_clientes = 4;

SELECT EMAIL, 
SUBSTRING(EMAIL, INSTR(EMAIL,'.') + 1) AS DOMINIO
FROM clientes;

SELECT SUBSTRING(EMAIL,-3) AS com
FROM clientes;

SELECT 
	LOWER(ProductCode),
    UPPER(ProductName),
    UCASE(Category)
    from products;
    
SELECT * FROM pedidos;

SELECT id_clientes FROM clientes WHERE EMAIL LIKE '%GMAIL%';
    
SELECT *
FROM pedidos
WHERE cliente = (SELECT id_clientes 
				FROM clientes 
				WHERE EMAIL LIKE '%GMAIL%')
;

SELECT id_clientes FROM clientes WHERE EMAIL IS NOT NULL;

SELECT *
FROM pedidos
WHERE cliente IN (SELECT id_clientes FROM clientes WHERE EMAIL IS NOT NULL)
;

SELECT *
FROM clientes
WHERE 180 < ANY (SELECT MONTO FROM pedidos)
;

SELECT *
FROM clientes
WHERE EXISTS ( SELECT 1
				FROM pedidos
				WHERE monto > 180)
                ;
                
SELECT *
FROM clientes
WHERE 49 < ALL (
		SELECT monto
        FROM pedidos)
        ;
        
        
USE fisioterapia;
SELECT * FROM pacientes;


CREATE VIEW paciente_nom AS
SELECT id_paciente, 
concat(nombre,' ', apellido_paterno,' ', apellido_materno) AS Nombre
FROM pacientes;

SELECT * FROM paciente_nom;

CREATE VIEW paciente_cumple AS
SELECT  
concat(nombre,' ', apellido_paterno,' ', apellido_materno) AS Nombre,
fecha_nacimiento
FROM pacientes
WHERE estado = 'Queretaro';

SELECT * FROM paciente_cumple;

SELECT * FROM citas;

SELECT  
id_paciente,
concat(nombre,' ', apellido_paterno,' ', apellido_materno) AS Nombre,
telefono
FROM pacientes;


SELECT p.id_paciente, 
concat(p.nombre,' ', p.apellido_paterno,' ', p.apellido_materno) AS Nombre,
p.telefono,
count(c.id_citas) AS total_citas,
MAX(c.fecha) as ultima_fecha
FROM pacientes p
LEFT JOIN citas c
	ON c.id_paciente = p.id_paciente
GROUP BY p.id_paciente,
    p.nombre,
    p.apellido_paterno,
    p.apellido_materno,
    p.telefono
ORDER BY ultima_fecha
;

SELECT EXTRACT(MONTH FROM fecha_nacimiento) as mes, 
count(*) as cantidad,
group_concat(concat(nombre,' ', apellido_paterno) SEPARATOR ', ') as paciente
from pacientes 
group by EXTRACT(MONTH FROM fecha_nacimiento)
order by mes;

SELECT DATE_FORMAT(fecha,'%W, %d de %M de %Y') as fecha_completa,
DATE_FORMAT(hora,'%H:%i') as hora,
motivo
FROM citas;


SELECT GROUP_CONCAT('P-',UPPER(MID(nombre, 1,3)), 
	UPPER(MID(apellido_paterno,1,3)),
	DATE_FORMAT(fecha_nacimiento,'%y%m%d')) AS codigo_paciente,
	concat(nombre,' ', apellido_paterno,' ', apellido_materno) as nombre,
	fecha_nacimiento
from pacientes
group by id_paciente;

SELECT * FROM pacientes;
SELECT * FROM citas;
SELECT * FROM terapias;

SELECT t.tipo_tratamiento, 
t.numero_sesiones,
count(c.id_citas) as total_citas,
count(DISTINCT c.id_paciente) as pacientes_unicos
from terapias t
LEFT JOIN pacientes p ON t.id_paciente = p.id_paciente
LEFT JOIN citas c on p.id_paciente = c.id_paciente
group by 
t.tipo_tratamiento,
t.numero_sesiones
HAVING total_citas > 0
order by tipo_tratamiento desc
;