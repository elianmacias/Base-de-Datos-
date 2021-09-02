--Un reporte en ireport que muestre el total del valor de todos los alquileres de las peliculas  alquiladas
--representado en un diagrama de barras
select 
p1.pelicula_titulo as pelicula ,
sum(a1.costo_arriendo) as total
from Pelicula as p1
inner join Alquiler  as a1 on p1.pelicula_id=a1.pelicula_id
group by pelicula
