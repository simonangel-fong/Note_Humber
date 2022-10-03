[Back](../index.md)

# Table Management

- [Table Management](#table-management)
    - [Get All Tables](#get-all-tables)
    - [Get Table Structure](#get-table-structure)
    - [Recyclebin 回收站](#recyclebin-回收站)
        - [Get Recyclebin Info](#get-recyclebin-info)
        - [Clear Recyclebin Info](#clear-recyclebin-info)

---

## Get All Tables

1. get table name from table `user_tables`
2. get data from pseudo table `tab`

- Syntax:
```sql

-- using user_table
SELECT table_name
FROM user_tables;


-- using tab
SELECT *
FROM tab;

```

[TOP](#table-management)

---

## Get Table Structure

To get column name, null, and datatype in a given table.

- Syntax:
```sql

DESC tablename;

```

---

## Renaming a Table

To change the name of given table.

- Syntax:
```sql

RENAME oldtablename TO newtablename;

```

---

## Recyclebin 回收站

- Oracle has included a recycle bin for holding dropped tables. The `Recyclebin` allows you to recovered deleted files.

- The `RECYCLEBIN` is a pseudo table 

### Get Recyclebin Info

- Syntax:
```sql

-- query all data in recylebin
SELECT *
FROM recyclebin;

-- query the origninal name in recylebin
SELECT object_name
    ,original_name
    ,droptime
    ,dropSCN
FROM recyclebin;

```

---

### Clear Recyclebin Info

To remove all tables in recyclebin so that they cannot be recovered.
相当于删除回收站，回收站内的所有数据将被清空，不能再被恢复。

- Syntax:
```sql

-- clear recyclebin
PURGE recycebin;

```

---

[TOP](#table-management)
