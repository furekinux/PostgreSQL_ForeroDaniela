create table personas(
	nombre varchar(50) not null,
	apellido varchar(120) not null,
	municipio_nacimiento varchar(200) not null,
	municipio_domicilio varchar(200) not null
);

create table regiones(
	id_persona serial primary key,
	nombre varchar(50) not null,
	apellido varchar(120) not null,
	municipio_nacimiento varchar(200) not null,
	municipio_domicilio varchar(200) not null
);

SELECT * FROM pg_catalog.pg_tables;