# Networking - DNS

[Back](../index.md)

- [Networking - DNS](#networking---dns)
  - [DNS](#dns)
    - [Proceed](#proceed)
  - [Resource Records](#resource-records)
  - [`Service Location (SRVs)`](#service-location-srvs)
  - [DNS Query](#dns-query)

---

## DNS

- `DNS`: `Domain Name System`
  - Resolves computer names to IP addresses and vice versa.
  - Enables computers to find network services such as the domain controller, DHPC server, file server, etc.
  - Allows users to search the Internet with **user-friendly names**, such as www.google.ca instead of 172.217.6.195.
  - Acts in a similar way to Google Maps, showing users which direction to take to reach their destination.
  - Consists of two types of resolution:
    - `Forward lookup`, which resolves computer names (also called FQDNs) to IP addresses.
    - `Reverse lookup`, which resolves IP addresses to computer names.
  - Uses `TCP` and `UDP` on port number `53`.
  - Recommends deploying more than one DNS server for redundancy.
  - Stays online at all times so computers can find network services and other computers on the network.

---

### Proceed

1. find in local cache memory
2. send query to resolve server (ISP), check cache memory
3. send query to root server (The top of the DNS hierachy)
4. redirect resolver to the TLD(Top Level Domain) server.
5. send query to TLD server, redirect resolver to authoritative name servers
6. send query to ans(the server knows everything about the domain),
7. respond the IP address to resolver, resolver store it in its cache memory

- 涉及三个重要服务器:
  - Root
  - TLD
  - ANS

---

## Resource Records

- Describe information in a DNS zone that is used to resolve a computer or service name to an IP address, and vice versa.
- Give users the flexibility to work with user-friendly names while the `DNS server` takes care of IP addresses.
- Serve different purposes depending on the type (the following is a list of common resource records):
  - `A or AAAA (Host)`:
    - Stores the computer name and its IP address.
    - Resolves the computer name to an IP address.
  - `Pointer Record (PTR)`:
    - Stores the computer name and its IP address.
    - Resolves the IP address to a computer name.
  - `Canonical Host Name (CNAME)`:
    - Creates aliases (synonymous names) to a host record.
    - Allows users to assign a user-friendly name to computers.
  - `Start of Authority (SOA)`:
    - Defines the DNS server that hosts the master copy of the zone information.
    - Contains information such as zone authority server, Time To Live (TTL), aging and scavenging for zone records.
  - `Service Location (SRV)`:
    - Identifies servers that host special network services, such as Active Directory.
    - Creates itself automatically without any administrative effort.
  - `Name Server (NS)`:
    - Provides the information about DNS servers that host any type of DNS zone.
    - Allows users to identify all servers that contain DNS zone information.
  - `Mail Exchange (MX)`:
    - Lists MX servers used in the domain.
    - Allows users to direct internal emails for their domains to their exchange servers.

---

## `Service Location (SRVs)`

- Describe a resource record that allows users to find the **location of services** in a network.
- Identify servers that host special network services such as `Active Directory`.
- Provide client computers with the location of the closest domain controller during login.

---

## DNS Query

- Describes a request sent to a DNS server for address resolution.
- Allows users to send a message to a DNS server requesting to resolve a computer name or an IP address.
- Uses any of the following query type when sending a resolution request to the DNS server:

  - Recursive query:

    - Sends a query to the DNS server and expects a definite answer.
    - Forces the DNS server to respond with either the requested resource record or an error message.
    - Provides an authoritative response because the response to the query is given by an authoritative DNS server (a DNS server is authoritative when it hosts a primary or secondary copy of the DNS zone).
    - Used by client computers of the time.

  - Iterative query:
    - Describes a query for which the response contains a reference to another DNS server.
    - Allows the DNS server to return the best answer based on its cache or zone data (DNS servers respond with a reference to another DNS server).
    - Sends another query to the referenced DNS server from the original DNS query.
    - Continues to query referenced DNS servers until the query is fully resolved or an error message is returned.
    - Responds with a reference to another DNS server sometimes (also referred to as a nonauthoritative response (note that a nonauthoritative response is given when the queried DNS server does not host a primary or secondary copy of the resource record users are looking for)).

---

[TOP](#Networking - DNS)
