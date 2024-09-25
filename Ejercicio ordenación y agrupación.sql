
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select "Title"
from "Album" a
order by "Title" ;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select 
	"AlbumId" ,
	count("TrackId") as numero_canciones_album
from "Track" t 
group by "AlbumId" 
order by numero_canciones_album desc;
-- El álbum con el mayor número de canciones es el albúm numero 141 con 57 canciones. El álbum se llama Greatest Hits

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select 
	"Composer",
	round(avg("Milliseconds"), 2) as duracion_media_canciones,
	round(variance("Milliseconds"), 2) as varianza_canciones,
	round(stddev("Milliseconds"), 2) as "desviacion_canciones" 
from "Track" t 
group by "Composer" ;
/**
 Esta query nos va a devolver una tabla en la que se nos indica el compositor en la primera columna, y en las columnas adyacentes la media,
  la varianza, y la desviación típica de la duración de sus canciones.
 **/

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select 
	"Name",
	"UnitPrice" 
from "Track" t 
limit 10 ;
   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select 
	"EmployeeId", 
	concat("FirstName", ' ', "LastName")
from "Employee" e 
order by "EmployeeId" desc;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
select count("Name") numero_generos
from "Genre" g ;
-- Hay 25 géneros musciales diferentes.

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select 
	concat("FirstName", ' ', "LastName") as nombre_cliente,
	"Country" 
from "Customer" c 
order by nombre_cliente
limit 5;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select 
	 "Country" ,
	 count("CustomerId")
from "Customer" c 
group by "Country" ;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
select 
	"BillingCountry" ,
	sum("Total") as total_pais
from "Invoice" i 
group by "BillingCountry" 
having sum("Total") > 10000;
-- Esta query no nos va a devolver nada, ya que en ningún país nos encontramos con facturas que sumen un importe superior a 10.000.


-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select 
	"Country" ,
	count("CustomerId") as numero_clientes
from "Customer" c 
group by "Country" 
having count("CustomerId") > 5;
-- Solo tenemos países con más de 5 clientes en USA y Canadá.


-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
select 
	"MediaTypeId" ,	
	count("TrackId") as numero_pistas
from "Track" t 
group by "MediaTypeId" 
having sum("Milliseconds") > 250000;

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
select 
	"Country" ,
	count("CustomerId") as Numero_clientes_asistidos
from "Customer" c 
where "SupportRepId" < 5
group by "Country" 
order by Numero_clientes_asistidos;


-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
select 
	count("CustomerId") as numero_compras,
	"BillingPostalCode" 
from "Invoice" i 
group by "BillingPostalCode" ;
 

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select 
	"MediaTypeId" ,
	count("TrackId")
from "Track" t 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000
group by "MediaTypeId" ;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
select 
	concat("FirstName", ' ', "LastName") as Nombre_cliente,
	"State" as Estado,
	"CustomerId",
	"SupportRepId" 
from "Customer" c 
where "SupportRepId" > 3 and "Company" is not Null;