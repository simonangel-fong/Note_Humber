# DDL/DCL

[Back](../index.md)

---

## DDL/DCL Limitations in PL/SQL

- PL/SQL does not directly support `DDL` statements, such as `CREATE TABLE`, `ALTER TABLE`, and `DROP TABLE`, or DCL statements such as `GRANT` and `REVOKE`.

  - because they are constructed and executed at `run time`—that is, they are **dynamic**.

- The recommended way of working with DDL and DCL within PL/SQL is to use **Dynamic SQL** with the `EXECUTE
IMMEDIATE` statement.

---

[Top](#ddldcl)
