-- log table


CREATE TABLE log_table(
  user_id VARCHAR2(30)
, logon_data date
);

-- need privilege
CREATE OR REPLACE TRIGGER logon_trigger AFTER LOGON ON DATABASE
BEGIN
  INSERT INTO log_table (
    user_id
  , logon_data
  ) VALUES (
    user
  , sysdate
  );
END;