# Java Thread Pool

[Back](../index.md)

- [Java Thread Pool](#java-thread-pool)
  - [Thread Pools](#thread-pools)
  - [Executor](#executor)
  - [ExecutorService](#executorservice)

---

## Thread Pools

- `thread pool`: represents a group of worker threads that are waiting for the job and reused many times.

- `Executor` interface: **execute tasks** in a thread pool.
- `ExecutorService` interface for **managing and controlling** tasks.

---

## Executor

- `Executor` interface

| Method                                      | Description                                                                                                                                             |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `execute(Runnable object):void`             | Executes the runnable task.                                                                                                                             |
| `newFixedThreadPool(int s):ExecutorService` | creates a thread pool of the fixed size s.                                                                                                              |
| `newCachedThreadPool()`                     | creates a new thread pool that creates the new threads when needed but will still use the previously created thread whenever they are available to use. |

- The `newFixedThreadPool(int)` method creates a fixed number of threads in a pool.

  - If a thread completes executing a task, it can be **reused to execute another** task.
  - If a thread terminates due to a failure prior to shutdown, a **new thread will be created to replace it** when all the threads in the pool are not idle and there are tasks waiting for execution.

- The `newCachedThreadPool()` method creates a new thread if all the threads in the pool are not idle and there are tasks waiting for
  execution.

  - A thread in a cached pool will be terminated if it has not been used for 60 seconds. A cached pool is efficient for many short tasks.

---

## ExecutorService

- `ExecutorService` interface

| Method                         | Description                                                                    |
| ------------------------------ | ------------------------------------------------------------------------------ |
| `shutdown():void`              | Shut down the executor to stop accepting new tasks, and allow taks to complete |
| `shutdownNow():List<Runnable>` | Shut down the executor immediately. Returns a list of unfinished tasks.        |
| `isShutdown():boolean`         | Return true if the executor has been shut down.                                |
| `isTerminated():boolean`       | Return true if all tasks in the pool are terminated.                           |

---

---

[TOP](#java-thread-pool)
