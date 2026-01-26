-- Saúl García Navas 
-- 77433534D

drop database if exists streaming_recu;
create database streaming_recu;
use streaming_recu;

create table usuario(
    id_usuario int(10)primary key,
	email varchar(50) not null,
	password varchar(50) not null,
	nombre varchar(50) not null,
	apellido1 varchar(50) not null,
	apellido2 varchar(50),
	foreign key (id_video) references video(id_video)
);

create table refiere_a(
	foreign key (id_usuario) references usuario(id_usuario)
);

create table ve(
    fecha_hora datetime,
	primary key (id_usuario,id_video),
	foreign key (id_usuario) references usuario(id_usuario),
	foreign key (id_video) references video(id_video)
);



create table video(
	id_video int(10) primary key auto_increment,
    titulo varchar(50) not null,
	sinopsis varchar(50) not null,
	imagen varchar(50) not null,
	video enum("episodio", "pelicula") not null,
	duracion int(50),
	foreign key (id_usuario) references usuario(id_usuario)
);

create table pertenece_a(
	foreign key (id_video) references video(id_video),
	foreign key (id_genero) references genero(id_genero)
);

create table genero(
	id_genero int primary key,
    nombre varchar(50) not null
);



create table episodio(
	id_video int primary key references video(id_video)
    on update cascade
    on delete cascade,
    temporada varchar(50) not null,
    numero int(50) not null,
	foreign key (id_serie) references serie(id_serie)
);

create table pelicula(
	id_video int primary key references video(id_video)
    on update cascade
    on delete cascade,
    director varchar(50) not null,
    puntuacion_imbd decimal(5,2) 
);

create table serie(
	id_serie int primary key auto_increment,
    nombre varchar(50) not null
);
