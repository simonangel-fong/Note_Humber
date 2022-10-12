[Back](../index.md)

# NOT NULL 非空

[TOC]

---

## NOT NULL

- It **prevents** you from adding a row that contains a `NULL` value in the specified column

- The `NOT NULL` constraint is actually a special `CHECK` constraint with the condition `IS NOT NULL`. 特殊的 check

- A field defined with a **primary key** automatically has a `NOT NULL` constraint applied to it

- The `NOT NULL` constraint, when created at the table creation time, can **only** be added as a **column level** constraint. 列层面不适用。

- `NOT NULL` 可以与`FOREIGN KEY`并用.

- `DESC tablename` 可以显示

## Create

```sql

CREATE TABLE tablename
(
    columnname datatype(width) CONSTRAINT tablename_columnname_nn NOT NULL,
)

```

## Alter

### ADD

- After the table has been created, you add a `NOT NULL` constraint using `ALTER TABLE` with the `MODIFY` command (rather than the ADD command)添加 nn 使用 MODIFY,而非 ADD

```sql

ALTER TABLE tablename
MODIFY (columnname CONSTRAINT talbename_columnname_nn NOT NULL);

```

### DROP

```sql

ALTER TABLE tablename
DROP CONSTRAINT constraintname;

```

[TOP](#not-null-非空)
