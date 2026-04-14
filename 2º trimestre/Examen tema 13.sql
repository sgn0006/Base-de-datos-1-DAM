-- Saúl García Navas

use formula1;

-- 1
create index indice1 on pilotos(edad);
explain select * from pilotos where edad = 25;

-- 2
create view vista1 as select e.nombre as nombre_escu, p.nombre as nombre_pil from escuderias e join pilotos p on e.id_escuderia=p.id_escuderia;
select * from vista1; 


-- 3 
create view vista2 as select edad, nombre, id_piloto from pilotos;
select * from vista2; 

-- 4
create user 'ana_user'@'localhost' identified by 'Carlos apruebame';
create user 'mario_user'@'%' identified by 'Carlos apruebame';

-- 5 
grant select on formula1.* to 'ana_user'@'localhost';
grant select, update on formula1.pilotos to 'mario_user'@'%';
flush privileges;

-- 6
revoke select on formula1.* from 'ana_user'@'localhost';
grant vista1 to 'ana_user'@'localhost';

-- 7
revoke update, select on formula1.* from 'mario_user'@'%';
