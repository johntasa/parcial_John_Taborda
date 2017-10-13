CREATE TABLESPACE COURSES DATAFILE 
'C:\courses1.DBF' SIZE 50M,
'C:\courses2.DBF' SIZE 50M;

CREATE PROFILE admin LIMIT
PASSWORD_LIFE_TIME              UNLIMITED
SESSIONS_PER_USER               2
IDLE_TIME                       15
FAILED_LOGIN_ATTEMPTS           3;

CREATE USER johntasa
IDENTIFIED BY johntasa
DEFAULT TABLESPACE COURSES
QUOTA unlimited on COURSES;

GRANT DBA TO johntasa;
GRANT CREATE SESSION TO johntasa;

--------------------------------------------------------
-- Archivo creado  - viernes-octubre-13-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ANSWER_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "ANSWER_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 2 START WITH 100 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ANSWERS
--------------------------------------------------------

  CREATE TABLE "ANSWERS" 
   (	"ID" NUMBER(*,0), 
	"NUMBER_OF_QUESTION" VARCHAR2(255 BYTE), 
	"ANSWER" VARCHAR2(255 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ATTENDANCE
--------------------------------------------------------

  CREATE TABLE "ATTENDANCE" 
   (	"ID" NUMBER(*,0), 
	"STUDENT_ID" NUMBER(*,0), 
	"COURSE_ID" NUMBER(*,0), 
	"ATTENDANCE_DATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table COURSES
--------------------------------------------------------

  CREATE TABLE "COURSES" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"CODE" VARCHAR2(255 BYTE), 
	"DATE_START" DATE, 
	"DATE_END" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table STUDENTS
--------------------------------------------------------

  CREATE TABLE "STUDENTS" 
   (	"ID" NUMBER(*,0), 
	"FIRST_NAME" VARCHAR2(255 BYTE), 
	"LAST_NAME" VARCHAR2(255 BYTE), 
	"DATE_OF_BIRTH" DATE, 
	"CITY" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(50 BYTE)
   ) ;
REM INSERTING into ANSWERS
SET DEFINE OFF;
REM INSERTING into ATTENDANCE
SET DEFINE OFF;
REM INSERTING into COURSES
SET DEFINE OFF;
REM INSERTING into STUDENTS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ANSWERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ANSWERS_PK" ON "ANSWERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ATTENDANCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATTENDANCE_PK" ON "ATTENDANCE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index COURSES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COURSES_PK" ON "COURSES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index STUDENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STUDENTS_PK" ON "STUDENTS" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table ANSWERS
--------------------------------------------------------

  ALTER TABLE "ANSWERS" ADD CONSTRAINT "ANSWERS_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ANSWERS" ADD CONSTRAINT "NUMBEROFQUESTIONS_CK" CHECK (number_of_question in ('QUESTION 1', 'QUESTION 2', 'QUESTION 3', 'QUESTION 4', 'QUESTION 5')) ENABLE;
  ALTER TABLE "ANSWERS" MODIFY ("ANSWER" NOT NULL ENABLE);
  ALTER TABLE "ANSWERS" MODIFY ("NUMBER_OF_QUESTION" NOT NULL ENABLE);
  ALTER TABLE "ANSWERS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATTENDANCE
--------------------------------------------------------

  ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "ATTENDANCE_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ATTENDANCE" MODIFY ("ATTENDANCE_DATE" NOT NULL ENABLE);
  ALTER TABLE "ATTENDANCE" MODIFY ("COURSE_ID" NOT NULL ENABLE);
  ALTER TABLE "ATTENDANCE" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
  ALTER TABLE "ATTENDANCE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "COURSES" ADD CONSTRAINT "COURSES_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "COURSES" ADD CONSTRAINT "COURSES_CK" CHECK (name in ('Business and Computing',  'Computer Science', 'Chemistry', 'History', 'Zoology')) ENABLE;
  ALTER TABLE "COURSES" MODIFY ("DATE_END" NOT NULL ENABLE);
  ALTER TABLE "COURSES" MODIFY ("DATE_START" NOT NULL ENABLE);
  ALTER TABLE "COURSES" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "COURSES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "COURSES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "STUDENTS" ADD CONSTRAINT "STUDENTS_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "STUDENTS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "STUDENTS" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "STUDENTS" MODIFY ("DATE_OF_BIRTH" NOT NULL ENABLE);
  ALTER TABLE "STUDENTS" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "STUDENTS" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "STUDENTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ATTENDANCE
--------------------------------------------------------

  ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "COURSES_ID_FK" FOREIGN KEY ("COURSE_ID")
	  REFERENCES "COURSES" ("ID") ENABLE;
  ALTER TABLE "ATTENDANCE" ADD CONSTRAINT "STUDENTS_ID_FK" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "STUDENTS" ("ID") ENABLE;
