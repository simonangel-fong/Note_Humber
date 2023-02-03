# Merge Data

[Back](../index.md)

- [Merge Data](#merge-data)
  - [MERGE](#merge)
  - [Example](#example)

---

## MERGE

- The `MERGE` statement will `INSERT` a new row into a target table or `UPDATE` existing data in a target table, based on a comparison of the data in the two tables.

- The `WHEN` clause determines the action to be taken.

- Syntax:

```sql

-- Merge rows from a source table
MERGE INTO target_table T
   USING source_table S
   ON (T.column_id = S.column_id)
   WHEN MATCHED THEN
        -- some DML when the ON condition is true
   WHEN NOT MATCHED THEN
        -- some DML when the ON condition is false

-- Merge rows from a temp table
MERGE INTO target_table T
   USING (SELECT column_id, column_name01, column_name02 FROM source_table
   WHERE column_name02 = 80) S
   ON (T.column_id = S.column_id)
   WHEN MATCHED THEN
        UPDATE SET T.column_name = expression
        DELETE WHERE (S.column_name01 > 8000)
   WHEN NOT MATCHED THEN
        INSERT (T.column_id, T.bonus)
        VALUES (S.column_id, S.column_name01*.01)
        WHERE (S.column_name01 <= 8000);

```

---

## Example

- Requirement:
  - Each employee with a salary less than $10,000 USD is to receive a bonus of 5% of their salary.

```sql

-- Target table
CREATE TABLE bonuses
(employee_id NUMBER(6,0) NOT NULL,
bonus NUMBER(8,2) DEFAULT 0);

MERGE INTO bonuses D
   USING (SELECT employee_id, salary, department_id FROM employees
   WHERE department_id = 80) S
   ON (D.employee_id = S.employee_id)
   WHEN MATCHED THEN UPDATE SET D.bonus = D.bonus + S.salary*.01
     DELETE WHERE (S.salary > 8000)
   WHEN NOT MATCHED THEN INSERT (D.employee_id, D.bonus)
     VALUES (S.employee_id, S.salary*.01)
     WHERE (S.salary <= 8000);

SELECT * FROM bonuses ORDER BY employee_id;


```

---

[TOP](#merge-data)

[Back](../index.md)
