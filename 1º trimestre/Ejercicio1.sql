drop database if exists clientes;
create database clientes;
use clientes;

create table clientes(
	DNI int primary key auto_increment,
		apellidos varchar(50) not null,
		nombre varchar(50) not null,
		direccion varchar(100),
		fecha_nac int not null
);

create table producto(
		codigo int primary key auto_increment,
	precio_unit int not null,
    nombre varchar(50) not null,
    foreign key (clientes) references clientes(NIF)
);

create table proveedor(
		NIF int primary key auto_increment,
	direccion varchar(50) not null,
    nombre varchar(50) not null,
    foreign key (producto) references producto(codigo),
    foreign key (clientes) references clientes(DNI)
);