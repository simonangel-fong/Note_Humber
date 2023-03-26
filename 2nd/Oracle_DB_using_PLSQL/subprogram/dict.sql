-- get source code of a procedure
SELECT text
FROM user_source
WHERE type = upper('procedure')
    AND name = upper('ADD_DEPT')
ORDER BY line;