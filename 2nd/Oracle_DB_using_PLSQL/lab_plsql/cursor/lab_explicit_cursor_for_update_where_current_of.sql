--Demo: cursor for update where current

-- Example
DROP TABLE copy_emp;

CREATE TABLE copy_emp AS (
  SELECT employee_id
, first_name
, last_name
, salary FROM employees
);

SELECT *
FROM copy_emp;

DECLARE
  CURSOR cur_copy_emp IS
    SELECT salary
    FROM copy_emp FOR UPDATE NOWAIT;
  rec_emp cur_copy_emp%rowtype;
BEGIN
  OPEN cur_copy_emp;
  LOOP
    FETCH cur_copy_emp INTO rec_emp;
    EXIT WHEN cur_copy_emp%notfound;
    dbms_output.put_line(rec_emp.salary);
    UPDATE copy_emp
    SET
      salary =rec_emp.salary*2
    WHERE
      CURRENT OF cur_copy_emp;
  END LOOP;
  CLOSE cur_copy_emp;
END;