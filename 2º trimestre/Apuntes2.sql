 drop database if exists tienda_bloqueo;
 create database tienda_bloqueo;
 use tienda_bloqueo;
 
 create table productos(
	id int primary key,
    nombre varchar(100),
    stock int
);

insert into productos values 
(1,'Teclado',10),
(2,'Ratón',20),
(3,'Monitor',5);

-- 1.- NIVEL DE BLOQUEO: BLOQUEO DE TABLA
-- si una consola bloquea una tabla la otra no puede trabajar con ella hasta que se libere

start transaction;
-- Para que nadie pueda escribir;
lock table productos write;
update productos set stock = stock -1 where id = 1;
select * from productos;
unlock tables;
commit;

-- 2.- NIVEL DE BLOQUEO: BLOQUEO DE FILA 
-- Ahora no se bloquea todo, solo se bloquea una fila 
-- si bloqueas el producto 1, el producto 2 puedes modificarlo

start transaction;
update productos set stock = stock - 1 where id = 1;
commit;

-- 3.- TIPO DE BLOQUEO: BLOQUEO COMPARTIDO
-- varios pueden leer, nadie puede modificar mientras dure el bloqueo 

start transaction;
select * from productos where id = 1 lock in share mode; -- Complejo
-- has leído el producto 1, pero además lo dejas protegido para que nadie lo modifique

