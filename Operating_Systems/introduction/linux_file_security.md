# Linux File Security

[Back](../index.md)

[TOC]


---

## File Security

- Linux OS is a multi-tasking and multiuser OS. 多任务和多用户 
- File permissions are critical for maintaining the security of OS. 文件权限用来提供安全. 
- Multiple users work in an OS, and all of them mmay have different set of permissions based on their **roles**/jobs. 权限基于角色.
    - e.g.: An application developer and a system admin may have different set of permissions, because their roles are different.

- Permission/Privilege: the right of the operations that can be done on the file.

---

## Principle of File Security

### Principle of Least Privilege 最小授权

- Every user should be granted with **least number of privileges**. 
    - It is essential so that excessive privileges granted to users should not be <u>compromised or misused</u>. 防止被误用
    - It is essential to safeguard our files from <u>any kind of data breach, malicious attacks on the data etc</u>. 防止攻击
    - Excessive privileges granted to the users must be **revoked**. 过分的权限应该被褫夺.

### Segregation/Separation of Duties 责任分离

- Every user is assigned with the permissions **based on their roles/jobs**. 根据角色授权
    - Role based management of permissions is critical.

- PTR: Every file and directory in Linux is having **different permissions set for different users**. 对不同用户有不同的权限.

## Ways of Authorization 授权方式

Linux OS authorizes the users in two different ways:
- a. `Ownership` of files/directories: Owner is the creator of a file. 根据所有权: 拥有者=文件创建者
- b. According to the `permissions`. Permissions are granted to the users who are **not owners** of the files according to their requirements. 根据授权: 非文件拥有者

---

## User Group

When any new file or directory is created in Linux, there are **three** types of **user groups** who are assigned with the permissions on these files:

- There are three default user groups:
    - a) `Owner/User`: This user is considered as the **creator or owner** of a file.
    - b) `Group`: The users who **need same set of permissions** are assigned to a group. 相同权限的一组用户
        - It results in easier privilege management
        - It saves effort, time and energy. 
        - It is more efficient and elegant.
            - e.g.: In an organization, there are 20 employees working in HR dept and they need same set of privileges. So they can be assigned to a group and permissions are granted to a group instead of granting individually.
    - c) `Other`: Any user who needs an access on a file, but do not belongs to owner or group categories. 其他
        - This user is not the owner of a file and not the user in any of the groups.

---

## Permission Levels in Linux/Types of permissions 权限种类

- a) `Read`:
    - It is always represented by a lower case `r`.
    - With a read permission a user can **access** <u>a file or a directory</u>.
    - It allows a user to **open** a <u>file</u>, **read** it and **close** the <u>file</u>.
    - It allows a user to **open** the <u>directory</u> and **list** the contents of a <u>directory</u>
        - i.e. it can list all of the files and **subdirectories** within a directory.

- b) `Write`:
    - It is represented by a lower case `w`.
    - It allows a user to **create**, **modify** and **delete** <u>files</u>. CMD
    - It allows a user to **add** files to a directory, **modify** the files within a directory and **delete** the files from the directory.

- c) `Execute`:
    - It is represented by a lower case `x`.
    - It means to **run something** in an OS. Most of the executable files are having an extension `.exe`. 多数是以exe为扩展名.
    - In Linux OS, the most important executable files are scripts, also known as **shell scripts**. 
        - It is a small program with a bunch of code written to perform a specific task. All of the shell scripts are having an extension `.sh`.
        - These shell scripts are run by those users who are having executable permission.

---

### Show Files' Permission listing

- `ls -l`: To list files' details

### Change Files' Permission

- `chmod`: To change the file access mode(permission).

---

[Top](#linux-file-security)
