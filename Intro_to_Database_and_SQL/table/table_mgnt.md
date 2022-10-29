[Back](../index.md)

# Table Management

- [Table Management](#table-management)
    - [Query Table List](#query-table-list)
        - [Using user_tables](#using-usertables)
        - [Using tab](#using-tab)
        - [Using Client Software](#using-client-software)
    - [Query Table Structure](#query-table-structure)
    - [Recyclebin 回收站](#recyclebin-回收站)
        - [Query Recyclebin Info](#query-recyclebin-info)
        - [Clear Recyclebin Info](#clear-recyclebin-info)

---

## Query Table List

### Using user_tables

Get table name from table`user_tables`
- `user_tables`: a data dictionary view一个字典视图
    &emsp;

- Syntax:

```sql

-- using user_table
SELECT table_name
FROM user_tables;

```

---

### Using tab

Get data from pseudo table `tab`
- `TAB`: a pseudo table伪表, you will not see it but you can use it
- Its purpose is to display the table objects and other objects called VIEWS<br>主要用于显示表对象和视图
    &emsp;

- Syntax:

```sql

-- using tab
SELECT *
FROM tab;

```

---

### Using Client Software

Connection Panel -> click a table -> a output tab will be created on the right.

More detail information: click tab above the output

![tab_above](../pic/table/tab_above.png)

---

## Query Table Structure

To get column name, null, and datatype in a given table.

- Syntax:

```SQL
-- show table structure, reuturn in Script Output
-- 可以不以分号结束，因为是以脚本运行
DESC tablename;
DESCRIBE tablename;

```

- show the structure of that table
- The structure is the names of the columns and their data types with sizes显示列名,数据类型, 大小
- The NULL column shows any columns that have been defined as NOT NULL

![desc_table](../pic/table/desc_table.png)

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

### Query Recyclebin Info

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
