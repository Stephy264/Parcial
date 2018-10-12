-- PARTE I

--Crear un tablespace llamado "mid_term", este solamente tendrá un datafile de 60Mb.
CREATE TABLESPACE MID_TERM DATAFILE 'data01.dbf' SIZE 60M ;

--Crear un usuario con espacio ilimitado en el tablespace "mid_term", el nombre de usuario será la inicial de su nombre y el primer apellido completo
CREATE USER SCORTES IDENTIFIED BY SCORTES DEFAULT TABLESPACE MID_TERM QUOTA UNLIMITED ON MID_TERM;


--Crear perfil DBA y acceso y crear tablas

-- Crear 2 roles:
-- El primer role se llamará "MINI_DBA" y este tendrá los privilegios de Crear Secuencias y crear tablas.
-- El segundo role se llamará "STUDENT" y este tendrá el privilegio de crear sesión y adicional tendrá anidado el role de "MINI_DBA".
-- Asociar el role al usuario creado. 

CREATE ROLE MINI_DBA;

CREATE ROLE STUDENT;

GRANT MINI_DBA TO SCORTES;
GRANT CREATE SESSION, CREATE TABLE TO SCORTES;
GRANT CONNECT, RESOURCE TO SCORTES;

-- PARTE II
-- Crear 2 secuencias:

-- CLASE_EMPLEADO_SEQ: Deberá comenzar en 500 y tener un valor máximo de 700 con incrementos de 1.

CREATE SEQUENCE CLASE_EMPLEADO_SEQ
  START WITH 500
  INCREMENT BY 1
  MAXVALUE 700
  MINVALUE 500;

  
  -- CAPTURAS_SEQ:  Deberá comenzar en 50 y tener un valor máximo de 200 con incrementos de 1.

 CREATE SEQUENCE CAPTURAS_SEQ
  START WITH 50
  INCREMENT BY 1
  MAXVALUE 200
  MINVALUE 50;

-- Tablas:
--Crear tabla CLASE_EMPLEADOS

CREATE TABLE CLASE_EMPLEADOS (
	ID INTEGER PRIMARY KEY,
	NOMBRE VARCHAR2(255)
);


CREATE TABLE CAPTURAS (
    ID INTEGER PRIMARY KEY,
	FECHA DATE
	DEPARTAMENTO VARCHAR2(255)
    MUNICIPIO VARCHAR2(255)
    DIA INTEGER
    BARRIO VARCHAR2(255)
    ZONA VARCHAR2(255)
    CLASE_SITIO VARCHAR2(255)
    EDAD INTEGER
    SEXO VARCHAR2(255)
    ESTADO_CIVIL VARCHAR2(255) 
    PROFESION VARCHAR2(255)
    ESCOLARIDAD VARCHAR2(255)
    DELITO VARCHAR2(255)
);


ALTER TABLE CAPTURAS ADD CONSTRAINT CLASE_EMPLEADOS_FK FOREIGN KEY(CLASE_EMPLEADOS_ID) REFERENCES CLASE_EMPLEADOS(ID);
   




