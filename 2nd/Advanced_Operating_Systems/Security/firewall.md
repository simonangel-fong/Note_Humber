# Secury - Firewall

[Back](../index.md)

- [Secury - Firewall](#secury---firewall)
  - [Firewall](#firewall)
  - [Access control list](#access-control-list)
  - [Types of firewalls](#types-of-firewalls)
  - [Firewall Services](#firewall-services)
    - [Packet Filtering](#packet-filtering)
    - [Stateful Packet Inspection](#stateful-packet-inspection)
    - [Proxy Services](#proxy-services)
  - [NAT (Network Address Translation)](#nat-network-address-translation)
    - [Types of NAT](#types-of-nat)
    - [NAT Terminology](#nat-terminology)

---

## Firewall

- `Firewall`:

  - a system that is designed to prevent unauthorized access from entering a private network by filtering the incoming information from the internet.

- `Firewall` blocks unwanted traffic and permits wanted traffic, creating a safety barrier between a private network and the public internet.

- A `Firewall` is especially important to large organizations that have a lot of computers and servers.

  - Because it protects these devices from being accessible to everyone.

---

## Access control list

- `Access Control List "ACL"`: a network traffic filters that can control incoming or outgoing traffic.

  - ACLs work on a set of rules that define how to forward or block a packet at the router’s interface.
  - An ACL is the same as a Stateless Firewall, which only restricts, blocks, or allows the packets that are flowing from source to destination.

- are customizable and determined by network administrator who has previlige to decide what can enter and what can leave a network.

- Rules are either allows or denies permission.
  - based on:
    - IP addresses
    - Domain names
    - Protocals
    - Ports
    - Key words

---

## Types of firewalls

- `Host-based firewall`:

  - Software firewall that is installed on a computer.
  - protects that computer only.
  - Example:
    - Windows Firewall which comes by default in all Windows Operating Systems.
    - 3rd party: Zone Alarm
    - Antivirus programs come with a host-based firewall

- `Network-based firewall`:

  - is a combination of hardware and software, operating at the network layer between a private network and the public internet.
  - protect the entire network by management rules that apply to the entire network and stop harmful activity before it reaches the computers.
  - Example:
    - stand-alone firewall device, used by large organization.
    - a built-in component of a router used by smaller organization.
    - a cloud firewall deployed in a service provider's cloud infrastructure.

- packet-filtering firewall

  - router filters packet-by-packet, decision to forward/drop packet based on:
    - source IP address, destination IP address
    - TCP/UDP source and destination port numbers
    - ICMP message type
    - TCP SYN and ACK bits
  - At the network layer

- Application-level gateway
  - At the application layer

---

## Firewall Services

- Firewalls perform the following services:

  - Packet Filtering
  - Stateful Packet Inspection
  - Proxying
  - Network Address Translation (NAT)

- Each will be covered in some detail in this guide.

### Packet Filtering

- `Packet Filtering` is one of the core services provided by firewalls. Packets can be filtered (permitted or denied) based on a wide range of criteria:

  - Source address
  - Destination address
  - Protocol Type (IP, TCP, UDP, ICMP, ESP, etc.)
  - Source Port
  - Destination Port

- Packet filtering is implemented as a rule-list:

  - The order of the rule-list is a critical consideration.
    - The rule-list is always parsed from **top-to-bottom**. Thus, more specific rules should always be placed near the top of the rule-list, otherwise they may be negated by a previous, more encompassing rule.
    - an implicit 'deny any' rule usually exists at the bottom of a rule-list, which often can’t be removed. Thus, rule-lists that contain **only** deny statements will prevent all traffic.

---

### Stateful Packet Inspection

- `Stateful packet inspection` provides services beyond simple packetfiltering, by additionally tracking TCP or UDP sessions between devices.

  - For example, stateful inspection can track connections that originate from the trusted network. This session information is kept in a state session table, which allows temporary holes to be opened in the firewall for the return traffic, which might otherwise be denied.

- Connections from the untrusted network to the trusted network are also monitored, to prevent `Denial of Service (DoS)` attacks. If a high number of `half-open sessions` are detected, the firewall can be configured to drop the session (and even block the source), or send an alert message indicating an attack is occurring.

  - A `half-open TCP session` indicates that the three-way handshake has not yet completed.
  - A `half-open UDP session` indicates that no return UDP traffic has been detected.
  - A large number of `half-opened sessions` will chew up resources, while preventing legitimate connections from being established.

---

### Proxy Services

- A `proxy server`, by definition, is used to make a request on behalf of another device. It essentially serves as a middle-man for communication between devices.

  - This provides an element of security, by hiding the actual requesting source.
  - All traffic will seem to be originated from the proxy itself.

- Traditionally, proxy servers were used to cache a local copy of requested external data. This improved performance in limited-bandwidth environments, allowing clients to request data from the proxy, instead of the actual external source.

- Other services that proxy servers can provide:
  - Logging
  - Content Filtering
  - Authentication

---

## NAT (Network Address Translation)

- The rapid growth of the Internet resulted in a shortage of IPv4 addresses. In response, the powers that be designated a specific subset of the IPv4 address space to be private, to temporarily alleviate this problem.

- A `public address` can be routed on the Internet. Thus, devices that should be Internet accessible (such web or email servers) must be configured with public addresses.

- A `private address` is only intended for use within an organization, and can never be routed on the internet.

- Three private addressing ranges were allocated, one for each IPv4 class:

  - Class A - 10.x.x.x
  - Class B - 172.16-31.x.x
  - Class C - 192.168.x.x

- `NAT (Network Address Translation)` is used to translate between private addresses and public addresses.

  - NAT allows devices configured with a `private address` to be stamped with a `public address`, thus allowing those devices to communicate across the Internet.

- `NAT` is not restricted to just `public-to-private` address translations, though this is the most common application of NAT. NAT can perform a `public-topublic` address translation, or a `private-to-private` address translation as well.

- `NAT` provides an additional benefit
  - hiding the specific addresses and addressing structure of the internal network.

---

### Types of NAT

- `NAT` can be implemented using one of three methods:

- `Static NAT`: performs a static one-to-one translation between two addresses, or between a port on one address to a port on another address.

  - `Static NAT` is most often used to assign a public address to a device behind a NAT-enabled firewall/router.

- `Dynamic NAT`: utilizes a pool of global addresses to dynamically translate the outbound traffic of clients behind a NAT-enabled device.

- `NAT Overload` or `Port Address Translation (PAT)`: translates the outbound traffic of clients to unique port numbers off of a single global address. PAT is necessary when the number of internal clients exceeds the available global addresses.

---

### NAT Terminology

- Specific terms are used to identify the various NAT addresses:

- `Inside Local`: the specific IP address assigned to an **inside host** behind a NAT-enabled device (usually a private address).
- `Inside Global` – the address that identifies an **inside host** to the outside world (usually a public address). Essentially, this is the dynamically or statically-assigned `public address` assigned to a `private host`.
- `Outside Global`: the address assigned to an `outside host` (usually a public address).
- `Outside Local` – the address that identifies an outside host to the inside network. Often, this is the same address as the Outside Global. However, it is occasionally necessary to translate an outside (usually public) address to an inside (usually private) address.

- For simplicity sake, it is generally acceptable to associate global addresses with public addresses, and local addresses with private addresses. However, remember that public-to-public and private-to-private translation is still possible. Inside hosts are within the local network, while outside hosts are external to the local network.

---

[TOP](#secury---firewall)
