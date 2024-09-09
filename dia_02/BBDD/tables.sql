create table personas(
	id_persona serial primary key,
	nombre text not null,
	apellido text not null,
	municipio_nacimiento text not null,
	municipio_domicilio text not null
);

create table regiones_departamento_municipios(
	id_regiones serial primary key,
	region text not null,
	departamento text not null,
	codigo_departamento text not null,
	municipio text not null,
	codigo_municipio text not null
);

create table regiones(
	id_region serial primary key,
	region text not null
);

create table departamentos(
	id_departamento serial primary key,
	id_region int references regiones(id_region),
	departamento text not null
);

create table municipios(
	id_municipio serial primary key,
	id_departamento int references departamentos(id_departamento),
	municipio text not null
);

SELECT * FROM pg_catalog.pg_tables;
