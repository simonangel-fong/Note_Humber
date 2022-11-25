# Class Constructor

[Back to Java](../index.md)

[TOC]

---

## Constructor

- A constructor in Java is a <u>special method</u> that is used to **initialize objects**.

- The constructor is called _when an object of a class is created_. It can be used to **set initial values** for object attributes

---

## Default Constructor 默认构造函数

- Java automatically provides a `default constructor` for a class if a constructor is <u>not explicitly written</u>.

- The default constructor provided by Java:

  - sets all `numeric instance fields` to `0` 数字实例字段为零
  - sets all `char instance fields` to ' ' (empty char) 字符类型的实例字段为空字符
  - sets all `reference instance fields` to null 引用类型实例字段为 null
  - sets all `boolean instance fields` to false 布尔值类型实例字段为 false

- **no-arg constructor**:the constructor that <u>accepts no arguments</u> 无参数构造函数.

- Good Practise:
  - If a constructor that accepts arguments is written, we **should also write a no-arg constructor**.如果接受有参数的构造函数,则也应该写默认构造函数;
  - If we write a no-arg constructor, we should **provide the initialization of all instance fields**. 如果写默认构造函数, 则应该初始化所有实例字段.

---

## Overloaded Constructor

- Overloading constructors gives programmers more than one way to construct an object of that class. 构造函数可以重载.

- All of the restrictions on overloading apply to constructors as well. 适用普通函数的重载的规则.

---

## Copy Constructor

- A `copy constructor` accepts an existing object of the same class and clones it.

```java
    //copy constructor
	public Stock(Stock object 2)
	{
		symbol = object2.symbol;
		sharePrice = object2.sharePrice;
	}

	// Create a Stock object
	Stock company1 = new Stock("XYZ", 9.62);
	//Create company2, a copy of company1
	Stock company2 = new Stock(company1); // Call copy constructor

```

---

[TOP](#class-constructor)
