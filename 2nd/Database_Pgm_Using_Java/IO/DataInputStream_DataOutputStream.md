# DataInputStream/DataOutputStream

[Back](./file_io.md)

- [DataInputStream/DataOutputStream](#datainputstreamdataoutputstream)
  - [FilterInputStream and FilterOutputStream](#filterinputstream-and-filteroutputstream)
  - [DataInputStream and DataOutputStream](#datainputstream-and-dataoutputstream)

---

## FilterInputStream and FilterOutputStream

- Filter streams are streams that **filter bytes** for some purpose

  - The basic byte `input stream` provides a read method that can be used only for `reading bytes`.

- A filter class enables you to **read integers, doubles, and strings** instead of bytes and characters.

- When you need to process `primitive numeric types`, use DataInputStream and DataOutputStream to filter bytes.

---

## DataInputStream and DataOutputStream

- `DataInputStream` reads bytes from the stream and **converts** them into appropriate **primitive-type values or strings**.

- `DataOutputStream` **converts primitive-type values or strings** into bytes and outputs the bytes to the stream.

- `DataInputStream` extends `FilterInputStream` and implements the methods defined in the `DataInput` interface to **read primitive data-type values and strings**.

- `DataOutputStream` extends `FilterOutputStream` and implements the methods defined in the `DataOutput` interface to **write primitive data-type values and strings.**

---

[TOP](#filterinputstreamfilteroutputstream)
