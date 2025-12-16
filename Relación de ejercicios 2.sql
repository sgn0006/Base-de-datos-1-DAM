use TiendaTecnologia;
-- 1
select Id_producto, Id_fab, Descripcion,Precio 
from Productos;
-- 2
-- select * from Clientes 
select * from productos
where Id_cliente = 2;
-- 3
select * from Productos 
where Precio >= 100;
-- 4
select * from Clientes 
where Ciudad = 'Madrid' or Ciudad ='Barcelona';
-- Para simplificar
-- select * from clientes where ciudad in ('Madrid', 'Barcelona');
-- 5
select avg(Precio) 
from Productos 
where Id_fab  = 1;
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
select * from Pedidos;
select n_pedido, estado,
	case 
		when estado = 'completado' then 'Finalizado'
        when estado = 'cancelar' then 'Anulado'
	end as estado_personalizado
from pedidos;
-- 30
select * from Pedidos where year(Fecha_pedido) = 2023;
-- 31
select *, power(precio,2) as precio_elevado from productos;
-- 32 
select *, round(precio,1) as precio_redondeado from productos;
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
-- 38
select descripcion, precio,
	case 
		when precio >= 500
		then 'caro' 
        else 'barato'
	end as clasificacion
from productos;
-- 39
select id_producto, 
sum(cant) 
from detalles_pedido 
group by id_ptoducto 
having suma >=2;
-- 40 
insert into clientes (nombre, direccion, ciudad, teléfono, email) values ('Saúl García', 'Calle Huelma', '123456789', 'sgn0006@alu.medac.es');
select *from clientes;