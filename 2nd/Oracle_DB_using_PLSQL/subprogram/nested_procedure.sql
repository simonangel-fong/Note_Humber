-- Nested Procedure

SELECT *
FROM tab
WHERE tname LIKE 'EMP%';

SELECT *
FROM tab
WHERE tname LIKE 'lab%';

DROP TABLE lab_emp;

CREATE TABLE lab_emp(
    emp_id number
  , last_name VARCHAR2(20)
  , first_name VARCHAR2(20)
);

DROP TABLE log_lab_emp;

CREATE TABLE log_lab_emp(
    log_id number
  , operation_type VARCHAR2(20)
  , operation_date date
);

/

CREATE OR REPLACE PROCEDURE insert_lab_emp(
    p_emp_id lab_emp.emp_id%type
  , p_last_name lab_emp.last_name%type
  , p_first_name lab_emp.first_name%type
) IS
BEGIN
 -- PROCEDURE LOG_LAB_EMP(P_LOG_EMP_ID LOG_LAB_EMP.LOG_ID%TYPE) IS
 -- BEGIN
 --     INSERT INTO LOG_LAB_EMP VALUES(
 --         P_LOG_EMP_ID
 --       , 'Insert'
 --       , SYSDATE()
 --     );
 -- END LOG_LAB_EMP;
    INSERT INTO lab_emp VALUES(
        p_emp_id
      , p_last_name
      , p_first_name
    );
    IF sql%rowcount >0 THEN
        log_lab_emp(p_emp_id);
    END IF;
END insert_lab_emp;