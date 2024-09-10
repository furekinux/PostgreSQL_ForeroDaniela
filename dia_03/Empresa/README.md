<h1 align="center">Consultas</h1>

<h2>Consultas sobre una tabla</h2>
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

        select distinct codigo_cliente from pago
        where extract(year from fecha_pago) = '2008';
<p>Devuelve:</p>

         codigo_cliente 
        ----------------
                      1
                     13
                     14
                     26
        (4 rows)

  <li>Utilizando la función DATE_FORMAT de MySQL.</li>

        select distinct codigo_cliente from pago
        where to_char(fecha_pago,'yyyy')  = '2008';
<p>Devuelve:</p>

         codigo_cliente 
        ----------------
                      1
                     13
                     14
                     26
        (4 rows)
  <li>Sin utilizar ninguna de las funciones anteriores.</li>
  
        select distinct codigo_cliente  from pago
        where fecha_pago between '2008-01-01' and '2008-12-31';
<p>Devuelve:</p>

         codigo_cliente 
        ----------------
                      1
                     13
                     14
                     26
        (4 rows)

</ul>

<h3>9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.</h3>

<h3>10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.</h3>
<ul>
<li>Utilizando la función ADDDATE de MySQL.</li>
<li>Utilizando la función DATEDIFF de MySQL.</li>
<li>¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?</li>
</ul>
<h3>11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.</h3>
