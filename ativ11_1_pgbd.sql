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

drop function if exists funcArranjo;

DELIMITER $$
CREATE FUNCTION funcArranjo (n INTEGER, k INTEGER)
RETURNS INTEGER
BEGIN
	DECLARE numerador INTEGER;
	DECLARE denominador INTEGER;
	DECLARE resultado FLOAT;
	SET numerador = fatorial(n);
	SET denominador = fatorial(n-k);
	SET resultado = numerador/denominador;
	RETURN resultado;
END $$
DELIMITER ;

/*Demonstração*/
SELECT funcArranjo(9, 4) AS arranjo;