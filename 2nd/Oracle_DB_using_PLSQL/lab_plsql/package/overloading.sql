-- Overloading

CREATE OR REPLACE PACKAGE lab_emp_pkg IS
    PROCEDURE get_lname(
        p_id IN NUMBER
      , p_last_name OUT VARCHAR2
    );
    PROCEDURE get_lname(
        p_first_name IN VARCHAR2
      , p_last_name OUT VARCHAR2
    );
    FUNCTION add_num(
        p_x NUMBER
      , p_y NUMBER
    )RETURN NUMBER;
    FUNCTION add_num(
        p_x NUMBER
      , p_z NUMBER
    )RETURN NUMBER;
END;
/

CREATE OR REPLACE PACKAGE BODY lab_emp_pkg IS
    PROCEDURE get_lname(
        p_id IN NUMBER
      , p_last_name OUT VARCHAR2
    )IS
    BEGIN
        SELECT last_name INTO p_last_name
        FROM employees
        WHERE employee_id = p_id;
    END;
    PROCEDURE get_lname(
        p_first_name IN VARCHAR2
      , p_last_name OUT VARCHAR2
    )IS
    BEGIN
        SELECT last_name INTO p_last_name
        FROM employees
        WHERE first_name = p_first_name;
    END;
    FUNCTION add_num(
        p_x NUMBER
      , p_y NUMBER
    )RETURN NUMBER IS
    BEGIN
        RETURN p_x + p_y;
    END;
    FUNCTION add_num(
        p_x NUMBER
      , p_z NUMBER
    )RETURN NUMBER IS
    BEGIN
        RETURN p_x + p_z;
    END;
END;
/

DECLARE
    v_lname employees.last_name%type;
BEGIN
    lab_emp_pkg.get_lname(100, v_lname);
    dbms_output.put_line(v_lname);
    lab_emp_pkg.get_lname('Neena', v_lname);
    dbms_output.put_line(v_lname);
    dbms_output.put_line(lab_emp_pkg.add_num(1, p_z=>2));
END;
/

desc employees;

SELECT *
FROM employees;

SELECT *
FROM user_objects
WHERE object_name = upper('lab_emp_pkg');

SELECT *
FROM user_errors
WHERE name =upper('lab_emp_pkg');

desc lab_emp_pkg;