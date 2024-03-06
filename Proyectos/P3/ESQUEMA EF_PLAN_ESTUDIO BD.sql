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

CREATE TABLE TiposAsignaturas (
    ID_TipoAsignatura NUMBER,
    NombreTipoAsignatura VARCHAR2(50),
    CONSTRAINT PK_TiposAsignaturas PRIMARY KEY (ID_TipoAsignatura)
);

CREATE TABLE Especialidades (
    ID_Especialidad NUMBER,
    NombreEspecialidad VARCHAR2(50),
    CONSTRAINT PK_Especialidades PRIMARY KEY (ID_Especialidad)
);

CREATE TABLE Asignaturas (
    CodigoAsignatura VARCHAR2(50),
    PlanEstudiosID NUMBER,
    Ciclo VARCHAR2(10),
    TipoAsignaturaID NUMBER,
    EspecialidadID NUMBER,
    NombreAsignatura VARCHAR2(100),
    Creditos NUMBER,
    NombreAsignatura_INGLES VARCHAR2(100),
    CONSTRAINT PK_Asignaturas PRIMARY KEY (CodigoAsignatura),
    CONSTRAINT FK_Asignaturas_PlanesEstudios FOREIGN KEY (PlanEstudiosID) REFERENCES PlanesEstudios (ID_PlanEstudios),
    CONSTRAINT FK_Asignaturas_TiposAsignaturas FOREIGN KEY (TipoAsignaturaID) REFERENCES TiposAsignaturas (ID_TipoAsignatura),
    CONSTRAINT FK_Asignaturas_Especialidades FOREIGN KEY (EspecialidadID) REFERENCES Especialidades (ID_Especialidad)
);

CREATE TABLE AsignaturasElectivas_NO_DICTADAS (
    AsignaturaID VARCHAR2(50),
    PlanEstudiosID NUMBER,
    CONSTRAINT PK_AsignaturasElectivas_NO_DICTADAS PRIMARY KEY (AsignaturaID),
    CONSTRAINT FK_AsignaturasElectivas_NO_DICTADAS_Asignaturas FOREIGN KEY (AsignaturaID) REFERENCES Asignaturas (CodigoAsignatura),
    CONSTRAINT FK_AsignaturasElectivas_NO_DICTADAS_PlanesEstudios FOREIGN KEY (PlanEstudiosID) REFERENCES PlanesEstudios (ID_PlanEstudios)
);

CREATE TABLE AsignaturasRequisitos (
    AsignaturaID VARCHAR2(50),
    AsignaturaRequisitoID VARCHAR2(50),
    CONSTRAINT PK_AsignaturasRequisitos PRIMARY KEY (AsignaturaID, AsignaturaRequisitoID),
    CONSTRAINT FK_AsignaturasRequisitos_Asignatura FOREIGN KEY (AsignaturaID) REFERENCES Asignaturas(CodigoAsignatura),
    CONSTRAINT FK_AsignaturasRequisitos_Asignatura_Requisito FOREIGN KEY (AsignaturaRequisitoID) REFERENCES Asignaturas(CodigoAsignatura)
);



-- Insertar datos en la tabla Universidades
INSERT INTO Universidades (ID_Universidad, NombreUniversidad, NombreUniversidad_CORTO)
VALUES (1, 'Universidad de San Martin de Porres', 'USMP');

-- Insertar datos en la tabla Facultades
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES (1, 1, 'Facultad de Ingeniería y Arquitectura', 'Av. La Fontana 1250, Urb. Santa Patricia. La Molina', 'FIA');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES 		(2, 1, 'Facultad de Ciencias Administrativas y Recursos Humanos', 'Jr. Las Calandrias Nº 151 – 291, Santa Anita – Lima 43, Perú', 'FCARRHH');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO )
VALUES 		(3, 1, 'Facultad de Derecho', 'Alameda del Corregidor N° 1865, La Molina.', 'FD');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES 		(4, 1, 'Facultad de Medicina Humana', 'Av. Alameda del Corregidor 1517-1531, Urb. Sirius – III Etapa – La Molina', 'FMH');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES 		(5, 1, 'Facultad de Ciencias de la Comunicación, Turismo y Psicologia', 'Av. Tomás Marsano 242, Surquillo Lima 34, Perú', 'FCCTP');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES 		(6, 1, 'Facultad de Odontologia', 'Sede Lima: Jr. Las Calandrias 151 – 291 – Santa Anita', 'FO');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES 		(7, 1, 'Facultad de Ciencias Contables, Económicas y Financieras', 'Sede Lima: Jr. Las Calandrias 151 – 291 – Santa Anita', 'FCCEF');
INSERT INTO Facultades (ID_Facultad, UniversidadID, NombreFacultad, direccion_Facultad, NombreFacultad_CORTO)
VALUES 		(8, 1, 'Facultad de Obstetricia y Enfermeria', 'Av. Salaverry 1136-1144 Jesús María, Lima, Perú', 'FOE');

