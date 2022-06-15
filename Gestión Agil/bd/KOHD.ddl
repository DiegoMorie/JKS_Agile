-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2022-06-02 09:23:20 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE asignatura (
    sigla               VARCHAR2(100) NOT NULL,
    secciones           VARCHAR2(100) NOT NULL,
    nombre_asignatura   VARCHAR2(100) NOT NULL
);

ALTER TABLE asignatura ADD CONSTRAINT asignatura_pk PRIMARY KEY ( sigla );

CREATE TABLE car_as_es (
    car_as_es_id NUMBER NOT NULL
);

ALTER TABLE car_as_es ADD CONSTRAINT car_as_es_pk PRIMARY KEY ( car_as_es_id );

CREATE TABLE carrera (
    id_car                                  VARCHAR2(10) NOT NULL,
    nombre                                  VARCHAR2(50) NOT NULL,
    cantidad_alumnos                        INTEGER NOT NULL,
    cordinador_de_carrera_rut               VARCHAR2(100) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    cordinador_de_carrera_dig_verificador   CHAR(1) NOT NULL,
    jefe_de_carrera_rut                     VARCHAR2(100) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    jefe_de_carrera_dig_verificador         CHAR(1) NOT NULL
);

CREATE UNIQUE INDEX carrera__idx ON
    carrera (
        cordinador_de_carrera_rut
    ASC,
        cordinador_de_carrera_dig_verificador
    ASC );

CREATE UNIQUE INDEX carrera__idxv1 ON
    carrera (
        jefe_de_carrera_rut
    ASC,
        jefe_de_carrera_dig_verificador
    ASC );

ALTER TABLE carrera ADD CONSTRAINT carrera_pk PRIMARY KEY ( id_car );

CREATE TABLE cordinador_de_carrera (
    rut               VARCHAR2(100) NOT NULL,
    dig_verificador   CHAR(1) NOT NULL,
    carrera_id_car    VARCHAR2(10) NOT NULL
);

CREATE UNIQUE INDEX cordinador_de_carrera__idx ON
    cordinador_de_carrera (
        carrera_id_car
    ASC );

ALTER TABLE cordinador_de_carrera ADD CONSTRAINT cordinador_de_carrera_pk PRIMARY KEY ( rut,
                                                                                        dig_verificador );

