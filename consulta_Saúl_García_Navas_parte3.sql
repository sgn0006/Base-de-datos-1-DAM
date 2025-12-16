use liga;
-- 1
select * from partido where fecha >= '2025-02-01' and fecha < '2025-03-01';
-- 2
select upper(concat(nombre, ' ', apellido)) as 'Nombre Completo' from jugador;
-- 3
select web from equipo where web not like '%www%';
-- 4
select web from equipo where web like '%basket%';
-- 5
select replace(web, 'http://','') from equipo;
-- 6 
select concat('El jugador con nombre y apellido ', nombre, ' ', apellido, 'juega en la posición: ', posicion, '.') from jugador;
-- 7
select * from equipo where length(nombre) <= 12;
-- 8
select * from jugador where extract(year from fecha_alta) = 2008 or extract(year from fecha_alta) = 2008;
-- 9
select replace(web, 'http://', 'https://') as web_segura from equipo;
-- 10
select nombre, reverse(nombre) as erbmon from jugador;
-- 11
select lpad(nombre, 20, '*') as nombrev2 from equipo;
-- 12
select apellido, substr(apellido, 1, 3) as letras from jugador;
-- 13
select nombre, instr(nombre, 'a') as posicion from equipo;
-- 14
select nombre,
case
    when extract(year from fecha_alta) < 2010 then 'Veterano'
    else 'Moderno'
end as clasificacion from jugador;
-- 15
select * from jugador where apellido like '%ez';
-- 16
select nombre from equipo order by length(nombre) asc;
-- 17
select lower(nombre) as nombre_minus from jugador;
-- 18
select nombre, substr(apellido, 1, 2) as iniciales_apellido from jugador;
-- 19
select nombre, extract(year from fecha_alta) as anio from jugador;
-- 20
select concat(nombre, '- ', apellido) as nombre_completo from jugador;