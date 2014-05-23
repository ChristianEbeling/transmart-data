--
-- Type: TABLE; Owner: BIOMART; Name: BIO_PATIENT_EVENT_ATTR
--
 CREATE TABLE "BIOMART"."BIO_PATIENT_EVENT_ATTR" 
  (	"BIO_PATIENT_ATTR_CODE" NVARCHAR2(200) NOT NULL ENABLE, 
"ATTRIBUTE_TEXT_VALUE" NVARCHAR2(200), 
"ATTRIBUTE_NUMERIC_VALUE" NVARCHAR2(200), 
"BIO_CLINIC_TRIAL_ATTR_ID" NUMBER(18,0) NOT NULL ENABLE, 
"BIO_PATIENT_ATTRIBUTE_ID" NUMBER(18,0) NOT NULL ENABLE, 
"BIO_PATIENT_EVENT_ID" NUMBER(18,0) NOT NULL ENABLE, 
 CONSTRAINT "BIO_PATIENT_ATTRIBUTE_PK" PRIMARY KEY ("BIO_PATIENT_ATTRIBUTE_ID")
 USING INDEX
 TABLESPACE "INDX"  ENABLE
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "BIOMART" ;
--
-- Type: REF_CONSTRAINT; Owner: BIOMART; Name: BIO_PT_EVENT_ATTR_EVT_FK
--
ALTER TABLE "BIOMART"."BIO_PATIENT_EVENT_ATTR" ADD CONSTRAINT "BIO_PT_EVENT_ATTR_EVT_FK" FOREIGN KEY ("BIO_PATIENT_EVENT_ID")
 REFERENCES "BIOMART"."BIO_PATIENT_EVENT" ("BIO_PATIENT_EVENT_ID") ENABLE;
--
-- Type: REF_CONSTRAINT; Owner: BIOMART; Name: BIO_PT_ATTR_TRL_ATTR_FK
--
ALTER TABLE "BIOMART"."BIO_PATIENT_EVENT_ATTR" ADD CONSTRAINT "BIO_PT_ATTR_TRL_ATTR_FK" FOREIGN KEY ("BIO_CLINIC_TRIAL_ATTR_ID")
 REFERENCES "BIOMART"."BIO_CLINC_TRIAL_ATTR" ("BIO_CLINC_TRIAL_ATTR_ID") ENABLE;
--
-- Type: TRIGGER; Owner: BIOMART; Name: TRG_BIO_PT_EVT_ATTR_ID
--
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_PT_EVT_ATTR_ID" 
before insert on BIO_PATIENT_EVENT_ATTR
    for each row
begin
  if inserting then
	 if :NEW.BIO_CLINIC_TRIAL_ATTR_ID is null then
	   select SEQ_BIO_DATA_ID.nextval into :NEW.BIO_CLINIC_TRIAL_ATTR_ID from dual;
	 end if;
  end if;
end;

/
ALTER TRIGGER "BIOMART"."TRG_BIO_PT_EVT_ATTR_ID" ENABLE;
