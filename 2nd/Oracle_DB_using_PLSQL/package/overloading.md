# Overloading Subprograms

[back](../index.md)

- [Overloading Subprograms](#overloading-subprograms)
  - [Overloading](#overloading)
  - [Restrictions](#restrictions)
    - [Overloading and the STANDARD Package](#overloading-and-the-standard-package)
  - [Using Forward Declarations](#using-forward-declarations)
  - [Package Initialization Block](#package-initialization-block)
  - [Bodiless Packages](#bodiless-packages)
    - [Invoke a Bodiless Package](#invoke-a-bodiless-package)
  - [Restrictions on Using Package Functions in SQL Statements](#restrictions-on-using-package-functions-in-sql-statements)
  - [Using a Record Structure as a Parameter](#using-a-record-structure-as-a-parameter)
  - [Using a User-defined Type as a Parameter](#using-a-user-defined-type-as-a-parameter)
  - [Using an INDEX BY Table of Records in a Package](#using-an-index-by-table-of-records-in-a-package)

---

## Overloading

- The `overloading` feature: enables to create two or more subprograms with the **same name**, in the **same package**.

  - the **type** or **number** of parameters required varies.

- Oracle will determine which of the overloaded subprograms to use **based on the argument(s)** passed when calling the overloaded subprogram.

- Overloading can be done with subprograms in packages, but **not with stand-alone subprograms**.
  - 包子程序独有的.

---

## Restrictions

- Two subprograms if their formal parameters **differ only in data type** and the different data types are in the **same category** 只是参数类型不同, 但相同类别

  - i.e.: `NUMBER` and `INTEGER` belong to the same category; `VARCHAR2` and `CHAR` belong to the same category

- Two functions that differ **only in return type**, even if the types are in different categories.只是返回类型

- If you use different names for the parameters, then you can invoke the subprograms by using named notation for the parameters.如果只是参数名称不同, 则只能使用名称标记引用

- 编译:

  - 参数完全相同: 不能通过编译

    - `PLS-00305: previous use of 'GET_LAST_NAME' (at line 2) conflicts with this use`

  - 同类型

- 调用:
  - 参数相同类别/返回类型差异: 抛出异常
    - `PLS-00307: too many declarations of '<function_name>' match this call`
  - 参数名称差异而使用位置标记: 抛出相同异常; 使用名称标记则正常.

---

### Overloading and the STANDARD Package

- A package named `STANDARD` defines the PL/SQL environment and built-in functions.
  - Most built-in functions are overloaded.
  - do not prefix `STANDARD` package subprograms with the package name. 无需前置包名
  - if you create your own function with the same name as a STANDARD package function, To call your own function, you need to prefix it with your schema-name. 如果自定义的函数与标准包的函数相同, 则需要前置包名.

---

## Using Forward Declarations

- Block-structured languages (such as PL/SQL) must declare identifiers **before referencing them**. 声明先于引用

- In the package body, a `forward declaration` is a **private subprogram specification** terminated by a semicolon.

  - The `formal parameters` must appear in both the `forward declaration` and the `subprogram body`.
  - The `subprogram body` can appear anywhere **after** the `forward declaration`, but both must appear in the **same package body**.

- 对于公共对象, 由于已经在规范中声明, 则在包体中可以任意顺序定义;
- 对于私有对象, 则需要声明先于引用.

  - 解决方法: 将可能引用到的私有对象单独在包体顶部声明.
  - `PROCEDURE calc_rating (...); `

- 作用:
  - Define subprograms in logical or alphabetical order 解决定义和引用顺序的问题
  - Define mutually recursive subprograms 互递归.
    - Mutually recursive programs are programs that call each other directly or indirectly.
  - Group and logically organize subprograms in a package body.

---

## Package Initialization Block

- the code block that is automatically executed every time when a package is first called in a session
  - the unnamed block at the end of the **package body** to initialize public and private package variables.

```sql
CREATE OR REPLACE PACKAGE taxes_pkg IS
    g_tax NUMBER;
-- declare all public procedures/functions
END taxes_pkg;

CREATE OR REPLACE PACKAGE BODY taxes_pkg IS
    -- declare all private variables
    -- define public/private procedures/functions
BEGIN -- unnamed initialization block
  SELECT rate_value INTO g_tax
  FROM tax_rates
  WHERE rate_name = 'TAX';
END taxes_pkg;
```

- 注意: 匿名块没有自己的 end, 是以包体的 end 结束.
- 如果一个公共变量声明已赋值, 则该匿名块会 overwriten 其值.

---

## Bodiless Packages

- `bodiless package`: a package has a specification but no body

- a `bodiless package` cannot contain any executable code: no procedures or
  functions. - It can contain **public (global) variables**

- `Bodiless packages` are often used to give **standardized names to unchanging constants**, or to give names to **non-predefined Oracle Server exceptions**. 用于命名常量和异常.

- Users must have prelivige over bodiless package when calling it.
  - i.e.: `GRANT EXECUTE ON global_consts TO PUBLIC`;

### Invoke a Bodiless Package

- 包名.变量名

```sql
-- bodiless package

CREATE OR REPLACE PACKAGE lab_bodiless_pkg IS
    c_pi CONSTANT NUMBER( 3, 2 ) :=3.14;
END;
/

DECLARE
    v_radius NUMBER :=2;
BEGIN
    dbms_output.put_line('Area: '||v_radius*v_radius*lab_bodiless_pkg.c_pi);
END;

```

---

## Restrictions on Using Package Functions in SQL Statements

- Package functions, like standalone functions, can be used in SQL statements and they must follow the same rules. 包函数可以在 SQL 中引用

- Functions called from:
  - A query or DML statement must **not end the current transaction, create or roll back to a savepoint, or alter the system or session**. 不能涉及 TC
  - A query or a parallelized DML statement **cannot execute a DML statement or modify** the database.不能查-修或修-修
  - A DML statement **cannot read or modify the table being changed by that DML statement**.不能同时修-查相同或修-修相同
  - Note: A function calling subprograms that break the preceding restrictions is not allowed.函数中包含的存储过程也需要遵守.

---

## Using a Record Structure as a Parameter

```sql
CREATE OR REPLACE PROCEDURE lab_select_one_emp(
    p_emp_id IN employees.employee_id%type
  , p_rec_emp OUT employees%rowtype
) IS
BEGIN
    SELECT * INTO p_rec_emp
    FROM employees
    WHERE employee_id = p_emp_id;
EXCEPTION
    WHEN no_data_found THEN
        p_rec_emp.last_name:='No Data';
END;
/

DECLARE
    v_rec_emp employees%rowtype;
BEGIN
    lab_select_one_emp(100, v_rec_emp);
    dbms_output.put_line(v_rec_emp.last_name); --King
END;
```

---

## Using a User-defined Type as a Parameter

- Types must be declared before you can use them. 声明先行

- must create a package. 因为 stand alone 的函数或存储过程中的参数类型不能先行声明,所以需要使用包.
  - declare the type **in the specification**, before declaring any procedures or functions which have parameters of that type.

```sql
-- procedure_parameter_record

CREATE OR REPLACE PACKAGE lab_type_pkg IS
    TYPE e_type IS
        RECORD ( first_name employees.first_name%type, department_name departments.department_name%type );
    PROCEDURE get_emp_dept (
        p_emp_id IN employees.employee_id%type
      , p_emp_dept_rec OUT e_type
    );
END;
/

CREATE OR REPLACE PACKAGE BODY lab_type_pkg IS
    PROCEDURE get_emp_dept (
        p_emp_id IN employees.employee_id%type
      , p_emp_dept_rec OUT e_type
    )IS
    BEGIN
        SELECT e.first_name
          , d.department_name INTO p_emp_dept_rec
        FROM employees   e
            JOIN departments d
            ON e.department_id = d.department_id
        WHERE e.employee_id = p_emp_id;
    END;
END;
/

DECLARE
    v_type_emp_dept lab_type_pkg.e_type;
BEGIN
    lab_type_pkg.get_emp_dept(100, v_type_emp_dept);
    dbms_output.put_line(v_type_emp_dept.first_name||' '||v_type_emp_dept.department_name);--Steven Executive
END;

```

---

## Using an INDEX BY Table of Records in a Package

- `INDEX BY table` can be declared in a package specification.

```sql
-- procedure_parameter_index_by_table

CREATE OR REPLACE PACKAGE lab_emp_index_tb_pkg IS
    TYPE emprec_type IS
        TABLE OF employees%rowtype INDEX BY BINARY_INTEGER;
    PROCEDURE get_emp(
        p_emp_table OUT emprec_type
    );
END;
/

CREATE OR REPLACE PACKAGE BODY lab_emp_index_tb_pkg IS
    PROCEDURE get_emp(
        p_emp_table OUT emprec_type
    ) IS
    BEGIN
        FOR rec_emp IN (
            SELECT *
            FROM employees
        ) LOOP
            p_emp_table(rec_emp.employee_id) := rec_emp;
        END LOOP;
    END;
END;
/

DECLARE
    v_index_emp lab_emp_index_tb_pkg.emprec_type;
BEGIN
    lab_emp_index_tb_pkg.get_emp(v_index_emp);
    FOR i IN v_index_emp.first..v_index_emp.last LOOP
        IF v_index_emp.EXISTS(i) THEN
            dbms_output.put_line(v_index_emp(i).last_name);
        END IF;
    END LOOP;
END;

```

---

[TOP](#overloading-subprograms)
