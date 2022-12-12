# Other Functions

[Back](../../index.md)

- [Other Functions](#other-functions)
  - [`NVL`](#nvl)
  - [`NVL2`](#nvl2)
  - [`TO_CHAR`](#to_char)
  - [`DECODE`](#decode)
  - [`CASE`](#case)
  - [`TO_NUMBER`](#to_number)

---

## `NVL`

- If a `NULL` value is used in a calculation, the result is also a `NULL` value.

- The `NVL` function allows you to you to substitute a value for an existing `NULL` value. 可以替换 null 值进行计算.

- Syntax:
  - `NVL(colname, value_null)`
  - Argument:
    - `colname`: 可能出现 null 值的列
    - `value_null`: 替代值
      - 可以是数字
      - 可以是日期

---

## `NVL2`

- To allows different options based on whether a NULL value exits.

- Syntax:
  - `NVL2(colname, value_not_null, value_null)`
  - Argument:
    - `colname`: 可能出现 null 值的列
    - `value_not_null`: 如果是 not null 时的替换值
    - `value_null`: 如果是 null 时的替换值

---

## `TO_CHAR`

- The `TO_CHAR` function is widely used to **convert dates and numbers** to a <u>formatted character string</u>.

- It is the opposite of the `TO_DATE` function.

- Syntax:
  - `TO_CHAR(data, 'format')`
  - Argument:
    - `data`: the date or number data to be formatted
    - `format`: The format mask consists of a series of elements that represent how the date should appear when displayed.显示格式

---

## `DECODE`

- The `DECODE` function takes a specified value and **compares** it to values in a list. If a match is found the specified result is returned.

- The `DECODE` function enables you to specify different actions to take depending on the circumstances

- Syntax:
  - `DECODE(expression, value1, result1, value2, result2, ..., default)`
    - `expression`: the value are searching for
    - `value1`, `value2`, ...: the values in the list
    - `result1`, `result2`, ...: the results in the list
    - `default`: the default value to return if no matching

```SQL
-- example, 可以缩进
SELECT state
    , DECODE(state, 'FL',   'HOME',
                    'ID',   'Guest',
                            'State')
FROM customers;

```

---

## `CASE`

- The `CASE` expression is similar to the `DECODE` function in that it can perform `IF … THEN … ELSE` conditional processing.

- Syntax:

```SQL

CASE
    WHEN expression1 THEN result1
    WHEN expression2 THEN result2
    ...
    ELSE
END

```

---

## `TO_NUMBER`

The `TO_NUMBER` function converts a value to a numeric datatype, if possible. 一般用于转换到数值用于计算.

- Syntax:
  - `TO_NUMBER(expression)`

---

[TOP](#other-functions)
