-- Remote Dependency

SELECT object_name
  , TIMESTAMP
FROM user_objects
WHERE object_type = 'PROCEDURE'
ORDER BY TIMESTAMP;