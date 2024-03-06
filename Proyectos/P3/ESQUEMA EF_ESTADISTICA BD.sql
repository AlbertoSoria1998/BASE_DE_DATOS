SHOW USER;

CREATE TABLE Universidades (
    ID_Universidad NUMBER,
    NombreUniversidad VARCHAR2(100),
    NombreUniversidad_CORTO VARCHAR2(20),
	CONSTRAINT PK_Universidades PRIMARY KEY (ID_Universidad)
);

CREATE TABLE Facultades (
    ID_Facultad NUMBER,
    UniversidadID NUMBER,
    NombreFacultad VARCHAR2(100),
	direccion_Facultad VARCHAR2(150),
    NombreFacultad_CORTO VARCHAR2(20),
	CONSTRAINT PK_Facultades PRIMARY KEY (ID_Facultad),
	CONSTRAINT FK_Facultades_Universidades FOREIGN KEY (UniversidadID) REFERENCES Universidades (ID_Universidad)
);

CREATE TABLE EscuelasProfesionales (
    ID_EscuelaProfesional NUMBER,
    FacultadID NUMBER,
    NombreEscuelaProfesional VARCHAR2(100),
	Bienvenida_EscuelaProfesional VARCHAR2(3500),
	mision_EscuelaProfesional VARCHAR2(800),
	vision_EscuelaProfesional VARCHAR2(800),
    NombreEscuelaProfesional_CORTO VARCHAR2(20),
	CONSTRAINT PK_EscuelasProfesionales PRIMARY KEY (ID_EscuelaProfesional),
	CONSTRAINT FK_EscuelasProfesionales_Facultades FOREIGN KEY (FacultadID) REFERENCES Facultades (ID_Facultad)
);

CREATE TABLE PlanesEstudios (
    ID_PlanEstudios NUMBER,
    EscuelaProfesionalID NUMBER,
	ANIO NUMBER,
    Semestre VARCHAR2(10),
	CONSTRAINT PK_PlanesEstudios PRIMARY KEY (ID_PlanEstudios),
	CONSTRAINT FK_PlanesEstudios_EscuelasProfesionales FOREIGN KEY (EscuelaProfesionalID) REFERENCES EscuelasProfesionales (ID_EscuelaProfesional)
);

CREATE TABLE ESTUDIANTES (
    DNI_ESTUDIANTE VARCHAR2(8),
    PlanEstudiosID NUMBER,
    NOMBRES_EST VARCHAR2(50),
	APELLIDOS_EST VARCHAR2(50),
	GENERO_EST VARCHAR2(50),
	CORREO_EST VARCHAR2(50),
	TELEFONO_EST VARCHAR2(50),
	FECHA_NAC DATE,
	FECHA_INGRESO DATE,
	FECHA_EGRESO DATE,
	CREDITOS_COMPLETADOS NUMBER,
	ESTADO_ESTUDIANTE VARCHAR2(50),
	CODIGO_ESTUDIANTE VARCHAR2(10),
	CONSTRAINT PK_ESTUDIANTES PRIMARY KEY (DNI_ESTUDIANTE),
	CONSTRAINT FK_ESTUDIANTES_PlanesEstudios FOREIGN KEY (PlanEstudiosID) REFERENCES PlanesEstudios (ID_PlanEstudios)
);

-- Insertar datos en la tabla Universidades
INSERT INTO Universidades (ID_Universidad, NombreUniversidad, NombreUniversidad_CORTO)
VALUES (1, 'Universidad de San Martin de Porres', 'USMP' );

