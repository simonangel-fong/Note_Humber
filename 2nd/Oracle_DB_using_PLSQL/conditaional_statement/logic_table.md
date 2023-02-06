# Logic Table

[Back](../index.md)

本表适用于 if，case 语句。

- `FALSE`>`NULL`>`TRUE`

| `AND`   | `TRUE`  | `FALSE` | `NULL`  |
| ------- | ------- | ------- | ------- |
| `TRUE`  | `TRUE`  | `FALSE` | `NULL`  |
| `FALSE` | `FALSE` | `FALSE` | `FALSE` |
| `NULL`  | `NULL`  | `FALSE` | `NULL`  |

- `FALSE`<`NULL`<`TRUE`

| `OR`    | `TRUE` | `FALSE` | `NULL` |
| ------- | ------ | ------- | ------ |
| `TRUE`  | `TRUE` | `TRUE`  | `TRUE` |
| `FALSE` | `TRUE` | `FALSE` | `NULL` |
| `NULL`  | `TRUE` | `NULL`  | `NULL` |

- NOT

| `NOT`   |         |
| ------- | ------- |
| `TRUE`  | `FALSE` |
| `FALSE` | `TRUE`  |
| `NULL`  | `NULL`  |

## Example

```sql
-- wk:04
-- Demo: logic table


DECLARE
    v_true  BOOLEAN :=TRUE;
    v_false BOOLEAN :=FALSE;
    v_null  BOOLEAN;
BEGIN
    IF V_NULL IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Is Null');
    END IF;
    IF v_true AND v_true THEN
        DBMS_OUTPUT.PUT_LINE('True AND True = True');
    END IF;
    IF NOT( v_true AND v_false) THEN--括号改变顺序
        DBMS_OUTPUT.PUT_LINE('True AND False = False');
    END IF;
    IF v_true AND v_null THEN
        DBMS_OUTPUT.PUT_LINE('');--想要else有效，then后必须有语句
    ELSE
        DBMS_OUTPUT.PUT_LINE('True AND Null = Null');
    END IF;
    IF  v_true OR v_false THEN
        DBMS_OUTPUT.PUT_LINE('True OR False = TRUE');
    END IF;

END;
```
