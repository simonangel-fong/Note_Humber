[Back](../index.md)

# Create Table

- [Create Table](#create-table)
    - [CREATE TABLE](#create-table-1)
    - [CREATE TABLE AS](#create-table-as)

---

## CREATE TABLE

- Syntax
```sql

CREATE TABLE [schema] tablename
(
    columnname datatype [DEFAULT value],
    columnname datatype [DEFAULT value], 
    ...
)

```

|参数|描述|
|---|---|
|schema|the owner’s name, defaults to urrent user|
|Tablename|the name of the table|
|Columnname|the name of the column|
|Datatype|the column’s datatype and length|
|DEFAULT value|Specifies a default value if a value is omitted in the INSERT statement|


- **Privileges**<br>
    To create a table in someone else’s schema (account) you have to be granted permission or have the privilege of the CREATE TABLE command for that user’s schema
- The column list is enclosed in **parentheses**
    括号包围列
- **Commas** separate the column definitions
    逗号分隔
- The CREATE TABLE command also allows for a **default value** to be assigned to a column. This value will automatically be stored by Oracle if the user makes no entry into that column


- 验证
    - If the creation is successful, Oracle will respond with the **message** CREATE TABLE succeeded.
    - query the query the data dictionary to verify all existing tables in your schema
        - `SELECT table_name FROM user_tables;`
        - `SELECT * FROM tab;`
    - view the table structure: `DESC [table_name];`

- **Actual Practice**<br>
    实践中, 会先`drop`避免已存在的表触发异常

```sql

-- remove the existing table
DROP table_name;

-- create new table
CREATE TABLE table_name
(
    column_name datatype(width) [DEFAULT default_value],
    column_name datatype(width) [DEFAULT default_value],
)

-- Return a list of table names
SELECT table_name
FROM user_tables;

-- Return the structure of new table
DESC table_name;

```

[TOP](#create-table)

---

## CREATE TABLE AS

- To create a table that will contain data from existing tables<br>
    即创建新表会包含query返回的数据<br>
    - sometimes referred to as `CTAS`
    - have the option of providing new column names or using the columns that are retrieved from the subquery

```sql

-- Create a table based on a specific subquery
CREATE TABLE tablename 
AS
(
    SELECT column01_name
        , column02_name
        ...
    FROM existing_table
);

-- Create a table with given column names, based on a specific subquery
-- 除了查询外还自定义列名
CREATE TABLE tablename 
(
    column01_newname,
    column02_newname,
    ...
)
AS
(
    SELECT column01_name
        , column02_name
        ...
    FROM existing_table
);

```

- 注意: 
    - 新列名的数量和顺序必须与select中的列数量和顺序一致
    - 如果列数量不一致，会报错`invalid number of column names specified`
    - 新列名只需列出列名即可，不需要定义数据类型

[TOP](#create-table)
