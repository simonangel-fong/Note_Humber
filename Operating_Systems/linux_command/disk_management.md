# Disk Management

[back](../index.md)

<font color='blue'>
仅记录课堂，练习，和功课提及的命令<br>
默认: 无参数<br>
[]：可以有多个参数
</font>

[TOC]

---

## pwd

To Print Working Directory.

- Return: absolute pathname 返回的是绝对路径

---

## cd

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

## ls

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

[TOP](#disk-management)
