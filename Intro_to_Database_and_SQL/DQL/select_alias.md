[Back](../index.md)

[TOC]

# Select Alias

## Alias: Column列别名

### Using `AS`

- if you want alias name contains any spaces or special symbols, you must enclose the alias in double quotation marks

- Syntax

```SQL

-- return column with the name of alias name
SELECT column_name AS alias_name
FROM table_name;

```

### Using Space Character使用空格

- Syntax

```SQL

-- return column with the name of alias name
SELECT column_name alias_name
FROM table_name;

```

