# Exception Handling Model

[Back](../index.md)

- [Exception Handling Model](#exception-handling-model)
  - [Declaring Exceptions: `throws`](#declaring-exceptions-throws)
  - [Throwing Exceptions: `Throw` Statement](#throwing-exceptions-throw-statement)
  - [Catching Exceptions: `Try-Catch` Block](#catching-exceptions-try-catch-block)
  - [Then `finally` Clause](#then-finally-clause)
  - [Methods](#methods)
  - [Rethrowing Exceptions](#rethrowing-exceptions)
  - [Chained Exceptions](#chained-exceptions)
  - [Defining Custom Exception Classes](#defining-custom-exception-classes)

---

- Java’s exception-handling model is based on **three** operations:
  1. declaring an exception
  2. throwing an exception
  3. catching an exception

## Declaring Exceptions: `throws`

- `Declaring exceptions`: Every method must state the types of **checked exceptions** it might throw.

  - Because system errors and runtime errors can happen to any code, Java does **not require** that you declare `Error` and `RuntimeException` (unchecked exceptions) explicitly in the method.

  - All other exceptions thrown by the method must be **explicitly declared** in the method **header** so that the caller of the method is informed of the exception.

```java

//Declare an exception using keyword throws
public void methodName() throws Exception1, Exception2, ..., ExceptionN{

}
```

---

## Throwing Exceptions: `Throw` Statement

- Java enables a method to **throw an exception** that can be caught and handled by the caller.方法可以抛出异常.即方法可以控制抛出一个异常,即使不在 catch 块.

```java
//The argument is called the exception message

//方法1:
IllegalArgumentException ex =
new IllegalArgumentException("Wrong Argument");
throw ex;

//方法2:
throw new IllegalArgumentException("Wrong Argument");

```

- The value thrown is called an `exception`. The exception is an **object** created from an exception class.
- The execution of a `throw` statement is called **throwing an exception**.
- When an exception is thrown, the normal execution flow is **interrupted**. 中断执行.
- to “throw an exception” is to pass the exception from one place to another. 抛出异常,即将传递异常.
- The `throw` statement is **analogous to a method call**, but instead of calling a method, it calls a `catch` block. 抛出语句会调用 catch 块.

---

## Catching Exceptions: `Try-Catch` Block

- When an exception is thrown, it can be caught and handled in a `try-catch` block.

  - If no exceptions arise during the execution of the try block, the catch blocks are **skipped**.
  - If one of the statements inside the try block throws an exception, Java **skips the remaining statements** in the try block and starts the process of finding the code to handle the exception.终止执行 try 块,直接运行 catch 块.

- The code that handles the exception is called the `exception handler`.

  - The process of finding a handler is called **catching an exception**. 寻找 handler 的过程.

- Syntax:

```java

    try {
        // Statements that may throw exceptions
    } catch (Exception1 exVar1) {
        // handler for exception1;
    } catch (Exception2 exVar2) {
        // handler for exception2;
    } catch (ExceptionN exVarN) {
        // handler for exceptionN;
    }

    //use the new JDK 7 multi-catch feature
    //If one of the exceptions is caught, the handling code is executed
    catch (Exception1 | Exception2 | ... | Exceptionk ex) {
        // Same code for handling these exceptions
    }

```

- `try`:

  - The `try` block contains the code that is executed in **normal** circumstances. 正常运行的代码放在 try 块.
  - The statement for invoking the method is contained in a `try` block. 可能诱发异常的代码放在 try 块.

- `catch`:

  - a `catch` block is like a method definition with a parameter that matches the type of the value being thrown. 接住块相当于一个有参数的方法.
  - Unlike a method, after the catch block is executed, the program control does not return to the throw statement; instead, it executes the next statement after the catch block. 接住块不会返回任何值,只会执行块中的代码.
  - The exception is caught by the `catch` block. The code in the `catch` block is **executed to handle the exception**. catch 块接住异常,并处理.
  - Each catch block is examined **in turn**, from first to last, to see whether the type of the exception object is an instance of the exception class in the catch block.按顺序匹配异常类型.
    - The order in which exceptions are specified in catch blocks is important.顺序很重要.
    - If no handler is found in the chain of methods being invoked, the program terminates and prints an error message on the console.如果没有匹配,则终止程序并打印错误信息.

- Parameter: e

  - this parameter is referred to as a **catch–block parameter**.

  - The argument type, `ExceptionType`, declares the type of exception that the handler can handle and must be the name of a class that inherits from the `Throwable` class. 异常类型是 Throwable 的子类.
  - argument type: specifies what kind of exception the catch block can catch.参数类型表明接住块可以接住的异常类型.
  - Each catch block is an exception handler that **handles the type of exception indicated by its argument**. 每个 catch block 对应一种异常类型.
  - If a catch block catches exception objects of a **superclass**, it can catch all the exception objects of the subclasses of that superclass. 接住父类,将接住所有子类.
    - A `compile error` will result if a catch block for a superclass type appears before a catch block for a subclass type.父类要放在最后,否则会抛出编译器错误.

---

## Then `finally` Clause

- The `finally` clause is always executed **regardless whether an exception occurred or not.**

  - If **no exception** arises in the try block, finalStatements is executed, and the **next statement after the try** statement is executed. 无异常,try 后语句.
  - If a statement **causes an exception** in the try block that **is caught** in a catch block, the rest of the statements in the try block are **skipped**, the catch block is executed, and the finally clause is executed. The **next statement after the try** statement is executed. 异常,接住,try 后语句.
  - If one of the statements **causes an exception** that **is not caught** in any catch block, the other statements in the try block are **skipped**, the finally clause is executed, and the **exception is passed to the caller** of this method. 异常,无接住,向上抛出.

- The `finally` block executes even if there is a `return` statement prior to reaching the `finally` block.早于 return 语句.

- Syntax:

```java

try {
  // statements;
} catch (TheException ex) {
  // handling ex;
} finally {
  // finalStatements;
}

```

---

## Methods

| Method               | Return                | Description                                            |
| -------------------- | --------------------- | ------------------------------------------------------ |
| `.getMessage()`      | `String`              | Return message describing exception object.            |
| `.toString()`        | `String`              | Return fullname of exception, string of `getMessage()` |
| `.printStackTrace()` | `void`                | Print stack trace information on the console.          |
| `.getStackTrace()`   | `StackTraceElement[]` | Return an array of stack trace elements                |

---

## Rethrowing Exceptions

- Java allows an `exception handler` to **rethrow the exception** if the handler cannot process the exception or simply wants to let its caller be notified of the exception.
  即在 catch 块中的 throw 语句

```java
try {
  // statements;
} catch (TheException ex) {
  // perform operations before exits;
  throw ex; //rethrow exception
}
```

---

## Chained Exceptions

- `Chained exception`: throwing an exception along with another exception.

---

## Defining Custom Exception Classes

- Can create your own exception class, derived from Exception or from a subclass of `Exception`, such as `IOException`.

---

[TOP](#exception-handling-model)