-- Insertar datos en la tabla Facultades
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES (1, 1, 'Facultad de Ingeniería y Arquitectura', 'Av. La Fontana 1250, Urb. Santa Patricia. La Molina', 'FIA');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES (2, 1, 'Facultad de Ciencias Administrativas y Recursos Humanos', 'Jr. Las Calandrias Nº 151 – 291, Santa Anita – Lima 43, Perú', 'FCARRHH');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES (3, 1, 'Facultad de Derecho', 'Alameda del Corregidor N° 1865, La Molina.', 'FD');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES (4, 1, 'Facultad de Medicina Humana', 'Av. Alameda del Corregidor 1517-1531, Urb. Sirius – III Etapa – La Molina', 'FMH');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES	(5, 1, 'Facultad de Ciencias de la Comunicación, Turismo y Psicologia', 'Av. Tomás Marsano 242, Surquillo Lima 34, Perú', 'FCCTP');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES	(6, 1, 'Facultad de Odontologia', 'Sede Lima: Jr. Las Calandrias 151 – 291 – Santa Anita', 'FO');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES	(7, 1, 'Facultad de Ciencias Contables, Económicas y Financieras', 'Sede Lima: Jr. Las Calandrias 151 – 291 – Santa Anita', 'FCCEF');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES	(8, 1, 'Facultad de Obstetricia y Enfermeria', 'Av. Salaverry 1136-1144 Jesús María, Lima, Perú', 'FOE');
        
        
-- Insertar datos en la tabla EscuelasProfesionales
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES (1, 1, 'Ingeniería de Computación y Sistemas','La Escuela Profesional de Ingeniería de Computación y Sistemas (EPICS) les da la bienvenida y comparte con ustedes la visión, misión y los campos de acción.','Formar profesionales en la especialidad de Ingeniería de Computación y Sistemas con sólidos valores, competentes y creativos para resolver problemas en el contexto laboral y social; desarrollar habilidades para responder a los cambios y desafíos del entorno; fomentar la investigación aplicada en el desarrollo de sistemas de información; promover actividades de extensión y proyección social que beneficien a la sociedad.','Llegar a ser la mejor Escuela Profesional del país dedicada a la formación de Ingenieros de Computación y Sistemas de clase internacional; con una cultura institucional en la que se fortalezcan los valores; comprometida con la búsqueda constante de la excelencia, el desarrollo integral del estudiante, la investigación y su proyección a la sociedad.' , 'EPICS');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES  (2, 1, 'Ingeniería Industrial','La Escuela Profesional de Ingeniería Industrial (EPII) es parte de la Facultad de Ingeniería y Arquitectura (FIA) y es la encargada de la formación profesional de nuevos ingenieros industriales con las competencias requeridas para su éxito laboral y bajo los valores y principios que demanda la sociedad. La EPII comprometida con el desarrollo nacional a través de la formación de ingenieros industriales con conocimientos sólidos, aplicación práctica de la teoría, espíritu de innovación y un enfoque claro con la responsabilidad social y medio ambiental.','Somos una escuela profesional formadora de ingenieros industriales de alto nivel científico y tecnológico orientados a la investigación, con sólidos valores humanísticos, éticos y morales. Contamos con los recursos adecuados para contribuir en el desarrollo sostenible, la innovación y la promoción del emprendimiento en el país.','Lideraremos la formación universitaria en Ingeniería Industrial, por ser una escuela dinámica y flexible, atenta a los cambios científicos, sociales y tecnológicos, siendo reconocidos en el ámbito nacional e internacional como la escuela de ingeniería con el más alto nivel de excelencia del país.', 'EPII');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES  (3, 1, 'Ingeniería Civil','Estimados miembros de la comunidad universitaria de la Facultad de Ingeniería y Arquitectura (FIA) de la Universidad de San Martín de Porres, en nombre de la Escuela Profesional de Ingeniería Civil; deseo darles una cordial bienvenida a nuestro portal y a través de él, poder estar informados de las actividades que desarrollamos en la FIA. La Escuela Profesional de Ingeniería Civil tiene más de 30 años de funcionamiento y un sinnúmero de egresados que se encuentran en el mercado laboral trabajando al interior del país como en el entorno internacional, con gran éxito, prestigiando nuestra institución.','Formar Ingenieros Civiles en forma integral, con sólida formación científica, tecnológica y humanística, que lideren la profesión para poder realizar el diseño, construcción, supervisión, consultoría y gestión de los proyectos y obras, con habilidades para la investigación y la formación de empresas, con ética, responsabilidad social, respeto a la cultura, al medio ambiente y al desarrollo sostenible.','Seremos la mejor escuela Profesional del país dedicada a la formación integral de sus profesionales, con habilidades para la investigación, con capacidad técnica de planificación, diseño, construcción y gestión de infraestructura y obras civiles en general, así como el mantenimiento y rehabilitación de estas.', 'EPIC');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES  (4, 1, 'Arquitectura','Estimados miembros de la comunidad universitaria de la Facultad de Ingeniería y Arquitectura (FIA) de la Universidad de San Martín de Porres, en nombre de la Escuela Profesional de Arquitectura; deseo darles una cordial bienvenida a nuestro portal y a través de él, poder estar informados de las actividades que desarrollamos en la FIA. La Escuela Profesional de Arquitectura tiene 18 años de funcionamiento y un sinnúmero de egresados que se encuentran en el mercado laboral trabajando al interior del país como en el entorno internacional, con gran éxito, prestigiando nuestra institución.','Formar arquitectos en forma integral, con sólida formación artística, científica, tecnológica y humanística, que lideren la profesión para poder realizar el diseño con ética, responsabilidad social, respeto a nuestros valores ancestrales, nuestro patrimonio monumental, la cultura, al medio ambiente y al desarrollo sostenible.','Nuestro objetivo creador de Escuela Profesional es la formación integral de profesionales, con habilidades para la investigación, con alta capacidad técnica de diseño, uso de la tecnología de avanzada.', 'EPA');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES  (5, 1, 'Ciencias Aeronauticas','Escuela perteneciente a la Facultad de Ingeniería y Arquitectura. Esta carrera busca preparar a los estudiantes en una profesión competitiva, que le permita ejercer una gestión responsable en todas las actividades de la aviación. El egresado de la especialidad de Ciencias Aeronáuticas contará con una sólida formación en gestión de negocios, con enfoque en el sector aeronáutico. Adicionalmente, la carrera le proveerá de todo el fundamento teórico, además de la instrucción y entrenamiento de vuelo necesario para estar apto en la rendición de los exámenes y vuelos de chequeo ante la Dirección General de Aeronáutica Civil (DGAC), y así obtener la licencia de Piloto Comercial. Este objetivo se enmarca en los principios rectores de la Universidad de San Martín de Porres y de la Facultad de Ingeniería y Arquitectura, orientados a la formación de profesionales altamente calificados para satisfacer la demanda que requiere la sociedad.','Formar profesionales del más alto nivel para el Mercado Aeronáutico Nacional e Internacional, con sólidos valores, competencias y habilidades para responder a los cambios y desafíos del entorno; y así satisfacer la demanda que requiere la sociedad.','Ser la mejor Escuela Profesional de Latinoamérica, dedicada a la formación de profesionales con sólido enfoque en la gestión de negocios y en el pilotaje de aeronaves de transporte de pasajeros y de carga.', 'EPCA' );


