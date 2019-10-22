/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES
(
   ID_CLIENTE NUMBER(5) not null,
   ID_PERSONA NUMBER(10),
   NOMBRE VARCHAR(15),
   TELEFONO NUMBER(10),
   NUMERO_EXPEDIENTE NVARCHAR2(20),
   constraint PK_CLIENTES primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: DETALLE_EXPEDIENTE                                    */
/*==============================================================*/
create table DETALLE_EXPEDIENTE
(
   ID_CLIENTE NUMBER(5),
   ID_DETALLE_EXPEDIENTE INTEGER not null,
   ID_TIP_CLIENTE INTEGER,
   COMENTARIOS VARCHAR2(20),
   constraint PK_DETALLE_EXPEDIENTE primary key (ID_DETALLE_EXPEDIENTE)
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   CANTIDAD NUMBER(10),
   PRECIO NUMBER(10),
   TOTAL NUMBER(10),
   ID_DETALLE NUMBER(10) not null,
   ID_PRODUCTO          INTEGER,
   ID_FACTURA            NUMBER(10),
   constraint PK_DETALLE_FACTURA primary key
(ID_DETALLE)
);

/*==============================================================*/
/* Table: ENCUESTA                                              */
/*==============================================================*/
create table ENCUESTA(
ID_ENCUESTA NUMBER NOT NULL,
ID_PREGUNTA NUMBER,
TITULO VARCHAR2(20),
DESCRIPCION VARCHAR2(200),
CONSTRAINT PK_ENCUESTA PRIMARY KEY(ID_ENCUESTA)
);

   /*==============================================================*/
   /* Table: ENCUESTA_PRODUCTO                                     */
   /*==============================================================*/
   create table ENCUESTA_PRODUCTO (
   SERIE_ENCUESTA       NUMBER not null,
   ID_ENCUESTA          NUMBER(10),
   ID_PRODUCTO          INTEGER,
   constraint PK_ENCUESTA_PRODUCTO primary key
   (SERIE_ENCUESTA)
);

   /*==============================================================*/
   /* Table: ENCUESTA_RESPONDIDA                                   */
   /*==============================================================*/
   create table ENCUESTA_RESPONDIDA
   (
      ID_ENCUESTA_RESPONDIDA INTEGER not null,
      ID_ENCUESTA NUMBER(10),
      ID_CLIENTE NUMBER(5),
      CORRELATIVO INTEGER,
      constraint PK_ENCUESTA_RESPONDIDA primary key (ID_ENCUESTA_RESPONDIDA)
   );

   /*==============================================================*/
   /* Table: FACTURA                                               */
   /*==============================================================*/
   create table FACTURA
   (
      ID_FACTURA NUMBER(10) not null,
      ID_DETALLE_EXPEDIENTE INTEGER,
      FEHCA DATE,
      NIT NUMBER,
      NO_SERIE NUMBER,
      NO_FACTURA NUMBER,
      constraint PK_FACTURA primary key (ID_FACTURA)
   );

   /*==============================================================*/
   /* Table: PERSONA                                               */
   /*==============================================================*/
   create table PERSONA
   (
      ID_PERSONA NUMBER(10) not null,
      NOMBRE VARCHAR2(100),
      APELLIDO Varchar2(100),
      TELEFONO NUMBER(10),
      NIT NUMBER(10),
      ACTIVO INTEGER,
      constraint PK_PERSONA primary key (ID_PERSONA)
   );

   /*==============================================================*/
   /* Table: PREGUNTA                                              */
   /*==============================================================*/
   create table PREGUNTA
   (
      ID_PREGUNTA NUMBER(15) not null,
      DESCRIPCION VARCHAR2(15),
      TIPO VARCHAR2(15),
      constraint PK_PREGUNTA primary key (ID_PREGUNTA)
   );

   /*==============================================================*/
   /* Table: PRODUCTO                                              */
   /*==============================================================*/
   create table PRODUCTO (
   ID_PRODUCTO          INTEGEr   not null,
   NOMBRE               VARCHAR2(10),
   EXISTENCIA           VARCHAR2(15),
   PRECIO               DECIMAL,
   constraint PK_PRODUCTO primary key
   (ID_PRODUCTO)
);

   /*==============================================================*/
   /* Table: RESPUESTA                                             */
   /*==============================================================*/
   create table RESPUESTA
   (
      ID_RESPUESTA NUMBER(10) not null,
      ID_ENCUESTA_RESPONDIDA INTEGER,
      ID_PREGUNTA NUMBER(15),
      RESPUESTA VARCHAR2(20),
      constraint PK_RESPUESTA primary key (ID_RESPUESTA)
   );

    CREATE TABLE bitacora
    (
        id_bitacora integer primary key not null,
        tabla varchar2(200),
        cambioAnterior varchar2(200),
        cambioNuevo varchar2(200),
        fecha varchar2(200),
        tipo varchar2(200)
    )
   /*==============================================================*/
   /* Table: TIPO_CLIENTE                                          */
   /*==============================================================*/
   create table TIPO_CLIENTE
   (
      ID_TIP_CLIENTE INTEGER not null,
      DESCRIPCION VARCHAR2(100),
      constraint PK_TIPO_CLIENTE primary key (ID_TIP_CLIENTE)
   );

   alter table CLIENTES
   add constraint FK_CLIENTES_REFERENCE_PERSONA foreign key (ID_PERSONA)
      references PERSONA (ID_PERSONA);

   alter table DETALLE_EXPEDIENTE
   add constraint FK_DETALLE__REFERENCE_TIPO_CLI foreign key (ID_TIP_CLIENTE)
      references TIPO_CLIENTE (ID_TIP_CLIENTE);

   alter table DETALLE_EXPEDIENTE
   add constraint FK_DETALLE__REFERENCE_CLIENTES foreign key (ID_CLIENTE)
      references CLIENTES (ID_CLIENTE);

   alter table DETALLE_FACTURA
   add constraint FK_DETALLE__REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO);

   alter table DETALLE_FACTURA
   add constraint FK_DETALLE__REFERENCE_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA);

   alter table ENCUESTA
   add constraint FK_ENCUESTA_REFERENCE_PREGUNTA foreign key (ID_PREGUNTA)
      references PREGUNTA (ID_PREGUNTA);

   alter table ENCUESTA_PRODUCTO
   add constraint FK_ENCUESTA_REFERENCE_ENCUEST2 foreign key (ID_ENCUESTA)
      references ENCUESTA (ID_ENCUESTA);

   alter table ENCUESTA_PRODUCTO
   add constraint FK_ENCUESTA_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO);

   alter table ENCUESTA_RESPONDIDA
   add constraint FK_ENCUESTA_REFERENCE_ENCUESTA foreign key (ID_ENCUESTA)
      references ENCUESTA (ID_ENCUESTA);

   alter table ENCUESTA_RESPONDIDA
   add constraint FK_ENCUESTA_REFERENCE_CLIENTES foreign key (ID_CLIENTE)
      references CLIENTES (ID_CLIENTE);

   alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_DETALLE_ foreign key (ID_DETALLE_EXPEDIENTE)
      references DETALLE_EXPEDIENTE (ID_DETALLE_EXPEDIENTE);

   alter table RESPUESTA
   add constraint FK_RESPUEST_REFERENCE_PREGUNTA foreign key (ID_PREGUNTA)
      references PREGUNTA (ID_PREGUNTA);

   alter table RESPUESTA
   add constraint FK_RESPUEST_REFERENCE_ENCUESTA foreign key (ID_ENCUESTA_RESPONDIDA)
      references ENCUESTA_RESPONDIDA (ID_ENCUESTA_RESPONDIDA);


