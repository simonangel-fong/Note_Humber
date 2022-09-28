[Back to Java](../index.md)

[TOC]

---

# Operator

## Arithmetic Operators 算术运算符

![arithmetic operator](../pic/fundamental/operator/arithmetic%20operators.png)

- The operators are called **binary operators** because they must have two operands.
    二元运算符,与三元运算符相对
&emsp;
- It is an error to try to divide any number by zero.
    除法运算要注意被除数是否为零。dividend cant be zero.
&emsp;
- Integer division will truncate any decimal remainder.
    `1/2`的结果是`0`.

### Operator Precedence 运算符优先级

![operator precedence](../pic/fundamental/operator/operator_precedence.png)

1. `-`: 负号最先
2. `* / %`
3. `+ -`

- When parenthesis are used in an expression, the inner most parenthesis are processed first.
    括号由内到外

- If two sets of parenthesis are at the same level, they are processed left to right.
    同级别的括号，由左到右

---

### Combined Assignment Operators

![combined assignment operator](../pic/fundamental/operator/combined_assignment_operator.png)


