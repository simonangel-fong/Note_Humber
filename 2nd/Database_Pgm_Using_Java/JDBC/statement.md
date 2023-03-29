# JDBC Statement

[back](../index.md)

- [JDBC Statement](#jdbc-statement)
  - [Statement](#statement)
    - [Statement object](#statement-object)
      - [Example: Statement](#example-statement)
    - [Prepared object](#prepared-object)
      - [Example: PrepareStatement](#example-preparestatement)
    - [CallableStatement object](#callablestatement-object)
      - [Example: Call Procedure](#example-call-procedure)
      - [Example: Call Function](#example-call-function)

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

#### Example: Call Procedure

- Oracle Procedure

```sql
DROP TABLE java_employees;

DROP TABLE java_department;

CREATE TABLE java_department(
  id number GENERATED BY DEFAULT ON NULL AS IDENTITY
, department_name VARCHAR2(32)
, CONSTRAINT java_department_id_pk PRIMARY KEY (id)
);

CREATE TABLE java_employees(
  id number GENERATED BY DEFAULT ON NULL AS IDENTITY
, fname VARCHAR2(20)
, lname VARCHAR2(20)
, department_id number
, salary number
, CONSTRAINT java_employees_id_pk PRIMARY KEY (id)
, CONSTRAINT java_employees_department_id_fk FOREIGN KEY(department_id) REFERENCES java_department(id)
);

-- Test data
INSERT INTO java_department (
  department_name
) VALUES(
  'Maketing'
);

INSERT INTO java_department (
  department_name
) VALUES(
  'Operation'
);

INSERT INTO java_employees (
  fname
, lname
, department_id
, salary
) VALUES(
  'John'
, 'Wick'
, 1
, 30000
);

INSERT INTO java_employees (
  fname
, lname
, department_id
, salary
) VALUES(
  'Micheal'
, 'Smith'
, 2
, 50000
);
/

CREATE OR REPLACE PROCEDURE insert_new_employees(
  p_fname IN VARCHAR2
, p_lname IN VARCHAR2
, p_dept_id IN NUMBER
, p_salary IN NUMBER
, p_is_success OUT NUMBER
) IS
BEGIN
  INSERT INTO java_employees (
    fname
  , lname
  , department_id
  , salary
  ) VALUES(
    p_fname
  , p_lname
  , p_dept_id
  , p_salary
  );
  p_is_success := 1;
EXCEPTION
  WHEN OTHERS THEN
    p_is_success := 0;
END;

```

- Java

```java

import java.sql.*;

public class OracleCallableStatementDemo {
    public static void main(String[] args) {
        final String DIRVER_NAME = "oracle.jdbc.driver.OracleDriver";
        final String DB_URL = "jdbc:oracle:thin:@calvin.humber.ca:1521:grok";

        final String PROC_SQL = "{call insert_new_employees (?, ?, ?, ?, ?)}";

        Connection conn = null;
        Statement statement = null;
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName(DIRVER_NAME);
            conn = DriverManager.getConnection(DB_URL, "n01555914", "oracle");
            callableStatement = conn.prepareCall(PROC_SQL);

            callableStatement.registerOutParameter(5, java.sql.Types.INTEGER);  //register out parameter of the procedure

            callableStatement.setString(1, "Amit");
            callableStatement.setString(2, "Test");
            callableStatement.setInt(3, 1);
            callableStatement.setInt(4, 10000);

            callableStatement.execute();
            System.out.println(callableStatement.getInt(5));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (callableStatement != null)
                    callableStatement.close();
                if (statement != null)
                    statement.close();
                if (conn != null)
                    conn.close();
                System.out.print("Close");
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }
}

```

---

#### Example: Call Function

- Functiong SQL

```sql
DROP TABLE java_employees;

DROP TABLE java_department;

CREATE TABLE java_department(
  id number GENERATED BY DEFAULT ON NULL AS IDENTITY
, department_name VARCHAR2(32)
, CONSTRAINT java_department_id_pk PRIMARY KEY (id)
);

CREATE TABLE java_employees(
  id number GENERATED BY DEFAULT ON NULL AS IDENTITY
, fname VARCHAR2(20)
, lname VARCHAR2(20)
, department_id number
, salary number
, CONSTRAINT java_employees_id_pk PRIMARY KEY (id)
, CONSTRAINT java_employees_department_id_fk FOREIGN KEY(department_id) REFERENCES java_department(id)
);

INSERT INTO java_department (
  department_name
) VALUES(
  'Maketing'
);

INSERT INTO java_department (
  department_name
) VALUES(
  'Operation'
);

INSERT INTO java_employees (
  fname
, lname
, department_id
, salary
) VALUES(
  'John'
, 'Wick'
, 1
, 30000
);

INSERT INTO java_employees (
  fname
, lname
, department_id
, salary
) VALUES(
  'Micheal'
, 'Smith'
, 2
, 50000
);

CREATE OR REPLACE FUNCTION count_employees RETURN NUMBER IS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM java_employees;
  RETURN v_count;
END;
```

- Java

```java

import java.sql.*;

public class OracleCallableStatementDemo {
    public static void main(String[] args) {
        final String DIRVER_NAME = "oracle.jdbc.driver.OracleDriver";
        final String DB_URL = "jdbc:oracle:thin:@calvin.humber.ca:1521:grok";

        final String PROC_SQL = "{call insert_new_employees (?, ?, ?, ?, ?)}";
        final String FUNC_SQL = "{? = call count_employees }";

        Connection conn = null;
        Statement statement = null;
        CallableStatement callableStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName(DIRVER_NAME);
            conn = DriverManager.getConnection(DB_URL, "n01555914", "oracle");

            callableStatement = conn.prepareCall(FUNC_SQL);

            callableStatement.registerOutParameter(1, java.sql.Types.INTEGER);
            boolean isSet = callableStatement.execute();

            System.out.println(isSet);
            System.out.println(callableStatement.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (callableStatement != null)
                    callableStatement.close();
                if (statement != null)
                    statement.close();
                if (conn != null)
                    conn.close();
                System.out.print("Close");
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }

    }
}
```

---

[TOP](#jdbc-statement)
