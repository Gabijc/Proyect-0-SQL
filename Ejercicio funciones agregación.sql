
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
	select min("Milliseconds") as "Duracion_minima_pista"
	from "Track" t;
-- La duración mínima de las pistas es de 1.071 milisegundos.


-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
	select max("Milliseconds") as "Duracion_maxima_pista"
	from "Track" t;
-- La duración máxima de las pistas es de 5.286.953 milisegundos.


-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
	select min("UnitPrice") as "Precio_minimo" 
	from "Track" t;
  -- El precio mínimo de las pistas es de 0,99.
  

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
	select max("UnitPrice") as "Precio_maximo" 
	from "Track" t;
  -- El precio mínimo de las pistas es de 1,99.

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
	select min("InvoiceDate") as "Fecha_minima"
	from "Invoice" i; 

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
	select max("InvoiceDate") as "Fecha_maxima"
	from "Invoice" i; 

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
   select count("TrackId") as "Total_pistas"
   from "Track" t;
-- El número total de pistas es de 3.503.
  
  
-- Ejercicio 8: Contar el número de clientes en Brasil.
   select count("CustomerId") as "Clientes_Brasil"
   from "Customer" c
   where "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
  select sum("Milliseconds") as "duracion_total_pistas"
  from "Track" t;
 -- La duración total de todas  las pistas es de 1.378.778.040 milisegundos.

 
-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
    select count("EmployeeId") as "Numero_Sales_Support_Agent"
    from "Employee" e
    where "Title" = 'Sales Support Agent';

   
-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
    select sum("Total") as "Total_facturas"
    from "Invoice" i;
   -- El total de las facturas es de 2.328,6.

   
/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
    select round(avg("Milliseconds"), 2) as "Duracion_media_pistas"
    from "Track" t;
   -- La duración media de las pistas es milisegundos y redondeada a dos decimales es de 393.599,21 milisegundos.

   
-- Ejercicio 13: Calcular el precio medio de las pistas.
    select round(avg("UnitPrice"), 2) as "Precio_medio_pistas"
    from "Track" t;
   -- El precio medio de las pistas es de 1,05, redondeado a dos decimales.

   
-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
   select round(stddev("Milliseconds"), 2) as "Desviacion_pistas"
    from "Track" t;
   -- La desviación estándar de las pistas es de 535.005,44 milisegundos.
    

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
	select round(variance("Milliseconds"), 2) as "Varianza_pistas"
    from "Track" t;
   -- La varianza de las pistas es de 286230815700.63 milisegundos.

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
	select round(stddev("UnitPrice"), 2) as "Desviacion_precio_pistas"
    from "Track" t;
   -- La desviación estándar del precio de las pistas es de 0,24.

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select concat("FirstName", ' ', "LastName") as "Nombre_Cliente"
from "Customer" c ;

