# Big Data: MongoDB

[Back](../index.md)

- [Big Data: MongoDB](#big-data-mongodb)
  - [MongoDB](#mongodb)
    - [SQL terms to MongoDB terms mapping](#sql-terms-to-mongodb-terms-mapping)
  - [Commands](#commands)
    - [Operators](#operators)

---

## MongoDB

- `MongoDB`

  - Open Source
  - **Document** Oriented
  - MongoDB stores data records as `BSON` documents
  - It contains **more data types** than `JSON`

- `Document`:

  - `records` in a MongoDB database.

- In MongoDB, a collection is **not actually created until it gets content**!

---

### SQL terms to MongoDB terms mapping

| SQL Terms/Concepts | MongoDB Terms/Concepts |
| ------------------ | ---------------------- |
| Database           | Database               |
| Table              | **Collection**         |
| Row                | **Document**           |
| Column             | **Field**              |
| Table Joins        | **Embedded** Documents |
| Index              | Index                  |
| Primary Key        | Primary Key            |

- PK - SQL:

  - Specify any **unique** column or column **combination** as primary key.

- PK - MongoDB:
  - The primary key is automatically set to the `_id` field

---

## Commands

- Shell

```sh
mongosh
```

- Database

| Commands              | Description                   |
| --------------------- | ----------------------------- |
| `show dbs`            | List all databases            |
| `use <db_name>`       | Change or Create a Database   |
| `db.dropDatabase()  ` | delete the selected database. |

- Collection

| Commands                          | Description          |
| --------------------------------- | -------------------- |
| `show collections`                | List all collections |
| `db.createCollection("col_name")` | create a collection  |
| `db.col_name.drop()  `            | drop a collection    |

- CRUD

| Commands                                  | Description                              |
| ----------------------------------------- | ---------------------------------------- |
| `db.col_name.find()`                      | Return all documents                     |
| `db.col_name.find({}, {projection})`      | Return documents with condition          |
| `db.col_name.findOne()`                   | return the first document                |
| `db.col_name.findOne({})`                 | return the first document with condition |
| `db.col_name.insertOne({})`               | Inserts a single document                |
| `db.col_name.insertMany([])`              | Inserts multiple documents               |
| `db.col_name.updateOne({},{$set:{}})`     | update the first document                |
| `db.col_name.updateOne({},{upsert:true})` | insert the document if it is not found   |
| `db.col_name.updateMany({})`              | update the many documents                |
| `db.col_name.deleteOne({})`               | delete the first document that matches   |
| `db.col_name.deleteMany({})`              | delete all documents that match          |

- projection:

  - describes which fields to include in the results.

---

### Operators

- Comparison

| Operators | Description                                         |
| --------- | --------------------------------------------------- |
| `$eq`     | Values are **equal**                                |
| `$ne`     | Values are **not equal **                           |
| `$gt`     | Value is **greater than** another value             |
| `$gte`    | Value is **greater than or equal** to another value |
| `$lt`     | Value is **less than** another value                |
| `$lte`    | Value is **less than or equal** to another value    |
| `$in`     | Value is **matched within** an array                |

- Logical

| Operators | Description                                                |
| --------- | ---------------------------------------------------------- |
| `$and`    | Returns documents where **both** queries match             |
| `$or`     | Returns documents where **either** query matches           |
| `$nor`    | Returns documents where **both** queries **fail** to match |
| `$not`    | Returns documents where the query does **not match**       |

---

[TOP](#big-data-mongodb)
