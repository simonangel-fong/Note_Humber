# Cursor

[Back](../index.md)

- [Cursor](#cursor)
  - [Context Areas and Cursors](#context-areas-and-cursors)
  - [Types of Cursors](#types-of-cursors)
  - [Cursor Attributes](#cursor-attributes)

---

## Context Areas and Cursors

- `Context area`: a **private memory area** allocated by the Oracle server to store the data processed by a SQL statement.
  - a `cursor` either as a **label** for the context area, or as a **pointer** to the context area.

## Types of Cursors

- `Implicit cursors`: Defined automatically by **Oracle** for all SQL `DML` statements (INSERT, UPDATE, DELETE, and MERGE), and for `SELECT` statements that <u>return only one row</u>.

  - Because the memory area is **automatically managed by the Oracle server**, you have no direct control over it.
  - Limitations of Implicit Cursors: **returns only one row**.

- `Explicit cursors`: Declared by the **programmer** for queries that <u>return more than one row</u>.
  - can use explicit cursors to **name** a context area and access its stored data.
  - gives the programmer more control over the processing of the rows
  - the only way in PL/SQL to **retrieve more than one row** from a table.

---

## Cursor Attributes

- Attributes for both implicit and explicit cursors

| Attribute      | Description                                                                                                     |
| -------------- | --------------------------------------------------------------------------------------------------------------- |
| `SQL%FOUND`    | Boolean attribute that evaluates to `TRUE` if the most recent SQL statement <u>returned at least one row</u>.   |
| `SQL%NOTFOUND` | Boolean attribute that evaluates to `TRUE` if the most recent SQL statement did <u>not return even one row.</u> |
| `SQL%ROWCOUNT` | An integer value that represents the number of rows affected by the **most recent** SQL statement.              |

---

[TOP](#cursor)
