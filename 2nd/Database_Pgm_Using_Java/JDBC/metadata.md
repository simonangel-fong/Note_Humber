# JDBC Metadata

[back](../index.md)

- [JDBC Metadata](#jdbc-metadata)
  - [Database Metadata](#database-metadata)
  - [ResultSet Metadata](#resultset-metadata)
  - [JDBC SQLException](#jdbc-sqlexception)
  - [JDBC SQLWarning](#jdbc-sqlwarning)

---

## Database Metadata

- `Database Metadata`: specific information of database.
  - example:
    - SQL data types
    - if a database supports batch updates
    -
- `DatabaseMetaData interface`: represents the database metadata.

- Get database metadata:
  - `DatabaseMetaData metadata = currentConnection.getMetaData()`

```java
  ResultSet resultSet= metadata.getTypeInfo();
  boolean supportsBU = metadata.supportsBatchUpdates();
  boolean supportsSP = metadata.supportsSavepoints();
  boolean supposrtsTrans = metadata.supportsTransactions();
  String database =metadata.getDatabaseProductName();
  int databaseMajorVersion =metadata.getDatabaseMajorVersion();
  int driverMajorVersion =metadata.getDriverMajorVersion();
  String driverName =metadata.getDriverName();
  int driverVersion =metadata.getDriverVersion();
  int jdbcMajorVersion =metadata.getJDBCMajorVersion();
```

---

## ResultSet Metadata

- `ResultSet Metadata`: specific information of database table

```java
ResultSet rs = stmt.executeQuery( "SELECT * FROM Cust" ) ;
ResultSetMetaData md = rs.getMetaData() ; // Get the metadata
System.out.println(md.getTableName(1)) ; // print table name
for( int i = 1; i <= md.getColumnCount(); i++ ) {
System.out.print( md.getColumnLabel(i) + " "); // Print the column labels
System.out.print( md.getColumnName(i) + " "); // Print the column name
System.out.print( md.inNullable(i) + " "); // Print the column is nullable or not
System.out.print( md.getPrecision(i) + " "); // Print the precision
}
System.out.println() ;
// Loop through the result set
while( rs.next() ) {
for( int i = 1; i <= md.getColumnCount(); i++ )
 System.out.print( rs.getString(i) + " " ) ;
System.out.println() ;
}
```

---

## JDBC SQLException

- The SQLException instance contains the following information that can help determine the cause of the error:
  - A description of the error
  - a SQLState code
  - an error code
  - a cause
  - reference to any chained exceptions

## JDBC SQLWarning

- `java.sql.SQLWarning`:
  - Minor errors
  - generate `SQLWarning` messages, which are not sufficiently critical to throw an exception.
  - Each `Statement` and `ResultSet` builds up a stack of `SQLWarnings` that can be accessed with the `getWarnings()` and `getNextWarning()` methods.

```java

String mySQL = "INSERT INTO contacts (name, address1, address2, city, state)
    values ('JoJo', '123 Main St', '', 'Whoville', 'Who')";
Statement stmt = conn.createStatement();
stmt.executeUpdate(mySQL);

SQLWarning w = stmt.getWarnings();
while (w != null) {
    System.out.println("SQLWarning: " + w.getMessage());
    w = stmt.getNextWarning();
}
```

---

[TOP](#jdbc-database-metadata)
