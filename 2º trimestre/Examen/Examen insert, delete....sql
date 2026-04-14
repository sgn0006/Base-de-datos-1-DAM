-- Creo la base de datos
drop database if exists gestion_centro;
create database gestion_centro;
use gestion_centro;

-- Creo la tabla profesores
create table profesores(
id_profesores int primary key,
nombre varchar(50),
sueldo decimal(10,2),
email varchar(100)
);

-- Creo la tabla asignaturas
create table asignaturas(
id_asignatura int auto_increment primary key,
nombre_asig varchar(60),
horas_semanales int,
id_profesor int, 
cupo_alumnos int
);

-- Asigno la clave foranea de asignaturas
alter table asignaturas add constraint id_profesor 
	foreign key (id_profesor) references profesores(id_profesores) on delete cascade;

select * from profesores;
select * from asignaturas;


-- Inserto datos a profesores
insert into profesores(id_profesores,nombre,sueldo,email) values
(1, 'Carlos Fernandez', 1000.00, 'carlos@centro.es'),
(2, 'Daniel Montañés', 1000.00, 'daniel@centro.es'),
(3, 'Celia Macías', 1000.00, 'celia@centro.es')
;

-- Inserto datos a asignaturas
insert into asignaturas(nombre_asig,horas_semanales,id_profesor,cupo_alumnos) values
('Bases de datos', 6, 1, 30),
('Lenguaje de Marcas', 3, 1, 26),
('Sistemas', 5, 1, 24),
('Programación', 8, 2, 30),
('Entornos de desarrollo', 3, 3, 22)
;

-- Modificaciones de Datos y borrado
set SQL_SAFE_UPDATES = 0;
update profesores set sueldo = sueldo - ((sueldo / 100) * 15);
update asignaturas set cupo_alumnos = cupo_alumnos + 5 where 
	id_profesor = 1 and ( select id_profesores from profesores where nombre = 'Carlos Fernandez');
update asignaturas set nombre_asig = 'Sistemas Informaticos' where nombre_asig ='Sistemas';
update asignaturas set id_profesor = 3 where nombre_asig = 'Bases de datos';
delete from asignaturas where nombre_asig = 'Entornos de desarrollo';

-- Solución del Problema de Integridad
delete from profesores where id_profesores = 1;
update profesores set id_profesores = id_profesores + 1 where id_profesores = 3;


-- Comprobación Final
update profesores set id_profesores = 10 where id_profesores = 3;



