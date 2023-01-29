# Transaction

[Back](../index.md)

- [Transaction](#transaction)
  - [Transaction 事务](#transaction-事务)
  - [Transaction processing](#transaction-processing)
  - [COMMIT & ROLLBACK](#commit--rollback)
    - [Automatic COMMIT and ROLLBACK](#automatic-commit-and-rollback)
  - [SAVEPOINT](#savepoint)

---

## Transaction 事务

- Transaction
  - **Logical unit of work** consisting of one or more SQL DML commands<br>
    e.g.:`INSERT`, `UPDATE`, `DELETE`
  - All transaction commands must **succeed** or **none can succeed**. 要么所有成功或所有不成功.
  - Transaction results **are not visible to other users** until they are "committed" to the database. 结果直到提交才可见
  - Until a transaction is committed, it can easily be <u>“rolled back” (undone)</u> 提交前可回滚.

---

## Transaction processing

- Transaction processing(事务处理) enables every user **to see a consistent view** of the database. To achieve this, a user cannot view or update data values that are involved in another user’s **uncommitted transactions** because the pending transactions might be rolled back. 保证数据库有一致的视图, 即所有用户都看到相同的数据.因此未提交的事务不能被显示.

- Transaction processing is implemented by **locking data records** that are involved in uncommitted update or delete operations. This prohibits other users from viewing or modifying them. 本质上就是锁定未提交的数据.
  - When the transaction is committed or rolled back, the **locks** on the data record **are released** and the changed data values are available to other users.

---

## COMMIT & ROLLBACK

- `COMMIT` is used to make the database changes permanent.

- `ROLLBACK` is for discarding any changes that were made to the database after the **last `COMMIT`**.

  - If the transaction **fails**, or ends with a `ROLLBACK`, then none of the statements take effect.

- Syntax

```sql
-- some sql commands
COMMIT;

-- some sql commands
ROLLBACK;

```

- A transaction **starts** when you type one or more <u>DML commands</u>. A transaction **ends** when you issue either the <u>`COMMIT` or `ROLLBACK`</u> command.

- A transaction must either be **committed** or **rolled back**.

  - `COMMIT` saves transactions, `ROLLBACK` reverses the DML commands.

- Execution: 执行过程

  1. When a transaction is _started_, each subsequent DML command is _executed_ and the database is _updated_.
  2. Information is also _recorded to allow the database to return_ to its state as of the last time it was committed
  3. If a `COMMIT` is issued, all DML statements issued in the transaction will be _saved_ and the _changes become permanent_.
  4. If a `ROLLBACK` is issued, all DML statements issued in the transaction will be _undone_, _the changes discarded_, and the data is _returned to its last committed state_. 回滚即回到上一次提交的状态. 本次提交会被丢弃.

- 注意: transaction 中的语句都会被执行,都可以返回执行结果. 一旦回滚,则本次执行的 transaction 的执行结果都会被丢弃,数据恢复到上一次提交.

### Automatic COMMIT and ROLLBACK

- An **automatic commit** occurs under the following circumstances: 自动提交

  - DDL statement is issued 数据定义语言, 如 cmd 表
  - DCL statement is issued (Data Control Language - these are related to user permissions) 数据操纵功能,如 cmd 行
  - Normal exit from SQL DEVLOPER, you will be prompted to `COMMIT` or `ROLLBACK` any changes, without explicitly issuing `COMMIT` or `ROLLBACK` 离开客户端时

- An automatic rollback occurs under the following circumstances:
  - An abnormal termination of SQL Developer 非正常终止客户端
  - A system failure 系统失败

---

## SAVEPOINT

- `SAVEPOINT` is used to mark an **intermediate point** in transaction processing.
- `ROLLBACK` is used to return the data values to the point of a `SAVEPOINT`.

- Syntax:

```SQL
-- SQL commands

SAVEPOINT savepoint_name;

-- Rollback to specified savepoint
ROLLBACK TO SAVEPOINT savepoint_name

```

- 区分:
  - `ROLLBACK TO SAVEPOINT`: 回滚到指定保存点
  - `ROLLBACK`: 回滚到上一次提交

---

[Top](#transaction)

[Back](../index.md)
