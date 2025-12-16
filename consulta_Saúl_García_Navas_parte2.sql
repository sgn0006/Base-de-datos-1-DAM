use liga;
-- 1
select avg(salario) as SalarioMedio from jugador;
-- 2
select equipo, sum(altura) as SumaAlturas from jugador group by equipo having sum(altura) > 5;
-- 3
select count(id_jugador) as JugadoresMasDeDosMetros from jugador where altura > 2.00;
-- 4
select equipo, posicion, count(id_jugador) as NumeroJugador from jugador where posicion is not null group by equipo, posicion order by equipo, posicion;
-- 5
select equipo, sum(salario) as SalarioTotal from jugador group by equipo having count(id_jugador) > 4;
-- 6
select count(distinct ciudad) as NumeroCiudades from equipo;
-- 7
select equipo,  max(salario) as SalarioMaximo, min(salario) as SalarioMinimo, max(salario) - min(salario) as DiferenciaSalario from jugador group by equipo;
-- 8
select equipo, avg(salario) as SalarioMedio from jugador group by equipo having avg(salario) > 100000;
-- 9
select equipo, count(id_jugador) as NumeroJugador from jugador group by equipo;
-- 10
select equipo, avg(altura) as AlturaMedia from jugador group by equipo;
-- 11
select equipo, sum(salario) as SalarioTotal from jugador group by equipo;
-- 12
select equipo, avg(altura) as AlturaMedia from jugador group by equipo having avg(altura) > 2.00;
-- 13
select equipo, max(altura) as AlturaMaxima from jugador group by equipo;