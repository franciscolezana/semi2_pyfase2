CREATE DATABASE bd1_201503777;
USE bd1_201503777

CREATE TABLE TemporalCompras (
	Fecha varchar(200),
	CodProveedor varchar(200),
	NombreProveedor varchar(200),
	DireccionProveedor varchar(200),
	NumeroProveedor varchar(200),
	WebProveedor varchar(200),
	CodProducto varchar(200),
	NombreProducto varchar(200),
	MarcaProducto varchar(200),
	Categoria varchar(200),
	SodSuSursal varchar(200), 
	NombreSucursal varchar(200),
	DireccionSucursal varchar(200),
	Region varchar(200),
	Departamento varchar(200),
	Unidades varchar(200),
	CostoU varchar(200),
);

CREATE TABLE TemporalVentas (
	Fecha varchar(200),
	CodigoCliente varchar(200),
	NombreCliente varchar(200),
	TipoCliente varchar(200),
	DireccionCliente varchar(200),
	NumeroCliente varchar(200),
	CodVendedor varchar(200),
	NombreVendedor varchar(200),
	Vacacionista varchar(200),
	CodProducto varchar(200),
	NombreProducto varchar(200),
	MarcaProducto varchar(200),
	Categoria varchar(200),
	SodSuSursal varchar(200),
	NombreSucursal varchar(200),
	DireccionSucursal varchar(200),
	Region varchar(200),
	Departamento varchar(200),
	Unidades varchar(200),
	PrecioUnitario varchar(200)
	);

