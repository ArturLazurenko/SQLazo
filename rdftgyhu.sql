CALL SO;

USE fisioterapia;
SELECT * FROM pacientes;

select nombre, 
fecha_nacimiento,
TIMESTAMPDIFF(YEAR,fecha_nacimiento,now()) as edad
from pacientes
having edad = 28;

DELIMITER //
CREATE PROCEDURE mostrarMSJ(msj varchar(40))
BEGIN
	set @var = msj;
	select @var AS mensaje;
END //
	DELIMITER;

DELIMITER //
CREATE PROCEDURE mostrarPacientes ()
BEGIN
	SELECT * FROM pacientes;
END //
delimiter;

DELIMITER //
CREATE PROCEDURE EDAD_PACIENTES (edadP int)
BEGIN
	select nombre, 
	fecha_nacimiento,
	TIMESTAMPDIFF(YEAR,fecha_nacimiento,now()) as edad
	from pacientes
    having edad = edadP;
END //
delimiter ;

DELIMITER //

CREATE PROCEDURE comparar_edad (IN edadP INT,IN sis VARCHAR(2))
BEGIN
    SELECT 
        nombre,
        fecha_nacimiento,
        TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
    FROM pacientes
    HAVING CASE sis
    WHEN '=' THEN edad = edadp
    WHEN '>' THEN edad > edadp
    WHEN '<' THEN edad < edadp
    WHEN '<=' THEN edad <= edadp
    WHEN '>=' THEN edad >= edadp
    else false
    end;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE comparar_edad2 (IN edad INT,IN operador VARCHAR(2))
BEGIN
	SET @sql = CONCAT('select nombre, 
	fecha_nacimiento,
	TIMESTAMPDIFF(YEAR,fecha_nacimiento,now()) as años_paciente
	from pacientes');
    SET @sql = CONCAT(@sql, ' HAVING años_paciente ', operador, ' ?');
    
    PREPARE stmt FROM @sql;
    SET @valor = edad;
    EXECUTE stmt USING @valor;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

call edad_pacientes(28);

CALL mostrarMSJ("	");

call mostrarPacientes;

call comparar_edad(25, '>');

call comparar_edad2(28,'>');

