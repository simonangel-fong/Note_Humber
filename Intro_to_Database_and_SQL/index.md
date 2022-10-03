[All Notes](/index.md)

## Intro to Database and SQL

- College: Humber college
- Semester: Fall 2022
- Course ID: ITC-5104-0GC
- Instructor: MENGYUAN DU

**!Important**: This note is for personal use. Copy right reserved.

## Catalog

- Introduction
    - [Oracle SQL Developer](./introduction/oracle_sql_developer.md)
    - [Syntax](./introduction/syntax.md)
    - [Datatype]()

- Select Statement
    - [SELECT FROM](./select_statement/select_from.md)
    - [SELECT Alias](./select_statement/select_alias.md)
    - [SELECT Concatenation](./select_statement/select_concatenation.md)
    - [SELECT Arithmetic](./select_statement/select_arithmetic.md)
    - [SELECT DISTINCT](./select_statement/select_distinct.md)
    - [SELECT WHERE](./select_statement/select_where/select_where.md)
        - [SELECT WHERE BETWEEN AND](./select_statement/select_where/select_where_between_and.md)
        - [SELECT WHERE IN](./select_statement/select_where/select_where_in.md)
        - [SELECT WHERE LIKE](./select_statement/select_where/select_where_like.md)
        - [SELECT WHERE AND/OR](./select_statement/select_where/select_logical_operator.md)
        - [SELECT WHERE IS NULL](./select_statement/select_where/select_where_is_null.md)
        - [SELECT WHERE ORDER BY](./select_statement/select_where/select_where_order_by.md)

- Table
    - [Table Basic](./table/table_basic.md)
    - [Table Management](./table/table_mgnt.md)
    - [Create Table](./table/create_table.md)
    - [Update Table](./table/modify_table.md)
    - [Delete Table](./table/delete_table.md)
    - [Recover Table](./table/recover_table.md)

- Data
    - [Delete rows](./data/delete_row.md)




SQL 语法
- 大小写
    - **not case sensitive**大小写不敏感
    
    - **Keywords** are suggected to be entered in **uppercase**关键字：大写
    
    - **all other words**, such as table names and columns, are suggested to be entered in **lowercase**. 其他：小写

- 可读性
    - Statement can be entered on one or **many lines**.一个命令可以是多行
    
    - Clauses are usually placed on **separate lines** for readability and ease of editing分行书写命令，以获取可读性和易编辑性
    
    - Keywords cannot be split across lines or abbreviated保持关键字完整性,不能分行也不能缩简

    - **Tabs and indents** make code more readable缩进

- 分号semi-colon
    - SQL statements end with a **semi-colon ( ; )**以分号结束
    - a single command in SQL Developer can end with omission of the semi-colon.当只有一行代码时，可以忽略分号

- 逗号comma
    - to separate the column names分隔列名
    - a space is not necessary but is used to improve readability空格可提高可读性
    - 

- 双引号double quotation marks

    - Alias with spaces or special symbols别名含有空格或特别符号 

-  单引号single quotation marks

    - concatenation连接多列时



## 显示

- Alignment对齐
    - text / character fields: left-aligned;
    - date fields: left-aligned;
    - numeric data: right-aligned

- By default, Oracle does not display insignificant zeroes. i.e.: 54.50 -> 54.5



