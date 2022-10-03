[Back](../index.md)

[TOC]

# Select Concatenation Statement

- **Concatenation**: Combining columns 

- **Concatenation operator**连接运算符(Oracle): two vertical bars beside one another `||` 双竖杠

```SQL
-- combining two columns
SELECT field_name || field_name
FROM table_name

-- concatenate two columns with a space character
SELECT field_name || ' ' || field_name
FROM table_name

```

- a **string literal** was inserted into the output to put a blank space between the two fields

- All **string literals** are enclosed in single quotation marks, the single quotes have a space inside so I end up with a space in my result 单引号