-- Insertar datos en la tabla PlanesEstudios
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES (1, 1, '2023','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (2, 1, '2020','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (3, 1, '2021','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (4, 1, '2021','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES 	   (5, 1, '2022','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (6, 1, '2022','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (7, 1, '2020','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (8, 1, '2023','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES 	   (9, 2, '2020','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (10, 2, '2020','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (11, 2, '2021','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (12, 2, '2021','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES 	   (13, 2, '2022','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (14, 2, '2022','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (15, 2, '2023','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (16, 2, '2023','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES 	   (17, 3, '2020','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (18, 3, '2020','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (19, 3, '2021','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (20, 3, '2021','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES 	   (21, 3, '2022','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (22, 3, '2022','II');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (23, 3, '2023','I');
INSERT INTO PlanesEstudios (ID_PlanEstudios, EscuelaProfesionalID, ANIO, Semestre)
VALUES        (24, 3, '2023','II');        
        


	   -- ESTUDIANTES MATRICULADOS
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES ('34481290', 1, 'Juan Carlos', 'Perez Lopez', 'Masculino', 'juan_perez@usmp.pe', '987654321', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  120, 'Matriculado', '2021010001');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34482290', 1, 'Maria Sofia', 'Garcia Torres', 'Femenino', 'maria_garcia@usmp.pe', '976543210', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 90, 'Matriculado', '2021010002');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34483290', 1, 'Pedro Antonio', 'Lopez Ramirez', 'Masculino', 'pedro_lopez@usmp.pe', '965432109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 60, 'Matriculado', '2021010003');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34484290', 1, 'Ana', 'López Hernández', 'Femenino', 'ana_lopez@usmp.pe', '987652221', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),130, 'Matriculado', '2021010004');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34485290', 1, 'Luis', 'Torres González', 'Masculino', 'luis_torres@usmp.pe', '976541110', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 100, 'Matriculado', '2021010005');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34486290', 1, 'Laura', 'Sánchez Ramírez', 'Femenino', 'laura_sanchez@usmp.pe', '965123109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 65, 'Matriculado', '2021010006');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34487290', 1, 'Carlos', 'Méndez Morales', 'Masculino', 'carlos_mendez@usmp.pe', '987654421', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  125, 'Matriculado', '2021010007');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34488290', 1, 'Paola', 'Ramírez Jiménez', 'Femenino', 'paola_ramirez@usmp.pe', '976453210', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 85, 'Matriculado', '2021010008');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34489290', 1, 'Diego', 'Ruiz Silva', 'Masculino', 'diego_ruiz@usmp.pe', '96512340',TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 75, 'Matriculado', '2021010009');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34490290', 1, 'Gabriela', 'Vargas Castro', 'Femenino', 'gabriela_vargas@usmp.pe', '987655321', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 180, 'Matriculado', '2021010010');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34491290', 1, 'Andrés', 'Medina Vargas', 'Masculino', 'andres_media@usmp.pe', '976555510', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 85, 'Matriculado', '2021010011');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34492290', 1, 'Sofía', 'Herrera Paredes', 'Femenino', 'sofia_herrera@usmp.pe', '965058909', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),81, 'Matriculado', '2021010012');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34493290', 1, 'Daniel', 'Ríos Núñez', 'Masculino', 'daniel_rios@usmp.pe', '987600021', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 126, 'Matriculado', '2021010013');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34494290', 1, 'Valeria', 'Miranda Ortega', 'Femenino', 'valeria_miranda@usmp.pe', '976532010', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 111, 'Matriculado', '2021010014');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34495290', 1, 'Felipe', 'Castro Rosales', 'Masculino', 'felipe_castro@usmp.pe', '960909109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 124, 'Matriculado', '2021010015');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34496290', 1, 'Camila', 'Solís Espinoza', 'Femenino', 'camila_solis@usmp.pe', '987010121', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 116, 'Matriculado', '2021010016');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34497290', 1, 'Manuel', 'Delgado Soto', 'Masculino', 'manuel_delgado@usmp.pe', '976020210', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),154, 'Matriculado', '2021010017');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34498290', 1, 'Natalia', 'Paredes Valenzuela', 'Femenino', 'natalia_paredes@usmp.pe', '964646109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 183, 'Matriculado', '2021010018');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34499290', 1, 'Alejandro', 'Rivera Reyes', 'Masculino', 'alejandro_rivera@usmp.pe', '987676321',TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 168, 'Matriculado', '2021010019');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34500290', 1, 'Victoria', 'Mendoza Aguilar', 'Femenino', 'victoria_mendez@usmp.pe', '976565210', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  50, 'Matriculado', '2021010020');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34501290', 4, 'Pedro', 'Rodríguez Martínez', 'Masculino', 'pedro_rodriguez@usmp.pe', '965656109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 23, 'Matriculado', '2021010021');

INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34502290', 4, 'Juan Arnold', 'Lopez Perez', 'Masculino', 'juan_lopez2@usmp.pe', '965000109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 120, 'Matriculado', '2021010022');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34503290', 4, 'Sofia Fernanda', 'Garcia Torres', 'Femenino', 'sofia_garcia2@usmp.pe', '965001109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 90, 'Matriculado', '2021010023');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34504290', 4, 'Antonio Cesar', 'Lopez Ramirez', 'Masculino', 'antonio_lopez2@usmp.pe', '965002109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 60, 'Matriculado', '2021010024');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34505290', 4, 'Ana Lidia', 'Hernández López', 'Femenino', 'ana_hernandez2@usmp.pe', '965003109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),130, 'Matriculado', '2021010025');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34506290', 4, 'Luis', 'González Torres', 'Masculino', 'luis_gonzalez2@usmp.pe', '965004109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 100, 'Matriculado', '2021010026');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34507290', 4, 'Laura Paula', 'Ramírez Sánchez', 'Femenino', 'laura_ramirez2@usmp.pe', '965005109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 65, 'Matriculado', '2021010027');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34508290', 4, 'Carlos Rodrigo', 'Morales Méndez', 'Masculino', 'carlos_morales2@usmp.pe', '965006109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  125, 'Matriculado', '2021010028');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34509290', 4, 'Paola', 'Jiménez Ramírez', 'Femenino', 'paola_jimenez2@usmp.pe', '965007109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 85, 'Matriculado', '2021010029');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34510290', 4, 'Diego Pedro', 'Silva Ruiz', 'Masculino', 'diego_silva2@usmp.pe', '965008109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),75, 'Matriculado', '2021010030');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34511290', 4, 'Gabriela', 'Castro Vargas', 'Femenino', 'gabriela_castro2@usmp.pe', '965009109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 180, 'Matriculado', '2021010031');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34512290', 5, 'Andrés Eduardo', 'Vargas Medina', 'Masculino', 'andres_vargas2@usmp.pe', '965010109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  85, 'Matriculado', '2021010032');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34513290', 5, 'Sofía', 'Paredes Herrera', 'Femenino', 'sofia_paredes2@usmp.pe', '965011109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 81, 'Matriculado', '2021010033');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34514290', 5, 'Daniel', 'Núñez Ríos', 'Masculino', 'daniel_nunez2@usmp.pe', '965012109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  126, 'Matriculado', '2021010034');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34515290', 5, 'Valeria', 'Ortega Miranda', 'Femenino', 'valeria_ortega2@usmp.pe', '965013109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 111, 'Matriculado', '2021010035');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34516290', 6, 'Felipe', 'Rosales Castro', 'Masculino', 'felipe_rosales2@usmp.pe', '965014109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 124, 'Matriculado', '2021010036');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34517290', 6, 'Camila Katherine', 'Espinoza Solís', 'Femenino', 'camila_espinoza2@usmp.pe', '965015109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 116, 'Matriculado', '2021010037');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34518290', 6, 'Manuel Alejandro', 'Soto Delgado', 'Masculino', 'manuel_soto2@usmp.pe', '965016109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 154, 'Matriculado', '2021010038');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34519290', 6, 'Natalia', 'Valenzuela Paredes', 'Femenino', 'natalia_valenzuela2@usmp.pe', '965017109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),183, 'Matriculado', '2021010039');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('34520290', 6, 'Alejandro Jose', 'Reyes Rivera', 'Masculino', 'alejandro_reyes2@usmp.pe', '965018109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),168, 'Matriculado', '2021010040');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34521290', 6, 'Victoria Isabel', 'Aguilar Mendoza', 'Femenino', 'victoria_aguilar2@usmp.pe', '965019109', TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 50, 'Matriculado', '2021010041');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('34522290', 6, 'Pedro Fernando', 'Martínez Rodríguez', 'Masculino', 'pedro_martinez2@usmp.pe', '965020109',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 23, 'Matriculado', '2021010042');        
        
      
	  -- ESTUDIANTES NO MATRICULADOS
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES ('23222089', 1, 'Martín ', 'Sánchez Castillo', 'Masculino', 'martin_sanchez1@usmp.pe', '911043210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 90, 'No Matriculado', '2021110001');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('23222189', 1, 'Andrea ', 'Ríos Vargas', 'Femenino', 'andrea_rios1@usmp.pe', '911143210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 60, 'No Matriculado', '2021110002');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23222289', 1, 'Sebastián ', 'Delgado Paredes', 'Masculino', 'sebastian_delgado1@usmp.pe', '911243210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 23, 'No Matriculado', '2021110003');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('23222389', 1, 'Valentina ', 'Mendoza Torres', 'Femenino', 'valentina_mendoza1@usmp.pe', '911343210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),156, 'No Matriculado', '2021110004');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23222489', 1, 'Santiago ', 'Ramírez Luna', 'Masculino', 'santiago_ramirez1@usmp.pe', '911443210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  16, 'No Matriculado', '2021110005');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('23222589', 1, 'Isabella ', 'López Herrera', 'Femenino', 'isabella_lopez1@usmp.pe', '911543210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  32, 'No Matriculado', '2021110006');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23222689', 1, 'Lucas ', 'Castro Rodríguez', 'Masculino', 'lucas_castro1@usmp.pe', '911643210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  44, 'No Matriculado', '2021110007');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('23222789', 1, 'Sofía ', 'Jiménez Cruz', 'Femenino', 'sofia_jimenez1@usmp.pe', '911743210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),46, 'No Matriculado', '2021110008');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23222889', 1, 'Tomás ', 'Fernández Morales', 'Masculino', 'tomas_fernandez1@usmp.pe', '911843210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 45, 'No Matriculado', '2021110009');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES    ('23222989', 1, 'Camila ', 'Torres Gómez', 'Femenino', 'camila_torres1@usmp.pe', '911943210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  69, 'No Matriculado', '2021110010');

INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23223089', 4, 'Jerika ', 'Arboleda Gonzales', 'Femenino', 'jerika_arboleda1@usmp.pe', '912043210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  32, 'No Matriculado', '2021110011');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23223189', 4, 'Lucas ', 'López Herrera', 'Masculino', 'lucasss_lopez1@usmp.pe', '912143210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  32, 'No Matriculado', '2021110012');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23223289', 4, 'Sofía ', 'Castro Rodríguez', 'Femenino', 'sofiaa_castro1@usmp.pe', '912243210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  44, 'No Matriculado', '2021110013');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('23223389', 5, 'Tomás ', 'Jiménez Cruz', 'Masculino', 'tomass_jimenez1@usmp.pe', '912343210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'), 46, 'No Matriculado', '2021110014');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('23223489', 6, 'Camila ', 'Fernández Morales', 'Femenino', 'camila_fernandez1@usmp.pe', '912443210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  45, 'No Matriculado', '2021110015');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('23223589', 6, 'Jesus ', 'Torres Gómez', 'Masculino', 'jesus_torres1@usmp.pe', '912543210',  TO_DATE('1998-05-15', 'YYYY-MM-DD'),  TO_DATE('2020-03-01', 'YYYY-MM-DD'),  69, 'No Matriculado', '2021110016');      
        
        
	  -- ESTUDIANTES EGRESADOS
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES ('00089883', 1, 'Santiago', 'Gómez López', 'Masculino', 'santiago_gomez@usmp.pe', '922205678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010001');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES ('00090883', 1, 'Valentina ', 'Torres Cruz', 'Femenino', 'valentina_torres@usmp.pe', '922215678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010002');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00091883', 1, 'Andrés ', 'García Ramírez', 'Masculino', 'andres_garcia@usmp.pe', '922225678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010003');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00092883', 1, 'Sofía ', 'Martínez Rodríguez', 'Femenino', 'sofia_martinez@usmp.pe', '922235678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010004');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00093883', 1, 'Mateo ', 'Castro Ruiz', 'Masculino', 'mateo_castro@usmp.pe', '922245678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010005');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00094883', 1, 'Isabella ', 'Vargas Morales', 'Femenino', 'isabella_vargas@usmp.pe', '922255678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010006');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00095883', 1, 'Nicolás ', 'Ramos Sánchez', 'Masculino', 'nicolas_ramos@usmp.pe', '922265678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010007');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00096883', 1, 'Natalia ', 'Fernández Herrera', 'Femenino', 'natalia_fernnadez@usmp.pe', '922275678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010008');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00097883', 1, 'Alejandro ', 'Mendoza Ortega', 'Masculino', 'alejandro_mendoza@usmp.pe', '922285678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010009');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00098883', 1, 'Gabriela ', 'Salazar Paredes', 'Femenino', 'gabriela_salazar@usmp.pe', '922295678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010010');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00099883', 1, 'Sebastián ', 'Rivera Gómez', 'Masculino', 'sebastian_rivera@usmp.pe', '922305678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010011');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00100883', 1, 'Martina ', 'Silva Torres', 'Femenino', 'martina_silva@usmp.pe', '922315678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010012');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00101883', 1, 'Samuel ', 'Jiménez García', 'Masculino', 'samuel_jimenez@usmp.pe', '922325678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010013');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00102883', 1, 'Valeria ', 'Morales Martínez', 'Femenino', 'valeria_morales@usmp.pe', '922335678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010014');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00103883', 1, 'Lucas ', 'Ramírez Castro', 'Masculino', 'lucas_ramirez@usmp.pe', '922345678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010015');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00104883', 1, 'Camila ', 'Pérez Vargas', 'Femenino', 'camila_perez@usmp.pe', '922355678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010016');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00105883', 1, 'Emilio ', 'Sánchez Ramos', 'Masculino', 'emilio_sanchez@usmp.pe', '922365678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010017');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00106883', 1, 'Isabella ', 'Herrera Fernández', 'Femenino', 'isabella_herrera@usmp.pe', '922375678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010018');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00107883', 1, 'Benjamín ', 'Ortega Mendoza', 'Masculino', 'benjamin_ortega@usmp.pe', '922385678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010019');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00108883', 1, 'Renata ', 'Paredes Salazar', 'Femenino', 'renata_paredes@usmp.pe', '922395678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010020');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00109883', 1, 'Yasser', 'Avalos Montero', 'Masculino', 'yasser_avalos@usmp.pe', '922405678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010021');

INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00110883', 4, 'Emma ', 'Smith Smith', 'Femenino', 'emma_smith1@usmp.pe', '922415678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010022');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00111883', 4, 'Liam  ', 'Johnson Johnson', 'Masculino', 'liam_johnson1@usmp.pe', '922425678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010023');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00112883', 4, 'Olivia  ', 'Williams Williams', 'Femenino', 'olivia_williams1@usmp.pe', '922435678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010024');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00113883', 4, 'Noah  ', 'Brown Brown', 'Masculino', 'noah_brown1@usmp.pe', '922445678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010025');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00114883', 5, 'Ava  ', 'Jones Jones', 'Femenino', 'ava_jones1@usmp.pe', '922455678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010026');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00115883', 5, 'Lucas  ', 'Davis Davis', 'Masculino', 'lucas_davis1@usmp.pe', '922465678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010027');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00116883', 5, 'Isabella  ', 'Miller Miller', 'Femenino', 'isabella_miller1@usmp.pe', '922475678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010028');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00117883', 5, 'Oliver  ', 'Wilson Wilson', 'Masculino', 'oliver_wilson1@usmp.pe', '922485678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010029');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00118883', 5, 'Sophia  ', 'Taylor Taylor', 'Femenino', 'sophia_taylor1@usmp.pe', '922495678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010030');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00119883', 5, 'Elijah  ', 'Anderson Anderson', 'Masculino', 'elijah_anderson1@usmp.pe', '922505678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010031');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00120883', 5, 'Mia  ', 'Thomas Thomas', 'Femenino', 'mia_thomas1@usmp.pe', '922515678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010032');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00121883', 5, 'Aiden  ', 'Moore Moore', 'Masculino', 'aiden_moore1@usmp.pe', '922525678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010033');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00122883', 5, 'Charlotte  ', 'Clark Clark', 'Femenino', 'charlotte_clark1@usmp.pe', '922535678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010034');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00123883', 6, 'James  ', 'Rodriguez Rodriguez', 'Masculino', 'james_rodriguez1@usmp.pe', '922545678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010035');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00124883', 6, 'Harper  ', 'Martinez Martinez', 'Femenino', 'harper_martinez1@usmp.pe', '922555678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010036');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00125883', 6, 'Benjamin  ', 'Lewis Lewis', 'Masculino', 'benjamin_lewis1@usmp.pe', '922565678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010037');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00126883', 6, 'Amelia  ', 'Lee Lee', 'Femenino', 'amelia_lee1@usmp.pe', '922575678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010038');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00127883', 6, 'Henry  ', 'Walker Walker', 'Masculino', 'henry_walker1@usmp.pe', '922585678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010039');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('00128883', 6, 'Evelyn  ', 'Hall Hall', 'Femenino', 'evelyn_hall1@usmp.pe', '922595678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010040');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00129883', 6, 'Samuel  ', 'Wright Wright', 'Masculino', 'samuel_wright1@usmp.pe', '922605678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Egresado', '2022010041');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('00130883', 6, 'Ethan ', 'Johnson Johnson', 'Femenino', 'ethan_johnson1@usmp.pe', '922615678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Egresado', '2022010042');        
        

	  -- ESTUDIANTES GRADUADOS
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES ('11222044', 1, 'Gabriel ', 'Soto Martínez', 'Masculino', 'gabriel_soto1@usmp.pe', '933330678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010001');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11222144', 1, 'Lucía  ', 'Rojas Vargas', 'Femenino', 'lucia_rojas1@usmp.pe', '933331678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),  222, 'Graduado', '2122010002');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11222244', 1, 'Carlos  ', 'Medina Delgado', 'Masculino', 'carlos_medina1@usmp.pe', '933332678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),  222, 'Graduado', '2122010003');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11222344', 1, 'Laura  ', 'Peralta Torres', 'Femenino', 'laura_peralta1@usmp.pe', '933333678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010004');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11222444', 1, 'Diego  ', 'Navarro Luna', 'Masculino', 'diego_navarro1@usmp.pe', '933334678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010005');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11222544', 1, 'Renata  ', 'Cordero Herrera', 'Femenino', 'renata_cordero1@usmp.pe', '933335678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010006');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11222644', 1, 'Juan  ', 'Morales Castro', 'Masculino', 'juan_morales1@usmp.pe', '933336678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010007');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11222744', 1, 'Valentina  ', 'Escobar Cruz', 'Femenino', 'valentina_escobar1@usmp.pe', '933337678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),  222, 'Graduado', '2122010008');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11222844', 1, 'Andrés  ', 'Ríos Rodríguez', 'Masculino', 'andres_rios1@usmp.pe', '933338678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),  222, 'Graduado', '2122010009');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11222944', 1, 'Sofía  ', 'Guzmán Gómez', 'Femenino', 'sofia_guzman1@usmp.pe', '933339678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),  222, 'Graduado', '2122010010');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223044', 1, 'David  ', 'Valdez Mendoza', 'Masculino', 'david_valdez1@usmp.pe', '933340678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),  222, 'Graduado', '2122010011');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223144', 1, 'Camila  ', 'Gallo López', 'Femenino', 'camila_gallo1@usmp.pe', '933341678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010012');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11223244', 1, 'Miguel  ', 'Torres Sánchez', 'Masculino', 'miguel_torres1@usmp.pe', '933342678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010013');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223344', 1, 'Martina  ', 'Vega Paredes', 'Femenino', 'martina_vega1@usmp.pe', '933343678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010014');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223444', 1, 'Sebastián  ', 'Mendoza Gómez', 'Masculino', 'sebastian_mendoza1@usmp.pe', '933344678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010015');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11223544', 1, 'Isabella  ', 'Cáceres Ramírez', 'Femenino', 'isabella_caceres1@usmp.pe', '933345678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010016');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223644', 1, 'Matías  ', 'Flores Morales', 'Masculino', 'matias_flores1@usmp.pe', '933346678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010017');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223744', 1, 'Ana  ', 'Serrano Jiménez', 'Femenino', 'ana_serrano1@usmp.pe', '933347678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010018');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11223844', 1, 'Javier  ', 'Lugo Silva', 'Masculino', 'javier_lugo1@usmp.pe', '933348678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010019');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11223944', 1, 'Catalina  ', 'León Cruz', 'Femenino', 'catalina_leon1@usmp.pe', '933349678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Graduado', '2122010020');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11224044', 1, 'Leonardo ', 'Castillo López', 'Masculino', 'leonardo_castillo1@usmp.pe', '933350678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010021');

INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11224144', 4, 'María', 'García Ramírez', 'Femenino', 'maria_garcia1@usmp.pe', '933351678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010022');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11224244', 4, 'Juan', 'Rodríguez López', 'Masculino', 'juan_rodriguez1@usmp.pe', '933352678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Graduado', '2122010023');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11224344', 4, 'Ana', 'López Martínez', 'Femenino', 'ana_lopez1@usmp.pe', '933353678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010024');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11224444', 4, 'Pedro', 'Martínez González', 'Masculino', 'pedro_martinez1@usmp.pe', '933354678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010025');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11224544', 4, 'Laura', 'González Pérez', 'Femenino', 'laura_gonzalez1@usmp.pe', '933355678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010026');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11224644', 4, 'Carlos', 'Pérez Fernández', 'Masculino', 'carlos_perez1@usmp.pe', '933356678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010027');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11224744', 4, 'Sofía', 'Fernández Ramírez', 'Femenino', 'sofia_fernandez1@usmp.pe', '933357678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010028');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11224844', 5, 'Alejandro', 'Ramírez Torres', 'Masculino', 'alejandro_ramirez1@usmp.pe', '933358678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010029');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11224944', 5, 'Valentina', 'Torres Gómez', 'Femenino', 'valentina_torres1@usmp.pe', '933359678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010030');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225044', 5, 'Andrés', 'Gómez Cáceres', 'Masculino', 'andres_gomez1@usmp.pe', '933360678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010031');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225144', 5, 'Isabella', 'Ramírez Cáceres', 'Femenino', 'isabella_ramirez1@usmp.pe', '933361678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010032');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11225244', 5, 'Matías', 'Morales Flores', 'Masculino', 'matias_morales1@usmp.pe', '933362678',TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010033');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225344', 5, 'Ana', 'Jiménez Serrano', 'Femenino', 'ana_jimenez1@usmp.pe', '933363678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010034');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225444', 5, 'Javier', 'Silva Lugo', 'Masculino', 'javier_silva1@usmp.pe', '933364678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010035');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11225544', 6, 'Catalina', 'Cruz León', 'Femenino', 'catalina_cruz1@usmp.pe', '933365678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Graduado', '2122010036');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225644', 6, 'Leonardo', 'López Castillo', 'Masculino', 'leonardo_lopez1@usmp.pe', '933366678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010037');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225744', 6, 'María', 'Torres Sánchez', 'Femenino', 'maria_torres1@usmp.pe', '933367678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010038');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES 	('11225844', 6, 'Martín', 'Ramírez Gómez', 'Masculino', 'martin_ramirez1@usmp.pe', '933368678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'),222, 'Graduado', '2122010039');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11225944', 6, 'Valeria', 'Gómez Serrano', 'Femenino', 'valeria_gomez1@usmp.pe', '933369678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010040');
INSERT INTO ESTUDIANTES (DNI_ESTUDIANTE, PlanEstudiosID, NOMBRES_EST, APELLIDOS_EST, GENERO_EST, CORREO_EST, TELEFONO_EST, FECHA_NAC, FECHA_INGRESO, FECHA_EGRESO, CREDITOS_COMPLETADOS, ESTADO_ESTUDIANTE, CODIGO_ESTUDIANTE)
VALUES     ('11226044', 6, 'Sebastián', 'Sánchez Martínez', 'Masculino', 'sebastian_sanchez1@usmp.pe', '933370678', TO_DATE('1997-11-10', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 222, 'Graduado', '2122010041');        
        
        
        
        
SELECT * FROM Universidades;        
SELECT * FROM FACULTADES;
SELECT * FROM EscuelasProfesionales;        
SELECT * FROM PlanesEstudios;
SELECT * FROM ESTUDIANTES;


/*
	 Esta consulta realiza una combinación interna (INNER JOIN) entre la tabla "ESTUDIANTES" y la tabla "PlanesEstudios" 
	 utilizando la columna "PlanEstudiosID". Luego, utiliza la función CONCAT para unir el año y el semestre en una sola columna 
	 llamada "Año_Semestre". A continuación, utiliza funciones de agregación para contar la cantidad de estudiantes matriculados, 
	 no matriculados y egresados, agrupados por el año y semestre.

	 */

	 SELECT p.ANIO || ' ' || p.Semestre AS Año_Semestre,
       COUNT(*) AS Cantidad_Matriculados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'No Matriculado' THEN 1 ELSE 0 END) AS Cantidad_No_Matriculados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Egresado' THEN 1 ELSE 0 END) AS Cantidad_Egresados
    FROM ESTUDIANTES e
        INNER JOIN PlanesEstudios p ON e.PlanEstudiosID = p.ID_PlanEstudios
        GROUP BY p.ANIO, p.Semestre;

	/*
	En esta consulta, se realiza una combinación interna entre las tablas "ESTUDIANTES", "PlanesEstudios", "EscuelasProfesionales" y 
	"Facultades" utilizando las respectivas claves primarias 
	y foráneas. Luego, se agrega una cláusula WHERE para filtrar los resultados por el ID de la facultad deseada (ID_Facultad = 1).

    Se utiliza la función CONCAT para combinar el año y el semestre en la columna "Año_Semestre". Luego, se emplean funciones de 
    agregación para sumar la cantidad de estudiantes en cada estado (egresados, graduados, matriculados, no matriculados) en cada semestre académico.
	*/

	SELECT p.ANIO || '-' || p.Semestre AS Año_Semestre,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Egresado' THEN 1 ELSE 0 END) AS Cantidad_Egresados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Graduado' THEN 1 ELSE 0 END) AS Cantidad_Graduados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Matriculado' THEN 1 ELSE 0 END) AS Cantidad_Matriculados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'No Matriculado' THEN 1 ELSE 0 END) AS Cantidad_No_Matriculados
    FROM ESTUDIANTES e
        INNER JOIN PlanesEstudios p ON e.PlanEstudiosID = p.ID_PlanEstudios
        INNER JOIN EscuelasProfesionales ep ON p.EscuelaProfesionalID = ep.ID_EscuelaProfesional
        INNER JOIN Facultades f ON ep.FacultadID = f.ID_Facultad
    WHERE f.ID_Facultad = 1
    GROUP BY p.ANIO, p.Semestre;


