# Warehouse - Data Mart

[Back](../index.md)

- [Warehouse - Data Mart](#warehouse---data-mart)
  - [Types of Data Marts](#types-of-data-marts)
  - [Dependent Data Marts](#dependent-data-marts)
  - [Independent Data Marts](#independent-data-marts)
  - [Hybrid Data Marts](#hybrid-data-marts)

---

## Types of Data Marts

There are mainly two approaches to designing data marts. These approaches are

- Dependent Data Marts
- Independent Data Marts

---

## Dependent Data Marts

- `dependent data marts`

  - a logical subset of a physical subset of a higher data warehouse.

- According to this technique, the data marts are treated as the **subsets of a data warehouse**.
- In this technique, firstly a data warehouse is created from which further various data marts can be created.
  - These data mart are **dependent on the data warehouse** and extract the essential record from it. In this technique, as the data warehouse creates the data mart; therefore, there is **no need for data mart integration**. It is also known as a **top-down approach**.

---

## Independent Data Marts

- `Independent data marts (IDM)`

- firstly independent data marts are created, and then a data warehouse is designed using these independent multiple data marts.
- In this approach, as all the data marts are **designed independently**; therefore, the **integration of data marts is required**.
- It is also termed as a **bottom-up** approach as the data marts are integrated to develop a data warehouse.

---

## Hybrid Data Marts

- It allows us to combine input from sources other than a data warehouse. This could be helpful for many situations; especially when **Adhoc integrations are needed**, such as after a new group or product is added to the organizations.

---

[TOP](#warehouse---data-mart)
