# DataInputStream/DataOutputStream

[Back](./file_io.md)

- [DataInputStream/DataOutputStream](#datainputstreamdataoutputstream)
  - [FilterInputStream and FilterOutputStream](#filterinputstream-and-filteroutputstream)
    - [Example: Write a binary file](#example-write-a-binary-file)
  - [DataInputStream and DataOutputStream](#datainputstream-and-dataoutputstream)
    - [Example: Read a binary file](#example-read-a-binary-file)

---

## FilterInputStream and FilterOutputStream

- Filter streams are streams that **filter bytes** for some purpose

  - The basic byte `input stream` provides a read method that can be used only for `reading bytes`.

- A filter class enables you to **read integers, doubles, and strings** instead of bytes and characters.

- When you need to process `primitive numeric types`, use DataInputStream and DataOutputStream to filter bytes.

### Example: Write a binary file

```java

import java.io.*;

public class DataOutputStreamDemo {
    public static void main(String[] args) {
        String path = "./text.bin";
        File file = new File(path);

        try {
            DataOutputStream dos = new DataOutputStream(new FileOutputStream(file));
            String text = "It uses binary I/O to write ten byte values from 10 to 1 to a file \n";
            dos.writeUTF(text);

            for (int i = 0; i < 10; i++) {
                dos.writeInt(i);
            }
            dos.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

## DataInputStream and DataOutputStream

- `DataInputStream` reads bytes from the stream and **converts** them into appropriate **primitive-type values or strings**.

- `DataOutputStream` **converts primitive-type values or strings** into bytes and outputs the bytes to the stream.

- `DataInputStream` extends `FilterInputStream` and implements the methods defined in the `DataInput` interface to **read primitive data-type values and strings**.

- `DataOutputStream` extends `FilterOutputStream` and implements the methods defined in the `DataOutput` interface to **write primitive data-type values and strings.**

---

### Example: Read a binary file

```java

import java.io.*;

public class DataInputStreamDemo {
    public static void main(String[] args) {
        String path = "./text.bin";
        File file = new File(path);

        try {
            DataInputStream dis = new DataInputStream(new FileInputStream(file));
            System.out.println(dis.readUTF());

            for (int i = 0; i < 10; i++) {
                System.out.println(dis.readInt());
            }
            dis.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

[TOP](#filterinputstreamfilteroutputstream)
