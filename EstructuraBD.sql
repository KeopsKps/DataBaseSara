/*
Created		14/05/2019
Modified		18/07/2019
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/
USE master
GO
DROP DATABASE Destiny
GO
CREATE DATABASE Destiny
GO
USE Destiny
GO

Create table [Reservacion]
(
	[Id_reservacion] Integer NOT NULL identity(1,1),
	[FechaReservacion] Datetime NOT NULL,
	[Cedula] Varchar(20) NOT NULL,
	[IdChoferCoster] Integer NOT NULL,
Primary Key ([Id_reservacion])
) 
go

Create table [Tour_Nacional]
(
	[IdTour] Integer NOT NULL identity(1,1),
	[Hora_Salida] Datetime NOT NULL,
	[Hora_Regreso] Datetime NOT NULL,
	[Fecha_Tour] Datetime NOT NULL,
	[NombreTour] Varchar(50) NOT NULL,
	[Tipo_Tour] Nvarchar(50) NOT NULL,
	[Nombre_Institucion] Nvarchar(50) NULL,
Primary Key ([IdTour])
) 
go

Create table [Guia]
(
	[Id_Guia] Integer NOT NULL identity(1,1),
	[Nombre_Guia] Nvarchar(50) NOT NULL,
Primary Key ([Id_Guia])
) 
go

Create table [Cliente]
(
	[Correo_Electronico] Nvarchar(50) NOT NULL,
	[Cedula] Varchar(20) NOT NULL,
Primary Key ([Cedula])
) 
go

Create table [Hospedaje]
(
	[Id_hospedaje] Integer NOT NULL identity(1,1),
	[Nombre_Turista] Nvarchar(1) NOT NULL,
	[Numero_Habitacion] Integer NOT NULL,
	[Categoria] Char(50) NOT NULL,
	[Nombre_Hospedaje] Nvarchar(50) NOT NULL,
Primary Key ([Id_hospedaje])
) 
go

Create table [Actividad]
(
	[Descripcion] Nvarchar(100) NOT NULL,
	[Id_Act] int NOT NULL identity(1,1),
Primary Key ([Id_Act])
) 
go

Create table [Persona]
(
	[Cedula] Varchar(20) NOT NULL,
	[Nombre] VARCHAR(50) NOT NULL,
	[Sexo] BIT NOT NULL,
	[Edad] Char(3) NOT NULL,
	[Telefono] varchar(9) NOT NULL,
Primary Key ([Cedula])
) 
go

Create table [Tipo_servicio]
(
	[Id_servicio] Integer NOT NULL identity(1,1),
	[Nombre_Servicio] Nvarchar(50) NOT NULL,
	[IdPaqueteEuropa] Integer NULL,
	[IdSeguroViaje] Integer NULL,
	[IdPaqueteNacional] Integer NULL,
	[IdRentaVehiculo] Integer NULL,
	[IdTour] Integer NULL,
	[IdServicioHotel] Integer NULL,
	[IdBoleto] Integer NULL,
Primary Key ([Id_servicio])
) 
go

Create table [Paquete_Europa]
(
	[IdPaqueteEuropa] Integer NOT NULL identity(1,1),
Primary Key ([IdPaqueteEuropa])
) 
go

Create table [Hotel]
(
	[IdServicioHotel] Integer NOT NULL identity(1,1),
	[Fecha_Ingreso] Datetime NOT NULL,
	[Edad_Persona] Integer NOT NULL,
	[Fecha_Salida] Datetime NOT NULL,
	[Cantidad_Persona] Integer NOT NULL,
	[Fecha_Reserva] Datetime NOT NULL,
	[Tipo_Habitacion] Nvarchar(50) NOT NULL,
	[Numero_Habitacion] Integer NOT NULL,
	[Regimen] Nvarchar(50) NOT NULL,
Primary Key ([IdServicioHotel])
) 
go

Create table [Boleto_Aereo]
(
	[IdBoleto] Integer NOT NULL identity(1,1),
	[Destino] Nvarchar(50) NOT NULL,
	[Fecha_Ida] Datetime NOT NULL,
	[Tarifa] Float NOT NULL,
	[Fecha_Regreso] Datetime NOT NULL,
	[Linea_Aerea] Nvarchar(50) NOT NULL,
	[Cabina_Avion] Nvarchar(30) NOT NULL,
Primary Key ([IdBoleto])
) 
go

Create table [Paquete_Nacional]
(
	[IdPaqueteNacional] Integer NOT NULL identity(1,1),
Primary Key ([IdPaqueteNacional])
) 
go

Create table [Seguro_Viaje]
(
	[IdSeguroViaje] Integer NOT NULL identity(1,1),
	[Pasaporte] Nvarchar(50) NOT NULL,
	[Destino] Nvarchar(100) NOT NULL,
	[Fecha_Ida] Datetime NOT NULL,
	[Fecha_Regreso] Datetime NOT NULL,
	[ContactoEmergencia] Nvarchar(100) NOT NULL,
	[TelefonoEmergencia] Nvarchar(15) NOT NULL,
Primary Key ([IdSeguroViaje])
) 
go

Create table [Renta_Vehiculo]
(
	[IdRentaVehiculo] Integer NOT NULL identity(1,1),
	[Cantidad_dia] Integer NOT NULL,
	[Tipo_carro] Nvarchar(20) NOT NULL,
	[Fecha_renta] Datetime NOT NULL,
	[Fecha_devolucion] Datetime NOT NULL,
	[Placa] Nvarchar(20) NOT NULL,
Primary Key ([IdRentaVehiculo])
) 
go

Create table [Comida]
(
	[id_comida] Integer NOT NULL identity(1,1),
	[Tipo_Comida] Nvarchar(50) NOT NULL,
	[Cantidad_Plato] Integer NOT NULL,
	[Nombre_Plato] Nvarchar(50) NOT NULL,
Primary Key ([id_comida])
) 
go

Create table [Beneficio_Incluido]
(
	[id_beneficio] Integer NOT NULL identity(1,1),
	[Nombre_beneficio] Nvarchar(50) NOT NULL,
	[id_comida] Integer NULL,
	[Id_Act] Integer NULL,
	[IdTour] Integer NOT NULL,
	[Id_hospedaje] Integer NULL,
Primary Key ([id_beneficio])
) 
go

Create table [Acompanante]
(
	[id_acompanante] Integer NOT NULL identity(1,1),
	[Nombre_acompanante] Nvarchar(50) NOT NULL,
	[Cedula] Varchar(20) NULL
Primary Key ([id_acompanante])
) 
go

CREATE TABLE [AcompananteDeReserva](
	[Id_reservacion] Integer NOT NULL,
	[id_acompanante] Integer NOT NULL
)
go

Create table [ChoferCoster]
(
	[IdChoferCoster] Integer NOT NULL identity(1,1),
	[CedulaChofer] Varchar(16) NOT NULL,
	[NombreChofer] Varchar(50) NOT NULL,
	[CantidadCoster] Integer NOT NULL,
	[Capacidad] Integer NOT NULL,
Primary Key ([IdChoferCoster])
) 
go

Create table [Forma_Pago]
(
	[Id_FormaPago] Integer NOT NULL identity(1,1),
	[Tipo_Pago] Nvarchar(50) NOT NULL,
	[Cantidad_Depositada] Integer NOT NULL,
Primary Key ([Id_FormaPago])
) 
go

Create table [Idioma]
(
	[Id_Idioma] Integer NOT NULL identity(1,1),
	[Nombre_Idioma] Nvarchar(50) NOT NULL,
Primary Key ([Id_Idioma])
) 
go

Create table [Idioma_Manejado]
(
	[Id_Idioma] Integer NOT NULL,
	[Id_Guia] Integer NOT NULL
) 
go

Create table [Reservacion_FormaPago]
(
	[Id_reservacion] Integer NOT NULL,
	[Id_FormaPago] Integer NOT NULL
) 
go

Create table [Lugares]
(
	[Id_Lugar] Integer NOT NULL identity(1,1),
	[Nombre_Lugar] Nvarchar(100) NOT NULL,
Primary Key ([Id_Lugar])
) 
go

Create table [Lugar_Tour]
(
	[IdTour] Integer NOT NULL,
	[Id_Lugar] Integer NOT NULL
) 
go

Create table [ServiciosDeReservacion]
(
	[Id_reservacion] Integer NOT NULL,
	[FechaRealizacionServicio] Datetime NOT NULL,
	[Id_servicio] Integer NOT NULL,
Primary Key ([Id_reservacion],[Id_servicio])
) 
go

Create table [GuiaDeTour]
(
	[IdTour] Integer NOT NULL,
	[Id_Guia] Integer NOT NULL,
Primary Key ([IdTour],[Id_Guia])
) 
go


Alter table [Reservacion_FormaPago] add  foreign key([Id_reservacion]) references [Reservacion] ([Id_reservacion])  on update no action on delete no action 
go
Alter table [ServiciosDeReservacion] add  foreign key([Id_reservacion]) references [Reservacion] ([Id_reservacion])  on update no action on delete no action 
go
Alter table [Beneficio_Incluido] add  foreign key([IdTour]) references [Tour_Nacional] ([IdTour])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdTour]) references [Tour_Nacional] ([IdTour])  on update no action on delete no action 
go
Alter table [Lugar_Tour] add  foreign key([IdTour]) references [Tour_Nacional] ([IdTour])  on update no action on delete no action 
go
Alter table [GuiaDeTour] add  foreign key([IdTour]) references [Tour_Nacional] ([IdTour])  on update no action on delete no action 
go
Alter table [Idioma_Manejado] add  foreign key([Id_Guia]) references [Guia] ([Id_Guia])  on update no action on delete no action 
go
Alter table [GuiaDeTour] add  foreign key([Id_Guia]) references [Guia] ([Id_Guia])  on update no action on delete no action 
go
Alter table [Reservacion] add  foreign key([Cedula]) references [Cliente] ([Cedula])  on update no action on delete no action 
go
Alter table [AcompananteDeReserva] add foreign key([Id_reservacion]) references [Reservacion] (Id_reservacion) on update no action on delete no action
go
Alter table [AcompananteDeReserva] add foreign key([id_acompanante]) references [Acompanante] (id_acompanante) on update no action on delete no action

Alter table [Beneficio_Incluido] add  foreign key([Id_hospedaje]) references [Hospedaje] ([Id_hospedaje])  on update no action on delete no action 
go
Alter table [Beneficio_Incluido] add  foreign key([Id_Act]) references [Actividad] ([Id_Act])  on update no action on delete no action 
go
Alter table [Cliente] add  foreign key([Cedula]) references [Persona] ([Cedula])  on update no action on delete no action 
go
Alter table [ServiciosDeReservacion] add  foreign key([Id_servicio]) references [Tipo_servicio] ([Id_servicio])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdPaqueteEuropa]) references [Paquete_Europa] ([IdPaqueteEuropa])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdServicioHotel]) references [Hotel] ([IdServicioHotel])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdBoleto]) references [Boleto_Aereo] ([IdBoleto])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdPaqueteNacional]) references [Paquete_Nacional] ([IdPaqueteNacional])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdSeguroViaje]) references [Seguro_Viaje] ([IdSeguroViaje])  on update no action on delete no action 
go
Alter table [Tipo_servicio] add  foreign key([IdRentaVehiculo]) references [Renta_Vehiculo] ([IdRentaVehiculo])  on update no action on delete no action 
go
Alter table [Beneficio_Incluido] add  foreign key([id_comida]) references [Comida] ([id_comida])  on update no action on delete no action 
go
Alter table [Reservacion] add  foreign key([IdChoferCoster]) references [ChoferCoster] ([IdChoferCoster])  on update no action on delete no action 
go
Alter table [Reservacion_FormaPago] add  foreign key([Id_FormaPago]) references [Forma_Pago] ([Id_FormaPago])  on update no action on delete no action 
go
Alter table [Idioma_Manejado] add  foreign key([Id_Idioma]) references [Idioma] ([Id_Idioma])  on update no action on delete no action 
go
Alter table [Lugar_Tour] add  foreign key([Id_Lugar]) references [Lugares] ([Id_Lugar])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


