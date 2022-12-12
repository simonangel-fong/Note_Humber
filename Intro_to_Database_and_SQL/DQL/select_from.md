# Select From Statement

[Back](../index.md)

[TOC]

---

## `SELECT FROM`

- The SELECT statement allows a user to **retrieve data** from existing tables

- The SELECT statement does **not change** data.

- The SELECT statement can request all, single, or multiple fields and records.

- The SELECT statement also know as `query`.

- The return records will displayed in `Query Output` window.

## Syntax Style 句法

- The only required clauses are `SELECT` and `FROM`.最基础的句法只需包含 select 和 from;

- The asterisk character is used to indicate that all columns available are to be displayed.星号表示返回所有

- By default, column headings displayed in a query are capitalized;默认, 返回的列名都是大写

- **It is best to enter your SQL command over several lines, beginning each line with a keyword**输入命令，建议分行，每一行由一个关键字起头
  **make it clear and readable, and easier to debug**让代码清晰, 可读， 易于调试

- **projection**: The selecting specific **columns** in a SELECT statement.

```SQL
-- Select all records
SELECT *
FROM table_name;

-- Select single field
SELECT field_name
FROM table_name;

-- Select multiple fields
SELECT field_name, field_name, ...
FROM table_name;

```

---

[TOP](#select-from-statement)
