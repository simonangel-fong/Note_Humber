[Back](../index.md)

# Linux Regular Expression

[TOC]
Linux Regular Expression
Regex
Wildcard
Anchoring
Bracket Expression 中括号表达式
Alternation 间隔/OR
Repitition Operators
Backslash Character

---

## Regex

Regex is used to specify patterns of characters; often used in searchand-replace operations.

---

## Wildcard

- `.`: matches any single character<br>匹配任何当个字符

## Anchoring

|Anchor|Description|
|---|---|
|`^`|(caret character) To match the start of a line<br>匹配行头|
|`$`|(dollar character) To match the end of a line<br>匹配行尾|

---

## Bracket Expression 中括号表达式

- A bracket expressiong is a list of characters enclosed by `[` and `]`.

- 即从中括号[]内的字符串任意使用**一个**字符来匹配行。

- The caret `^` in the first character in the bracket expression matches any character **not** in the list.

- predefined 预定义的表达式
    - `[:alpha:]` ：所有字母字符
    - `[:blank:]` ：所有水平空格
    - `[:cntrl:]` ：所有控制字符
    - `[:digit:]` ：所有数字
    - `[:graph:]` ：所有可打印的字符(不包含空格符)
    - `[:lower:]` ：所有小写字母
    - `[:print:]` ：所有可打印的字符(包含空格符)
    - `[:punct:]` ：所有标点字符
    - `[:space:]` ：所有水平与垂直空格符
    - `[:upper:]` ：所有大写字母

---

## Alternation 间隔/OR

|Operator||
|---|---|
|`|`|OR operator, to match any string matching either alternate expression.<br>或运算符|

---

## Repitition Operators

Repitition of the preceding item

|Repitition Operators|Description|Rpitition|
|---|---|---|
|`?`|The preceding item is optional and matched at most once.<br>匹配最多一次|`{,1}`|
|`*`|The preceding item is matched zero or more times.<br>匹配任意次|`{0,}`|
|`+`|The preceding item is matched one or more times.<br>匹配至少一次|`{1,}`|
|`{n}`|The preceding item is matched exactly `n` times.<br>匹配n次||
|`{n,}`|The preceding item is matched `n` or more times.<br>匹配至少n次||
|`{,m}}`|The preceding item is matched at most `m` times.<br>匹配至多m次||
|`{n,m}}`|The preceding item is matched at least `n` times, but not more than `m` times.<br>匹配n到m次||

---

## Backslash Character

- `\<` the beginning of a word
- `\>` the end of a word
- `\\` backslash 反斜杠
- `\a` 铃声
- `\b` backspace 退格符
- `\f` form feed 走行换页
- `\n` new line 新行
- `\r` return 回车
- `\t` horizontal tab tab键
- `\v` vertical tab 水平制表符

---

[TOP](#linux-regular-expression)
