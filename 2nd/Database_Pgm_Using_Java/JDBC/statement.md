# JDBC Statement

[back](../index.md)

- [JDBC Statement](#jdbc-statement)
  - [Statement](#statement)
    - [Statement object](#statement-object)
      - [Example: Statement](#example-statement)
    - [Prepared object](#prepared-object)
      - [Example: PrepareStatement](#example-preparestatement)
    - [CallableStatement object](#callablestatement-object)

---

## Statement

- The JDBC `Statement`, `PreparedStatement`, and `CallableStatement` **interfaces** define the methods and properties that enable you to interact with the database.
- With a **Connection object** (e.g. conn), we can create Statement, PreparedStatement, and CallableStatement **objects**.

---

### Statement object

- Used for **general-purpose** access to database.
- Useful to static SQL statements at runtime.
- The Statement interface **cannot accept parameters**.
- Created by using `conn.createStatement()`;

#### Example: Statement

```java

import java.sql.*;

public class MysqlStatementDemo {
    public static void main(String[] args) {
        final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";
        final String USER_NAME = "***";
        final String PWD = "***";

        final String DATABASE_URL = String.format("jdbc:mysql://localhost/dbjava?user=%s&password=%s",
                USER_NAME, PWD);

        Connection conn = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName(CLASS_NAME);
            conn = DriverManager.getConnection(DATABASE_URL);
            statement = conn.createStatement();

            resultSet = statement.executeQuery(
                    String.format("select text from message where id = %d", 1));

            while (resultSet.next()) {
                System.out.println(resultSet.getString("text"));
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

---

### Prepared object

- The `PreparedStatement` **interextends** the `Statement interface`.

- The `PreparedStatement interface` accepts input **parameters** at runtime.1.是接口; 2.可以接受参数.

- Created by using `conn.prepareStatement("Update Employees SET age = ? WHERE id = ?")`创建方法:`conn.prepareStatement()`

- The `PreparedStatement interface` is designed to execute **dynamic SQL statements** and **SQL-stored procedures with parameters**.

- A `PreparedStatement` object represents a **precompiled** SQL statement.预编译.

  - Used when the SQL statements are **used many times**.
  - Used to **accept input parameters** at runtime.

- All parameters in JDBC are represented by the `?` symbol-the **parameter marker**.参数标记?
- A **setter method** is included for each of the Java data types that map to a <u>SQL data type</u>.数据类型转换.

  - The JDBC driver converts the <u>Java data type</u> to an <u>SQL data type</u>.

- **Set Method**

- `paramIndex`: starts with **1**, not 0.

| Method                                                | Description                                          |
| ----------------------------------------------------- | ---------------------------------------------------- |
| `public void setInt(int paramIndex, int value)`       | sets the integer value to the given parameter index. |
| `public void setString(int paramIndex, String value)` | sets the String value to the given parameter index.  |
| `public void setFloat(int paramIndex, float value)`   | sets the float value to the given parameter index.   |
| `public void setDouble(int paramIndex, double value)` | sets the double value to the given parameter index.  |

- **Execute Method**

| Method                            | Description                                                                  |
| --------------------------------- | ---------------------------------------------------------------------------- |
| `public int executeUpdate()`      | executes the query. It is used for create, drop, insert, update, delete etc. |
| `public ResultSet executeQuery()` | executes the select query. It returns an instance of ResultSet.              |

#### Example: PrepareStatement

```java

import java.sql.*;

public class MysqlPreparedStatementDemo {

    public static void main(String[] args) {
        final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";
        final String USER_NAME = "root";
        final String PWD = "Simon!23";

        final String DATABASE_URL = String.format("jdbc:mysql://localhost/dbjava?user=%s&password=%s",
                USER_NAME, PWD);

        final String INSERT_SQL = "INSERT INTO message (text) VALUES (?)";

        final String QUERY_SQL = "SELECT COUNT(*) FROM message WHERE length(text) > ?";

        Connection conn = null;
        PreparedStatement preparedStatementInsert = null;
        PreparedStatement preparedStatementQuery = null;
        ResultSet resultSet = null;

        try {
            Class.forName(CLASS_NAME);
            conn = DriverManager.getConnection(DATABASE_URL);

            preparedStatementInsert = conn.prepareStatement(INSERT_SQL);
            preparedStatementInsert.setString(1, "TEST02");
            int num_insert_row = preparedStatementInsert.executeUpdate();

            System.out.println(String.format("\n%d records inserted.\n", num_insert_row));

            preparedStatementQuery = conn.prepareStatement(QUERY_SQL);
            preparedStatementQuery.setInt(1, 30);
            resultSet = preparedStatementQuery.executeQuery();

            while (resultSet.next()) {
                System.out.println(resultSet.getString(1));
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (preparedStatementInsert != null) {
                    preparedStatementInsert.close();
                }
                if (preparedStatementQuery != null) {
                    preparedStatementQuery.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}

```

---

### CallableStatement object

- Used accessing **database stored procedures**, e.g. PL/SQL.

- The `CallableStatement interface` can also accept runtime input **parameters**

- Created by using `conn.prepareCall ("{call getEmpName (?, ?)}")`;

---

[TOP](#jdbc-statement)
