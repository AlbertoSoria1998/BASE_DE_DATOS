-- Crear tabla "Ganaderias"
CREATE TABLE Ganaderias (
    ID_Ganaderias NUMBER,
    Codigo VARCHAR2(10) NOT NULL,
    Localidad VARCHAR2(100) NOT NULL,
    Antiguedad DATE NOT NULL,
	CONSTRAINT PK_Ganaderias PRIMARY KEY (ID_Ganaderias),
    CONSTRAINT UQ_Ganaderias_Codigo UNIQUE (Codigo)
);

-- Crear tabla "PlazasDeToros"
CREATE TABLE PlazasDeToros (
    ID_PlazasDeToros NUMBER,
    Nombre VARCHAR2(100) NOT NULL,
    Localidad VARCHAR2(100) NOT NULL,
    Direccion VARCHAR2(100) NOT NULL,
    Aforo NUMBER NOT NULL,
	CONSTRAINT PK_PlazasDeToros PRIMARY KEY (ID_PlazasDeToros)
);

-- Crear tabla "Corridas"
CREATE TABLE Corridas (
    ID_CORRIDAS NUMBER,
	PlazasDeToros_ID NUMBER NOT NULL,
    Orden NUMBER NOT NULL,
    Feria VARCHAR2(50) NOT NULL,
    Anio NUMBER NOT NULL,
	CONSTRAINT PK_CORRIDAS PRIMARY KEY (ID_CORRIDAS),
	CONSTRAINT FK_CORRIDAS_PlazasDeToros FOREIGN KEY (PlazasDeToros_ID) REFERENCES PlazasDeToros(ID_PlazasDeToros)
);

-- Crear tabla "Apoderados"
CREATE TABLE Apoderados (
    ID_Apoderados NUMBER,
    DNI VARCHAR2(10) NOT NULL,
    Nombre VARCHAR2(50) NOT NULL,
    Direccion VARCHAR2(100) NOT NULL,
    Telefono VARCHAR2(20) NOT NULL,
	CONSTRAINT PK_Apoderados PRIMARY KEY (ID_Apoderados),
    CONSTRAINT UQ_Apoderados_DNI UNIQUE (DNI)
);

