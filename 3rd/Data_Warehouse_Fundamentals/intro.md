# Warehouse - Intro

[Back](./index.md)

- [Warehouse - Intro](#warehouse---intro)
  - [Data Warehouse](#data-warehouse)
  - [SQL Recap](#sql-recap)
  - [Terminology](#terminology)
  - [SQL\*Plus Commands](#sqlplus-commands)

---

## Data Warehouse

- Data Warehouse
  - primarily an **analytical tool**
  - a database designed for querying, reporting, and analysis
  - contains historical data derived from transactional data
  - **separate** _analysis workload_ from _transactional workload_

---

## SQL Recap

- SQL Subcategories

  - `DDL(Data Definition Language)`

    - used to create and modify the **schema** of the database and its objects.
    - Command:
      - `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME`
      - `TRUNCATE`: actually **drops & re-creates** the table, and resets the table’s metadata

  - `DML(Data Manipulation Language)`

    - used to access, store, modify, update and delete the existing **records** from the database
    - Command:
      - `SELECT`, `INSERT`, `UPDATE`, `DELETE`

  - `DCL(Data Control Language)`

    - used to provide different users **access** to the stored data.
    - enables the data administrator to **grant or revoke** the required access to act as the database.
    - Commands:
      - `GRANT`, `REVOKE`

  - `TCL(Transaction Control Language)`
    - `transaction`:
      - A single unit of work in a database is formed after the consecutive execution of commands.
      - used to manage the transactions that take place in a database.
      - Commands:
        - `COMMIT`, `ROLLBACK`, `SAVEPOINT`

---

## Terminology

- People who are main figures in the data warehouse 业界大神

  - Bill Inmon
  - Ralph Kimball
  - These two are the industry heavyweights for data warehousing

- `OLTP (On-Line Transaction Processing)`

  - featured by **a large number of short on-line transactions** (`INSERT`, `UPDATE`, and `DELETE`).
  - The primary significance of OLTP operations is put on very rapid query processing, maintaining record integrity in multi-access environments, and effectiveness consistent by the number of transactions per second.
  - In the OLTP database, there is an accurate and current record, and **schema** used to save transactional database is the **entity model (usually 3NF)**.

- `OLAP (On-line Analytical Processing)`
  - represented by **a relatively low volume of transactions.**
  - Queries are very difficult and **involve aggregations**.
  - For OLAP operations, response time is an effectiveness measure.
  - OLAP applications are generally used by **Data Mining** techniques.
  - In OLAP database there is **aggregated**, **historical** information, stored in **multi-dimensional schemas** (generally star schema).

| Criteria             | OLAP                                                                                    | OLTP                                                                          |
| -------------------- | --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| Purpose              | analyze large volumes of data for decision-making.                                      | manage and process real-time transactions.                                    |
| Data source          | historical and aggregated data from multiple sources.                                   | real-time and transactional data from a single source.                        |
| Data structure       | multidimensional (cubes) or relational databases.                                       | relational databases.                                                         |
| Data model           | star schema, snowflake schema, or other analytical models.                              | normalized or denormalized models.                                            |
| Volume of data       | large storage requirements.                                                             | comparatively smaller storage requirements.                                   |
| Response time        | longer response times                                                                   | shorter response times                                                        |
| Example applications | good for analyzing trends, predicting customer behavior, and identifying profitability. | good for processing payments, customer data management, and order processing. |

- `ETL(Extraction, Transformation and Loading)`

  - the process of combining data from multiple sources into a large, central repository called a data warehouse.

- `database`

  - a place to store information.
  - The database stores the information in a well-structured format.
  - It can store the simplest data, such as a list of people as well as the most complex data.

- `database schema`
  - the **logical representation** of a database, which shows **how the data is stored logically** in the entire database.
  - It contains list of attributes and instruction that informs the database engine that how the data is organized and how the elements are related to each other.
  - A database schema contains **schema objects** that may include **tables**, **fields**, **packages**, **views**, **relationships**, **primary key**, **foreign key**.

---

## SQL\*Plus Commands

- `SQL*Plus`
  - a command-line tool that provides access to the Oracle RDBMS.

| Command         | Description                     |
| --------------- | ------------------------------- |
| `SQLPLUS`       | Log in to SQL Plus              |
| `EXIT` / `QUIT` | Log out of SQL\*Plus            |
| `CONNECT`       | Connect to a database           |
| `DISCONNECT`    | Connect to a database           |
| `STARTUP`       | Start up a database             |
| `SHUTDOWN`      | Shut down a database            |
| `DESCRIBE`      | List column definitions         |
| `SHOW`          | Show SQL\*Plus system variables |

---

[TOP](#warehouse---intro)
