[Back](../../index.md)

# 目录

[TOC]

# IS NULL

- `NULL` values, representing that no value has been stored in particular field , can return unexpected results.

- `IS NULL` is used to search `NULL` values, while equal sign `=` can't be used
    - 不能使用等于号匹配NULL值.
    - 如果使用`field_name = NULL`,不会报错; 但不会返回任何行.Not returns no rows.
    - 比较的前提是非null，所以<>不会涉及null值

- 字段中存在`NULL`值时，返回的数据使用`(null)`标识。

- 取反: `IS NOT NULL`. 不能使用`<>`。



