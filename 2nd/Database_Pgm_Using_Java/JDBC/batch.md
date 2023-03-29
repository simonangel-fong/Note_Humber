# JDBC Batch

[back](../index.md)

- [JDBC Batch](#jdbc-batch)
  - [Batch](#batch)
    - [Batching Steps](#batching-steps)
    - [Example](#example)

---

## Batch

- `Batch Processing`: group related SQL statements into a batch and submit them **with one call** to the database.

  - Advantage: sending several SQL statements to the database at once -> reducing the amount of communication overhead -> improving performance.

- JDBC drivers are not required to support this feature.

  - use the `DatabaseMetaData.supportsBatchUpdates()` method to determine if the target database supports batch update processing.
    - The method returns true if your JDBC driver supports this feature.

- `addBatch()`: **add individual statements to the batch**.

  - Class: `Statement`, `PreparedStatement`, and `CallableStatement`

- `executeBatch()`: start the execution of all the statements grouped together.

  - returns: an array of integers, and each element of the array represents the update count for the respective update statement.

- `clearBatch()`: removes all the statements added with the `addBatch()` method.

### Batching Steps

- 1. Create a **Statement object** using `createStatement()` methods.

- 2. Set **auto-commit** to `false` using `setAutoCommit(false)`.

- 3. Add SQL statements into batch using `addBatch()` method on created statement object.

- 4. Execute all the SQL statements using `executeBatch()` method on created statement object.

- 5. Finally, commit all the changes using `commit()` method.

### Example

```java
// Create statement object
Statement stmt = conn.createStatement();
// Set auto-commit to false
conn.setAutoCommit(false);
// Create SQL statement
String SQL = "INSERT INTO Employees (id, first, last, age) " +
 "VALUES(200,'Zia', 'Ali', 30)";
// Add above SQL statement in the batch.
stmt.addBatch(SQL);
// Create one more SQL statement
String SQL = "INSERT INTO Employees (id, first, last, age) " +
 "VALUES(201,'Raj', 'Kumar', 35)";
// Add above SQL statement in the batch.
stmt.addBatch(SQL);
// Create one more SQL statement
String SQL = "UPDATE Employees SET age = 35 " +
 "WHERE id = 100";
// Add above SQL statement in the batch.
stmt.addBatch(SQL);
// Create an int[] to hold returned values
int[] count = stmt.executeBatch();
………… Check the return count value for success.
//Explicitly commit statements to apply changes
conn.commit();

```

---

[TOP](#jdbc-batch)
