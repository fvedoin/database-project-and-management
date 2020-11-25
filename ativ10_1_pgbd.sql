use proj_ger_bd_12_ativ_1;

DELIMITER $$
	CREATE TRIGGER insFunc
	BEFORE INSERT ON func
	FOR EACH ROW
	BEGIN
		SET NEW.depto = (select nome from depto where depto.idDepto = NEW.idDepto);
	END
$$
DELIMITER ;

DELIMITER $$
	CREATE TRIGGER updateDepto
	AFTER UPDATE ON depto
	FOR EACH ROW
	BEGIN
		UPDATE func SET depto = NEW.nome WHERE func.depto = OLD.nome;
	END
$$
DELIMITER ;
