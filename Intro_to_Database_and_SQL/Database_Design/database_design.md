# Database Design

[Back](../index.md)

- [Database Design](#database-design)
  - [Schema](#schema)
  - [Table](#table)
  - [Entities and Instances](#entities-and-instances)
  - [Attribute Definitions](#attribute-definitions)
  - [Relational database](#relational-database)
  - [Relationships](#relationships)
    - [Relationship Types](#relationship-types)
    - [Resolve Many-to-Many Relationships (有提及)](#resolve-many-to-many-relationships-有提及)
  - [Key Fields](#key-fields)
    - [Primary Key](#primary-key)
      - [NULL Value](#null-value)
    - [Foreign Key](#foreign-key)
    - [Surrogate Key](#surrogate-key)
    - [Composite Key](#composite-key)
  - [Data Modeling](#data-modeling)
  - [Determine Entities](#determine-entities)
  - [数据模型设计(略)](#数据模型设计略)

---

## Schema

- A `schema` refers to the **organization of data**, to create a blueprint of how the database will be constructed

  - As you see it is made up some rectangles with names in them and some lines interconnecting these rectangles. This creates a conceptual schema that is transformed into the physical database schema. This describes how real world entities are modeled in the database, it is often referred to as a **relational schema** or a **relational diagram**, or an **entity relationship diagram (ERD)**.

- `schema` 是数据库的组织和结构，是数据库对象的集合，集合包括表，视图，储存过程，索引等。

---

## Table

- Characteristics of a Table

  - `Row`:

    - `Rows` contain data about an **entity**. 一行代表一个实体
    - No two rows may be identical. 行需要唯一.
    - The **order** of the columns is **unimportant**. 顺序不重要

  - `Column`:

    - `Columns` contain data about **attributes** of the entity. 一列表示实体的属性.
    - All entries in a **column** are of the **same kind**. 一列有相同类别
    - Each column has a **unique name** within that entity. 列名唯一.
    - The **order** of the rows is **unimportant**

  - `Cell`:

    - `Cells` of the table hold a **single value**. 单元格持有单个值.

---

## Entities and Instances

- `Entities` have `instances` (just as classes do).

- An `instance` is one **occurrence of an entity**, one specific entity. 实例. Entity 相当于类.

---

## Attribute Definitions

- `Attributes` are the `columns` of the table. 列.

- `Attributes` **describe** the entity.

- An `attribute` is a **property** of the entity, a detail about the entity. 实体属性

- Attributes describe, quantify, qualify, classify, and specify an entity

---

## Relational database

- The most popular and widely used form of the database is the `relational database`.

- In this type of database, data is stored in `tables`.

- Both the user `data` and the `metadata` are stored as `tables`.

- Another word for a table is `relation`, a `2-dimensional table` that has certain characteristics.

- Each `row` of a table holds data that pertains to an `entity` or some **portion** of an entity.

- `Columns` contain data about **attributes** of the entity.

- Characteristics of a Relational Table 特點

  - All values in a `column` must have the **same data format**. 列数据有相同的类型.
  - Each column has a specific **range of values** called the `attribute domain`.
  - The **order** of the rows and columns does **not matter**.
  - By definition, a table **cannot have duplicate rows**.
  - Each table must have an attribute or combination of attributes (`Primary Key`) that uniquely identifies each row.

---

## Relationships

- Every table or entity stores data on one subject to **minimizes** the storing of redundant data (important concept) 减少储存冗余数据.

- `Links` show how different records or rows of the entities are related.

- Relationships among different rows are established **through `key` fields**.

### Relationship Types

- `Many-to-one` – these are the most common, and show that a relationship has a degree of one or more in one direction and only one in the other direction.

- `Many-to-many` – these are also very common, particularly in the initial stages of creating a model. There is a degree of one or more in both directions. They are usually optional in both directions

- `One-to-one` – there is a degree of one and only one in both directions. These are quite rare as they usually indicate the two entities are really the **same entity** in business terms

### Resolve Many-to-Many Relationships (有提及)

- `Many-to-many` relationships must be resolved _since relational databases can't implement a many-to-many relationship directly_.

- They are resolved **by adding a new `intersection entity`** <u>between the two original entities</u>. 通常是通过创建一个中间表/桥表.

- The `intersection entity` has a **unique identifier**, usually a composite made up of the UIDs from both original entities.

- Intersection entities can also be called `bridge entities` or `composite entities`.

- **Steps** to Resolve a Many-to-Many Relationship
  1. **Create** a new intersection entity
  2. Make the relationship that was a many-to-many into **two many-to-one relationships** with the intersection entity at the many end of both relationships (the original entity is the master, the intersection entity is the detail)
  3. The relationships from the intersection entity to the original entities are always mandatory
  4. The UID of the intersecting entity is a **composite key** composed of the unique identifiers from the two original entities.注意中间表的键是组合键.

---

## Key Fields

- Types of key fields in a relational database:

  - `Primary Key`
  - `Foreign Key`

- through its development
  - `Surrogate Key`: 代理鍵
  - `Composite Key`: 复合键

### Primary Key

- Value must be **unique** for each record
- Serves to <u>identify</u> the record 作用
- Present in every record 必须出现
- **Cannot be NULL**
- Works best if it is a **numeric** field

#### NULL Value

A `NULL value` is the **absence** of a value, or, more exactly, it is defined as an unknown value to the database.
A primary key **must have a known value**, you cannot omit its value

### Foreign Key

- A field in a table that is a primary key in another table

- A `Foreign key` creates a relationship between the two tables. 目的:创建表之间的关系.

- The `Foreign key` **value** must exist in the table where it is a primary key. 外键所在列的值,必须在其原本的表中存在.

### Surrogate Key

- A surrogate key has no real relationship to the record to which it is assigned, other than **to identify the record uniquely**. 唯一功能是用于彰显唯一性,本身与对象, 表, 实体无关.

- Developers configure the database to generate surrogate key values automatically. 可以设置自动生成.

  - In an Oracle database, you can automatically generate surrogate key values using a special object called a `sequence`.

- They must always be `numeric`, since the database generates surrogate key values automatically by incrementing an integer value by one for the next value. 数字

- As it turns out the majority of primary keys are surrogate values. 一般, 主键即代理键

### Composite Key

- A **unique key** created by **combining two or more fields**. 唯一键由多个字段复合而成.

- Usually composed of fields that are primary keys in other tables

---

## Data Modeling

- The purpose of `data modeling` is to **develop an accurate model or graphical representation** of the client’s information needs and business processes.

- The data model acts as a **framework** for the development of the new or enhanced application

- `Entity Relationship modeling` is independent of the hardware or software used for the implementation

- `Entity Relationship modeling` is strongly connected to the **relational database**

---

## Determine Entities

- Start the Entity Relationship Model by determining the Entities
- In the documentation, find the main **nouns** (people, places, things) that are the business objects
  These become Entities.
- `Entities` usually become `tables`.

## 数据模型设计(略)

---

[TOP](#database-design)
