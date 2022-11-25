# `Null`

[Back to Java](../index.md)

[TOC]

---

## `Null` References

- A `null` reference is a reference variable that **points to nothing**.

- If a reference is `null`, then **no operations can be performed** on it.

- References can be tested to see if they point to null prior to being used.

- **Good Practice**:
    - 在计算引用类型前,先验证是否为`null`

```java

if(name != null)  // test the String before operation
   System.out.println("Name is: " +  
                      name.toUpperCase());

```

---

[TOP](#null)
