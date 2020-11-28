use proj_ger_bd_13;

drop procedure if exists calculaChefes;

DELIMITER $$
CREATE PROCEDURE calculaChefes(funcRaiz INTEGER)
BEGIN
	DECLARE cont INTEGER DEFAULT 0;
    	DROP TABLE IF EXISTS arvore;
    	CREATE TABLE arvore SELECT idChefe, 0 AS nivel FROM func WHERE idFunc = funcRaiz AND idChefe IS NOT NULL;
    	ALTER TABLE arvore ADD PRIMARY KEY(idChefe);
    	REPEAT
		INSERT INTO arvore 
			SELECT f.idChefe, a.nivel+1
			FROM func AS f JOIN arvore AS a ON a.idChefe = f.idFunc
			WHERE nivel = cont AND f.idChefe IS NOT NULL;        
		SET cont = cont + 1;
    	UNTIL Row_Count() = 0
    	END REPEAT;
END
$$
DELIMITER ;

/*Demonstração*/
CALL calculaChefes(2);
SELECT * FROM arvore;