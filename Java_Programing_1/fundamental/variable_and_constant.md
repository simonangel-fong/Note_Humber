[Back to Java](../index.md)

# Variable and Constant

[TOC]

***

## Variable 变量

A **variable** is a **named storage location** in the computer’s memory.<br>
变量：在内存中的指定的储存地址<br>

A **literal** is a **value** that is written into the code of a program.<br>
字面值: 写入的变量值。<br>

### Variable Declaration / Define 声明

```java

int value;      //define or declaration

```

- Variables must be **declared before** they are used.
    必须先声明
- A variable declaration tells the compiler the variable’s name and the type of data it will hold. 
    对于编译器，变量声明包含变量名和类型。
- Variable declaration ends with a semicolon. 以分号结束。

### Assignment Statement/Initialization 赋值/初始化

The **assignment statement** is used to store a value into a variable (location in memory).

```java

int value;

value = 5;      //Assignment Statement

```

- The assignment operator is the equal (=) sign
    使用等于号
- The operand on the left side of the assignment
operator must be a variable name.
    左边是变量名或内存地址
- The operand on the right side must be either a literal or expression that evaluates to a type that is compatible with the type of the variable.
    右边是字面值或表达式。
    注意表达式的类型必须与左边的变量类型相容，否则必须显式转换类型。

### Usage of Variable 使用

- Variables can only hold one value at a time.
    与常量相对
- **Local variables**本地变量 do not receive a default value.
    没有默认值
- Local variables must have a valid type in order to be used.
    数据类型需要合法.

---

## Constants 常量

- can hold only a **single value**

- declared using the **keyword** `final`

- By convention, constants are all upper case and words are separated by the underscore character.
    常量名：大写+下横线

- Constants need not be initialized when declared; however, they must be initialized before they are used or a compiler error will be generated.
    声明无需赋值,但使用之前赋值

- Once initialized with a value, constants cannot be changed programmatically.
    一旦赋值无法修改

```java
final double CAL_SALES_TAX = 0.0725;
```

---

## Scope 作用域

- Scope refers to the part of a program that has access to a variable’s contents.
    指能访问变量内容的那个部分程序

- **Local variables**: The variables declared inside a method.
    本地变量=方法内创建的变量

- The scope of a local variable begins at the declaration of the variable and ends
at the end of the method in which it was declared.
    起于声明，终于方法结束处。


[TOP](#variable-and-constant)
