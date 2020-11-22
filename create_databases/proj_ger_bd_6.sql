create database proj_ger_bd_6;
use proj_ger_bd_6;

create table projeto(
idProj        int,
nome          char(30),
custo         decimal,
ultimoUpdate  int,
primary key(idProj)
);

create table logAcessoProjeto(
idLog    int,
idProj   int,
usuario  char(30),
data     date,
primary key(idLog, idProj),
foreign key (idProj) references projeto(idProj)
);

create table logUpdateProjeto(
idLog       int,
alteracao   char(200),
primary key (idLog),
foreign key (idLog) references logAcessoProjeto(idLog)
);

alter table projeto add constraint fk_lup_proj foreign key (ultimoUpdate) references logUpdateProjeto(idlog);

insert into projeto values (1, 'acme', 2000, null);
insert into projeto values (2, 'proj2', 24000, null);

insert into logAcessoProjeto values (1, 1, 'user A', '2015-05-10');

insert into logUPdateProjeto values (1,'o nome do projeto foi alterado para acme');