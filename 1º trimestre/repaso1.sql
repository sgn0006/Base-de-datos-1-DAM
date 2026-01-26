use liga;

-- PRIMERA RELACIÓN

-- 1.- Obtener los datos de los jugadores del equipo 3 ordenados por su apellido.
select * from jugador where equipo = 3 order by apellido;

-- 2.- Jugadores que sean escolta o alero
select * from jugador where posicion = 'escolta' or 'alero';

-- 3.- Jugadores con salarios entre 60.000 y 100.000
select * from jugador where salario between 60000 and 100000;

-- 4.- Obtener los datos de los jugadores que sean pívot ordenados por su identificador.
select * from jugador where posicion = 'pívot' order by id_jugador;

-- 5.- Seleccionar los datos de los jugadores que midan más de dos metros y ganen al menos 50.000 euros.
select * from jugador where altura >= 2 and salario > 50000;

-- 6.- Seleccionar el nombre de los jugadores que jueguen como pívot y ganen más de 100.000 euros.
select nombre,salario from jugador where posicion = 'pívot' and salario >100000;

-- 7.- Seleccionar el nombre de los jugadores de los equipos 1 y 2 que jueguen como base.
select nombre,equipo,posicion from jugador where equipo in (1,2) and posicion = 'base';

-- 8.- Seleccionar los datos de jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes.
select * from jugador where equipo in (1,2) and salario > 80000;

-- 9.- Listar las posiciones diferentes que pueden ocupar los jugadores en la liga.
select distinct posicion from jugador;

-- 10.- Mostrar todos los datos de los 5 jugadores más altos.
select * from jugador where altura order by altura desc limit 5;

-- 11.- Calcular en una columna llamada SALARIO NETO ANUAL el sueldo neto de cada jugador sabiendo que el IRPF del 18% deja un 82% del salario bruto.
select *, (salario * 0.82) as SALARIO_NETO_ANUAL from jugador;

-- 12.- Seleccionar los datos de los jugadores cuyo salario neto anual sea al menos 70.000 euros.
select * from jugador where (salario * 0.82) >= 70000 ;

-- 13.- Jugadores sin posición asignada (NULL)
select * from jugador where posicion is null;

-- 14.- Partidos jugados antes de 2012
select * from partido where fecha < '2012-01-01';
 
-- 15.- Jugadores que midan más de 1.90 y cobren más de 100.000
select * from jugador where altura > 1.90 and salario > 100000;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SEGUNDA RELACIÓN

-- 1.- Calcular el salario medio de todos los jugadores.
select avg(salario) from jugador;

-- 2.- Mostrar el id del equipo y la suma de las alturas de sus jugadores cuando esta suma supere los 5 metros.
select equipo, sum(altura) as sumaaltura from jugador group by equipo having sum(altura) > 5;

-- 3.- Calcular cuántos jugadores miden más de dos metros.
select count(id_jugador) as mas_dos_metros from jugador where altura > 2;

-- 4.- Mostrar para cada equipo cuántos jugadores están asignados a cada posición.
select equipo,posicion,count(*) as numero_de_posiciones from jugador group by equipo,posicion;

-- 5.- Mostrar el id del equipo y el salario total de cada equipo, pero solo para los equipos que tengan más de 4 jugadores registrados.
select equipo, sum(salario) as salario_total from jugador group by equipo having (count(*) > 4);

-- 6.- Calcular cuántas ciudades distintas tienen equipos registrados.
select  id_equipo, count(distinct ciudad)as cuidad_equipo from equipo group by id_equipo;

-- 7.- Mostrar para cada equipo el salario más alto, el más bajo y la diferencia entre ambos.
select equipo,max(salario) as salario_maximo, min(salario) as salario_minimo, max(salario) - min(salario) as diferencia_salario from jugador group by equipo ;

-- 8.- Seleccionar el salario medio de cada equipo, pero únicamente para los equipos cuya media sea superior a 100000.
select equipo, avg(salario) as media_salario from jugador group by equipo having avg(salario) > 100000;

