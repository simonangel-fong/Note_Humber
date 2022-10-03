[Back](../index.md)

# Recover Table

- [Recover Table](#recover-table)
    - [FLASHBACK](#flashback)

---

## FLASHBACK

To recover the newly deleted the table.

- recover all the data that was in the table as well.<br>同时恢复表结构和**数据**。

- Syntax:

```sql

-- query the origninal name in recylebin
SELECT object_name
    ,original_name
    ,droptime
    ,dropSCN
FROM recyclebin;

-- recover the newly removed table
FLASHBACK TABLE tablename
TO BEFORE DROP;

-- verify the recovered table
SELECT *
FROM tab;

```

[TOP](#recover-table)