alter table persona add activo integer;
update persona set activo = 1 

alter table tipo_cliente add activo integer;
update tipo_cliente set activo = 1

alter table producto add activo integer;
update producto set activo = 1

alter table pregunta add activo integer;
update pregunta set activo = 1


alter table clientes add activo integer;
update clientes set activo = 1


grant debug connect session to hr;
grant debug any procedure to hr
            


   /*==============================================================*/
   /* SECUENCIAS                                                   */
   /*==============================================================*/

    CREATE SEQUENCE NPersona
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;
    CREATE SEQUENCE NClient
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;
    CREATE SEQUENCE NDetailCaseFile
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;
    CREATE SEQUENCE NinvoiceDetail
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;
    CREATE SEQUENCE NSurvey
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

   -- New Sequence

    CREATE SEQUENCE NSurveyProduct
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NSurveyAnswered
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NProduct
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NReply
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NBill
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NClientType
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NQuestion
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

    CREATE SEQUENCE NBitacora
        INCREMENT BY 1
        START WITH 1
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;


   /*==============================================================*/
   /* PAQUETES Y PROCEDIMIENTOS                                    */
   /*==============================================================*/

CREATE OR REPLACE  PACKAGE PK_ADD_DATA IS
    PROCEDURE NewPerson(firstname varchar2,lastname varchar2,telephone number, nit number);
    PROCEDURE NewClient(idPerson number,telephone number, number_case_file varchar2);
    PROCEDURE NewDetailCaseFile(idClient number,IdTypeClient integer, comments varchar2);
    PROCEDURE NewinvoiceDetail(quantity number,price integer, total number,idProduct integer,idFill number);
    PROCEDURE NewSurvey(IdQuestion number,title varchar2,Description varchar2);
    PROCEDURE NewSurveyProduct(idPoll number,idProduct number);
    PROCEDURE NewSurveyAnswered(IdPoll number,idClient number, correlative number);
    PROCEDURE NewProduct(name varchar2,existence varchar2, price number);
    PROCEDURE NewReply(IdSurvey_Answered number, IdProduct number, Reply varchar2);
    PROCEDURE NewBill(IdRecordDetail number, dDate varchar2, nit number, NSerie number, NBills number);
    PROCEDURE NewClientType(description varchar2);
    PROCEDURE NewQuestion(description varchar2,Types varchar2);
    
    PROCEDURE deletePerson(row_id number);
    PROCEDURE deleteCliente(row_id number);
    PROCEDURE deleteProducto(row_id number);
    PROCEDURE deletePregunta(row_id number);
    PROCEDURE deletedataCliente(row_id number);

