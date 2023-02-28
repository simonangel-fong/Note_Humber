# RandomAccessFile Class

[Back](./file_io.md)

- [RandomAccessFile Class](#randomaccessfile-class)
  - [Random Access](#random-access)
  - [RandomAccessFile](#randomaccessfile)
  - [Constructor](#constructor)
  - [Method](#method)
  - [Example](#example)

---

## Random Access

- **Sequential access**: process file one byte at a time.

- **Random access**s: access file at arbitrary locations.
  - Only **disk files** support random access. `System.in` and `System.out` do not.
  - Each disk file has a special file pointer position. Read or write at pointer position.

## RandomAccessFile

- This class is used for reading and writing to random access file. A random access file **behaves like a large array of bytes**.
- There is a cursor implied to the array called **file pointer**, by moving the cursor we do the read write operations.
- If end-of-file is reached before the desired number of byte has been read than `EOFException` is thrown. It is a type of `IOException`.

---

## Constructor

| Constructor                                  | Description                                                      |
| -------------------------------------------- | ---------------------------------------------------------------- |
| `RandomAccessFile(File file, String mode)`   | `file` - the file object, `mode` - the access mode               |
| `RandomAccessFile(String name, String mode)` | `name` - the system-dependent filename, `mode` - the access mode |

- Mode:

| Mode  | Operation                         | Description                                                                                                                                       |
| ----- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `r`   | Open for **reading** only.        | Invoking any of the write methods of the resulting object will cause an IOException to be thrown.                                                 |
| `rw`  | Open for **reading and writing**. | If the file does not already exist then an attempt will be made to **create** it.                                                                 |
| `rws` | Open for **reading and writing**  | as with "rw", and also require that every update to the file's content or metadata be written **synchronously** to the underlying storage device. |
| `rwd` | Open for **reading and writing**  | as with "rw", and also require that every update to the file's content be written **synchronously** to the underlying storage device.             |

---

## Method

| Method                      | Description                                                                                                     |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- |
| `long getFilePointer()`     | Returns the current offset in this file.                                                                        |
| `void	seek(long position)`   | Sets the file-pointer offset, measured from the beginning of this file, at which the next read or write occurs. |
| `long	length()`              | It returns the length of this file.                                                                             |
| `int	read()`                 | It **reads a byte** of data from this file.                                                                     |
| `String	readUTF()`           | It reads in a string from this file.                                                                            |
| `void	write(int byte)`       | It writes the specified byte to this file.                                                                      |
| `void writeUTF(String str)` | Writes a string to the file using modified UTF-8 encoding in a machine-independent manner.                      |

---

## Example

```java

import java.io.*;

public class RandomAccessFileDeom {
    public static void main(String[] args) {
        String path = "./text.bin";
        File file = new File(path);

        try {
            RandomAccessFile raf = new RandomAccessFile(file, "rw");
            String content = "Writes a string to the file using modified UTF-8 encoding in a machine-independent manner.";

            raf.writeUTF(content); // write a string

            raf.seek(0);// set file pointer to the beginning of the file
            String message = raf.readUTF(); // read a string

            System.out.println(message);

            raf.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

[TOP](#randomaccessfile-class)
