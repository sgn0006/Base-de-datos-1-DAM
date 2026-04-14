drop database if exists tienda;
create database tienda;
use tienda;

create table fabricantes (
clave_fabricante int primary key,
nombre varchar(30)
);

create table articulos(
clave_articulo int auto_increment primary key,
nombre varchar(50),
precio decimal(8,2),
clave_fabricante int,
existencias int
);

set SQL_SAFE_UPDATES = 0;
alter table articulos add constraint fabricante_clave foreign key (clave_fabricante) references fabricantes(clave_fabricante);
show tables;
describe articulos;

insert into fabricantes (clave_fabricante, nombre) values 
(1 , 'Kingston'),
(2 , 'Adata'),
(3 , 'Logitech'),
(4 , 'Lexar'),
(5 , 'Seagate')
;

insert into articulos (nombre, precio, clave_fabricante, existencias) values 
('Teclado', 65.75, 3, 250),
('Disco duro 2 Tb', 250.50, 5, 275),
('Mouse', 37.75, 3, 300),
('Memoria USB', 14.50, 4, 25),
('Memoria RAM', 230.76, 1, 10),
('Disco duro extraíble 250 Gb', 350.00, 5, 30),
('Memoria USB', 29.75, 1, 120),
('DVD Rom', 25.40, 2, 56),
('CD Rom', 15.50, 2, 80),
('Tarjeta de red', 18.45, 3, 120)
;

insert into articulos (nombre, precio, clave_fabricante, existencias) values
('Altavoces', 120.00, 2, 9),
('Webcam', 89.90, 3, 15),
('SSD 1 Tb', 199.99, 5, 40)
;

update articulos set nombre = 'HD extraíble 250 Gb' where nombre = 'Disco duro extraíble 250 Gb';
update articulos set existencias = existencias + 5 where nombre = 'Memoria RAM';
update articulos set existencias = existencias - 20 where clave_fabricante = 3;
update articulos set precio = precio - (precio/10);
update articulos set precio = precio - (precio/10) where precio < 200;
update articulos set clave_fabricante = 1 where nombre = 'DVD Rom';
update articulos set  precio = 0 where precio < 20;

delete from articulos where nombre = 'CD Rom';
delete from articulos where existencias < 10;
delete from articulos where clave_fabricante = 4;
delete from fabricantes where nombre = 'Seagate';


SELECT *
FROM fabricantes;