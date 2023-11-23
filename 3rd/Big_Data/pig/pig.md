# Pig

[Back](../index.md)

- [Pig](#pig)
  - [Apache Pig](#apache-pig)
    - [Features of Apache Pig](#features-of-apache-pig)
    - [Advantages of Apache Pig](#advantages-of-apache-pig)
    - [Pig Philosophy](#pig-philosophy)
    - [Differences between Apache MapReduce and PIG](#differences-between-apache-mapreduce-and-pig)
  - [Run Modes](#run-modes)
    - [Local Mode](#local-mode)
    - [MapReduce Mode](#mapreduce-mode)
  - [Ways to execute Pig Program](#ways-to-execute-pig-program)
  - [Pig Latin](#pig-latin)
    - [Statements](#statements)
    - [Conventions](#conventions)
    - [Data Types](#data-types)
  - [Example](#example)
  - [UDF (User Defined Functions)](#udf-user-defined-functions)
  - [Relations](#relations)
    - [Relational Operators](#relational-operators)
      - [`LOAD` Operator](#load-operator)
    - [`CROSS` Operator](#cross-operator)
    - [`DISTINCT` Operator](#distinct-operator)
    - [`FILTER` Operator](#filter-operator)
    - [`FOREACH` Operator](#foreach-operator)
    - [`Group` Operator](#group-operator)
    - [`LIMIT` Operator](#limit-operator)
    - [`ORDER BY` Operator](#order-by-operator)
    - [`SPLIT` Operator](#split-operator)
    - [`UNION` Operator](#union-operator)

---

## Apache Pig

- `Pig`

  - a high-level **data flow platform for executing Map Reduce programs** of Hadoop.
  - An **engine** that executes `Pig Latin` locally or on a Hadoop cluster

- **A domain specific language:**
  - **Dataflow** programming
  - **No control flow** (i.e. no if/then statements)
- A **scripting** language
  - Ease of use, rapid data sampling, prototyping
  - Command prompt (gruntshell)
- Built on top of `MapReduce`
  - **Transforms** operations into a sequence of MapReduce jobs

---

- `Pig Latin`

  - The language for Pig.
  - a high level data processing language.

- The `Pig scripts` get **internally converted** to `Map Reduce` jobs and get executed on data stored in HDFS. - `Pig` can also execute its job in `Apache Tez` or `Apache Spark`.

- Pig can **handle any type** of data.
  - i.e., structured, semi-structured or unstructured and stores the corresponding results into Hadoop Data File System.
- Every **task** which can be **achieved** using PIG can also be **achieved** using java used in MapReduce.

---

### Features of Apache Pig

- **Ease of programming**

  - Writing complex java programs for map reduce is quite tough for non-programmers.
  - Pig makes this process easy. In the Pig, the queries are converted to MapReduce internally.

- **Optimization opportunities**

  - It is how tasks are encoded permits the system to **optimize their execution automatically**, allowing the user to focus on semantics rather than efficiency.

- **Extensibility**

  - A user-defined **function** is written in which the user can write their logic to execute over the data set.

- **Flexible**

  - It can easily handle **structured** as well as **unstructured** data.

- **In-built operators**

  - It contains various type of **operators** such as **sort**, **filter** and **joins**.

- pig doesn’t execute **until** it sees a keyword such as `dump` or `store`

---

### Advantages of Apache Pig

- **Less code**

  - The Pig consumes **less line of code** to perform any operation.

- **Reusability**

  - The Pig code is **flexible** enough to reuse again.

- **Nested data types**
  - The Pig provides a useful concept of nested data types like **tuple**, **bag**, and **map**.

---

- Faster **development**

  - Fewer lines of **code**
  - Don’t re-invent the wheel
  - No M/R programming
  - **Joins** in M/R are painful
  - **Chaining** together M/R jobs is tedious

- **Flexible**
  - `Metadata` is optional (direct access to files)
  - **Extensible** (UDFs ➔Piggybank, DataFu, etc.)

---

- Pig is good at

  - Ad hoc **analysis**
  - Data **warehousing**
  - Building **reports**
  - Processing **large** data sets
  - Handling **structured** or **unstructured** data

- not so great at
  - **Iterative** algorithms
  - **Graph** algorithms
  - Algorithms that **“converge”** (because there’s no control flow to check **convergence**)

---

### Pig Philosophy

- Pigs **eats** anything

  - Pig can operate on **data** whether it has **metadata** or not.
  - It can operate on data that is relational, nested, or unstructured. And it can easily be extended to operate on data beyond files, including key/value stores, databases, etc.

- Pigs **live** anywhere

  - Pig is intended to be a language for **parallel data processing**.
  - It is not tied to one particular parallel framework (e.g., Pig on Spark, Pig on Storm)

- Pigs are **domestic** animals
  - Designed to be easily controlled and **modified** by users via `User-DefinedFunctions (UDF)` and Stream command, etc.

---

### Differences between Apache MapReduce and PIG

| Apache MapReduce                                           | Apache PIG                                                |
| ---------------------------------------------------------- | --------------------------------------------------------- |
| _low-level_ **data processing tool**.                      | _high-level_ **data flow tool**.                          |
| required to develop complex programs using Java or Python. | not required to develop complex programs.                 |
| difficult to perform data operations in MapReduce.         | It provides built-in operators to perform data operations |
| doesn't allow nested data types.                           | It provides nested data types like tuple, bag, and map.   |

---

## Run Modes

- Apache Pig executes in two modes:
  - `Local Mode`
  - `MapReduce Mode`.

---

### Local Mode

- It executes in a `single JVM` and is used for development **experimenting** and **prototyping**.
- files are installed and run using **localhost**.
  - The local mode works on a **local file system**.
  - The input and output data stored in the **local file system**.

```sh
pig-x local
```

---

### MapReduce Mode

- The MapReduce mode is also known as `Hadoop Mode`.
- It is the **default mode**.
- In this Pig renders `Pig Latin` into `MapReduce` jobs and executes them on the cluster.
  - It can be executed against **semi-distributed** or **fully distributed** Hadoop installation.
  - Here, the input and output data are present **on HDFS**.

```sh
pig
pig -x mapreduce
```

---

## Ways to execute Pig Program

- These are the following **ways of executing** a Pig program on `local` and `MapReduce mode`: -

  - **Interactive Mode**

    - In this mode, the Pig is executed in the `Grunt shell`.
      - To invoke Grunt shell, run the `pig` command.
      - Once the Grunt mode executes, we can provide `Pig Latin` statements and command interactively at the command line.

  - **Batch Mode**

    - In this mode, we can **run a script file** having a `.pig` extension.
    - These files contain Pig Latin commands.

  - **Embedded Mode**
    - In this mode, we can **define our own functions**.
    - These functions can be called as `UDF (User Defined Functions)`.
      - Here, we use programming languages like `Java` and `Python`.

---

## Pig Latin

- `Pig Latin`
  - a **data flow language** used by `Apache Pig` to **analyze the data** in Hadoop.
  - It is a textual language that abstracts the programming from the Java MapReduce idiom into a **notation**.

---

### Statements

- The `Pig Latin statements`

  - used to process the data.
  - It is an operator that **accepts a relation as an input** and generates **another relation as an output**.

- It can **span multiple lines**.
- Each statement **must end with a semi-colon**.
- It may include **expression** and **schemas**.
- By default, these statements are processed using **multi-query execution**

---

### Conventions

| Convention | Description                                         | Example                     |
| ---------- | --------------------------------------------------- | --------------------------- |
| `( )`      | enclose one or more items. the `tuple` data type.   | `(10, xyz, (3,6,9))`        |
| `[ ]`      | enclose one or more items.the `map` data type.      | `[INNER \| OUTER]`          |
| `{ }`      | enclose **two** or more items. the `bag` data type. | `{ block \| nested_block }` |
| `...`      | repeat a portion of the code.                       | `cat path [path ...]`       |

---

### Data Types

- Simple Data Types

| Type       | Description                   | Example                          |
| ---------- | ----------------------------- | -------------------------------- |
| boolean    | the boolean type values.      | `true/false`                     |
| Int        | Signed 32 bit integer         | `2`                              |
| biginteger | Java BigInteger values.       | `5000000000000`                  |
| Long       | Signed 64 bit integer         | `15L` or `15l`                   |
| Float      | 32 bit floating point         | `2.5f` or `2.5F`                 |
| Double     | 32 bit floating point         | `1.5` or `1.5e2` or `1.5E2`      |
| bigdecimal | Java BigDecimal values.       | `52.232344535345`                |
| charArray  | Character array               | `hello javatpoint`               |
| byteArray  | BLOB(Byte array)              |                                  |
| datetime   | the values in datetime order. | `1970-01- 01T00:00:00.000+00:00` |

- Complex Types

| Type    | Description                            | Example              |
| ------- | -------------------------------------- | -------------------- |
| `tuple` | an ordered set of fields.(`TOTUPLE()`) | `(15,12)`            |
| `bag`   | a collection of tuples.(`TOBAG()`)     | `{(15,12), (12,15)}` |
| `map`   | a set of key-value pairs. (`TOMAP()`)  | `[open#apache]`      |

---

## Example

- Using Pig find the most occurred start letter.

```java
// Load the data into bag named "lines". The entire line is stuck to element line of type character array.
lines  = LOAD "/user/Desktop/data.txt" AS (line: chararray);
// The text in the bag lines needs to be tokenized this produces one word per row.
tokens = FOREACH lines GENERATE flatten(TOKENIZE(line)) As token: chararray;
// To retain the first letter of each word type the below command .This commands uses substring method to take the first character.
letters = FOREACH tokens  GENERATE SUBSTRING(0,1) as letter : chararray;
// Create a bag for unique character where the grouped bag will contain the same character for each occurrence of that character.
lettergrp = GROUP letters by letter;

// The number of occurrence is counted in each group.
countletter  = FOREACH  lettergrp  GENERATE group  , COUNT(letters);

// Arrange the output according to count in descending order using the commands below.
OrderCnt = ORDER countletter BY  $1  DESC;

//  Limit to One to give the result.
result = LIMIT OrderCnt 1;

// Store the result in HDFS . The result is saved in output directory under sonoo folder.
STORE result into 'home/sonoo/output';
```

---

## UDF (User Defined Functions)

- To specify custom processing, Pig provides support for `user-defined functions (UDFs)`.
- Thus, Pig allows us to create our own functions. Currently, Pig UDFs can be implemented using the following programming languages:

  - Java
  - Python
  - Jython
  - JavaScript
  - Ruby
  - Groovy

- Pig provides the most extensive support for Java functions.
- All `UDFs` must **extend** `org.apache.pig.EvalFunc`
- All functions must **override** the `exec` method.

---

## Relations

- Pig’s **fundamental building blocks**
- Similar to a **table**
- Don’t confuse it with variables in other languages

```sh
a = LOAD '/user/root/pig/full_text.txt' AS (id:chararray, ts:chararray, location:chararray, lat:float, lon:float, tweet:chararray);
```

---

### Relational Operators

#### `LOAD` Operator

- used to load the data from the file system.

```java
LOAD 'file_name' [USING load function] [AS (SCHEMA)];
```

- ie: `a = LOAD '/user/root/pig/full_text.txt' USING PigStorage('\t') AS (id:chararray, ts:chararray, location:chararray, lat:float, lon:float, tweet:chararray);`

- Example

- `pload.txt`

```txt
1,2,3,4
5,6,7,8
4,3,2,1
8,7,6,5
```

```java
// in pig shell
// Load the file that contains the data.
A = LOAD '/pigexample/pload.txt' USING PigStorage(',') AS (a1:int,a2:int,a3:int,a4:int);

// display data
DUMP A
// (1,2,3,4)
// (5,6,7,8)
// (4,3,2,1)
// (8,7,6,5)

// check the corresponding schema.
DESCRIBE A;
// {a1: int, a2: int, a3: int, a4: int}
```

---

### `CROSS` Operator

- facilitates to **compute the cross** product of two or more **relations**.
- Using `CROSS` operator is an expensive operation and should be used **sparingly**.

- Example

- `pcross1.txt`

```txt
2,5
3,6
```

- `pcross2.txt`

```txt
3,6,8
2,6,9
```

- Pig

```java
// Load the file that contains the data.
A = LOAD '/pigexample/pcross1.txt' USING PigStorage(',') AS (a1:int,a2:int);
DUMP A;

B = LOAD '/pigexample/pcross2.txt' USING PigStorage(',') AS (b1:int,b2:int,b3:int);
DUMP B;

Result = CROSS A,B;
DUMP Result;
// (3,6,2,6,9)
// (3,6,3,6,8)
// (2,5,2,6,9)
// (2,5,3,6,8)

```

---

### `DISTINCT` Operator

- remove duplicate tuples in a relation.
- Initially, Pig **sorts** the given data and then eliminates duplicates.

-Example:

- `pdistinct.txt`

```txt
1,3,5
2,1,4
1,3,5
1,3,5
1,4,2
2,1,4
```

- Pig

```java
A = LOAD '/pigexample/pdistinct.txt' USING PigStorage(',') as (a1:int,a2:int,a3:int);
DUMP A;

Result = DISTINCT A;
DUMP Result;
// (1,3,5)
// (1,4,2)
// (2,1,4)
```

---

### `FILTER` Operator

- Used to fileter data.

- Example

- `pfilter.txt`

```txt
1,2
2,8
4,5
9,3
7,8
```

- Pig

```java
A = LOAD '/pigexample/pfilter.txt' USING PigStorage(',') AS (a1:int,a2:int);
DUMP A;

Result = FILTER A BY a2==8;
DUMP Result;
// (2,8)
// (7,8)
```

---

### `FOREACH` Operator

- traverse the data

- Example

- `pforeach.txt`

```txt
1,2,3
4,5,6
7,8,9
```

- Pig

```java
A = LOAD '/pigexample/pforeach.txt' USING PigStorage(',') AS (a1:int,a2:int,a3:int);
DUMP A

// traverse the data of two columns.
fe = FOREACH A generate a1,a2;
DUMP fe
// (1,2)
// (4,5)
// (7,8)

```

---

### `Group` Operator

- used to group the data in one or more relations.

  - It groups the `tuples` that contain **a similar group key**.
  - If the group key has **more than one field**, it treats as `tuple` otherwise it will be the same type as that of the group key.
  - In a result, it provides a relation that **contains one tuple per group**.

- Example

- `piginput2.txt`

```txt
Jason,Roy,1
John,Thomson,2
Chris,Roy,3
Nick,Holder,4
Jame,William,5
Chris,Holder,6
```

- Pig

```java
A = LOAD '/pigexample/piginput2.txt' USING PigStorage(',') AS (fname:chararray,l_name:chararray,id:int);
DUMP A;

group groupbylname = group A by l_name;
DUMP groupbylname
// (Roy,{(Chris, Roy, 3),(Jason, Roy, 1)})
// (Holder,{(Chris,Holder,6),(Nick,Holder,4)})
// (Thomson,{(John,Thomson,2)})
// (William,{(Jame,William,5)})
```

---

### `LIMIT` Operator

- limit the number of output tuples.

  - However, if you specify the limit of output tuples equal to or more than the number of tuples exists, all the tuples in the relation are returned.

- Example:

- `plimit.txt`

```txt
5,2,1
3,2,7
8,2,3
```

- Pig

```java
A = LOAD '/pigexample/plimit.txt' USING PigStorage(',') AS (a1:int,a2:int,a3:int) ;
DUMP A;

Result = LIMIT A 2;
DUMP Result;
// 5,2,1
// 3,2,7
```

---

### `ORDER BY` Operator

- sorts a relation based on one or more fields.

- Example

- `porder.txt`

```java
5,2,3
1,3,8
9,3,6
6,4,8
1,2,5
```

- Pig

```java
A = LOAD '/pigexample/porder.txt' USING PigStorage(',') AS (a1:int,a2:int,a3:int) ;
DUMP A;

Result = ORDER A BY a1 DESC;
DUMP Result;
// (9,3,6)
// (6,4,8)
// (5,2,3)
// (1,2,5)
// (1,3,8)
```

---

### `SPLIT` Operator

- **breaks** the relation **into two or more relations** according to the provided **expression**.

  - Here, a tuple may or may not be assigned to one or more than one relation.

- Example:

- `psplit.txt`

```txt
3,2
1,8
4,9
2,6
1,7
2,1
```

- Pig

```java
A = LOAD '/pigexample/psplit.txt' USING PigStorage(',') AS (a1:int,a2:int);
DUMP A;

SPLIT A INTO X IF a1<=2, Y IF a1>2;
DUMP X;
// (1,8)
// (2,6)
// (1,7)
// (2,1)
DUMP Y;
// (3,2)
// (4,9)
```

---

### `UNION` Operator

- used to compute the union of two or more relations.

  - It **doesn**'t maintain the **order** of tuples.
  - It also **doesn**'t **eliminate** the duplicate tuples.

- Example

- `punion1.txt`

```txt
1,2
3,4
```

- `punion2.txt`

```txt
5,6,7
8,9,10
```

- Pig

```java
A = load '/pigexample/punion1.txt' using PigStorage(',') as (a1:int,a2:int);
DUMP A;

B = LOAD '/pigexample/punion2.txt' USING PigStorage(',') AS (b1:int,b2:int,b3:int);
DUMP B;

Result = UNION A,B;
DUMP Result;
// (5,6,7)
// (8,9,10)
// (1,2)
// (3,4)

```

---

[TOP](#pig)
