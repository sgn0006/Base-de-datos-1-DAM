
-- Crear usuario para que se conecte dedsde el mismo equipo de la BBDD
create user 'Ejemplo_user'@'localhost' identified by '123456';

-- Cear usuario para que se coecte desde cualquier parte
create user 'Ejemplo_user'@'%' identified by '123456';


-- Crear usuario para uqe se conecte desde una dirección
create user 'Ejemplo_user'@'192.168.20.105' identified by '123456';

-- Permisos o privilegios
-- Select, insert, update, create, drop, alter

-- Comandos de control
-- GRANT - Asigna
-- Revoke - Elimina


-- Vista - Es una consulta almacenada que se puede usar como si fuera una tabla.
-- Simplifica consultas, oculta datos sensibles, mejora la seguirdad.


-- Indice
-- Sin indice - recrre toda la tabla
-- Cin indice - Se accede directamente al dato

-- 2.- Consultar la vista 
select * from vista_asignaturas_profesores;

-- 3.- Crear una vista que solo muestre todos los datos menos el sueldo del profesor como seguridad
create view vista_profesores_seguridad as select id_profesor, nombre, email from profesores;

-- 4.- Consulta la vista creada
select * from vista_profesores_seguridad;

-- ejercicio 3: creación de usuarios

-- Crear el usuario carlos_user solo desde el mismo equipo
-- Crear el usuario carlos_user desde cualquier parte
-- Crear el usuario carlos_user desde el mismo equipo
create user 'carlos_user'@'localhost' identified by '123456';
create user 'daniel_user'@'%' identified by '123456';
create user 'celia_user'@'localhost' identified by '123456';

-- ejercicio 4: asignacion de permisos

-- Asignar permisos a Carlos solo select en toda la base de datos 
grant select on gestion_centro.* to 'carlos_user'@'localhost';

-- a Daniel select, insert a la tabla asignaturas
grant select, insert on gestion_centro.asignaturas to 'daniel_user'@'localhost';

-- a Celia select, update a la tabla asignaturas
grant select, update on gestion_centro.asignaturas to 'celia_user'@'localhost';

-- ejercicio6: comprobación de permisos
-- probar con Carlos
-- probar Daniel
-- probar Celia

select User, Host from mysql.user;

-- ejercicio 7: seguridad con vistas
-- Eliminar todos los permisos de Carlos
revoke select on gestion_centro.* from 'carlos_user'@'localhost';

-- dar accesa solo a la vista en el ejercico 2 (seguridad)
grant select on gestion_centro.vista_profesores_seguridad to 'carlos_user'@'localhost';

flush privileges;

-- ejercicio 7: revocar permisos

-- Quitar a Daniel el permiso de insert
revoke insert on gestion_centro.asignaturas from 'daniel_user'@'localhost';

-- Comprobar que ya no puede insertar
