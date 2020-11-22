use proj_ger_bd_6;

alter table projeto drop foreign key fk_lup_proj;

alter table projeto drop column ultimoUpdate;

drop table logUpdateProjeto;
drop table logAcessoProjeto;