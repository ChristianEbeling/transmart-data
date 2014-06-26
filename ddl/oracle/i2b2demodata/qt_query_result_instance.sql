--
-- Type: TABLE; Owner: I2B2DEMODATA; Name: QT_QUERY_RESULT_INSTANCE
--
 CREATE TABLE "I2B2DEMODATA"."QT_QUERY_RESULT_INSTANCE" 
  (	"RESULT_INSTANCE_ID" NUMBER(5,0), 
"QUERY_INSTANCE_ID" NUMBER(5,0), 
"RESULT_TYPE_ID" NUMBER(3,0) NOT NULL ENABLE, 
"SET_SIZE" NUMBER(10,0), 
"START_DATE" DATE NOT NULL ENABLE, 
"END_DATE" DATE, 
"STATUS_TYPE_ID" NUMBER(3,0) NOT NULL ENABLE, 
"DELETE_FLAG" VARCHAR2(3 BYTE), 
"MESSAGE" CLOB, 
"DESCRIPTION" VARCHAR2(200 BYTE), 
"REAL_SET_SIZE" NUMBER(10,0), 
"OBFUSC_METHOD" VARCHAR2(500 BYTE)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "I2B2_DATA" 
LOB ("MESSAGE") STORE AS BASICFILE (
 TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
 NOCACHE LOGGING ) ;