END;

DROP PACKAGE PK_ADD_DATA; 

CREATE OR REPLACE PACKAGE BODY PK_ADD_DATA IS

    
    PROCEDURE NewPerson(firstname varchar2,lastname varchar2,telephone number, nit number) IS
    BEGIN
        INSERT INTO PERSONA(ID_PERSONA,NOMBRE,APELLIDO,TELEFONO,NIT, ACTIVO) 
            VALUES(NPersona.NEXTVAL,firstname,lastname,telephone,nit, 1);
    END NewPerson;

    PROCEDURE NewClient(idPerson number,telephone number, number_case_file varchar2)
    IS
    BEGIN
        INSERT INTO CLIENTES(ID_CLIENTE,ID_PERSONA,TELEFONO,NUMERO_EXPEDIENTE,ACTIVO) 
            VALUES(NClient.NEXTVAL,idPerson,telephone,number_case_file,1);
    END NewClient;
    
    PROCEDURE NewDetailCaseFile(idClient number,IdTypeClient integer, comments varchar2)
    IS
    BEGIN
        INSERT INTO DETALLE_EXPEDIENTE(ID_CLIENTE,ID_DETALLE_EXPEDIENTE,ID_TIP_CLIENTE,COMENTARIOS) 
            VALUES(idClient,NDetailCaseFile.NEXTVAL,IdTypeClient,comments);
    END NewDetailCaseFile;
    
    PROCEDURE NewinvoiceDetail(quantity number,price integer, total number,idProduct integer,idFill number)
    IS
    BEGIN
        INSERT INTO DETALLE_FACTURA(CANTIDAD,PRECIO,TOTAL,ID_DETALLE,ID_PRODUCTO,ID_FACTURA) 
            VALUES(quantity,price,total,NinvoiceDetail.NEXTVAL,idProduct,idFill);
    END NewinvoiceDetail;
    
    PROCEDURE NewSurvey(IdQuestion number,title varchar2,Description varchar2)
    IS
    BEGIN
        INSERT INTO ENCUESTA(ID_ENCUESTA,ID_PREGUNTA,TITULO,DESCRIPCION) 
            VALUES(NinvoiceDetail.NEXTVAL,IdQuestion,title,DESCRIPTION);
    END NewSurvey;
    
    -- New Procedure
    PROCEDURE NewSurveyProduct(idPoll number,idProduct number)
    IS
    BEGIN
        INSERT INTO ENCUESTA_PRODUCTO(SERIE_ENCUESTA,ID_ENCUESTA,ID_PRODUCTO) 
            VALUES(NSurveyProduct.NEXTVAL,IdPoll,idProduct);
    END NewSurveyProduct;
    
    PROCEDURE NewSurveyAnswered(IdPoll number,idClient number, correlative number)
    IS
    BEGIN
        INSERT INTO ENCUESTA_RESPONDIDA(ID_ENCUESTA_RESPONDIDA,ID_ENCUESTA,ID_CLIENTE,CORRELATIVO) 
            VALUES(NSurveyAnswered.NEXTVAL,IdPoll,idClient,correlative);
    END NewSurveyAnswered;

    PROCEDURE NewProduct(name varchar2,existence varchar2, price number)
    IS
    BEGIN
        INSERT INTO PRODUCTO(ID_PRODUCTO, NOMBRE, EXISTENCIA, PRECIO,ACTIVO) 
            VALUES(NProduct.NEXTVAL,name, existence, price,1);
    END NewProduct;

    PROCEDURE NewReply(IdSurvey_Answered number, IdProduct number, Reply varchar2)
    IS
    BEGIN
        INSERT INTO RESPUESTA(ID_RESPUESTA, ID_ENCUESTA_RESPONDIDA, ID_PREGUNTA, RESPUESTA) 
            VALUES(NReply.NEXTVAL,IdSurvey_Answered, IdProduct, Reply);
    END NewReply;

    PROCEDURE NewBill(IdRecordDetail number, dDate varchar2, nit number, NSerie number, NBills number)
    IS
    BEGIN
        INSERT INTO FACTURA(ID_FACTURA, ID_DETALLE_EXPEDIENTE, FEHCA, NIT, NO_SERIE, NO_FACTURA) 
            VALUES(NBill.NEXTVAL,IdRecordDetail,dDate, nit, NSerie, NBills);
    END NewBill;

    PROCEDURE NewClientType(description varchar2)
    IS
    BEGIN
        INSERT INTO TIPO_CLIENTE(ID_TIP_CLIENTE, DESCRIPCION,ACTIVO) 
            VALUES(NClientType.NEXTVAL,description,1);
    END NewClientType;

    PROCEDURE NewQuestion(description varchar2,Types varchar2)
    IS
    BEGIN
        INSERT INTO PREGUNTA(ID_PREGUNTA, DESCRIPCION, TIPO,ACTIVO) 
            VALUES(NQuestion.NEXTVAL,description, Types,1);
    END NewQuestion;
    
    PROCEDURE deletePerson(row_id number)
    IS 
    BEGIN 
        UPDATE PERSONA SET ACTIVO = 0 WHERE ID_PERSONA = row_id;
    END deletePerson;
    
    PROCEDURE deleteCliente(row_id number)
    IS 
    BEGIN 
        UPDATE TIPO_CLIENTE SET ACTIVO = 0 WHERE ID_TIP_CLIENTE = row_id;
    END deleteCliente;
    
    PROCEDURE deleteProducto(row_id number)
    IS 
    BEGIN 
        UPDATE PRODUCTO SET ACTIVO = 0 WHERE ID_PRODUCTO = row_id;
    END deleteProducto;
    
    PROCEDURE deletePregunta(row_id number)
    IS 
    BEGIN 
        UPDATE PREGUNTA SET ACTIVO = 0 WHERE ID_PREGUNTA = row_id;
    END deletePregunta;
    
    PROCEDURE deletedataCliente(row_id number)
    IS
    BEGIN
        UPDATE CLIENTES SET ACTIVO = 0 WHERE ID_CLIENTE = row_id;
    END deletedataCliente;

