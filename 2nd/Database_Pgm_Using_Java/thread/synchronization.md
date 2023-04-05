# Java Synchronization

[Back](../index.md)

- [Java Synchronization](#java-synchronization)
  - [Thread Synchronization](#thread-synchronization)
  - [Synchronizing Statements](#synchronizing-statements)

## Thread Synchronization

- `race condition`: the data-corruption problem that occurs when all the threads (tasks) have access to the **same data source** (common resource) simultaneously in a way that causes a conflict.

- `thread-safe`: if an object of the class does not cause a `race condition` in the presence of multiple threads.

- `critical region`: To avoid race conditions, it is necessary to prevent more than one thread from simultaneously **entering a certain part of the program**

- use the keyword `synchronized` to synchronize the method so that only one thread can access the method at a time.

- A `synchronized method` acquires a **lock** before it executes.
  - A lock is a mechanism for exclusive use of a resource.
    - `an instance method`: the lock is on the **object** for which the method was invoked.
    - `a static method`: the lock is on the **class**.
  - If one thread invokes a synchronized instance method (respectively, static method) on an object, the **lock** of that object (respectively, class) is **acquired first**, then the method is executed, and **finally the lock is released**.
  - Another thread invoking the same method of that object (respectively, class) is blocked **until the lock is released**.

---

## Synchronizing Statements

- **Invoking** a synchronized instance method of an object **acquires a lock** on the object, and **invoking** a synchronized static method of a class **acquires a lock** on the class.

- A synchronized statement can be used to acquire a lock on any object, not just this object, when executing a block of the code in a method. This block is referred to as a `synchronized block`.

- The general form of a synchronized statement is as follows

  ```java
  synchronized (expr) {
    statements;
  }
  ```

- The expression `expr` must evaluate to an object reference.

  - If the object is already locked by another thread, the thread is blocked until the lock is released.
  - When a lock is obtained on the object, the statements in the synchronized block are executed and then the lock is released.

- Synchronized statements enable you to synchronize part of the code in a method instead of the entire method. This increases concurrency.

- Example:

  ```java
  synchronized (account) {
    account.deposit(1);
  }
  ```

- Any synchronized instance method can be converted into a synchronized statement.

```java
// synchronized instance method
public synchronized void xMethod(){

}

// synchronized statement
public void xMethod(){
  synchronized(this){

  }
}

```

---

[TOP](#synchronization-in-java)
