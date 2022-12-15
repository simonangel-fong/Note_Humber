[back to OS](../index.md)

# Shell Script

[TOC]

## `#`:Comment 注释

## `echo -e`

`echo -e "message \t"`: 参数 e 表示会解释转义符号

- 转义符:
  - `\t`: a tab
  - `\n`: new line

## Control Operation

### `;`

- acts as a separator between the commands.
  将多个命令置于一行时, 可以使用分号分隔.

### `&`: Ampersand

- sends the command to the background for processing and execution
  后台运行命令

### `\`: End of Line backslash 用在行尾

- It is used to split the input into different lines at the time of writing it but the output is
  displayed as a single line.
  输入时, 新起一行输入; 但运行结果还是一行.

  Lines ending in a backslash are continued on the next line. The shell does not interpret the newline character and will wait on shell expansion and execution of the command line until a newline without backslash is encountered. 等待, 直到没有`\`

### `*`

- The asterisk \* is interpreted by the shell as a sign to generate filenames, matching the asterisk to any combination of characters (even none). 用于匹配文件名, 匹配任何.

- `echo *`:
  - 如果当前文件夹不为空, 返回所有文件和文件夹名。
  - 如果是空, 只返回一个\*号。

### `?`

- the question mark ? is interpreted by the shell as a sign to generate filenames, matching the question mark with exactly one character. 只匹配 1 个.

---

## Logical Operator

### `&&`: (Double Ampersand)

- LOGICAL `AND`. 逻辑运算符

- `echo one && echo two`: 当第一个 execute successfully, 才会运行第二个
  - 返回:
  ```
  one
  two
  ```

### `||`

- LOGICAL `OR`. 逻辑运算符

- The second command will execute only if first one fails.

- `echo one && echo two; echo three`: 当第一个 execute fails, 才会运行第二个

  - 返回:

  ```
  one
  three
  ```

- `pecho one && echo two; echo three`: 当第一个 execute fails, 才会运行第二个
  - 返回:
  ```
  //先返回错误
  two  //因为pecho命令错误
  three
  ```

---

## Shell Variables

Every shell variable is prefixed with a dollar sign($);

They are also known as `environment variables`.

- 分类:

  - Default: Shell variables can be default, Users cannot delete default variables
    The default variable are always upper cases. 默认变量一定是大写. 如果小写, 除非自定义了变量, 否则不会返回值

    - `$SHELL`
    - `$HOSTNAME`
    - `$HOME`
    - `$USER`
    - `$UID`
    - `$PID`
    - `$$`

  - User defined: users can create their own variables, the user defined variables can be deleted.

  - By default the shell will display nothing when a variable is unbound (does not exist).

- `$`: 提示是变量

- case sensitive

### Creation of a user defined Shell Variable

```
$Car=BMW  //中间不能有空格, 如果赋值需要有空格, 则使用引号
$echo $Car  //调用
```

### Delete: `unset`删除变量

- `unset var_name`: 注意该处变量名前没有$号

### 引号

- 双引号:Notice that double quotes still allow the parsing of variables 双引号中还可以引用变量
  `echo "$Car is aa"`:会调用 Car

- 单引号:whereas single quotes prevent this.单引号不能引用变量
  `echo '$Car is aa'`:不会调用 Car, 只会显示$Car

---

# Shell Scripting

- **Shell Script**: It is a kind of a program or programming construct which helps us in executing the different types of activities such as execution of one command or multiple commands, conditional expression, logical operation, mathematical operation etc. It is a small program in Linux/Unix.

- **Applications of Shell Scripts**:

  - a) Patching: Scripts are used for patching means to apply an update to an existing application, a patch can be a security fix, a bug fix, an error fix, a version change etc.

  - b) Scripts are used for upgrading the Linux OS.

  - c) Scripts are used for creating backups, these backups can be daily backups, weekly backups or may be monthly backups. We can schedule a script using cronjobs in Linux which will run automatically.

  - d) It can be used for the Linux admin related activities such as creation of files, testing files, creation of directories etc.

  - e) Scripts are used for deploying the applications using Linux OS.

  - f) Shell scripts are also used for performing any conditional, arithmetical and logical operations in Linux OS.
    Scripts can handle all types of arithmetical, conditional statements(if then else, while, for, until)/loops, and logical operations such as comparison.

---

## Arithmetical Operations:

Addition: +
Subtraction; -
Division; /
Multiplication: \*
Comparison: <, >, <= , >=
Not equal: != <>
Logical: AND: &&
Logical OR: ||

## Conditional Statement + `test`

- Conditional Statements:

  - These statements are always evaluated for **Boolean values(True/False)**
  - Conditional Statements are tested with `test` command.
    - If the condition evaluates to `true`, then an **exit status** `0(zero)` is set and returned to the user.
    - If the condition evaluates to false, then an exit status `1(one)` is set and returned to the user.

- Integer Comparisons:

`$n1=4`
`$n2=3`

`$test $n1 -eq -$n2`: (Equal to)
`$test $n1 -lt $22`: (Less than)
`$test $n1 -gt $22`: (Greater than)
`$test $n1 -ne $22`: (not equal to)
`$test $n1 -le $22`: (less than equal to)
`$test $n1 -ge $n2`: (greater than equal to)

- String Testing

`$String1="aa"`
`$String2="ab"`

`$test $String1 = $String2` (true if both strings are same)
`$test $String1 != $String2` (true if both are not same)
`$test String1` (if it is not null then true is returned)
`$test -n $string1` (true if $string length is non zero)
`$test -z $string1` (if $string length is zero)

- Test for file attributes:

  `$test -r filename`: (Result in true if file is readable)
  `$test -w filename`: (Result in true if file is writable)
  `$test -x filename`: (Result in true if file is executable)
  `$test -d filename`: (Result in true if it is a directory)
  `$test -f filename`: (Result in true if it is a file)

- 获取结果
  - `echo $?`

---

## `expr`

It stands for expression.
It is used for performing mathematical and arithmetical operations in Linux
数学表达式

Each argument in expr command must be separated by a space. 每个参数用空格分隔
Any operators or keywords which are having another meaning in Linux must be escaped by an escape character \(backslash) 转义

If parentheses are used in the calculations then parentheses must be escaped. Parentheses are used for setting up the precedence. 括号必须转义
Any expression in the parentheses will be evaluated first. 括号先行

**Note**: During the execution of expr command if it satisfies to `true` then value `1` is returned if it satisfies to false then value 0 is returned.
It is vice versa of test command.

- 例子: 注意空格

`$expr 10 \* 20`
`$expr 20 * ( 2 + 6 )`
`$expr 20 \* \( 2 + 6 \)`
`$expr length "string"`: 返回字符串长度

---

# `.sh` File

## Create

a) Shell scripts are written using Linux Editors, you can use **vim, nano, gedit**. User wants to create a new script named as demo.sh
b) Open a new file using gedit or any other editor, save the file as demo.sh
c) Once a file is opened then the first line in a shell script is always **the name and location of our shell**.

- best practise: store all script in `/bin` 文件夹中.

### `#!/bin/bash`: 第一行

