use proj_ger_bd_13;

drop procedure if exists fatorial2;
DELIMITER $$

CREATE PROCEDURE fatorial2(INOUT n INTEGER)

BEGIN
   
   DECLARE fatorial INTEGER DEFAULT 1;
   
   DECLARE cont INTEGER;
   
   SET cont = n;
   
   REPEAT
      
      SET fatorial = fatorial * cont;
      
      SET cont = cont - 1;
   
   UNTIL cont < 2
   
   END REPEAT;

   
   SET n = fatorial;

END $$

DELIMITER ;



set @x = 4;

call fatorial2(@x);

select @x;



drop procedure if exists atualizaGratificacaoAnual;

DELIMITER $$

CREATE PROCEDURE atualizaGratificacaoAnual(
IN bonus INTEGER )

BEGIN
   
   DECLARE total DECIMAL DEFAULT 0;
   
   DECLARE idFunc_ INTEGER;
   
   DECLARE ano_ INTEGER;
   
   DECLARE anoAtual INTEGER;
   
   DECLARE noMoreRows INTEGER DEFAULT 0;
   
   DECLARE cursor_ CURSOR FOR 
                          
         SELECT idFunc, anoContratacao FROM func;
 
   
   DECLARE CONTINUE HANDLER FOR NOT FOUND 
      
         SET noMoreRows = 1;
    

   OPEN cursor_;
   
   check_loop: LOOP
 
    
      FETCH cursor_ INTO idFunc_, ano_;
 
    
      IF noMoreRows = 1 THEN 
       
          LEAVE check_loop;
    
      END IF;

    
      SET anoAtual = YEAR(CURDATE()) ;
    
      SET total = (anoAtual - ano_) * bonus;
    
      UPDATE func SET bonus = total WHERE idFunc = idFunc_; 
 
   
   END LOOP check_loop;

   CLOSE cursor_;

END  $$



CALL atualizaGratificacaoAnual (200);

select * from func;




drop procedure if exists atualizaSalarios;
DELIMITER $$

CREATE PROCEDURE atualizaSalarios(
IN base DECIMAL )

BEGIN

 
   START TRANSACTION;
   
      UPDATE func SET salario = salario * 1.05 
WHERE salario > base;
   
      UPDATE func SET salario = salario * 1.1 
 WHERE salario <= base;

   COMMIT;


END  $$

DELIMITER ;



call atualizaSalarios(2000);


select * from func;




drop procedure if exists calculaSub;


DELIMITER $$

CREATE PROCEDURE calculaSub( raiz INTEGER )

BEGIN
   
   DECLARE cont INTEGER DEFAULT 0;
   
   DROP TABLE IF EXISTS arvore;
   
   CREATE TABLE arvore
      
      SELECT idFunc, idChefe, 0 AS nivel 
      FROM func WHERE idChefe = raiz;
      
   ALTER TABLE arvore 
ADD PRIMARY KEY(idFunc,idChefe);



   REPEAT
 
      INSERT INTO arvore
  SELECT f.idFunc, f.idChefe, a.nivel+1 
      
         FROM func AS f JOIN arvore AS a ON f.idChefe = a.idFunc
      
         WHERE nivel = cont;
   
      SET cont = cont + 1;

   UNTIL Row_Count() = 0 

   END REPEAT;

END 
$$



select * from func;


CALL calculaSub(1);

SELECT * FROM arvore;



SELECT CONCAT(SPACE(nivel),idChefe) AS chefe,
 
      Group_Concat(idFunc ORDER BY idFunc) AS subordinado

FROM arvore
 GROUP BY idChefe;
