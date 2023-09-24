# Warehouse - Intro

[Back](./index.md)

- [Warehouse - Intro](#warehouse---intro)
  - [Data Warehouse](#data-warehouse)
  - [SQL Recap](#sql-recap)
  - [Software](#software)
  - [Terminology](#terminology)
  - [SQL\*Plus Commands](#sqlplus-commands)
  - [Evolution of Information Mangement and Data Warehousing](#evolution-of-information-mangement-and-data-warehousing)

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

## Software

- `Oracle SQL*Plus`:

  - A windows or command-line application that helps in submitting SQL statement and PL/SQL blocks for execution and receiving the results.
  - shipped with the databsse and installed on the database server system.

- `Oracle SQL Developer`:
  - A free graphical tool used for databae development.

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

## Evolution of Information Mangement and Data Warehousing

- Executive Information System (EIS) >> Decision Support System (DSS) >> Data Extract Processing

- `ad hoc`
  - “for this” or "for this situation."
  - describe something that has been formed or used for a special and immediate purpose, without previous planning.

---

- `Executive Information System (EIS)`

  - a.k.a. `Management Information System (MIS)`
  - reports developed by MIS developers.
  - disadvantage: take a long time to generate report

- `Decision Support System (DSS)`

  - Users have direct access to the operational data.
  - supports additional ad hoc querying for flexible reporting.
  - Challenges with analyzing data from operational systems.
    - Operational Systems
      - are highly structured, usually in 3NF
      - are designed for high performance and throughput
      - don't present data meaningfully to the end user.
      - can have dispersed across multiple systems.
      - are OLTP systems and not suitable for intensive queries.

- `Data Extract Processing`

  - Data is extracted into a separate system for use by analysts.
  - a way to move the data from the high-performance, high-throughput OLTP system onto client machines that are dedicated to analysis.
  - gives the user ownershipt of the data.
  - Challenges
    - Different extracts leads to multiple data sources.
    - Extract explosion: no coherent view across different extracts.
    - No uniform structure to generate analysis report.
    - Result in poor data quality.

- `Data Warehousing`

  - benefits:
    - high-quality information
    - single source of data
    - No duplication of effort.
    - No need for tools to support many technologies.
    - uniform data, no disparity.
    - No time-period conflict.
    - No drill-down restrictions.

---

- `Business Intelligence`

  - a mechanism to query the warehouse data and provide analytic reports.

---

- `Big Data`

  - variety
  - Volume
  - Velocity
  - Veracity

- `Data Lake`
  - a centralized repository that allows to store all structured, semi-structured, and unstructured data at any scall.

---

- `Modern Data Warehouse`
  - Include self-service data ingestion and transformation services.
  - Supports SQL, machine learning, graph, and spatial processing.
  - Provides multiple analytics options that make it easy to use data without moving it
  - Automates management for simple provisioning, scalling, and adminstration.

---

[TOP](#warehouse---intro)
