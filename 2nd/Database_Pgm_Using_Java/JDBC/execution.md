# JDBC Execution

[back](../index.md)

- [JDBC Execution](#jdbc-execution)
  - [Execution method](#execution-method)
    - [executeQuery()](#executequery)
    - [executeUpdate()](#executeupdate)
    - [execute()](#execute)

---

## Execution method

### executeQuery()

- Purpose: Executes the `SQL query` and returns the data in a table

- Parameter:

  - `Statement.executeQuery(String SQL)`: 有参数
  - `PreparedStatement.executeQuery()`: 无参数

- Return:

  - `ResultSet`

---

### executeUpdate()

- Purpose:

  - execute for `INSERT`, `UPDATE`, or `DELETE SQL` statements
  - Supports Data Definition Language (DDL) statements `CREATE TABLE`, `DROP TABLE` and `ALTER TABLE`

- Parameter:

  - `Statement.executeUpdate(String SQL)`: 有参数
  - `PreparedStatement.executeUpdate()`: 无参数

- Return:

  - number of affected rows in the database

### execute()

- Purpose:

  - Executes the given SQL statement, which may **return multiple results**.

- Parameter:

  - `Statement.execute(String SQL)`: 有参数
  - `PreparedStatement.execute()`: 无参数

- Return:
  
  - `true`: if the first result is a `ResultSet` object, then the `ResultSet` object can be obtained with the `getResultSet()` method.
  - `false` if the first result is an update count or no result, then the update count can be obtained with the `getUpdateCount()` method.

  - The `execute()` method may return **multiple results**. To obtain additional results, invoke the `getMoreResults()` method.
  - The `setQueryTimeout(int)`s method specifies the **timeout**, in seconds, for a Statement object to execute.

---

[TOP](#jdbc-statement)
