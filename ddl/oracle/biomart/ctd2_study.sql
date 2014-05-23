--
-- Type: TABLE; Owner: BIOMART; Name: CTD2_STUDY
--
 CREATE TABLE "BIOMART"."CTD2_STUDY" 
  (	"CTD_STUDY_ID" NUMBER, 
"REF_ARTICLE_PROTOCOL_ID" VARCHAR2(1000 BYTE), 
"REFERENCE_ID" NUMBER(9,0) NOT NULL ENABLE, 
"PUBMED_ID" VARCHAR2(250 BYTE), 
"PUBMED_TITLE" VARCHAR2(2000 BYTE), 
"PROTOCOL_ID" VARCHAR2(1000 BYTE), 
"PROTOCOL_TITLE" VARCHAR2(2000 BYTE)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "BIOMART" ;
--
-- Type: TRIGGER; Owner: BIOMART; Name: TRG_CTD2_STUDY_ID
--
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_CTD2_STUDY_ID" 
BEFORE INSERT ON CTD2_STUDY 
 FOR EACH ROW BEGIN     
 IF INSERTING THEN      
	IF :NEW."CTD_STUDY_ID" IS NULL THEN 
		SELECT SEQ_CLINICAL_TRIAL_DESIGN_ID.NEXTVAL INTO :NEW."CTD_STUDY_ID" FROM DUAL;  
	END IF;    
 END IF; 
END;







/
ALTER TRIGGER "BIOMART"."TRG_CTD2_STUDY_ID" ENABLE;
