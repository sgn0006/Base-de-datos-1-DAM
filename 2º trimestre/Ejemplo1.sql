use profesores;

select * from profesores;
select * from coordinadores;
select * from asignaturas;
select * from imparte;
select * from prepara;

-- 1.- Muestra los datos de la asignatura y el DNI del profesor que imparte
select * from asignaturas a join imparte i on a.codigo = i.asignatura;
select * from asignaturas a, imparte i where a.codigo = i.asignatura;

-- 2.- Muestra los datos de los profesores que imparten alguna asignatura
select * from profesores p join imparte i on p.dni = i.dni order by ingreso desc;

-- 3.- Lo mismo que el anterior pero con natural join
select * from profesores natural join imparte;

-- Producto cartesiano (CROSS JOIN)
select * from profesores, asignaturass;
select * from profesores cross join imparte;

-- 4.- Suma de créditos que imparte cada profesor según su dni
select sum(creditos) 
	as creditos_totales,
		dni from imparte i, asignaturas a 
			join i.asignatura,a.codigo 
				group by dni;

-- 5.- Mostrar el nombre de los profesores y cuantas asignaturas imparten cada uno
select count(asignatura) as nºasignaturas, 
	nombre from imparte i 
		join profesores p 
			group by nombre;

-- 6.- Mostrar el nombre del profesor y la descripción de la asignatura que imparte
select nombre,descripcion from profesores p 
	join imparte i on p.dni = p.dni
		join asignaturas a 
			on a.codigo = i.asignatura;


-- SUBCONSULTAS

-- 1.- Mostrar todos los datos de las asignaturas que tienen más créditos que la asignatura PC
select * from asignaturas where creditos > 
	(select creditos from asignaturas where codigo = 'PC');

-- 2.- Mostrar la descripción de las asignaturas que tienen más créditos que todas las damás
select descripcion from asignaturas where creditos =
	(select max(creditos) from asignaturas);

select descripcion from asignaturas where creditos >= 
	all (select creditos from asignaturas);

-- 3.- Nombre de las asignaturas que no son las que menos creditos tienen
select * from asignaturas where creditos >
	(select min(creditos) from asignaturas);
    
select descripcion from asignaturas where creditos > 
	any (select creditos from asignaturas);