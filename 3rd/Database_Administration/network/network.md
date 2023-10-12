# DBA - Oracle Net Services

[Back](../index.md)

- [DBA - Oracle Net Services](#dba---oracle-net-services)
  - [Oracle Net Services](#oracle-net-services)
    - [Oracle Net Listener](#oracle-net-listener)
    - [Default Listener](#default-listener)
    - [Establishing Oracle Network Connections](#establishing-oracle-network-connections)
  - [Connect string](#connect-string)

---

## Oracle Net Services

- `Oracle Net Services`

  - the **interface** between the **database** and the **network communication protocols** that facilitate distributed processing and distributed databases.
  - Oracle Net Services supports communications on all major network protocols, including `TCP/IP`, `HTTP`, `FTP`, and `WebDAV`.

- `Communication protocols`

  - define the way that data is transmitted and received on a network.

- `Oracle Net`

  - a **component** of Oracle Net Services, establishes and maintains a **network session from a client application to a database server**.
  - After a network session is established, `Oracle Net` acts as the **data courier** for both the _client application_ and the _database server,_ exchanging messages between them.

- It can perform these jobs because it is located on **each computer** that needs to talk to the database server. 包括客户端
  - On the client computer, `Oracle Net` is a **background component for application** connections to the database.
  - On the database server, `Oracle Net` includes an **active process** called `Oracle Net Listener`, which is responsible for coordinating connections between the database and external applications.

---

### Oracle Net Listener

- `Oracle Net Listener` / the `listener`

  - A process that listens for **incoming client connection requests** and **manages network traffic** to the database.
  - the **gateway to the Oracle instance** for all **nonlocal user** connections.
  - An important component of Net Services.

- When a client **requests a network session** with a database, `Oracle Net Listener` (typically called the listener) receives the request.

  - If the client information **matches** the listener information, then the listener **grants a connection** to the database server.
  - When a connection is **established**, the client and database **communicate directly**.

- A **single** listener can service **multiple** database instances and thousands of client connections

- Tools to configure the listener and specify log file locations
  - `Enterprise Manager Cloud Control` or `Oracle Net Manager`.

---

### Default Listener

- During an Oracle Database installation, `Oracle Universal Installer` launches `Oracle Net Configuration Assistant` and creates **a local listener** named `LISTENER`.

  - `LISTENER` is **automatically populated** with available database services through a feature
    called **dynamic service registration**.

- `LISTENER` **listens** on the following TCP/IP **protocol** address:

```sql
ADDRESS=(PROTOCOL=tcp)(HOST=host_name)(PORT=1521)
```

- Without any configuration, you can access your database instance immediately through LISTENER.
- If the listener name is LISTENER and it cannot be resolved, a protocol address of `TCP/IP` and a port number of 1521 is assumed.

---

### Establishing Oracle Network Connections

- To make a client or middle-tier connection, Oracle Net requires the **client to know** the:

  - the `address` or `host` where the **listener resides**
  - **Port** that the listener is **monitoring**
  - the `protocol` that the listener **accepts**
  - **Name of the service** to which it wants to connect.
    - parameter name: `SERVICE_NAMES`

- `Oracle Net names resolution`

  - the process of determining this connection information.

- The service name defaults to the global database name

  - a name that comprises the database name and the domain name
  - `DB_NAME` + `DB_DOMAIN`

- An Oracle **database** is represented to a client **as a service**. 
- A database **can have one or more services** associated with it. 
- Databases are identified by a service name that is specified by the `SERVICE_NAMES` parameter **in the initialization parameter file**. 
- The service name defaults to the global database name, which is a name that **comprises the database name** (`DB_NAME` parameter value) and **the domain name** (`DB_DOMAIN` parameter value).


- To connect to a database service, clients use a connect descriptor that provides the **location of the database** and the **name of the database service**. 
- Clients can use the **connect descriptor** or a **name that resolves** to the connect descriptor (as discussed later in this lesson).


connect descriptor

- Example:

```sh
# enables clients to connect to a database service called finance.us.flowers.com
(DESCRIPTION=
    (ADDRESS=(PROTOCOL=tcp)(HOST=flowers-server)(PORT=1521))
    (CONNECT_DATA=(SERVICE_NAME=finance.us.flowers.com))
)
```

---

## Connect string

- Users can initiate a connection request to the Oracle database by **sending** a `connect string`. 

- `connect string`
  -  includes a **username** and **password**, along with a **connect identifier**. 

- A connect identifier can be
the connect descriptor itself or a name that resolves to a connect descriptor. One of the most common
connect identifiers is a net service name, which is a simple name for a service.
When a net service name is used, connection processing takes place by mapping the net service
name to a connect descriptor. The mapping information can be stored in one or more repositories of
information and is resolved by using a naming method.

---

[TOP](#dba---oracle-net-services)
