# Date Functions

[Back](../../index.md)

- [Date Functions](#date-functions)
  - [Data Function](#data-function)
  - [`MONTHS_BETWEEN`](#months_between)
  - [`ADD_MONTHS`](#add_months)
  - [`NEXT_DAY`](#next_day)
  - [`LAST_DAY`](#last_day)
  - [`TO_DATE`](#to_date)
  - [`ROUND`: 四舍五入日期`](#round-四舍五入日期)
  - [Truncating date: 日期取整](#truncating-date-日期取整)
  - [`SYSDATE`](#sysdate)
  - [`CURRENT_TIMESTAMP`](#current_timestamp)
  - [`CURRENT_DATE`](#current_date)
  - [`SYSTIMESTAMP`](#systimestamp)

---

## Data Function

- The `DATE` function of Oracle 12c displays date values in a `DD-MON-RR` format that represents a <u>2-digit day</u>, <u>3-letter month abbreviation</u> and a <u>2-digit year</u>. e.g.: March 5, 2003 would be stored as 05-MAR-03.

- A date is referenced as a non-numeric field and is enclosed in single quotation marks. Internally it is stored as a numeric value representing the century, year, month, day, hours, minutes, and seconds. 日期: 非数组列,使用单引号.

- Although a date appears as a non-numeric field, users can perform calculations on dates because they are stored internally as numbers. 实际上是以数字值储存.

- The internal numeric version of the date used by Oracle 12c is a Julian date. A `Julian date` represents the number of days that have **passed from a specific date and 4712 B.C.**.

- If you need to calculate the number of days between two dates
  Oracle first **converts** the dates to the Julian date format, then **determines** the difference between the two dates.

---

## `MONTHS_BETWEEN`

- To determine the number of months between two dates

- Syntax:
  - `MONTHS_BETWEEN(date1, date2)`
  - Argument:
    - `date1`, `date2`: date2 is subtracted from date1
  - Return:
    - 会出现小数

## `ADD_MONTHS`

- Syntax:
  - `ADD_MONTHS(date, month)`
  - Argument:
    - `date`: the beginning date
    - `month`: the number of months to add to a specific date.

---

## `NEXT_DAY`

- The `NEXT_DAY` function can be used to determine the **next occurrence of a specific day of the week** and the give you the **actual date** of that day.

- Syntax:
  - `NEXT_DAY(date, DAY)`
  - Argument:
    - `date`: starting date
    - `DAY`: the day of the week to be identified 一个星期中的日子
  - Return:
    - date value

---

## `LAST_DAY`

- determines the **last day** of the month for the month.

- Syntax:
  - `LAST_DAY(date)`
  - Argument:
    - `date`: a specific date
  - Return:
    - the last date of the month for that specific month.

---

## `TO_DATE`

- To convert a specific date with a given format to a Oracle format. 将一个特定的日期转变为系统的格式以便识别. 一般用于 where.

- Syntax:
  - `TO_DATE('date', 'format')`
  - Argument:
    - `date`: a specific date
    - `format`: the format `date`的格式
      - `DD`: date
      - `MONTH`: month
      - `YYYY`: year

```SQL
-- WHERE
SELECT colname
FROM tbname
WHERE colnam = TO_DATE('date','format')

```

---

## `ROUND`: 四舍五入日期

与小数的四舍五入类似.

- Syntax:
  - `ROUND(date, 'unit')`
  - Argument:
    - `date`: the date data.
    - `'unit'`: date can be rounded by the unit month and year. 日期可以精确到月或年
      - month: `MONTH`/`MM`精确到月
        - 日期 1-15,当月 1 号
        - 日期>16, 下个月 1 号
      - year: `YEAR` / `YYYY`,以七月 16 日为界

---

## Truncating date: 日期取整

使用嵌套 nested function

- Syntax:
- `TRUNC(MONTHS_BETWEEN(date1, date2), 0)`

---

## `SYSDATE`

- `SYSDATE` returns the **current date and time** set on the **operating system** where the database resides

---

## `CURRENT_TIMESTAMP`

- 返回时间戳

---

## `CURRENT_DATE`

- The `CURRENT_DATE` function returns the current date and time from the **user session**

---

## `SYSTIMESTAMP`

- 返回系统时间戳

---

[TOP](#date-functions)
