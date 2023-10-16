# Warehouse - Storage

[Back](../index.md)

- [Warehouse - Storage](#warehouse---storage)
  - [Partitioning](#partitioning)
    - [BENEFITS OF ORACLE PARTITIONING](#benefits-of-oracle-partitioning)
  - [What can be partitioned?](#what-can-be-partitioned)
  - [Partitioning Methods](#partitioning-methods)
    - [Range Partitioning](#range-partitioning)
    - [List Partitioning](#list-partitioning)
  - [Composite Partitioning](#composite-partitioning)
  - [Example: Single-level partitioning](#example-single-level-partitioning)
  - [Example: Composite Partitioning](#example-composite-partitioning)
  - [Example: select data from partitioning](#example-select-data-from-partitioning)
  - [Example: Explain Plans](#example-explain-plans)

---

## Partitioning

- `Partitioning`

  - a functionality that allows tables, indexes, and index-organized tables to be **subdivided into smaller pieces**, enabling these database objects to be managed and accessed at a finer level of granularity.

- Oracle provides a comprehensive range of partitioning schemes to address every business requirement.
- Moreover, since it is entirely transparent in SQL statements, partitioning can be **used with any application**, from packaged _OLTP applications_ to _data warehouses_.

- Note inclass:
  - Max range: 64k for a tb
  - Partition are created in different tbsp.
  - Partitions are created **when a tb is created**, so it only is affected by **ddl**, not dml.
  - Once created, when data come, they will be placed in the specific **partition automatically**.

---

### BENEFITS OF ORACLE PARTITIONING

- Performance:

  - lowers data access times

    - reduce the amount of data retrieved from storage
    - improves query performance and optimizes resource utilization.

  - only work on the data that is relevant
  - enable data management operations such as

    - data loads, joins and pruning,
    - Index creation and rebuilding
    - Optimizer statistics management
    - Backup and recovery

- Availability:

  - improves access to critical information
  - individual partition manageability
  - reduce
    - manitenance windows
    - impact of scheduled downtime and failures
    - recoery times
  - 即使部分不可用, 其他部分也可用

- Costs:

  - leverage multiple storage tiers.
  - store data in the most appropriate manner
  - 将 active 的数据与非 less active 数据分别存放, 利用不同储存价格.

- Easy Implementation:

  - requires no changes to applications and queries.
  - adjustments might be necessary to fully exploit the benefit of partitioning.

- Mature Feature

  - supports a wide array of partitioning methods

- Well Proven

  - used by thousands of Oracle customers.

---

## What can be partitioned?

- Tables
  - heap tables
  - index-organized tables
- Indexes
  - global indexes
  - local indexes
- materialized Views
- Hash Clusters

---

## Partitioning Methods

- Single-level partitioning
  - Range
  - List
  - Hash
    - If you want the partitions to **contain a balance of values** then the `HASH` partition can be used

---

### Range Partitioning

- Data is organized in ranges

  - lower boundary derived by upper boundary of preceding partition
  - Split and merge as necessary
  - No gaps

- Ideal for chronological data 时间数据
- works well with **time**, **money amounts**, and items that can be placed into **alphabetic order**

---

### List Partitioning

- Data is organized in lists of values:

  - one or more unordered distince values per list
  - functionality of default partition (Catch-it-all for all unspecified values)
  - Check contents of Default partition - Create new partitions as per need.

- Ideal for segmentation of distinct values, e.g. region
- based on **values that can be listed**, provinces, cities, teams

---

## Composite Partitioning

- Data is organized along two dimensions:

  - Record placement is deterministically identified by dimensions
  - e.g.: range-list

- Partition pruning is **independent** of composite order

  - Pruning along one or both dimensions
  - Same pruning for RANGE-LIST and LIST-RANGE.

- Some partitions can contain **subpartitions**
- For instance a:
  - RANGE-HASH
  - RANGE-LIST
  - RANGE-RANGE
  - LIST-RANGE
  - LIST-LIST
  - LIST-HASH
- Would **first** partition on the **outer** partition type, then partition on the **inner** type of partition

---

## Example: Single-level partitioning

```sql
CREATE TABLE tb_name
(
    car_id      number,
    car_model   varchar2(30),
    sale_price  number,
)
PARTITION BY RANGE(sale_price)
    (
        PARTITION part1     values less than (40000),
        PARTITION part2     values less than (MAXVALUE)
    );
```

---

## Example: Composite Partitioning

- The `SUBPARTITION TEMPLATE` will **create subpartitions for each partition** with have to write all the code for each partition.

```sql
create table my_sales_table
(
    invoice_id      number(16) primary key,
    invoice_date    date,
    region_code     varchar2(5),
    invoice_amount  number
)
partition by range (invoice_date)
subpartition by list (region_code)
subpartition template
(
    subpartition US     values ('US')       tablespace tbs_US,
    subpartition EMEA   values ('EMEA')     tablespace tbs_EMEA,
    subpartition ASIA   values ('ASIA')     tablespace tbs_ASIA,
    subpartition OTHERS values ('DEFAULT')  tablespace tbs_OTHERS,

)
(
    partition p_2018    values less than (to_date('01-JAN-2019','DD-MON-YYYY')),
    partition p_2019    values less than (to_date('01-JAN-2020','DD-MON-YYYY'))
)
```

---

## Example: select data from partitioning

```sql
# select all
select * from tb_name;

# select from partitioning
SELECT car_model, sale_price FROM car_amounts_part PARTITION(part_name);

```

---

## Example: Explain Plans

- Note inclass:
  - Explain plan: common for fine tune as dba.
  - EXPLAIN PLAN command - This displays an execution plan for a SQL statement without actually executing the statement.

```sql
# show how the query was executed
EXPLAIN PLAN FOR
SELECT car_model, sale_price
FROM car_amounts_part;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

# using partitioning
EXPLAIN PLAN FOR
SELECT car_model, sale_price
FROM car_amounts_part
WHERE sale_price > 60000;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

```

---

[TOP](#warehouse---storage)
