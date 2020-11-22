create database proj_ger_bd_9;
use proj_ger_bd_9;

create table predio(
idPredio        int      not null,
descr           char(30) not null,
primary key (idPredio)
);


create table sala(
idSala         int        not null,
descr           char(30)   not null,
url            char(100)  null,
idPredio       int        null, 
primary key(idSala),
foreign key (idPredio) references predio(idPredio)
);
	
insert into predio values (1, 'predio 1');
insert into predio values (2, 'predio 2');

insert into sala values (1,'sala 1', 'url 1', null);
insert into sala values (2,'sala 2', null, 1);
insert into sala values (3,'sala 3', null, 1);