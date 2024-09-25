
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select 
	a."Title" as nombre_album,
	t."Name" as nombre_cancion
from "Album" as a
inner join "Track" as t
on a."AlbumId" = t."AlbumId" 
order by nombre_album;

-- Queremos conectar las tablas de AlbumId y TrackId. Se conectarán a través de AlbumId.


-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select 
	a2."Name" as Nombre_artista,
	a."Title" as Nombre_cancion
from "Album" as a
inner join "Artist" a2 
on a."ArtistId" = a2."ArtistId" 
order by Nombre_artista ;

-- Queremos conectar las tablas de AlbumId y ArtistId


-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select 
	concat(c."FirstName", ' ', c."LastName") as Nombre_cliente,
	i."Total" 
from "Customer" as c
inner join "Invoice" as i
on c."CustomerId" = i."CustomerId" 
order by i."Total" desc 
limit 5;
-- Queremos unir las tablas de Customer e Invoice

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select 
	concat(e."FirstName", ' ', e."LastName") as Nombre_empleado, 
	concat(c."FirstName", ' ', c."LastName") as Nombre_cliente 
from "Employee" as e
inner join "Customer" as c
on e."EmployeeId" = c."SupportRepId" 
order by Nombre_empleado;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select 
	il."InvoiceId" as "ID_factura",
	t."Name" as "Nombre_pista"
from "InvoiceLine" as il
inner join "Track" as t
on il."TrackId" = t."TrackId" ;

-- Queremos unir las tablas de TrackId con InvoicelineId.


-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select 
	a2."Name" as Nombre_artista,
	g."Name" as Nombre_genero
from "Track" as t
left join "Album" as a
	on t."AlbumId" = a."AlbumId" 
right join "Genre" as g
	on t."GenreId" = g."GenreId" 
left join "Artist" as a2
	on a."ArtistId" = a2."ArtistId" 
order by Nombre_artista;

-- Nos faltaría realizar un group by para poder unir directamente el artista con el nombre del género y que así no saliese repetido, pero no usamos funciones de agregación.


--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select 
	t."Name" as Nombre_pista,
	mt."Name" as Medio_disponible
from "MediaType" as mt 
inner join "Track" as t
on mt."MediaTypeId" = t."MediaTypeId" 
order by Medio_disponible;

-- Queremos unir las tablas de MediaType y Track. Las ordenamos en función del medio en el que están disponibles.


-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select 
	t."Name" as Nombre_pista,
	g."Name" as Genero_pista
from "Track" as t
left join "Genre" as g
	on t."GenreId" = g."GenreId" ;
-- No nos encontramos con ninguna pista que no tenga un género asignado. 

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

select 
	concat(c."FirstName", ' ', c."LastName") as Nombre_cliente,
	i."InvoiceId" as Numero_factura,
	i."InvoiceDate" 
from "Customer" as c
left join "Invoice" as i
	on c."CustomerId" = i."CustomerId" 
order by Nombre_cliente;

-- Para saber la factura correspondiente al cliente, al no tener un número de factura concreto, hemos usado el InvoiceId así como la fecha de la factura.


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select 
	a."Title" as Nombre_album,
	a2."Name" as Nombre_artista
from "Album" as a
left join "Artist" as a2
	on a."ArtistId" = a2."ArtistId" 
order by Nombre_artista;


-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select 
	g."Name" as Genero,
	count(t."TrackId") as Numero_pistas
from "Track" as t
inner join "Genre" as g
on t."GenreId" = g."GenreId" 
group by g."Name" 
order by Numero_pistas desc;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select 
	a."Title" as Titulo_album,
	sum(t."Milliseconds") as Duracion_pistas
from "Track" as t
inner join "Album" as a 
on t."AlbumId" = a."AlbumId" 
group by a."Title" 
order by Duracion_pistas desc;


-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select 
	concat(c."FirstName", ' ', c."LastName") as Nombre_cliente,
	sum(i."Total") as Gasto_total
from "Customer" as c
left join "Invoice" as i
	on c."CustomerId" = i."CustomerId" 
group by concat(c."FirstName", ' ', c."LastName") 
order by Gasto_total;


-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select 
	concat(e."FirstName", ' ', e."LastName") as Nombre_empleado,
	concat(c."FirstName", ' ', c."LastName") as Nombre_cliente
from "Customer" as c 
full join"Employee" as e 
	on c."SupportRepId" = e."EmployeeId"
order by Nombre_empleado;


