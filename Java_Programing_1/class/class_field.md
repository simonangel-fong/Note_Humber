# Class Attribute

[Back to Java](../index.md)

[TOC]

---

## Instance Fields

- Each instance of a class has its **own copy** of instance variables.

---

## Static Fields

- Static fields does not belong to a single instance of a class. 静态字段不依赖类的实例.

### Declaration 声明静态字段

- Using the `static` keyword between <u>the access specifier</u> and <u>the field type</u>.

```java

private static int instanceCount = 0;

```

### Initialization 初始化

- The field is initialized to 0 **only once**, regardless of the number of times the class is instantiated. 静态字段只会初始化一次,无论类实例化多少次.

- <u>Primitive static fields</u> are initialized to 0 if no initialization is performed. 基本数据类型默认为 0

---

## Passing Reference to Private Fields

- Avoid passing references to private data elements.避免向私有成员传递引用类型

- Passing references to private variables will allow any object that receives the reference to modify the variable. 被引用的对象存在数据修改的风险.

---

[TOP](#class-attribute)
