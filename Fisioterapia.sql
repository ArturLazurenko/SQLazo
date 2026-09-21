CREATE TABLE `profesionales` (
  `id_profesional` int PRIMARY KEY,
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255),
  `tarjeta_profesional` varchar(255),
  `tipo_doc` varchar(255),
  `num_doc` int,
  `teléfono` int,
  `calle` varchar(255),
  `num_ext` int,
  `num_int` int,
  `colonia` varchar(255),
  `municipio` varchar(255),
  `estado` varchar(255),
  `cp` int,
  `profesion` varchar(255),
  `cargo` varchar(255)
);

CREATE TABLE `pacientes` (
  `id_paciente` int PRIMARY KEY,
  `nombre` varchar(255),
  `apellido_paterno` varchar(255),
  `apellido_materno` varchar(255),
  `tipo_doc` varchar(255),
  `num_doc` int,
  `fecha_nacimiento` date,
  `genero` varchar(255),
  `calle` varchar(255),
  `num_ext` int,
  `num_int` int,
  `colonia` varchar(255),
  `municipio` varchar(255),
  `estado` varchar(255),
  `cp` int,
  `telefono` int,
  `persona_contacto` varchar(255)
);

CREATE TABLE `historiales_clinicos` (
  `id_paciente` int PRIMARY KEY,
  `tipo_sangre` varchar(255),
  `factor_rh` varchar(255),
  `enfermedades` varchar(255),
  `antecedentes_personales` varchar(255),
  `antecedentes_familiares` varchar(255)
);

CREATE TABLE `paciente_ant_pers` (
  `id_paciente` int PRIMARY KEY,
  `enfermedad` varchar(255),
  `detalles` varchar(255)
);

CREATE TABLE `paciente_ant_fam` (
  `id_paciente` int,
  `parentesco` varchar(255),
  `nombre` varchar(255),
  `detalles` varchar(255),
  PRIMARY KEY (`id_paciente`, `parentesco`, `nombre`)
);

CREATE TABLE `paciente_ante_pers` (
  `id_paciente` int,
  `enfermedad` varchar(255),
  `detalles` varchar(255),
  PRIMARY KEY (`id_paciente`, `enfermedad`, `detalles`)
);

CREATE TABLE `citas` (
  `id_citas` int PRIMARY KEY,
  `id_paciente` int,
  `id_profesional` int,
  `fecha` date,
  `hora` time,
  `consultorio` varchar(255),
  `motivo` varchar(255),
  `tipo` varchar(255)
);

CREATE TABLE `valoraciones` (
  `id_valoracion` int,
  `id_paciente` int,
  `id_profesional` int,
  `estatura` float,
  `peso` float,
  `eval_estaticomorfologica` varchar(255),
  `eval_psicomotriz` varchar(255),
  `resultado_examenes` varchar(255),
  `diagnostico` varchar(255),
  `plan_intervencion` varchar(255),
  PRIMARY KEY (`id_valoracion`, `id_paciente`, `id_profesional`)
);

CREATE TABLE `terapias` (
  `id_terapia` int PRIMARY KEY,
  `id_paciente` int,
  `id_profesional_aut` int,
  `numero_sesiones` int,
  `tipo_tratamiento` varchar(255)
);

CREATE TABLE `brigadas` (
  `id_brigada` int PRIMARY KEY,
  `fecha` date,
  `comunidad` varchar(255),
  `id_profesional` int
);

CREATE TABLE `insumos` (
  `id_insumo` int PRIMARY KEY,
  `desc_insumo` varchar(255)
);

CREATE TABLE `insumos_brigadas` (
  `id_brigada` int,
  `id_insumo` int,
  PRIMARY KEY (`id_brigada`, `id_insumo`)
);

CREATE TABLE `personas_atendidas_brigadas` (
  `id_brigada` int,
  `id_paciente` int,
  PRIMARY KEY (`id_brigada`, `id_paciente`)
);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `historiales_clinicos` (`id_paciente`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente_ant_pers` (`id_paciente`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente_ant_fam` (`id_paciente`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente_ante_pers` (`id_paciente`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `citas` (`id_paciente`);

ALTER TABLE `profesionales` ADD FOREIGN KEY (`id_profesional`) REFERENCES `citas` (`id_profesional`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `valoraciones` (`id_paciente`);

ALTER TABLE `profesionales` ADD FOREIGN KEY (`id_profesional`) REFERENCES `valoraciones` (`id_profesional`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `terapias` (`id_paciente`);

ALTER TABLE `profesionales` ADD FOREIGN KEY (`id_profesional`) REFERENCES `terapias` (`id_profesional_aut`);

ALTER TABLE `profesionales` ADD FOREIGN KEY (`id_profesional`) REFERENCES `brigadas` (`id_profesional`);

ALTER TABLE `brigadas` ADD FOREIGN KEY (`id_brigada`) REFERENCES `insumos_brigadas` (`id_brigada`);

ALTER TABLE `insumos` ADD FOREIGN KEY (`id_insumo`) REFERENCES `insumos_brigadas` (`id_insumo`);

ALTER TABLE `brigadas` ADD FOREIGN KEY (`id_brigada`) REFERENCES `personas_atendidas_brigadas` (`id_brigada`);

ALTER TABLE `pacientes` ADD FOREIGN KEY (`id_paciente`) REFERENCES `personas_atendidas_brigadas` (`id_paciente`);