-- Insertar datos en la tabla EscuelasProfesionales
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES (1, 1, 'Ingeniería de Computación y Sistemas','La Escuela Profesional de Ingeniería de Computación y Sistemas (EPICS) les da la bienvenida y comparte con ustedes la visión, misión y los campos de acción.','Formar profesionales en la especialidad de Ingeniería de Computación y Sistemas con sólidos valores, competentes y creativos para resolver problemas en el contexto laboral y social; desarrollar habilidades para responder a los cambios y desafíos del entorno; fomentar la investigación aplicada en el desarrollo de sistemas de información; promover actividades de extensión y proyección social que beneficien a la sociedad.','Llegar a ser la mejor Escuela Profesional del país dedicada a la formación de Ingenieros de Computación y Sistemas de clase internacional; con una cultura institucional en la que se fortalezcan los valores; comprometida con la búsqueda constante de la excelencia, el desarrollo integral del estudiante, la investigación y su proyección a la sociedad.', 'EPICS' );
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES (2, 1, 'Ingeniería Industrial','La Escuela Profesional de Ingeniería Industrial (EPII) es parte de la Facultad de Ingeniería y Arquitectura (FIA) y es la encargada de la formación profesional de nuevos ingenieros industriales con las competencias requeridas para su éxito laboral y bajo los valores y principios que demanda la sociedad. La EPII comprometida con el desarrollo nacional a través de la formación de ingenieros industriales con conocimientos sólidos, aplicación práctica de la teoría, espíritu de innovación y un enfoque claro con la responsabilidad social y medio ambiental.','Somos una escuela profesional formadora de ingenieros industriales de alto nivel científico y tecnológico orientados a la investigación, con sólidos valores humanísticos, éticos y morales. Contamos con los recursos adecuados para contribuir en el desarrollo sostenible, la innovación y la promoción del emprendimiento en el país.','Lideraremos la formación universitaria en Ingeniería Industrial, por ser una escuela dinámica y flexible, atenta a los cambios científicos, sociales y tecnológicos, siendo reconocidos en el ámbito nacional e internacional como la escuela de ingeniería con el más alto nivel de excelencia del país.', 'EPII');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES (3, 1, 'Ingeniería Civil','Estimados miembros de la comunidad universitaria de la Facultad de Ingeniería y Arquitectura (FIA) de la Universidad de San Martín de Porres, en nombre de la Escuela Profesional de Ingeniería Civil; deseo darles una cordial bienvenida a nuestro portal y a través de él, poder estar informados de las actividades que desarrollamos en la FIA. La Escuela Profesional de Ingeniería Civil tiene más de 30 años de funcionamiento y un sinnúmero de egresados que se encuentran en el mercado laboral trabajando al interior del país como en el entorno internacional, con gran éxito, prestigiando nuestra institución.','Formar Ingenieros Civiles en forma integral, con sólida formación científica, tecnológica y humanística, que lideren la profesión para poder realizar el diseño, construcción, supervisión, consultoría y gestión de los proyectos y obras, con habilidades para la investigación y la formación de empresas, con ética, responsabilidad social, respeto a la cultura, al medio ambiente y al desarrollo sostenible.','Seremos la mejor escuela Profesional del país dedicada a la formación integral de sus profesionales, con habilidades para la investigación, con capacidad técnica de planificación, diseño, construcción y gestión de infraestructura y obras civiles en general, así como el mantenimiento y rehabilitación de estas.', 'EPIC');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES (4, 1, 'Arquitectura','Estimados miembros de la comunidad universitaria de la Facultad de Ingeniería y Arquitectura (FIA) de la Universidad de San Martín de Porres, en nombre de la Escuela Profesional de Arquitectura; deseo darles una cordial bienvenida a nuestro portal y a través de él, poder estar informados de las actividades que desarrollamos en la FIA. La Escuela Profesional de Arquitectura tiene 18 años de funcionamiento y un sinnúmero de egresados que se encuentran en el mercado laboral trabajando al interior del país como en el entorno internacional, con gran éxito, prestigiando nuestra institución.','Formar arquitectos en forma integral, con sólida formación artística, científica, tecnológica y humanística, que lideren la profesión para poder realizar el diseño con ética, responsabilidad social, respeto a nuestros valores ancestrales, nuestro patrimonio monumental, la cultura, al medio ambiente y al desarrollo sostenible.','Nuestro objetivo creador de Escuela Profesional es la formación integral de profesionales, con habilidades para la investigación, con alta capacidad técnica de diseño, uso de la tecnología de avanzada.', 'EPA');
INSERT INTO EscuelasProfesionales (ID_EscuelaProfesional, FacultadID, NombreEscuelaProfesional, Bienvenida_EscuelaProfesional, mision_EscuelaProfesional, vision_EscuelaProfesional, NombreEscuelaProfesional_CORTO)
VALUES (5, 1, 'Ciencias Aeronauticas','Escuela perteneciente a la Facultad de Ingeniería y Arquitectura. Esta carrera busca preparar a los estudiantes en una profesión competitiva, que le permita ejercer una gestión responsable en todas las actividades de la aviación. El egresado de la especialidad de Ciencias Aeronáuticas contará con una sólida formación en gestión de negocios, con enfoque en el sector aeronáutico. Adicionalmente, la carrera le proveerá de todo el fundamento teórico, además de la instrucción y entrenamiento de vuelo necesario para estar apto en la rendición de los exámenes y vuelos de chequeo ante la Dirección General de Aeronáutica Civil (DGAC), y así obtener la licencia de Piloto Comercial. Este objetivo se enmarca en los principios rectores de la Universidad de San Martín de Porres y de la Facultad de Ingeniería y Arquitectura, orientados a la formación de profesionales altamente calificados para satisfacer la demanda que requiere la sociedad.','Formar profesionales del más alto nivel para el Mercado Aeronáutico Nacional e Internacional, con sólidos valores, competencias y habilidades para responder a los cambios y desafíos del entorno; y así satisfacer la demanda que requiere la sociedad.','Ser la mejor Escuela Profesional de Latinoamérica, dedicada a la formación de profesionales con sólido enfoque en la gestión de negocios y en el pilotaje de aeronaves de transporte de pasajeros y de carga.', 'EPCA');

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

