-- direct dependency

-- using user_dependencies
SELECT name
, type
, referenced_name
, referenced_type
FROM user_dependencies
WHERE referenced_name IN (upper('emp_reference')
, upper('emp_direct')
, upper('emp_indirect'));

-- using all_dependencies
SELECT name
, type
, referenced_name
, referenced_type
FROM all_dependencies
WHERE owner = upper('n01555914')
  AND referenced_name IN (upper('emp_reference')
, upper('emp_direct')
, upper('emp_indirect'));

SELECT *
FROM user_tab_privs;