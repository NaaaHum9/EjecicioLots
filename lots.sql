spool C:\Users\jnvg9\OneDrive\Escritorio\salidasbases\salidaLots.txt

--clear screen;
set linesize 150
set PAGESIZE 99
set COLSEP '|*|'

--Borrado de tablas
DROP TABLE Lots CASCADE CONSTRAINT;
DROP TABLE Lots1 CASCADE CONSTRAINT;
DROP TABLE Lots2 CASCADE CONSTRAINT;
DROP TABLE Lots1A CASCADE CONSTRAINT;
DROP TABLE Lots1B CASCADE CONSTRAINT;

--Tablas
CREATE TABLE Lots(
    property_id NUMBER(10),
    country_name VARCHAR(25),
    lot NUMBER(5),
    area NUMBER(5),
    price NUMBER(5),
    tax_rate NUMBER(5)
);

CREATE TABLE Lots1(
    property_id NUMBER(10),
    country_name VARCHAR(25),
    lot NUMBER(5),
    area NUMBER(5),
    price NUMBER(5)
);

CREATE TABLE Lots2(
    country_name VARCHAR(25),
    tax_rate NUMBER(5)
);

CREATE TABLE Lots1A(
    property_id NUMBER(10),
    country_name VARCHAR(25),
    lot NUMBER(5),
    area NUMBER(5)
);

CREATE TABLE Lots1B(
    area NUMBER(5),
    price NUMBER(5)
);

--Restricciones
ALTER TABLE  Lots
ADD CONSTRAINT property_id_PK PRIMARY KEY (property_id);

ALTER TABLE Lots1
ADD CONSTRAINT property_id_FKL1 FOREIGN KEY (property_id) REFERENCES Lots(property_id);

ALTER TABLE Lots2
ADD CONSTRAINT country_name_FKL2 FOREIGN KEY (country_name) REFERENCES Lots(country_name);

ALTER TABLE Lots1A
ADD CONSTRAINT property_id_FKLA FOREIGN KEY (property_id) REFERENCES Lots(property_id);

ALTER TABLE Lots1B
ADD CONSTRAINT area_FKLB FOREIGN KEY (area) REFERENCES Lots(area);


--Insertar datos
INSERT INTO Lots VALUES (1, 'Country1', 101, 500, 1000, 5);
INSERT INTO Lots VALUES (2, 'Country2', 102, 600, 1200, 6);
INSERT INTO Lots VALUES (3, 'Country2', 103, 300, 400, 5);
INSERT INTO Lots VALUES (4, 'Country3', 104, 400, 1000, 6);
INSERT INTO Lots VALUES (5, 'Country3', 105, 900, 1400, 5);
INSERT INTO Lots VALUES (6, 'Country4', 106, 500, 1000, 6);
INSERT INTO Lots VALUES (7, 'Country4', 107, 100, 200, 5);

INSERT INTO Lots1 VALUES (1, 'Country1', 101, 500, 1000);
INSERT INTO Lots1 VALUES (2, 'Country2', 102, 600, 1200);
INSERT INTO Lots1 VALUES (3, 'Country2', 103, 300, 400);
INSERT INTO Lots1 VALUES (4, 'Country3', 104, 400, 1000);
INSERT INTO Lots1 VALUES (5, 'Country3', 105, 900, 1400);
INSERT INTO Lots1 VALUES (6, 'Country4', 106, 500, 1000);
INSERT INTO Lots1 VALUES (7, 'Country4', 107, 100, 200);


INSERT INTO Lots2 VALUES ('Country1', 5);
INSERT INTO Lots2 VALUES ('Country2', 6);
INSERT INTO Lots2 VALUES ('Country2', 5);
INSERT INTO Lots2 VALUES ('Country3', 6);
INSERT INTO Lots2 VALUES ('Country3', 5);
INSERT INTO Lots2 VALUES ('Country4', 6);
INSERT INTO LOTS2 VALUES ('Country4', 5);

INSERT INTO Lots1A VALUES (1, 'Country1', 101, 500);
INSERT INTO Lots1A VALUES (2, 'Country2', 102, 600);
INSERT INTO Lots1A VALUES (3, 'Country2', 103, 300);
INSERT INTO Lots1A VALUES (4, 'Country3', 104, 400);
INSERT INTO Lots1A VALUES (5, 'Country3', 105, 900);
INSERT INTO Lots1A VALUES (6, 'Country4', 106, 500);
INSERT INTO Lots1A VALUES (7, 'Country4', 107, 100);


INSERT INTO Lots1B VALUES (500, 1000);
INSERT INTO Lots1B VALUES (600, 1200);
INSERT INTO Lots1B VALUES (300, 400);
INSERT INTO Lots1B VALUES (400, 1000);
INSERT INTO Lots1B VALUES (900, 1400);
INSERT INTO Lots1B VALUES (500, 1000);
INSERT INTO Lots1B VALUES (100, 200);



--Desplega las tablas
SELECT * FROM Lots;
SELECT * FROM Lots1;
SELECT * FROM Lots2;
SELECT * FROM Lots1A;
SELECT * FROM Lots1B;

-- Da formato a la salida de datos 
rem desplegar por TABLE_NAME & CONSTRAINT
col owner FORMAT A12
col CONSTRAINT_NAME FORMAT A31
col CONSTRAINT_TYPE FORMAT A10
col table_name FORMAT A25
col status  FORMAT A10

-- Despliega las restricciones 
SELECT owner, CONSTRAINT_NAME,
    CONSTRAINT_TYPE, status
    FROM user_constraints
    WHERE table_name IN ('LOTS', 'LOTS1', 'LOTS2', 'LOTS1A', 'LOTS1B');

spool off