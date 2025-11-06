/*
PROVEEDOR(código, dirección, ciudad, provincia,)
PK(código)

PIEZA(código, nombre, color, precio)
PK(código)
id_categoría: FK de CATEGORIA (código)

CATEGORÍA (código, nombre)
PK(código)

PROVEEDOR_SISTEMA_PIEZA(id_proveedor, id_pieza, fecha, cantidad)
PK(id_proveedores, id_pieza, fecha)
id_proveedor: FK a PROVEEDOR(código)
id_pieza: FK a Pieza(codigo)

CATEGORIA(nombre, codigo)


*/
drop database if exists proveedores;
create database proveedores;
use proveedores;

create table proveedor(
	codigo int primary key auto_increment, 
		dirección varchar(150),
		ciudad varchar(20),
		provincia varchar(20)
);

create table categoria(
	codigo int primary key auto_increment,
		nombre varchar(100) not null
);

create table pieza(
	codigo int primary key auto_increment,
		nombre varchar(100) not null,
		color varchar(50),
		precio decimal(3,2),
			-- el (3,2) se refiere a los huecos que pueden ocupar los numeros en este caso _ _ _ (3), _ _ (2)
		categoria int,
		foreign key (categoria) references categoria(codigo)
);

create table proveedor_suministra_pieza(
		id_proveedor int,
		id_pieza int,
		cantida int not null,
		fecha int not null,
	primary key(id_proveedor, id_pieza, fecha),
		foreign key(id_proveedor) references proveedor(codigo),
		foreign key(id_pieza) references pieza(codigo)
);