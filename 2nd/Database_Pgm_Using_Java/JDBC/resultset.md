# JDBC ResultSet

[back](../index.md)

- [JDBC ResultSet](#jdbc-resultset)
  - [ResultSet](#resultset)
  - [Method](#method)
  - [Type, Concurrency \& Holdability](#type-concurrency--holdability)

---

## ResultSet

- The `java.sql.ResultSet interface` represents the result set of a **database query** (e.g. select statement).

  - A ResultSet contains **Records** or **table of data**.

- A `ResultSet` (object) maintains a **cursor**, which points to the current
  row.

  - Initially, the cursor points **before the first row**.
  - `next()`, used to traverse the `ResultSet`.

---

## Method

- **Navigating Method**

| Method                      | Description                                                                                         |
| --------------------------- | --------------------------------------------------------------------------------------------------- |
| `boolean next()`            | move the cursor to the one row next from the current position.                                      |
| `boolean previous()`        | move the cursor to the one row previous from the current position.                                  |
| `boolean first()`           | move the cursor to the first row in result set object.                                              |
| `boolean last()`            | move the cursor to the last row in result set object.                                               |
| `void beforeFirst()`        | moves the cursor to just before the first row                                                       |
| `void afterLast()`          | moves the cursor to just after the last row                                                         |
| `boolean absolute(int row)` | move the cursor to the specified row number in the ResultSet object.                                |
| `boolean relative(int row)` | move the cursor to the relative row number in the ResultSet object, it may be positive or negative. |

- **Getter methods**
  - SQL types => Java types
  - `columnIndex`: starts with 1, not 0.

| Method                                | Description                                                             |
| ------------------------------------- | ----------------------------------------------------------------------- |
| `int getInt(int columnIndex)`         | return the data of specified column index of the current row as int.    |
| `int getInt(String columnName)`       | return the data of specified column name of the current row as int.     |
| `String getString(int columnIndex)`   | return the data of specified column index of the current row as String. |
| `String getString(String columnName)` | return the data of specified column name of the current row as String.  |
| `boolean wasNull()`                   | Reports whether the last column read had a value of SQL NULL.           |
| `Object	getObject(int columnIndex)`    | Gets the value of the designated column in the current row as Object    |
| `Object	getObject(String columnLabel)` | Gets the value of the designated column in the current row as Object    |

---

## Type, Concurrency & Holdability

- By default, a `ReaultSet` is **readonly** and can be **moved forward only**.

- This can be change by setting the ResultSet’s type and concurrency type.

- JDBC provides following connection methods to create statements with desired ResultSet:
  - `createStatement(int RSType, int RSConcurrency)`;
  - `prepareStatement(String SQL, int RSType, int RSConcurrency)`;
  - `prepareCall(String sql, int RSType, int RSConcurrency)`;

---

[TOP](#jdbc-resultset)
