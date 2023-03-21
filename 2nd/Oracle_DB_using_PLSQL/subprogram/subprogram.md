# Subprogram

[Back](../index.md)

- [Subprogram](#subprogram)
  - [Differences Between Anonymous Blocks and Subprograms](#differences-between-anonymous-blocks-and-subprograms)
  - [Procedures and Functions](#procedures-and-functions)

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

- Similarities

  - named PL/SQL blocks
  - PL/SQL subprograms
  - Have block structures similar to anonymous blocks
    - Optional parameters
    - Optional declarative section
    - Mandatory executable section
    - Optional section to handle exceptions
  - Procedures and functions can both return data as OUT and IN OUT parameters.

- Differences

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

[TOP](#subprogram)
