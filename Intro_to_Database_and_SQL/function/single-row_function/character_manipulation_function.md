# Character Manipulation Functions

[Back](../../index.md)

- [Character Manipulation Functions](#character-manipulation-functions)
  - [`SUBSTR`](#substr)
  - [`INSTR`](#instr)
  - [`LENGTH`](#length)
  - [`LPAD & RPAD`](#lpad--rpad)
  - [`LTRIM & RTRIM`](#ltrim--rtrim)
  - [`REPLACE`](#replace)
  - [`CONCAT`](#concat)

---

## `SUBSTR`

- The `SUBSTR` function is used to return a substring or a **portion of a string**.

  - to extract portions of a string 提取字符串

- **Syntax**:
  - `SUBSTR(c, p, l)`
  - Argument:
    - `c`: represents the character string
    - `p`: represents the starting location 开始字符串位置
      - 默认: 开始位置为 1
      - 负数: count backwards 向后计算,
      - -1: 表示最后一位;
      - 当是负数时,提取的字符串长度直到结尾,不会重头截取.
    - `l`: represents the length of string to return 提取的字符串长度
      - 当超出字符串长度时, 只会截取到最后一个字符.
  - Result: portion of a string

```SQL

-- Select
SELECT SUBSTR(columnname, start_posistion, length)
FROM tablename;

```

---

## `INSTR`

- The `INSTR` function **searches a string** for a specified set of characters or a substring, then **returns a numeric value** representing the first character position in which the substring is found.

- Syntax:
  `INSTR(string/colname, str_match, postion_start, occurrence)`

  - Argument:

    - `string/column`: the string that is to be searched
    - `str_match`: a specified set of characters 匹配字符串

  - Optional argument:

    - `postion_start`: the start position 数字, 开始匹配的位置.
      - By default, it starts at the beginning of string value 默认: 1, 从第一个字符串开始
    - `occurrence`: the instance of the search value to locate 第几次出现
      - By default, it is the beginning of the first occurrence is located 默认匹配第一次

  - Return:
    - a numeric value 返回匹配字符串的位置.
    - If the substring does not exist a 0 (zero) is returned.如果不匹配, 返回值为 0.

```SQL
SELECT INSTR(string/colname, 'str_match', postion_start, occurrence)
FROM tablename;

```

## `LENGTH`

- To determine the **number of characters** in a string, the `LENGTH` function is used

- Syntax:

```SQL
SELECT LENGTH(str/colname)
FROM tbname;

```

---

## `LPAD` & `RPAD`

- `LPAD`: To **pad or fill** in the area <u>to the left</u> of a character string with a specific character or blank space

- `RPAD`: To **pad or fill** in the area <u>to the right</u> of a character string with a specific character or blank space

- Syntax:
  - `LPAD(str/colname, length, symbol)`
  - Argument:
    - `str/colname`: the string to be padded
    - `length`: the length of the character string **after being padded**
      - 如果长度小于字符串长度,则只会截取指定长度的字符串.
    - `symbol`: the symbol or character to be used as padding

---

## `LTRIM` & `RTRIM`

- The `LTRIM` function can be used to **remove a specific string** of characters from the left side of a set of data

- The `RTRIM` function **removes specific characters** from the right side of a set of data

- Syntax:
  - `LTRIM(str/colname, 'str')`
  - Argument:
    - `str/colname`: the data to be affected
    - `'str'`: the string to be removed
  - Return:
    - the Trimed string.

---

## `REPLACE`

- The `REPLACE` function looks for the occurrence of the specified string of characters, and, if it is found, replaces it with another set of specified characters

- Syntax:
  - `REPLACE(colname,'str_replace','str_subst')`
  - Argument:
    - `colname`: the data to be searched
    - `'str_replace'`: the string to be replaced
    - `'str_subst'`: the string to be substituted

---

## `CONCAT`

- The `CONCAT` function can be used to concatenate data from **two columns**.

- The `(||) concatenation operator` is usually preferred since it is **not limited to two items**.

- Syntax:
  - `CONCAT(colname1, colname2)`
  - Argument:
    - `colname1` / `colname2`: a column name or a string literal

---

[TOP](#character-manipulation-functions)