CREATE TABLE estudiante (
    rut                  VARCHAR2(100) NOT NULL,
    dig_verificador      CHAR(1) NOT NULL,
    sexo                 VARCHAR2(100) NOT NULL,
    contacto             VARCHAR2(100) NOT NULL,
    correo_electronico   VARCHAR2(100) NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( rut,
                                                                  dig_verificador );

CREATE TABLE jefe_de_carrera (
    rut                  VARCHAR2(100) NOT NULL,
    dig_verificador      CHAR(1) NOT NULL,
    profesores_a_cargo   CLOB NOT NULL,
    carrera_id_car       VARCHAR2(10) NOT NULL
);

CREATE UNIQUE INDEX jefe_de_carrera__idx ON
    jefe_de_carrera (
        carrera_id_car
    ASC );

ALTER TABLE jefe_de_carrera ADD CONSTRAINT jefe_de_carrera_pk PRIMARY KEY ( rut,
                                                                            dig_verificador );

CREATE TABLE profesor (
    rut               VARCHAR2(100) NOT NULL,
    dig_verificador   CHAR(1) NOT NULL,
    correo_docente    VARCHAR2(100) NOT NULL,
    telefono          VARCHAR2(100) NOT NULL
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( rut,
                                                              dig_verificador );

CREATE TABLE relation_4 (
    carrera_id_car           VARCHAR2(10) NOT NULL,
    car_as_es_car_as_es_id   NUMBER NOT NULL
);

ALTER TABLE relation_4 ADD CONSTRAINT relation_4_pk PRIMARY KEY ( carrera_id_car,
                                                                  car_as_es_car_as_es_id );

CREATE TABLE relation_5 (
    estudiante_rut               VARCHAR2(100) NOT NULL,
    estudiante_dig_verificador   CHAR(1) NOT NULL,
    car_as_es_car_as_es_id       NUMBER NOT NULL
);

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_pk PRIMARY KEY ( estudiante_rut,
                                               estudiante_dig_verificador,
                                               car_as_es_car_as_es_id );

CREATE TABLE relation_6 (
    asignatura_sigla         VARCHAR2(100) NOT NULL,
    car_as_es_car_as_es_id   NUMBER NOT NULL
);

ALTER TABLE relation_6 ADD CONSTRAINT relation_6_pk PRIMARY KEY ( asignatura_sigla,
                                                                  car_as_es_car_as_es_id );

CREATE TABLE relation_7 (
    profesor_rut               VARCHAR2(100) NOT NULL,
    profesor_dig_verificador   CHAR(1) NOT NULL,
    asignatura_sigla           VARCHAR2(100) NOT NULL
);

ALTER TABLE relation_7
    ADD CONSTRAINT relation_7_pk PRIMARY KEY ( profesor_rut,
                                               profesor_dig_verificador,
                                               asignatura_sigla );

CREATE TABLE relation_8 (
    sala_numero_sala   INTEGER NOT NULL,
    asignatura_sigla   VARCHAR2(100) NOT NULL
);

ALTER TABLE relation_8 ADD CONSTRAINT relation_8_pk PRIMARY KEY ( sala_numero_sala,
                                                                  asignatura_sigla );

CREATE TABLE sala (
    numero_sala           INTEGER NOT NULL,
    cantidad_estudiante   INTEGER NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( numero_sala );

CREATE TABLE usuario (
    rut               VARCHAR2(100) NOT NULL,
    dig_verificador   CHAR(1) NOT NULL,
    nombres           VARCHAR2(100) NOT NULL,
    apellido_p        VARCHAR2(100) NOT NULL,
    apellido_m        VARCHAR2(100) NOT NULL,
    nivel_acceso      INTEGER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( rut,
                                                            dig_verificador );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE carrera
    ADD CONSTRAINT carrera_cordinador_de_carrera_fk FOREIGN KEY ( cordinador_de_carrera_rut,
                                                                  cordinador_de_carrera_dig_verificador )
        REFERENCES cordinador_de_carrera ( rut,
                                           dig_verificador );

ALTER TABLE carrera
    ADD CONSTRAINT carrera_jefe_de_carrera_fk FOREIGN KEY ( jefe_de_carrera_rut,
                                                            jefe_de_carrera_dig_verificador )
        REFERENCES jefe_de_carrera ( rut,
                                     dig_verificador );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE cordinador_de_carrera
    ADD CONSTRAINT cordinador_de_carrera_carrera_fk FOREIGN KEY ( carrera_id_car )
        REFERENCES carrera ( id_car );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE cordinador_de_carrera
    ADD CONSTRAINT cordinador_de_carrera_usuario_fk FOREIGN KEY ( rut,
                                                                  dig_verificador )
        REFERENCES usuario ( rut,
                             dig_verificador );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_usuario_fk FOREIGN KEY ( rut,
                                                       dig_verificador )
        REFERENCES usuario ( rut,
                             dig_verificador );

ALTER TABLE jefe_de_carrera
    ADD CONSTRAINT jefe_de_carrera_carrera_fk FOREIGN KEY ( carrera_id_car )
        REFERENCES carrera ( id_car );

ALTER TABLE jefe_de_carrera
    ADD CONSTRAINT jefe_de_carrera_usuario_fk FOREIGN KEY ( rut,
                                                            dig_verificador )
        REFERENCES usuario ( rut,
                             dig_verificador );

ALTER TABLE profesor
    ADD CONSTRAINT profesor_usuario_fk FOREIGN KEY ( rut,
                                                     dig_verificador )
        REFERENCES usuario ( rut,
                             dig_verificador );

ALTER TABLE relation_4
    ADD CONSTRAINT relation_4_car_as_es_fk FOREIGN KEY ( car_as_es_car_as_es_id )
        REFERENCES car_as_es ( car_as_es_id );

ALTER TABLE relation_4
    ADD CONSTRAINT relation_4_carrera_fk FOREIGN KEY ( carrera_id_car )
        REFERENCES carrera ( id_car );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_car_as_es_fk FOREIGN KEY ( car_as_es_car_as_es_id )
        REFERENCES car_as_es ( car_as_es_id );

ALTER TABLE relation_5
    ADD CONSTRAINT relation_5_estudiante_fk FOREIGN KEY ( estudiante_rut,
                                                          estudiante_dig_verificador )
        REFERENCES estudiante ( rut,
                                dig_verificador );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_asignatura_fk FOREIGN KEY ( asignatura_sigla )
        REFERENCES asignatura ( sigla );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_car_as_es_fk FOREIGN KEY ( car_as_es_car_as_es_id )
        REFERENCES car_as_es ( car_as_es_id );

ALTER TABLE relation_7
    ADD CONSTRAINT relation_7_asignatura_fk FOREIGN KEY ( asignatura_sigla )
        REFERENCES asignatura ( sigla );

ALTER TABLE relation_7
    ADD CONSTRAINT relation_7_profesor_fk FOREIGN KEY ( profesor_rut,
                                                        profesor_dig_verificador )
        REFERENCES profesor ( rut,
                              dig_verificador );

ALTER TABLE relation_8
    ADD CONSTRAINT relation_8_asignatura_fk FOREIGN KEY ( asignatura_sigla )
        REFERENCES asignatura ( sigla );

ALTER TABLE relation_8
    ADD CONSTRAINT relation_8_sala_fk FOREIGN KEY ( sala_numero_sala )
        REFERENCES sala ( numero_sala );

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated

CREATE SEQUENCE car_as_es_car_as_es_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER car_as_es_car_as_es_id_trg BEFORE
    INSERT ON car_as_es
    FOR EACH ROW
    WHEN ( new.car_as_es_id IS NULL )
BEGIN
    :new.car_as_es_id := car_as_es_car_as_es_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             4
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   9
-- WARNINGS                                 0