-- Crear tabla "Toreros"
CREATE TABLE Toreros (
    ID_TOREROS NUMBER,
	CORRIDAS_ID NUMBER NOT NULL,
	Apoderados_ID NUMBER NOT NULL,
    DNI VARCHAR2(10) NOT NULL,
    Nombre VARCHAR2(50) NOT NULL,
    Apodo VARCHAR2(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    FechaAlternativa DATE NOT NULL,
    CONSTRAINT PK_Toreros PRIMARY KEY (ID_TOREROS),
	CONSTRAINT FK_TOREROS_Corridas FOREIGN KEY (CORRIDAS_ID) REFERENCES Corridas(ID_CORRIDAS),
	CONSTRAINT FK_TOREROS_Apoderados FOREIGN KEY (Apoderados_ID) REFERENCES Apoderados(ID_Apoderados),
    CONSTRAINT UQ_TOREROS_DNI UNIQUE (DNI)
);

-- Crear tabla "Premios"
CREATE TABLE Premios (
    ID_PREMIOS NUMBER,
    Torero_ID NUMBER NOT NULL,
    Orejas NUMBER,
    Rabos NUMBER,
    PuertaGrande NUMBER,
	CONSTRAINT PK_Premios PRIMARY KEY (ID_PREMIOS),
    CONSTRAINT FK_Premios_TOREROS FOREIGN KEY (Torero_ID) REFERENCES Toreros(ID_TOREROS)
);

-- Crear tabla "Toros"
CREATE TABLE Toros (
    ID_TOROS NUMBER,
	Corrida_ID NUMBER NOT NULL,
    Ganaderia_ID NUMBER NOT NULL,
    CodigoGanaderia VARCHAR2(10) NOT NULL,
    AnioNacimiento NUMBER NOT NULL,
    NumeroOrden NUMBER NOT NULL,
    Nombre VARCHAR2(50) NOT NULL,
    Color VARCHAR2(50) NOT NULL,
    OrdenToreo NUMBER NOT NULL,
	CONSTRAINT PK_Toros PRIMARY KEY (ID_TOROS),
	CONSTRAINT FK_Toros_CORRIDAS FOREIGN KEY (Corrida_ID) REFERENCES Corridas(ID_CORRIDAS),
    CONSTRAINT FK_Toros_GANADERIAS FOREIGN KEY (Ganaderia_ID) REFERENCES Ganaderias(ID_Ganaderias)
);

-- Crear tabla "Toreros_Padrino"
CREATE TABLE Toreros_Padrino (
    ID_TOREROS NUMBER,
    ID_TOREROS_padrino NUMBER,
    CONSTRAINT PK_Toreros_Padrino PRIMARY KEY (ID_TOREROS, ID_TOREROS_padrino),
    CONSTRAINT FK_Toreros_Padrino_TOREROS FOREIGN KEY (ID_TOREROS) REFERENCES Toreros(ID_TOREROS),
    CONSTRAINT FK_Toreros_Padrino_padrino FOREIGN KEY (ID_TOREROS_padrino) REFERENCES Toreros(ID_TOREROS)
);

-- Crear tabla "Toros_Matados"
CREATE TABLE Toros_Matados (
    Torero_ID NUMBER,
    Toro_ID NUMBER,
    CONSTRAINT PK_Toros_Matados PRIMARY KEY (Torero_ID, Toro_ID),
    CONSTRAINT FK_Toros_Matados_Toreros FOREIGN KEY (Torero_ID) REFERENCES Toreros(ID_TOREROS),
    CONSTRAINT FK_Toros_Matados_Toros FOREIGN KEY (Toro_ID) REFERENCES Toros(ID_TOROS),
    CONSTRAINT UQ_Toros_Matados_Toro_ID UNIQUE (Toro_ID)
);

-- Insertar datos en la tabla "Ganaderias"
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES (1, 'GAN001', 'Localidad1', TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES       (2, 'GAN002', 'Localidad2', TO_DATE('2018-05-15','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES      (3, 'GAN003', 'Localidad3', TO_DATE('2015-11-30','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES	   (4, 'GAN004', 'Localidad4', TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES       (5, 'GAN005', 'Localidad5', TO_DATE('2018-05-15','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES       (6, 'GAN006', 'Localidad6', TO_DATE('2015-11-30','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES	   (7, 'GAN007', 'Localidad7', TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES       (8, 'GAN008', 'Localidad8',TO_DATE( '2018-05-15','YYYY-MM-DD'));
INSERT INTO Ganaderias (ID_Ganaderias, Codigo, Localidad, Antiguedad)
VALUES       (9, 'GAN009', 'Localidad9', TO_DATE('2015-11-30','YYYY-MM-DD'));

-- Insertar datos en la tabla "PlazasDeToros"
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES (1, 'Plaza1', 'Localidad1', 'Dirección1', 10000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES       (2, 'Plaza2', 'Localidad2', 'Dirección2', 8000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES       (3, 'Plaza3', 'Localidad3', 'Dirección3', 12000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES	   (4, 'Plaza4', 'Localidad4', 'Dirección4', 10000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES       (5, 'Plaza5', 'Localidad5', 'Dirección5', 8000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES       (6, 'Plaza6', 'Localidad6', 'Dirección6', 12000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES	   (7, 'Plaza7', 'Localidad7', 'Dirección7', 10000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES       (8, 'Plaza8', 'Localidad8', 'Dirección8', 8000);
INSERT INTO PlazasDeToros (ID_PlazasDeToros, Nombre, Localidad, Direccion, Aforo)
VALUES       (9, 'Plaza9', 'Localidad9', 'Dirección9', 12000);


-- Insertar datos en la tabla "Corridas"
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES (1, 1, 1, 'Feria1', 2023);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES       (2, 2, 2, 'Feria2', 2023);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES       (3, 1, 3, 'Feria3', 2023);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES	   (4, 1, 4, 'Feria4', 2014);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES      (5, 2, 5, 'Feria5', 2021);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES       (6, 1, 6, 'Feria6', 2022);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES	   (7, 1, 7, 'Feria7', 2018);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES       (8, 2, 8, 'Feria8', 2019);
INSERT INTO Corridas (ID_CORRIDAS, PlazasDeToros_ID, Orden, Feria, Anio)
VALUES       (9, 1, 9, 'Feria9', 2020);

-- Insertar datos en la tabla "Apoderados"
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES (1, 'DNI001', 'Apoderado1', 'Dirección1', '987600321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (2, 'DNI002', 'Apoderado2', 'Dirección2', '987601321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (3, 'DNI003', 'Apoderado3', 'Dirección3', '987602321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES 	   (4, 'DNI004', 'Apoderado4', 'Dirección4', '987603321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (5, 'DNI005', 'Apoderado5', 'Dirección5', '987604321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (6, 'DNI006', 'Apoderado6', 'Dirección6', '987605321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES 	   (7, 'DNI007', 'Apoderado7', 'Dirección7', '987606321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (8, 'DNI008', 'Apoderado8', 'Dirección8', '987607321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (9, 'DNI009', 'Apoderado9', 'Dirección9', '987608321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES 	   (10, 'DNI010', 'Apoderado10', 'Dirección10', '987609321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (11, 'DNI011', 'Apoderado11', 'Dirección11', '987610321');
INSERT INTO Apoderados (ID_Apoderados, DNI, Nombre, Direccion, Telefono)
VALUES        (12, 'DNI012', 'Apoderado12', 'Dirección12', '987611321');

-- Insertar datos en la tabla "Toreros"
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES (1, 1, 1, 'DNI001', 'Torero1', 'Apodo1', TO_DATE('1990-01-01','YYYY-MM-DD'),TO_DATE( '2010-05-15','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (2, 2, 2, 'DNI002', 'Torero2', 'Apodo2', TO_DATE('1992-03-10','YYYY-MM-DD'),TO_DATE( '2012-08-20','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (3, 3, 3, 'DNI003', 'Torero3', 'Apodo3', TO_DATE('1995-06-20','YYYY-MM-DD'), TO_DATE('2015-11-30','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES	   (4, 1, 1, 'DNI004', 'Torero4', 'Apodo4', TO_DATE('1990-01-01','YYYY-MM-DD'), TO_DATE('2010-05-15','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (5, 2, 2, 'DNI005', 'Torero5', 'Apodo5', TO_DATE('1992-03-10','YYYY-MM-DD'), TO_DATE('2012-08-20','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (6, 3, 3, 'DNI006', 'Torero6', 'Apodo6',TO_DATE( '1995-06-20','YYYY-MM-DD'), TO_DATE('2015-11-30','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES	   (7, 1, 1, 'DNI007', 'Torero7', 'Apodo7',TO_DATE( '1990-01-01','YYYY-MM-DD'), TO_DATE('2010-05-15','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (8, 2, 2, 'DNI008', 'Torero8', 'Apodo8', TO_DATE('1992-03-10','YYYY-MM-DD'), TO_DATE('2012-08-20','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (9, 3, 3, 'DNI009', 'Torero9', 'Apodo9',TO_DATE( '1995-06-20','YYYY-MM-DD'), TO_DATE('2015-11-30','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES	   (10, 1, 1, 'DNI010', 'Torero10', 'Apodo10',TO_DATE( '1990-01-01','YYYY-MM-DD'), TO_DATE('2010-05-15','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (11, 2, 2, 'DNI011', 'Torero11', 'Apodo11',TO_DATE( '1992-03-10','YYYY-MM-DD'), TO_DATE('2012-08-20','YYYY-MM-DD'));
INSERT INTO Toreros (ID_TOREROS, CORRIDAS_ID, Apoderados_ID, DNI, Nombre, Apodo, FechaNacimiento, FechaAlternativa)
VALUES       (12, 3, 3, 'DNI012', 'Torero12', 'Apodo12', TO_DATE('1995-06-20','YYYY-MM-DD'),TO_DATE( '2015-11-30','YYYY-MM-DD'));

-- Insertar datos en la tabla "Premios"
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES (1, 1, 2, 0, 1);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES (2, 2, 1, 1, 0);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES        (3, 3, 3, 0, 1);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES 	   (4, 4, 2, 0, 1);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES       (5, 5, 1, 1, 0);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES        (6, 6, 3, 0, 1);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES 	   (7, 7, 2, 0, 1);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES        (8, 8, 1, 1, 0);
INSERT INTO Premios (ID_PREMIOS, Torero_ID, Orejas, Rabos, PuertaGrande)
VALUES        (9, 9, 3, 0, 1);

-- Insertar datos en la tabla "Toros"
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES (1, 1, 1, 'GAN001', 2018, 1, 'Toro1', 'Negro', 1);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (2, 2, 2, 'GAN002', 2019, 2, 'Toro2', 'Colorado', 2);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (3, 3, 3, 'GAN003', 2017, 3, 'Toro3', 'Blanco', 3);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES 	   (4, 4, 4, 'GAN001', 2018, 4, 'Toro4', 'Negro', 4);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (5, 5, 5, 'GAN002', 2019, 5, 'Toro5', 'Colorado', 5);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (6, 6, 6, 'GAN003', 2017, 6, 'Toro6', 'Blanco', 6);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES 	   (7, 7, 7, 'GAN001', 2018, 7, 'Toro7', 'Negro', 7);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (8, 8, 8, 'GAN002', 2019, 8, 'Toro8', 'Colorado', 8);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (9, 9, 9, 'GAN003', 2017, 9, 'Toro9', 'Blanco', 9);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES 	   (10, 7, 1, 'GAN001', 2018, 7, 'Toro7', 'Negro', 7);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (11, 8, 1, 'GAN002', 2019, 8, 'Toro8', 'Colorado', 8);
INSERT INTO Toros (ID_TOROS, Corrida_ID, Ganaderia_ID, CodigoGanaderia, AnioNacimiento, NumeroOrden, Nombre, Color, OrdenToreo)
VALUES        (12, 9, 1, 'GAN003', 2017, 9, 'Toro9', 'Blanco', 9);

-- Insertar datos en la tabla "Toros_Matados"
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES (1, 1);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(1, 2);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(1, 3);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(2, 4);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(2, 5);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(2, 6);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(2, 7);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(3, 8);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(3, 9);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(3, 10);
INSERT INTO Toros_Matados (Torero_ID, Toro_ID)
VALUES		(3, 11);








-- ¿Cuántos premios ha ganado el torero con el ID_TORERO 1?
SELECT p.ID_PREMIOS, p.Orejas, p.Rabos, p.PuertaGrande
FROM Premios p
WHERE p.Torero_ID = 1;




-- ¿Cuáles son los nombres y colores de los toros de la ganadería con el ID_GANADERIA específico?
SELECT t.Nombre, t.Color
FROM Toros t
INNER JOIN Ganaderias g ON t.Ganaderia_ID = g.ID_Ganaderias
WHERE g.ID_Ganaderias = 1;

-- ¿Cuáles son los nombres y apodos de los toreros que han actuado en la plaza de toros con el ID_PLAZA_TOROS específico?
SELECT tr.Nombre, tr.Apodo
FROM Toreros tr
INNER JOIN Corridas c ON tr.CORRIDAS_ID = c.ID_CORRIDAS
INNER JOIN PlazasDeToros pt ON c.PlazasDeToros_ID = pt.ID_PlazasDeToros
WHERE pt.ID_PlazasDeToros = 1;




-- ¿Cuál es la ganadería con el mayor número de toros criados y cuántos toros ha criado?
SELECT ID_Ganaderias, Localidad, TotalToros
FROM (
    SELECT g.ID_Ganaderias, g.Localidad, COUNT(t.ID_TOROS) AS TotalToros,
           ROW_NUMBER() OVER (ORDER BY COUNT(t.ID_TOROS) DESC) AS RowNumber
    FROM Ganaderias g
    INNER JOIN Toros t ON g.ID_Ganaderias = t.Ganaderia_ID
    GROUP BY g.ID_Ganaderias, g.Localidad
)
WHERE RowNumber = 1;








-- Esta consulta te proporcionará el año, el color de los toros y la cantidad total de toros de ese color para cada año en la base de datos.
SELECT c.Anio, t.Color, COUNT(t.ID_TOROS) AS TotalToros
FROM Toros t
INNER JOIN Corridas c ON t.Corrida_ID = c.ID_CORRIDAS
GROUP BY c.Anio, t.Color;





-- Esta consulta te proporcionará el año, el color de los toros y la cantidad total de toros de ese color para cada año en la base de datos.
-- Con esta modificación, los resultados se ordenarán primero por año en orden ascendente y luego por la 
-- cantidad total de toros en orden descendente para cada año.
SELECT c.Anio, t.Color, COUNT(t.ID_TOROS) AS TotalToros
FROM Toros t
INNER JOIN Corridas c ON t.Corrida_ID = c.ID_CORRIDAS
GROUP BY c.Anio, t.Color
ORDER BY c.Anio, TotalToros DESC;



-- me dara la suma total de toros 
SELECT c.Anio, t.Color, COUNT(t.ID_TOROS) AS TotalToros
FROM Toros t
INNER JOIN Corridas c ON t.Corrida_ID = c.ID_CORRIDAS
GROUP BY GROUPING SETS ((c.Anio, t.Color), ())
HAVING (c.Anio IS NOT NULL AND t.Color IS NOT NULL) OR (c.Anio IS NULL AND t.Color IS NULL)
ORDER BY c.Anio, TotalToros DESC;

