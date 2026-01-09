use liga;
-- 1 Calcular el salario medio de todos los jugadores.
select avg(salario) as SalarioMedio from jugador;
-- 2 Mostrar el id del equipo y la suma de las alturas de sus jugadores cuando esta suma supere los 5 metros.
select equipo, sum(altura) as SumaAlturas from jugador group by equipo having sum(altura) > 5;
-- 3 Calcular cuántos jugadores miden más de dos metros.
select count(id_jugador) as JugadoresMasDeDosMetros from jugador where altura > 2.00;
-- 4 Mostrar para cada equipo cuántos jugadores están asignados a cada posición.
select equipo, posicion, count(*) as total from jugador group by equipo, posicion;
-- 5 Mostrar el id del equipo y el salario total de cada equipo, pero solo para los equipos que tengan más de 4 jugadores registrados.
select equipo, sum(salario) as SalarioTotal from jugador group by equipo having count(*) > 4;
-- 6 Calcular cuántas ciudades distintas tienen equipos registrados.
select  id_equipo, count(distinct ciudad)as cuidad_equipo from equipo group by id_equipo;
-- 7 Mostrar para cada equipo el salario más alto, el más bajo y la diferencia entre ambos.
select equipo,  max(salario) as SalarioMaximo, min(salario) as SalarioMinimo, max(salario) - min(salario) as DiferenciaSalario from jugador group by equipo;
-- 8 Seleccionar el salario medio de cada equipo, pero únicamente para los equipos cuya media sea superior a 100000.
select equipo, avg(salario) as SalarioMedio from jugador group by equipo having avg(salario) > 100000;
-- 9 Número de jugadores por equipo
select equipo, count(id_jugador) as NumeroJugador from jugador group by equipo;
-- 10 Altura media por equipo
select equipo, avg(altura) as AlturaMedia from jugador group by equipo;
-- 11 Salario total por equipo
select equipo, sum(salario) as SalarioTotal from jugador group by equipo;
-- 12 Equipos con una altura media superior a 2 metros
select equipo, avg(altura) as AlturaMedia from jugador group by equipo having avg(altura) > 2.00;
-- 13 El jugador más alto por equipo (altura máxima)
select equipo, max(altura) as AlturaMaxima from jugador group by equipo;