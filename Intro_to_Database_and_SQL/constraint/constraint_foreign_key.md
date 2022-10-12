[Back](../index.md)

# FOREIGN KEY 外键

[TOC]

---

## Foreign Key

- The keywords `FOREIGN KEY` are used to identify a column that, if it contains a value, **must match data** contained in <u>another table</u>.<br>即限定该列输入的值须在他表的值的范围内。但输入的数据不在他表的范围时，报错。

- The name of the column identified as the foreign key is contained in parentheses after the `FOREIGN KEY` keywords<br>外键的列名在FOREIGN KEY关键字的括号中。

- The `REFERENCES` keyword refers to referential integrity. It is used to **identify the table and column** that must already contain the data to be entered.<br>REFERENCES指明的是数据范围所在的外表和列

- A `FOREIGN KEY` constraint must reference a column that has already been designated as the `primary key`.外表的列必须是主键 

---

### Parent table & Child Table

- Parent table 引用他表的表

- Child table = Referenced table 外表

- one-to-many relationship 一对多关系
    - Child table is on the one side of the one-to-many relationship 引用他表的表（子表）是一
    - Parent table is on the many side of the relationship 被引用的表（父表）是多
    <br>即一个子表可以引用多个父表

- 

### ON DELETE CASCADE

- When a `FOREIGN KEY` constraint exists between two tables, by default, a record cannot be deleted from the parent table if a matching entry exists in the **child table**<br>
    In other words you cannot delete a record from the **parent table** if there are records in the **child table** for that data.<br>当父表中的值被子表引用时，不能删除父表的记录。

- If the parent table need to be deleted, all related records must be removed first from the child talbe. 先删子表相关数据，在删父表。

- If the `ON DELETE CASCADE` keywords are added to the **constraint definition** and a record is deleted from the parent table, then any corresponding records in the child table are automatically deleted as well.<br>当父表数据被删除时，会自动删除子表相关数据以接触关联。

- The `ON DELETE CASCADE` option is **very dangerous** since a user may not be aware that this option has been set. If a customer was deleted, then all the customer’s orders would be deleted as well

### Null value

- If a `NULL` value is entered into a column that has a `FOREIGN KEY` constraint, the record will be **accepted**, this would mean that if an order were placed and no customer number was given, the order would be created

- If you wanted customer number to be mandatory, a `NOT NULL` constraint would have to be added to the customer# column as well

- 即外键接受null，也可以同时甚至not null

---

## Create

### Column Level

- 注意在列层面，无需使用foreign key关键字

```sql

columnname datatype(width) CONSTRAINT tablename_columnname_fk REFERENCES f_tablename (f_columnname)

```

### Table Level

```sql

CONSTRAINT tablename_columnname_fk FOREIGN KEY (columanname) REFERENCES f_tablename (f_columnname)

```

---

## ALter

### ADD

```sql

ALTER TABLE tablename
ADD CONSTRAINT constraintname FOREIGN KEY (columnname)
REFERENCES f_tablename (f_columnname);

ALTER TABLE tablename
ADD CONSTRAINT constraintname FOREIGN KEY (columnname)
REFERENCES f_tablename (f_columnname) ON DELETE CASCADE;

```

---

### DROP

- If you attempt to drop a table that has a foreign key attached to it, the constraint will forbid you from removing the table 删除父表约束时,不是记录。

- The `CASCADE` option can be used to remove the table and any constraints attached to it<br>CASCADE 可以移除子表对父表约束的关联

``` sql
-- remove constraint in a child table
ALTER TABLE tablename_child
DROP CONSTRAINT tablename_columnname_fk;

-- remove constraint in a parent table
ALTER TABLE tablename_parent
DROP PRIMARY KEY CASCADE;   --该处一定使用主键，因为外键关联的是父表的主键

-- drop parent table with constraint
DROP TABLE tablename_parent CASCADE CONSTRAINT;

```

---

[TOP](#foreign-key-外键)
