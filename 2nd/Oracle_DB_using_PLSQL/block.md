# PLSQL Block

[back](./index.md)

- [PLSQL Block](#plsql-block)
  - [PL/SQL Block Structure](#plsql-block-structure)
  - [Anonymous Blocks](#anonymous-blocks)
  - [Subprograms](#subprograms)

---

## PL/SQL Block Structure

- A PL/SQL block consists of three sections.

| Section     | Inclusion | Keyword         | Description                                                                                                                                                    |
| ----------- | --------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Declarative | optional  | `DECLARE`       | Contains declarations of all <u>variables, constants, cursors, and user-defined exceptions</u> that are referenced in the executable and exception sections.   |
| Executable  | mandatory | `BEGIN`, `END;` | Contains SQL statements to retrieve data from the database and PL/SQL statements to manipulate data in the block. <br>**Must contain at least one statement.** |
| Exception   | optional  | `EXCEPTION`     | Specifies the actions to perform when errors and abnormal conditions arise in the executable section.                                                          |

```sql
DECLARE
    #optional
    #declarations section
BEGIN
    #mandatory, Must contain at least one statement.
    #executable command(s)
EXCEPTION
    #optional
    #exception handling
END;

```

---

## Anonymous Blocks

- Unnamed block
- Not stored in the database
- Declared inline at the point in an application where it is executed
- Compiled each time the application is executed
- Passed to the PL/SQL engine for execution at run time
- Cannot be invoked or called because it does not have a name and does not exist after it is executed

- In SQL Scripts, anonymous PL/SQL blocks must be followed by a forward slash (`/`). 在 sql 脚本中， 匿名代码块之后还有 SQL 代码的，使用斜杆区隔。

- Basic structure of an anonymous block:

```sql
#DECLARE#
BEGIN
--statements
#EXCEPTION#
END;

```

---

## Subprograms

- named PL/SQL blocks
- Are stored in the database
- Can be invoked whenever you want depending on your application
- Can be declared as procedures or as functions

  - Procedure: Performs an **action**
  - Function: Computes and **returns a value**

- Procedure:

```sql

PROCEDURE procedure_name
IS
-- variable declarations
BEGIN
-- statements
#EXCEPTION
END;

```

- Function

```sql
FUNCTION function_name
RETURN datatype
-- variable declaration(s)
IS
BEGIN
-- statements
RETURN value;
#EXCEPTION
END;
```

- Invoke a procedure/function

```sql
BEGIN
    procedure_name; #invokes a procedure
    function_name; #invokes a function
END;

```

---

[TOP](#PLSQL)
