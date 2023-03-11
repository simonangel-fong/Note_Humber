# PL/SQL Record

[Back](../index.md)

- [PL/SQL Record](#plsql-record)
  - [Record](#record)
  - [User-Defined Records](#user-defined-records)
  - [Example:](#example)

---

## Record

- A `PL/SQL` record is a **composite data** type consisting of a group of related data items stored as fields, each with its own name and data type.

- defines a record based on the structure of a row within the named table.

```sql
-- define a record based on a table
record_name table_name%ROWTYPE;

-- declare a record based on another record
copied_record_name record_name%ROWTYPE;

-- get data from a field of a record
variable_name := record_name.field_name;

```

---

## User-Defined Records

- Syntax:

```sql
-- declare a User-Defined Records
TYPE type_name IS
    RECORD(field_declaration[,field_declaration]...);

identifier type_name;

```

---

## Example:

```sql

DECLARE
    TYPE rec_emp_dep IS
        RECORD(fname employees.first_name%type, lname employees.last_name%type, dep_name departments.department_name%type );
    v_emp_dep rec_emp_dep;
BEGIN
    SELECT e.first_name
      , e.last_name
      , d.department_name INTO v_emp_dep
    FROM employees   e
        JOIN departments d
        ON e.department_id = d.department_id
    WHERE e.last_name = 'Ricci';
    dbms_output.put_line(v_emp_dep.fname||' '||v_emp_dep.lname||' - '||v_emp_dep.dep_name);
END;

```

---

[TOP](#plsql-record)
