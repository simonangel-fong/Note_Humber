# PLSQL Variable

[back](./index.md)

- [PLSQL Variable](#plsql-variable)
  - [Variable](#variable)
  - [Declaration and Initialization](#declaration-and-initialization)
  - [Assigning New Values to Variables(Executable Statements)](#assigning-new-values-to-variablesexecutable-statements)

---

## Variable

- A `variable` is nothing but a name given to a <u>storage area</u> that our programs can manipulate.
  - Each variable in PL/SQL has a specific **data type**, which determines the size and the layout of the variable's memory, the **range of values** that can be stored within that memory, and the **set of operations** that can be applied to the variable.

---

## Declaration and Initialization

- Syntax:

```sql
    identifier [CONSTANT] datatype [NOT NULL] [:= expr | DEFAULT expr];
```

- **Declaration**

  - All PL/SQL variables must be declared in the `declaration section` before referencing them in the PL/SQL block.

- **Constrained Declaration**: When a size, scale or precision limit with the **data type** is provides.

  - Constrained declarations require less memory than unconstrained declarations.

- **Initialization**: Variables can be assigned a value at the same time.

  - Default value of variable when declared: `NULL`
  - Initialization in Declare section:
    - `DEFAULT`:
    - assignment operator(`:=`)
  - Initialization in Executable section: assignment operator(`:=`)
  - `NOT NULL` constraint: To specify that a variable should not have a `NULL` value. An initial value must be explicitly assigned for that variable.必须有初始值。

- Conventionally,
  - Variables start with `v_`; Constants start with `c_`.
  - not case-sensitive

---

## Assigning New Values to Variables(Executable Statements)

```sql
v_name := 'Henderson'; # Character literals
v_start_date := '12-Dec-2005'; # date literals
v_quote := 'The only thing that we can know is that we know nothing and that is the highest flight of human reason.'; ##Statements can continue over several lines.

v_my_integer := 100; # numberic values
v_my_sci_not := 2E5; # scientific notation

v_last_day := LAST_DAY(SYSDATE); # LAST_DAY is a function

```

---

[TOP](#plsql-variable)
