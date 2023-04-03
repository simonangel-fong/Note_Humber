-- procedure_parameter_index_by_table

CREATE OR REPLACE PACKAGE lab_emp_index_tb_pkg IS
    TYPE emprec_type IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    PROCEDURE get_emp(
        p_emp_table OUT emprec_type
    );
END;
/

CREATE OR REPLACE PACKAGE BODY lab_emp_index_tb_pkg IS
    PROCEDURE get_emp(
        p_emp_table OUT emprec_type
    ) IS
    BEGIN
        FOR rec_emp IN (
            SELECT *
            FROM employees
        ) LOOP
            p_emp_table(rec_emp.employee_id) := rec_emp;
        END LOOP;
    END;
END;
/

DECLARE
    v_index_emp lab_emp_index_tb_pkg.emprec_type;
BEGIN
    lab_emp_index_tb_pkg.get_emp(v_index_emp);
    FOR i IN v_index_emp.first..v_index_emp.last LOOP
        IF v_index_emp.EXISTS(i) THEN
            dbms_output.put_line(v_index_emp(i).last_name);
        END IF;
    END LOOP;
END;
/

SELECT *
FROM user_errors
WHERE name = upper('lab_emp_index_tb_pkg');