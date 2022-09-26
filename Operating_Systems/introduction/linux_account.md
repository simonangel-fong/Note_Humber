[Back](../index.md)

- [Linux Account 账户](#linux-account-账户)
    - [User Name, Password, and Successful Login](#user-name-password-and-successful-login)
        - [User Name](#user-name)
            - [Properties of the Users in Linux OS 用户名特性](#properties-of-the-users-in-linux-os-用户名特性)
            - [Rule for user name 用户名规则](#rule-for-user-name-用户名规则)
        - [Password](#password)
            - [Rules for password](#rules-for-password)
        - [Successful login 成功的登入](#successful-login-成功的登入)
            - [1. Authentication验证](#1-authentication验证)
            - [2. Authorization授权](#2-authorization授权)

    - [Different levels of users 用户等级(重点)](#different-levels-of-users-用户等级重点)
        - [SA account in Linux管理员账户](#sa-account-in-linux管理员账户)
            - [Capability of SA了解](#capability-of-sa了解)
        - [Normal User用户](#normal-user用户)

    - [Privilege 权限](#privilege-权限)
        - [Three types of permissions/priviliges (重点)](#three-types-of-permissionspriviliges-重点)
        - [Installation：SA exclusive 安装软件的权限:SA专属](#installationsa-exclusive-安装软件的权限sa专属)
        - [Directory 文件夹权限](#directory-文件夹权限)
            - [Root directory/](#root-directory)
            - [Home directory~](#home-directory)

***

# Linux Account 账户

本页介绍与账号相关的topic，包括
1. 用户名和密码，登入
2. 用户分类：SA和normal
3. 权限

## User Name, Password, and Successful Login

### User Name

别称:
Because you use your account name when logging in, it is often referred to as your **user account**, **user ID**, **username** or **login name** or **login**.

#### Properties of the Users in Linux OS 用户名特性

- **Unique username**: no two accounts with the same name用户名唯一
    Every user/user account in a Linux Env is having a **unique** username.
    In production environments/real time environments we may have thousands of user accounts.
    We cannot have two user accounts with the same name.
&emsp;
- **Case sensitive**大小写敏感
    e.g.:
    ```java
        JOHN user is created
        John
        // As Linux is a **case sensitive** operating system so the above mentioned users can be created irrespective of the fact that both of them are having the same name but they are in **different cases**.
    ```
- 延伸: 文件名也是大小敏感

<font color="blue">
个人总结: <br>
特性：唯一性，大小写
</font>

#### Rule for user name 用户名规则

- Every user name for a user account must be **unique**.唯一性
- User names should be **meaningful**.(relevant to the context)有意义
- The user name should be between **3 to 8 characters**. 长度
- <u>lower case letters</u> and <u>numbers</u> are advisable.Try to avoid ~~special characters~~, ~~uppercase letters~~, and ~~punctuation~~.

<font color="blue">
个人总结: <br>
规则=4：唯一性，长度，关联性，特殊字符
</font>

***

### Password

- Every user account is having a password. 
    账号对应密码

- Passwords are our **main line of protection** in an OS. 
    To prevent *unauthorized use* of your account, the computer also asks you for a secret password.
    密码提供包含

#### Rules for password

- Password should be a combination of **letters, numbers, special characters**. 组成
- It should not be very small it must be **6 to 8** characters in length. 长度
- Always try to **memorize** the passwords instead of writing them. 安全=记住
- Never use your **personal information** as a password like DOB, SIN(Social Insurance Number), Driving licence number etc. 安全=隔离个资
- Do not repeat passwords. 安全=唯一

<font color="blue">
个人总结: <br>
密码=保护<br>
规则：唯一性，长度，容易记，特殊字符,不含个资,
</font>

*** 

### Successful login 成功的登入

- First: the OS authenticates the user
- Then: if it is successful then it moves to the next step. i.e. Authorization.

#### 1. Authentication验证
	
- A user must exist with **the valid login credentials** such as username and password. 
    即用户名和密码构成登入认证凭据

#### 2. Authorization授权

- Only successfully authenticated users will be checked for authorization.
    授权的前置条件=登入验证.
    &emsp;

- Authorization授权: A user must have the rights/privileges/permissions for executing different types of activities in OS.
    授权即给与不同用户不同的活动权限，例如r,w,e

<font color="blue">
个人总结: <br>
认证先行(用户名+密码)<br>
授权在后
</font>

***

## Different levels of users 用户等级(重点)

### SA account in Linux管理员账户

- SA: System Administrator
    **Most LINUX installations have a system administrator (SA)**, who sees that the system runs smoothly.
- By default we have **one** <u>SA account</u> which is the <u>default user account</u>. It is like a <u>super user</u> of Linux OS.

- **SA** = **default user account** = **super user** of Linux OS

- Every OS like Linux, Windows, Solaris, MacOS etc has a SA account.

#### Capability of SA了解

- This account is having lot of **privileges/permissions/rights** by default.

- SA user account can perform many functions in Linux OS.实现OS功能

- SA CAN perform: 能做什么
    - a) Installation in Linux, it can **install different applications** in the Linux OS
    - b) **Create user accounts**, assign permissions/privileges to new users.
    - c) It can **manage the different user accounts**.
    - d) It can delete the users, it can also **modify the properties** of existing users.
    - e) Perform **device management** in the Linux OS.
    - f) It can also **set up new hardware**, configure it etc.
    - g) It can also provide **protection and security** to Linux OS.
    - h) It is also responsible for **backup and recovery of critical files**.
    - i) It is also responsible for **fixing or troubleshoot** the different types of errors, technical glitches etc

***

### Normal User用户

A large installation may serve hundreds or thousands of **users**, each having their own account.

***

## Privilege 权限

### Three types of permissions/priviliges (重点)

*Privilege: IT会经常用到，权限
	
<font color='red'>课堂有提及</font>

1. R: read
2. W: write
3. E: execute


### Installation：SA exclusive 安装软件的权限:SA专属

- Only the **super user/root/admin user can install** these packages. 安装软件的权利
    All of the applications are installed **using rpm or apt packages/repositories**. 安装工具
    
- **Normal users are not having the permissions** to install these packages.
&emsp;


### Directory 文件夹权限

#### `Root directory/`
    - represented with a special symbol **/(root directory)**
    - `Root user` have complete permission(**Read, Write, Execute**)
    - `Normal users` can **read** in the `root directory` but **not allowed to write and execute**.
&emsp;

#### `Home directory~`
    - a <u>directory</u> for the **normal users**
    - represented with a special symbol known as **tilde ~**
    - <u>working space</u> for the **normal users** where they can **create, modify and delete the files and directories**.注意与管理员权限对比


<font color="blue">
个人总结：</font>

||Install App|Privilige in Root`/`|Prvilige in Home`~`|
|---|---|---|---|
|SA|Yes|r,w,e|???|
|Normal User|No|r|cmd files&dir|


***

[TOP](#linux-account-账户)
