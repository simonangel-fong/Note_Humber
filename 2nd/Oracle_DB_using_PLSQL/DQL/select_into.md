# Select Into

[TOC]

---

## `SELECT INTO`

- Syntax

```sql
-- Select into statement
SELECT column_name01,column_name02
INTO v_variable_name,v_variable_name02
FROM table_name
WHERE --optional
condition;
```

- `INTO` is used to specify the names of PL/SQL variables that hold the values that SQL returns from the SELECT clause.

- Be sure the columns and variables are in the same **positional order** and their **data types** are compatible.变量顺序必须和列名顺序一致，数据类型要对应

- Query 返回的值只能是 exactly one row，因为变量只能有 single value，会触发错误` exact fetch returns more than requested number of rows`.

  - 因此最大部分时间`where`语句都是必须的。

- 也可以使用 function 赋值,只要其返回的值是 single value e.g.:`SUM(column_name)`

- To insure data type **compatibility** between columns and
  variables, declare the receiving variables using `%TYPE` 使用 TYPE 属性确保数据类型的一致.

- 同名适用：列名>local 变量>表名
  - The names of database table columns take precedence over the names of local variables.
  - The names of local variables and formal parameters take precedence over the names of database tables (in a PL/SQL
    statement).
  - 解决方法：
    - Avoid using database column names as identifiers.
    - 变量名约定上以`v_`开头以区分列名。

---

[TOP](#select-into)
