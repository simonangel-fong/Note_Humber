# Exception

[Back](../index.md)

- [Exception](#exception)
  - [Exception](#exception-1)
  - [Exception Handler](#exception-handler)
  - [Trapping Exceptions](#trapping-exceptions)
  - [Exception Types](#exception-types)
  - [Method](#method)

---

## Exception

- `Exception`: an unexpected error that disrupts the normal operation of the program during the execution.

- When code does not work as expected, PL/SQL **raises an exception**.

- When an exception is raised, the <u>rest of the execution section</u> of the PL/SQL block is **not executed**.

---

## Exception Handler

- `Exception handler`: code that defines the **recovery actions to be performed** when an exception is raised.

- When writing code, programmers need to anticipate the types of errors that can occur during the execution of that code.

  - They need to include exception handlers in their code to address these errors. In a sense, exception handlers allow programmers to "bulletproof" their code.

- Importance of exception handler

  - **Protects the user** from errors (frequent errors, unhelpful error messages, and software crashes can
    frustrate users/customers, and this is not good).
  - **Protects the database** from errors (data can be lost or overwritten).
  - Errors can be costly, in time and resources (processes may slow as operations are repeated or errors are investigated).

- The **exception section** begins with the keyword `EXCEPTION`.

  - When an exception is handled, the PL/SQL program **does not terminate abruptly** 突然地. When an exception is raised, **control immediately shifts to the exception section** and the appropriate handler in the exception section is executed.

  - When an exception is raised, the <u>rest of the executable section</u> of the block is **NOT executed**; instead, the `EXCEPTION` section is **searched** for a suitable handler.

  - Only **one** exception can occur at a time only **one** handler may be executed.

---

## Trapping Exceptions

- You can handle or "trap" any error by including a corresponding handler within the exception-handling section of the PL/SQL block. 相当于 catch

- Syntax:

```sql
EXCEPTION
    WHEN exception1 [OR exception2 . . .] THEN
        statement1;
        statement2; . . .
    WHEN exception3 [OR exception4 . . .] THEN
        statement1;
        statement2; . . .
    . . .
    WHEN OTHERS THEN
        statement1;
        statement2;
    . . .
```

- Each handler consists of a `WHEN` clause, which specifies an **exception name** (exception1, exception 2, etc.), followed by `THEN` and one or more statements to be executed when that exception is raised (statement1, statement 2, etc.).

- The exception-handling section traps **only those exceptions that are specified**; any other exceptions are **not trapped unless** you use the `OTHERS` exception handler.

- `OTHERS` is an optional exception-handling clause that traps any exceptions that have not been explicitly handled.

  - If used, OTHERS must be the **last exception handler** that is defined.

- **guidelines** when trapping exceptions

  - **Always add exception handlers** whenever there is a possibility of an error occurring.
  - Errors are especially likely during **calculations**, **string manipulation**, and **SQL database operations**.
  - **Handle named exceptions** whenever possible, instead of using OTHERS in exception handlers.
  - Learn the names and causes of the **predefined exceptions**.
  - Test your code with different combinations of **bad data** to see what potential errors arise.
  - Write out debugging information in your exception handlers.
  - Carefully consider whether each exception handler should **commit** the transaction, **roll it back**, or let it continue.
  - No matter how severe the error is, you want to leave the database in a consistent state and **avoid storing any bad data**.

## Exception Types

| Exception                              | Description                                               | Instructions for Handling                                                                                                      |
| -------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| Predefined **Oracle server error**     | Most common PL/SQL errors (about 20 or so that are named) | **need not declare** these exceptions. They are predefined by the Oracle server and are **raised implicitly (automatically)**. |
| Non-predefined **Oracle server error** | Other PL/SQL errors(**no name**)                          | **Declare** within the declarative section and allow the Oracle Server to **raise them implicitly (automatically)**.           |
| User-defined error                     | Defined by the **programmer**                             | **Declare** within the declarative section, and **raise explicitly**                                                           |

---

## Method

- There are two methods for raising an exception:
  - **Implicitly (automatically) by the Oracle server**:
    - An `Oracle error` occurs and the associated exception is raised automatically.
    - Such as `NO_DATA_FOUND`
  - **Explicitly by the programmer**
    - Depending on the business functionality your program is implementing, programmer might have to explicitly raise an exception.
    - Programmer raise an exception explicitly by issuing the `RAISE` statement within the block.
    - The exception being raised can be either `user-defined` or `predefined`.

---

[TOP](#exception)
