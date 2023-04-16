# PLSQL - Remote Dependency

[Back](../index.md)

- [PLSQL - Remote Dependency](#plsql---remote-dependency)
  - [Remote Dependency](#remote-dependency)
  - [Change the Dependency Mode](#change-the-dependency-mode)
  - [Timestamp Mode](#timestamp-mode)
    - [Disadvantage of Timestamp Mode](#disadvantage-of-timestamp-mode)
  - [Signature Mode](#signature-mode)

---

## Remote Dependency

- `remote dependency`:

  - the dependency when the referenced and dependent objects are **in two different databases**.

- When a referenced object and a dependent object are **in the same database**, the `Oracle server` **automatically records their dependency** in the Data Dictionary.

- The `Oracle server` **does not automatically track** relationships (such as dependencies) between objects in two different databases, **even when the two databases are on the same server machine**.

  - This is because each database has its own separate and independent data dictionary.

- If the `remote procedure` is (directly or indirectly) **invalidated**, the server **cannot automatically invalidate** the local procedure because there is **no reference to the local procedure** within the remote data dictionary.

- However, the `local procedure` can (and will) be invalidated when it invokes (calls) the remote procedure; in other words, **at execution time**.

- Ways to track remote dependency:
  - `TIMESTAMP` mode checking (the default)
  - `SIGNATURE` mode checking

---

## Change the Dependency Mode

- alter the dependency mode for the **current session** by using the `ALTER SESSION` command

```sql
ALTER SESSION SET REMOTE_DEPENDENCIES_MODE =
{SIGNATURE | TIMESTAMP}

```

- alter the dependency mode **system-wide** after startup with the `ALTER SYSTEM` command

```sql
ALTER SYSTEM SET REMOTE_DEPENDENCIES_MODE =
{SIGNATURE | TIMESTAMP}
```

---

## Timestamp Mode

- Whenever any database object is **created or modified** (for example when a PL/SQL procedure is recompiled), Oracle automatically records the `timestamp` of the change in the `data dictionary`.

- see these timestamps in the `USER_OBJECTS` dictionary view.

```sql
SELECT object_name
  , TIMESTAMP
FROM user_objects
WHERE object_type = 'PROCEDURE'
ORDER BY TIMESTAMP;
```

- When `local procedure` A is compiled, and it references `remote procedure` B, the `remote procedure`'s timestamp is read and stored within the local procedure, as well as the local procedure's timestamp. 远端时间戳保留到本地.

- 过程: local procedure A| remote procedure B
  - When compiling A, check the validity and timestamp of B across the network.
  - When execute A,
    - check A validity
      - valid: compare local and remote timestamps of B
        - equal: execution successes
        - not equal: execution fails
        - A: invalid
      - invalid: recompile, store new timestamp

---

### Disadvantage of Timestamp Mode

- Did you notice that procedure A was marked invalid and its execution failed because procedure B's local and remote timestamps were not equal?
- This happened even though procedure B hadrecompiled successfully and was valid.
- So remote dependencies sometimes cause **unnecessary failures** and **later recompilations**.
- To avoid this limitation, we can use `Signature Mode`.

---

## Signature Mode

- In `Signature Mode`, a **unique number** called a `signature` is calculated and stored each time a procedure is recompiled.
- The signature of a procedure is calculated from:
  - The **name** of the procedure
  - The **data types** of the parameters
  - The **modes** of the parameters
- So, the signature changes only if the **procedure name** or **parameters** are changed, **not** if a change is made to the **body** of the code.

- The `signature` of the `remote procedure` is saved in the `local procedure`, just like timestamp mode. 存储在本地
- You **cannot view** the signature. It is not stored in USER_OBJECTS or any other Data Dictionary view. 不能查看签名
- Signature mode avoids **unnecessary failures** and **recompilations**, because the signature changes only when the dependent object would have to be **recompiled** anyway. 只在本地依赖项需要编译时才改变.

- `REMOTE_DATABASE_NAME` is a pointer to the remote database called a `database link` 了解即可

  - `remote_func@remote_database_name;`: call remote procedure remote_func

- 过程:
  - 只对比签名, 注意 return 不是签名

---

[TOP](#plsql---remote-dependency)
