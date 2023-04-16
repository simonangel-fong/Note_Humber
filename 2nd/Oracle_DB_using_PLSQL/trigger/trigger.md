# PLSQL - Trigger

[Back](../index.md)

- [PLSQL - Trigger](#plsql---trigger)
  - [Trigger](#trigger)
  - [Comparison of Database Triggers and Stored Procedures](#comparison-of-database-triggers-and-stored-procedures)
  - [Uses for Triggers](#uses-for-triggers)
  - [Guidelines for Triggers](#guidelines-for-triggers)

---

## Trigger

- `Trigger`:

  - Programs to execute a specific action whenever a specific event occurs in an application or in the database.

- `Application Trigger`:

  - Execute automatically whenever a particular event occurs within an application.

- `Database Trigger`:

  - Execute automatically whenever a data event or system event occurs on a schema of database.
  - Is a `PL/SQL block` associated with a **specific action (an event)** such as a successful logon by a user, or an **action** taken on a database object such as a table or view
  - **Executes automatically** whenever the <u>associated action</u> occurs
  - may lead to a database event, but they are not part of the database.
  - stored in the database

- Parameter:

  - cannot receive parameters.

- Advantages:

  - Triggers allow specified actions to be **performed automatically** in the database without having to write any extra front-end application code.

- Events in the database can cause a trigger to fire:

  - Data event:
    - `DML` operations on a `table`
    - `DML` operations on a view, with an `INSTEAD OF` trigger
    - `DDL` statements, such as `CREATE` and `ALTER`
  - System event:
    - a user logs on or the DBA shuts down the database

- Types of Triggers

  - A `row-level trigger` fires **once for each row affected** by the triggering statement
  - A `statement-level trigger` fires **once for the whole statement**.

---

## Comparison of Database Triggers and Stored Procedures

- difference between procedures/functions

  - procedures/functions: have to be invoked explicitly
  - trigger: have to be invoked implicitly

| Triggers                                                | Procedures                                            |
| ------------------------------------------------------- | ----------------------------------------------------- |
| Defined with `CREATE TRIGGER`                           | Defined with `CREATE PROCEDURE`                       |
| Data Dictionary contains source code in `USER_TRIGGERS` | Data Dictionary contains source code in `USER_SOURCE` |
| **Implicitly invoked**                                  | **Explicitly invoked**                                |
| COMMIT, SAVEPOINT, and ROLLBACK are **not allowed**     | COMMIT, SAVEPOINT, and ROLLBACK are allowed           |

---

## Uses for Triggers

- Enhance complex database **security** rules
- Create **auditing records** automatically
- Create **logging records** automatically
- Enforce complex data **integrity rules**
- Prevent tables from being accidentally **dropped**
- Prevent **invalid** DML transactions from occurring
- Generate **derived column** values automatically
- Maintain **synchronous table** replication
- Gather **statistics** on table access
- **Modify table data** when DML statements are issued against views

---

## Guidelines for Triggers

- Do not define triggers to duplicate or replace actions you can do easily in other ways.
  - For example, implement simple data integrity rules using **constraints**, not triggers.
- Excessive use of triggers can result in slower processing and complex interdependencies, which can be difficult to maintain.
- Use triggers only when necessary and be aware of **recursive** (trigger that calls itself) and cascading effects.
- Avoid lengthy trigger logic by creating stored procedures or packaged procedures that are invoked in the trigger body.

---

[TOP](#plsql---trigger)
