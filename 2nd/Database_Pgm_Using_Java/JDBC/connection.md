# JDBC Connection

[back](../index.md)

- [JDBC Connection](#jdbc-connection)
  - [Transaction Control](#transaction-control)
    - [Auto Commit](#auto-commit)
    - [Savepoint Interface](#savepoint-interface)
  - [ReadOnly](#readonly)
  - [Close](#close)

---

## Transaction Control

- Connection method for Transaction Control

| Method                                                    | Description                                                         |
| --------------------------------------------------------- | ------------------------------------------------------------------- |
| `Savepoint Connection.setSavepoint()`                     | Creates an unnamed savepoint in the current transaction             |
| `Savepoint Connection.setSavepoint(String savepointName)` | Creates a savepoint with the given name in the current transaction  |
| `void Connection.rollback()`                              | Undoes all changes made in the current transaction                  |
| `void Connection.commit()`                                | Makes all changes made since the previous commit/rollback permanent |
| `void setAutoCommit(boolean autoCommit)`                  | Sets connection's auto-commit mode. `True`, by default.             |

### Auto Commit

- A `Connection` object is in **auto-commit mode**, by default. In the autocommit mode, changes are committed to the database after an SQL statement is executed.

  - If auto-commit is set to `false`, it would be required to commit changes by calling the `commit()` method
    - `connection.commit()`
    - `connect.rollback()`

---

### Savepoint Interface

- A Savepoint is a point within a transaction up to which the changes made in the transaction are rolled back, if the transaction is rolled back with the `rollback()` method.

- All changes before the savepoint are implemented when a transaction is rolled back.

- Savepoint Method

| Method                                    | Description                                   |
| ----------------------------------------- | --------------------------------------------- |
| `Savepointint Savepoint.getSavepointId()` | Retrieves the generated ID for this savepoint |
| `String Savepoint.getSavepointName()`     | Retrieves the name of this savepoint          |

---

## ReadOnly

- A `Connection` object can be set to read-only by calling the
  setReadOnly() method
  - `connection.setReadOnly(true)`
  - Note: This method cannot be called during a transaction.

---

## Close

- If a `Connection` object is not required, close the connection
  - `Connection.close()`

---

[TOP](#jdbc-connection)
