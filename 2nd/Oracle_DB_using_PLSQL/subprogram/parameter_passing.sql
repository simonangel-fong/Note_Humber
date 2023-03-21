-- Procedure: Parameter Passing

DROP TABLE lab_emp;

CREATE TABLE lab_emp(
  emp_id number
, first_name VARCHAR2(20)
, last_name VARCHAR2(20)
);

DROP SEQUENCE lab_emp_seq;

CREATE SEQUENCE lab_emp_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE lab_insert_emp(
  p_first_name lab_emp.first_name%type :='John'
, p_last_name lab_emp.last_name%type DEFAULT 'Doe'
) IS
BEGIN
  INSERT INTO lab_emp VALUES(
    lab_emp_seq.NEXTVAL
  , p_first_name
  , p_last_name
  );
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(sqlerrm);
END;
/

DECLARE
BEGIN
 -- default
  lab_insert_emp;
 -- default
  lab_insert_emp(
    p_last_name=>'Wick'
  );
 -- positional notation
  lab_insert_emp('Steve', 'Jobs');
 -- named notation
  lab_insert_emp(
    p_last_name=>'Gate'
  , p_first_name=>'Bill'
  );
 -- combination notation
  lab_insert_emp('Elon', p_last_name=>'Musk');
 -- the combination notation, positional notation parameters must be listed before named notation parameters.
 -- lab_insert_emp('Elon', p_first_name=>'Musk'); -- PLS-00703: multiple instances of named argument in list
 -- lab_insert_emp('Elon'); -- PLS-00306: wrong number or types of arguments in call to 'LAB_INSERT_EMP'
 -- lab_insert_emp('Elon', p_last_name='Musk'); --PLS-00201: identifier 'P_LAST_NAME' must be declared
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(sqlerrm);
END;
/

SELECT *
FROM lab_emp;

TRUNCATE TABLE lab_emp;