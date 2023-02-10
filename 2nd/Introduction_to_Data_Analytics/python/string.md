# String

[TOC]

---

## String

- Python strings are <u>an ordered collection of characters</u> (usually these characters will be letters and numbers) used **to represent text**.

- String are created by placing **single or double quotation marks** around a sequence of characters.单双引号都可以

- Strings support the following operations
  - concatenation (combining strings)
  - slicing (extracting sections)
  - Indexing (fetching by offset)
  - the list goes on ….

## Slicing String

1.确定首尾 index 2.尾位左取 3.从左到右截取,有则输出,无则 none

```py

name = "John"

# str[index]
print("---str[index]---")
print(name[0])  # J
print(name[1])  # o
print(name[-1])  # n
print(name[-2])  # h

# str[start_index, finish_index]
# from the left to the right, if not, return none
# from start index-inclusive, to finish index-exclusive
print("---str[start_index, finish_index]---")

# none, o是-1，不包含，所以取o左边字母J，即o到J, 但J不在o右侧=>none
print("name[1:-3]:" + name[1:-3])
print("name[1:-2]:" + name[1:-2])  # o, h是-1，不包含，所以取h左边字母o，即o到o=>0
print("name[1:-1]:" + name[1:-1])  # oh, n是-1，不包含，所以取n左边字母h，即o到h=>oh
print("name[1:0]:" + name[1:0])  # none, J是0，不包含，所以取J左边不会自动退为-1,只能是无，即o到无=>none
print("name[1:1]:" + name[1:1])  # none
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
# none, J是0，不包含，应该去左边，但0不自动向左取不自动变-1，所以J左边是none，从左到右是J到none=>none
print("name[:0]:" + name[:0])
print("name[:1]:" + name[:1])  # J, 1是o,不包含,向左取J.所以从左到右是J到J=>J

```

---

## String Concatenation

- `+` operator

---

[TOP](#string)
