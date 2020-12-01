create database proj_ger_bd_13_3;

use proj_ger_bd_13_3;

create table depto(
	idDepto int,
	nome char(30),
	primary key (idDepto)
);

create table func(
	idFunc int,
	nome char(30),
	salario decimal(7),
	idDepto int,
	primary key (idFunc),
	foreign key (idDepto) references depto(idDepto)
);