END PK_ADD_DATA;


CREATE OR REPLACE TRIGGER auditoria_trigger
  BEFORE DELETE or INSERT or UPDATE
  ON CLIENTES FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'CLIENTES',:old.activo,:new.activo,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'CLIENTES',:old.activo,:new.activo,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'CLIENTES',:old.activo,:new.activo,sysdate,'UPDATE');
    END IF;
END;

CREATE OR REPLACE TRIGGER auditoria_trigger_Dexpediente
  BEFORE DELETE or INSERT or UPDATE
  ON DETALLE_EXPEDIENTE FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'DETALLE_EXPEDIENTE',:old.comentarios,:new.comentarios,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'DETALLE_EXPEDIENTE',:old.comentarios,:new.comentarios,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'DETALLE_EXPEDIENTE',:old.comentarios,:new.comentarios,sysdate,'UPDATE');
    END IF;
END;


CREATE OR REPLACE TRIGGER auditoria_trigger_dfactura
  BEFORE DELETE or INSERT or UPDATE
  ON DETALLE_FACTURA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'DETALLE_FACTURA',:old.id_factura,:new.id_factura,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'DETALLE_FACTURA',:old.id_factura,:new.id_factura,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'DETALLE_FACTURA',:old.id_factura,:new.id_factura,sysdate,'UPDATE');
    END IF;
END;


