create database proj_ger_bd_12_ativ_3;
use proj_ger_bd_12_ativ_3;

create table projeto(
numProj      int,
descProj     char(30),
custo        decimal(6),
primary key (numProj)
);


create table ProjetoTemporal(
id            bigint not null auto_increment,           
data          datetime,
tipo         char(10),  
numProj      int,
descProj     char(30),
custo        decimal(6),
primary key (id)
);


-- criacao da trigger que grava registro temporal quando um projeto é inserido
DELIMITER $$
create trigger insProjeto
after insert on projeto
for each row
begin
   insert into projetoTemporal (data, tipo, numProj, descProj, custo) values (now(), 'insert', new.numProj, new.descProj, new.custo);
end$$


-- criacao da trigger que grava registro temporal quando um projeto é atualizado
-- precisa ser feito de forma a gravar apenas o delta