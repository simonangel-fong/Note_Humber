# Case conversion functions

[Back](../../index.md)

- [Case conversion functions](#case-conversion-functions)
  - [Case conversion functions 大小写转换](#case-conversion-functions-大小写转换)
  - [`LOWER`](#lower)
  - [`UPPER`](#upper)
  - [`INITCAP`](#initcap)

---

## Case conversion functions 大小写转换

- Case conversion functions **alter the case of data** stored in a field.

- They are used **in a query to display data** in a different case but they do not affect how he data is stored. 不会影响储存的数据.

- They can be used with an `INSERT statement` to **set the case** of a stored value

- 一般不建议在 where 语句使用,因为容易 trick yourself.

---

## `LOWER`

- The `LOWER` function **converts the given string to lower-case**.

- Syntax:

```SQL

-- Select
SELECT LOWER(columnname)
FROM tablename;

-- Where
SELECT columnname
FROM tablename
WHERE LOWER(columnname) = 'lowercase_str';

SELECT columnname
FROM tablename
WHERE columnname = LOWER('string');

-- Substitution Variables
SELECT columnname
FROM tablename
WHERE columnname = LOWER('&string');

```

---

## `UPPER`

- The `UPPER` function **converts the given string to upper-case**.

- Syntax:

```SQL

-- Select
SELECT UPPER(columnname)
FROM tablename;

-- Where
SELECT columnname
FROM tablename
WHERE UPPER(columnname) = 'uppercase_str';

SELECT columnname
FROM tablename
WHERE columnname = UPPER('string');

-- Substitution Variables
SELECT columnname
FROM tablename
WHERE columnname = UPPER('&string');

```

---

## `INITCAP`

- `INITCAP` function converts character strings to **mixed-case**, placing a capital letter at the beginning of each word, and the balance of the word in lower-case

- Syntax:

```SQL

-- Select
SELECT INITCAP(columnname)
FROM tablename;

-- Where
SELECT columnname
FROM tablename
WHERE INITCAP(columnname) = 'string';

SELECT columnname
FROM tablename
WHERE columnname = INITCAP('string');

-- Substitution Variables
SELECT columnname
FROM tablename
WHERE columnname = INITCAP('&string');

```

---

[TOP](#case-conversion-functions)
