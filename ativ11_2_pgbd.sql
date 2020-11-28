use proj_ger_bd_13;

/*Função fatorial pronta*/
drop function if exists fatorial;

DELIMITER $$
CREATE FUNCTION fatorial (n INTEGER)
RETURNS INTEGER
BEGIN
	DECLARE fatorial INTEGER DEFAULT 1;
	DECLARE cont INTEGER;
	SET cont = n;
	REPEAT
		SET fatorial = fatorial * cont;
		SET cont = cont - 1;
	UNTIL cont < 2
	END REPEAT;
	RETURN fatorial;
END $$
DELIMITER ;

drop procedure if exists procArranjo;

DELIMITER $$
CREATE PROCEDURE procArranjo(IN n INTEGER, IN k INTEGER, OUT resultado INTEGER)
BEGIN
	DECLARE numerador INTEGER;
	DECLARE denominador INTEGER;
	SET numerador = fatorial(n);
	SET denominador = fatorial(n-k);
	SET resultado = numerador/denominador;
END $$
DELIMITER ;

/*Demonstração*/
SET @n = 9;
SET @k = 4;
SET @resultado = 0;

CALL procArranjo(@n, @k, @resultado);
SELECT @resultado AS arranjo;