# Scope of Exception

[Back](../index.md)

- [Scope of Exception](#scope-of-exception)
  - [Exception Handling in Nested Blocks](#exception-handling-in-nested-blocks)
  - [Scope of Exception Names](#scope-of-exception-names)
    - [Example: 经典错误](#example-经典错误)
  - [Propagating Unhandled Exceptions to the Calling Environment](#propagating-unhandled-exceptions-to-the-calling-environment)
    - [Example: 抛出到 Oracle 环境](#example-抛出到-oracle-环境)

---

## Exception Handling in Nested Blocks

- deal with an exception by:

  - Handling it (“trapping it”) in the **block** in which it occurs
  - Propagating it to the **calling environment** (which can be a higher-level block)

- When the inner block’s `EXCEPTION section` deals with the exception successfully, and PL/SQL considers that this exception is now **finished**.

  - The outer block resumes **execution as normal**.

- If the exception is raised in the executable section of the inner block and no corresponding exception handler exists, the PL/SQL block **terminates with failure** and the exception is **propagated to an enclosing block (parent block)**.

  - The inner block terminates unsuccessfully and PL/SQL **passes (propagates)** the exception to the <u>outer block</u>.
  - If a PL/SQL raises an exception and the **current block does not have a handler** for that exception, the exception **propagates to successive enclosing blocks** until it finds a handler. 逐层抛出

- When the exception propagates to an enclosing block, the **remaining executable actions** in that block are **bypassed**. 如果异常传递到外层,则直奔外层的 exception 部分而不会执行剩余的可执行代码.

- One advantage of this behavior is that you can enclose statements that require their own **exclusive error handling** in their own block, while **leaving more general exception handling** (for example WHEN OTHERS) to the enclosing block. 内层处理特殊,外层处理一般性.

---

## Scope of Exception Names

- Predefined Oracle server exceptions, such as `NO_DATA_FOUND`, `TOO_MANY_ROWS`, and `OTHERS` are not declared by the programmer.

  - They can be raised in any block and handled **in any block**.

- User-named exceptions (`non-predefined Oracle server exceptions` and `user-defined exceptions`) are declared by the programmer as variables of type `EXCEPTION`. 注意,只要是有名的都服从 scoping rules
- - They follow the same **scoping rules** as other variables.

- A user-named exception declared within an inner block cannot be referenced in the exception section of an outer block.内层命名的异常不能被外层使用.
  - To avoid this, always declare user-named exceptions in the outermost block.

### Example: 经典错误

```sql
-- 经典错误
-- 抛出异常e_myexcep到外层, 但外层没有定义e_myexcep,所以不会处理异常.

-- BEGIN
--     DECLARE
--         e_myexcep EXCEPTION;     --内层命名的异常
--     BEGIN
--         RAISE e_myexcep;
--         dbms_output.put_line('Message 1');
--     EXCEPTION
--         WHEN too_many_rows THEN
--             dbms_output.put_line('Message 2');
--     END;
--     dbms_output.put_line('Message 3');
-- EXCEPTION
--     WHEN e_myexcep THEN --identifier 'E_MYEXCEP' must be declared
--         dbms_output.put_line('Message 4');
-- END;
-- 修正
DECLARE
    e_myexcep EXCEPTION;        --外层命名的异常
BEGIN
    BEGIN
        RAISE e_myexcep;
        dbms_output.put_line('Message 1');
    EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('Message 2');
    END;
    dbms_output.put_line('Message 3');
EXCEPTION
    WHEN e_myexcep THEN
        dbms_output.put_line('Message 4'); --Message 4
END;

```

---

## Propagating Unhandled Exceptions to the Calling Environment

- 如果没有 handler,传递到外层, 直到调用环境.

- If a raised exception is not handled in a block, the **block is exited** with the exception still raised.
- If there is an enclosing block for the current block, the exception is **passed on to that block**. The enclosing block then becomes the current block. If a handler for the raised exception is not found, the process repeats.
- If no handler is found in any block, the **calling environment**, for example Application Express, must then try to handle the exception.

- always include a `WHEN OTHERS` handler in the outermost block.避免因 application 未处理的异常而造成应用 fails.

### Example: 抛出到 Oracle 环境

```sql

-- 由于没有handler, 会抛出到Oracle 环境
DECLARE
    e_myexcep EXCEPTION;
BEGIN
    BEGIN
        RAISE e_myexcep;
        dbms_output.put_line('Message 1');
    EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('Message 2');
    END;
    dbms_output.put_line('Message 3');
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Message 4');
END;

```

---

[TOP](#scope-of-exception)
