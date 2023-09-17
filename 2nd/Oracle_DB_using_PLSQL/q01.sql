CREATE TABLE dept_count AS
    SELECT department_id dept_id
      , COUNT(*)      count_emps
    FROM employees
    GROUP BY department_id;

select * from dept_count;