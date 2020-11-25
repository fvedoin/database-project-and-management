use proj_ger_bd_12_ativ_3;

DELIMITER $$
	create trigger updateProjeto
	after update on projeto
	for each row
	begin
        declare oDescProj char(30);
        declare oCusto decimal(6);
        if new.descProj <> old.descProj then
			SET oDescProj= new.descProj;
		end if;
        if new.custo <> old.custo then
			SET oCusto= new.custo;
		end if;
		insert into ProjetoTemporal (data, tipo, numProj, descProj, custo) values (now(), 'update', new.numProj, oDescProj, oCusto);
	end
$$
DELIMITER ;

insert into projeto values (1, 'ACME', 12000);
insert into projeto values (2, 'ZYZ', 1000);

update projeto set custo = 10000 where numProj = 1;
update projeto set custo = 100000 where numProj = 1;

select numProj, data, tipo, descProj, custo from projetoTemporal
order by numProj, data;