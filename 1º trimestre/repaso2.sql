use TiendaTecnologia;

-- Relación de ejercicios 2

-- 1.- Listado con todos los productos, mostrando para cada uno el id_fab, el id_producto, la descripción y el precio.
select Id_fab, Id_producto, Descripcion, precio from productos;

-- 2.- Listado de todos los pedidos realizados por el cliente 2, extrayendo toda la información.
select * from Clientes where Id_cliente=2;

-- 3.- Consultar todos los datos de los productos de más de 100 €.
select * from productos where Precio > 100;

-- 4.- Listado de clientes de Madrid o Barcelona.
select * from clientes where ciudad = 'madrid' or 'barcelona';

-- 5.- Obtener el precio medio de los productos del fabricante con id_fab = '1'.
select avg(precio), Id_fab from Productos where Id_fab = 1;

-- 6.- Consultar la fecha del pedido más antiguo.
select min(Fecha_creacion) as pedido_más_antiguo from Pedidos;

-- 7.- Consultar los diferentes paises que existen en los fabricantes (sin repetir)
select distinct Pais from fabricantes;

-- 8.- Obtén los pedidos realizados entre el 1 de enero de 2024 y el 5 de febrero de 2024.
select * from Pedidos where Fecha_pedido between '2024-01-01' and '2024-02-05';

-- 9.- Muestra una lista de los clientes con su nombre completo (direccion + ciudad) concatenados en un solo campo.
select Nombre, concat(Ciudad,' ', Direccion) as direccion_y_ciudad from Clientes;

-- 10.- Muestra cuantos fabricantes hay en cada país
select Pais,count(Id_fab) as fabricas_por_pais from Fabricantes group by pais;

-- 11.- Muestra en otra columna llamada precio_con_iva todos los datos de los productos, suma el iva 21%.
select *, (Precio * 0.21) as precio_con_iva from Productos;

-- 12.- Producto más caro
select max(precio) as Producto_más_caro from Productos;

-- 13.- Cliente con más pedidos
select *, max(Id_cliente) as Cliente_con_más_pedidos from Pedidos;

-- 14.- Mostrar los productos ordenados por precio de mayor a menor
select * from Productos order by Precio desc;

-- 15.- Mostrar los clientes ordenados por ciudad alfabéticamente
select * from Clientes order by Ciudad;

-- 16.- Mostrar solo los 5 productos más baratos
select * from Productos order by Precio limit 5;

-- 17.- Mostrar cuántos productos hay por fabricante
select *, count(Id_fab) as productos_por_fabricante from Productos group by Id_fab;

-- 18.- Mostrar solo los fabricantes que tengan más de 1 producto
select *, count(Id_fab) as productos_por_fabricante from Productos group by Id_fab having count(Id_fab) > 1;

-- 19.- Mostrar clientes cuyo nombre empiece por “A”
select * from Clientes where Nombre like 'a%';

-- 20.- Mostrar productos cuyo nombre contenga la palabra “Portátil”
select * from Productos where Descripcion like '%Portátil%';

-- 21.- Convertir nombres de clientes a mayúsculas
select upper(Nombre) as nombre_en_mayusculas from Clientes;

-- 22.- Convertir descripciones de productos a minúsculas
select lower(descripcion) as descripciones_en_minúsculas from Productos;

-- 23.- Nombre + dirección en mayúsculas en una columna llamada "Nombre_Completo"
select *, concat(upper(Nombre),' ', upper(direccion)) as Nombre_Completo from Clientes;

-- 24.- Cambiar el formato de los nombres de productos para que comiencen con "Producto:" seguido de su descripción. Crear un alias Producto_Descripcion.
select *, concat('Producto:', descripcion) as Producto_Descripcion from productos;

-- 25.- Extraer las tres primeras letras del nombre de cada país  de fabricantes:
select Pais, substr(Pais,1,3) from fabricantes;

-- 26.- Reemplazar "Calle" por "Avda." en las direcciones de cliente
select replace(Direccion, 'Calle', 'Avda.') from clientes;

-- 27.- Calcular cuántos días han pasado desde cada pedido hasta hoy (función SYSDATE):
select n_pedido, datediff(sysdate(), fecha_pedido) from pedido;