[back](/ITC_5101_Operating_Systems/index.md)

[TOC]

***

# Command: `cd`

`cd`: to switch from one directory to another directory

- Syntax: `cd <dir_Name>`

Linux cd（英文全拼：change directory）命令用于切换当前工作目录。

其中 dirName 表示法可为绝对路径或相对路径。若目录名称省略，则变换至使用者的 home 目录 (也就是刚 login 时所在的目录)。

另外，~ 也表示为 home 目录 的意思， . 则是表示目前所在的目录， .. 则表示目前目录位置的上一层目录。

	• Cd
To switch to a new directory

$cd ~
Switch to root directory转到SA的文件夹(SA文件夹包含必要的组件并与其他用户文件夹分离)

$cd ..
Switch to parent/previous directory