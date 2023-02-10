import pandas as pd

str_current_dir = './2nd/Introduction_to_Data_Analytics/pandas/'
str_filename = 'mtcars.csv'

df = pd.read_csv(str_current_dir+str_filename)

# region DataFrame Attribute

print("--------Demo: dataframe attribute--------")

print(df.shape)
print(df.dtypes)
print(df.columns)
print(df.index)

# endregion


# region DataFrame Method

print("--------Demo: dataframe method--------")

print(df)  # Return all data from a specific column name

print(df["name"])  # Return series of a specific column name

# Return series of a specific column name; the column is case sensitive; if column name contains space, it will create exception.
print(df.name)

# Return multiple series of column names.注意中括号中是一个列表[]
print(df[['name', 'disp']])

# endregion


# region Dataframe loc()

print("--------Demo: loc()--------")


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
# return the data at indexed and colmens
print(df.loc[[0, 1, 3], ["name", "disp", "hp"]])
# print(df.loc[[0:4], ["name":"hp"]])  # SyntaxError: invalid syntax


# endregion


# region Series Slicing

print("--------Demo: Series Slicing--------")

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

# endregion


# region Series Function

print("--------Demo: Series Function--------")

print(df.mpg.mean())  # Return the mean of the values
print(df["mpg"].mean())  # Return the mean of the values
# Return the maximum of the values over the requested axis.
print(df["mpg"].max())
# Return the minimum of the values over the requested axis.
print(df["mpg"].min())

# endregion


# region DF: CRUD column

print("--------Demo: DF column--------")

df["avg_mpg"] = df["mpg"].sum() / df["mpg"].count()  # create a new colmumn
print(df.columns)

# Rename column's name
# .rename(columns={old_name:new_name}, axis=1, inplace=True)
# 
df.rename(columns={"avg_mpg": "avg_mpg_1"}, inplace=False) # inplace=true, is altered 
print(df.columns)
print(df.head())

# df.drop(["avg_mpg"], axis=1, inplace=True)  # drop a colmumn
# print(df.columns)

# endregion
