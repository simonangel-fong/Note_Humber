# Series

[Back](index.md)

[TOC]

---

## Slicing a Series

```py


name = df["name"]  # create a series

print(name)  # get all data

print(name[0])  # get the first value
print(name[-1:])  # get the last value
print(name[4])  # get a value at a specific index

print(name[:5])  # get data from 0 the first to 5, exclusive
print(name[2:4])  # get data from 2-inclusive, to 4-exclusive.
print(name[-3:])  # get the last 3 data

print(name[[0, 2, 5]])  # Arbitrary slice, 注意中括号中是一个列表[]
print(name[[0, 2, 5, 5]])  # 可以重复
print(name[[0, 2, 0]])  # 可以重复,重复无需要按顺序
print(name[[0, 2, 1]])
print(name[[0]])  # 列表可以只有一个元素
print(name[[]])  # 可以是一个空列表
# print(name[[-1]])  # 列表index不能是负数,会异常

# start index must be less than finish index, otherwise, return empty series
print(name[4:2])

```

---

## Function

```py

print(df.mpg.mean())  # Return the mean of the values
print(df["mpg"].mean())  # Return the mean of the values
print(df["mpg"].max())  # Return the maximum of the values over the requested axis.
print(df["mpg"].min())  # Return the minimum of the values over the requested axis.

```

---

[TOP](#series)
