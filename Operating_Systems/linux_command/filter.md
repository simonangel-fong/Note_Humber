[back to OS](../index.md)

# File Editing (Filter)

[TOC]

## Filter

- They are **small programs** like building blocks which are used with commands to produce
efficient and elegant solutions.

- Mostly the filters are used in combination with Linux commands.

- Funtionalities: <br>e.g.
    - A filter can be used to *search for a specific string* in a big file.
    - It can be used for *sorting the data* in a big file.
    - They are used for *pattern matching* within the files.

- Different types of filters: pipe, grep, sed, tee, sort, etc. 

---

## tee

It is used to capture the output at the intermediate level in a file. 
It uses both stdin and stdout streams. It sends the output on the terminal as well as in a file.

- To read standard input, then write to standard output and files.

- `tee`
    - 输入一行就立即显示一行
    - 不会创建或改写文件

- `tee [file]`
    - `file`: 可以是多个; 如果file不存在则会创建。
    - 该命令会进入terminal的输入状态，输入一行会写入一行到file，同时会将输入的该行返回显示到终端上. 即该命令本身会将输入的内容输出，而tee将输出的内容作为参数转流到file中。<br>在修改文件内容的意义上，与cat file相同

- `cat source_file|tee [target_file]|cat`
    1. cat 将source file 的内容输出
    2. | 将前步的输出的内容作为参数传递给下一步
    3. tee将前步的参数转流到target files中,并逐行输出
    4. | 将前步的输出的内容作为参数传递给下一步
    5. cat 将前步的参数输出

---

## grep

It is an <font color="red">important filter</font> widely used in the real time environments.

- Two types of grep applications:
    - It is used to **filter the text** in a file and can **perform a search** for a specific string of
text.<br>查找特定字符串
    - It can also do the **search** for the text **not containing** a specific string.<br>返回除特定字符串外的内容

- To print lines that match patterns.

|Command & Option|Description|
|--|--|
|`grep string [file]`|To return the result of pattern matching <br>匹配大小写|
|`grep -i string [file]`|To return the result of pattern matching in a **case insensitive** way <br> 不匹配大小写|
|`grep -v string [file]`|Invert match, To return the non-matching lines <br> 取反|
|`grep -vi string [file]`|Invert match in a **case insensitive** way <br> 取反不匹配大小写|
|`grep -c string [file]`|To count matching **lines** for each file. <br>返回匹配行数,即使一行有多个匹配也算一行|
|`grep -ANUM string [file]`|To return NUM lines of trailing context after matching line.<br> 匹配行及之后的+NUM行|
|`grep -BNUM string [file]`|To return NUM lines of leading context before matching line.<br> 匹配行及之前的+NUM行|
matching line.<br> 匹配行及之后的+NUM行|
|`grep -ANUM1 -BNUM2 string [file]`|To return NUM1 lines of trailing context after matching line, and NUM2 lines of leading context before matching line.<br> 匹配行及之前的+NUM行|
|`grep -CNUM string [file]`|To return NUM lines of context before and after matching line.<br> 匹配行及之前的+NUM行|

- Argument:
    - `String`: Singular only
    - `File`: Multiple
        - `cat file|grep string`: 将cat的输出作为file参数


---

[TOP](#file-editing-filter)
