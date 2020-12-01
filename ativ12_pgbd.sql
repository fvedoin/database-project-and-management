use proj_ger_bd_13_3;

/*definição da tabela auxiliar*/
create table folhaSalarial(
	idDepto int,
	nomeDepto char(30),
	quantidade_func int,
	total_salario decimal(7),
	primary key(idDepto)
);


/*início das triggers*/
DELIMITER $$
create trigger insFunc
after insert on func
for each row
begin
   declare var_idDepto int;
   select idDepto into var_idDepto from folhaSalarial where idDepto = new.idDepto;
   if (var_idDepto is null) then
   begin
       declare var_nome char(30);
       select nome into var_nome from depto where depto.idDepto = new.idDepto;
       insert into folhaSalarial (`idDepto`, `nomeDepto`, `quantidade_func`, `total_salario`) values (new.idDepto, var_nome, 1, new.salario);
       end;
   else 
       update folhaSalarial set total_salario = total_salario + new.salario, quantidade_func = quantidade_func + 1 where idDepto = new.idDepto;
   end if;
end
$$
DELIMITER ;

DELIMITER $$
	create trigger dltFunc
	after delete on func
	for each row
	begin
		declare novoContador char(30);
		update folhaSalarial set total_salario = total_salario - old.salario, quantidade_func = quantidade_func -1 where idDepto = old.idDepto;
		select quantidade_func into novoContador from folhaSalarial where folhaSalarial.idDepto = old.idDepto;
        if (novoContador = 0) then
			delete from folhaSalarial where folhaSalarial.idDepto = old.idDepto;
		end if;
	end
$$
DELIMITER ;

DELIMITER $$
create trigger updFunc
after update on func
for each row
begin
	update folhaSalarial set total_salario = total_salario - old.salario + new.salario where idDepto = old.idDepto;
end
$$
DELIMITER ;
/*fim das triggers*/

/*criação da visão*/
CREATE VIEW v1 AS (select idDepto, nomeDepto, total_salario, total_salario/quantidade_func as media_salarial from folhaSalarial);

/*criação do usuário ana*/
create user ana@localhost; 

/*permissões para ana*/
GRANT SHOW DATABASES ON *.* TO ana@localhost;
GRANT SELECT ON proj_ger_bd_13_3.v1 TO ana@localhost;

/*operações de teste*/
insert into depto values (1,'depto 1'), (2,'depto 2'), (3,'depto 3');
insert into func values (1,'joao', 2000, 1);
insert into func values (2,'ana', 2000, 1);
insert into func values (3,'jose', 2000,1);
insert into func values (4,'marcos', 3000,2);
insert into func values (5,'pedro', 1000,2);
insert into func values (6,'bia', 4000,2);
update func set salario = 2000 where idfunc = 5;
insert into func values (7,'paulo', 4000,3);
insert into func values (8,'ricardo', 6000,3);
delete from func where idfunc >= 7;

/*executar os seguintes comandos com o usuário ana*/
use proj_ger_bd_13_3;
select idDepto, nomeDepto, total_salario, media_salarial from v1;