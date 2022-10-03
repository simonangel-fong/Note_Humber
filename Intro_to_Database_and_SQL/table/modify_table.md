[Back](../index.md)

# Modify Table

To make structural changes to an existing table.<br>To add, delete, or resize a column

- [Modify Table](#modify-table)
    - [ALTER TABLE ADD](#alter-table-add)
    - [ALTER TABLE MODIFY](#alter-table-modify)
    - [ALTER TABLE DROP COLUM](#alter-table-drop-colum)
    - [ALTER TABLE SET UNUSED](#alter-table-set-unused)
    - [ALTER TABLE DROP UNUSED COLUMNS](#alter-table-drop-unused-columns)

---

## ALTER TABLE ADD

To add new columns into a given table.

- Syntax:
```sql
-- add a single column
ALTER TABLE tablename
ADD columnname  datatype    [DEFAULT]

-- add multiple columns
ALTER TABLE tablename
ADD
(
    columnname  datatype    [DEFAULT],
    columnname  datatype    [DEFAULT],
    ...
)

```

- new column:
    - column name and datatype with width
    - default<br>对有现存数据的表，当新加入的列有默认值时，已有的数据在新加的列上自动使用默认值。

- New column is always added at the end of the existing table.

---

## ALTER TABLE MODIFY

To change the definition of an existing column.

- Syntax:
```sql
-- modify a single column
ALTER TABLE tablename
MODIFY  columnname  datatype    [DEFAUT]

-- modify multiple columns
ALTER TABLE tablename
MODIFY 
(
    columnname  datatype    [DEFAUT],
    columnname  datatype    [DEFAUT],
    ...
)

```

- Definition of a column:
    - Size<br>The new width of a column'datatype must be as wide as, or not less than, the existing data values.    如果有现存数据，则宽度不低于现存的数据。

    - Precision<br>For the column containing existing NUMBER data, precision of the column cannot be decreased.<br>对现存的NUMBER类数据的列，其精度不能降低.<br>This is regardless of whether the current values stored in the NUMBER column will be affected.即只要有现存数据而不管实际上对现存数据是否有影响。

    - Default<br>New default value will not affect the existing values of data.<br>默认值不会改变现存的数据，即只对后来新输入的数据起作用。

- Error常见错误:
    - columnname不存在: `"columanname": invalid identifier`
    - decrease size for existing values that is too big: `cannot decrease column length because some value is too big`

---

## ALTER TABLE DROP COLUM

To delete an existing column and its contents from a table.

- Syntax:
```sql

-- delete a single column
ALTER TABLE tablename
DROP COLUMN columnname;

-- delete multiple columns
ALTER TABLE tablename
DROP(columnname, columnname, ...);

```

- the deletion is permanent, thus damage may not be undone.
    - 如果错误删除，则只能创建add列，再manually re-enter all deleted data
- if there is only one column left in the table, the only column in the table cannot be deleted.

---

## ALTER TABLE SET UNUSED

To mark the column for deletion at a later time
    注意: 该命令用于删除列前的操作。因为对a very large table，删除操作需要长时间。所以是先unused，再删除
    It postpones the physical erasing of the data from the storage device until a later time, usually after business hours.


- Syntax:
```sql

ALTER TABLE tablename
SET UNUSED (columnname);

-- OR
ALTER TABLE tablename
SET UNUSED COLUMN columnname;

```

- The column set unused is unavailable and will not be displayed in the table structure or in the results of any queries.不再可用不再显示

- Nor can any other operation except `ALTER TABLE … DROP UNUSED` be performed on the column.只能执行删除。

- 如果执行了set unused但未执行delete时，可以add相同的列名，但原有的数据不会恢复.

---

## ALTER TABLE DROP UNUSED COLUMNS

To delete unused columns.

```sql

ALTER TABLE tablename
DROP UNUSED COLUMNS;

```

[TOP](#modify-table)
