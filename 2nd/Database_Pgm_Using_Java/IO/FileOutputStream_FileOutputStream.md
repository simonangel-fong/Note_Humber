# FileInputStream/FileOutputStream

[Back](./file_io.md)

- [FileInputStream/FileOutputStream](#fileinputstreamfileoutputstream)
  - [FileInputStream Class](#fileinputstream-class)
    - [Constructor](#constructor)
    - [Method](#method)
    - [Example: Read a binary file](#example-read-a-binary-file)
  - [FileOutputStream Class](#fileoutputstream-class)
    - [Constructor](#constructor-1)
    - [Method](#method-1)
    - [Example: Write a binary file](#example-write-a-binary-file)

---

## FileInputStream Class

- `FileInputStream`: to read **bytes** from **files**.

  - A `java.io.FileNotFoundException` will occur if you attempt to create a `FileInputStream` with a **nonexistent** file.

---

### Constructor

| Constructor                        | Description                                     |
| ---------------------------------- | ----------------------------------------------- |
| `FileInputStream(File file)`       | Creat a `FileInputStream` from a `File` object. |
| `FileInputStream(String filename)` | Creat a `FileInputStream` from a `file name.    |

---

### Method

| Method         | Description                                |
| -------------- | ------------------------------------------ |
| `int read()`   | read a byte of data from the input stream. |
| `void close()` | to closes the stream.                      |

---

### Example: Read a binary file

```java

import java.io.*;

public class FileInputStreamDemo {
    public static void main(String[] args) {
        String path = "./text.txt";
        File file = new File(path);

        try {
            FileInputStream fis = new FileInputStream(file);

            int byteInt = 0; // Initiate a variable to get byte later.
            while ((byteInt = fis.read()) != -1) { // read the content of a file into byte; if it is not -1, then loop
                System.out.print((char) byteInt);// conver byte to character.
            }

            fis.close();

        } catch (IOException ex) {

        }
    }
}

```

---

## FileOutputStream Class

- `FileOutputStream`: to write **bytes** to **files**.

  - Once you create `FileOutputStream` instance If the file does **not exist**, a new file will be **created**.

  - If the file **already exists**, the first two constructors will **delete the current content** of the file.

  - To retain the current content and **append** new data into the file, use the last two constructors and pass true to the append parameter.

---

### Constructor

| Constructor                                         | Description                                                |
| --------------------------------------------------- | ---------------------------------------------------------- |
| `FileOutputStream(File file)`                       | creat from a file object.                                  |
| `FileOutputStream(String filename)`                 | creat from a string.                                       |
| `FileOutputStream(File file), boolean append)`      | If append is true, data are appended to the existing file. |
| `FileOutputStream(String filename, boolean append)` | If append is true, data are appended to the existing file. |

---

### Method

| Method                   | Description                                                              |
| ------------------------ | ------------------------------------------------------------------------ |
| `void write(byte[] ary)` | to write ary.length bytes from the byte array to the file output stream. |
| `void close()`           | to closes the file output stream.                                        |

---

### Example: Write a binary file

```java

import java.io.*;

public class FileOutputStreamDemo {
    public static void main(String[] args) {
        String path = "./text.dat";
        File file = new File(path);

        try {
            FileOutputStream fos = new FileOutputStream(file, true);// append content to the existing file.
            String text = "It uses binary I/O to write ten byte values from 10 to 1 to a file \n";
            fos.write(text.getBytes());// converting string into byte array

            for (int i = 0; i < 10; i++) {
                byte[] byteArray = (Integer.toString(i)).getBytes();
                fos.write(byteArray);
            }
            fos.write("\n".getBytes());
            fos.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

[TOP](#fileinputstreamfileoutputstream)
