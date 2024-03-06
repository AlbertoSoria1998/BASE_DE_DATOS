CREATE TABLE asignatura (
 codasignatura VARCHAR2(12 BYTE) NOT NULL,
 nombreasignatura VARCHAR2(40 BYTE) NOT NULL,
 credito NUMBER(2) NOT NULL,
 codequivalencia VARCHAR2(12 BYTE)
);
ALTER TABLE asignatura ADD CONSTRAINT asignatura_pk PRIMARY KEY (
codasignatura );
CREATE TABLE carreraprofesional (
 codigo VARCHAR2(3 BYTE) NOT NULL,
 nombreespanol VARCHAR2(60 BYTE) NOT NULL,
 abreespanol VARCHAR2(25 BYTE) NOT NULL
);
ALTER TABLE carreraprofesional ADD CONSTRAINT carreraprofesional_pk PRIMARY
KEY ( codigo );
CREATE TABLE estudiante (
 nummatricula VARCHAR2(10 BYTE) NOT NULL,
 codigo VARCHAR2(3 BYTE) NOT NULL,
 semingreso VARCHAR2(5 BYTE) NOT NULL,
 fecingreso DATE NOT NULL
);
ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY (
nummatricula, codigo );
CREATE TABLE persona (
 nummatricula VARCHAR2(10 BYTE) NOT NULL,
 apellidos VARCHAR2(30 BYTE) NOT NULL,
 nombres VARCHAR2(30 BYTE) NOT NULL,
 fecnac DATE NOT NULL
);
COMMENT ON COLUMN persona.fecnac IS 'Fecha de nacimiento';
ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( nummatricula
);
CREATE TABLE persona_condicion (
 contador NUMBER(5) NOT NULL,
 condicion VARCHAR2(20 BYTE) NOT NULL,
 fechacondición DATE NOT NULL,
 nummatricula VARCHAR2(10 BYTE) NOT NULL
);
COMMENT ON COLUMN persona_condicion.condicion IS
 'Postulante, Admitido, Estudiante, Egresado, Graduado, Postulante Maestria,
Postulante Doctorado, Admitido Maestria, Admitido Doctorado, Estudiante Maestria,
Estudiante Doctorado, Graduado Maestria, Graduado Doctorado.';
ALTER TABLE persona_condicion ADD CONSTRAINT persona_condicion_pk
PRIMARY KEY ( contador, nummatricula );
CREATE TABLE plan_asignatura (
 codplan NUMBER(8) NOT NULL,
 codigo VARCHAR2(3 BYTE) NOT NULL,
 codasignatura VARCHAR2(12 BYTE) NOT NULL
);
ALTER TABLE plan_asignatura
 ADD CONSTRAINT plan_asignatura_pk PRIMARY KEY ( codplan, codigo,
codasignatura );
CREATE TABLE planestudio (
 codigo VARCHAR2(3 BYTE) NOT NULL,
 codplan NUMBER(8) NOT NULL,
 abreviatura VARCHAR2(10 BYTE) NOT NULL,
 nombreplan VARCHAR2(60 BYTE) NOT NULL,
 fecaprobado DATE NOT NULL,
 semejecucion VARCHAR2(5 BYTE),
 estadovigente CHAR(1 BYTE) NOT NULL
);
COMMENT ON COLUMN planestudio.estadovigente IS
 '1 implica que persona que ingrese a algún programa deberá estar inscrito en este
plan.
0 estuvo vigente.';
ALTER TABLE planestudio ADD CONSTRAINT planestudio_pk PRIMARY KEY (
codplan, codigo );
ALTER TABLE estudiante
 ADD CONSTRAINT est_carpro_fk FOREIGN KEY ( codigo )
 REFERENCES carreraprofesional ( codigo );
ALTER TABLE estudiante
 ADD CONSTRAINT est_per_fk FOREIGN KEY ( nummatricula )
 REFERENCES persona ( nummatricula );
ALTER TABLE persona_condicion
 ADD CONSTRAINT per_con_per_fk FOREIGN KEY ( nummatricula )
 REFERENCES persona ( nummatricula );
ALTER TABLE plan_asignatura
 ADD CONSTRAINT pla_asi_asi_fk FOREIGN KEY ( codasignatura )
 REFERENCES asignatura ( codasignatura );
ALTER TABLE plan_asignatura
 ADD CONSTRAINT pla_asi_plaest_fk FOREIGN KEY ( codplan, codigo )
 REFERENCES planestudio ( codplan, codigo );
ALTER TABLE planestudio
 ADD CONSTRAINT plaest_carpro_fk FOREIGN KEY ( codigo )
 REFERENCES carreraprofesional ( codigo );
 
-- Crear la tabla Correos
CREATE TABLE Correos (
  ID_Correo NUMBER,
  NumMatricula VARCHAR2(10),
  Correo VARCHAR2(100),
  CONSTRAINT Correos_PK PRIMARY KEY (ID_Correo),
  CONSTRAINT Correos_FK FOREIGN KEY (NumMatricula) REFERENCES Persona_Condicion (NumMatricula)
);

-- Agregar la columna CorreoPrincipal a la tabla Persona_Condicion
ALTER TABLE Persona_Condicion ADD CorreoPrincipal CHAR(1);

-- Agregar clave única en la tabla Persona_Condicion
ALTER TABLE Persona_Condicion ADD CONSTRAINT Persona_Condicion_UQ UNIQUE (NumMatricula);



/* ¿Cuál es la cantidad de estudiantes admitidos en cada carrera 
profesional que tienen más de 25 créditos acumulados en asignaturas de la facultad?

*/

SELECT cp.CODIGO, cp.nombreespanol "CARRERA PROFESIONAL", COUNT(DISTINCT e.nummatricula) AS cantidad_estudiantes_admitidos
    FROM ESTUDIANTE e
        INNER JOIN persona_condicion pc ON e.nummatricula = pc.nummatricula
        INNER JOIN carreraprofesional cp ON e.CODIGO = cp.CODIGO
        INNER JOIN planestudio pe ON e.CODIGO = pe.CODIGO
        INNER JOIN plan_asignatura pa ON pe.codplan = pa.codplan AND e.CODIGO = pa.CODIGO
        INNER JOIN asignatura a ON pa.codasignatura = a.codasignatura
        WHERE pc.condicion = 'Admitido' AND a.credito > 25
    GROUP BY cp.CODIGO, cp.nombreespanol;
    