# File Sharing Protocol

[Back](./index.md)

- [File Sharing Protocol](#file-sharing-protocol)
  - [NFS: Network File System](#nfs-network-file-system)
  - [SMB: Server Message Block](#smb-server-message-block)
  - [NFS vs SMB Comparison](#nfs-vs-smb-comparison)

---

## NFS: Network File System

- `NFS: Network File Systema`: a <u>file system distribution protocol</u> that **enables a user on a client computer to connect to a network and access files**.

  - a <u>file-sharing protocol</u> for UNIX-based and Linux operating systems
  - NFS is not a file system.

- All people **within a network have access** to the same files, making the file sharing process easier.

- file locking system: allows many clients to share the same file

  - File locking mechanisms are used to ensure the consistency of files that are opened by a user. With a lock, other users cannot write data to open files until they are closed.

- popular on Unix or Linux OS

- **Pros of NFS**

  - low cost
  - easy to set up
  - central file management
  - small requirement for disk space for individual users
  - access remote files as access local files
  - reduces the requirement for removable media storage like USB disks or DVDs and increases security

- **Cons of NFS**
  - NFS is based on RPC, which is not very secure. RPC communications without a firewall are risky. It should only be allowed on trusted network
  - NFS can slow down the procedure in the event of high traffic loads. Both NFSv4 and NFSv4.1 have their limitations. The maximal bandwidth has, however, increased with version NFSv4.2

---

## SMB: Server Message Block

- `SMB (Server Message Block)` is a <u>file-sharing protocol</u> providing access to **shared data over the network**.

  - It is widely used in **Windows environments** to access files over the local area network (LAN).

- SMB uses the `ACL (access control list)` concept with users and groups.

  1. The files that are to be shared over the network are configured on a computer
  2. the client computers access those SMB shared files by entering the IP address of the host computer or the hostname.

- **Pros of SMB**

  - SMB is easier to set up on both Linux and Windows machine
  - SMB supports Apple extended documents without using any additional files
  - SMB allows **user based verification** that helps with multiple access and printer sharing
  - The protocol supports **ACL** file sharing or transfer between networks
  - **Reading** transactions are faster in SMB when compared with NFS. The reading rate is 4 MB
  - Additional software is not a requirement while mounting SMB for network sharing

- **Cons of SMB**

  - You cannot rename a file in SMB irrespective of the files are open or closed
  - SMB is more price and administration sensitive. It is not budget friendly
  - Since Samba is an open source project, SMB doesn’t always provide perfect compatibility with Microsoft’s implementation.

---

## NFS vs SMB Comparison

- These two protocols are optimized to work in the **local area network (LAN)** rather than over the internet.
-
- SMB and NFS sharing protocols are **not adept for network address translation and routing** to be used over the internet.

|                     | NFS                                                                                | SMB                                   |
| ------------------- | ---------------------------------------------------------------------------------- | ------------------------------------- |
| Authentication      | uses a host based verification system                                              | uses a user based verification system |
| Environment         | Mostly used in Linux systems                                                       | Natively used in Windows              |
| Case Sensitive      | case sensitive                                                                     | not case sensitive                    |
| Performance         | better choice for transferring small and medium files over the network             | fast while browsing                   |
| Port                | TCP 2049, UDP 2049, TCP 111 and UDP 111; TCP 1110, UDP 1110, TCP 4045, UDP 4045.   | TCP 445; TCP 139, UDP 137, 138        |
| Sharing printer     | Not support                                                                        | Support                               |
| File locks          | advisory                                                                           | mandatory                             |
| Security/encryption | request-response protocol (RPC,Remote Procedure Call) are risky without a firewall | SMB supports end-to-end encryption    |
| Accessing resources | `server:/directory1/directory2`                                                    | `\\server\directory1\directory2`      |

---

[top](#file-sharing-protocol)
