[Back](../index.md)

# CONSTRAINT INFO

[TOC]

---

## With Data Dictionary

- In the **data dictionary**, Oracle stores information about constraints

- The **data dictionary** also includes information about objects such as tables, and information about users on the system. e.g.:`user_tables`

- The `USER_CONSTRAINTS` view will contain a list of all constraints that exist for your tables.<br>

System defined names begin with `SYS_C`.

- Syntax:

```SQL

SELECT constraint_name
FROM user_constraints;

```

- 返回的constraint_type列中是缩写
    - P – primary key
    - C – check or not null constraints
    - U – unique constraints
    - R – foreign key constraints (R stands for referential integrity, exhibited by foreign keys)


---

## With SQL Developer

- Notice the NOT NULL constraints appear as CHECK constraints with a SEARCH_CONDITION that IS NOT NULL<br>NOT NULL 被认为是特殊的CHECK被划归为CHECK

[TOP](#constraint-info)
