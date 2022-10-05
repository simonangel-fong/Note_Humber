[Back](../index.md)

# Oracle SQL Developer

- [Oracle SQL Developer](#oracle-sql-developer)
  - [Instatll](#instatll)
  - [Add Connection](#add-connection)
  - [Setting: Preferences](#setting-preferences)
    - [Set Date Formate](#set-date-formate)
    - [Zebra pattern](#zebra-pattern)
    - [Set show line number](#set-show-line-number)
  - [Run command](#run-command)
  - [Disconnect](#disconnect)

---

Client software

## Instatll

link: https://www.oracle.com/database/sqldeveloper/technologies/download/

1. Sign in
2. Download. A zip file.
3. Extracte zip file
4. sqldeveloper.exe

---

## Add Connection

1. `Connections` Panel -> `New Connection...`
2. Configuraion:

- Name: the name shown in your Oracle SQL Developer. It can be any name;
- Users Info:
  - Username: the account name of datebase;
  - Password: password for that account name
- Connection Type: Basic
- Details:
  - Hostname: the addrass of database;
  - Port: the port of database; Default value is 1521.
  - SID: the SID argument of database;

3. `Test`

4. `Save`

---

## Setting: Preferences

- `Tools` -> `Preferences`

### Set Date Formate

Dialog: `Database` entry -> `NLS` -> `Data Format` : `DD-MON-RR`
set the date value in the format of dd-MM-yy


### Zebra pattern

Dialog: `Database` entry -> `Worksheet` -> `Grid in checher board or Zebra pattern`
set the date value in the format of dd-MM-yy


### Set show line number

显示行序号

Dialog: `Code Editor` entry -> Line Gutters -> click `Show line Numbers`

---

## Run command

- Execute a statement 执行一行命令: `Ctrl` + `Enter`
  - The return content will display in Query Result panel.

- Run Script 执行全部脚本: `F5`

  - Return will display in Script Output panel. 
  - The window in this case does not clear each time the button is pressed, instead it will accumulate and show all outputs that have been generated.<br>在脚本输出窗口的内容会叠加，不会每次更新。除非用户清除。

---

## Disconnect

Right click -> `Disconnect`
This is the proper way to do this

---

[TOP](#oracle-sql-developer)
