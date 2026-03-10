use universidad;
-- Nombre: Saúl García Navas
-- 1 *

select 	nif, fecha_nacimiento from persona 
where fecha_nacimiento < (select nif from persona where nif = '79503962T');

-- 2 *

select d.nombre, count(p.id_profesor) as 'Nº profesores'
 from profesor p  join departamento d  on (d.id = p.id_profesor) 
group by p.id_profesor;

-- 3 *

select distinct asi.nombre as 'nombre' 
from asignatura asi join alumno_se_matricula_asignatura al 
on (asi.id = al.id_asignatura) left join curso_escolar cu 
on (cu.id = al.id_curso_escolar) ;

-- 4 *
select * from curso_escolar;
select c.*, count(*) as 'Nº Matricula' from curso_escolar c 
right join alumno_se_matricula_asignatura a on (c.id = a.id_alumno)
join asignatura asi on (a.id_asignatura = asi.id) group by c.id, asi.curso;

-- 5
select 
p.nombre as 'Nombre',
p.apellido1 as 'apellido1',
p.apellido2 as 'apellido2',
asi.nombre as 'asignatura'
from alumno_se_matricula_asignatura a right join persona p on (p.id = a.id_alumno)
join asignatura asi on (a.id_asignatura = asi.id);

-- 6 
select 
g.nombre as nombre,
count(*) as nºasignaturas
from grado g join asignatura a on (g.id = a.id_grado) group by g.nombre;

-- 7
select 
g.nombre as grado,
sum(a.creditos) as suma_creditos
from grado g left join asignatura a on (g.id = a.id_grado) group by g.nombre;

-- 8


-- 9
select 
p.nombre as 'Nombre',
p.apellido1 as 'apellido1',
p.apellido2 as 'apellido2',
sum(a.creditos) as suma_creditos
from alumno_se_matricula_asignatura a right join persona p on (p.id = a.id_alumno)
join asignatura asi on (g.id = asi.id_grado) group by g.nombre;

-- 10 
select * from curso_escolar order by anyo_inicio desc limit 1;