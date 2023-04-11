# Networking - Port

[Back](../index.md)

- [Networking - Port](#networking---port)
  - [Port](#port)
  - [Categories:](#categories)
  - [Port Forwarding](#port-forwarding)

---

## Port

- `port`:

  - Not a physical connection.
  - a logical connection used by programs and services to exchange information.
  - It determines which program or service on a computer or server that is going to be used.

- `Ports` have a unique number that indentifies them, in a range of 0 and 65535

  - prot numbers are assigned by `IANA(Internet assigned Number Authority)`

- A port is always associated with an IP address for communication purpose.

  - An IP address and a port number work together to exchange data on a network.
  - The IP address determines the location of that server.
  - The port number determines which service or program on that server it wants to use.

- Example:

  - google
    - 1. translate google.com into IP address(DNS), 215
    - 2. http convert into a port number: 80-http, 21-ftp
    - 3. find server according to the IP
    - 4. the server determine the incoming request and forward to web server
    - 5. web server respond

- Command:
  - `netstat`: Network Statistic, display the current network connection and port activity on the device. 显示网络状态。
    - `netstat -n`: -n 或--numeric 直接使用 IP 地址，而不通过域名服务器。

---

## Categories:

- `System/Well-known prots`: a privileged category of ports that are commonly used everyday

  - 0 - 1023
  - Example:
    - 80: http
    - 443: https
    - 21: ftp(file transfer protocol)
    - 25: Email(SMTP)

- `User/Regeisted ports`: can be registered by companies and developers for a particular service.

  - 1024-49151
  - Example:
    - 1102: Adobe Server
    - 1433: Microsoft SQL Server
    - 1416: Novell
    - 1527: Oracle

- `Dynamic/Private ports`: client-side ports that are free to use.

  - computer on a network assigns temporarily to itself during a session.

- System, User: used on server
- Dynamic: used for Client

---

## Port Forwarding

- Allows computers over the internet to connect to a specific computer or service within aprivate network.



---

[TOP](#networking---port)
