[Back](../index.md)

[TOC]

# Select Distinct Statement

Remove duplicate items

- Any duplicate values are suppressed

- The DISTINCT keyword is applied to all columns listed in the SELECT statement. Select语句提及字段都会使用，而不是最近的字段才会适用;

- The DISTINCT keyword in a SELECT statement with multiple columns returns the records that are unique for all columns will be returned.多字段时，相当于比较数组。

```sql
-- Remove duplicate items by using DISTINCT
SELECT DISTINCT field_name, field_name
FROM table_name;

```



