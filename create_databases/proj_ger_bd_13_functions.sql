use proj_ger_bd_13;

drop function if exists soma;
DELIMITER $$

CREATE FUNCTION soma (
a INTEGER,
 b INTEGER
) 
RETURNS INTEGER
 
BEGIN 
    
   RETURN a + b;
 
END
 $$


DELIMITER ;




SELECT nomeFunc, soma(salario, bonus) FROM func;


SELECT soma(3,6);



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




SELECT fatorial(4);



drop function if exists calculaGratificacaoAnual;

DELIMITER $$
CREATE FUNCTION calculaGratificacaoAnual(
ano INTEGER, bonus INTEGER
) 
RETURNS INTEGER

BEGIN
   
   DECLARE anoAtual INTEGER;
   
   SET anoAtual = YEAR(CURDATE()) ;
   
   RETURN (anoAtual - ano) * bonus;

END
$$



SELECT nomeFunc, salario, 
   calculaGratificacaoAnual(anoContratacao, bonus) AS bonus 
FROM func;



SELECT SUM(calculaGratificacaoAnual(anoContratacao, bonus))
 FROM func;




drop function if exists calculaGratificacaoAnualTotal;


DELIMITER $$

CREATE FUNCTION calculaGratificacaoAnualTotal (
bonus INTEGER
) 
RETURNS DECIMAL

BEGIN
   
   DECLARE total DECIMAL DEFAULT 0;
    
   DECLARE anoAtual INTEGER;
   
   DECLARE ano_ DECIMAL; 
   
   DECLARE noMoreRows INTEGER DEFAULT 0;
   
   DECLARE cursor_ CURSOR FOR SELECT anoContratacao FROM func;

   
   DECLARE CONTINUE HANDLER FOR NOT FOUND
      
   SET noMoreRows = 1;
   
   OPEN cursor_;
    
   check_loop: LOOP
 
    
      FETCH cursor_ INTO ano_;
 
    
      IF noMoreRows = 1 THEN 
       
         LEAVE check_loop;
    
      END IF;

    
      SET anoAtual = YEAR(CURDATE()) ;
    
      SET total = total + (anoAtual - ano_) * bonus;
 

   END LOOP check_loop;

   CLOSE cursor_;


   RETURN total;

END  $$


SELECT calculaGratificacaoAnualTotal(200) AS bonus;
