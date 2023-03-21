# PLSQL Procedure

[Back](../index.md)

- [PLSQL Procedure](#plsql-procedure)
  - [Procedure](#procedure)
  - [Create a Procedure](#create-a-procedure)
  - [Invoking Procedures](#invoking-procedures)
    - [Invokes another procedure within one procedure](#invokes-another-procedure-within-one-procedure)
    - [Nested subprogram](#nested-subprogram)
  - [Parameters](#parameters)
  - [Parameter Modes](#parameter-modes)
  - [Syntax for Passing Parameters](#syntax-for-passing-parameters)
  - [DEFAULT Option for IN Parameters](#default-option-for-in-parameters)

---

## Procedure

- named PL/SQL block that can accept parameters.
- to perform an action (sometimes called a “side-effect”).
- A procedure is compiled and stored in the database as a schema object.
- Shows up in `USER_OBJECTS` as an object type of `PROCEDURE`
  - More details in `USER_PROCEDURES`
  - Detailed PL/SQL code in `USER_SOURCE`

---

## Create a Procedure

```sql
CREATE [OR REPLACE] PROCEDURE procedure_name
[(parameter1 [mode1] datatype1,
parameter2 [mode2] datatype2,
)]
IS|AS
-- declarative section
[local_variable_declarations; …]
BEGIN
    -- procedure_body;
END [procedure_name];
```

- `OR REPLACE`: to overwrite an existing procedure

- **Compilation**:

  - If compilation errors exist, Application Express displays them in the output portion of the SQL Commands window.
  - You must edit the source code to make corrections.
  - When a subprogram is CREATEd, the **source code is stored** in the database even if compilation e**rrors occurred**. 无论有无 error, 代码都会被记录.
  - After you have corrected the error in the code, you need to recreate the procedure.更正代码后重新创建
  - There are two ways to do this:
  - Use a `CREATE OR REPLACE` PROCEDURE statement to overwrite the existing code (most common).
  - `DROP` the procedure first and then execute the `CREATE PROCEDURE` statement (less common).

- **Saving Your Work**
  - Once a procedure has been created successfully, you should save its definition in case you need to modify the code later.保存在本地.

---

## Invoking Procedures

1. An anonymous block

2. Another procedure

3. A calling application

- Note: You cannot invoke a procedure from inside a SQL statement such as SELECT.

```sql
-- write and run a small anonymous block that invokes the procedure

BEGIN
    procedure_name;
END;

```

### Invokes another procedure within one procedure

- When one procedure invokes another procedure, we would normally create them separately, but we can create them together as a single procedure if we like.可以在当一个存储过程中创建.
- 被调用的存储过程先行创建

```sql
-- create a subprocedure
CREATE OR REPLACE PROCEDURE subproc
    -- sub-procedure statement
END subproc;

-- create a main procedure
CREATE OR REPLACE PROCEDURE mainproc
IS BEGIN
  subproc();
END mainproc;

```

### Nested subprogram

- The nested subprogram's **scope** is limited to the procedure within which it is defined.

```sql
-- outer procedure
CREATE OR REPLACE PROCEDURE mainproc
...
IS
-- nested procedure
    PROCEDURE subproc (...) IS BEGIN
    ...
    END subproc;
BEGIN
...
subproc(...);
...
END mainproc;

```

---

## Parameters

- `Parameters` pass or communicate data between the caller and the subprogram.

  - Parameters act as a special form of a variable, whose input values are **initialized by the calling environment** when the subprogram is called, and whose output values are **returned to the calling environment** when the subprogram returns control to the caller.

  - By convention, parameters are often named with a “p\_” prefix.

  - parameters act like local variables in the procedure
  - `IN` parameters are treated as constants within the subprogram and **cannot be changed** by the subprogram.

- **Types of Parameters**
  - There are two types of parameters: `Formal` and `Actual`.
  - `formal parameter`: variables that are declared in the parameter list of a subprogram specification.
    - Notice that the formal parameter data types do **not have sizes**.
  - `actual parameter`: variables that are sent to the parameter list of a called subprogram.
    - can be **literal values, variables, or expressions**.
  - The formal and actual parameters should be of **compatible data types**.
    - If necessary, before assigning the value, PL/SQL converts the data type of the actual parameter value to that of the formal parameter.先转换, 后传递

```sql
a_emp_id := 100;
raise_sal(a_emp_id, 2000);
-- a_emp_id is actual parameter, 100 is the argument
-- 2000 is both actual parameter and argument

raise_sal(a_emp_id, v_raise + 100);
-- a_emp_id: actual parameter, variable
-- v_raise + 100: actual parameter, expression
-- no argument
```

- **Arguments**

  - `Arguments` are the **actual values** assigned to the parameter variables when the subprogram is called at runtime.
  - call a procedure with parameter, enter the procedure name and parameter values (**arguments**).

---

## Parameter Modes

- **Parameter-passing modes**:

  - An `IN` parameter (the default) provides values for a subprogram to process.
  - An `OUT` parameter **returns a value** to the caller.
  - An `IN OUT` parameter supplies an input value, which can be returned (output) as a modified value.

| IN                                                                               | OUT                                | IN OUT                                                  |
| -------------------------------------------------------------------------------- | ---------------------------------- | ------------------------------------------------------- |
| Default mode                                                                     | Must be specified                  | Must be specified                                       |
| Value is passed into subprogram                                                  | Returned to calling environment    | Passed into subprogram; returned to calling environment |
| Formal parameter acts as a constant                                              | Uninitialized variable             | Initialized variable                                    |
| Actual parameter can be a literal, constant, expression, or initialized variable | Must be a variable                 | Must be a variable                                      |
| Can be assigned a default value                                                  | Cannot be assigned a default value | Cannot be assigned a default value                      |

---

- **IN**

  - default if no mode is specified.
  - can only be read within the procedure
  - cannot be modified.

```sql
-- Procedure: Parameter IN

DROP PROCEDURE lab_show_parameter_in;

CREATE OR REPLACE PROCEDURE lab_show_parameter_in(
    p_message VARCHAR2
) IS
BEGIN
    dbms_output.put_line('Procedure: Parameter IN');
    dbms_output.put_line('Input message: '||p_message);
END;
/

DECLARE
    v_message VARCHAR2(20) :='&v_message';
BEGIN
    lab_show_parameter_in(v_message);
END;
```

---

- **OUT**

  - return values to the calling environment
  - Make sure the `OUT` parameter size

```sql
-- Procedure: Parameter OUT

DROP PROCEDURE lab_show_parameter_out;

CREATE OR REPLACE PROCEDURE lab_show_parameter_out IS
BEGIN
    dbms_output.put_line('Procedure: Parameter OUT');
    dbms_output.put_line('Date: '||to_char(sysdate()));
END;
/

DECLARE
BEGIN
    lab_show_parameter_out;
END;

```

---

- **IN OUT**
  - pass a value into a procedure that can be updated within the procedure.
  - The actual parameter value supplied from the calling environment can **return** as either of the following:
    - The **original unchanged value**
    - A **new value** that is set within the procedure

```sql

-- Procedure: Parameter IN OUT

DROP PROCEDURE lab_show_parameter_in_out;

CREATE OR REPLACE PROCEDURE lab_show_parameter_in_out(
    p_message IN OUT VARCHAR2
) IS
BEGIN
    dbms_output.put_line('Procedure: Parameter IN OUT');
    dbms_output.put_line('Input message: '||p_message);
    p_message := '('||p_message||')';
END;
/

DECLARE
    v_message VARCHAR2(20) :='&v_message';
BEGIN
    lab_show_parameter_in_out(v_message);
    dbms_output.put_line('After procedure: '||v_message);
END;
```

---

## Syntax for Passing Parameters

- Three ways of passing parameters from the calling environment:

  - **Positional**: Lists the actual parameters in the **same order** as the formal parameters (most common method)

  - **Named**: Lists the actual parameters in **arbitrary order** and uses the association operator ( `=>` which is an equal and an arrow together) to associate a named formal parameter with its actual parameter

  - **Combination**: Lists some of the actual parameters as **positional** (no special operator) and some as **named** (with the => operator).
    - Note: All the `positional parameters` should **precede** the `named parameters` in a subprogram call.

```sql
-- Procedure: Parameter Passing

DROP TABLE lab_emp;

CREATE TABLE lab_emp(
  emp_id number
, first_name VARCHAR2(20)
, last_name VARCHAR2(20)
);

DROP SEQUENCE lab_emp_seq;

CREATE SEQUENCE lab_emp_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE lab_insert_emp(
  p_first_name lab_emp.first_name%type
, p_last_name lab_emp.last_name%type
) IS
BEGIN
  INSERT INTO lab_emp VALUES(
    lab_emp_seq.NEXTVAL
  , p_first_name
  , p_last_name
  );
END;
/

DECLARE
BEGIN
 -- positional notation
  lab_insert_emp('Steve', 'Jobs');
 -- named notation
  lab_insert_emp(
    p_last_name=>'Gate'
  , p_first_name=>'Bill'
  );
 -- combination notation
  lab_insert_emp('Elon', p_last_name='Musk');
 -- the combination notation, positional notation parameters must be listed before named notation parameters.
 -- lab_insert_emp('Elon', p_first_name=>'Musk'); -- PLS-00703: multiple instances of named argument in list
  -- lab_insert_emp('Elon'); -- PLS-00306: wrong number or types of arguments in call to 'LAB_INSERT_EMP'
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(sqlerrm);
END;
/

SELECT *
FROM lab_emp;

```

---

## DEFAULT Option for IN Parameters

- The two ways shown use:

  - The assignment operator `:=`
  - The `DEFAULT` keyword option

- cannot assign default values to `OUT` and `IN OUT` parameters in the header, but you can in the body of
  the procedure.

- **cannot skip providing an actual parameter** if there is **no default value** provided for a formal parameter.

-

```sql
CREATE OR REPLACE PROCEDURE lab_insert_emp(
  p_first_name lab_emp.first_name%type :='John'
, p_last_name lab_emp.last_name%type DEFAULT 'Doe'
) IS
BEGIN
  INSERT INTO lab_emp VALUES(
    lab_emp_seq.NEXTVAL
  , p_first_name
  , p_last_name
  );
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(sqlerrm);
END;
/

DECLARE
BEGIN
 -- default
  lab_insert_emp;
 -- default
  lab_insert_emp(
    p_last_name=>'Wick'
  );
END;
```

---

[TOP](#plsql-procedure)
