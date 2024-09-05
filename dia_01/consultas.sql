create database products;

create table fabricante(
	codigo int not null primary key,
	nombre varchar(100) not null
);

create table producto(
	codigo int not null primary key,
	nombre varchar(100) not null,
	precio double precision not null,
	codigo_fabricante int not null,
	foreign key(codigo_fabricante)
	references fabricante(codigo)
);

INSERT INTO fabricante (codigo, nombre) VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi'); 

INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapad 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3); 

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre,precio from producto;

-- 3. Lista todas las columnas de la tabla producto.
select column_name as columnas_producto
from information_schema.columns
where table_name   = 'producto';

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
create function to_euros(precio double precision)
returns double precision as $$
begin
	return precio * 0.90;
end;
$$ LANGUAGE plpgsql;
select nombre, to_euros(precio) as euros,precio as USD from producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre as nombre_de_producto, to_euros(precio) as euros,precio as dólares from producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre),precio from producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre),precio from producto;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, upper(substring(nombre from 1 for 2)) as letras
from fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio::numeric, 1)
from producto;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre,precio from producto;

-- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select fabricante.codigo from fabricante
inner join producto on producto.codigo_fabricante = fabricante.codigo
where producto.codigo_fabricante is not null
order by fabricante.codigo asc;

-- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select distinct fabricante.codigo from fabricante
inner join producto on producto.codigo_fabricante = fabricante.codigo
where producto.codigo_fabricante is not null
order by fabricante.codigo asc;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;

--14. Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre,precio from producto
order by nombre asc, precio desc;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante
fetch first 5 rows only;