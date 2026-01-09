use TiendaTecnologia;
-- 1 Listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio.
select Id_producto, Id_fab, Descripcion,Precio 
from Productos;
-- 2 Listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
select * from productos
where Id_cliente = 2;
-- 3 Consultar todos los datos de los productos de más de 100 €.
select * from Productos 
where Precio >= 100;
-- 4 Listado de clientes de Madrid o Barcelona.
select * from Clientes 
where Ciudad = 'Madrid' or Ciudad ='Barcelona';
-- Para simplificar
-- select * from clientes where ciudad in ('Madrid', 'Barcelona');
-- 5 Obtener el precio medio de los productos del fabricante con id_fab = '1'.
select avg(Precio) 
from Productos 
where Id_fab  = 1;
-- 6 Consultar la fecha del pedido más antiguo.
select min(Fecha_pedido) 
from Pedidos;
-- 7 Consultar los diferentes paises que existen en los fabricantes (sin repetir)
select distinct Pais 
from Fabricantes;
-- 8 Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
select * from Pedidos 
where Fecha_pedido 
between '2024-1-1' and '2024-2-5';
-- 9 Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
select concat(Nombre, Direccion, Ciudad) as Cosas_clientes 
from Clientes ;
-- 10 Muestra cuantos fabricantes hay en cada país
select Pais, count(*) 
from Fabricantes 
group by Pais;
-- 11 Muestra en otra columna llamada precio_con_iva todos los datos de los productos, suma el iva 21%.
select *, (Precio * 1.21) as precio_con_iva 
from Productos;
-- 12 Producto más caro
select max(Precio) from Productos;
-- 13 Cliente con más pedidos
select Id_cliente, count(*) 
from Pedidos 
group by Id_cliente;
-- 14 Mostrar los productos ordenados por precio de mayor a menor
select * from Productos 
order by Precio desc;
-- 15 Mostrar los clientes ordenados por ciudad alfabéticamente
select * from Clientes 
order by Ciudad;
-- 16 Mostrar solo los 5 productos más baratos
select * from Productos 
order by Precio 
limit 5;
-- 17 Mostrar cuántos productos hay por fabricante
select Id_fab, count(*) as NumeroFabricantes 
from Productos 
group by Id_fab;
-- 18 Mostrar solo los fabricantes que tengan más de 1 producto
select Id_fab, count(*) as NumeroFabricantes 
from Productos 
group by Id_fab
having count(*) > 1;
-- 19 Mostrar clientes cuyo nombre empiece por “A”
select Nombre from Clientes 
where Nombre 
like 'A%';
-- 20 Mostrar productos cuyo nombre contenga la palabra “Portátil”
select Descripcion from Productos 
where Descripcion 
like 'Portátil%';
-- 21 Convertir nombres de clientes a mayúsculas
select upper(Nombre) from Clientes as Nombre_mayusculas;
-- 22 Convertir descripciones de productos a minúsculas
select lower(Descripcion) from Productos as Descripcion_minuscula;
-- 23 Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"
select concat(upper(Nombre),
 upper(Direccion)) 
from Clientes as Nombre_mayusculas;
-- 24 Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.
select concat('Producto:', Descripcion) as Producto_Descripcion
from Productos;
-- 25 Extraer las tres primeras letras del nombre de cada país  de fabricantes:
select substring(pais, 1, 3) as letras
from Fabricantes;
-- 26 Reemplazar "Calle" por "Avda." en las direcciones de cliente
select replace(Direccion, 'Calle', 'Avda.') as direccion
from Clientes;
-- 27 Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):
select N_pedido,
datediff(sysdate(), Fecha_pedido) 
from Pedidos; 
-- 28 Obtener la última fecha del mes en que se realizó cada pedido (función LAST_DAY):
select N_pedido,Fecha_creacion,Fecha_pedido from Pedidos;
-- 29 Asignar un estado personalizado a los pedidos dependiendo de su estado actual, 'Finalizado', 'Anulado' o 'En Gestión' (expresión CASE):
select * from Pedidos;
select n_pedido, estado,
	case 
		when estado = 'completado' then 'Finalizado'
        when estado = 'cancelar' then 'Anulado'
	end as estado_personalizado
from pedidos;
-- 30 Obtener los pedidos realizados en 2023.
select * from Pedidos where year(Fecha_pedido) = 2023;
-- 31 Elevar el precio de cada producto al cuadrado
select *, power(precio,2) as precio_elevado from productos;
-- 32 Redondear el precio de cada producto a 1 decimal
select *, round(precio,1) as precio_redondeado from productos;
-- 33 Extraer el año de las fechas de pedido:
select N_pedido,year(Fecha_pedido)
from Pedidos;
-- 34 Calcular cuántos pedidos se hicieron en un año específico (por ejemplo, 2024):
select count(*) from Pedidos
where year(Fecha_pedido) = 2024;
-- 35 Invertir el nombre de los clientes:
select Nombre,
reverse(Nombre)
from Clientes;
-- 36 Mostrar la longitud de cada nombre de cliente
select Nombre,
length(nombre) 
from Clientes;
-- 37 Mostrar solo los 4 primeros caracteres del nombre del cliente
select Nombre,
substring(Nombre, 1, 4) 
from Clientes;
-- 38 Mostrar “CARO” para productos => 500 o “BARATO” según el precio
select descripcion, precio,
	case 
		when precio >= 500
		then 'caro' 
        else 'barato'
	end as clasificacion
from productos;
-- 39 Cantidad total de productos vendidos por cada producto
select id_producto, 
sum(cant) 
from detalles_pedido 
group by id_ptoducto 
having suma >=2;
-- 40  Número de clientes por cada ciudad (Añade algo a la consulta para mostrar solo las ciudades que tengan más de un cliente)
insert into clientes (nombre, direccion, ciudad, teléfono, email) 
values ('Saúl García', 'Calle Huelma', '123456789', 'sgn0006@alu.medac.es');
select ciudad, count(*) as cantidad from clientes group by ciudad having cantidad >= 2;