--
-- Type: USER; Name: BIOMART
--
CREATE USER "BIOMART" IDENTIFIED BY VALUES 'S:429C6305C046621EE0AE2565FCFD3AFA0677D1130679ADBB6235596CA8E5;81868FEA9B380846'
   DEFAULT TABLESPACE "BIOMART"
   TEMPORARY TABLESPACE "TEMP";
--
-- Type: TABLESPACE_QUOTA; Name: BIOMART
--
  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER "BIOMART" QUOTA UNLIMITED ON "BIOMART"';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''BIOMART'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/
--
-- Type: ROLE_GRANT; Name: BIOMART
--
GRANT "CONNECT" TO "BIOMART";
GRANT "RESOURCE" TO "BIOMART";
GRANT "DBA" TO "BIOMART";
--
-- Type: SYSTEM_GRANT; Name: BIOMART
--
GRANT UNLIMITED TABLESPACE TO "BIOMART";
