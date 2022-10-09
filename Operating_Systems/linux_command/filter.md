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

- To print lines that match patterns.

It is an <font color="red">important filter</font> widely used in the real time environments.

- Two types of grep applications:
    - It is used to **filter the text** in a file and can **perform a search** for a specific string of
text.<br>查找特定字符串
    - It can also do the **search** for the text **not containing** a specific string.<br>返回除特定字符串外的内容


|Command & Option|Description|
|--|--|
|`grep string [file]`|To return the result of pattern matching <br>匹配大小写|
|`grep -i string [file]`|To return the result of pattern matching in a **case insensitive** way <br> 不匹配大小写|
|`grep -v string [file]`|Invert match, To return the non-matching lines <br> 取反|
|`grep -vi string [file]`|Invert match in a **case insensitive** way <br> 取反不匹配大小写|
|`grep -c string [file]`|To count matching **lines** for each file. <br>返回匹配行数,即使一行有多个匹配也算一行|
|`grep -ANUM string [file]`|To return NUM lines of trailing context after matching line.<br> 匹配行及之后的+NUM行|
|`grep -BNUM string [file]`|To return NUM lines of leading context before matching line.<br> 匹配行及之前的+NUM行
matching line.<br> 匹配行及之后的+NUM行|
|`grep -ANUM1 -BNUM2 string [file]`|To return NUM1 lines of trailing context after matching line, and NUM2 lines of leading context before matching line.<br> 匹配行及之前的+NUM行|
|`grep -CNUM string [file]`|To return NUM lines of context before and after matching line.<br> 匹配行及之前的+NUM行|
|`grep -E pattern [file]`|To return the result of pattern matching with regular expression.<br>使用正则进行匹配|
|`grep -w word [file]`|To return the lines containing matches that form whole words.<br>只匹配整词不匹配字符串|

- Argument:
    - `String`: Singular only
    - `File`: Multiple
        - `cat file|grep string`: 将cat的输出作为file参数

---

## sed

- The stream editor for filtering and transforming text

<br>The **stream editor** or short **sed** uses regex for stream editing.<br>用来编辑处理输入流,即将输入流改写后再提交给kernel

<br>A stream editor or short sed uses regex to perform basic text transformations on an input stream.

- It is used to do any kind of editing/runtime changes on the command line.
- It is used for run time replacement of characters.

|Command & Option|Description|
|--|--|
|`command | sed 's/pattern/replacement/'`|To match the pattern and replace the first matching portion with replacement <br>匹配第一个并替换|
|`command | sed 's/pattern/replacement/g'`|To match the pattern and globally replace the matching portion with replacement <br>匹配所有并替换所有|
|`command | sed 's/pattern/replacement/NUM'`|To match the pattern and replace the NUM'th matching portion with replacement <br>匹配所有并替换第NUM个|
|`command | sed '/pattern/d'`|To remove the line contains the matching pattern <br>移除有匹配的行|


```java

// using command of sed
$ echo Sunday | sed 's/Sun/Mon/'    //Monday
$ echo Sunday | sed 's:Sun:Mon:'    //Monday
$ echo Sunday | sed 's_Sun_Mon_'    //Monday
$ echo Sunday | sed 's|Sun|Mon|'    //Monday

```

---

## tr

- To translate, squeeze, and/or delete characters from the standard input, writing to the standard output.

<br>不改变任何文件，只是改变输入流。

|Command & Option|Description|
|--|--|
|`command | tr 'SET1' 'SET2'`|To convert character set 1 to character set 2<br>将字符串集合1转换为字符串集合2|
|`command | tr -d 'SET1'`|To do not translate(delete) characters in SET1<br>相当于删除SET1|
|`command | tr -s 'SET1'`|`--squeeze-repeats` To replace each sequence of a repeated character that is listed in the SET1, with a single occurence of that character.<br>将重复的**字符串**替换为一个|

