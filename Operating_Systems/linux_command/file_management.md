[back](../index.md)

# File Management

## Mange File 

<font color='blue'>
仅记录课堂，练习，和功课提及的命令<br>
默认: 无参数<br>
[]：可以有多个参数
</font>

[TOC]

***

### touch

<font color='blue'>
课程仅强调创建功能.
</font>
To create new file.

- Linux touch命令用于修改**文件或者目录**的时间属性，包括存取时间和更改时间。
	ls -l 可以显示档案的时间记录。

- 若文件不存在，系统会在**当前文件夹**建立一个新的文件。
	- `filename`: Every file name is unique so we cannot have redundant files with the same name.
		为避免重写文件，则employs extension or different case.扩展名或大小写
		如果新创建的文件名与已经存在的文件名相同，只修改原有文件的时间属性。

	- The file will be created in your **current directory**.
	- `touch filename pathname`：只会在当前的文件夹创建空白文件，即pathname无效。
	- 如果想创建新文件并编辑文件内容，使用`$gedit`.

***

### file

To determine file type for given files and directories.
`$file [filename/dirname]`

- 如果是文件夹，也会返回directory.
- `filename/dirname`可以是多个.
	- 空文件: `empty`
	- 特定类型: `ASCII text`
	- 文件夹: `directory`

#### file -s

To determine file type for special files.
针对特殊文件

***

### cp

To copy files and directories.

- `$cp source target`
	- `soucrce`: 源文件名; 当忽略路径时， 默认为当前路径。
	- `target`： 目标文件名；当忽略路径时， 默认为当前路径。

- 在没有给定option参数选项时， 只会复制文件；如果是文件夹将`omitting directory`。

- 当source=target时， 报错`are the same file`

***

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
	- `target`: 默认最后一个是target; 且此时target只能是文件夹。

***

### rm

To remove files permanently from the OS.
移除文件或文件夹 

- **Therefore, be careful when removing files!**
`$rm [filename]`

- `filename`可以是多个
	- 如果是文件夹, 则会报错`Is a directory`
	- 如果不存在，报错`No such file or directory`

***

## Read File

### head

To output the first part of files
- 默认显示10行

- `head file`

- 参数`file`:
	- 可以是多个，将会分别显示
	- 不能是文件夹名，否则报错`Is a directory`


#### head -NUM

To output the first specilized lines of files.
返回指定行

- `head -NUM path/filename`

- 选项`NUM`: 
	- number, the specilized number of lines
	- 如果NUM>line of file, 则会display all content

***

### tail

To output the last part of files

- silimar to head

***

### cat（重要命令）

#### 1. display 

To print all content of files on the standard output

`cat file`

- If the file is longer than the screen, it will scroll to the end.
	如果文件的内容太大，则会快速滚到末尾.
	对太大的文件，应使用less。

- `file`
	- 如果省略file，则只会读取input，不会生成任何文件。
	- 
#### 2. copy

To copy files

`cat source > target`

- `source == target`: content will be overwrite and lost.
- `target`的文件名可以不同于source的文件名,即可以复制并改名。

#### 3.create a new file with the inputing content

`cat > finename`

- Using redirection operators `>`
	回车后输入的内容会成为文件内容

- 结束输入使用`^C`



***

### tac

display: cat backwards