- This script will run in a bash shell.

### Template 模板

```
#!/bin/bash
#Program Name: demo.sh
#Author name: G Gill
#Date Created: Dec 1st 2022
#Date updated:
#Description of the script: Addition of two numbers
```

## Execute

- 1. User needs to grant execute permission to the script.
     `$chmod +x demo.sh`
     `$./demo.sh`
- 2. Root user can execute the scripts without granting execute permission.
     a) `bash demo.sh`
     b) `source ./demo.sh`

## `read`: 获取用户输入

`Read` command is used to **take the user input** from the stdin stream, and assigns the value to a variable in shell scripting.
Read command is mostly used to get the run time values of the variables from the user.

Mostly read is used to get the value of the variable at the time of executing the script.

```
$read var1, var2, var3  //输入时,使用空格分隔
$echo $var1, $var2, $var3
```

## `if`

```
# if else
if [ conditional statement ]; #begins
then
#some codes
else
#some codes
fi

# if elif else
if [ conditional statement ]; #begins
then
#some codes
elif
then
#some codes
else
#some codes
fi
```

---

## `loop`

```
read i
while [ $i -ge 0 ];
do

# some codes

let i--;
done
```

## 算术式

```
((sum=10+10))
echo $sum  #返回20
```

## `cronjobs`

自动任务

Cron is a utility in Linux.
It helps the users to create automated jobs, schedule them and these jobs will run automatically at the specified time given by the user.

Any jobs/tasks which are scheduled using cron utility are called **cron jobs**.
System **admins** can decide when to schedule a cron job and when it should be executed.
Cron is a **daemon** and background process in Linux.

- 用途 Applications of cron jobs:
- a) Backups (Weekly, Monthly, Yearly)
- b) Clearing cache
- c) System maintenance such as patching(updating): To apply patches to the OS.
- d) Disk Management
- e) Network Management
- f) To execute batch jobs

- 路径 Where the cron jobs are scheduled in Linux:
  - In Linux there is a cron file which is a plain text file, user can enter commands to run periodically at a specific time using this file.
  - The name of this file is : `/etc/crontab` It is also known as `cron table`.

`* * * * *`: A cron job will execute every minute
`0 * * * *`: This cron job will execute every hour 当分钟为零时
`15 10 * * *`: Fire at 10:15 am every day

- Resources to schedule cronjobs:

  - Crontab generator
  - Crontab.guru

- User wants to edit a crontab file:
  `crontab -e` (Add, edit, delete a cron job)

- User wants to see the active listing of cron jobs in Linux
  `crontab -l`

- User wants to delete all of the cron jobs
  `crontab -r`

- 文件管理 Management of cron jobs:
  In Linux separate directories are available to store cron jobs:
  - Hourly Scripts: `/etc/cron.hourly/`
  - Daily Scripts: `/etc/cron.daily/`
  - Weekly Scripts: `/etc/cron.weekly`
  - Monthly Scripts: `/etc/cron.monthly`

---

[TOP](#shell-script)
