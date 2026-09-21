CREATE TABLE alumnos (
	ID_matricula int PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    ap_paterno varchar(50) NOT NULL,
    ap_materno varchar(50) NOT NULL,
    nota float
);

DELIMITER //
CREATE TRIGGER trigger_check_nota_before_insert
	before insert ON alumnos FOR EACH ROW
BEGIN 
	if new.nota < 0 then 
		set new.nota = 0;
	ELSEIF new.nota > 10 then 
		SET new.nota = 10;
    END IF;
END //
DELIMITER ;
    
DELIMITER //
CREATE TRIGGER trigger_check_nota_before_update
	before update ON alumnos FOR EACH ROW
BEGIN 
	if new.nota < 0 then 
		set new.nota = 0;
	ELSEIF new.nota > 10 then 
		SET new.nota = 10;
    END IF;
END //
DELIMITER ;

INSERT INTO alumnos VALUES(1,'Pepe','Lopez','Lopez', -1);
INSERT INTO alumnos VALUES(2,'Maria','Sanchez','Sanchez', 11);
INSERT INTO alumnos VALUES(3,'Juan','Perez','Perez', 8.5);

SELECT * FROM alumnos;

UPDATE alumnos SET nota = -4 WHERE ID_matricula = 3;
UPDATE alumnos SET nota = 14 WHERE ID_matricula = 3;
UPDATE alumnos SET nota = 9.5 WHERE ID_matricula = 3;

DELIMITER //
CREATE PROCEDURE crear_email (
    IN nombre VARCHAR(50),
    IN ap_paterno VARCHAR(50),
    IN ap_materno VARCHAR(50),
    IN dominio VARCHAR(50),
    OUT email VARCHAR(255))
BEGIN
    SET email = CONCAT(
        LOWER(MID(nombre, 1, 1)),
        LOWER(MID(ap_paterno, 1, 3)),
        LOWER(MID(ap_materno, 1, 3)),
        '@',dominio,'.com'
    );
END //
DELIMITER ;

CALL crear_email('Artur','Lazurenko','Mannanov','Gmail', @correo);

select @correo;

ALTER TABLE alumnos ADD COLUMN email varchar(255);

DELIMITER //
CREATE TRIGGER trigger_crear_email_before_insert
	before insert ON alumnos FOR EACH ROW
BEGIN 
	if new.email is null then CALL crear_email(new.nombre,new.ap_paterno,new.ap_materno,'Gmail', @correo);
		set new.email = @correo;
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER trigger_crear_email_before_uptade
	before update ON alumnos FOR EACH ROW
BEGIN 
	if new.email is null then CALL crear_email(new.nombre,new.ap_paterno,new.ap_materno,'Gmail', @correo);
		set new.email = @correo;
    END IF;
END //
DELIMITER ;


UPDATE alumnos SET email = null WHERE ID_matricula = 1;

INSERT INTO alumnos VALUES(4,'Artur','Lazurenko','Mannanov', 10.0,null);

SELECT * FROM alumnos;
CREATE TABLE log_cambios_email (
    id int PRIMARY KEY AUTO_INCREMENT,
    id_alumno int,
    fecha_hora DATETIME,
    old_email varchar(50),
    new_email varchar(50)
);

DELIMITER //
CREATE TRIGGER trigger_guardar_email_after_update
    after update ON alumnos FOR EACH ROW
BEGIN 
    INSERT INTO log_cambios_email(id_alumno, fecha_hora,old_email, new_email) 
    VALUES(old.ID_matricula, now(), old.email, new.email);
END //
DELIMITER ;



UPDATE alumnos SET email = null WHERE ID_matricula = 2;
UPDATE alumnos SET email = null WHERE ID_matricula = 3;

UPDATE alumnos SET email = 'Juancito@yahoo.com' WHERE ID_matricula = 3;


SELECT * FROM log_cambios_email;