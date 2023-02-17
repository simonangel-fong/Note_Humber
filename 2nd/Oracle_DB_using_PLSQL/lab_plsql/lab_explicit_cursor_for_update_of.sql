--Demo: cursor for update of column_name

-- Example
DROP TABLE copy_emp;

CREATE TABLE copy_emp AS (
  SELECT employee_id
, first_name
, last_name
, department_id
, salary FROM employees
);

-- SELECT
--   *
-- FROM
--   copy_emp;

DROP TABLE copy_depart;

CREATE TABLE copy_depart AS (
  SELECT department_id
, department_name FROM departments
);

-- SELECT
--   *
-- FROM
--   copy_depart;

SELECT
  d.department_name
, e. first_name
, e.last_name
, e.salary
FROM
  copy_emp    e
, copy_depart d
WHERE
  e.department_id = d.department_id
ORDER BY
  1 ASC
, 4 DESC;

DECLARE
  CURSOR cur_join IS
    SELECT
      e.first_name
    , e.last_name
    , e.salary
    , d.department_name
    FROM
      copy_emp    e
      JOIN copy_depart d
      ON e.department_id = d.department_id FOR UPDATE OF salary NOWAIT; -- for update can be used with join on; of col_name: to lock the table copy_emp of the column salary.
BEGIN
  FOR v_rec_join IN cur_join LOOP
 -- dbms_output.put_line(v_rec_join.salary);
    UPDATE copy_emp
    SET
      salary=v_rec_join.salary*1.5
    WHERE
      CURRENT OF cur_join; --reference the currunt row of cursor
  END LOOP;
END;
/

SELECT
  d.department_name
, e. first_name
, e.last_name
, e.salary
FROM
  copy_emp    e
, copy_depart d
WHERE
  e.department_id = d.department_id
ORDER BY
  1 ASC
, 4 DESC;