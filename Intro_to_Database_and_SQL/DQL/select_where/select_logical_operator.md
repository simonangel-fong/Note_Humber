[Back](../../index.md)

# 目录
[TOC]

# Logical Operator逻辑运算符

- Order of the logical operator:
    1. Arithmetic operator: +-*/%
    2. Comparison operator: <,>,=, like
    3. Logical operator(in order): NOT>>AND>>OR

- To change the order: parentheses括号最先计算

```sql
WHERE (category = 'FAMILY LIFE')
OR (pubid = 4
AND cost > 15)

```

***

## AND

|Clause|Both/Either|Result|
|---|---|---|
|`condition_A AND condition_B`|Both True|`TRUE`|
|`condition_A AND condition_B`|Either or Both False|`FALSE`|

- 若干指定列的AND<>判断,相当于NOT IN

- 集合上,相当于condition_A和condition_B的交集the intersection of sets a and b

***

## OR

|Clause|Both/Either|Result|
|---|---|---|
|`condition_A OR condition_B`|Either or Both True|`TRUE`|
|`condition_A OR condition_B`|Both False|`FALSE`|

- 若干指定列的OR=判断,相当于IN

- 集合上,相当于condition_A和condition_B的并集the union of sets a and b

***

## NOT

`NOT` is used to reverse the meaning of a condition.
取反


