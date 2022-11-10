# Disk Management

[back](../index.md)

<font color='blue'>
仅记录课堂，练习，和功课提及的命令<br>
默认: 无参数<br>
[]：可以有多个参数
</font>

[TOC]

---

## `pwd`

To Print Working Directory.

- Return: absolute pathname 返回的是绝对路径

---

## `cd`

To change current directory.

- Arguement `pathname` can be relative or absolute pathname

  - `$cd ../dir`: using relative pathname
  - `$cd /dir/dir`: using absolute pathname

- Manual: $man cd will return No manual entry for cd.

- e.g.:
  - `$cd ..`: change into parent directory 返回的父目录不是 previous 前一个目录
  - `$cd /`: change into ROOT directory
  - `$cd ~`: change into HOME directory
  - `$cd`: 变换至使用者的 home 目录 (也就是刚 login 时所在的目录)。

---

## `ls`

To list directory contents.

### ls -a

To list all files, including the hidden files, including entries starting with `.`.

- When a file name on a Linux file system starts with a **dot**, it is considered a **hidden file** and it doesn't show up in regular file listings.
  隐藏文件以句点开头. `.filename`
  与 Windows 不同，Linux 文件的扩展名不反应文件的类型。

- 包括`.`和`..`.

### ls -l

To display a long listing format of files and directories for given directories.
返回列表

- 列表内容包括:

  - Timestamp
  - size
  - user/owner
  - permission: rwe

- `ls -al`: list all files and directories in a long listing format.

### ls -lh

To list files and directories in a more human readable format for given directories.
以人类可读形式返回列表。

- 与`ls -l`的唯一区别: size of file is converted into storage units.带单位
  如果数字太小，则不会转换。
- 选项参数 option `-h`只能与`-l`结合，所以只有`-hl`/`-lh`

| Command | Option | Arguement    | Description                                                                              |
| ------- | ------ | ------------ | ---------------------------------------------------------------------------------------- |
| ls      | -      | -            | To list directory contents(files and subdirectory)<br>列出目前工作目录所含之文件及子目录 |
| ls      | -      | `[pathname]` | To list contents of given pathnames<br>列出指定若干路径                                  |
| ls      | -a     | `[pathname]` | List all files, including hidden files.                                                  |
| ls      | -l     | `[pathname]` | List all files in a long listing format of given directories                             |
| ls      | -h     | `[pathname]` | List all files in a human readable format of given directories                           |

---

## `df`

To report file system disk space usage. `df` displays the **amount of disk space available** on the file system containning each file name argument. 检查文件系统的磁盘空间占用情况。可以利用该命令来获取硬盘被占用了多少空间，目前还剩下多少空间等信息。

- Disk space is shown in 1k blocks by default.
- **Argument**: 参数

  - none 无参数: shows all mounted file systems.显示所有.
  - Absolute file name of a disk device node: shows the space available on that file system. 显示指定.

- **Display**: 显示

  - `Filesystem`: 文件系统的名称
  - `1K-blocks`: Disk space is shown in 1k blocks by default. 一个特定的文件系统 1K-块, 1K 是 1024 字节为单位的总内存。
  - `Used`: 已使用磁盘磁盘空间
  - `Available`: 可使用磁盘空间
  - `Use%`: 已使用比例
  - `Mounted on`: "安装在"指定的文件系统的挂载点

- **Option**:

| Command & Option | Description                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------------- |
| `df`             | To show the space available on all currently mounted file systems. <br>列出系统内所有的文件系统 |
| `df -a`          | Include pseudo, duplicate, inaccessible file sytems <br>列出所有的文件系统                      |
| `df -h`          | To print sizes in power of 1024 <br>空间大小带单位,并以 1024 为底                               |
| `df --total`     | To produce a grand total<br>生成总计                                                            |
| `df -T`          | To print file system type<br>多显示一列 Type                                                    |

---

## `du`: Disk Usage

- To estimate **file** space usage / disk usage. 用于显示**目录或文件**的大小。

  - To summarize **disk usage of the set FILES**, recursively for directories. 显示指定的**目录或文件**所占用的磁盘空间, 包括子文件夹.

- **Argument**:

  - file

- **Return**:

  - 第一列: 大小, 默认不显示单位
  - 第二列: file or directory
    - `.`: 当前文件夹
    - `directory`: 显示**所有的**子文件夹. 默认不显示子文件的文件.

- **Option**:

| Command & Option | Description                                                                                                           |
| ---------------- | --------------------------------------------------------------------------------------------------------------------- |
| `du`             | To return the space usage of current directory<br>显示当前路径的文件和文件夹的磁盘空间,包括<u>子文件夹</u>            |
| `du -a`          | To return the space usage for all files<br>显示当前路径的文件和文件夹的磁盘空间,包括<u>子文件夹和子文件夹中的文件</u> |
| `du -b`          | To return space in bytes<br>磁盘空间使用字节显示,不以 k 为单位                                                          |
| `du -c`          | To produce a grand total<br>显示总计                                                                                  |
| `du -h`          | To print sizes in human readable format<br>显示大小单位                                                               |
| `du -s`          | To display only a total for each argument<br>只显示总计                                                               |

---

[TOP](#disk-management)
