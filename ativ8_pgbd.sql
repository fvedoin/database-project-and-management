use proj_ger_bd_9;

create table sala_virtual(
	idSala int not null,
	url char(100) not null,
	primary key(idSala),
	foreign key (idSala) references sala(idSala)
);
create table sala_fisica(
	idSala int not null,
	idPredio int not null, 
	primary key(idSala),
    foreign key (idSala) references sala(idSala),
	foreign key (idPredio) references predio(idPredio)
);

INSERT INTO sala_fisica (idSala, idPredio) (SELECT idSala, idPredio FROM sala WHERE url is null);
INSERT INTO sala_virtual (idSala, url) (SELECT idSala, url FROM sala WHERE idPredio is null);

alter table sala drop foreign key sala_ibfk_1;

alter table sala drop column idPredio;
alter table sala drop column url;