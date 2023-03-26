# Oracle Object Privileges

[back](../index.md)

- [Oracle Object Privileges](#oracle-object-privileges)
  - [Object Privilege](#object-privilege)
  - [Grantable Privilege Set](#grantable-privilege-set)
    - [Grant Object Privileges](#grant-object-privileges)
    - [Revoking Object Privileges](#revoking-object-privileges)
  - [Privilege on the Subprogram](#privilege-on-the-subprogram)
  - [Definer’s Rights](#definers-rights)
  - [Invoker’s Rights](#invokers-rights)

---

## Object Privilege

- `object privilege`: allows the use of a specific database object, such as a table, a view, or a PL/SQL procedure, by one or more database users.

- When a database object is first **created**, only its **owner** (creator) and the **Database Administrator** are privileged to use it.

- Privileges for all **other users** must be **specifically granted** (and maybe later revoked).
  - This can be done by the object’s **owner** or by the **DBA**.

## Grantable Privilege Set

| Object Privilege | Table | View | Sequence | Subprogram |
| ---------------- | ----- | ---- | -------- | ---------- |
| `EXECUTE`        |       |      |          | X          |
| `ALTER`          | X     |      | X        |            |
| `INDEX`          | X     |      |          |            |
| `REFERENCES`     | X     | X    |          |            |
| `SELECT`         | X     | X    | X        |            |
| `INSERT`         | X     | X    |          |            |
| `UPDATE`         | X     | X    |          |            |
| `DELETE`         | X     | X    |          |            |

- `SELECT`, `INSERT`, `UPDATE`, and `DELETE` privileges allow the holder (the grantee 受让人) of the privilege to **use the corresponding SQL statement** on the object. 受让人可以执行相应的语句

| Object Privilege | Statement                     |
| ---------------- | ----------------------------- |
| `EXECUTE`        |                               |
| `ALTER`          | `ALTER` the table             |
| `INDEX`          | create indexes on the table   |
| `REFERENCES`     | using foreign key constraints |
| `SELECT`         | Query                         |
| `INSERT`         | `INSERT` rows into table      |
| `UPDATE`         | `UPDATE` rows table           |
| `DELETE`         | `DELETE` rows table           |

---

### Grant Object Privileges

- Syntax:

```sql
GRANT object_priv [(columns)]
ON object
TO {user|role|PUBLIC}
[WITH GRANT OPTION];
```

| Syntax              | Definition                                                  |
| ------------------- | ----------------------------------------------------------- |
| `object_priv`       | The privilege to be granted.                                |
| `columns`           | Limits UPDATE privilege to a specific column (optional).    |
| `object`            | The object name on which the privilege(s) are granted.      |
| `user`,`role`       | Identifies the user/roles to whom the privilege is granted. |
| `PUBLIC`            | Grants the named privilege(s) to all users.                 |
| `WITH GRANT OPTION` | Allows grantee to grant object privileges to others         |

---

### Revoking Object Privileges

- Syntax:

```sql
REVOKE object_priv [(columns)]
ON object
FROM {user|role|PUBLIC};
```

---

## Privilege on the Subprogram

- To invoke and execute a PL/SQL subprogram, the user must be granted EXECUTE privilege on the subprogram.

- Example:

```sql
CREATE OR REPLACE PROCEDURE add_dept ... ;  --create procedure
CREATE OR REPLACE FUNCTION get_sal ... ;    --create function

GRANT EXECUTE ON add_dept TO TOM, SUSAN;    --grant execute privilege to users
GRANT EXECUTE ON get_sal TO PUBLIC;         --grant execute privilege to all users

REVOKE EXECUTE ON get_sal FROM PUBLIC;      --revoke execute privilege to all users

```

|                                      | Definer’s Rights | Invoker’s Rights |
| ------------------------------------ | ---------------- | ---------------- |
| Definer's right on referenced object | X                |                  |
| Invoker's right on referenced object |                  | X                |
| Invoker's right to invoke            | X                | X                |

---

## Definer’s Rights

- `Definer’s Rights`: The subprogram executes in the user’s database session, but with the privileges and table names of the definer.在当前用户的 session 中使用子程序定义者的权限和表

  - `Definer`: the owner (usually the creator) of the PL/SQL subprogram

  - The **owner’s privileges** are checked <u>when the subprogram is created or replaced</u>, and also every time <u>the subprogram is invoked</u>.
    即子程序涉及的数据对象的权限, 在创建,修改,和调用时都会被检查.
    包括 join 中的表

  - 所以需要使用的场景:When Definer’s Rights are used (the default):

    - The definer needs **privileges on the database objects referenced** within the subprogram.
    - The invoker only needs `EXECUTE` privilege on the subprogram.

- A grantee of a function/procedure does **NOT need any privileges on the objects** referenced by SQL statements within the subprogram.

- ` GRANT CREATE PROCEDURE TO hannah;`: gran the previlige to create procedures and functions.

- Example: 全部的授权过程

  ```sql
  -- (DBA) 授权可以create procedure
  GRANT CREATE PROCEDURE TO TOM;

  -- Table owner or DBA, grant insert privilege to TOM on the table, before Tom creates the produre.
   GRANT INSERT ON departments TO TOM;

  -- Tom creates a procedure
  CREATE OR REPLACE PROCEDURE add_dept
  IS
  BEGIN
      INSERT INTO DEPARTMENTS ... ;
  END;

  -- Tom grant execure privilege to susan on the procedure
  GRANT EXECUTE ON add_dept TO SUSAN;

  -- As a result, Susan does not have the privilege on table, but can insert data into table view procedure, due to definer rights(TOM's privilege).
  ```

- Example: 授权下,子程序默认的调用对象

  ```sql
  -- Tom 和 Sue同时在各自的schema中有tests表
  CREATE TABLE tests ... ;  -- Tom
  CREATE TABLE tests ... ;  -- Sue

  -- Tom create a procedure
  CREATE OR REPLACE PROCEDURE grades
  IS
  BEGIN
    SELECT ... FROM tests ... ;
  END;

  --Tom 授权 sue
  GRANT EXECUTE ON grades TO sue;

  --Sue 调用
  BEGIN
    tom.grades(...);
  END;

  -- 效果, 由于definer'right, 默认调用TOM的tests表.
  ```

- Example: 使用 Synonym

  ```sql
  -- Larry
  create table employees();
  -- Sveta
  create table employees();

  -- Larry
  GRANT SELECT ON employees TO curly;
  -- Sveta
  GRANT SELECT ON employees TO curly;

  -- Curly create synonym
  CREATE SYNONYM employees FOR sveta.employees;
  -- Curly
  CREATE FUNCTION get_emp
  BEGIN
      SELECT ... FROM employees;
  END;

  --Curly
  GRANT EXECUTE ON get_emp TO larry, sveta;

  -- Larry
  BEGIN
      v_result := curly.get_emp;
  END;

  -- 授权过程:
  -- L, S 授权SELECT C
  -- C 创建同名, employees指向S的表
  -- C 创建函数, 并使用employees表
  -- C 授权L, S调用函数
  -- L 调用函数,
  -- 效果: 因为C是函数函数创建者,C对L, S的表有select权限;
  -- 但由于synonym指向S的表, 所以只会select S的表

  ```

---

## Invoker’s Rights

- `Invoker’s Rights`: 效果: The subprogram executes in the **user’s** database session, with the **user’s** privileges, table references, and synonyms.在当前用户的 session 中使用用户自己的权限和表

- `Invoker`: the user who calls (invokes) the subprogram.

- When `Invoker’s Rights` are used: 使用场景:

  - The invoker needs **privileges on the database objects** referenced within the subprogram, as well as **`EXECUTE` privilege** on the procedure
  - The definer does **not need any privileges**.

- `AUTHID to CURRENT_USER`: Using Invoker’s Rights

- Example: Using Invoker’s Rights

  ```sql
  -- Tom>
  CREATE OR REPLACE FUNCTION grades (p_name IN VARCHAR2)
      RETURN NUMBER
      AUTHID CURRENT_USER  -- Using Invoker’s Rights
  IS
      v_score NUMBER;
  BEGIN
      SELECT score INTO v_score FROM tests
      WHERE key=p_name;
      RETURN v_score;
  END;

  -- Now the user’s privileges and table references (including synonyms) are checked at execution time.

  ```

- Example:声明使用当前用户权限下,子程序的调用对象

  ```sql
  -- Tom>
  CREATE TABLE tests ... ;
  -- Sue>
  CREATE TABLE tests ... ;

  -- Tom>
  CREATE OR REPLACE PROCEDURE grades
      AUTHID CURRENT_USER
  IS
  BEGIN
      SELECT ... FROM tests ... ;
  END;

  --Tom>
  GRANT EXECUTE ON grades TO sue;

  -- Sue>
  BEGIN
      tom.grades(...);
  END;

  -- 授权过程:
  -- 各自有表
  -- Tom创建存储过程, 但声明使用当前用户的权限
  -- Tom授权使用存储过程
  -- Sue调用
  -- 效果: 由于声明使用用户的权限,所以使用的是Sue的表

  ```

- Example: 声明使用当前用户权限下, 指定使用某一表

  ```sql
  -- Bill>
  CREATE TABLE tests ... ;

  -- Bill>
  CREATE OR REPLACE PROCEDURE grades
      AUTHID CURRENT_USER
  IS
  BEGIN
      SELECT ... FROM bill.tests ... ; --注意, 该处指明使用bill自己的表
  END;

  -- Eylem>
  BEGIN
      bill.grades(...);
  END;

  -- 授权过程:
  -- bill有表
  -- bill创建存储过程, 并声明使用自己的表
  -- Eylem调用
  -- 效果: 由于指明使用自己的表,所以会调用bill的表
  -- 注意, schema>autid current_user
  ```

- Example:

```sql
  -- Larry
  create table employees();
  -- Sveta
  create table employees();

  -- Larry
  GRANT SELECT ON employees TO curly;
  -- Sveta
  GRANT SELECT ON employees TO curly;

  -- Curly create synonym
  CREATE SYNONYM employees FOR sveta.employees;
  -- Curly
  CREATE FUNCTION get_emp
    AUTHID CURRENT_USER     --声明使用当前用户权限
  IS
  BEGIN
      SELECT ... FROM employees;
  END;

  --Curly
  GRANT EXECUTE ON get_emp TO larry, sveta;

  -- Larry
  BEGIN
      v_result := curly.get_emp;
  END;

  -- 授权过程:
  -- L, S 授权SELECT C
  -- C 创建同名, employees指向S的表
  -- C 创建函数, 声明使用当前用户权限
  -- C 授权L, S调用函数
  -- L 调用函数,
  -- 效果: 由于声明使用了当前用户权限,使用的是L的权限,但L没有使用S的权限,只有使用自己表的权限.所以是调用L的表.

```

- Example: 添加调用者的相应权限

  ```sql
  -- Paul>
  CREATE TABLE departments ... ;

  -- Paul>
  CREATE OR REPLACE PROCEDURE add_dept
      AUTHID CURRENT_USER IS
  BEGIN
    INSERT INTO paul.departments ...;     --声明使用调用者权限
  END;

  -- Paul>
  GRANT EXECUTE ON add_dept TO hakan;
  GRANT INSERT ON departments TO hakan;   --授权调用有插入权限.

  -- Hakan>
  BEGIN
      paul.add_dept(...);
  END;

  ```

---

[TOP](#object-privileges)
