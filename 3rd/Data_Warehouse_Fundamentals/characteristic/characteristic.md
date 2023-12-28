# characteristic

[Back](../index.md)

- [characteristic](#characteristic)
  - [Subject-Oriented](#subject-oriented)
  - [Integrated](#integrated)
  - [Time-Variant](#time-variant)
  - [Non-Volatile](#non-volatile)

---

## Subject-Oriented

- A data warehouse target on the modeling and analysis of data for decision-makers.

  - Therefore, data warehouses typically provide a concise and straightforward view around a particular **subject**, such as customer, product, or sales, instead of the global organization's ongoing operations.

- This is done by **excluding data that are not useful concerning** the subject and **including all data needed** by the users to understand the subject.

---

## Integrated

- A data warehouse integrates various heterogeneous **data sources** like RDBMS, flat files, and online transaction records.

- It requires performing **data cleaning and integration** during data warehousing to ensure consistency in naming conventions, attributes types, etc., among different data sources.

---

## Time-Variant

- **Historical information** is kept in a data warehouse.

  - For example, one can retrieve files from 3 months, 6 months, 12 months, or even previous data from a data warehouse.

- These variations with a transactions system, where often only the most current file is kept.

---

## Non-Volatile

- The data warehouse is a **physically separate** data storage, which is transformed from the source operational RDBMS.

- The **operational updates of data do not occur** in the data warehouse, i.e., update, insert, and delete operations are not performed.

- It usually requires only **two procedures** in data accessing:

  - Initial loading of data
  - and access to data.

- Therefore, the DW does not require transaction processing, recovery, and concurrency capabilities, which allows for substantial speedup of data retrieval.

- **Non-Volatile** defines that **once entered into the warehouse, and data should not change**

---

[Top](#characteristic)
