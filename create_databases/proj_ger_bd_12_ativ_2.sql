create database proj_ger_bd_12_ativ_2;
use proj_ger_bd_12_ativ_2;

create table projeto (
idProj           int not null,
descProj         char(30),
primary key (idProj)
);

create table atividade (
idAtiv           int not null,
idProj           int,
descAtiv         char(40),
primary key (idAtiv),
foreign key (idProj) references projeto (idProj)  ON DELETE CASCADE
);

create table subAtividade (
idSubAtiv           int not null,
idAtiv              int,
descAtiv            char(50),
primary key (idSubAtiv),
foreign key (idAtiv) references atividade (idAtiv)  ON DELETE CASCADE
);

insert into projeto values (1,'proj ACME');
insert into atividade values (1,1,'atividade 1 do proj ACME');
insert into subAtividade values (1,1,'subatividade 1 da atividade 1 do proj ACME');
insert into subAtividade values (2,1,'subatividade 2 da atividade 1 do proj ACME');

insert into atividade values (2,1,'atividade 2 do proj ACME');
insert into subAtividade values (3,2,'subatividade 1 da atividade 2 do proj ACME');
insert into subAtividade values (4,2,'subatividade 2 da atividade 2 do proj ACME');

-- nao vai funcionar
delete from projeto where idProj = 1;
