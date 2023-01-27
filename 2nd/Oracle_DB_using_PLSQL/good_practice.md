# PL/SQL Good Practise

[back](./index.md)

- [PL/SQL Good Practise](#plsql-good-practise)
  - [Good Practise](#good-practise)
  - [Comment](#comment)
  - [Case Convention](#case-convention)
  - [Naming Conventions](#naming-conventions)
  - [Indenting Code](#indenting-code)

---

## Good Practise

- Identifier:

  - Use **meaningful** identifiers when declaring variables, constants, and parameters.
  - Avoid **ambiguity** when choosing identifiers.
  - Developing naming conventions for identifiers and other objects 命名约定

- Declaration :

  - **Declare** one variable or constant identifier **per line** for better readability and code maintenance.
  - Use the `%TYPE` attribute to **declare** a variable according to another **previously declared** variable or database column.
  - Use the `NOT NULL` constraint when declaring a variable that must hold a value.

- Data type

  - Use **explicit data type conversions** because implicit data type conversions can be <u>slower</u> and the <u>rules can change</u> in later software releases.

- Other programming guidelines:
  - Documenting code with **comments**
  - Developing a **case convention** for the code 大小写约定
  - Enhancing readability by indenting 缩进

---

## Comment

- Comment: what the original programmer **intended** by the code written.

  - They are ignored when code is compiled.

- Prefix single-line comments with two dashes (`--`).
- Place multiple-line comments between the symbols `/*` and `*/` .

---

## Case Convention

| Category                      | Case Convention | Examples                                          |
| ----------------------------- | --------------- | ------------------------------------------------- |
| SQL keywords                  | Uppercase       | `SELECT`, `INSERT`                                |
| PL/SQL keywords               | Uppercase       | `DECLARE`, `BEGIN`, `IF`                          |
| Data types                    | Uppercase       | `VARCHAR2`, `BOOLEAN`                             |
| Identifiers (variables, etc.) | Lowercase       | `v_salary`, `emp_cursor`, `c_tax_rate`, `p_empno` |
| Tables and columns            | Lowercase       | `employees`, `dept_id`, `salary`, `hire_date`     |

---

## Naming Conventions

- The naming of identifiers should be <u>clear, consistent,and unambiguous</u>.

  - Variables starting with v\_
  - Constants starting with c\_
  - Parameters starting with p\_ (for passing to procedures and functions)

---

## Indenting Code

- For clarity, indent each level of code.缩进每层

---

[TOP](#plsql-good-practise)
