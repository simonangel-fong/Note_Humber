-- returning

CREATE OR REPLACE PROCEDURE update_one_emp (
    p_emp_id IN employees.employee_id%type
  , p_salary_raise_percent IN NUMBER
) IS
    v_new_salary employees.salary%type;
BEGIN
    UPDATE employees
    SET
        salary = salary * (
            1 + p_salary_raise_percent
        )
    WHERE
        employee_id = p_emp_id RETURNING salary INTO v_new_salary;
    dbms_output.put_line('New salary is: ' || v_new_salary);
END update_one_emp;
/

CREATE OR REPLACE PROCEDURE update_all_emps (
    p_salary_raise_percent IN NUMBER
) IS
    TYPE t_empid IS
        TABLE OF employees.employee_id%type INDEX BY BINARY_INTEGER;
    TYPE t_sal IS
        TABLE OF employees.salary%type INDEX BY BINARY_INTEGER;
    v_empidtab t_empid;
    v_saltab   t_sal;
BEGIN
    SELECT employee_id BULK COLLECT INTO v_empidtab
    FROM employees;
    FORALL i IN v_empidtab.first..v_empidtab.last
        UPDATE employees
        SET
            salary = salary * (
                1 + p_salary_raise_percent
            )
        WHERE
            employee_id = v_empidtab(
                i
            ) RETURNING salary BULK COLLECT INTO v_saltab;
END update_all_emps;