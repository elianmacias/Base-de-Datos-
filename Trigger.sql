--trigger : cuando un cliente ha obtenido 2 atrasos, deniegue un nuevo alquiler para ese cliente.
use Alquiler_Peliculas;
create trigger Trigger_Atrasos
on Alquiler 
after insert
as
begin
declare @atrasos int
select @atrasos=count(Penalizacion.Penalizacion_Motivo) from Penalizacion 
inner join Alquiler on Penalizacion.Aqluiler_id=Alquiler.Aqluiler_id
where Penalizacion.Penalizacion_Motivo='Pelicula entregada despues de la fecha de entrga'
if(@atrasos=2)
	begin 
		raiserror('No se puede insertar un nuevo alquiler, debido a que el cliente ya registra la cantidad maxima de atrasos(2)',16,1)
		rollback 
	end
	end
go

insert into Alquiler(Cliente_id,Empleado_id,Aqluiler_id,Pelicula_id,Alquiler_fecha,Aqluiler_fecha_devolucion_estimada,Fecha_entrega_real,Costo_arriendo) 
values (2,5,7,3,'2021-07-25','2021-10-24','2021-10-25',35);