-- 9.- Número de jugadores por equipo
select equipo,count(id_jugador) as numero_jugadores from jugador group by equipo;

-- 10.- Altura media por equipo
select equipo, avg(altura) as altura_media from jugador group by equipo;

-- 11.- Salario total por equipo
select equipo, sum(salario) as salario_por_equipo from jugador group by equipo;

-- 12- Equipos con una altura media superior a 2 metros
select equipo, avg(altura) as altura_media from jugador group by equipo having avg(altura) > 2;

-- 13.- El jugador más alto por equipo (altura máxima)
select equipo, max(altura) as jugador_mas_alto from jugador group by equipo;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TERCERA RELACIÓN

-- 1. Mostrar los datos de los partidos jugados en el mes de febrero.
select *, month(fecha) as mes from partido where month(fecha) = 2;

-- 2. Mostrar el nombre y apellido de cada jugador en una sola columna llamada “Nombre Completo”, en MAYÚSCULAS.
select nombre, apellido, upper(concat(nombre, apellido)) as nombre_completo from jugador;

-- 3. Mostrar los enlaces de las webs de los equipos que NO contengan “www”.
select web as web_sin_www from equipo where web not like '%www%';

-- 4. Mostrar los datos de los equipos cuya web incluya la palabra “basket”.
select * from equipo where web like '%basket%';

-- 5. Mostrar los enlaces de las webs de los equipos pero sin “http://”.
select replace (web, 'http://' , '') from equipo;

-- 6. Consulta que devuelva esta frase:
-- “El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta”.
select concat('El jugador con nombre y apellidos:',nombre, ' ', apellido, 'juega en la posición:',posicion, '.') as presentacion_jugador from jugador;

-- 7. Datos de los equipos cuyo nombre tenga 12 caracteres o menos.
select * from equipo where length(nombre) <= 12;

-- 8. Datos de los jugadores que fueron dados de alta en 2008 o 2011.
select * from jugador where extract(year from fecha_alta)= 2008 or extract(year from fecha_alta)= 2011;

-- 9. Mostrar un listado de las páginas web de los equipos pero cambiando “http://” por “https://”.
select replace(web, 'http://', 'https://') as web_con_https from equipo;

-- 10. Mostrar el nombre del jugador y su nombre invertido.
select nombre, reverse(nombre) from jugador;

-- 11. Mostrar el nombre de los equipos rellenado por la izquierda hasta 20 caracteres con ‘*’.
select lpad(nombre, 20, '*') from equipo;

-- 12. Mostrar el apellido de los jugadores y sus 3 primeras letras.
select apellido, substr(apellido, 1,3) from jugador;

-- 13. Mostrar la posición en la que aparece la letra ‘a’ en el nombre del equipo.
select nombre, instr(nombre, 'a') as posicion_a from equipo;

-- 14. Mostrar el nombre del jugador y un campo que indique:
	-- “Veterano” si fue dado de alta antes de 2010
	-- “Moderno” si fue dado de alta a partir de 2010 (usar CASE)
select nombre,
	case
    when extract(year from fecha_alta) < 10 then 'Veterano'
    else 'Moderno'
    end as monderno_veterano
from jugador;

-- 15. Mostrar los jugadores cuyo apellido termina en “ez”.
select * from jugador where apellido like '%ez';

-- 16. Mostrar los equipos ordenados por la longitud de su nombre.
select * from equipo group by length(nombre);

-- 17. Mostrar el nombre del jugador completamente en minúsculas.
select lower(nombre) as nombre_en_minuscula from jugador;

-- 18. Mostrar el nombre del jugador y las 2 primeras letras de su apellido.
select 
    nombre,
    substr(apellido, 1, 2) AS dos_letras_apellido,
    apellido
from jugador;

-- 19. Mostrar el nombre del jugador y el año en el que fue dado de alta
select nombre, extract(year from fecha_alta) from jugador;

-- 20. Mostrar nombre y apellido en una sola columna separados por un guion.
select concat(nombre, ' - ', apellido) from jugador;