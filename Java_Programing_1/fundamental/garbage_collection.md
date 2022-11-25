# Garbage Collection

[Back to Java](../index.md)

[TOC]

---

## Garbage Collection 垃圾回收

- When objects are no longer needed they should be **destroyed**. This frees up the memory that they consumed.

- Java handles all of the memory operations for you. Simply set the reference to null and Java will reclaim the memory.

- The `Java Virtual Machine` has a process that runs in the background that **reclaims memory** from released objects. The `garbage collector` will reclaim memory from any object that no longer has a valid reference pointing to it.

- 注意: 
    - 当对象的字段没有指针时pointer,会被回收,即有丢失数据的风险.


