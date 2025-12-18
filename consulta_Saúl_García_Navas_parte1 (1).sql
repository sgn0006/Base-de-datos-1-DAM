use liga;
-- 1 Obtener los datos de los jugadores del equipo 3 ordenados por su apellido.
select * from jugador where equipo = 3 order by apellido;
-- 2 Jugadores que sean escolta o alero
select * from jugador where posicion = 'escolta' or 'alero';
-- 3 Jugadores con salarios entre 60.000 y 100.000
select * from jugador where salario between 60000 and 100000;
-- 4 Obtener los datos de los jugadores que sean pívot ordenados por su identificador.
select * from jugador where posicion = 'pívot' order by id_jugador;
-- 5 Seleccionar los datos de los jugadores que midan más de dos metros y ganen al menos 50.000 euros.
select * from jugador where altura > 2.00 and salario >= 50000;
-- 6 Seleccionar el nombre de los jugadores que jueguen como pívot y ganen más de 100.000 euros.
select nombre, apellido from jugador where posicion = 'Pívot' and salario > 100000;
-- 7 Seleccionar el nombre de los jugadores de los equipos 1 y 2 que jueguen como base.
select nombre from jugador where equipo in (1, 2) and posicion = 'Base';
-- 8 Seleccionar los datos de jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes.
select nombre from jugador where equipo in (1, 2) and salario > 80000;
-- 9 Listar las posiciones diferentes que pueden ocupar los jugadores en la liga.
select distinct posicion from jugador where posicion is not null;
-- 10 Mostrar todos los datos de los 5 jugadores más altos.
select * from jugador order by altura desc limit 5;
-- 11 Calcular en una columna llamada SALARIO NETO ANUAL el sueldo neto de cada jugador sabiendo que el IRPF del 18% deja un 82% del salario bruto.
select *, (salario * 0.82) as SALARIO_NETO_ANUAL from jugador;
-- 12 Seleccionar los datos de los jugadores cuyo salario neto anual sea al menos 70.000 euros.
select * from jugador where (salario * 0.82) >= 70000;
-- 13 Jugadores sin posición asignada (NULL)
select * from jugador where posicion is null;
-- 14 Partidos jugados antes de 2012
select * from partido where fecha < "2012/01/01";
-- 15 Jugadores que midan más de 1.90 y cobren más de 100.000
select * from jugador where altura > 1.90 and salario > 100000;