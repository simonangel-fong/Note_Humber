# `this`

[Back to Java](../index.md)

[TOC]

---

## `this` References

### Refer to Instance Itself

- The `this` reference is simply a name that an object can use to **refer to itself**.

- The `this` reference can be used to overcome shadowing and **allow a parameter to have the same name** as an instance field.

```java

public void setFeet(int feet)
{
	this.feet = feet;
	//sets the this instance’s feet field
	//equal to the parameter feet.
}

```

### Refer to Constructor

- The this reference can be used to **call a constructor from another constructor**.

- Elaborate **constructor chaining** can be created using this technique.

- If this is used in a constructor, it must be the **first** statement in the constructor.

```java
/*
- This constructor would allow an instance of the Stock class
 to be created using only the symbol name as a parameter.

- It calls the constructor that takes the symbol and the price,
 using sym as the symbol argument and 0 as the price argument.
*/
public Stock(String sym)
{
	this(sym, 0.0);
}

```

---

---

[TOP](#this)
