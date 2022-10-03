[Back](../index.md)

[TOC]

# Select Arithmetic

SQL只能进行简单计算, 更复杂的计算应该使用Python等编程语言处理；

## Arithmetic operators运算符号

|Operator|Operation|
|---|---|
|`+`|Add|
|`-`|Subtract|
|`*`|Multiply|
|`/`|Divide|

- Arithmetic operations follow the standard order of operations (BEDMAS, or PEMDAS if you learned either of these acronyms) 运算顺序,按照一般四则运算.

- Exponents are not supported, use multiplication不支持指数计算，应该使用惩罚

- Arithmetic operators can be used in any clause of a SQL statement except the FROM clause

## Order of Operations运算顺序

四则运算

- While Carry out calculation from left to right in an expression, any required multiplication and division operations are solved first;先乘除

- While Carry out calculation from left to right in an expression, Addition and subtraction operations are solved after multiplication and division, again moving form left to right in the equation后加减

- To override this order of operations, parentheses are used to enclose a portion that should be calculated first括号优先





## 一般与alias一并使用

如果没有alias，则返回的heading会直接显示为arithmetic expression



