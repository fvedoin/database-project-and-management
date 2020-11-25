use proj_ger_bd_12_ativ_2;

DELIMITER $$
	CREATE TRIGGER remProj
	BEFORE DELETE ON projeto
	FOR EACH ROW
	BEGIN
		DELETE FROM atividade
		WHERE idProj = OLD.idProj;
	END
	$$
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER remAtiv
	BEFORE DELETE ON atividade
	FOR EACH ROW
	BEGIN
		DELETE FROM subAtividade
		WHERE idAtiv= OLD.idAtiv;
	END
	$$
DELIMITER ;