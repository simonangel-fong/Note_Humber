# Class Method

[Back to Java](../index.md)

[TOC]

---

## Instance Method

- Instance methods **require that an instance of a class be created** in order to be used. 实例方法不能脱离实例(对象)存在.

- Instance methods typically interact with instance fields or calculate values based on those fields. 实例方法基于实例字段.

---

## Static Method

- Static method does not belong to a single instance of a class. 静态方法不依赖类的实例.

### Declaration 声明静态方法

- Using the `static` keyword between <u>the access modifier</u> and <u>the return type of the method</u>.

```java

private static double milesToKilometers(double miles){
    // some codes
}


```

### Call Static Method

1. **Using the class name** 推荐

- When a class contains a `static method`, it is **not necessary to create an instance** of the class in order to use the method. Static methods may be **called at the class level.**

- They are typically used to create utility classes, such as the Math class in the Java Standard Library. 用于创建实用类.

- Static methods may not communicate with instance fields, **only static fields**. 只能使用静态字段.

```java
// Call a static method by using the class name
double kilosPerMile = Metric.milesToKilometers(1.0);

```

2. **Using the object name** 可以但不推荐

```java
// Call a static method by using the object name
Math math = new Math();
math.sqrt(10);

```

---

## Argument 参数

### Passing Objects

传递对象参数

- When an object is passed as an argument, the **value of the reference variable** is passed. The value of the reference variable is an **address or reference to the object in memory**. 如果直接传递对象参数,则是对象的引用(内存地址)被传递,而非对象的信息.

- A copy of the object is not passed, just a pointer to the object. 只是对象的指针被传递.

- When a method receives a reference variable as an argument, it is possible for the method to modify the contents of the object referenced by the variable. 存在对象数据被修改的风险

- **Good Practice**:
  - 创建以对象为参数的构造函数,用于赋值对象
  - 在方法体内调用该构造函数复制对象

```java

public void method(Animal animal){
    Animal paraAnimal = new Animal(animal); //使用构造函数复制对象
    // some codes
}

```

---

## Return

### Return Reference

- Methods can return references to objects as well. Just as with passing parameters, a copy of the object is not returned, **only its address**. 返回的是对象地址

```java

public static InventoryItem getData(){
	// some code
    return new InventoryItem(d, u);
}


```

---

## Method Overloading

- With method overloading, multiple methods can have the **same name** with **different parameters**.

- Java uses the **method signature** <u>(name, type of parameters and order of parameters)</u> to determine which method to call. This process is known as `binding`. The _return type of the method_ is not part of the method signature.
  绑定:使用方法签名决定调用哪个方法(方法名,参数类型,参数顺序).返回类型除外.

- Multiple methods can have the same name as long as **the number** and/or **type of parameters** are different.

```java

int myMethod(int x)
float myMethod(float x)
double myMethod(double x, double y)

```

---

## `.toString()`

### Call `.toString()`

- The `toString` method of a class can be called **explicitly**. 显式调用.

```java
    Stock xyzCompany = new Stock ("XYZ", 9.62);

    System.out.println(xyzCompany.toString()); //called explicitly

```

- However, the `toString` method does not have to be called explicitly but is called **implicitly** whenever you _pass an object_ of the class to println or print. 隐式调用:传递对象.
- The `toString` method is also called **implicitly** whenever you concatenate an object of the class with a string.隐式调用:连接字符串

```java

    Stock xyzCompany = new Stock ("XYZ", 9.62);

    System.out.println(xyzCompany);//called implicitly
    System.out.println("The stock data is:\n" +
				     xyzCompany);//called implicitly

```

### Override `.toString()`

- All objects have a `toString` method that returns the class name and a hash of the memory address of the object. 默认的`toString()`是返回类名和内存地址.

- We can **override the default method** with our own to print out more useful information.

---

## `.equals()`

- When the `==` operator is used with reference variables, **the memory address** of the objects are compared. The contents of the objects are not compared. 使用`==`比较的是内存地址.

- All objects have an `equals` method.The default operation of the equals method is to **compare memory addresses** of the objects (just like the == operator). 默认`equals`方法比较的也是内存地址.

### Override `.equals()`

重载 equals()方法, 在方法体中比较对象的

---

## `.copy()`

- There are two ways to copy an object.

- **Shallow Copy** (bad copy)
  - Cannot use the `assignment operator(=)` to copy reference types.
  - Reference only copy
    - This is simply copying the **address** of an object into another reference variable.
- **Deep copy** (correct)
  - This involves creating a new instance of the class and **copying the values from one object into the new object**.

---

## `.finalize()`

- The method runs just prior to the garbage collector reclaiming its memory.

- The garbage collector is a background thread that runs periodically. It **cannot be determined** when the finalize method will _actually_ be run.

- Syntax:

```java
public void finalize(){
    //some codes
}
```

---

[TOP](#class-method)
