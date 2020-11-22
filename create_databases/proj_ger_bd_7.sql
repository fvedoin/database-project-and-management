create database proj_ger_bd_7;
use proj_ger_bd_7;

create table func(
matr       int,
nome       char(30),
primary key (matr)
);

create table sala(
numSala       int,
capacidade    int,
primary key(numSala)
);

create table reuniao(
idReuniao        int,
numSala          int,
data             datetime,
assunto          char(30),
primary key(idReuniao),
foreign key (numSala) references sala(numSala)
);

create table participacao(
idReuniao        int,
matr             int,
primary key(idReuniao, matr),
foreign key (idReuniao) references reuniao(idReuniao),
foreign key (matr) references func(matr)
);

insert into func values (11111, 'joao');
insert into func values (22222, 'pedro');

insert into sala values (201, 20);
insert into sala values (202, 30);
insert into sala values (203, 30);
insert into sala values (204, 20);

insert into reuniao values (1, 201, '2015-10-10', 'prazo esgotado');
insert into reuniao values (2, 204, '2015-10-15', 'novo chefe');
insert into reuniao values (3, 204, '2015-10-25', 'agendamento de ferias');

insert into participacao values (1,11111);
insert into participacao values (1,22222);
insert into participacao values (2,11111);
