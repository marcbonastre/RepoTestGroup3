CREATE table TablaFerran (c1 int(11), c2 int(11));

CREATE TABLE TablaFerran2 (c1 int(11), c2 varchar(64));

DROP TABLE TablaFerran2; 

ALTER TABLE TablaFerran ADD PRIMARY KEY (c1);

INSERT INTO TablaFerran (c1,c2) VALUES (6,23);

UPDATE TablaFerran SET c1=3, c2=99 WHERE c1=1;

ALTER TABLE TablaFerran ADD COLUMN c3 varchar(64);

INSERT INTO TablaFerran (c1,c2,c3) VALUES (4,11,'Test');

SELECT * from TablaFerran;

SELECT sum(c2) from TablaFerran;

SELECT sum(T.c2) AS SUMA from TablaFerran AS T  GROUP BY c3; /*AS = renombrar columnas o tablas