CREATE OR REPLACE TRIGGER auditoria_trigger_encuesta
  BEFORE DELETE or INSERT or UPDATE
  ON ENCUESTA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA',:old.ID_ENCUESTA,:new.ID_ENCUESTA,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA',:old.ID_ENCUESTA,:new.ID_ENCUESTA,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA',:old.ID_ENCUESTA,:new.ID_ENCUESTA,sysdate,'UPDATE');
    END IF;
END;


CREATE OR REPLACE TRIGGER auditoria_trigger_eproducto
  BEFORE DELETE or INSERT or UPDATE
  ON ENCUESTA_PRODUCTO FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA_PRODUCTO',:old.serie_encuesta,:new.serie_encuesta,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA_PRODUCTO',:old.serie_encuesta,:new.serie_encuesta,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA_PRODUCTO',:old.serie_encuesta,:new.serie_encuesta,sysdate,'UPDATE');
    END IF;
END;


CREATE OR REPLACE TRIGGER auditoria_trigger_erespondida
  BEFORE DELETE or INSERT or UPDATE
  ON ENCUESTA_RESPONDIDA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA_RESPONDIDA',:old.correlativo,:new.correlativo,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA_RESPONDIDA',:old.correlativo,:new.correlativo,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'ENCUESTA_RESPONDIDA',:old.correlativo,:new.correlativo,sysdate,'UPDATE');
    END IF;
END;


CREATE OR REPLACE TRIGGER auditoria_trigger_factura
  BEFORE DELETE or INSERT or UPDATE
  ON FACTURA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'FACTURA',:old.fehca,:new.fehca,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'FACTURA',:old.fehca,:new.fehca,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'FACTURA',:old.fehca,:new.fehca,sysdate,'UPDATE');
    END IF;
END;

CREATE OR REPLACE TRIGGER auditoria_trigger_persona
  BEFORE DELETE or INSERT or UPDATE
  ON PERSONA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'PERSONA',:old.activo,:new.activo,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'PERSONA',:old.activo,:new.activo,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'PERSONA',:old.activo,:new.activo,sysdate,'UPDATE');
    END IF;
END;

CREATE OR REPLACE TRIGGER auditoria_trigger_pregunta
  BEFORE DELETE or INSERT or UPDATE
  ON PREGUNTA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'PREGUNTA',:old.activo,:new.activo,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'PREGUNTA',:old.activo,:new.activo,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'PREGUNTA',:old.activo,:new.activo,sysdate,'UPDATE');
    END IF;
END;

CREATE OR REPLACE TRIGGER auditoria_trigger_producto
  BEFORE DELETE or INSERT or UPDATE
  ON PRODUCTO FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'PRODUCTO',:old.activo,:new.activo,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'PRODUCTO',:old.activo,:new.activo,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'PRODUCTO',:old.activo,:new.activo,sysdate,'UPDATE');
    END IF;
END;

CREATE OR REPLACE TRIGGER auditoria_trigger_respuesta
  BEFORE DELETE or INSERT or UPDATE
  ON RESPUESTA FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'RESPUESTA',:old.RESPUESTA,:new.RESPUESTA,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'RESPUESTA',:old.RESPUESTA,:new.RESPUESTA,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'RESPUESTA',:old.RESPUESTA,:new.RESPUESTA,sysdate,'UPDATE');
    END IF;
END;

CREATE OR REPLACE TRIGGER auditoria_trigger_tcliente
  BEFORE DELETE or INSERT or UPDATE
  ON TIPO_CLIENTE FOR EACH ROW 
BEGIN
    IF INSERTING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'TIPO_CLIENTE',:old.ACTIVO,:new.ACTIVO,sysdate,'INSERT');
      ELSIF DELETING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA, TIPO)
        VALUES (NPersona.NEXTVAL,'TIPO_CLIENTE',:old.ACTIVO,:new.ACTIVO,sysdate,'DELETE');
      ELSIF UPDATING THEN
        INSERT INTO bitacora(ID_BITACORA, TABLA, CAMBIOANTERIOR, CAMBIONUEVO, FECHA,TIPO)
        VALUES (NPersona.NEXTVAL,'TIPO_CLIENTE',:old.ACTIVO,:new.ACTIVO,sysdate,'UPDATE');
    END IF;
