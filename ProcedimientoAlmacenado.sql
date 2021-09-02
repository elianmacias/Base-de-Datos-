--Procedimiento almacenado:
--Parametro entrada: Pelicula nombre 
--Muestre todos los clientes con la fecha en que la alquilo.
create procedure Peliculas
@Pelicula_titulo as varchar(50)
as
select
Pelicula.Pelicula_titulo as Pelicula,
Cliente.Cliente_nombre as Nombre,
Cliente.Cliente_Apellido AS Apellido,
Alquiler.Alquiler_fecha as Fecha_de_Alquiler
from Pelicula 
inner join Alquiler on Pelicula.Pelicula_id = Alquiler.Pelicula_id
inner join Cliente on Cliente.Cliente_id = Alquiler.Cliente_id
where Pelicula.Pelicula_titulo = @Pelicula_titulo



Execute Peliculas "The Avengers" ;

