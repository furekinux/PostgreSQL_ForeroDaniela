<h1 align="center">:electron:PostgreSQL🐘</h1>
<p>Es un motor de base de datos al igual que MySQL, es hijo de los conceptos planteados en ese mismo. pero es más es mas reciente que MySQL</p>
<h2>Características❕</h2>
<ul type="circle">
  <li>Open source</li>
  <li>Soporte estricto con normas(MySQL tiene menos)</li>
  <li>Soporte nativo para manejo de JSON</li>
  <li>Rendimiento óptimo para acciones complejas(no raáido)</li>
</ul>

<h2>No importa el entorno de desarrollo, solo importa❔</h2>
<ul>
  <li>La dirección IP</li>
  <li>El usuario</li>
  <li>La contraseña</li>
  <li>El esquema por defecto</li>
</ul>

<h2>Instalación de PostgreSQL⛓️</h2>
<p>Pàgina principal de PostgreSQL y click a <code>Download</code></p>
<ul type="123">
  <li>Ir a instaladores y elegir la versión 16.4.1</li>
  <li>Ejecutar archivo <code>setup</code></li>
  <li>Presionar next</li>
  <li>Ingresar contraseña(en este caso numero de identificación)</li>
  <li>Ingresar puerto (3306)</li>
  <li>No iniciar stack builder</li>
</ul>
<p>Agregar conexión</p>
<lu>
  <li>Abrir pgAdmin</li>
  <li>Registrar local</li>
  <li>Ingresar direccion IP: localhost</li>
  <li>Ingresar puerto: 5432</li>
  <li>Ingresar usuario: postgres</li>
  <li>Ingresar contraseña: campus2023</li>
</lu>
<p>Para ingresar desde terminal</p>
<ul>
  <li>Comando: <code>psql -U postgres</code></li>
  <code>En los computadores no debería ingresar por defecto dado que hay contraseña o está en seguro</code>
  <code>En el caso contrario, pedirá inmediatamente la contraseña</code>
</ul>
<p>Para Clever Cloud</p>
<ul>
  <li>Mismo proceso pero se elige PostgreSQL en lugar de MySQL</li>
  <li>Ingresar la nueva conexión como se mencionó en el segundo paso de <code>Agregar conexión</code> ⚠️Tiene distinto puerto⚠️</li>
</ul>

<h2>Comandos</h2>
<p>Para usar la base de datos, <b>SE MODIFICA LA CONEXIÓN EN DEFAULT SCHEMA DESPUÉS DE CREAR LA BASE DE DATOS.</b></p>


<h3>Crear base de datos:</h3>

```sql
create database databaseName;
```

<p>Ejemplo:</p>

```sql
create database testP1;
```


<h3>Crear tabla</h3>

```sql
create table persona(
  -- Atributos
)
```
<p>Ejemplo:</p>

```sql
create table persona(
  nombre varchar(100),
  apellido varchar(100)
);
```


<h3>Lectura de datos:</h3>

```sql
select * from table;
```
<p>Ejemplo:</p>

```sql
select * from persona;
```


<h3>Insertar datos:</h3>

```sql
insert into table(atribute1,atribute2) values(value1,value2);
```
<p>Ejemplo:</p>

```sql
insert into persona(nombre,apellido) values("Elsa","Pato");
```
