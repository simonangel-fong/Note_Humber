# Oracle Data Dictionary

[Back](../index.md)

- [Oracle Data Dictionary](#oracle-data-dictionary)
  - [Data Dictionary](#data-dictionary)
  - [Using the Super-View DICTIONARY](#using-the-super-view-dictionary)

---

## Data Dictionary

Every Oracle database contains a Data Dictionary.

- `Data Dictionary`:

  - act like an automatically-managed master **catalog of all database objects** in the database.
  - registers database objects(tables, views, users and privileges, procedures, functions, etc) when created.
  - Dictionary is automatically updated when database object change

- Class of talbes:

  - For user:
    - `USER_*` tables contain information about objects' owner who creates them.
    - `ALL_*` tables contain information about objects that a user has privileges to use.
  - Database Administrator
    - `DBA_*` tables, which are only available to the Database Administrator, contain information about everything in the database.

- Users can `DESCRIBE` and `SELECT` from Dictionary tables.

- Users are **not allowed to modify** the dictionary themself,

- `USER_OBJECTS`: which shows all the objects of every type

```sql
-- Data Dictionary

-- Shows all the objects of every type:
SELECT object_name
  , object_type
  , created
  , TIMESTAMP
FROM user_objects;

-- Summarize the objects
SELECT object_type
  , COUNT(*)
FROM user_objects
GROUP BY object_type;

-- Query the table owned by the current user
SELECT table_name
FROM user_tables;

SELECT table_name
  , owner
FROM all_tables
WHERE owner = upper('n01555914');

-- Query the procedures owned by the current user
SELECT object_name
FROM user_procedures;

SELECT object_name
  , owner
FROM all_procedures
WHERE owner = upper('n01555914');

```

---

## Using the Super-View DICTIONARY

- `DICTIONARY` (or DICT for short): A super-view lists all the Dictionary tables.
  - to show the **names** and **descriptions (comments)** of a relevant subset of Dictionary tables.

```sql
-- dict

-- search the total number of table containing info about user's objects.
SELECT COUNT(*) AS num_user_tables
FROM dict
WHERE table_name LIKE 'USER%';

-- query tables based on a name with a specific pattern
SELECT *
FROM dict
WHERE table_name LIKE 'USER%IND%'

```

---

[TOP](#data-dictionary)
