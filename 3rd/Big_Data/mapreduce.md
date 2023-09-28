# Hadoop - MapReduce

[Back](./index.md)

- [Hadoop - MapReduce](#hadoop---mapreduce)
  - [MapReduce](#mapreduce)
  - [Map Phase](#map-phase)
  - [Combiner Phase](#combiner-phase)
  - [Shuffle \& Sort Phase](#shuffle--sort-phase)
  - [Reduce Phase](#reduce-phase)
    - [MapReduce – With Single Reducer](#mapreduce--with-single-reducer)
    - [MapReduce – With Multiple Reducers](#mapreduce--with-multiple-reducers)
  - [Summary](#summary)
  - [Data Access - Hadoop](#data-access---hadoop)
  - [MapReduce Execution](#mapreduce-execution)
    - [Job Tracker: Name Node](#job-tracker-name-node)
    - [Task Tracker: Data Node](#task-tracker-data-node)

---

## MapReduce

- `MapReduce`
  - a programming **model**
  - Process data-sets **in-parallel**
    - Scale across thousands of nodes on commodity hardware
- **Reliable** and **Fault Tolerant**
- Complex details are **abstracted** away

  - No I/O
  - No networking code
  - No synchronization

- MapReduce works by breaking the processing into two phases:

  - the **map phase**
  - the **reduce phase**
  - Can also use a 3rd phase **for scaling out**
    - **Combiner Function**

- Each phase has `<key, value>` pairs **as input and output**
- Each node processes data stored on that node (locality)

- (input) -> **map** -> `<k2, v2>` -> combine -> `<k3, v3>` -> **reduce** -> (output)

![example](./pic/mapreduce_example.png)

---

## Map Phase

- Hadoop creates one **map task** for each **split**

  - Each **mapper** processes **a single input split** from HDFS
  - Each map task process data **one line at a time**
  - Each line is transformed into a key and a value (**key-value pair**)

- The **number of maps** is usually driven by the total size of the inputs, that is, the **total number of blocks of the input files**.
  - Number of maps driven by total number of blocks of the files.

![map phase](./pic/map_phase.png)

---

## Combiner Phase

- Same as the Reducer
- Occurs on the **same node as the Map Process**
- Performs **local aggregation**, after being sorted on the keys

- May **not be appropriate for all** algorithms
  - Example: It may not be suitable for “mean” calculation

![combine phase](./pic/combine_phase.png)

---

## Shuffle & Sort Phase

- Makes sure that all the values associated with the **same intermediate key** are sent to the **same reducer**
- **Performed automatically**;
  - Programmer does not have to code this phase

![shuffle phase](./pic/shuffle_sort_phase.png)

---

## Reduce Phase

- Reducer **receives the key** and associated **list of values** and then does the **reduce operations**

- Reducer **writes output** to HDFS
- By **default**, there is a **single** reducer

![reduce phase](./pic/reduce_phase.png)

---

### MapReduce – With Single Reducer

![single reducer](./pic/single_reducer.png)

---

### MapReduce – With Multiple Reducers

![multiple reducers](./pic/multiple_reducers.png)

---

## Summary

- **Automatic parallelization** and **distribution**
  - It makes M/R programming much easier
- Developer simply need to **focus on writing the map** and **reduce functions**
- M/R is written in **Java**
- It also supports **Python** Streaming
  - writing map and reduce function in python
- Typically, **compute nodes** and the **storage nodes** are the same
- Takes Advantage of **Data Locality**

---

## Data Access - Hadoop

- `Data Locality`
  - Hadoop tries to process data on the **same machine** that stores it
- This improves performance and conserves bandwidth
- **Brings computation to the data** (该处是将计算前移到数据所在处, 不是汇合数据.)

---

## MapReduce Execution

- **Terminology**

- `Job`

  - Consists of **a Mapper**, **a Reducer**, and a list of **input files**

- `Task`

  - An **individual unit of work**
  - A `job` is broken down into many `tasks`
    - map tasks or reduce tasks

- `Client`
  - Machine on which the program runs

---

- **Architecture**

![mapreduce_execution_architecture](./pic/mapreduce_execution_architecture.png)

![mapreduce_architecture](./pic/mapreduce_architecture.png)

---

### Job Tracker: Name Node

- Manages the **MapReduce execution**

  - **Client** contacts `Job Tracker` to **launch jobs**
  - It communicates with `NameNode` to **get data locations**
  - **Identifies** `TaskTrackers` to executes the job (accounts for data locality or proximity)
  - **Monitors** `TaskTrackers`;
  - Provides job status updates to the client

- When JobTracker is **down** – **no** MapReduce (Similar to NameNode failure)

- To view jobs:
  - http://sandbox-hdp.hortonworks.com:8088

---

### Task Tracker: Data Node

- Runs on `Data Nodes` (that’s how it can take advantage of **data locality**)
- TaskTracker **execute individual Map and Reduce processes**
- Sends **periodic updates** (heartbeats) **to JobTracker**
- If Task Tracker **fails** then JobTracker will **reassign** the job to another Task Tracker

---

[TOP](#hadoop---mapreduce)
