# Subprogram

[Back](../index.md)

- [Subprogram](#subprogram)
  - [Differences Between Anonymous Blocks and Subprograms](#differences-between-anonymous-blocks-and-subprograms)
  - [Procedures and Functions](#procedures-and-functions)
    - [Similarities](#similarities)
    - [Differences](#differences)
  - [Handling Exception in Function and Procedure](#handling-exception-in-function-and-procedure)
    - [Handled Exceptions](#handled-exceptions)
    - [Exceptions Not Handled](#exceptions-not-handled)

---

## Differences Between Anonymous Blocks and Subprograms

| Anonymous Blocks                        | Subprograms                                                       |
| --------------------------------------- | ----------------------------------------------------------------- |
| Unnamed PL/SQL blocks                   | Named PL/SQL blocks                                               |
| Compiled on every execution             | Compiled only once, when created                                  |
| Not stored in the database              | Stored in the database                                            |
| Cannot be be reused or shared           | Csan be explicitly shared                                         |
| Cannot be invoked by other applications | They are named and therefore can be invoked by other applications |
| Do not return values                    | Subprograms called functions must return values                   |
| Cannot take parameters                  | Can take parameters                                               |

- Syntax

```sql
-- Anonymous blocks

DECLARE --Optional
    --Variables, cursors, etc.;
BEGIN --Mandatory
    --SQL and PL/SQL statements;
EXCEPTION --Optional
    --WHEN exception_handling actions;
END; --Mandatory


-- Subprograms (procedures)
CREATE OR REPLACE PROCEDURE name(parameters)
IS|AS --Mandatory
    --Variables, cursors, etc.; --Optional
BEGIN --Mandatory
-- SQL and PL/SQL statements;
EXCEPTION --Optional
-- WHEN exception-handling actions;
END; --Mandatory
```

- named block

  - a named procedure (does not return values except as out parameters)
  - a function (must return a single value not including out parameters)
  - a package (groups functions and procedures together)
  - a trigger

- **DECLARE**

  - The keyword `DECLARE` is replaced by `CREATE PROCEDUR` procedure-name `IS | AS`.

- **Benefits** of Subprograms

  - the modularizing of the code:

    - Easy maintenance: Modifications need only be done once to improve multiple applications and minimize testing.
    - Code reuse: Subprograms are located in one place.

  - Improved data security: Indirect access to database objects is permitted by the granting of security privileges on the subprograms.

    - By default, subprograms run with the privileges of the subprogram **owner**, not the privileges of the **user**.

  - Data integrity: Related actions can be grouped into a block and are performed together (“Statement Processed”) or not at all.

  - Improved performance:

    - Subsequent calls to the subprogram avoid compiling the code again.
    - Also, many users can share a single copy of the subprogram code in memory.

  - Improved code clarity: can reduce the need for comments, and enhance the clarity of the code.

---

## Procedures and Functions

| Procedures                                                         | Functions                                      |
| ------------------------------------------------------------------ | ---------------------------------------------- |
| Execute as a PL/SQL statement                                      | Invoked as part of an **expression**           |
| Do not contain **RETURN clause** in the header                     | Must contain a **RETURN clause** in the header |
| **May return** values (if any) in output parameters (not required) | **Must return** a single value                 |
| May contain a RETURN statement without a value                     | **Must** contain at least one RETURN statement |

---

### Similarities

- PL/SQL subprograms
  Both are named PL/SQL blocks

- Parameter:

  - Both can have zero or more `IN` parameters that can be passed from the calling environment.
  - Both return data as `OUT` and `IN OUT` parameters.(技术上, 函数都可以使用 out 或 in out 参数)

- Block structure:

  - Optional parameters
  - Optional declarative section
  - Mandatory executable section
  - Optional section to handle exceptions

---

### Differences

- **return**

  - A function **MUST return a value** using the `RETURN` statement.
  - A procedure can only return a value using an `OUT` or an `IN OUT` parameter.

- **control**

  - The return statement in a function **returns control** to the calling program and **returns the results** of the function.
  - The return statement within a procedure is **optional**. It returns control to the calling program <u>before all of the procedure's code has been executed.</u> 储存过程可以使用 return, return 之后的代码不会执行.

- **Call**
  - Functions can be called from `SQL`, procedures cannot.
  - Functions are considered **expressions**, procedures are not.

---

## Handling Exception in Function and Procedure

### Handled Exceptions

- When an exception occurs and **is handled** in a called procedure or function, the following code flow takes place:
  - 1. The exception is raised.
  - 2. Control is transferred to the **exception handler of the block** that raised the exception.
  - 3. The exception code is executed and **the block is terminated**.
  - 4. Control **returns** to the calling program.
  - 5. The calling program/block **continues to execute**.

---

### Exceptions Not Handled

- If the exception section does **not provide a handler** for the raised exception, then it is not handled. The following code flow occurs:

  - 1. The exception is raised.
  - 2. Control is transferred to the **exception handler of the block** that raised the exception.
  - 3. Since no exception handler exists, the **block terminates** and any DML operations performed **within the block** that raised the exception are **rolled back**.
  - 4. Control returns to the calling program and the **exception propagates to the exception section** of the calling program.
  - 5. If the exception is not handled by the calling program, the **calling program terminates** and any DML operations performed **prior to** the occurrence of the unhandled exception are **rolled back**.

- 即一般没有 handle, 则会回滚, 包括子程序中的和主程序中的.

---

[TOP](#subprogram)
