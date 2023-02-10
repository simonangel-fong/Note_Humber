# Python For Loop

[back](../index.md)

[TOC]

---

## `for`...`in` Loop

- Example:

```py


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

```

---

[TOP](#python-for-loop)
