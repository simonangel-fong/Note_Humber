# PL/SQL Operator

[Back](./index.md)

- [PL/SQL Operator](#plsql-operator)
  - [Priority](#priority)
  - [Example](#example)

---

## Priority

- The following table shows the default order of operations from high priority to low priority:

| Operator                                                       | Operation                |
| -------------------------------------------------------------- | ------------------------ | --- | ------------------------------------ |
| `**`                                                           | Exponentiation           |
| `+, -`                                                         | Identity, negation       |
| `*`, `/`                                                       | Multiplication, division |
| `+, -,                                                         |                          | `   | Addition, subtraction, concatenation |
| `=, <, >, <=, >=, <>, !=, ~=, ^=, IS, NULL, LIKE, BETWEEN, IN` | Comparison               |
| `NOT`                                                          | Logical negation         |
| `AND`                                                          | Conjunction              |
| `OR`                                                           | Inclusion                |

---

## Example

```sql
v_loop_count := v_loop_count + 1; #Increment
v_good_sal := v_sal BETWEEN 50000 AND 150000; # Boolean
v_valid := (v_empno IS NOT NULL); #whether an employee number contains a value.
```

---

[TOP](#plsql-operator)
