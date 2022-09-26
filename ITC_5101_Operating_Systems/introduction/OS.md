[Back](/ITC_5101_Operating_Systems/index.md)

[TOC]

***

# Introduction - OS

OS的概念是在software的大概念之下，是系统软件的之一。

## Operation Software 操作系统

### Definition 定义

- An OS is a **system software** which acts as an <u>interface / intermediary / medium / channel</u> between **the user** and **the computer hardware**. 
注意, 有用户参与。
    - It provides a **user-friendly environment** in which a user may easily <u>develop and execute programs</u>.
    An OS hides the complexity of hardware from uninterested users. **对用户:提供友好界面**
    Otherwise, *hardware knowledge* would be mandatory for computer programming.
    因为有os，所以程序开发无需一定要了解硬件知识。
&emsp;
    - The OS manages these resources and allocates them to specific programs and users. **对硬件:管理资源**
    With the management of the OS, a programmer is rid of difficult hardware considerations.
    An OS is used to **run the computer hardware**, such as mother board主板, cpu, and hard disk硬盘.

***

### Types of OS 分类

- Different types of Operating Systems: 
    - Windows
    - Linux(is a powerful OS used in production environments) 
    - MacOs, apple
    - SUN solaris

- In mobile phones:
    - Android
    - iOS
    - etc

***

### Functions of an Operating System 功能

速记: app, anti, file, |vm|cpu, 内存，网卡,  打印机 (app, 安全, 文件,|虚拟|处理器，内存，上网，设备)

- OS is used as a **predefined library** for hardwaresoftware interaction. 为硬件间的互动提供预设的包。
This is why, system programs apply to the installed OS since they cannot reach hardware directly. 
即system softwares的应用有赖于OS.


**1. Execute/Run the application and system software**

It helps us in **executing/running** all of <u>the application and system softwares in our computer</u>.

**2. Processor Management管理处理器实务**

kernel中的两个部分:

1. Scheduler: allocation/de-allocation of the CPU to each competing process为每个计算过程分配CPU
    adds new processes  and removes completed processes添加新和移除完成的计算过程到处理器
It helps us in <u>CPU scheduling</u>(assigning the priority to jobs which are waiting to be executed). 
    
2. Dispatcher调度: overseas the execution of the scheduled processes
- It also helps us in <u>concurrency control</u>, to avoid deadlocks at the time of CPU allocation.

*Deadlocks死锁: not enough resource to run when task request resource at the same time因争夺资源而等待

**3. Memory Management 储存管理**

- coordinating the use of main memory – allocates/deallocates space in main memory

- 当需要内存超过物理内存时， 使用virtual memory虚拟内存，即需要处理的数据会在主储存和次级储存之间传递。blocks of data (pages) are shifted back and forth between main memory and mass storage
    主要是协调main memory, 分配储存空间

