# Class Relation

[Back to Java](../index.md)

[TOC]

---

## Inner Class 內部类

`Inner classes` are defined inside the `outer class`.

- `Inner classes` have unique properties:

  - An `outer class` can access the `public` members of an `inner class`. 外部类可以访问内部类的公有成员.
  - An `inner class` is not visible or accessible to code outside the `outer class`.
  - An `inner class` can access the `private` members of the `outer class`. 内部类可以访问外部类的私有成员.

- **Compiled File: Inner Class**: 编译文件名

  - Compiled byte code for inner classes is stored in a **separate file**.
  - The file’s name consists of: `outerClass$innerClass.class`
    - the name of the outer class
    - followed by a $ character
    - followed by the name of the inner class
    - followed by .class

  RetailItem$CostData.class

---

## Aggregation 聚合

- Creating an instance of one class **as a reference** in another class is called object aggregation. 在一个类中引用其他类.

- Aggregation creates a “has a” relationship between objects.

- 聚合关系中的各个个体都可以独立存在.

---

## Class Collaboration

- `Collaboration` – two classes **interact with each other**
  - If an object is to collaborate with another object, it must know something about the second object’s methods and how to call them.

---

[TOP](#class-relation)
