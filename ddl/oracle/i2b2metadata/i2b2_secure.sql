--
-- Type: TABLE; Owner: I2B2METADATA; Name: I2B2_SECURE
--
 CREATE TABLE "I2B2METADATA"."I2B2_SECURE" 
  (	"C_HLEVEL" NUMBER(22,0), 
"C_FULLNAME" VARCHAR2(900 BYTE) NOT NULL ENABLE, 
"C_NAME" VARCHAR2(2000 BYTE), 
"C_SYNONYM_CD" CHAR(1 BYTE), 
"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
"C_TOTALNUM" NUMBER(22,0), 
"C_BASECODE" VARCHAR2(450 BYTE), 
"C_METADATAXML" CLOB, 
"C_FACTTABLECOLUMN" VARCHAR2(50 BYTE), 
"C_TABLENAME" VARCHAR2(50 BYTE), 
"C_COLUMNNAME" VARCHAR2(50 BYTE), 
"C_COLUMNDATATYPE" VARCHAR2(50 BYTE), 
"C_OPERATOR" VARCHAR2(10 BYTE), 
"C_DIMCODE" VARCHAR2(900 BYTE), 
"C_COMMENT" CLOB, 
"C_TOOLTIP" VARCHAR2(900 BYTE), 
"UPDATE_DATE" DATE, 
"DOWNLOAD_DATE" DATE, 
"IMPORT_DATE" DATE, 
"SOURCESYSTEM_CD" VARCHAR2(50 BYTE), 
"VALUETYPE_CD" VARCHAR2(50 BYTE), 
"SECURE_OBJ_TOKEN" VARCHAR2(50 BYTE), 
"M_APPLIED_PATH" VARCHAR2(700 BYTE), 
"M_EXCLUSION_CD" VARCHAR2(25 BYTE),
"C_SYMBOL" VARCHAR2(50 BYTE), 	--new in oracle
"C_PATH" VARCHAR2(900 BYTE), --new in oracle
"I2B2_ID" NUMBER(18,0)		--new in oracle
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "I2B2_DATA" 
LOB ("C_METADATAXML") STORE AS BASICFILE (
 TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
 NOCACHE NOLOGGING ) 
LOB ("C_COMMENT") STORE AS BASICFILE (
 TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
 NOCACHE NOLOGGING ) ;
