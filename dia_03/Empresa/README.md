<h1 align="center">Consultas PostgreSQL: Base de datos Empresa</h1>
<h2>Índice</h2>

- [Consultas sobre una tabla](#una_tabla)
- [Consultas multitabla (Composición interna)](#multi_tabla_comp_in)
- [Consultas multitabla (Composición externa)](#multi_tabla_comp_ex)
- [Consultas resumen](#resumen)

<h2 name="una_tabla">Consultas sobre una tabla</h2>
<h3>1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.</h3>

```sql
select ciudad, codigo_oficina
from oficina;
```
<p>Devuelve:</p>

```sql
        ciudad        | codigo_oficina 
----------------------+----------------
 Barcelona            | BCN-ES
 Boston               | BOS-USA
 Londres              | LON-UK
 Madrid               | MAD-ES
 Paris                | PAR-FR
 San Francisco        | SFC-USA
 Sydney               | SYD-AU
 Talavera de la Reina | TAL-ES
 Tokyo                | TOK-JP
(9 rows)
```


<h3>2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.</h3>

```sql
select ciudad, telefono
from oficina
where pais='España';
```
<p>Devuelve:</p>

```sql
        ciudad        |    telefono    
----------------------+----------------
 Barcelona            | +34 93 3561182
 Madrid               | +34 91 7514487
 Talavera de la Reina | +34 925 867231
(3 rows)
```

<h3>3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.</h3>

```sql
select nombre, apellido1,apellido2, email
from empleado
where codigo_jefe=7;
```
<p>Devuelve</p>

```sql
 nombre  | apellido1 | apellido2 |          email           
---------+-----------+-----------+--------------------------
 Mariano | López     | Murcia    | mlopez@jardineria.es
 Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es
 Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es
(3 rows)
```
<h3>4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.</h3>

```sql
select puesto, nombre, apellido1, apellido2, email
from empleado
where puesto='Director General';
```
<p>Devuelve</p>

```sql
      puesto      | nombre | apellido1 | apellido2 |        email         
------------------+--------+-----------+-----------+----------------------
 Director General | Marcos | Magaña    | Perez     | marcos@jardineria.es
(1 row)
```

<h3>5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.</h3>

```sql
select puesto, nombre, apellido1, apellido2, email
from empleado
where puesto!='Representante Ventas';
```
<p>Devuelve:</p>

```sql
        puesto         |  nombre  | apellido1  | apellido2 |           email           
-----------------------+----------+------------+-----------+---------------------------
 Director General      | Marcos   | Magaña     | Perez     | marcos@jardineria.es
 Subdirector Marketing | Ruben    | López      | Martinez  | rlopez@jardineria.es
 Subdirector Ventas    | Alberto  | Soria      | Carrasco  | asoria@jardineria.es
 Secretaria            | Maria    | Solís      | Jerez     | msolis@jardineria.es
 Director Oficina      | Carlos   | Soria      | Jimenez   | csoria@jardineria.es
 Director Oficina      | Emmanuel | Magaña     | Perez     | manu@jardineria.es
 Director Oficina      | Francois | Fignon     |           | ffignon@gardening.com
 Director Oficina      | Michael  | Bolton     |           | mbolton@gardening.com
 Director Oficina      | Hilary   | Washington |           | hwashington@gardening.com
 Director Oficina      | Nei      | Nishikori  |           | nnishikori@gardening.com
 Director Oficina      | Amy      | Johnson    |           | ajohnson@gardening.com
 Director Oficina      | Kevin    | Fallmer    |           | kfalmer@gardening.com
(12 rows)
```

<h3>6. Devuelve un listado con el nombre de los todos los clientes españoles.</h3>

```sql
select nombre_cliente
from cliente
where pais='Spain';
```
<p>Devuelve:</p>

```sql
         nombre_cliente         
--------------------------------
 Lasas S.A.
 Beragua
 Club Golf Puerta del hierro
 Naturagua
 DaraDistribuciones
 Madrileña de riegos
 Lasas S.A.
 Camunas Jardines S.L.
 Dardena S.A.
 Jardin de Flores
 Flores Marivi
 Flowers, S.A
 Naturajardin
 Golf S.A.
 Americh Golf Management SL
 Aloha
 El Prat
 Sotogrande
 Vivero Humanes
 Fuenla City
 Jardines y Mansiones Cactus SL
 Jardinerías Matías SL
 Agrojardin
 Top Campo
 Jardineria Sara
 Campohermoso
 Flores S.L.
(27 rows)
```
<h3>7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.</h3>

```sql
select distinct estado
from pedido;
```
<p>Devuelve:</p>

```sql
  estado   
-----------
 Entregado
 Pendiente
 Rechazado
(3 rows)
```
<h3>8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:</h3>
<ul type="circle">
  <li>Utilizando la función YEAR de MySQL.</li>

```sql
        select distinct codigo_cliente from pago
        where extract(year from fecha_pago) = '2008';
```
<p>Devuelve:</p>

```sql
 codigo_cliente 
----------------
               1
              13
              14
              26
(4 rows)
```
  <li>Utilizando la función DATE_FORMAT de MySQL.</li>

```sql
select distinct codigo_cliente from pago
where to_char(fecha_pago,'yyyy')  = '2008';
```
<p>Devuelve:</p>

```sql
 codigo_cliente 
----------------
               1
              13
              14
              26
(4 rows)
```
  <li>Sin utilizar ninguna de las funciones anteriores.</li>

```sql
select distinct codigo_cliente  from pago
where fecha_pago between '2008-01-01' and '2008-12-31';
```
<p>Devuelve:</p>

```sql
 codigo_cliente 
----------------
              1
             13
             14
             26
(4 rows)
```
</ul>

<h3>9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.</h3>

```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_esperada<fecha_entrega;
```
<h3>10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.</h3>
<ul>
<li>Utilizando la función ADDDATE de MySQL.</li>
        
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega  < date_add(fecha_esperada,'-2 days');
```
<p>Devuelve:</p>

```sql
 codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega 
---------------+----------------+----------------+---------------
            24 |             14 | 2008-07-31     | 2008-07-25
            30 |             13 | 2008-09-03     | 2008-08-31
            36 |             14 | 2008-12-15     | 2008-12-10
            53 |             13 | 2008-11-15     | 2008-11-09
            89 |             35 | 2007-12-13     | 2007-12-10
            93 |             27 | 2009-05-30     | 2009-05-17
(6 rows)
```
<li>Utilizando la función DATEDIFF de MySQL.</li>

```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where date_part('day',fecha_entrega::timestamp - fecha_esperada::timestamp) < -2;
```
<p>Devuelve:</p>

```sql
 codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega 
---------------+----------------+----------------+---------------
            24 |             14 | 2008-07-31     | 2008-07-25
            30 |             13 | 2008-09-03     | 2008-08-31
            36 |             14 | 2008-12-15     | 2008-12-10
            53 |             13 | 2008-11-15     | 2008-11-09
            89 |             35 | 2007-12-13     | 2007-12-10
            93 |             27 | 2009-05-30     | 2009-05-17
(6 rows)
```
<li>¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?</li>

```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_esperada - fecha_entrega > 2;
```
<p>Devuelve con resta:</p>

```sql
 codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega 
---------------+----------------+----------------+---------------
            24 |             14 | 2008-07-31     | 2008-07-25
            30 |             13 | 2008-09-03     | 2008-08-31
            36 |             14 | 2008-12-15     | 2008-12-10
            53 |             13 | 2008-11-15     | 2008-11-09
            89 |             35 | 2007-12-13     | 2007-12-10
            93 |             27 | 2009-05-30     | 2009-05-17
(6 rows)
```
</ul>
<h3>11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.</h3>

```sql
select *
from pedido
where extract(year from fecha_pedido)='2009' and estado='Rechazado';
```
<p>Devuelve:</p>

```sql
 codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega |  estado   |                               comentarios                                | codigo_cliente 
---------------+--------------+----------------+---------------+-----------+--------------------------------------------------------------------------+----------------
            14 | 2009-01-02   | 2009-01-02     |               | Rechazado | mal pago                                                                 |              7
            21 | 2009-01-09   | 2009-01-09     | 2009-01-09    | Rechazado | mal pago                                                                 |              9
            25 | 2009-02-02   | 2009-02-08     |               | Rechazado | El cliente carece de saldo en la cuenta asociada                         |              1
            26 | 2009-02-06   | 2009-02-12     |               | Rechazado | El cliente anula la operacion para adquirir mas producto                 |              3
            40 | 2009-03-09   | 2009-03-10     | 2009-03-13    | Rechazado |                                                                          |             19
            46 | 2009-04-03   | 2009-03-04     | 2009-03-05    | Rechazado |                                                                          |             23
            65 | 2009-02-02   | 2009-02-08     |               | Rechazado | El cliente carece de saldo en la cuenta asociada                         |              1
            66 | 2009-02-06   | 2009-02-12     |               | Rechazado | El cliente anula la operacion para adquirir mas producto                 |              3
            74 | 2009-01-14   | 2009-01-22     |               | Rechazado | El pedido no llego el dia que queria el cliente por fallo del transporte |             15
            81 | 2009-01-18   | 2009-01-24     |               | Rechazado | Los producto estaban en mal estado                                       |             28
           101 | 2009-03-07   | 2009-03-27     |               | Rechazado | El pedido fue rechazado por el cliente                                   |             16
           105 | 2009-02-14   | 2009-02-20     |               | Rechazado | el producto ha sido rechazado por la pesima calidad                      |             30
           120 | 2009-03-07   | 2009-03-27     |               | Rechazado | El pedido fue rechazado por el cliente                                   |             16
           125 | 2009-02-14   | 2009-02-20     |               | Rechazado | el producto ha sido rechazado por la pesima calidad                      |             30
(14 rows)
```
<h3>12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.</h3>

```sql
select *
from pedido
where extract(month from fecha_entrega)='01';
```
<p>Devuelve:</p>

```sql
 codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega |  estado   |                        comentarios                        | codigo_cliente 
---------------+--------------+----------------+---------------+-----------+-----------------------------------------------------------+----------------
             1 | 2006-01-17   | 2006-01-19     | 2006-01-19    | Entregado | Pagado a plazos                                           |              5
            13 | 2009-01-12   | 2009-01-14     | 2009-01-15    | Entregado |                                                           |              7
            15 | 2009-01-09   | 2009-01-12     | 2009-01-11    | Entregado |                                                           |              7
            16 | 2009-01-06   | 2009-01-07     | 2009-01-15    | Entregado |                                                           |              7
            17 | 2009-01-08   | 2009-01-09     | 2009-01-11    | Entregado | mal estado                                                |              7
            18 | 2009-01-05   | 2009-01-06     | 2009-01-07    | Entregado |                                                           |              9
            21 | 2009-01-09   | 2009-01-09     | 2009-01-09    | Rechazado | mal pago                                                  |              9
            22 | 2009-01-11   | 2009-01-11     | 2009-01-13    | Entregado |                                                           |              9
            32 | 2007-01-07   | 2007-01-19     | 2007-01-27    | Entregado | Entrega tardia, el cliente puso reclamacion               |              4
            55 | 2008-12-10   | 2009-01-10     | 2009-01-11    | Entregado | Retrasado 1 dia por problemas de transporte               |             14
            58 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                             |              3
            64 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                             |              1
            75 | 2009-01-11   | 2009-01-13     | 2009-01-13    | Entregado | El pedido llego perfectamente                             |             15
            79 | 2009-01-12   | 2009-01-13     | 2009-01-13    | Entregado |                                                           |             28
            82 | 2009-01-20   | 2009-01-29     | 2009-01-29    | Entregado | El pedido llego un poco mas tarde de la hora fijada       |             28
            95 | 2008-01-04   | 2008-01-19     | 2008-01-19    | Entregado |                                                           |             35
           100 | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                             |             16
           102 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Entregado | Pago pendiente                                            |             16
           103 | 2009-01-15   | 2009-01-20     | 2009-01-24    | Pendiente |                                                           |             30
           113 | 2008-10-28   | 2008-11-09     | 2009-01-09    | Rechazado | El producto ha sido rechazado por la tardanza de el envio |             36
           114 | 2009-01-15   | 2009-01-29     | 2009-01-31    | Entregado | El envio llego dos dias más tarde debido al mal tiempo    |             36
           119 | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                             |             16
           121 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Entregado | Pago pendiente                                            |             16
           123 | 2009-01-15   | 2009-01-20     | 2009-01-24    | Pendiente |                                                           |             30
(24 rows)
```
<h3>13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.</h3>

```sql
select *
from pago
where extract(year from fecha_pago)='2008' and forma_pago='PayPal'
order by total desc;
```
<p>Devuelve:</p>

```sql
 codigo_cliente | forma_pago | id_transaccion | fecha_pago |  total   
----------------+------------+----------------+------------+----------
             26 | PayPal     | ak-std-000020  | 2008-03-18 | 18846.00
             14 | PayPal     | ak-std-000015  | 2008-07-15 |  4160.00
             13 | PayPal     | ak-std-000014  | 2008-08-04 |  2246.00
              1 | PayPal     | ak-std-000001  | 2008-11-10 |  2000.00
              1 | PayPal     | ak-std-000002  | 2008-12-10 |  2000.00
(5 rows)
```
<h3>14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.</h3>

```sql
select distinct forma_pago
from pago;
```
<p>Devuelve:</p>

```sql
  forma_pago   
---------------
 Cheque
 Transferencia
 PayPal
(3 rows)
```
<h3>15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.</h3>

```sql
select *
from producto
where gama = 'Ornamentales' and cantidad_en_stock > 100
order by precio_venta desc;
```
<p>Devuelve:</p>

```sql
 codigo_producto |                    nombre                    |     gama     | dimensiones |    proveedor     |                                                                                                                                                                                descripcion                                                                                                                                                                                | cantidad_en_stock | precio_venta | precio_proveedor 
-----------------+----------------------------------------------+--------------+-------------+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------
 OR-115          | Forsytia Intermedia \"Lynwood\"              | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         7.00 |             5.00
 OR-116          | Hibiscus Syriacus  \"Diana\" -Blanco Puro    | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. |               120 |         7.00 |             5.00
 OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. |               120 |         7.00 |             5.00
 OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa        | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. |               120 |         7.00 |             5.00
 OR-124          | Prunus pisardii                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-125          | Viburnum Tinus \"Eve Price\"                 | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-126          | Weigelia \"Bristol Ruby\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-112          | Escallonia (Mix)                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-113          | Evonimus Emerald Gayeti                      | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-114          | Evonimus Pulchellus                          | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-120          | Lonicera Nitida                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-119          | Laurus Nobilis Arbusto - Ramificado Bajo     | Ornamentales | 40-50       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-121          | Lonicera Nitida \"Maigrum\"                  | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-122          | Lonicera Pileata                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
 OR-123          | Philadelphus \"Virginal\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           |               120 |         5.00 |             4.00
(15 rows)
```
<h3>16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.</h3>

```sql
select *
from cliente
where ciudad ='Madrid'
and codigo_empleado_rep_ventas = 11
or codigo_empleado_rep_ventas = 30;
```
<p>Devuelve:</p>

```sql
 codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto | telefono  |    fax    |   linea_direccion1    | linea_direccion2 |   ciudad    | region | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito 
----------------+-----------------------------+-----------------+-------------------+-----------+-----------+-----------------------+------------------+-------------+--------+-------+---------------+----------------------------+----------------
              7 | Beragua                     | Jose            | Bermejo           | 654987321 | 916549872 | C/pintor segundo      | Getafe           | Madrid      | Madrid | Spain | 28942         |                         11 |       20000.00
              8 | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810  | 919535678 | C/sinesio delgado     | Madrid           | Madrid      | Madrid | Spain | 28930         |                         11 |       40000.00
              9 | Naturagua                   | Guillermo       | Rengifo           | 689234750 | 916428956 | C/majadahonda         | Boadilla         | Madrid      | Madrid | Spain | 28947         |                         11 |       32000.00
             10 | DaraDistribuciones          | David           | Serrano           | 675598001 | 916421756 | C/azores              | Fuenlabrada      | Madrid      | Madrid | Spain | 28946         |                         11 |       50000.00
             11 | Madrileña de riegos         | Jose            | Tacaño            | 655983045 | 916689215 | C/Lagañas             | Fuenlabrada      | Madrid      | Madrid | Spain | 28943         |                         11 |       20000.00
             15 | Jardin de Flores            | Javier          | Villar            | 654865643 | 914538776 | C/ Oña 34             |                  | Madrid      | Madrid | Spain | 28950         |                         30 |       40000.00
             18 | Naturajardin                | Victoria        | Cruz              | 612343529 | 916548735 | Plaza Magallón 15     |                  | Madrid      | Madrid | Spain | 28011         |                         30 |        5050.00
             24 | Vivero Humanes              | Federico        | Gomez             | 654987690 | 916040875 | C/Miguel Echegaray 54 |                  | Humanes     | Madrid | Spain | 28970         |                         30 |        7430.00
             28 | Agrojardin                  | Benito          | Lopez             | 675432926 | 916549264 | C/Mar Caspio 43       |                  | Getafe      | Madrid | Spain | 28904         |                         30 |        8040.00
             31 | Campohermoso                | Luis            | Jimenez           | 645925376 | 916159116 | C/Peru 78             |                  | Fuenlabrada | Madrid | Spain | 28945         |                         30 |        3250.00
(10 rows)
```
<h2 name="multi_tabla_comp_in">Consultas multitabla (Composición interna)</h2>
<p>Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.</p>
<h3>1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
 
<h2 name="multi_tabla_comp_ex">Consultas multitabla (Composición externa)</h2>
<p>Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.</p>
<h3>1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>8. Devuelve un listado de los productos que nunca han aparecido en un pedido.</h3>

```sql
```
<p>Devuelve:</p>

```sql
```
<h3>9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.</h3>
    
```sql
```
<p>Devuelve:</p>

```sql
```
<h3>10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.</h3>
    
```sql
```
<p>Devuelve:</p>

```sql
```
<h3>11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.</h3>
    
```sql
```
<p>Devuelve:</p>

```sql
```
<h3>12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.</h3>
    
```sql
```
<p>Devuelve:</p>

```sql
```

<h2 name="resumen">Consultas resumen</h2>
<h3>1. ¿Cuántos empleados hay en la compañía?</h3>

<h3>2. ¿Cuántos clientes tiene cada país?</h3>

<h3>3. ¿Cuál fue el pago medio en 2009?</h3>

<h3>4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.</h3>

<h3>5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.</h3>

<h3>6. Calcula el número de clientes que tiene la empresa.</h3>

<h3>7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?</h3>

<h3>8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?</h3>

<h3>9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.</h3>

<h3>10. Calcula el número de clientes que no tiene asignado representante de ventas.</h3>

<h3>11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.</h3>

12. Calcula el número de productos diferentes que hay en cada uno de los
pedidos.
13. Calcula la suma de la cantidad total de todos los productos que aparecen en
cada uno de los pedidos.
14. Devuelve un listado de los 20 productos más vendidos y el número total de
unidades que se han vendido de cada uno. El listado deberá estar ordenado
por el número total de unidades vendidas.
15. La facturación que ha tenido la empresa en toda la historia, indicando la
base imponible, el IVA y el total facturado. La base imponible se calcula
sumando el coste del producto por el número de unidades vendidas de la
tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
suma de los dos campos anteriores.
16. La misma información que en la pregunta anterior, pero agrupada por
código de producto.
17. La misma información que en la pregunta anterior, pero agrupada por
código de producto filtrada por los códigos que empiecen por OR.
18. Lista las ventas totales de los productos que hayan facturado más de 3000
euros. Se mostrará el nombre, unidades vendidas, total facturado y total
facturado con impuestos (21% IVA).
19. Muestre la suma total de todos los pagos que se realizaron para cada uno
de los años que aparecen en la tabla pagos.
Subconsultas
Con operadores básicos de comparación
1. Devuelve el nombre del cliente con mayor límite de crédito.
2. Devuelve el nombre del producto que tenga el precio de venta más caro.
3. Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido)

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
realizado. (Sin utilizar INNER JOIN).
5. Devuelve el producto que más unidades tiene en stock.
6. Devuelve el producto que menos unidades tiene en stock.
7. Devuelve el nombre, los apellidos y el email de los empleados que están a
cargo de Alberto Soria.
Subconsultas con ALL y ANY
8. Devuelve el nombre del cliente con mayor límite de crédito.
9. Devuelve el nombre del producto que tenga el precio de venta más caro.
10. Devuelve el producto que menos unidades tiene en stock.
Subconsultas con IN y NOT IN
11. Devuelve el nombre, apellido1 y cargo de los empleados que no
representen a ningún cliente.
12. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.
13. Devuelve un listado que muestre solamente los clientes que sí han realizado
algún pago.
14. Devuelve un listado de los productos que nunca han aparecido en un
pedido.
15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.
16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.
17. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.
18.

Subconsultas con EXISTS y NOT EXISTS
18. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.
19. Devuelve un listado que muestre solamente los clientes que sí han realizado
algún pago.
20. Devuelve un listado de los productos que nunca han aparecido en un
pedido.
21. Devuelve un listado de los productos que han aparecido en un pedido
alguna vez.
Subconsultas correlacionadas
Consultas variadas
1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
han realizado ningún pedido.
2. Devuelve un listado con los nombres de los clientes y el total pagado por
cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
realizado ningún pago.
3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
ordenados alfabéticamente de menor a mayor.
4. Devuelve el nombre del cliente, el nombre y primer apellido de su
representante de ventas y el número de teléfono de la oficina del
representante de ventas, de aquellos clientes que no hayan realizado ningún
pago.
5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
nombre y primer apellido de su representante de ventas y la ciudad donde
está su oficina.
6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
número de empleados que tiene.