-- Insertar datos en la tabla TiposAsignaturas  Especialidades
INSERT INTO TiposAsignaturas (ID_TipoAsignatura, NombreTipoAsignatura)
VALUES (1, 'Obligatoria');
INSERT INTO TiposAsignaturas (ID_TipoAsignatura, NombreTipoAsignatura)
VALUES (2, 'Electiva Libre');
INSERT INTO TiposAsignaturas (ID_TipoAsignatura, NombreTipoAsignatura)
VALUES (3, 'Electiva de Especialidad');

-- Insertar datos en la tabla TiposAsignaturas  Especialidades
INSERT INTO Especialidades (ID_Especialidad, NombreEspecialidad)
VALUES (1, 'SISTEMAS DE INFORMACIÓN');
INSERT INTO Especialidades (ID_Especialidad, NombreEspecialidad)
VALUES(2, 'TECNOLOGIAS DE INFORMACIÓN');
INSERT INTO Especialidades (ID_Especialidad, NombreEspecialidad)
VALUES(3, 'INGENIERIA DE SOFTWARE');





-- Insertar datos en la tabla Asignaturas
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('09066801051', 1,'I', 1, 'Matemática Discreta', 5, 'Discrete Mathematics' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09066301040',  1,'I', 1, 'Geometría analítica', 4, 'Analytic geometry');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09000301030',  1,'I', 1, 'Filosofía', 3, 'Philosophy');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09990601020', 1, 'I', 1, 'Ciudadanía Intercultural', 2, 'Intercultural Citizenship');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09230001020',  1,'I', 1, 'Introducción a Sistemas de Información', 2, 'Introduction to Information Systems');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09000201020',  1,'I', 1, 'Lenguaje', 2, 'Language');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09071001020',  1,'I', 1, 'Métodos de Estudio', 2, 'Study methods');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('TR000501010',  1,'I', 1, 'Actividades I', 1, 'Activities I');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('TR000101010',  1,'I', 1, 'Inglés I', 1, 'English I' );

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09036602050',  1,'II', 1, 'Álgebra Lineal', 5, 'Linear algebra');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09065502050',  1,'II', 1, 'Cálculo I', 5, 'calculation I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09111402051',  1,'II', 1, 'Introducción a la Programación', 5, 'Introduction to Programming');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09066502032',  1,'II', 1, 'Fundamentos de Diseño WEB', 3, 'Fundamentals of WEB Design');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09127402031',  1,'II', 1, 'Introducción a la Economía', 3, 'Introduction to Economics' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('TR000602010',  1,'II', 1, 'Actividades II', 1, 'Activities II');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('TR000202010',  1,'II', 1, 'Inglés II', 1, 'English II' );

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09005303051',  1,'III', 1, 'Algoritmos y Estructura de Datos I', 5, 'Algorithms and Data Structure I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09005603053',  1,'III', 1, 'Física I', 5, 'Physics I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09111503051',  1,'III', 1, 'Tecnología de Información I', 5, 'Information Technology I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09005403040',  1,'III', 1, 'Estadística y Probabilidades I', 4, 'Statistics and Probabilities I');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09127603031',  1,'III', 1, 'Sistemas de Información', 3, 'Information systems' );

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09006904051',  1,'IV', 1, 'Algoritmos y Estructura de Datos II', 5, 'Algorithms and Data Structure II' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09007404052',  1,'IV', 1, 'Física II', 5, 'Physics II');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09006004040',  1,'IV', 1, 'Estadística y Probabilidades II', 4, 'Statistics and Probabilities II' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09007704041',  1,'IV', 1, 'Microeconomía', 4, 'Microeconomics' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09114904041',  1,'IV', 1, 'Tecnología de la Información II', 4, 'Information Technology II' );

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09093205052',  1,'V', 1, 'Gestión de Procesos', 5, 'Process management' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09008905051',  1,'V', 1, 'Teoría y Diseño de Base de datos', 5, 'Database Theory and Design' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09012205045',  1,'V', 1, 'Contabilidad General', 4, 'General Accounting' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09009005044',  1,'V', 1, 'Ingeniería Administrativa', 4, 'Administrative engineering' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09140005040',  1,'V', 1, 'Sistemas Operativos y Plataformas', 4, 'Operating Systems and Platforms' );

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09011906051',  1,'VI', 1, 'Ingeniería de Software I', 5, 'Software Engineering I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09067106051',  1,'VI', 1, 'Programación I', 5, 'Programming I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09013106042',  1,'VI', 1, 'Ingeniería de Costos', 4, 'Cost engineering' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09008506043',  1,'VI', 1, 'Investigación Operativa I', 4, 'Operational Research I');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09008806041',  1,'VI', 1, 'Teoría General de Sistemas', 4, 'General systems theory');

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09013707051',  1,'VII', 1, 'Ingeniería de Software II', 5, 'Software Engineering II' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09014507042',  1,'VII', 1, 'Gestión Financiera', 4, 'Financial management');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09140707040',  1,'VII', 1, 'Inteligencia Artificial', 4, 'Artificial intelligence');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09140507020',  1,'VII', 1, 'Arquitectura de Software para SI', 2, 'Software Architecture for IS');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09990707010',  1,'VII', 1, 'Discapacidad e Inclusión', 1, 'Disability and Inclusion');

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09112108050',  1,'VIII', 1, 'Taller de Proyectos', 5, 'Project Workshop');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09128808041',  1,'VIII', 1, 'Arquitectura Empresarial', 4, 'Enterprise Architecture' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09072108041',  1,'VIII', 1, 'Diseño e Implementación de Sistemas', 4, 'Systems Design and Implementation');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09054808041',  1,'VIII', 1, 'Formulación y Evaluación de Proyectos', 4, 'Formulation and evaluation of projects' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09066408041',  1,'VIII', 1, 'Gestión de Recursos de TI', 4, 'IT Resource Management' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09140108020',  1,'VIII', 1, 'Introducción a la Investigación e Informática', 2, 'Introduction to Research and Informatics');

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09093409042',  1,'IX', 1, 'Inteligencia de Negocios', 4, 'Business intelligence');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09067009041',  1,'IX', 1, 'Planeamiento Estratégico de Tecnologías de Información', 4, 'Strategic Planning of Information Technologies' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09067309041',  1,'IX', 1, 'Proyecto I', 4, 'Project I' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09067909041',  1,'IX', 1, 'Seguridad y Auditoría de Sistemas de Información', 4, 'Security and Audit of Information Systems');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09066709021',  1,'IX', 1, 'Liderazgo y Oratoria', 2, 'Leadership and Public Speaking');

INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09134910041',  1,'X', 1, 'Marketing Digital', 4, 'Digital marketing' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09007010041',  1,'X', 1, 'Proyecto II', 4, 'Project II' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09003410022',  1,'X', 1, 'Ética y Moral', 2, 'Moral and ethic' );
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, Ciclo, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES('09991210012',  1,'X', 1, 'Prácticas Preprofesionales', 1, 'Pre professional practices' );

-- Insertar datos en la tabla Asignaturas
-- ASIGNATURAS ELECTIVAS LIBRES
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('091126E4041', 1, 2, 'Desarrollo de Juegos', 4, 'Game Development');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('09061700040', 1, 2, 'Gestión Estratégica', 4, 'Strategic management');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('09085209041', 1, 2, 'Gestión de Proyectos - PMI', 4, 'Project Management - PMI');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('09011607043', 1, 2, 'Investigación Operativa II', 4, 'Operational Research II');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('092302E9020', 1, 2, 'Fundamentos de Emprendimiento', 3, 'Fundamentals of Entrepreneurship');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090147E4021', 1, 2, 'Comportamiento Organizacional', 2, 'Organizational behavior');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('09086300021', 1, 2, 'Gestión de la Innovación', 2, 'Innovation Management');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('092303E3020', 1, 2, 'Proyección Social (*)', 2, 'Social projection (*)');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('099913E1020', 1, 2, 'Quechua (*)', 2, 'Quechua (*)');

-- Insertar datos en la tabla Asignaturas
																	-- ASIGNATURAS ELECTIVAS DE ESPECIALIDAD
-- ASIGNATURAS ELECTIVAS DE ESPECIALIDAD PARA SISTEMAS DE INFORMACIÓN
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090861E1041', 1, 3, 1,'Administración de Base de Datos', 4, 'Database Administration');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090205E1040', 1, 3, 1,'Comercio Electrónico', 4, 'Electronic Commerce');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090933E1040', 1, 3, 1,'Gestión del Conocimiento', 4, 'Knowledge Management');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('091119E1042', 1, 3, 1,'Sistemas Integrados de Gestión ERP', 4, 'Integrated Management Systems ERP');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090608E1041', 1,3, 1,'Taller de Creatividad EmpresariaL', 4, 'Business Creativity Workshop');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('091406E1030', 1, 3, 1,'Big Data', 3, 'Big Data');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('092301E7020', 1, 3, 1,'Rotación Externa SI (*)', 2, 'External Rotation YES (*)');
	
-- ASIGNATURAS ELECTIVAS DE ESPECIALIDAD PARA TECNOLOGIAS DE INFORMACIÓN
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090675E2041', 1, 3, 2,'Redes y Conectividad I (CCNA I Cisco)', 4, 'Networks and Connectivity I (CCNA I Cisco)');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090676E2041', 1, 3, 2,'Redes y Conectividad II (CCNA II Cisco)', 4, 'Networks and Connectivity II (CCNA II Cisco)');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090677E2041', 1, 3, 2,'Redes y Conectividad III (CCNA III Cisco) (*)', 4, 'Networks and Connectivity III (CCNA III Cisco) (*)');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090862E2041', 1, 3, 2,'Seguridad Informática', 4, 'Informatic security');

-- ASIGNATURAS ELECTIVAS DE ESPECIALIDAD PARA INGENIERIA DE SOFTWARE
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090658E3041', 1, 3, 3,'Calidad de Software (*)', 4, 'Software Quality (*)');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090672E3041', 1, 3, 3,'Programación II', 4, 'Programming II');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('091124E3041', 1, 3, 3,'Pruebas de Software', 4, 'Software Testing');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090659E7020', 1, 3, 3,'Desarrollo de Aplicaciones I (*)', 2, 'Application Development I (*)');
INSERT INTO Asignaturas (CodigoAsignatura, PlanEstudiosID, TipoAsignaturaID, EspecialidadID, NombreAsignatura, Creditos, NombreAsignatura_INGLES)
VALUES ('090660E8020', 1, 3, 3,'Desarrollo de Aplicaciones II (*)', 2, 'Application Development II (*)');


 
 -- Insertar datos en la tabla AsignaturasElectivas_NO_DICTADAS
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES ('092301E7020', 1);
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES 		('090677E2041', 1);
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES 		('090658E3041', 1);
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES 		('090659E7020', 1);
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES 		('090660E8020', 1);
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES 		('092303E3020', 1);
INSERT INTO AsignaturasElectivas_NO_DICTADAS (AsignaturaID, PlanEstudiosID)
VALUES 		('099913E1020', 1);

