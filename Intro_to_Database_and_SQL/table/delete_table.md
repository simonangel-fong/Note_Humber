[Back](../index.md)

# Delete Table

- [Delete Table](#delete-table)
    - [DROP TABLE (To Recyclebin)](#drop-table-to-recyclebin)
    - [DROP TABLE PURGE (Permanently)](#drop-table-purge-permanently)

---

## DROP TABLE (To Recyclebin)

To remove a table from database.

- Syntax:
```sql

-- remove a given table to recyclebin
DROP TABLE tablename;

```

- Always exercise caution when deleting especially when it is a table.

- In addition, any index that has been created based on the table is also dropped.

- Any dropped table was permanently removed, and could only be recovered from backup.

---

## DROP TABLE PURGE (Permanently)

1. To remove a given table permanently.
直接删除某个表，不能再被恢复。

- Syntax:
```sql

-- remove a table permanently
DROP TABLE tablename PURGE;

```

[TOP](#delete-table)
