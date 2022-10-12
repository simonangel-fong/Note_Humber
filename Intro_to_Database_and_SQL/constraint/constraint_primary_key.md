[Back](../index.md)

# PRIMARY KEY 主键

[TOC]

---

## Primary Key 

- A table can be created, as we have seen, without specifying a primary key<br>默认创建表时不会创建主键.

- The `PRIMARY KEY` constraint will make certain that the column(s) identified as the table’s primary key is **unique** and does not contain any **null values**<br>唯一非空

- For each table, **ONLY ONE** PRIMARY KEY constraint can be created. 一个表只有一个主键

## Composite Primary Key

- If the primary key is a **composite primary key**, it may only be created at the **table level**
    - The columns used in the PRIMARY KEY must always be a **unique combination** in the table and neither value can be **NULL**. 组合主键要求: 唯一非空

## Create

### Column Level

- Syntax:

```sql

CREATE TABLE tablename
(
    columnname datatype(width) CONSTRAINT tablename_columnname_pk PRIMARY KEY,
);

```

### Table Level

- Syntax:

```sql

CREATE TABLE tablename
(
    -- column definition

    CONSTRAINT tablename_columnname_pk PRIMARY KEY (columnname),
    CONSTRAINT tablename_pk PRIMARY KEY (columnname, columnname)  --composite pk

);

```

---

## Alter

### ADD

- Syntax:

```sql

ALTER TABLE tablename
ADD CONSTRAINT tablename_columnname_pk PRIMARY KEY (columname);

ALTER TABLE tablename
ADD CONSTRAINT tablename_pk PRIMARY KEY (columname, columnname);

```

---

### DROP

- the key words PRIMARY KEY are sufficient since a table can only contain one primary key.

```sql

ALTER TABLE tablename
DROP PRIMARY KEY;


```

---

[TOP](#primary-key-主键)
