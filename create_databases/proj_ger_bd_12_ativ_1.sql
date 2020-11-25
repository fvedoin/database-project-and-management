create database proj_ger_bd_12_ativ_1;
use proj_ger_bd_12_ativ_1;

create table depto (
	idDepto      int,
	nome         char(20),
	primary key (idDepto)
);

create table func(
	idFunc        int,           
	nome         char(30),  
	idDepto      int,
	depto        char(20),
	primary key (idFunc)
);