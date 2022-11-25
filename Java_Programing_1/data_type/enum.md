# Enumerated Types

[Back to Java](../index.md)

[TOC]

---

- 枚举类型一般配合`switch`语句使用.

## Definition, Declaration and Assignment

- Syntax:

```java

// Definition
   enum Day { SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
              THURSDAY, FRIDAY, SATURDAY }

// Declaration 声明
Day WorkDay; // creates a Day enum

// Assignment: 赋值
   Day WorkDay = Day.WEDNESDAY;

```

---

## Method

- `.toString()`: returns name of calling constant

- `.ordinal()`: returns the zero-based position of the constant in the enum. <br>
  For example the ordinal for `Day.THURSDAY` is `4`.

- `.equals(enum.object)`: accepts an object as an argument and returns true if the argument is equal to the calling enum constant

- `.compareTo(enum.object)`: accepts an object as an argument and returns a <u>negative integer</u> if the calling constant’s ordinal < than the argument’s ordinal, a <u>positive integer</u> if the calling constant’s ordinal > than the argument’s ordinal and <u>zero</u> if the calling constant’s ordinal == the argument’s ordinal.

---

[TOP](#enumerated-types)
