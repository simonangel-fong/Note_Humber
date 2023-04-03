-- procedure_parameter_record

CREATE OR REPLACE PACKAGE lab_type_pkg IS
    TYPE e_type IS
        RECORD ( first_name employees.first_name%type, department_name departments.department_name%type );
    PROCEDURE get_emp_dept (
        p_emp_id IN employees.employee_id%type
      , p_emp_dept_rec OUT e_type
    );
END;
/

CREATE OR REPLACE PACKAGE BODY lab_type_pkg IS
    PROCEDURE get_emp_dept (
        p_emp_id IN employees.employee_id%type
      , p_emp_dept_rec OUT e_type
    )IS
    BEGIN
        SELECT e.first_name
          , d.department_name INTO p_emp_dept_rec
        FROM employees   e
            JOIN departments d
            ON e.department_id = d.department_id
        WHERE e.employee_id = p_emp_id;
    END;
END;
/

DECLARE
    v_type_emp_dept lab_type_pkg.e_type;
BEGIN
    lab_type_pkg.get_emp_dept(100, v_type_emp_dept);
    dbms_output.put_line(v_type_emp_dept.first_name||' '||v_type_emp_dept.department_name);
END;