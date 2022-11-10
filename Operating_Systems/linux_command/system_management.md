[back to OS](../index.md)

# System Management 系统管理

[TOC]

## who

- To show who is logged in 
    <br> Print information about users who are currently logged in.
    <br> 将会以list返回，并以NAME, LINE, TIME, COMMENT的列名显示

- Linux who命令用于显示系统中有哪些使用者正在上面，显示的资料包含了使用者 ID、使用的终端机、从哪边连上来的、上线时间、呆滞时间、CPU 使用量、动作等等。

- 使用权限：所有使用者都可使用。

|Command & Option|Description|
|--|--|
|`who`|To return a list of current users <br>返回当前活动的用户|
|`who -H`|To return a list of current users with headings <br>返回当前活动的用户|

---

## finger

To displays detailed information about the system users who are logged on the system. 查询一些其他使用者的资料。

- 需要安装: `$sudo apt install finger`

- `Return`: multicolumn 多列
    - `Login`: shows the **login name** of the users.
    - `Name`: shows the **full name** of the users.
    - `TTY`: shows the **device number** of the users' terminals.
        - `*`: The `*` before the terminal name indicates that sending messages to that terminal is blocked.
    - `Idle`: shows **the elapsed time(经过时间)** since each user last typed on the keyboard.
    - `When`: shows the time that each user logged in.
    - `Where`: shows the addresses of the user' terminals.

- `Argument`: username



|Command & Option|Description|
|--|--|
|`finger`|To return an entry for each user currently logged into the system <br>返回当前活动的用户|
|`finger username`|To return information about the specified user, regardless of whethter the user is logged in or not. <br>返回指定用户信息|
|`finger -l`|To return a **multi-line** format displaying all of the information <br>以多行显示用户信息|
|`finger -s`|To return a **single-line** format of information <br>以多行显示用户信息|

---

[TOP](#system-management-系统管理)
