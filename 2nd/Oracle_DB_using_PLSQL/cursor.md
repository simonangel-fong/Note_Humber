# Cursor

[Back](./index.md)

[TOC]

---

## Two types of cursors

- `Implicit cursors`: **Defined automatically by Oracle** for all SQL data manipulation statements, and for queries that **return only one row**.

  - Every time an SQL statement is about to be executed, the Oracle server allocates a private memory area to store the SQL statement and the data that it uses.
  - Because this memory area is **automatically managed by the Oracle server**, you have no direct control over it.

- `Explicit cursors`: **Defined by the PL/SQL programmer** for queries that **return more than one row**.

---

## Cursor Attributes for Implicit Cursors

- Attributes for implicit cursors are prefaced with “SQL.”

| Attribute      | Description                                                                                              |
| -------------- | -------------------------------------------------------------------------------------------------------- |
| `SQL%FOUND`    | Boolean attribute that evaluates to `TRUE` if the most recent SQL statement returned at least one row.   |
| `SQL%NOTFOUND` | Boolean attribute that evaluates to `TRUE` if the most recent SQL statement did not return even one row. |
| `SQL%ROWCOUNT` | An integer value that represents the number of rows affected by the most recent SQL statement.           |

---

[TOP](#cursor)