- `SET`
    - 习惯上一般使用单引号, 因为不使用引号则使用特殊字符时会报错; 
    - `CHAR1-CHAR2`: a range of characters from CHAR1 to CHAR2 in ascending order
        - `a-z`: 小写字母
        - `A-Z`: 大写写字母
    - `[:alpha:]` ：所有字母字符
    - `[:blank:]` ：所有水平空格
    - `[:cntrl:]` ：所有控制字符
    - `[:digit:]` ：所有数字
    - `[:graph:]` ：所有可打印的字符(不包含空格符)
    - `[:lower:]` ：所有小写字母
    - `[:print:]` ：所有可打印的字符(包含空格符)
    - `[:punct:]` ：所有标点字符
    - `[:space:]` ：所有水平与垂直空格符
    - `[:upper:]` ：所有大写字母
    - 特殊字符
        - `\\` backslash 反斜杠
        - `\a` 铃声
        - `\b` backspace 退格符
        - `\f` form feed 走行换页
        - `\n` new line 新行
        - `\r` return 回车
        - `\t` horizontal tab tab键
        - `\v` vertical tab 水平制表符

---

## wc

- To print newline, word, and byte counts for each files.
    - If more than one FILE is specified, a total line will be display at last.多个文件时会有一个新行显示总计信息。
    - A word is a non-zero-lenth sequence of characters delimited by white space.由空格分隔的非空字符序列。

|Command & Option|Description|
|--|--|
|`wc [file]`|To print bytes, words, lines for each file.|
|`wc -c [file]`|To print the byte counts.|
|`wc -m [file]`|To print the character counts.|
|`wc -l [file]`|To print the line counts.|
|`wc -w [file]`|To print the word counts.|

---

## sort

- To sort lines of text files
    <br>To write sorted concatenation of all FILES to standard output.多文件时，所有内容将会整体排序，不会分文件显示。
    <br>It always results in an **alphabetical** sort in ascending order.
- Column wise sorting is possible. 可以指定列排序
    - `-kNUM`: To perform sorting based on column NUM

|Command & Option|Description|
|--|--|
|`sort [file]`|To sort lines of text files|
|`sort -kNUM [file]`|To sort lines of **given columns** of text files|
|`sort -k [file]`|To sort lines of **given columns** of text files **reversely**|

---

### uniq

- To report or omit repeated lines
    <br>To filter adjacent matching lines from INPUT, writing to OUTPUT.
    <br>With no options, matching lines are merged to the first occurrence.<br>当没有参数时，会输出唯一值。
    <br>It is always used to remove duplicates from a sorted list.没有排序不起作用

- It only works on **a sorted list**.

|Command & Option|Description|
|--|--|
|`sort [file] | uniq`|To remove duplicate lines from a sorted list<r>重复当一次|
|`sort [file] | uniq -c`|To prefix lines by the number of occurrences <br>以重复的次数为前缀返回每一行|
|`sort [file] | uniq -d`|To return all duplicate lines <br>输出重复的行|
|`sort [file] | uniq -u`|To return all unique lines <br>输出出现过一次的行，不显示重复的行|

---

## cut

- To remove sections from each line of files
    - Print selected part of lines from each FILE to standard output. 即针对每行的内容提取想要的信息。

|Command & Option|Description|
|--|--|
|`cut -fNUM [file] `|To display **NUM'th column** in each line of files|
|`cut -fN- [file] `|To display section of each line from **N'th column** to end of line|
|`cut -f-M [file] `|To display section of each line from the first to the **M'th column**|
|`cut -fN-M [file] `|To display section of each line from **N'th column** to the **M'th column**|
|`cut -d'char' -fN-M [file] `|To display section of each line from **N'th column** to the **M'th column**, using given character instead of TAB for field delimiter|
|`cut -cN-M [file] `|To display section of each line from **N'th character** to the **M'th character**|

---

## comm

- To compare two sorted files line by line
    - with no option, three-column output is displayed.
        - Column one: unique lines in FILE1
        - COlumn two: unique lines in FILE2
        - COlumn three: common lines in both files.

|Command & Option|Description|
|--|--|
|`comm file1 file2 `|To compare file1 and file2|
|`comm -1 file1 file2 `|To compare file1 and file2, suppresing column 1(unique lines in file1)|
|`comm -2 file1 file2 `|To compare file1 and file2, suppresing column 2(unique lines in file2)|
|`comm -3 file1 file2 `|To compare file1 and file2, suppresing column 3(common lines in both files)|

---


## Common pipline 常见命令组合

|Command pipline|Description|
|--|--|
|`who | cut -d' ' -f1 | sort`|To return a sorted list of logged in users<br>顺序返回用户列表|
|`grep bash /etc/passwd | cut -d: -f1`|To return all bash user accoutns in Linux Server<br>返回linux服务器的所有bash用户名|





[TOP](#file-editing-filter)
