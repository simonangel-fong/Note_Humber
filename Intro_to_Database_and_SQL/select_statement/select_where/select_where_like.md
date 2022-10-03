[Back](/index.md)

# 目录
[TOC]

# Like Clause

- To return a set of records matching given patterns

- LIKE operator is used with given wildcards.

- Wild card characters represent one or more alphanumeric characters
    通配符指代文字数字式字符

- Syntax:

```sql

SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern;

```

# Wildcard Characters通配符

|Wildcard|Description|Note|
|---|---|---|
|`_`|underscore下划线, is used to represent **exactly one** character;|can't represent nothing|
|`%`|percent百分号, is used to represent **any number** of characters;|can represent nothing|


Some Database support [charlist]
即正则，**待续**

***

### Pattern

- Case sensitive与value一样大小写敏感;

- 常见:

```sql

%a  -- End with 'a'
a%  --Start with 'a'
%a% --Contain 'a'
_a_ --The string is composed of 3 characters with 'a' in the middle
_a  --The string is composed of 2 characters and ends with 'a'.
a_  --The string is composed of 2 characters and starts with 'a'.

```

***

### Escape转义

- LIKE的pattern可以转义,以匹配通配符。

- 使用关键字ESCAPE

- 允许用户自定义转义标识符 escape indicator，即紧跟ESCAPE后的字符,使用单引号包围。

- 转义标识符不能是通配符，即不能是`_%`;

- 只有转义标识符其后的通配符才会被转义taken as literal %/_ symbal，其他通配符不会被转义.

- 例子:

```sql

-- B here is escape indicator, the first character followed escape indicator escapes
-- 该处B被声明为转义的标识
SELECT *
FROM testing
WHERE tvalue LIKE 'B%__A%T' ESCAPE 'B'

-- Return rows started with % and followed by any characters.
SELECT *
FROM testing
WHERE tvalue LIKE '\%%' ESCAPE '\'

```


