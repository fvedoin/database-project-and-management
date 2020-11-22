use proj_ger_bd_7;

ALTER TABLE participacao DROP FOREIGN KEY fk_part_reuniao;

ALTER TABLE participacao DROP PRIMARY KEY;
ALTER TABLE reuniao DROP PRIMARY KEY;

ALTER TABLE participacao ADD COLUMN numSala INT;
ALTER TABLE participacao ADD COLUMN data DATETIME;

UPDATE participacao p SET numSala = (SELECT numSala FROM reuniao r WHERE r.idReuniao = p.idReuniao);
UPDATE participacao p SET data = (SELECT data FROM reuniao r WHERE r.idReuniao = p.idReuniao);

ALTER TABLE reuniao drop column idReuniao;
ALTER TABLE participacao drop column idReuniao;

ALTER TABLE reuniao ADD CONSTRAINT pk_reuniao PRIMARY KEY (data, numSala);

ALTER TABLE participacao ADD CONSTRAINT fk_data_part FOREIGN KEY (data) REFERENCES reuniao (data);
ALTER TABLE participacao ADD CONSTRAINT fk_sala_part FOREIGN KEY (numSala) REFERENCES reuniao (numSala);

ALTER TABLE participacao ADD CONSTRAINT pk_part PRIMARY KEY (data, numSala, matr);