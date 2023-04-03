# PL/SQL Packages

[Back](../index.md)

- [PL/SQL Packages](#plsql-packages)
  - [Package](#package)
    - [Components of a PL/SQL Package](#components-of-a-plsql-package)
    - [Visibility of Package Components:](#visibility-of-package-components)
    - [Guidelines](#guidelines)
  - [Package Specification](#package-specification)
  - [Package Body](#package-body)
  - [Describe a Package](#describe-a-package)
  - [Invoke Package Subprograms](#invoke-package-subprograms)
  - [Removing Packages](#removing-packages)
  - [List Packages](#list-packages)
  - [Source Code](#source-code)
  - [Compile Error](#compile-error)

---

## Package

- `Package`: containers (schema objects) that enable you to logically group together related PL/SQL subprograms, variables, cursors, and exceptions.

  - Packages **encapsulate** logically related types, items, and subprograms in a named module.

- Components of a PL/SQL Package

  - `Package specification`: The interface to your applications.

    - It must be created first.
    - It declares the constructs (procedures, functions, variables, and so on) that are **visible to the calling environment**. 可见的,只能在 specification

  - `Package body`: contains the **executable code of the subprograms** that were declared in the package specification.

    - It can also contain its own variable declarations
    - The detailed package body code is **invisible** to the calling environment, which can see **only the specification**.具体代码不可见

- If changes to the code are needed, the body can be edited and recompiled without having to edit or recompile the specification. 可以不修改和重新编译 specification 下修改具体代码.

- `Encapsulation`: a modular programming principle.

  - A two-part structure in which the detailed package body code is invisible to the calling environment, which can only see the specification.
  - If changes to the code are needed, the body can be edited and recompileed without having to edit or recompile the specification.

  - To invoke a subprogram, developers need to know only how to call it, but not know how package code works internally.

- Advantages:
  - **Modularity**: Related programs and variables can be grouped together.
  - **Hiding information**: Only the declarations in the package specification are visible to invokers.
    - Only the declarations in the package specification are visible and accessible to applications.
    - Private constructs in the package body are hidden and inaccessible.
    - All coding is hidden in the package body
  - **Easier maintenance**: You can change and recompile the package body code without having to recompile the specification. Therefore, applications that already use the package do not need to be recompiled.
  - **Easier application design**: Coding and compiling the specification and body separately.
  - **Added functionality**: Persistency of variables and cursors
  - **Better performance**:
    - The entire package is **loaded into memory** when the package is first referenced.
    - There is only **one copy** in memory for all users.
    - The **dependency hierarchy** is simplified.
  - **Overloading**: Multiple subprograms having the same name.

---

### Components of a PL/SQL Package

- **Components**: either public or private.

  - can be procedures, functions, variables, constants, cursors, and exceptions.

- **Public components** are declared in the `package specification`.

  - can invoke public components **from any calling environment**, provided the user/schema has been granted `EXECUTE` **privilege** on the package

- **Private components** are declared **only** in the `package body` and can be **referenced** only by other (public or private) constructs **within the same package body**.

  - `Private components` can reference the package’s `public components`.私有可以引用公有, 但不能被外部引用.
  - External programs can only use private components called from a caling public subprogram indirectly. 间接

---

### Visibility of Package Components:

- whether that component can be seen, that is, referenced and used by other components or objects.
- depends on **where they are declared**

  - **Globally** in the `package specification`: these components are visible throughout the package body and by the calling environment
  - **Locally** in the `package body`, but **outside** any subprogram, these components are visible throughout the package body, but not by the calling environment
  - **Locally** in the package body, **within** a specific subprogram, these components are visible only within that subprogram.

- All public components are global; All private components are local.

  | Declaration             | Visibility | Calling Evinronment | package body | Subprogram |
  | ----------------------- | ---------- | ------------------- | ------------ | ---------- |
  | `package specification` | Globally   | Yes                 | Yes          | Yes        |
  | `package body`          | Locally    | No                  | Yes          | Yes        |
  | `subprogram`            | Locally    | No                  | No           | Yes        |

- 惯例:

  - public/private: procedures and functions
  - global/local: variables, constants, and cursors.

- 注意: 声明的顺序很重要
  - 在包体内, 如果一个变量在存储过程 A 后,但在存储过程 B 前声明, 则只能被 B 使用,不能在 A 使用. 因为在存储过程中引用变量时, 该变量需要先行声明.

---

### Guidelines

- Create the `package specification` **before** the `body`

- Only recompile the package body, if possible, because changes to the package specification require recompilation of all programs that call the package.

- The package specification should contain **only** those constructs that you want to be public/global.
  - The package specification should contain as few constructs as possible.

---

## Package Specification

- declares all public constructs
  - declared in a package specification are **visible to users** granted `EXECUTE` privilege one the package.
  - **Public** means that the package construct (variable, procedure, function, and so on) can be seen and executed from **outside** the package.
  - All constructs declared in the package specification are **automatically public constructs**.

```sql
CREATE [OR REPLACE] PACKAGE package_name
IS|AS
-- public type and variable declarations
-- public subprogram specifications
END [package_name];
```

- The `OR REPLACE` option drops and re-creates the package specification.
- `package_name`:

  - Specifies a name for the package that must be **unique** among objects **within the owning schema**.
  - Including the package name after the `END` keyword is **optional**.

- public type and variable declarations:

  - Declares **public** `variables`, `constants`, `cursors`, `exceptions`, `user-defined types`, and `subtypes`.
  - `Variables` declared in the package specification are initialized to **`NULL` by default**.

- public subprogram specifications:

  - Declares the public `procedures` and/or `functions` in the package.
  - For all public `procedures` and `functions`, the package specification should contain the **subprogram name** and **associated parameters** terminated by a **semicolon** (not the actual code of the subprogram).只需要存储过程和函数名和形参.

- the `specification` **can exist** without the `body` but the `body` **cannot exist** without the `specification`.
  - advantage: do not need to recompile any applications because the specification is not recompiled.

---

## Package Body

- contain the detailed code for all the subprograms declared in the specification.
  - implement a procedure or function that is declared in a package specification

```sql
CREATE [OR REPLACE] PACKAGE BODY package_name IS|AS
-- private type and variable declarations
-- subprogram bodies
[BEGIN initialization statements]
END [package_name];
```

- The `OR REPLACE` option: to overwrite an existing package body.

- `package_name`: specifies a name for the package body that must be the **same as its package specification**.

  - Using the package name after the `END` keyword is **optional**.

- subprogram bodies:

  - **must** contain the code of all the <u>subprograms declared in the package specification</u> and the <u>code for all private subprograms</u>.
  - Private subprogram may only be called by other subprograms within the package.
  - appropriate subprograms order:
    - declare a variable or subprogram before it can be referenced by other components in the same package body.

- Change the Package Body Code
  - **must** edit and recompile the `package body`, but you do **not need** to recompile the `specification` **unless the name or parameters have changed**.

---

## Describe a Package

- can describe the subprograms of the whole package
- cannot `DESCRIBE` **individual** packaged subprograms

```sql
DESCRIBE <package>
```

---

## Invoke Package Subprograms

- After the package is stored in the database, can invoke subprograms **stored within the same package** or **stored in another package**.

  - Within the same package: 同包引用:1.存储过程名;2.包名.存储过程名

    - Specify the subprogram name: `Subprogram;`
    - fully qualify a subprogram within the same package, but this is **optional**: `package_name.subprogram;`

  - External to the package: 异包引用: 包名.存储过程名
    - Fully qualify the (public) subprogram with its package name: `package_name.subprogram;`

- 常考:
  - 匿名块引用时,
    - 全称+公有
      - 否则: `PLS-00201: identifier 'ADD_NUM' must be declared`
    - 常见错误: 短称; 私有函数/变量

---

## Removing Packages

- To remove the entire package, specification and body

  - cannot remove the package specification on its own.不能单独删除包规范

  - `DROP PACKAGE package_name;`

- To remove only the package body 可以只删除包体

  - `DROP PACKAGE BODY package_name;`

- The package must be **in your own schema** or you must have the **DROP ANY PROCEDURE system privilege**.
  - 权限: 自己的; 授权的

---

## List Packages

- 四种方法:
  - user_objects
  - all_objects
  - user_source
  - all_source

```sql
-- list packages

-- using user_objects
SELECT *
FROM user_objects
WHERE object_type = upper('package');

-- using all_objects
SELECT *
FROM all_objects
WHERE object_type = upper('package')
    AND owner = upper('N01555914');

-- using user_source
SELECT DISTINCT name
FROM user_source
WHERE type = upper('package');

-- using all_source
SELECT *
FROM all_source
WHERE type = upper('package')
    AND owner = upper('N01555914');
```

---

## Source Code

- 两种方法:

  - user_source
  - all_source

- To view the package specification

  ```sql
  -- get source: package specification
  -- using user_source
  SELECT text
  FROM user_source
  WHERE type = upper('package')
      AND name = upper('DEPT_PKG')
  ORDER BY line;

  -- using all_source
  SELECT text
  FROM all_source
  WHERE type = upper('package')
      AND owner = upper('N01555914')
      AND name = upper('DEPT_PKG')
  ORDER BY line;

  ```

- To view the package body

  ```sql

  -- get source: package body
  -- using user_source
  SELECT text
  FROM user_source
  WHERE type = upper('package body')
      AND name = upper('DEPT_PKG')
  ORDER BY line;

  -- using all_source
  SELECT text
  FROM all_source
  WHERE type = upper('package body')
      AND owner = upper('N01555914')
      AND name = upper('DEPT_PKG')
  ORDER BY line;
  ```

- Example: using cursor

  ```sql
  -- using user_source
  DECLARE
      CURSOR cur_text IS
          SELECT text
          FROM user_source
          WHERE type = upper('package')
              AND name = upper('DEPT_PKG');
      v_text user_source.text%type;
  BEGIN
      OPEN cur_text;
      LOOP
          FETCH cur_text INTO v_text;
          EXIT WHEN cur_text%notfound;
          dbms_output.put_line(v_text);
      END LOOP;
      CLOSE cur_text;
  END;
  /
  -- using all_source
  DECLARE
      CURSOR cur_text IS
          SELECT text
          FROM all_source
          WHERE type = upper('package')
              AND name = upper('DEPT_PKG');
      v_text user_source.text%type;
  BEGIN
      OPEN cur_text;
      LOOP
          FETCH cur_text INTO v_text;
          EXIT WHEN cur_text%notfound;
          dbms_output.put_line(v_text);
      END LOOP;
      CLOSE cur_text;
  END;
  ```

---

## Compile Error

- When a PL/SQL subprogram fails to compile, Application, Express displays the error number and message text for the **FIRST error**.
- `USER_ERRORS` contains the most **recent compiler errors** for all subprograms in your schema.

```sql
-- return where and error message
SELECT line
  , text
  , position
FROM user_errors
WHERE name = upper('HUMBER')
    AND type = upper('PACKAGE BODY')
ORDER BY sequence;
```

- Example: View Errors and Source Code

```sql
SELECT e.line
  , e.position
  , s.text AS source
  , e.text AS error
FROM user_errors e
    JOIN user_source s
    ON e.name = s.name
    AND e.type = s.type
WHERE e.name = upper('DEPT_PKG')
    AND e.type = upper('PACKAGE BODY')
ORDER BY e.sequence;

```

---

[TOP](#plsql-packages)
