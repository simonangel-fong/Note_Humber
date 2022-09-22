[Back](/ITC-5101_Operating_Systems/index.md)

[TOC]

***

# Theory

# Types of software

![Types of software](/ITC-5101_Operating_Systems/pic/theory/pic_software.png)



## Application Software

- It is used for running the <u>specific applications</u>.某种专门的应用
    e.g.: Word processing softwares, Spreadsheet packages, Photoshop, Web browsers, LMS(Learning Management Systems): Blackboard, D2L, Antiviruses etc.

## System Software
- These are used to run the <u>computer hardware</u>. 
    用于运行硬件, 包括作为用户媒介user interface的OS,也包括设备驱动软件。
    e.g.: Operating systems, Device drivers

### Operation Software

It is a **system software** which acts as an <u>interface / intermediary / medium / channel</u> between **the user** and **the computer hardware**. 
注意, 有用户参与。

An OS is used to **run the computer hardware**, such as mother board主板, cpu, and hard disk硬盘.

#### Types of OS

- Different types of Operating Systems: 
    - Windows
    - Linux(is a powerful OS used in production environments) 
    - MacOs, apple
    - SUN solaris

- In mobile phones:
    - Android
    - iOS
    - etc

#### Functions of an Operating System
OS的功能

##### 1. Execute/Run the application and system software

It helps us in **executing/running** all of <u>the application and system softwares in our computer</u>.


##### 2. Processor Management

- It helps us in <u>CPU scheduling</u>(assigning the priority to jobs which are waiting to be executed). 

- It also helps us in <u>concurrency control</u>, to avoid deadlocks at the time of CPU allocation.

*Deadlocks死锁: not enough resource to run when task request resource at the same time因争夺资源而等待

##### 3. Memory Management

与背景知识的[memory](#2-types-of-memory)分类连接

##### 4. Device Management

- It helps us in **managing** the <u>different types of devices</u>.

    - Input/Output devices: Printers, Scanners, Keyboard, Peripheral devices外设/cards etc.

    - Hardware, like CPU, Motherboard, HDD, RAM, ROM, VGA cards etc, is managed by OS.

**注意**: 硬件hardware仅仅指机箱内的关键部件；其他设备则是输入输出部件，或其他设备；

##### 5. File Management

文件管理

- All of the files, directories are managed by OS.
    Users can create new files, new directories but all of them are managed by OS.
    用户通过OS实现文件管理

- e.g.:New directories can be added, old directories can be deleted etc.

##### 6. Network Management

- LAN(Local Area Network), WAN(Wide Area Network), MAN(Metropolitan Area Network) etc. are managed with
OS.

##### 7. Protection and Security

- To **protect and secure the data** from any kind of <u>external threats</u> and **analyzing the vulnerabilities** in our files or in our environment.

- User authentication by validating the uname and password. 

- e.g.:Firewalls, Windows defender, Forensic Analysis, Auditing, Antiviruses, Internet Security, 

*MFA(Multi factor authentication) (not possible to bypass if the code is with users)

##### 8 Virtualization

With the help of virtualization softwares, we can create virtual machines, these machines are capable of running different types of Operating systems with the help of one physical OS. 

实现虚拟化

- Virtual machines are light weight, and they are not consuming many physical resources.

- Applications of VM: They are used in education and training sectors as they provide a sandbox(a practice/trg environment) for the users.

    - Two most common virtualization platforms/softwares
        - VMWare
        - Oracle V Box

***

# Industry background背景知识归纳

## Types of Server in IT industry

服务器分类

- **Dev**:Development Servers
    Used by programmers/developers for <u>building the applications</u>.
    These are <u>stand alone servers</u>. 
	They are <u>local to the environment</u>. 
&emsp;

- **QA**(Quality Assurance) / **UAT**(User Acceptance Testing)
	Used by <u>testers</u> for validating the new or existing applications. 
&emsp;

- **Production Servers**:Mission Critical Servers/Live Servers
	All of the <u>ser applications</u> are hosted on these servers
    They are <u>executing the live transactions</u>. 
	Mostly they are *connected to the database at the backend*. 
    These servers are **not stand alone**, they are in a **network**.
	
On the <u>Production Servers</u>, **Linux is used as an OS**.

***

## 2 types of memory

存储器分两类

### Primary Memory

- It is also known as a **primary storage**. 

- **only controlled by OS**<font color=red>课上有提及</font>
    
- e.g.:
    - **RAM**: Random Access Memory
    RAM is volatile in nature and it is not permanent. 
    The data **can be erased** at any time <u>by the Operating system</u>.
    
    - **ROM**: Read Only memory
    When OS is shutdown, rom would be erased.


### Secondary Memory

- It is also known as **secondary storage**. 

- It is a persistent or permanent storage. 

- It is used to store the data permanently until **the user** is going to delete it.

- **controlled by OS but can be managed by users as well**&nbsp;<font color='red'>课堂有提及</font>

- e.g.: HDD, USB drives, External Hard drives, SSD, 

*SAN(Storage Area Network)/NAS(Network Attached Storage): used in data centers and cloud storage, in the form of storage racks used for dumping the backups of data. 






[Top](#theory)
