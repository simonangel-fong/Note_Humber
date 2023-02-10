# DataFrame

[back](./index.md)

---

## Create a Dataframe

### `.read_csv()`: import data from a csv

- Read a comma-separated values (csv) file into DataFrame.

```py

import pandas as pd

str_current_dir = './2nd/Introduction_to_Data_Analytics/pandas/'
str_filename = 'mtcars.csv'

df = pd.read_csv(str_current_dir+str_filename)

```

---

## Field

| method              | Return                                                                     |
| ------------------- | -------------------------------------------------------------------------- |
| `DataFrame.shape`   | Return a tuple representing the dimensionality of the DataFrame. (row,col) |
| `DataFrame.dtypes`  | Return the data type of each column.                                       |
| `DataFrame.columns` | The column labels of the DataFrame.返回列名                                |
| `DataFrame.index`   | The index (row labels) of the DataFrame.返回行标                           |

---

## Method

| method                | Return                                                  |
| --------------------- | ------------------------------------------------------- |
| `DataFrame.head()`    | Return the first n rows.default 5                       |
| `DataFrame.head(NUM)` | Return the first n rows. NUM: Number of rows to select. |

---

## Get Data

```py
df = pd.read_csv(str_current_dir+str_filename)

print(df)  # Return all data from a specific column name

print(df["name"])  # Return series of a specific column name

# Return series of a specific column name; the column is case sensitive; if column name contains space, it will create exception.
print(df.name)

# Return multiple series of column names.注意中括号中是一个列表[]
print(df[['name', 'disp']])

```

---

## `.loc()`: slice a dataframe

- Access a group of rows and columns by label(s) or a boolean array.

```py

# loc[index, columName]
# return value from index row at a specific column name
print(df.loc[0, "name"])
# print(df.loc["0", "name"]) # 该处异常,因为导入的df中index不是字符串.只有index是字符串时才能使用
# print(df.loc[0, 0]) # 该处异常,因为导入的df中Colum是字符串.

# loc[index, []]
print(df.loc[0, :])  # vertically return data from all columns at the first row
# vertically return data from all columns at the second row
print(df.loc[1, :])
# print(df.loc[-1, :])  # exception KeyError(key)

# loc[:, :]
print(df.loc[0:3, :])  # return data of row from 0 to 3, inclusive
# return data of row from 0 to 3, inclusive, and columns from name to wt
print(df.loc[0:3, "name":"wt"])
print(df.loc[-1:0, "name":"wt"])  # return data of the first row
print(df.loc[-1:1, "name":"wt"])  # the first 2 row
print(df.loc[-1:-1, "name":"wt"])  # empty dataframe
print(df.loc[0:-1, "name":"wt"])  # empty dataframe

# loc[[], []]
print(df.loc[[0], ["name"]])  # the value at 0 index and name column
# print(df.loc[[-1], ["name"]])  # exception, the index in [] cannot be negative
print(df.loc[[0, 1, 3], ["name", "disp", "hp"]])  # return the data at indexed and colmens
# print(df.loc[[0:4], ["name":"hp"]])  # SyntaxError: invalid syntax

```
---
## Manipulating Column

```py

df["avg_mpg"] = df["mpg"].sum() / df["mpg"].count()

print(df["avg_mpg"])

```

---
[TOP](#dataframe)
