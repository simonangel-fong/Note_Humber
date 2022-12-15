[back to OS](../index.md)

# CLI Command

[TOC]

---

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

---

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

## `type`

- Types of commands in Linux: 命令类型
  - a) External: They are always external to the shell and their binaries reside in `/bin` or `/sbin` directory.
    `cat`, `touch`, `mkdir`
  - b) Builtin: They are part of the shell itself. `cd`

## `which`

- locate a command. return the path of the binaries for a specific command:
  返回命令路径

eg: `which cd`, `which mkdir`

## `alias`

- It is another name/short name for any entity.取别名

```linux
alias ii=touch  //将touch命令取别名
ii file
ls -al
```

- The original command is still working, so there is no need to remove an alias
  原来的命令还有效.所以无需移除别名.

## `PS1`

- to change the value of a default prompt.改变提示符, 由默认的`$`改为指定字符.

## `history`

- `$history`: 默认 1000 行.
- `$history NUM`:返回指定行数的历史

- `!command_char`:

  - Repeat other commands using the exclamation sign and then followed by characters we want to search. 再次执行指定命令,该命令无需全部输入 The shell will repeat the last command that started with those characters.

- `!NUM`:再次执行指定行的命令
- `!!`:再次执行上一行的命令
- `$HISTSIZE`: The $HISTSIZE variable determines the number of commands that will be remembered in your current environment. Most distributions default this variable to 500 or 1000.
  可以修改`$HISTSIZE=399`

- `$HISTFILE`: points to the file that contains your history. The bash shell defaults this value to ~/.bash_history.

- **prevent recording a command**:
  You can prevent a command from being recorded in history using a space prefix.使用空格在命令开头,可以不记录在历史中.

---

[TOP](#cli-command)
