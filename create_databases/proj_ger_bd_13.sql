drop database if exists proj_ger_bd_13;
create database proj_ger_bd_13;
use proj_ger_bd_13;


create table func(
idFunc     int,
nomeFunc    char(30),
anoContratacao int, 
salario     decimal,
bonus       decimal,
idChefe       int,
primary key (idFunc)
);

create table proj(
idProj     int,
nomeProj   char(30),
primary key (idProj)
);


create table aloc(
idProj     int,
idFunc     int,
primary key (idProj, idFunc)
);

insert into proj values(1,'ABC'), (2, 'ACME');
insert into func values(1,'Ana', 2011, 3000, 500, null), (2, 'Joao', 2014, 2000, 0,1), 
					   (3, 'Pedro',2000, 5000, 2000,2), (4, 'Ze',2010, 6000, 1000,1), (5, 'Pedro',2009, 6000, 1500,2);
insert into aloc values (1,1), (1,3), (2,2), (2,3);