-- Insertar datos en la tabla Requisitos
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES ('09065502050', '09066801051'); -- Código de asignatura DE CALCULO I
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES       ('09065502050', '09066301040'); -- Código de asignatura DE CALCULO I

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES       ('09111402051', '09066801051'); -- Código de asignatura DE INTRO A LA PROGRAMACION

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09066502032', '09230001020'); -- Código de asignatura DE Fundamentos de Diseño WEB 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09127402031', '09990601020'); -- Código de asignatura DE Introducción a la Economía 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('TR000602010', 'TR000501010'); -- Código de asignatura DE Actividades II 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('TR000202010', 'TR000101010'); -- Código de asignatura DE Inglés II 

	   -- TERCER CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09005303051', '09111402051'); -- Código de asignatura DE Algoritmos y Estructura de Datos I

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09005603053', '09036602050'); -- Código de asignatura DE Física I 
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09005603053', '09065502050'); -- Código de asignatura DE Física I 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09111503051', '09111402051'); -- Código de asignatura DE Tecnología de Información I 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09005403040', '09065502050'); -- Código de asignatura DE Estadística y Probabilidades I

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09127603031', '09066502032'); -- Código de asignatura DE Sistemas de Información

	   -- CUARTO CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09006904051', '09005303051'); -- Código de asignatura DE Algoritmos y Estructura de Datos II

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09007404052', '09005603053'); -- Código de asignatura DE  Física II

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09006004040', '09005403040'); -- Código de asignatura DE Estadística y Probabilidades II 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09007704041', '09127402031'); -- Código de asignatura DE Microeconomía 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09114904041', '09111503051'); -- Código de asignatura DE Tecnología de la Información II

	   -- QUINTO CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09093205052', '09006904051'); -- Código de asignatura DE  Gestión de Procesos
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09093205052', '09127603031'); -- Código de asignatura DE  Gestión de Procesos

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09008905051', '09006904051'); -- Código de asignatura DE Teoría y Diseño de Base de datos

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09012205045', ''); -- Código de asignatura DE  Contabilidad General -- 80 CREDITOS APROBADOS ESO VER COMO LO HAGO

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09009005044', '09007704041'); -- Código de asignatura DE  Ingeniería Administrativa

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09140005040', '09114904041'); -- Código de asignatura DE  Sistemas Operativos y Plataformas

	   -- SEXTO CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09011906051', '09093205052'); -- Código de asignatura DE Ingeniería de Software I
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09011906051', '09140005040'); -- Código de asignatura DE Ingeniería de Software I

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09067106051', '09008905051'); -- Código de asignatura DE Programación I 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09013106042', '09012205045'); -- Código de asignatura DE Ingeniería de Costos

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09008506043', '09006004040'); -- Código de asignatura DE  Investigación Operativa I
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09008506043', '09230001020'); -- Código de asignatura DE  Investigación Operativa I

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09008806041', '09009005044'); -- Código de asignatura DE Teoría General de Sistemas


	   -- SEPTIMO CICLO

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09013707051', '09011906051'); -- Código de asignatura DE Ingeniería de software II 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09014507042', '09013106042'); -- Código de asignatura DE  Gestión Financiera

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09140707040', '09067106051'); -- Código de asignatura DE  Inteligencia Artificial

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09140507020', '09011906051'); -- Código de asignatura DE  Arquitectura de Software para SI 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09990707010', ''); -- Código de asignatura DE  Discapacidad e Inclusión      133 Créditos Aprobados

	   -- OCTAVO CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	    ('09112108050', '09013707051'); -- Código de asignatura DE  Taller de Proyectos 
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09112108050', '09140707040'); -- Código de asignatura DE  Taller de Proyectos 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09128808041', '09008806041'); -- Código de asignatura DE Arquitectura Empresarial
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09128808041', '09140507020'); -- Código de asignatura DE Arquitectura Empresarial

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09072108041', '09013707051'); -- Código de asignatura DE Diseño e Implementación de Sistemas

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09054808041', '09014507042'); -- Código de asignatura DE  Formulación y Evaluación de Proyectos

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09066408041', '09013707051'); -- Código de asignatura DE  Gestión de Recursos de TI

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09140108020', ''); -- Código de asignatura DE  Introducción a la Investigación e Informática      156 Créditos Aprobados

	   -- NOVENO CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09093409042', '09128808041'); -- Código de asignatura DE Inteligencia de Negocios

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09067009041', '09066408041'); -- Código de asignatura DE Planeamiento Estratégico de Tecnologías de Información 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09067309041', '09112108050'); -- Código de asignatura DE Proyecto I 
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09067309041', '09054808041'); -- Código de asignatura DE Proyecto I 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09067909041', '09072108041'); -- Código de asignatura DE Seguridad y Auditoría de Sistemas de Información 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09066709021', ''); -- Código de asignatura DE Liderazgo y Oratoria      100 Créditos Aprobados

	   -- DECIMO CICLO
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	    ('09134910041', '09054808041'); -- Código de asignatura DE Marketing Digital

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09007010041', '09067309041'); -- Código de asignatura DE Proyecto II

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09003410022', ''); -- Código de asignatura DE Ética y Moral   170 Créditos Aprobados

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09991210012', ''); -- Código de asignatura DE Prácticas Preprofesionales   154 Créditos Aprobados 6 meses de PPP realizadas

	  -- ELECTIVOS LIBRES
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('091126E4041', '09013707051'); -- Código de asignatura DE Desarrollo de Juegos 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09061700040', '09067309041'); -- Código de asignatura DE  Gestión Estratégica                  120 Créditos Aprobados

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09085209041', '09054808041'); -- Código de asignatura DE Gestión de Proyectos - PMI 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09011607043', '09008506043'); -- Código de asignatura DE  Investigación Operativa II 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	    ('092302E9020', '09112108050'); -- Código de asignatura DE Fundamentos de Emprendimiento

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090147E4021', '09009005044'); -- Código de asignatura DE Comportamiento Organizaciona

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('09086300021', '09054808041'); -- Código de asignatura DE Gestión de la Innovación

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('092303E3020', ''); -- Código de asignatura DE Proyección Social (*)     ---------------------------------

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('099913E1020', ''); -- Código de asignatura DE Quechua (*)          176 Créditos Aprobados

	  -- ELECTIVOS DE ESPECIALIDAD SISTEMAS DE INFORMACION
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	  ('090861E1041', '09008905051'); -- Código de asignatura DE Administración de Base de Datos

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090205E1040', ''); -- Código de asignatura DE Comercio Electrónico                 134 Créditos Aprobados

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090933E1040', ''); -- Código de asignatura DE Gestión del Conocimiento			150 Créditos Aprobados

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('091119E1042', '09066408041'); -- Código de asignatura DE   Sistemas Integrados de Gestión ERP

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	    ('090608E1041', '09112108050'); -- Código de asignatura DE Taller de Creatividad Empresarial 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('091406E1030', '09011906051'); -- Código de asignatura DE Big Data               150 Créditos Aprobados
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('091406E1030', '09067106051'); -- Código de asignatura DE Big Data               150 Créditos Aprobados

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('092301E7020', '09013106042'); -- Código de asignatura DE Rotación Externa SI (*) 
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('092301E7020', '09008806041'); -- Código de asignatura DE Rotación Externa SI (*) 
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('092301E7020', '09008506043'); -- Código de asignatura DE Rotación Externa SI (*) 

	  -- ELECTIVOS DE ESPECIALIDAD TECNOLOGIA DE INFORMACION
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090675E2041', '09140005040'); -- Código de asignatura DE Redes y Conectividad I (CCNA I Cisco) 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090676E2041', '090675E2041'); -- Código de asignatura DE Redes y Conectividad II (CCNA II Cisco)              

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090677E2041', '090676E2041'); -- Código de asignatura DE Redes y Conectividad III (CCNA III Cisco) (*)

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090862E2041', '09067909041'); -- Código de asignatura DE Seguridad Informática 

	  -- ELECTIVOS DE ESPECIALIDAD INGENIERIA DE SOFTWARE
INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	  ('090658E3041', '091124E3041'); -- Código de asignatura DE Calidad de Software (*) 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090672E3041', '09067106051'); -- Código de asignatura DE Programación II           

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('091124E3041', '09013707051'); -- Código de asignatura DE Pruebas de Software 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090659E7020', '09067106051'); -- Código de asignatura DE Desarrollo de Aplicaciones I (*) 

INSERT INTO AsignaturasRequisitos (AsignaturaID, AsignaturaRequisitoID)
VALUES	   ('090660E8020', '090659E7020'); -- Código de asignatura DE Desarrollo de Aplicaciones II (*) 

SELECT * FROM universidades;
SELECT * FROM facultades;
SELECT * FROM escuelasprofesionales;
SELECT * FROM AsignaturasRequisitos;
SELECT * FROM planesestudios;
SELECT * FROM tiposasignaturas;
SELECT * FROM ASIGNATURAS;
SELECT * FROM asignaturaselectivas_no_dictadas;
SELECT * FROM especialidades;

 /*
    Esta consulta obtiene información sobre la universidad, facultad, escuela profesional, 
	   plan de estudios, asignatura, tipo de asignatura y especialidad (si corresponde) de todas las 
	   asignaturas en el plan de estudios. Asegúrate de ajustar los nombres de las tablas y los campos según corresponda a tu base de datos.
       */
            
     SELECT u.NombreUniversidad,
       f.NombreFacultad,
       ep.NombreEscuelaProfesional,
       pe.ANIO,
       pe.Semestre,
       a.CodigoAsignatura,
       a.NombreAsignatura,
       a.Creditos,
       ta.NombreTipoAsignatura,
       esp.NombreEspecialidad
            FROM Universidades u
            INNER JOIN Facultades f ON u.ID_Universidad = f.UniversidadID
            INNER JOIN EscuelasProfesionales ep ON f.ID_Facultad = ep.FacultadID
            INNER JOIN PlanesEstudios pe ON ep.ID_EscuelaProfesional = pe.EscuelaProfesionalID
            INNER JOIN Asignaturas a ON pe.ID_PlanEstudios = a.PlanEstudiosID
            INNER JOIN TiposAsignaturas ta ON a.TipoAsignaturaID = ta.ID_TipoAsignatura
        LEFT JOIN Especialidades esp ON a.EspecialidadID = esp.ID_Especialidad;    
        
        
        
        
        /*
        
        Esta consulta muestra los datos de las asignaturas y también los requisitos correspondientes a cada una de ellas, en caso de tener requisitos 
        previos. Los requisitos se muestran como columnas adicionales con el código y nombre de la asignatura requisito.
        
        */

		SELECT Uni.NombreUniversidad, Fac.NombreFacultad, Esc.NombreEscuelaProfesional, 
		PE.ANIO,PE.Semestre, A.CodigoAsignatura, A.Ciclo, TA.NombreTipoAsignatura, E.NombreEspecialidad, A.NombreAsignatura, 
		A.Creditos, RA.CodigoAsignatura AS CodigoRequisito, RA.NombreAsignatura AS NombreRequisito
			FROM Universidades Uni
			INNER JOIN Facultades Fac ON Uni.ID_Universidad = Fac.UniversidadID
			INNER JOIN EscuelasProfesionales Esc ON Fac.ID_Facultad = Esc.FacultadID
			INNER JOIN PlanesEstudios PE ON Esc.ID_EscuelaProfesional = PE.EscuelaProfesionalID
			INNER JOIN Asignaturas A ON PE.ID_PlanEstudios = A.PlanEstudiosID
			INNER JOIN TiposAsignaturas TA ON A.TipoAsignaturaID = TA.ID_TipoAsignatura
			LEFT JOIN Especialidades E ON A.EspecialidadID = E.ID_Especialidad
			LEFT JOIN AsignaturasRequisitos R ON A.CodigoAsignatura = R.AsignaturaID
		LEFT JOIN Asignaturas RA ON R.AsignaturaRequisitoID = RA.CodigoAsignatura;
        
        
        --En esta consulta, se utiliza la función STRING_AGG para concatenar los códigos y nombres de los requisitos separados por una coma. 
		--Los requisitos se agrupan en una sola fila por cada asignatura.
    SELECT Uni.NombreUniversidad,Fac.NombreFacultad,Esc.NombreEscuelaProfesional, PE.ANIO, PE.Semestre,A.CodigoAsignatura, A.Ciclo,
        TA.NombreTipoAsignatura, E.NombreEspecialidad,A.NombreAsignatura, A.Creditos,
           LISTAGG(RA.CodigoAsignatura, ', ') WITHIN GROUP (ORDER BY RA.CodigoAsignatura) AS CodigoRequisitos,
           LISTAGG(RA.NombreAsignatura, ', ') WITHIN GROUP (ORDER BY RA.CodigoAsignatura) AS NombreRequisitos
            FROM Universidades Uni
            INNER JOIN Facultades Fac ON Uni.ID_Universidad = Fac.UniversidadID
            INNER JOIN EscuelasProfesionales Esc ON Fac.ID_Facultad = Esc.FacultadID
            INNER JOIN PlanesEstudios PE ON Esc.ID_EscuelaProfesional = PE.EscuelaProfesionalID
            INNER JOIN Asignaturas A ON PE.ID_PlanEstudios = A.PlanEstudiosID
            INNER JOIN TiposAsignaturas TA ON A.TipoAsignaturaID = TA.ID_TipoAsignatura
            LEFT JOIN Especialidades E ON A.EspecialidadID = E.ID_Especialidad
            LEFT JOIN AsignaturasRequisitos R ON A.CodigoAsignatura = R.AsignaturaID
            LEFT JOIN Asignaturas RA ON R.AsignaturaRequisitoID = RA.CodigoAsignatura
    GROUP BY Uni.NombreUniversidad, Fac.NombreFacultad, Esc.NombreEscuelaProfesional, PE.ANIO,
         PE.Semestre,A.CodigoAsignatura, A.Ciclo, TA.NombreTipoAsignatura, E.NombreEspecialidad, A.NombreAsignatura, A.Creditos;
        
        
 /*
			
    En esta consulta, he agregado una subconsulta para excluir las asignaturas que no están siendo dictadas en el semestre académico 2023. 
    La condición A.ID_Asignatura NOT IN (SELECT AsignaturaID FROM AsignaturasElectivas_NO_DICTADAS WHERE PlanEstudiosID = PE.ID_PlanEstudios) 
    asegura que solo se incluyan las asignaturas que no están presentes en la tabla "AsignaturasElectivas_NO_DICTADAS" para el mismo plan de estudios 
    y el semestre académico correspondiente.

    Espero que esta consulta se ajuste a tus requerimientos y muestre solo las asignaturas que están siendo dictadas en el semestre académico 2023.
			
*/


	SELECT Uni.NombreUniversidad, Fac.NombreFacultad,Esc.NombreEscuelaProfesional, PE.ANIO, PE.Semestre, A.CodigoAsignatura,
       A.Ciclo, TA.NombreTipoAsignatura, E.NombreEspecialidad,A.NombreAsignatura,A.Creditos,
       LISTAGG(RA.CodigoAsignatura, ', ') WITHIN GROUP (ORDER BY RA.CodigoAsignatura) AS CodigoRequisitos,
       LISTAGG(RA.NombreAsignatura, ', ') WITHIN GROUP (ORDER BY RA.CodigoAsignatura) AS NombreRequisitos
    FROM Universidades Uni
        INNER JOIN Facultades Fac ON Uni.ID_Universidad = Fac.UniversidadID
        INNER JOIN EscuelasProfesionales Esc ON Fac.ID_Facultad = Esc.FacultadID
        INNER JOIN PlanesEstudios PE ON Esc.ID_EscuelaProfesional = PE.EscuelaProfesionalID
        INNER JOIN Asignaturas A ON PE.ID_PlanEstudios = A.PlanEstudiosID
        INNER JOIN TiposAsignaturas TA ON A.TipoAsignaturaID = TA.ID_TipoAsignatura
        LEFT JOIN Especialidades E ON A.EspecialidadID = E.ID_Especialidad
        LEFT JOIN AsignaturasRequisitos R ON A.CodigoAsignatura = R.AsignaturaID
        LEFT JOIN Asignaturas RA ON R.AsignaturaRequisitoID = RA.CodigoAsignatura
        LEFT JOIN AsignaturasElectivas_NO_DICTADAS AD ON A.CodigoAsignatura = AD.AsignaturaID AND PE.ID_PlanEstudios = AD.PlanEstudiosID
        WHERE PE.ANIO = '2023' AND AD.AsignaturaID IS NOT NULL
        GROUP BY Uni.NombreUniversidad,Fac.NombreFacultad, Esc.NombreEscuelaProfesional,PE.ANIO,PE.Semestre, A.CodigoAsignatura,A.Ciclo,
            TA.NombreTipoAsignatura, E.NombreEspecialidad,A.NombreAsignatura, A.Creditos;
        
        
        
        
