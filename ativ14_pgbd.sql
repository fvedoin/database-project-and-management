/*1*/
select idFunc from func f where 
	f.idFunc in (select idLider from projeto p where 2 < (select count(*) from alocacao a where p.idProj= a.idProj))
    and f.idFunc not in (select idLider from projeto p where 2 >= (select count(*) from alocacao a where p.idProj= a.idProj));
/***********/

/*2*/
select f.nome, p.nome from projeto p join func f on f.idFunc = p.idLider where
	f.idFunc in (select idLider from projeto p where 2 < (select count(*) from alocacao a where p.idProj= a.idProj))
    and f.idFunc not in (select idLider from projeto p where 2 >= (select count(*) from alocacao a where p.idProj= a.idProj));
/***********/

/*3*/
select p.nome from projeto p where 
	5000 < all (select sum(r.valor) from remuneracao r, alocacao a where r.idFunc = a.idFunc and p.idProj = a.idProj group by a.idProj, a.idFunc)
    and p.idProj in (select idProj from alocacao);
/***********/

/*4*/
select avg(s.salario) from (
	select sum(r.valor) as salario from remuneracao r where r.idFunc in (select DISTINCT p.idLider from projeto p where custo > 25000) group by r.idFunc) s;
/***********/

/*5*/
select DISTINCT f.nome from func f, remuneracao r1 where 
	(select sum(r1.valor) from remuneracao r1 where remun <> 'basico' and r1.idFunc = f.idFunc) = (select max(gratificacao) from (select sum(r.valor) as gratificacao from remuneracao r where remun <> 'basico' group by r.idFunc) gratificacoes);
/***********/

/*6*/
select idFunc from func where 
	idFunc in (select idChefe from func)
	or idFunc in (select idDiretor from depto);
/***********/