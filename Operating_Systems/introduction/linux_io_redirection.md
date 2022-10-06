[Back](../index.md)

# Linux I/O  Redirection

[TOC]

## Shell in Linux OS 

User supplies input to the shell and kernel is responsible for execution.

- The most common shell in Linux OS is **BASH**(Bourne again shell).
    - BASH helps us in **interpretation of commands** supplied by the user and **passes them to kernel for execution**.

||User|Shell(Bash)|Kernel|Terminal|
|---|---|---|---|---|---|
||**Input** <u>commands</u>|**Interpret** into <u>machine language</u>|**Execution**|**Display** <u>output</u>|
|Stream|`stdin`:0|||`stdout`No error:1<br>`stderr`Error:2|

---

## stdin, stdout, and stderr

- Three basic streams:
    - `stdin`(standard input):`stream 0`
    - `stdout`(standard input):`stream 1`
    - `stderr`(standard input):`stream 2`

When the user supplies an **input** through any of the input devices like keyboard, mouse etc, then it is **processed by BASH** through <u>stdin stream</u> and **interprets** it into <u>machine language</u>.

*Kernel* **processes** <u>the input</u> and **converts** it into <u>output</u> for the user.

When the kernel executes the output, it is always displayed using one of the two following output streams:

- If the output contains no error, kernel executes and displays the output on the terminal using `stdout`.

- If the output contains any error, kernel executes and displays the error message on the terminal using `stderr`.<br>	Like Exception handling in high level language与高级编程语言中的异常处理类似



### 2 ways of output:

1. Displayed on the terminal

2. Captured in the file

---

## I/O Redirection

- Output redirection
    - `>`(<u>greater than sign</u>): <br>
    To redirect output, `stdout`/`stream 1` ,to a file.
       - If the file exists, the content of the file will be **overwritten**.
       - If the file does not exist, a new file will be created.


    - `>>`: <br>
    To to append output, `stdout`/`stream 1` , to the end of a file.

|Operator|Source|Target|Action|
|---|---|---|---|---|
|`>`|output|file|existing file -> overwrite |
|`>`|output|file|no exist -> create new file|
|`>>`|output|file|append to the end of existing file|

---

## echo

- To display a line of string to standard output

It is used to echo the message in the form of output. It is going to duplicate the message supplied by user and prints it as an output on the terminal.<br>

|Command & Option|Description|
|--|--|
|`echo text > new_file`<br>`echo text >> new_file`|To create a new file with the given text|
|`echo text > existing_file`|To overwrite the specific file with the given text|
|`echo text >> existing_file`|To append the given text to the file|

- `text`: 如果缺失，则显示或文件的内容为空。

: create a new file
Echo > existing_file
Echo >> existing_file 


---

[TOP](#linux-io-redirection)
