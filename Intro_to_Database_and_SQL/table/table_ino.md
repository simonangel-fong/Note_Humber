[Back](../index.md)

[TOC]

# Table info获取表信息

## Show all tables' names

1. selet语句


### using `user_table` view

```sql
-- return the tables owned by the user
SELECT table_name
FROM user_tables;

```

- `user_tables`: a data dictionary view一个字典视图
- `table_name`

***

### using `TAB`

```sql
-- return the tables owned by the user
SELECT *
FROM TAB;

```

- `TAB`: a pseudo table伪表, you will not see it but you can use it
- Its purpose is to display the table objects and other objects called VIEWS主要用于显示表对象和视图


***

## Show table structure

本节内容是获取表结构信息的方法
1. 使用Client;
2. desc语句

### Using Client Software

Connection Panel -> click a table -> a output tab will be created on the right.

More detail information: click tab above the output


![tab_above](/pic/table_ino/tab_above.png)

***

### Using `DESC`

```SQL
-- show table structure, reuturn in Script Output
-- 可以不以分号结束，因为是以脚本运行
DESC books
DESCRIBE books

```

- show the structure of that table
- The structure is the names of the columns and their data types with sizes显示列名,数据类型, 大小
- The NULL column shows any columns that have been defined as NOT NULL

![desc_table](/pic/table_ino/desc_table.png)

[Top](#table-info获取表信息)
