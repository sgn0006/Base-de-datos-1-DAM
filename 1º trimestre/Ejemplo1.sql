use profesores;

select * from profesores;
select * from coordinadores;
select * from  asignaturas;
select * from imparte;
select * from prepara;

-- 1.- Muestra los datos de la asignatura y el DNI del profesor que imparte
select * from asignaturas a join imparte i on a.codigo = i.asignatura;