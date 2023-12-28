# Warehouse - Schema

[Back](../index.md)

- [Warehouse - Schema](#warehouse---schema)
  - [Fact Tables](#fact-tables)
  - [Dimension Tables](#dimension-tables)
  - [Star schema](#star-schema)
    - [Characteristics of Star Schema](#characteristics-of-star-schema)
    - [Advantages of Star Schema](#advantages-of-star-schema)
  - [Snowflake Schema](#snowflake-schema)
    - [Advantage of Snowflake Schema](#advantage-of-snowflake-schema)
    - [Disadvantage of Snowflake Schema](#disadvantage-of-snowflake-schema)

---

## Fact Tables

- `Fact Tables`
  - A table in a star schema which **contains facts and connected to dimensions.**
- A fact table has two `types of columns`:

  - those that include **fact**
  - and those that are **foreign keys** to the dimension table.

- The primary key of the fact tables is generally a **composite key** that is made up of all of its foreign keys.

- A fact table might involve either **detail level** fact or fact that have been **aggregated** (fact tables that include aggregated fact are often instead called **summary tables**).

- A fact table generally contains facts with the same level of aggregation.

---

## Dimension Tables

- `dimension`
  - an architecture usually **composed of** one or more **hierarchies** that categorize data. 

- If a dimension has not got hierarchies and levels, it is called a flat dimension or list. 
- The primary keys of each of the dimensions table are part of the composite primary keys of the fact table. 
- Dimensional attributes help to **define the dimensional value**.
- They are generally **descriptive, textual values**. 
- Dimensional tables are usually small in size than fact table.

- Fact tables store data about sales while dimension tables data about the geographic region (markets, cities), clients, products, times, channels.

---


## Star schema

- In a star schema, the fact table will be **at the center** and is connected to the dimension tables.
- The tables are **completely** in a **denormalized** structure.
- **SQL queries performance** is good as there is **less number of joins** involved.
- Data **redundancy** is **high** and occupies **more disk space**.

### Characteristics of Star Schema

- It creates a **DE-normalized** database that can quickly provide **query responses**.
- It provides a flexible design that can be changed easily or added to throughout the development cycle, and as the database grows.
- It provides a **parallel in design** to how end-users typically think of and use the data.
- It **reduces the complexity of metadata** for both developers and end-users.

---

### Advantages of Star Schema

- Query Performance
  - A star schema database has **a limited number of table** and clear **join** paths, the query run faster than they do against OLTP systems.

- Load performance and administration
  - Structural simplicity also decreases the time required to load large batches of record into a star schema database. 
  - Dimension table can be populated once and occasionally **refreshed**. 
  - We can **add** new facts regularly and selectively by appending records to a fact table.

- Built-in referential integrity
  - A star schema has referential integrity built-in when information is loaded. 

- Easily Understood

---

## Snowflake Schema

- A snowflake schema is an extension of star schema where the dimension tables are connected to one or more dimensions.
- The tables are **partially denormalized** in structure.
- The **performance of SQL** queries is a bit **less** when compared to star schema as **more number of joins** are involved.
- Data **redundancy is low** and occupies **less disk space** when compared to star schema.

---

### Advantage of Snowflake Schema

- The primary advantage of the snowflake schema is the **development in query performance** due to minimized **disk storage requirements** and joining smaller lookup tables.
- It provides greater **scalability in the interrelationship** between dimension levels and components.
- **No redundancy**, so it is easier to maintain.

---

### Disadvantage of Snowflake Schema

- The primary disadvantage of the snowflake schema is the **additional maintenance efforts required** due to the increasing number of lookup tables. 
- It is also known as a multi fact star schema.
- There are more **complex queries** and hence, difficult to understand.
- More tables more join so **more query execution time**.

---

[TOP](#warehouse---schema)
