use universidad;

-- 1.- Obtener las alumnas con mayor edad.
-- Esta consulta te daría solo una persona por lo que no cubriría a las personas que nacieran el mismo dia
select * from persona where sexo = 'M' 
and tipo = 'alumno' 
group by fecha_nacimiento 
limit 1;

select * from persona where fecha_nacimiento = 
(select min(fecha_nacimiento) from persona 
where sexo = 'M' and tipo = 'alumno');

-- 2.- Mostrar los datos de la asignatura cuyo id sea el mayor. 
-- Esta consulta tambien añade la columna max(id) por lo que no nos sirve
select *,max(id) from asignatura;

select * from asignatura where id = 
(select max(id) from asignatura);

-- 3.- Mostrar el nombre de la asignatura y el nombre de su grado asociado.
select a.nombre as nombre_asignatura,
g.nombre as nombre_grado 
from asignatura a join grado g on (a.id= g.id);
-- Importante ponerle el on porque si no el join está imcompleto

/* 4.- Mostrar el nombre de todas las asignaturas, el nombre de su grado, 
y el nombre y apellidos del profesor asociado 
(incluyendo asignaturas sin profesor si las hubiera).*/
select 
per.nombre as 'Nombre Profesor', 
per.apellido1 as '1º Apellido Profesor', 
per.apellido2 as '2º Apellido Profesor',
asi.nombre as 'Nombre Asignatura', 
gra.nombre as 'Nombre Grado'
from persona per join profesor pro on (pro.id_profesor = per.id)
	right join asignatura asi on (asi.id = pro.id_profesor)
		join grado gra on (gra.id = asi.id);


-- 5.- Mostrar el nombre y apellidos de los profesores y el nombre de su departamento.
select 
per.nombre as 'Nombre Profesor', 
per.apellido1 as '1º Apellido Profesor', 
per.apellido2 as '2º Apellido Profesor',
dep.nombre  as 'Nombre Departamento'
from persona per
join profesor pro
on (per.id = pro.id_profesor)
join departamento dep
on (pro.id_profesor = dep.id);

-- 6.- Número de asignaturas que imparte cada profesor
select 
per.nombre as 'Nombre Profesor', 
per.apellido1 as '1º Apellido Profesor', 
per.apellido2 as '2º Apellido Profesor',
count(asi.id) as 'Asignatura'
from persona per join profesor pro on (pro.id_profesor = per.id)
left join asignatura asi on (asi.id_profesor = pro.id_profesor)
group by pro.id_profesor;

-- 7.- Mostrar los datos de todos los grados, tengan o no asignaturas asociadas.
select 
gra.* ,asi.* 
from asignatura asi 
left join grado gra  
on (gra.id = asi.id_grado);

-- 8.- Mostrar los datos de todas las asignaturas, tengan o no profesor asignado.
select * from asignatura;

-- 9.- Datos de los profesores que imparten alguna asignatura.

-- 10.- Cantidad de créditos que imparte cada profesor según su nif.

-- 11.- Mostrar datos de las asignaturas que tienen más créditos que todas las demás.

-- 12.- Mostrar datos de las asignaturas con menos créditos.

-- 13.- Muestra por cada grado la suma de sus créditos.

-- 14.- Asignaturas que pertenecen al mismo grado que “Bases de Datos”.

-- 15.- Nombre de las asignaturas que no son las que menos créditos tienen.
select * from asignatura where creditos
not in (select min(creditos) from asignatura);

select * from asignatura where creditos != 
(select min(creditos) from asignatura);

select * from asignatura where creditos > 
any (select creditos from asignatura);

-- 16.- Nombre de las asignaturas que no son las que más créditos tienen.
