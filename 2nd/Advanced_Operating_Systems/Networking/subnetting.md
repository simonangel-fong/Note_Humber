# Networking - Subnetting

[Back](../index.md)

- [Networking - Subnetting](#networking---subnetting)
  - [Subnetting](#subnetting)
  - [Subnet Mask](#subnet-mask)
  - [Subnetting Calculation](#subnetting-calculation)

---

## Subnetting

- `Subnetting`: break down a network into smaller subnets.
- Defined originally as five address classes with a fixed number of hosts per network by the IANA.
- Using a fixed size of addresses per network often leads to having many unused IP addresses (implementing subnetting tackles this issue).
- Allows users to allocate IP addresses based on available computers.
- Divides or segments a large network into multiple networks.
- Offers the following advantages when configured (in addition to the efficient use of an IP address):

  - Reduces network congestion.
  - Avoids traffic collision.
  - Improves network performance.
  - Increases network security.

- Reaons of creating subnets
  - manageability
  - security
  - improve performance

---

## Subnet Mask

- A `subnet mask reveals` how many bits in the IP address are used for the network by masking the `network portion` of the IP address.
- Looks like an IP address and is written using the same dotted-decimal notation, such as 255.255.255.0.
- Associated with an IP address in order **to define what network a computer belongs to**.
- Determines the `network portion` and the `host portion` in an IP address
  - `network portion`: identify the computer’s network
  - `host portion`: identifies the computer within the network
  - Depends on the IP address and cannot be configured on its own.
- Example:
  - IP address: 172.16.10.20/24
    - Network portion: 172.16.10
    - Host portion: 20
- `CIDR`: Classless Inte-Domain Routing (Slash Notation)
  - `/24` = `255.255.255.0`

![subnet](./pic/subnetting%20mask.png)

---

## Subnetting Calculation

Uses 2n-2 to determine the number of usable hosts per subnet (the two addresses represent the
`network` and `broadcast addresses`).

---

[TOP](#networking---subnetting)
