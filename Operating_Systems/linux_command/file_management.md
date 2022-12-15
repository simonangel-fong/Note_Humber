[back to OS](../index.md)

# File Management

## Mange File

<font color='blue'>
仅记录课堂，练习，和功课提及的命令<br>
默认: 无参数<br>
[]：可以有多个参数
</font>

[TOC]

---

### touch

<font color='blue'>
课程仅强调创建功能.
</font>
To create new file.

- Linux touch 命令用于修改**文件或者目录**的时间属性，包括存取时间和更改时间。
  ls -l 可以显示档案的时间记录。

- 若文件不存在，系统会在**当前文件夹**建立一个新的文件。

  - `filename`: Every file name is unique so we cannot have redundant files with the same name.
    为避免重写文件，则 employs extension or different case.扩展名或大小写
    如果新创建的文件名与已经存在的文件名相同，只修改原有文件的时间属性。

  - The file will be created in your **current directory**.
  - `touch filename pathname`：只会在当前的文件夹创建空白文件，即 pathname 无效。
  - 如果想创建新文件并编辑文件内容，使用`$gedit`.

---

### file

To determine file type for given files and directories.
`$file [filename/dirname]`

- 如果是文件夹，也会返回 directory.
- `filename/dirname`可以是多个.
  - 空文件: `empty`
  - 特定类型: `ASCII text`
  - 文件夹: `directory`
  - 不存在的文件: `No such file or directory`

#### file -s

To determine file type for special files.
针对特殊文件

---

### cp

To copy files and directories.

- `$cp source target`

  - `source`: 源文件名; 当忽略路径时， 默认为当前路径。
  - `target`： 目标文件名；当忽略路径时， 默认为当前路径。

- 在没有给定 option 参数选项时， 只会复制文件；

  - 如果`source`是文件夹将`omitting directory`
  - 如果`source`是多个，则最后一个参数默认是`target`，且只能是文件夹；否则报错`is not directory`.
  - 如果`target`的文件已经存在则其内容被 source 文件覆盖。
  - 如果`target`是新文件名，则会在目标路径创建新文件名的文件。即复制+改名。

- 当 source=target 时， 报错`are the same file`

---

### mv

#### 1. rename file

To rename files

- `mv source target`

- `source`和`taget`参数:
  - 路径:必须相同，否则是移动文件,
  - 文件名:必须不同，否则报错`same file`,
  - 可以是文件夹

#### 2. move file

To move files

- `mv source target`

- `source`和`taget`: 都不能省略，否则报错`missing destination`
- `source`==`taget`: 是重命名
- 单文件移动：
  - `target`:可以是路径+**新文件名,即可以移动并改名**.
- 多文件移动：
  - `source`:可以是多个；
  - `target`: 默认最后一个是 target; 且此时 target 只能是文件夹。

---

### rm

To remove files permanently from the OS.
移除文件或文件夹

- **Therefore, be careful when removing files!**
  `$rm [filename]`

- `filename`可以是多个
  - 如果是文件夹, 则会报错`Is a directory`
  - 如果不存在，报错`No such file or directory`

---

### chmod

- (change mode) To change the file access mode of given file. 是控制用户对文件的权限的命令

#### File Permission 文件权限

- 使用`ls -l`显示文件的权限:
  - 第一列: `File Type`
    - `-`: File 文件
    - `d`: Directory 文件夹
    - `l`: Link file 超链接
  - 文件调用权限分为三级 :
    - 文件所有者（`Owner`）
    - 用户组（`Group`）
    - 其它用户（`Other Users`）.
  - Default permission when created: 默认权限
    - 文件的默认权限：-rw-rw-rw-
    - 目录的默认权限：drwxrwxrwx

![permission_listing](../pic/linux_command/file-permissions.jpg)

![chmod](../pic/linux_command/chmod.png)

#### Octal Numeric Method 八进制模式

| Octal Number | Permission               | Permission Listing |
| ------------ | ------------------------ | ------------------ |
| `0`          | `None`                   | `---`              |
| `1`          | `Execute`                | `--x`              |
| `2`          | `Write`                  | `-w-`              |
| `3`          | `Execute`,`Write`        | `-wx`              |
| `4`          | `Read`                   | `r--`              |
| `5`          | `Execute`,`Read`         | `r-x`              |
| `6`          | `Write`,`Read`           | `rw-`              |
| `7`          | `Execute`,`Write`,`Read` | `rwx`              |

| Command           | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| `chmode 777 file` | To grant **super permission** to all users. <br>赋予全部权限 |

#### Symbolic method 符号模式

- **who (用户类型)**

| Who | User Type | Description           |
| --- | --------- | --------------------- |
| `u` | `user`    | 文件所有者            |
| `g` | `group`   | 文件所有者所在组      |
| `o` | `others`  | 所有其他用户          |
| `a` | `all`     | 所有用户, 相当于`ugo` |

- **Permission Symbol**

| Symbol | Permission | Description          |
| ------ | ---------- | -------------------- |
| `r`    | `Read`     | 设置为可**读**权限   |
| `w`    | `Write`    | 设置为可**写**权限   |
| `x`    | `Execute`  | 设置为可**执行**权限 |

- **Operator**

| User Type | Description                                |
| --------- | ------------------------------------------ |
| `+`       | grant permission, 增加权限                 |
| `-`       | revoke permission, 去除权限                |
| `=`       | override the existing permission, 重置权限 |

- **Syntax**:
  - `$chmod [user][operator][right] [filename]`

| Command                 | Description                                                                         |
| ----------------------- | ----------------------------------------------------------------------------------- |
| `chmode a=rwx file`     | To grant a **super permission** of a given file to all users.                       |
| `chmode ug+wx file`     | To grant permission: user and group: write and execute                              |
| `chmode a= file`        | To grant no permission                                                              |
| `chmode u+rw, g=x file` | To grant owner the right to read and write, and the group the permission to execute |

---

## Read File

### head

To output the first part of files

- 默认显示 10 行

- `head [file]`

- 参数`file`:
  - 可以是多个，将会分别显示
  - 不能是文件夹名，否则报错`Is a directory`

#### head -NUM

To output the first specilized lines of files.
返回指定行

- `head -NUM [file]`

- 选项`NUM`:
  - number, the specilized number of lines
  - 如果 NUM>line of file, 则会 display all content

---

### tail

To output the last part of files

- silimar to head

---

### cat（重要命令）

#### 1. display

To print all content of files on the standard output

`cat [file]`

- If the file is longer than the screen, it will scroll to the end.
  如果文件的内容太大，则会快速滚到末尾.
  对太大的文件，应使用 less。

- `file`
  - 如果省略 file，则只会读取 input，不会生成任何文件。
  - 可以是多个文件名, 但其内容会糅合在一起输出。

#### 2. copy

To copy files

`cat source > target`

- `source == target`: content will be overwrite and lost.
- 如果`source`是复数，`target`是单数， 则是将多个 source 文件的内容聚合到 target
- `target`的文件名可以不同于 source 的文件名,即可以复制并改名。
- 如果`target`是文件夹，则是复制文件。

#### 3.create a new file with the inputing content

`cat > finename`

- Using redirection operators `>`
  回车后输入的内容会成为文件内容

- 结束输入使用`^C`

---

### tac

display: cat backwards

---

[TOP](#file-management)
