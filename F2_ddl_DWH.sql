CREATE DATABASE seminariodos201503777;
use seminariodos201503777;


CREATE TABLE Dim_Proveedor(
	id_Proveedor int IDENTITY(1,1) primary key,
	CodProveedor varchar(200),
	NombreProveedor varchar(200),
	DireccionProveedor varchar(200),
	NumeroProveedor int,
	WebProveedor varchar(200)
);

CREATE TABLE Dim_Producto(
	id_Producto int IDENTITY(1,1) primary key,
	CodProducto varchar(200),
	NombreProducto varchar(200),
	MarcaProducto varchar(200),
	Categoria varchar(200)
);


CREATE TABLE Dim_Sucursal(
	id_Sucursal int IDENTITY(1,1) primary key,
	SodSuSursal varchar(200),
	NombreSucursal varchar(200),
	DireccionSucursal varchar(200)
);

CREATE TABLE Dim_Region(
	id_Region int IDENTITY(1,1) primary key,
	Region varchar(200),
	Departamento varchar(200)
);

CREATE TABLE Dim_Tiempo(
	/*id_Tiempo int IDENTITY(1,1) primary key,*/
	order_date date,
	Anio int,
	NombreMes varchar(200),
	Mes int,
	Semestre int,
	Dia int
);


CREATE TABLE Dim_Cliente(
	id_Cliente int IDENTITY(1,1) primary key,
	CodigoCliente varchar(200),
	NombreCliente varchar(200),
	TipoCliente varchar(200),
	DireccionCliente varchar(200),
	NumeroCliente int
);

CREATE TABLE Dim_Vendedor(
	id_Vendedor int IDENTITY(1,1) primary key,
	CodVendedor varchar(200),
	NombreVendedor varchar(200),
	Vacacionista int
);

CREATE TABLE Hecho_Compra(
	CodigoProveedor int FOREIGN KEY REFERENCES Dim_Proveedor(id_Proveedor),
	CodigoProducto int FOREIGN KEY REFERENCES Dim_Producto(id_Producto),
	CodigoSucursal int FOREIGN KEY REFERENCES Dim_Sucursal(id_Sucursal),
	CodigoRegion int FOREIGN KEY REFERENCES Dim_Region(id_Region),
	/*CodigoFecha int FOREIGN KEY REFERENCES Dim_Tiempo(id_Tiempo), */
	Fecha date, 
	Unidades int,
	CostoU float,
	primary key (CodigoProveedor, CodigoProducto, CodigoSucursal, CodigoRegion)
);


CREATE TABLE Hecho_Venta(
	CodigoCliente int FOREIGN KEY REFERENCES Dim_Cliente(id_Cliente),
	CodigoProducto int FOREIGN KEY REFERENCES Dim_Producto(id_Producto),
	CodigoSucursal int FOREIGN KEY REFERENCES Dim_Sucursal(id_Sucursal),
	CodigoVendedor int FOREIGN KEY REFERENCES Dim_Vendedor(id_Vendedor),
	CodigoRegion int FOREIGN KEY REFERENCES Dim_Region(id_Region),
	/*CodigoFecha int FOREIGN KEY REFERENCES Dim_Tiempo(id_Tiempo), */
	Fecha date,
	Unidades int,
	PrecioUnitario float,
	primary key (CodigoCliente, CodigoProducto, CodigoSucursal, CodigoVendedor, CodigoRegion)
);



insert into Dim_Tiempo(order_date,Anio,NombreMes,Mes,Semestre,Dia) select distinct C.Fecha,
	year(C.Fecha) as Anio,
	NombreMes=
		CASE 
			WHEN MONTH(C.Fecha)=1 then 'Enero'
			WHEN MONTH(C.Fecha)=2 then 'Fenrero'
			WHEN MONTH(C.Fecha)=3 then 'Marzo'
			WHEN MONTH(C.Fecha)=4 then 'Abril'
			WHEN MONTH(C.Fecha)=5 then 'Mayo'
			WHEN MONTH(C.Fecha)=6 then 'Junio'
			WHEN MONTH(C.Fecha)=7 then 'Julio'
			WHEN MONTH(C.Fecha)=8 then 'Agosto'
			WHEN MONTH(C.Fecha)=9 then 'Septiembre'
			WHEN MONTH(C.Fecha)=10 then 'Octubre'
			WHEN MONTH(C.Fecha)=11 then 'Noviembre'
			WHEN MONTH(C.Fecha)=12 then 'Diciembre'
			END,
		MONTH(C.Fecha) as Mes,
		Semestre=
			CASE 
				WHEN MONTH(C.Fecha)<7 then '1'
				ELSE '2'
				END,
		DAY(C.Fecha) as Dia
		from (SELECT Fecha FROM Hecho_Compra UNION SELECT Fecha FROM Hecho_Venta) as C;


use seminariodos201503777;
UPDATE Hecho_Compra SET CostoU =(CostoU/100);
UPDATE Hecho_Venta SET PrecioUnitario =(PrecioUnitario/100);



--LIMPIAR

use seminariodos201503777;
delete from Hecho_Compra;
delete from Hecho_Venta;
delete from Dim_Proveedor;
delete from Dim_Producto;
delete from Dim_Sucursal;
delete from Dim_Region;
delete from Dim_Tiempo;
delete from Dim_Cliente;
delete from Dim_Vendedor;

use bd1_201503777
delete from TemporalCompras;
delete from TemporalVentas;

use bd2_201503777;
delete from TemporalCompras;
delete from TemporalVentas;

--CONTADORES

use bd1_201503777;
select COUNT(*)  AS "TemporalCompras" from TemporalCompras;
select COUNT(*) AS "TemporalVentas" from TemporalVentas;

use bd2_201503777;
select COUNT(*)  AS "TemporalCompras" from TemporalCompras;
select COUNT(*) AS "TemporalVentas" from TemporalVentas;

use seminariodos201503777;
select COUNT(*) AS "Proveedores" from Dim_Proveedor;   330 -1
select COUNT(*) AS "Productos" from Dim_Producto;  69 
select COUNT(*) AS "Sucursal" from Dim_Sucursal;  120   -1 
select COUNT(*) AS "Region" from Dim_Region;  22
select COUNT(*) AS "Tiempo" from Dim_Tiempo;
select COUNT(*) AS "Clientes" from Dim_Cliente;
select COUNT(*) AS "Vendedores" from Dim_Vendedor;
select COUNT(*) AS "Hecho Compra" from Hecho_Compra;
select COUNT(*) AS "Hecho Ventas" from Hecho_Venta;

select * from Dim_Proveedor;
select * from Dim_Producto;
select * from Dim_Sucursal;
select * from Dim_Region;
select * from Dim_Tiempo;
select * from Dim_Cliente;
select * from Dim_Vendedor;
select * from Hecho_Compra;
select * from Hecho_Venta;