[back to OS](../index.md)

# CLI Command

[TOC]

***

## I/O redirection

- Output redirection

- `>` stdout
While scanning the line, the shell will see the `>` sign and will **clear the file**.
重写：大于号左边的内容将成为右边文件内容.
如果大于号左边没有指定的文件或内容，则会将回车后输入的内容作为右边文件的内容。
e.g. `cat > file`会将输入的内容覆盖文件

- `>>` append
Use >> to append output to a file.
追加
e.g. `cat >> file`会将输入的内容追加到文件末尾



***

## clear

To clear screen.

## man 

To read the manual of given command

- `$man man`: to read manual of command man.

## date

To display or set the system date and time.

- Format: day date month year time AM/PM zone

## cal

To display the calendar.
