use TiendaTecnologia;
-- 1
select Id_producto, Id_fab, Descripcion,Precio 
from Productos;
-- 2
select * from Clientes 
where Id_cliente = 2;
-- 3
select * from Productos 
where Precio >= 100;
-- 4
select * from Clientes 
where Ciudad = 'Madrid' or Ciudad ='Barcelona';
-- 5
select avg(Precio) 
from Productos 
where Id_fab  = '1';
-- 6
select min(Fecha_pedido) 
from Pedidos;
-- 7
select distinct Pais 
from Fabricantes;
-- 8
select * from Pedidos 
where Fecha_pedido 
between '2024-1-1' and '2024-2-5';
-- 9 
select concat(Nombre, Direccion, Ciudad) as Cosas_clientes 
from Clientes ;
-- 10
select Pais, count(*) 
from Fabricantes 
group by Pais;
-- 11
select *, (Precio * 1.21) as precio_con_iva 
from Productos;
-- 12
select max(Precio) from Productos;
-- 13
select Id_cliente, count(*) 
from Pedidos 
group by Id_cliente;
-- 14
select * from Productos 
order by Precio desc;
-- 15
select * from Clientes 
order by Ciudad;
-- 16 
select * from Productos 
order by Precio 
limit 5;
-- 17
select Id_fab, count(*) as NumeroFabricantes 
from Productos 
group by Id_fab;
-- 18
select Id_fab, count(*) as NumeroFabricantes 
from Productos 
group by Id_fab
having count(*) > 1;
-- 19
select Nombre from Clientes 
where Nombre 
like 'A%';
-- 20
select Descripcion from Productos 
where Descripcion 
like 'Portátil%';
-- 21 
select upper(Nombre) from Clientes as Nombre_mayusculas;
-- 22
select lower(Descripcion) from Productos as Descripcion_minuscula;
-- 23
select concat(upper(Nombre),
 upper(Direccion)) 
from Clientes as Nombre_mayusculas;
-- 24
select concat('Producto:', Descripcion) as Producto_Descripcion
from Productos;
-- 25
select substring(pais, 1, 3) as letras
from Fabricantes;
-- 26
select replace(Direccion, 'Calle', 'Avda.') as direccion
from Clientes;
-- 27
select N_pedido,
datediff(sysdate(), Fecha_pedido) 
from Pedidos;
-- 28
select N_pedido,Fecha_creacion,Fecha_pedido from Pedidos;
-- 29
-- select N_pedido,Estado, from Pedidos;
-- 30
select * from Pedidos where year(Fecha_pedido) = 2023;
-- 33
select N_pedido,year(Fecha_pedido)
from Pedidos;
-- 34
select count(*) from Pedidos
where year(Fecha_pedido) = 2024;
-- 35
select Nombre,
reverse(Nombre)
from Clientes;
-- 36
select Nombre,
length(nombre) 
from Clientes;
-- 37
select Nombre,
substring(Nombre, 1, 4) 
from Clientes;
-- 40
select Ciudad,
count(*)
from Clientes
group by Ciudad
having count(*) > 1;