/*
En esta versión modificada de la consulta, he cambiado la condición de la subconsulta para incluir las asignaturas que están presentes 
en la tabla "AsignaturasElectivas_NO_DICTADAS" para el mismo plan de estudios y el semestre académico correspondiente: A.ID_Asignatura IN 
(SELECT AsignaturaID FROM AsignaturasElectivas_NO_DICTADAS WHERE PlanEstudiosID = PE.ID_PlanEstudios).

Esto devolverá las asignaturas que son dictadas en el semestre académico 2023.


*/

SELECT Uni.NombreUniversidad, Fac.NombreFacultad,Esc.NombreEscuelaProfesional, PE.ANIO, PE.Semestre, A.CodigoAsignatura,A.Ciclo,
       TA.NombreTipoAsignatura, E.NombreEspecialidad,A.NombreAsignatura,A.Creditos,
       LISTAGG(RA.CodigoAsignatura, ', ') WITHIN GROUP (ORDER BY RA.CodigoAsignatura) AS CodigoRequisitos,
       LISTAGG(RA.NombreAsignatura, ', ') WITHIN GROUP (ORDER BY RA.CodigoAsignatura) AS NombreRequisitos
FROM Universidades Uni
        INNER JOIN Facultades Fac ON Uni.ID_Universidad = Fac.UniversidadID
        INNER JOIN EscuelasProfesionales Esc ON Fac.ID_Facultad = Esc.FacultadID
        INNER JOIN PlanesEstudios PE ON Esc.ID_EscuelaProfesional = PE.EscuelaProfesionalID
        INNER JOIN Asignaturas A ON PE.ID_PlanEstudios = A.PlanEstudiosID
        INNER JOIN TiposAsignaturas TA ON A.TipoAsignaturaID = TA.ID_TipoAsignatura
        LEFT JOIN Especialidades E ON A.EspecialidadID = E.ID_Especialidad
        LEFT JOIN AsignaturasRequisitos R ON A.CodigoAsignatura = R.AsignaturaID
        LEFT JOIN Asignaturas RA ON R.AsignaturaRequisitoID = RA.CodigoAsignatura
        WHERE PE.ANIO = 2023 AND A.CodigoAsignatura NOT IN (
            SELECT AsignaturaID FROM AsignaturasElectivas_NO_DICTADAS WHERE PlanEstudiosID = PE.ID_PlanEstudios
        )
        GROUP BY Uni.NombreUniversidad,Fac.NombreFacultad, Esc.NombreEscuelaProfesional, PE.ANIO, PE.Semestre,
            A.CodigoAsignatura, A.Ciclo,TA.NombreTipoAsignatura, E.NombreEspecialidad, A.NombreAsignatura, A.Creditos;
            
            
  /*ASIGNATURAS DICTADAS EN EL 2023*/          
SELECT A.CodigoAsignatura, A.NombreAsignatura
FROM Asignaturas A
INNER JOIN PlanesEstudios PE ON A.PlanEstudiosID = PE.ID_PlanEstudios
LEFT JOIN AsignaturasElectivas_NO_DICTADAS AE ON A.CodigoAsignatura = AE.AsignaturaID AND PE.ID_PlanEstudios = AE.PlanEstudiosID
WHERE PE.ANIO = 2023 AND AE.AsignaturaID IS NULL;  
            
 /*ASIGNATURAS NO DICTADAS EN EL 2023*/           
 SELECT A.CodigoAsignatura, A.NombreAsignatura
FROM Asignaturas A
INNER JOIN PlanesEstudios PE ON A.PlanEstudiosID = PE.ID_PlanEstudios
LEFT JOIN AsignaturasElectivas_NO_DICTADAS AE ON A.CodigoAsignatura = AE.AsignaturaID AND PE.ID_PlanEstudios = AE.PlanEstudiosID
WHERE PE.ANIO = 2023 AND AE.AsignaturaID IS NOT NULL;           
         
         