-- Demo Direct and Indirect Dependency

-- ---------------------------------Drop
DROP TABLE emp_reference;

DROP VIEW emp_direct;

DROP VIEW emp_indirect;

-- ---------------------------------create table and views
-- referenced object
CREATE TABLE emp_reference AS (
  SELECT * FROM employees
);

-- directly dependent object
CREATE OR REPLACE VIEW emp_direct AS
  SELECT *
  FROM emp_reference;

-- indirectly dependent object
CREATE OR REPLACE VIEW emp_indirect AS
  SELECT *
  FROM emp_direct;

-- ---------------------------------status before alter
SELECT object_name
, object_type
, status
FROM user_objects
WHERE object_name IN (upper('emp_reference')
, upper('emp_direct')
, upper('emp_indirect'));

-- ---------------------------------alter referenced table
-- drop
DROP TABLE emp_reference;

-- alter table
ALTER TABLE emp_reference MODIFY last_name VARCHAR2(30);

-- ---------------------------------status after alter modification
SELECT object_name
, object_type
, status
FROM user_objects
WHERE object_name IN (upper('emp_reference')
, upper('emp_direct')
, upper('emp_indirect'));

-- ---------------------------------01 status after alter calling direct dependent object
SELECT *
FROM emp_direct;

-- emp_reference: valid
-- emp_direct: valid
-- emp_indirect: invalid

SELECT object_name
, object_type
, status
FROM user_objects
WHERE object_name IN (upper('emp_reference')
, upper('emp_direct')
, upper('emp_indirect'));

-- ---------------------------------02 status after alter calling directly dependent object

SELECT *
FROM emp_indirect;

-- emp_reference: valid
-- emp_direct: valid
-- emp_indirect: valid

SELECT object_name
, object_type
, status
FROM user_objects
WHERE object_name IN (upper('emp_reference')
, upper('emp_direct')
, upper('emp_indirect'));