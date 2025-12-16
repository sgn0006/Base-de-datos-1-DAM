use liga;
-- 1
select * from jugador where equipo = 3 order by apellido;
-- 2
select * from jugador where posicion = 'escolta' or 'alero';
-- 3
select * from jugador where salario between 60000 and 100000;
-- 4
select * from jugador where posicion = 'pívot' order by id_jugador;
-- 5
select * from jugador where altura > 2.00 and salario >= 50000;
-- 6
select nombre, apellido from jugador where posicion = 'Pívot' and salario > 100000;
-- 7
select nombre from jugador where equipo in (1, 2) and posicion = 'Base';
-- 8
select nombre from jugador where equipo in (1, 2) and salario > 80000;
-- 9
select distinct posicion from jugador where posicion is not null;
-- 10
select * from jugador order by altura desc limit 5;
-- 11
select *, (salario * 0.82) as SALARIO_NETO_ANUAL from jugador;
-- 12
select * from jugador where (salario * 0.82) >= 70000;
-- 13
select * from jugador where posicion is null;
-- 14
select * from partido where fecha < "2012/01/01";
-- 15
select * from jugador where altura > 1.90 and salario > 100000;