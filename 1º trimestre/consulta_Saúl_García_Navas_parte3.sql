use liga;
-- 1. Mostrar los datos de los partidos jugados en el mes de febrero.
select * from partido where fecha >= '2025-02-01' and fecha < '2025-03-01';
-- 2. Mostrar el nombre y apellido de cada jugador en una sola columna llamada “Nombre Completo”, en MAYÚSCULAS.
select upper(concat(nombre, ' ', apellido)) as 'Nombre Completo' from jugador;
-- 3. Mostrar los enlaces de las webs de los equipos que NO contengan “www”.
select web from equipo where web not like '%www%';
-- 4. Mostrar los datos de los equipos cuya web incluya la palabra “basket”.
select web from equipo where web like '%basket%';
-- 5. Mostrar los enlaces de las webs de los equipos pero sin “http://”.
select replace(web, 'http://','') from equipo;
-- 6. Consulta que devuelva esta frase:
-- “El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta”.
select concat('El jugador con nombre y apellido ', nombre, ' ', apellido, 'juega en la posición: ', posicion, '.') from jugador;
-- 7. Datos de los equipos cuyo nombre tenga 12 caracteres o menos.
select * from equipo where length(nombre) <= 12;
-- 8. Datos de los jugadores que fueron dados de alta en 2008 o 2011.
select * from jugador where extract(year from fecha_alta) = 2008 or extract(year from fecha_alta) = 2008;
-- 9. Mostrar un listado de las páginas web de los equipos pero cambiando “http://” por “https://”.
select replace(web, 'http://', 'https://') as web_segura from equipo;
-- 10. Mostrar el nombre del jugador y su nombre invertido.
select nombre, reverse(nombre) as erbmon from jugador;
-- 11. Mostrar el nombre de los equipos rellenado por la izquierda hasta 20 caracteres con ‘*’.
select lpad(nombre, 20, '*') as nombrev2 from equipo;
-- 12. Mostrar el apellido de los jugadores y sus 3 primeras letras.
select apellido, substr(apellido, 1, 3) as letras from jugador;
-- 13. Mostrar la posición en la que aparece la letra ‘a’ en el nombre del equipo.
select nombre, instr(nombre, 'a') as posicion from equipo;
-- 14. Mostrar el nombre del jugador y un campo que indique:
-- “Veterano” si fue dado de alta antes de 2010
-- “Moderno” si fue dado de alta a partir de 2010 (usar CASE)
select nombre,
case
    when extract(year from fecha_alta) < 2010 then 'Veterano'
    else 'Moderno'
end as clasificacion from jugador;
-- 15. Mostrar los jugadores cuyo apellido termina en “ez”.
select * from jugador where apellido like '%ez';
-- 16. Mostrar los equipos ordenados por la longitud de su nombre.
select nombre from equipo order by length(nombre) asc;
-- 17. Mostrar el nombre del jugador completamente en minúsculas.
select lower(nombre) as nombre_minus from jugador;
-- 18. Mostrar el nombre del jugador y las 2 primeras letras de su apellido.
select nombre, substr(apellido, 1, 2) as iniciales_apellido from jugador;
-- 19. Mostrar el nombre del jugador y el año en el que fue dado de alta
select nombre, extract(year from fecha_alta) as anio from jugador;
-- 20. Mostrar nombre y apellido en una sola columna separados por un guion.
select concat(nombre, '- ', apellido) as nombre_completo from jugador;