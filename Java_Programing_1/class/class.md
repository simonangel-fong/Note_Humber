[Back to Java](../index.md)

# Class

[TOC]

---

## Class Name

Class names should begin with a capital letter and each word thereafter should be capitalized.
首字大写跟首字大写

By convention, class names should always begin with an upper case character.

Objects are not stored in variables, however. Objects are referenced by variables.

## Class-Type Variables

简而言之,
原始类型的变量是指内存地址，变量值存在内存地址中。
对象类型的变量是映射对象，内存地址存放的是对对象的映射。

- Primitive variables actually contain the value (literal) that they have been assigned.

```java
int number = 25     //The value 25 will be stored in the memory location associated with the variable number.
```

- Objects are not stored in variables, the memory location. However, ojects are referenced by variables. When a variable references an object, it contains the **memory address of the object’s location**.

```java
String name = "Joe Mahoney"     // The variable name holds the address of a String object.
```


---

[TOP](#class)
