DECLARE
    TYPE rec_emp_dep IS
        RECORD(fname employees.first_name%type, lname employees.last_name%type, dep_name departments.department_name%type );
    v_emp_dep rec_emp_dep;
BEGIN
    SELECT e.first_name
      , e.last_name
      , d.department_name INTO v_emp_dep
    FROM employees   e
        JOIN departments d
        ON e.department_id = d.department_id
    WHERE e.last_name = 'Ricci';
    dbms_output.put_line(v_emp_dep.fname||' '||v_emp_dep.lname||' - '||v_emp_dep.dep_name);
END;
/

SELECT e.first_name
  , e.last_name
  , d.department_name
FROM employees   e
    JOIN departments d
    ON e.department_id = d.department_id
WHERE e.last_name = 'Ricci';