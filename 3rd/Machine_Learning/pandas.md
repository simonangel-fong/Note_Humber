# Machine Learning - Pandas

[Back](./index.md)

- [Machine Learning - Pandas](#machine-learning---pandas)
  - [Create array](#create-array)
  - [Methods](#methods)
  - [Attribute](#attribute)

---

## Create array

```py
import pandas as pd
import numpy as np

f = pd.DataFrame(data = np.random.randn(5,4), columns = ['w','x','y','z'], index = ['a','b','c','d','e'])
```

---

## Methods

| Method           | Description                                                                   |
| ---------------- | ----------------------------------------------------------------------------- |
| `DataFrame()`    | Create two-dimensional, size-mutable, potentially heterogeneous tabular data. |
| `drop()`         | Drop specified labels from rows or columns.                                   |
| `drop()`         | Drop specified labels from rows or columns.                                   |
| `head()`         | Return the first n rows.                                                      |
| `info()`         | prints information about a DataFrame.                                         |
| `describe()`     | Descriptive statistics.                                                       |
| `transpose()`    | Transpose index and columns.                                                  |
| `isnull()`       | Detect missing values.                                                        |
| `any()`          | Return whether any element is True                                            |
| `sum()`          | Return the sum of the values over the requested axis.                         |
| `replace()`      | Replace values given in to_replace with value.                                |
| `copy()`         | Make a copy of this object’s indices and data.                                |
| `fillna()`       | Fill NA/NaN values using the specified method.                                |
| `unique()`       | Return unique values in the index.                                            |
| `value_counts()` | Return a Series containing counts of unique values.                           |
| `apply()`        | Invoke function on values of Series.                                          |
| `concat()`       | Concatenate pandas objects along a particular axis.                           |
| `read_csv()`     | Read a comma-separated values (csv) file into DataFrame.                      |

- Method permanently: `inplace = True`

---

## Attribute

| Method    | Description                                |
| --------- | ------------------------------------------ |
| `columns` | The column labels of the DataFrame.        |
| `loc`     | Access **by label(s)** or a boolean array. |
| `iloc`    | Access **by index** .                      |

---

[TOP](#machine-learning---numpy)
