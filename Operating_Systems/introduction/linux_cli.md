[back](/ITC_5101_Operating_Systems/index.md)

[TOC]

***

# Linux CLI

## Shell Prompt提示符

- Also known as **Linux Promt**/**Dollar Prompt**

`user_name@machine_name:work_dicrectory`

***

## Components of Linux command

- Command line is parsed by the shell into individual tokens and checks the syntax.
    即shell翻译并检查语法


- A Linux command always consists of two parts:
    - Syntax;
    - Semantics;

<font color="blue">
个人总结:<br>
*先检查语法是否正确，正确则翻译为机器语言给与执行;
其次机器语言给kernel执行，如果其语义有意义，则返回执行结果；否则会返回执行失败的提示信息。</font>

### Syntax语法

- Every time user should follow a **proper syntax** while writing a command.
    - Spellings of a command
    - Order of a command, 
    - Rules related to the command

- If the syntax is incorrect, the command will **fail**.
    e.g.:
```java

$touch demo  // it will succeed because it’s syntax is correct

$tch demo   // It will fail because the syntax is wrong

```

### Semantics意义

- Semantics: The **meaning and usage** of the command. 
    If you use correct semantics, the shell will produce meaningful
results
- The command should produce meaningful results.
    例如如果要运行一个不存在的文件，是无意义的，所以语义上有问题，会返回错误，即使命令在语法上正确。
    e.g.:
```java

//This command will be semantically wrong if the file demo1 is not present or exists in our computer.
$cat demo1  

```

***

## Commands of Linux

- Every command is executed on a **terminal**.

### Categories:分类

- File Processing Commands
    They are used to work on the files.
&emsp;
- Programming Commands
    These commands are mostly used for programming based activities like writing shell scripts.
    基于shell脚本的编程;
&emsp;
- Network Commands
    They are used to setup and manage the network configurations in Linux.
&emsp;
- Communication
    They are used as an interface between different servers. i.e.: Bingo
&emsp;
- System Configuration: 
    They are used to set up the system config and manage the system config etc.
&emsp;
- Miscellaneous: others
    Any command which does not fit in the above categories are considered as miscellaneous.

***

## command line interface (CLI)

- The term CLI is a counterpart of GUI.
&emsp;

- Linux: text-based interface
Once the command has been processed, the shell displays another prompt, you type another command, and so on.
&emsp;

- This process uses **only text (plain characters)**, and the line on which you type your commands is called the **command line**.
&emsp;

- A common mistake is not realizing that Caps Lock is on.
&emsp;

- **Command Prompt**提示符: The shell prompts you for command entry.
&emsp;

- **Command line**命令行: Commands activate the shell to perform various tasks.
    - To terminate command-line input, press `Return` or `Enter`.
    - After entering the command line, Unix processes your instructions, *reporting* the results of its actions as **output**.
&emsp;

- **Shell**: a command line interpreter
&emsp;

- the usual prompt is the dollar sign:`$`

### Rules for Command-line Syntax

- case sensitive

- Separate command-line elements with spaces! Enter spaces with
Spacebar. 使用空格符分隔，多个空格符被认为是一个；

- Dashes and underscores are different! `-`和`_`不同


### Form of Command Line

- Linux reads the command line from left to right.

- The hyphen (-) indicates to Unix that an option appears in the
command line. Do not separate the hyphen and the option.
    Option使用`-`提示, 且和Option相连，否则报错。

- Option arguments follow the option. 参数跟住option

- The command argument is the last item in the command line.如果参数适用，则参数是命令行的最后组成部分。

![form of command line](/ITC_5101_Operating_Systems/pic/introduction/linux_linux_cli_formofcommandline.png)



[Top](#basic)
