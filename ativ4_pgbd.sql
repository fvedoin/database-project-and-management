use proj_ger_bd_5;

UPDATE projeto SET status_ = "Encerrado" WHERE status_ like "encerrado";
UPDATE projeto SET status_ = "Encerrado" WHERE status_ like "conclu%do";
UPDATE projeto SET status_ = "Aberto" WHERE status_ like "aberto";
UPDATE projeto SET status_ = "Aberto" WHERE status_ like "n%o encerrado";

CREATE TABLE status_(
	idStatus int AUTO_INCREMENT,
	nome char(30),
	PRIMARY KEY (idStatus)
);

ALTER TABLE status_ MODIFY nome ENUM ("Aberto", "Encerrado");

INSERT INTO status_(nome) SELECT DISTINCT status_ FROM projeto;

ALTER TABLE projeto ADD COLUMN idStatus int;

UPDATE projeto p SET idStatus = (SELECT DISTINCT idStatus FROM status_ s WHERE s.nome = p.status_);

ALTER TABLE projeto ADD FOREIGN KEY fk_projeto_status (idStatus) REFERENCES status_ (idStatus);

ALTER TABLE projeto DROP COLUMN status_;