与背景知识的[memory](#2-types-of-memory)分类连接

**4. Device Management 硬件管理**

- It helps us in **managing** the <u>different types of devices</u>.

    - Input/Output devices: Printers, Scanners, Keyboard, Peripheral devices外设/cards etc.

    - Hardware, like CPU, Motherboard, HDD, RAM, ROM, VGA cards etc, is managed by OS.

**注意**: 硬件hardware仅仅指机箱内的关键部件；其他设备则是输入输出部件，或其他设备；

**5. File Management 文件管理**

Role – coordinate the use of machine’s mass storage facilities

- Hierarchical organization 阶层式组织
    - Directory (or Folder)文件夹: A user-created bundle of files and other directories (subdirectories)
    用户创建的一堆文件和子文件夹

    - Directory Path路径: A sequence of directories within directories.
    文件夹序列

- All of the files, directories are managed by OS.
    Users can create new files, new directories but all of them are managed by OS.
    用户通过OS实现文件管理

    e.g.:New directories can be added, old directories can be deleted etc.

**6. Network Management 网络管理**

- LAN(Local Area Network), WAN(Wide Area Network), MAN(Metropolitan Area Network) etc. are managed with
OS.

**7. Protection and Security 安全管理**

- To **protect and secure the data** from any kind of <u>external threats</u> and **analyzing the vulnerabilities** in our files or in our environment.

- User authentication by validating the uname and password. 

- e.g.:Firewalls, Windows defender, Forensic Analysis, Auditing, Antiviruses, Internet Security, 

*MFA(Multi factor authentication) (not possible to bypass if the code is with users)

**8. Virtualization 虚拟化**

With the help of virtualization softwares, we can create virtual machines, these machines are capable of running different types of Operating systems with the help of one physical OS. 
关于虚拟化，不是指VM，而是与硬件的机器相区别的结合OS而形成新机器。

![ox-vm](/ITC_5101_Operating_Systems/pic/introduction/OS_virtual_machine.png)

- 有关虚拟化的实现，即使用虚拟机

    - Virtual machines are light weight, and they are not consuming many physical resources.

    - Applications of VM: They are used in education and training sectors as they provide a sandbox(a practice/trg environment) for the users.

    - Two most common virtualization platforms/softwares
        - VMWare
        - Oracle V Box

***

## Components of an Operating System 组成 (重点)

简而言之: 硬件<->内核<->壳<->应用程序(User)

中文资料: 在有些操作系统上内核与壳完全分开(例如Unix、Linux等)，这样用户就可以在一个内核上使用不同的壳；而另一些的内核与壳关系紧密(例如Microsoft Windows)，内核及壳只是操作层次上不同而已。

由于shell和kernel是OS的公有概念，所以在OS节呈现. 

### Kernel

总而言之: 执行指令instruction，也即调用资源和协调硬件。

It is the **heart/Deepest/Inner layer** of the operating system.
OS的核心
&emsp;

- It acts as an **intermediary** between the <u>computer hardware</u> and <u>various applications, programs and the shell</u>.
即硬件与指令(App, 程序和shell)的中介。
&emsp;

- It perform resource management functions.负责管理资源。
    All of the <u>Linux resources</u> are managed by kernel. 
&emsp;

- It is used to **execute all of the instructions** given by the users.

    User sends instruction to shell, shell forwards it to kernel for execution and once executed kernel sends it back to the user.
    **user -> shell ->kernel -> user**
&emsp;

- It only understands **machine language(0’s and 1’s)**
&emsp;


***

### Shell - Middle layer 

- The Middle layer
因为在kernel外围,所以被称为shell

- It is an **intermediary/interface/channel** between <u>the user</u> and <u>the kernel</u>. 

- It is also known as a **command interpreter**. 
    It **translates** the <u>user instructions</u> into <u>machine language</u> and **sends** them to the kernel for execution. <font color="red">重点：课堂有提问</font>

<font color="red">了解即可</font>
*In Linux there are different types of shells 
-Bourne shell: Bsh
-Ksh(Korn Shell)
-Tcsh(c shell)
-Jcsh(job shell)

*** 

### User

- Outer Layer

- An entity who is **capable of supplying instructions** to the kernel.

- A user can be a human, a server(machine), an application, a RDBMS, I/O device, software etc.即可以不是人，可以是其他设备，只要是想kernel给出指令即可

***

## OS Startup (Bootstrapping) / Booting (PPT)

- **Booting**: Procedure that transfers the OS from mass storage (permanent) into the main memory (volatilethus empty when machine is turned on)
将OS从Secondary memory转到Primary memory的过程.
&emsp;

- **Bootstrap**: Program in ROM (example of firmware) 
    - Run by the CPU when power is turned on (PC starts at predefined address when power is applied)
    - Transfers operating system from memory
    - Executes jump to operating system
    即在ROM的程序Bootstrap program

1. 执行ROM中的Bootstrap，此时OS储存在Secondary memory
2. Bootstrap执行的结果是Booting，即OS从Secondary memory转义到Volatile memory(RAM)

***

## Shared Computing 共享计算 (PPT)

- It leads to the creation of different types of operating systems:
    将会有多种OS(了解)
    - Batch processing systems **成批**处理系统
    - Interactive processing systems **交互**式处理系统
    - Time-sharing/Multitasking systems 分时系统/多重程序
    - Multiprocessor systems 多处理器系统
    - Embedded Operating Systems 嵌入式操作系统

***

# Software

**Software** is a general term used to describe a collection of **computer programs** that perform some task on a computer system.
软件=有目的的计算机程序

# Types of software

注意OS的所在

![Types of software](/ITC_5101_Operating_Systems/pic/introduction/OS_software.png)

## Application Software

- Direct Interaction with User.与用户互动

Indirect Interaction with Hardware. 不与硬件互动

- It is used for running the <u>specific applications</u>.某种专门的应用
    e.g.: Word processing softwares, Spreadsheet packages, Photoshop, Web browsers, LMS(Learning Management Systems): Blackboard, D2L, Antiviruses etc.

## System Software
- These are used to run and control the <u>computer hardware</u> to provide a platform for running application
software.
    用于运行硬件, 包括作为用户媒介user interface的OS,也包括设备驱动软件。
    e.g.: Operating systems, Device drivers

- Consists of **operating system** and <u>utility software</u>.

- Usage of SS
    - Device Driver: control HW
    - Utilities: maintainent. 
        assist in the operations of the computer and the upkeep of the OS
        即辅助,维护OS的实用软件,虽然由用户操控.
        e.g.: Anti-virus, Data compression, Disk backup, Recovery softwares.
    - Language Translators
        - Assembler汇编器: Converts Assembly Language into binary code低级语言
        - Compiler编译器: Converts a high-level language into binary code高级语言，运行前全部翻译
        - Interpreter解释器: Converts and executes one instruction at a time运行时逐个指令翻译



***

# About Industry 背景知识归纳

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

***

[Top](#introduction---os)
