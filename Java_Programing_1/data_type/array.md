# Array

[Back to Java](../index.md)

[TOC]

---

## Array 数组

- An `array` is a list of data elements. An `array` can store any type of data but **only one type** of data at a time. 数组:数据集合, 只能定义一种数据类型.

- An `array` is an **object** so it needs an object reference. 是对象,是引用类型.

- Syntax:

```java
// Definition/Initialization
double[] dbArr = {value0, value1, ..., valuen};

// Declaration
int[] intArr = new int[size];

// Assignment/Initialization
intArr[index0] = value0;
intArr[index1] = value1;
intArr[index2] = value2;
intArr[index3] = value3;

// Access
int x = intArr[index0];

// Alternate Array Declaration
int numbers[]; //等效,中括号后置
int numbers[], codes[], scores[]

```

### Size

- The array size must be a **non-negative** number.
- It may be a **literal value**, a constant, or variable.
- Once created, an array size is **fixed** and **cannot be changed**.

```java
final int ARRAY_SIZE = 6;
int[] numbers = new int[ARRAY_SIZE];
```

### Bound

- Array indexes always start at `zero` and continue to (`array length - 1`).

- It is very easy to be `off-by-one` when accessing arrays.

```java
// This code has an off-by-one error.
int[] numbers = new int[100];
for (int i = 1; i <= 100; i++) //<=
     numbers[i] = 99;

```

### Length

- Arrays are objects and provide a **public field** named `length` that is a constant that can be tested.

```java
int size = temperatures.length;
```

---

## Loop

### `for` Loop

- Syntax:

```java
for(int i = 0; i < array.length; i++){
    // statement;
}
```

### Enhanced `for` Loop

- read only 只读

- Syntax:

```java
// enhanced for loop
for(datatype elementVariable : array){
    // statement;
}

```

---

## Copying Arrays

- You cannot copy an array by merely assigning one `reference variable` to another. 引用变量不能简单使用`==`

- You need to copy the individual elements of one array to another. 需要复制所有元素

```java
for (int i = 0; i < firstArray.length; i++){
    secondArray[i] = firstArray[i];
}

```

---

## Array as Arguments of Method 作为参数

- Arrays are **objects**. Their references can be passed to methods like any other object reference variable.

- 要小心方法体内是否会修改数组的值.

---

## Comparing Arrays

- The `==` operator determines only whether array references point to the same array object.

- To compare the contents of an array.

```java

public boolean equals(int[] firstArray, int[] secondArray){
    boolean result = false;

    if (firstArray.length == secondArray.length){
        for(int i=0; i<firstArray.length; i++ ){
            if (firstArray[i] == secondArray[i]){
                result = true;
            }else{
                result = false;
                break;
            }
        }
    }
    return result;
}
```

---

## Algorithm

### Maximum Value

```java
public int getMaximum(int[] arr){
	int highest = numbers[0];
	for (int i = 1; i < arr.length; i++){
		if (numbers[i] > highest){
		    highest = numbers[i];
        }
	}
    return highest;
}

```

### Minimum Value

```java
public int getMinimum(int[] arr){
	int lowest = numbers[0];
	for (int i = 1; i < arr.length; i++){
		if (numbers[i] < lowest){
		    lowest = numbers[i];
        }
	}
    return lowest;
}

```

### Sum

```java
public int getSum(int[] arr){
    int total = 0; // Initialize accumulator
    for (int i = 0; i < units.length; i++)
        total += units[i];
    return total;
}

```

### Average

```java
public int getAvg(int[] arr){
    int total = 0; // Initialize accumulator
    int average; // Will hold the average
    for (int i = 0; i < arr.length; i++)
        total += arr[i];
    average = total / arr.length;

    return average;
}
```

---

## Partially Filled Arrays

- Typically, if the amount of data that an array must hold is unknown:

  - Size the array to the largest expected number of elements.
  - Use a counting variable to keep track of how much valid data is in the array

---

## `String` Arrays

```java
// Definition
String[] strArr = {"str0","str1","str2",..."strn"};

// Declaration
String[] strArr = new String[3];

// Assignment/Initialization
strArr[0] = "str0";

```

### Method

- `.toUpperCase()`
- `.compareTo()`
- `.equals()`
- `.charAt()`

### The `length` Fiel & the `.length()` Method

- An array’s length is a field

- A String’s length is a method

---

## Arrays of Objects

```java
Animal[] animal = new Animal[5];

```

---

[TOP](#array)