/*
    Se ha agregado la cláusula ORDER BY al final de la consulta, utilizando las columnas ANIO y Semestre de la tabla PlanesEstudios. Esto ordenará 
    los resultados en el orden deseado: primero 2021-2, 2022-1, luego 2022-2, después 2023-1 y así sucesivamente.
*/
    SELECT p.ANIO || '-' || p.Semestre AS Año_Semestre,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Egresado' THEN 1 ELSE 0 END) AS Cantidad_Egresados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Graduado' THEN 1 ELSE 0 END) AS Cantidad_Graduados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Matriculado' THEN 1 ELSE 0 END) AS Cantidad_Matriculados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'No Matriculado' THEN 1 ELSE 0 END) AS Cantidad_No_Matriculados
    FROM ESTUDIANTES e
        INNER JOIN PlanesEstudios p ON e.PlanEstudiosID = p.ID_PlanEstudios
        INNER JOIN EscuelasProfesionales ep ON p.EscuelaProfesionalID = ep.ID_EscuelaProfesional
        INNER JOIN Facultades f ON ep.FacultadID = f.ID_Facultad
    WHERE f.ID_Facultad = 1
        GROUP BY p.ANIO, p.Semestre
        ORDER BY p.ANIO, p.Semestre;
        
        
        
/*
    Se ha agregado la cláusula ORDER BY al final de la consulta, utilizando las columnas ANIO y Semestre de la tabla PlanesEstudios. Esto ordenará 
    los resultados en el orden deseado: primero 2021-2, 2022-1, luego 2022-2, después 2023-1 y así sucesivamente.
*/
    SELECT p.ANIO || '-' || p.Semestre AS Año_Semestre,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Egresado' THEN 1 ELSE 0 END) AS Cantidad_Egresados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Graduado' THEN 1 ELSE 0 END) AS Cantidad_Graduados,
       SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'Matriculado' THEN 1 ELSE 0 END) AS Cantidad_Matriculados
    FROM ESTUDIANTES e
        INNER JOIN PlanesEstudios p ON e.PlanEstudiosID = p.ID_PlanEstudios
        INNER JOIN EscuelasProfesionales ep ON p.EscuelaProfesionalID = ep.ID_EscuelaProfesional
        INNER JOIN Facultades f ON ep.FacultadID = f.ID_Facultad
    WHERE f.ID_Facultad = 1
        GROUP BY p.ANIO, p.Semestre
        ORDER BY p.ANIO, p.Semestre;





