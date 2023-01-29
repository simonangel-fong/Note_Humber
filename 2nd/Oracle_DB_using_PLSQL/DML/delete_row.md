# Delete Data

[Back](../index.md)

- [Delete Data](#delete-data)
  - [DELETE FROM](#delete-from)
  - [TRUNCATE TABLE](#truncate-table)

---

## DELETE FROM

- The `DELETE` statement is used to delete existing records in a table.

- Syntax:

```sql
-- Deletes records on a specific condition
DELETE FROM table_name
WHERE some_column=some_value;

-- Deletes all records
DELETE FROM table_name

```

- The statement requires at least one item:
  - The **name of the table**
  - (Optional) a `WHERE` clause that identifies the row or rows to be deleted. If you omit the `WHERE` clause, all records in the table will be deleted! 如果省略 where,则会删除所有数据.

---

## TRUNCATE TABLE

To delete all the rows stored in a table and free up the storage space that was occupied by those rows
删除数据，保留表结构

- Syntax:

```sql

TRUNCATE TABLE tablename;

```

---

[TOP](#delete-data)

[Back](../index.md)
