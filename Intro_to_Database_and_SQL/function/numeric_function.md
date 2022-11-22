# Number Functions

[Back](../index.md)

[TOC]

---

## `ROUND`: 四舍五入

- The `ROUND` function is designed to **round numeric values to the given precision**.

- Syntax:
  - `ROUND(numeric_data, precision)`
  - Argument:
    - `numeric_data`: the numeric data or column to be rounded
    - `precision`: the position of the digit to which the data should be rounded 精度
      - 0: **默认值,可以忽略**.精确到个位
      - positive number: round on the right side of the decimal position 精确到小数部分
      - negative number: round on the left side of the decimal position 精确到整数部分

---

## `TRUNC`: 取整

- The `TRUNC` function can be used to **truncate numeric data** to a specific position. Any numbers after that position are simply <u>removed or dropped off</u>.

- Syntax:
  - `TRUNC(numeric_data, precision)`
  - `numeric_data`: the numeric data or field to be truncated
  - `precision`: the position from the digit from which the data should be removed 精度
    - 0: **默认值,可以忽略**.精确到个位
    - positive: 精确到小数
    - negative: 精确到整数

---

## `MOD`: 取余

- The `MOD` function returns the **remainder** only of a division operation

- Syntax:
  - `MOD(dividend, divisor)`
  - Argument:
    - `dividend`: 被除数
    - `divisor`: 除数
  - Return:
    - the remainder
    - 正负号只跟被除数有关,与除数无关.

---

## `ABS`

- The `ABS (Absolute)` function returns the **absolute or positive value** of the numeric value provided as the argument.

- Syntax:
  - `ABS(numeric_data)`
  - Argument:
    - `numeric_data`: 数字数据或数学表达式
  - Return: 总是正数

---

## `POWER`

- The `POWER` function raises the number in the first argument to the power indicated in the second argument.

- Syntax:
  - `POWER(base, exponent)`
  - Argument:
    - `base`: the number you are raising
    - `exponent`: the power you are raising it to

---

[TOP](#number-functions)
