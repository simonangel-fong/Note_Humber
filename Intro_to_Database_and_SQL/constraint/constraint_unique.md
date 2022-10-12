[Back](../index.md)

# UNIQUE 唯一

[TOC]

---

## Unique 

- The **purpose** of the `UNIQUE` constraint is to ensure that two records do not have the same value stored in the same column

- A `UNIQUE` constraint will allow `NULL` values, which are not permitted with a PRIAMRY KEY constraint 接受null

- Once the command is successfully executed, Oracle will not allow an entry that would **duplicate** an existing entry into the `UNIQUE` column.

## Create

### Column Level

```sql

CREATE TABLE tablename
(
    columnname datatype(width) CONSTRAINT tablename_columnname_uk UNIQUE,
)


```

### Table Level

```sql

CREATE TABLE tablename
(
    -- column definition
     CONSTRAINT tablename_columnname_uk UNIQUE (columnname),
)

```

---

## Alter

### ADD

```sql

ALTER TABLE tablename
ADD CONSTRAINT tablename_columnname_uk UNIQUE (columanname);

```

### DROP

- only the column name affected by the constraint is required because a column can have only one UNIQUE constraint

```sql

ALTER TABLE tablename
DROP UNIQUE (columanname);

```

---

[TOP](#unique-唯一)
