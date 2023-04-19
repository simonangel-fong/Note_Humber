-- performance nocopy

SELECT object_name
FROM user_objects
WHERE object_name = upper('emp_pkg');

CREATE OR REPLACE PACKAGE lab_emp_pkg IS
    TYPE t_emp IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    PROCEDURE emp_proc (
        p_small_arg IN NUMBER
      , p_big_arg OUT NOCOPY t_emp
    );
END lab_emp_pkg;
/

-- CREATE OR REPLACE PACKAGE BODY LAB_EMP_PKG IS
-- BEGIN
--     PROCEDURE EMP_PROC( P_SMALL_ARG IN NUMBER, P_BIG_ARG OUT NOCOPY T_EMP ) IS CURSOR CUR IS
--     SELECT *
--     FROM
--     FROM EMPLOYEES
--     WHERE SALARY < P_SMALL_ARG;
--     BEGIN
--         SELECT *
--         FROM INTO P_BIG_ARG
--         FROM EMPLOYEES
--         WHERE SALARY < P_SMALL_ARG;
--     END EMP_PROC;
-- END;