END;


   /*==============================================================*/
   /* Construir Diccionario de Datos                           */
   /*==============================================================*/

            /*==============================================================*/
            /* Obtener Nombres de Tablas                                    */
            /*==============================================================*/

         SELECT  TABLE_NAME  TABLA, COMMENTS COMENTARIO
         FROM USER_TAB_COMMENTS
         WHERE TABLE_NAME NOT LIKE 'BIN$%'
         ORDER BY TABLA;

            /*==============================================================*/
            /* Obtener Campos de Tablas                                     */
            /*==============================================================*/
            
         SELECT 
         X.TABLE_NAME NOMBRE_TABLA, X.COLUMN_ID POSICION, 
         LLAVE,
         X.COLUMN_NAME NOMBRE_COLUMNA, 
         DATA_TYPE TIPO_DATO, DATA_LENGTH LONGITUD, COMMENTS COMENTARIO
         FROM
         (
            SELECT A.TABLE_NAME, A.COLUMN_ID, A.COLUMN_NAME,
            A.DATA_TYPE, A.DATA_LENGTH, 
            B.COMMENTS
         
            FROM USER_TAB_COLUMNS A
            LEFT JOIN USER_COL_COMMENTS B
            ON A.TABLE_NAME = B.TABLE_NAME
            AND A.COLUMN_NAME=B.COLUMN_NAME
         ) X 
         LEFT JOIN
         (
            SELECT UC.TABLE_NAME, COLUMN_NAME, 
            CASE CONSTRAINT_TYPE 
               WHEN 'P' THEN 'PK' 
               WHEN 'R' THEN 'FK'
            END LLAVE
            FROM USER_CONSTRAINTS UC
            LEFT JOIN USER_CONS_COLUMNS UCC
            ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
            WHERE UC.CONSTRAINT_TYPE='P'
            OR UC.CONSTRAINT_TYPE='R'
         ) Y
         ON X.TABLE_NAME=Y.TABLE_NAME 
         AND X.COLUMN_NAME = Y.COLUMN_NAME
         ORDER BY X.TABLE_NAME, X.COLUMN_ID;

            /*==============================================================*/
            /* Obtener indices                                                                                                        */
            /*==============================================================*/


         SELECT TABLE_NAME TABLA, INDEX_NAME NOMBRE_INDICE, COLUMN_NAME COLUMNA, COLUMN_POSITION POSICION 
         FROM USER_IND_COLUMNS
         ORDER BY TABLE_NAME, INDEX_NAME, COLUMN_POSITION;


            /*==============================================================*/
            /* Obtener lista de relaciones                                                                                      */
            /*==============================================================*/

         SELECT UC.CONSTRAINT_NAME NOMBRE_RELACION, CONSTRAINT_TYPE TIPO_RELACION, 
         UC.TABLE_NAME TABLA,  UCC.COLUMN_NAME COLUMNA,
         SUBSTR(R_CONSTRAINT_NAME, 0, LENGTH(R_CONSTRAINT_NAME) - 3) TABLA_REFERENCIADA, 
         UCC.POSITION 
         FROM USER_CONSTRAINTS UC
         LEFT JOIN USER_CONS_COLUMNS UCC
         ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
         WHERE UC.CONSTRAINT_NAME LIKE '%_R%'
         AND UC.CONSTRAINT_NAME NOT LIKE '%_PK'
         ORDER BY UC.CONSTRAINT_NAME, UC.TABLE_NAME, POSITION;
      
   /*==============================================================*/
   /* Fin Diccionario                                  */
   /*==============================================================*/

   /*==============================================================*/
   /* Create Function                                   */
   /*==============================================================*/

CREATE OR REPLACE FUNCTION FindNameQuestion(ID_QUESTIONS IN PREGUNTA.ID_PREGUNTA%TYPE)
  RETURN VARCHAR2 IS
  VNOMBRE PREGUNTA.DESCRIPCION%TYPE;
BEGIN
  BEGIN
    SELECT DESCRIPCION
      INTO VNOMBRE
      FROM PREGUNTA
     WHERE ID_PREGUNTA = ID_QUESTIONS;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20001,
                              'OCURRIO UN ERROR AL OBTENER LA DESCRIPCIÃ“N DE LA PREGUNTA - ' ||
                              SQLCODE || ' -ERROR- ' || SQLERRM);
  END;
  RETURN VNOMBRE;
END FindNameQuestion;

   /*==============================================================*/
   /* probar                                  */
   /*==============================================================*/

   SELECT 
       FindNameQuestion(ID_PREGUNTA) AS NOMBRECURSO
  FROM PREGUNTA
  WHERE ID_PREGUNTA = 1;
