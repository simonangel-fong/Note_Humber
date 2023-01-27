# PL/SQL Data Types

[back](./index.md)

- [PL/SQL Data Types](#plsql-data-types)
  - [Data Type](#data-type)
    - [Scalar Data Types](#scalar-data-types)
    - [Composite Data Types](#composite-data-types)
    - [LOB (Large Object) Data Type](#lob-large-object-data-type)
    - [Reference](#reference)
    - [Object](#object)
  - [Data-Type Conversion](#data-type-conversion)
    - [Implicit conversions](#implicit-conversions)
    - [Explicit Conversions](#explicit-conversions)

---

## Data Type

- A data type specifies a storage format, constraints, and a valid range of values.
- PL/SQL supports five categories of data type:

  - Scalar
  - Composite
  - Large Object(LOB)
  - Reference
  - Object

- Cheapsheet

| Data Type                  | Categories              | Literal Value                            | Description                       |
| -------------------------- | ----------------------- | ---------------------------------------- | --------------------------------- |
| `CHAR[(maximum_length)]`   | Scalar                  | Character/String                         | the default length is set to 1.   |
| `VARCHAR2(maximum_length)` | Scalar                  | Character/String                         |                                   |
| `LONG`                     | Scalar                  | Character/String                         |                                   |
| `NUMBER`                   | Scalar                  | Floating-point number                    |                                   |
| `NUMBER(p,s)`              | Scalar                  | Fixed-point number                       |                                   |
| `NUMBER(p)`                | Scalar                  | Integers                                 |                                   |
| `PLS_INTEGER`              | Scalar                  | Numberic value                           |                                   |
| `DATE`                     | Scalar                  | Base type for dates and times            |                                   |
| `TIMESTAMP`                | Scalar                  | Date value                               |                                   |
| `TIMESTAMP WITH TIME ZONE` | Scalar                  | Date value                               |                                   |
| `BOOLEAN`                  | Scalar                  | logical values `TRUE`, `FALSE`, `NULL`   | Only logic operations are allowed |
| `RECORD`                   | Composite               |                                          |                                   |
| `TABLE`                    | Composite               |                                          |                                   |
| `VARRAY`                   | Composite               |                                          |                                   |
| `CLOB`                     | Large Object) Data Type | Character large object                   |                                   |
| `BLOB`                     | Large Object) Data Type | Binary large object                      |                                   |
| `BFILE`                    | Large Object) Data Type | Binary file object                       |                                   |
| `NCLOB`                    | Large Object) Data Type | National language character large object |                                   |

---

### Scalar Data Types

- Hold a **single value**
- Have **no internal components**
- Can be classified into four categories: - Character - Number - Date - Boolean

  > Note : The `BOOLEAN` data type may be new to you, as it is not a column data type used in table definitions.

- 目的/作用

  - What **type** and **size** of data can be stored in a particular location.
  - The **range of values** the variable can have.
  - The set of **operations** that can be applied to values of that type.

- Categories:

  - `Character data` types also are known as **strings** and allow storage of **alphanumeric data (letters, numbers, and symbols)**.
  - `Number data` types allow storage of **integers**, **decimals**, and a **positive or negative indicator**.
  - `Date data` types provide storage of **dates and times**.
  - `BOOLEAN` data type to store the **logical values** `TRUE`, `FALSE`, and `NULL`.

    - **Only logic operations** are allowed on `BOOLEAN` variables.
    - **Column values** cannot be fetched into a BOOLEAN variable and a table column cannot be defined with a BOOLEAN data type. 不能用于存储表的数据
    - The `BOOLEAN` data type is available in PL/SQL, but is **not valid in SQL**.只在 PLSQL 中使用

---

### Composite Data Types

- `Composite data types` have **internal components**, sometimes called elements, that can be **manipulated individually.**

- The internal components that <u>match the data structure</u> of a given table.

```sql
v_variable_name table_name%ROWTYPE;
```

---

### LOB (Large Object) Data Type

- `LOB` data types allow you to store blocks of **unstructured data** (such as text, graphic images, video,
  or audio) up to 4 gigabytes in size.
- `LOB` data types store **locators**, which point to large objects stored in an external file
- A database column can be a `LOB` data type. 创建表时可以声明

  - `CLOB`, `BLOB`, and `NCLOB` data is stored in the database, **either inside or outside of the row.**
  - `BFILE` data is stored **in operating system files outside the database**.

---

### Reference

- Holds values called **pointers** that point to a storage location.

---

### Object

- Is a **schema object** with a <u>name, attributes, and methods</u>. An object data type is similar to the class mechanism supported by C++ and Java.

---

## Data-Type Conversion

- PL/SQL can handle such conversions with **scalar data types**.

- Data-type conversions can be of two types:
  - Implicit conversions 隐式转换
  - Explicit conversions 显式转换

---

### Implicit conversions

- In `implicit conversions`, PL/SQL attempts to convert data types dynamically if **they are mixed in a statement**.
- Implicit conversions can happen between many types in PL/SQL.

- **Drawbacks** of Implicit Conversions
  - Implicit conversions can be **slower**.
  - When you use implicit conversions, you **lose control** over your program because you are making an assumption about how Oracle handles the data. If Oracle changes the conversion rules, then your code can be affected.
  - Code that uses implicit conversion is **harder to read and understand**.
  - Implicit conversion rules **depend upon the environment** in which you are running.

---

### Explicit Conversions

- `Explicit conversions` convert values from one data type to another by using built-in functions.

- 常用：
  - `TO_CHAR`
  - `TO_DATE`
  - `TO_NUMBER`

---

[TOP](#plsql-data-types)
