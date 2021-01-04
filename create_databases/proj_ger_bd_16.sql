create database proj_ger_bd_16;
use proj_ger_bd_16;



create table func(
idFunc     int,
nome       char(30),
idChefe    int,
salario    decimal(7),
primary key (idFunc)
);

alter table func add foreign key (idChefe) references func(idFunc);

create table remuneracao(
idFunc   int,
remun    char(30),
valor    decimal(7),
primary key(idFunc, remun),
foreign key (idFunc) references func(idFunc)
);

create table depto(
idDepto     int,
nome       char(30),
idDiretor    int,
primary key (idDepto),
foreign key (idDiretor) references func(idFunc)
);



create table projeto(
idProj     int,
nome       char(30),
idLider    int,
custo      decimal(7),
primary key (idProj),
foreign key (idLider) references func(idFunc)
);


create table alocacao(
idProj     int,
idFunc     int,
primary key (idProj, idFunc),
foreign key (idProj) references projeto(idProj),
foreign key (idFunc) references func(idFunc)
);




insert into func values (111,'joao', null, 10000);
insert into remuneracao values (111,'basico', 7000);
insert into remuneracao values (111,'gratificacao 1', 1000);
insert into remuneracao values (111,'gratificacao 2', 2000);



insert into func values (222,'ana', 111, 8000);
insert into remuneracao values (222,'basico', 5000);
insert into remuneracao values (222,'gratificacao 1', 1000);
insert into remuneracao values (222,'gratificacao 2', 2000);




insert into func values (333,'pedro', 111, 6000);
insert into remuneracao values (333,'basico', 3000);
insert into remuneracao values (333,'gratificacao 1', 1000);
insert into remuneracao values (333,'gratificacao 2', 2000);



insert into func values (444,'jose', 222, 4000);
insert into remuneracao values (444,'basico', 3000);
insert into remuneracao values (444,'gratificacao 1', 1000);


insert into func values (555,'maria', 222, 2000);
insert into remuneracao values (555,'basico', 2000);

insert into depto values (123,'depto 123', 111);
insert into depto values (321,'depto 321', 333);


insert into projeto values (1,'acme', 111, 20000);
insert into projeto values (2,'acme fase 2', 111, 30000);
insert into projeto values (3,'abc', 222, 40000);
insert into projeto values (4,'def', 222, 40000);
insert into projeto values (5,'XXX', 333, 500);

insert into alocacao values(1,111);
insert into alocacao values(1,222);
insert into alocacao values(1,333);

insert into alocacao values(2,111);
insert into alocacao values(2,444);
insert into alocacao values(2,555);


insert into alocacao values(3,222);
