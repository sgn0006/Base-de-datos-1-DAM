-- Saúl García Navas 77433534D --

drop database if exists usuario;
create database usuario;
use usuario;

-- tabla usuario --
create table usuario (
id int primary key auto_increment not null,
 email varchar(255) not null,
 pasword varchar(255) not null,
 nombre varchar(255) not null,
 apellido1 varchar(255) not null,
 apellido2 varchar(255)
);

-- mas cosas de la tabla usuario --
alter table usuario add id_usuario_referido int(255);
alter table usuario truncate partition id_usuario_referido;

-- tabla serie -- 
create table serie (
id_serie int primary key auto_increment not null,
nombre varchar(255) not null
);

-- tabla video -- 
create table video(
id_video int primary key auto_increment not null,
titulo varchar(255) not null,
sinopsis varchar(255),
imagen varchar(255),
video varchar(255),
duracion int(255),
check(duracion >= 0),
tipo enum('Episodio' , 'Pelicula')
);

-- tabla episodio --
create table episodio(
temporada int(255) not null,
numero int(255) not null,
primary key(id_video),
foreign key (id_video) references video(id_video)
on delete cascade 
on update cascade
);

-- cosas de la tabla episodio --
alter table serie drop episodio;

-- tabla pelicula --
create table pelicula(
puntuacion_IMDb decimal (5,2) default 0,
director varchar(255),
primary key(id_video),
foreign key (id_video) references video(id_video)
);

-- cosas de la tabla pelicula --
alter table serie drop episodio;

-- tabla genero --
create table genero(
id_genero int primary key auto_increment,
nombre varchar(255) not null
);

-- tabla usuario_ve_video --
create table usuario_ve_video(
fecha_hora datetime primary key not null,
primary key(id_video,id_usuario),
foreign key (id_video) references video(id_video),
foreign key (id_usuario) references usuario(id_usuario)

);

-- cosas de la tabla usuario_ve_video --
alter table video drop id_episodio;
alter table episodio drop id_video;

-- tabla video_pertenece_genero --
create table video_pertenece_genero(
primary key(id_video,id_genero)
);

-- cambios solicitados --
alter table video add calidad_video enum('SD','HD','FullHD','4K') default 'HD' not null;
alter table usuario modify apellido2 varchar(255) not null;
alter table usuario modify id_usuario_referido char(8) not null;
alter table video drop sinopsis;











