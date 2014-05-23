--
-- Type: TABLE; Owner: TM_CZ; Name: SEARCH_SECURE_OBJECT_RELEASE
--
 CREATE TABLE "TM_CZ"."SEARCH_SECURE_OBJECT_RELEASE" 
  (	"SEARCH_SECURE_OBJECT_ID" NUMBER(18,0), 
"BIO_DATA_ID" NUMBER(18,0), 
"DISPLAY_NAME" NVARCHAR2(100), 
"DATA_TYPE" NVARCHAR2(200), 
"BIO_DATA_UNIQUE_ID" NVARCHAR2(200), 
"RELEASE_STUDY" NVARCHAR2(100)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "TRANSMART" ;
