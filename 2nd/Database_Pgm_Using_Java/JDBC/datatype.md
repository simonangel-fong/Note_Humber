# JDBC Data Types

[back](../index.md)

- [JDBC Data Types](#jdbc-data-types)
  - [Execution method](#execution-method)
  - [Date \& Time](#date--time)
  - [NULL Values](#null-values)

---

## Execution method

- Java data type is different from JDBC/database data type. The table at right shows the default mapping for most data types.

- The JDBC driver is responsible for the conversion using a number of methods.

## Date & Time

```java
// Get Java standard date and time
 java.util.Date javaDate = new java.util.Date();
 //System.out.println(javaDate); // Sat Jan 03 16:30:32 EST 2015
 long javaTime = javaDate.getTime(); // 1420320632743

 //Get and display SQL DATE
 java.sql.Date sqlDate = new java.sql.Date(javaTime ); // Get the SQL data by using Java date
 System.out.println("The SQL DATE is: " + sqlDate.toString()); // 2015-01-03
 //Get and display SQL TIME
 java.sql.Time sqlTime = new java.sql.Time(javaTime );
 System.out.println("The SQL TIME is: " + sqlTime.toString()); // 16:30:32
 //Get and display SQL TIMESTAMP
 java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(javaTime );
 System.out.println("The SQL TIMESTAMP is: " + sqlTimestamp.toString()); // 2015-01-03 16:30:32.743
(rslt.next()) {
 person_id = rslt.getLong(1);
 name = rslt.getString(2);
 birth_date = rslt.getTimestamp(3);
 birth_date1 = rslt.getString(3);
 age = rslt.getDouble(4);
 System.out.println("person_id 1 = " + new Long(person_id).toString());
 System.out.println("person_id 2 = " + person_id);
 System.out.println("name = " + name);
 System.out.println("birth_date = " + birth_date);
 System.out.println("birth_date = " + birth_date1);
 }
System.out.println("birth_date with format = " +
 new SimpleDateFormat("MM/dd/yyyy").format(birth_date));
System.out.println("age = " + new DecimalFormat("##0.#").format(age));
```

---

## NULL Values

3

- Avoid using `getXXX()` methods that return primitive data types.
- Use wrapper classes for primitive data types, and use the ResultSet object's wasNull() method to test whether the wrapper class variable that received the value returned by the getXXX() method should be set to null.
- Use primitive data types and the ResultSet object's wasNull() method to test whether the primitive variable that received the value returned by the getXXX() method should be set to an acceptable value that you've chosen to represent a NULL.

---

---

[TOP](#jdbc-data-types)
