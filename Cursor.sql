--Cursor que muestre los empleados, cuantas veces ha alquilado peliculas,
--cuanto de ingresos y entregas de dicha pelicula
use Alquiler_Peliculas;
DECLARE Empleado_Peliculas  CURSOR   
     FOR select 
Empleado.Empleado_nombre as Nombre,
Empleado.Empleado_apellido as Apellido,
count(Alquiler.Aqluiler_id) as Cantidad_Alquileres,
sum (Alquiler.Costo_arriendo) as Ingresos,
count(Alquiler.Fecha_entrega_real) Entregas
from Empleado 
inner join Alquiler on Empleado.Empleado_id = Alquiler.Empleado_id
--inner join Pelicula on Pelicula.Aqluiler_id = Alquiler.Aqluiler_id
where Alquiler.Fecha_entrega_real>=Alquiler.Aqluiler_fecha_devolucion_estimada
group by Empleado.Empleado_nombre,Empleado.Empleado_apellido
--Abrir el cursor
open Empleado_Peliculas
--Recorrer cursor
fetch next from Empleado_Peliculas
--Cerrar cursor
close Empleado_Peliculas;




