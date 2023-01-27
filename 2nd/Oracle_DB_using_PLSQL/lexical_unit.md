# PL/SQL Lexical Unit

[back](./index.md)

- [PL/SQL Lexical Unit](#plsql-lexical-unit)
  - [Lexical Units](#lexical-units)
  - [Identifiers](#identifiers)
  - [Reserved Words](#reserved-words)
  - [Delimiters](#delimiters)
  - [Literal](#literal)
    - [Character Literals](#character-literals)
    - [Numeric Literals](#numeric-literals)
    - [Boolean Literals](#boolean-literals)
  - [Comments](#comments)

---

## Lexical Units

- Lexical units:
  - Are the **building blocks** of any PL/SQL block
  - Are sequences of characters including letters, digits, tabs, returns, and symbols

## Identifiers

- An `identifier` is the **name given to a PL/SQL object**, including any of the following:

  - Procedure
  - Function
  - Variable
  - Exception
  - Constant
  - Package
  - Record
  - PL/SQL table
  - Cursor

- Identifiers:
  - Maximum 30 characters in length
  - Must begin with a letter 以字母开头
  - May include `$` (dollar sign), `_` (underscore), or `#` (hashtag) 特殊字符
  - May **not contain spaces** 不能有空格
  - Identifiers are **NOT case sensitive** 大小写不敏感

## Reserved Words

- `Reserved words` are **words** that have special meaning to the Oracle database.
  - Reserved words cannot be used as identifiers in a PL/SQL program.

---

## Delimiters

- `Delimiters` are **symbols** that have special meaning.
  - Simple delimiters consist of one character.

| Symbol | Meaning                       |
| ------ | ----------------------------- | --- | ---------------------- |
| `+`    | addition operator             |
| `-`    | subtraction/negation operator |
| `/`    | division operator             |
| `=`    | equality operator             |
| `'`    | character string delimiter    |
| `;`    | statement terminator          |
| `<>`   | inequality operator           |
| `!=`   | inequality operator           |
| `      |                               | `   | concatenation operator |
| `--`   | single-line comment indicator |
| `/*`   | beginning comment delimiter   |
| `*/`   | ending comment delimiter      |
| `**`   | exponent                      |
| `:=`   | assignment operator           |

---

## Literal

- A `literal` is an **explicit** <u>numeric, character string, date, or Boolean value</u> that might be stored in a variable.
- Literals are classified as:
  - Character (also known as string literals)
  - Numeric
  - Boolean

### Character Literals

- Typically defined using the `VARCHAR2` **data type**
- Must be **enclosed** by character string delimiters (`'`)
- Can be composed of **zero or more** characters 即可以是`""`.
- Are **case sensitive**; 字面值是大小写敏感

### Numeric Literals

- Literals that **represent numbers** are numeric literals.
- Typically defined using the `NUMBER` **data type**

### Boolean Literals

- Values that are assigned to Boolean variables are `Boolean` literals.
- `TRUE`, `FALSE`, and `NULL` are the Boolean literals. 注意 NULL 也是布尔值。
- Character string delimiters are not required.注意无需单引号

---

## Comments

- Comments should describe the purpose and use of each block of code.
  - single line： `--`
  - multiple lines: `/* */`

---

[TOP](#plsql-lexical-unit)
