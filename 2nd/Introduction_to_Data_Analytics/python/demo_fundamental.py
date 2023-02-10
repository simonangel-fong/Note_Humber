# region Variable

x = 4  # declare a variable x when it is assigned a value.
print(x)  # the variable x can be used only when it has been assigned a value.

x  # not triger exception because it has a value.
# y #triger exception(NameError: name 'y' is not defined).

# endregion

# region Operator

x = 5
y = 6.6

print(x+y)  # addition
print(x-y)  # substraction
print(x*y)  # multiplication
print(x/y)  # division
print(x**2)  # Exponentiating
print(y % x)  # Modulus
# endregion

# region Miscellaneous

print("\n--------Demo for Miscellaneous--------\n")

num_apple = 5
num_banana = 4

# use backslash indicates the block continues on the next line.
total_cost = num_apple*1.25 + \
    num_banana*.89

print(total_cost)

total_cost

# endregion

# region Data Type: Boolean

print("\n--------Demo for Boolean--------\n")

boolean_var = True

print(boolean_var)
print(boolean_var*5)  # boolean true is the way of 1

# endregion


# region Operator: Comparison Operator

print("\n--------Demo for Comparison Operator--------\n")

x = 5

print(x == 5)
print(x <= 4)

# endregion


# region String: Slicing Strings

print("\n--------Demo for Slicing Strings--------\n")

name = "John"

# str[index]
print("---str[index]---")
print(name[0])  # J
print(name[1])  # o
print(name[-1])  # n
print(name[-2])  # h

# str[start_index, finish_index]
# from the left to the right, if not, return ""
# from start index-inclusive, to finish index-exclusive
print("---str[start_index, finish_index]---")

# "", o是-1，不包含，所以取o左边字母J，即o到J, 但J不在o右侧=>""
print("name[1:-3]:" + name[1:-3])
print("name[1:-2]:" + name[1:-2])  # o, h是-1，不包含，所以取h左边字母o，即o到o=>0
print("name[1:-1]:" + name[1:-1])  # oh, n是-1，不包含，所以取n左边字母h，即o到h=>oh
print("name[1:0]:" + name[1:0])  # "", J是0，不包含，所以取J左边不会自动退为-1,只能是无，即o到无=>""
print("name[1:1]:" + name[1:1])  # ""
print("name[1:2]:" + name[1:2])  # o
print("name[1:3]:" + name[1:3])  # oh

# str[start_index:]
# from the left to the right
# from start index-inclusive, to the end
print("---str[start_index:]---")
print("name[-1:]:" + name[-1:])  # n, n是-1，包含，所以从左到右是n到n
print("name[0:]:" + name[0:])  # John, J是0，包含，所以从左到右是J到n
print("name[1:]:" + name[1:])  # ohn, 0是1，包含，所以从左到右是J到n

# str[:finish_index]
# from the left to the right
# from the first index-inclusive, to the finish index-exclusive
print("---str[:finish_index]---")
print("name[:-1]:" + name[:-1])  # Joh, n是-1，不包含，去n左边的o, 所以从左到右是J到o
# "", J是0，不包含，应该去左边，但0不自动向左取不自动变-1，所以J左边是""，从左到右是J到""=>""
print("name[:0]:" + name[:0])
print("name[:1]:" + name[:1])  # J, 1是o,不包含,向左取J.所以从左到右是J到J=>J

# endregion


# region List

print("\n--------Demo for List--------\n")

my_list01 = [1, 2, 3]  # number list
my_list02 = ["a", 'b', 'c']  # string list
my_list03 = ['h1', 1, [1, 2]]  # multiple types list

print(my_list01)    # [1, 2, 3]
print(my_list02)    # ['a', 'b', 'c']
print(my_list03)    # ['h1', 1, [1, 2]]

print("\n--------Demo for Tuple--------\n")

my_tuple01 = (1, 2, 3)  # number tuple
my_tuple02 = ("a", 'b', 'c')  # string tuple
my_tuple03 = ('h1', 1, [1, 2])  # multiple types tuple

print(my_tuple01)    # (1, 2, 3)
print(my_tuple02)    # ('a', 'b', 'c')
print(my_tuple03)    # ('h1', 1, [1, 2])

# endregion


# region Loop: for in

print("\n--------Demo: for in--------\n")

print("\nString")
for str in "John":
    print(str)


print("\nrange(), default")
# default range()
for i in range(6):
    print(i)


print("\nrange(start, finish)")
# range(start, finish), the starting-inclusive, and the finish index-exclusive
for i in range(3, 6):
    print(i)  # 3,4,5; 6 is exclusive.


print("\nrange(start, finish, step)")
# range(start, finish, step), the starting-inclusive, and the finish index-exclusive
for i in range(2, 6, 2):
    # 2,4; 6 is finish index, not inclusive; step is 2, thus the last index is 4.
    print(i)


print("\nNumber List")
num_list = [1, 2, 3, 4, 5]
for num in num_list:
    print(num)


print("\nString List")
str_list = ['a', 'b', 'c', 'd', 'e']
for str in str_list:
    print(str)


# endregion


# region Loop: while

print("\n--------Demo: while--------\n")

print("while")
i = 1
while i < 6:
    print(i)
    i += 1


print("while else")
i = 1
while i < 6:
    print(i)
    i += 1
else:
    print("end")

# endregion


# region Method: range()

print("range():")

print(range(5))  # range(0, 5)
print(list(range(-1)))  # []
print(list(range(0)))  # []
print(list(range(1)))  # [0]
print(list(range(5)))  # [0, 1, 2, 3, 4]


# endregion
