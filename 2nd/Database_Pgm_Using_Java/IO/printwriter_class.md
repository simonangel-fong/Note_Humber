# PrintWriter Clas

[Back](./file_io.md)

- [PrintWriter Clas](#printwriter-clas)
  - [PrintWriter](#printwriter)
  - [Constructor](#constructor)
  - [Method](#method)
  - [Example: output to console](#example-output-to-console)
  - [Example: Output to Text File](#example-output-to-text-file)
  - [Example: Output to Text File, using try-resource](#example-output-to-text-file-using-try-resource)

---

## PrintWriter

- The `java.io.PrintWriter` class can be used to **create a file** and **write data** to a text file.

- The `close()` method must be used to **close** the file.
  - If this method is not invoked, the data may not be saved properly in the file.
  -
- JDK 7 and up provide try-with-resources syntax that **automatically closes** the files.
  - The resources must be a **subtype** of `AutoCloseable` that has the `close()` method.
  - A resource must be declared and created **in the same statement** and **multiple resources** can be declared and created **inside the parentheses**.
  - After the **block is finished**, the resource’s `close()` method is automatically invoked to close the resource.

```java

try (PrintWriter writer = new PrintWriter("path")) {
    // Use the resource to process the file;
}

```

---

## Constructor

| Constructor                     | Description                                                                                      |
| ------------------------------- | ------------------------------------------------------------------------------------------------ |
| `PrintWriter(File file)`        | Creates a `PrintWriter` object for a specified file object.                                      |
| `PrintWriter(String filename)`  | Creates a `PrintWriter` object for a specified file-name string.                                 |
| `PrintWriter(OutputStream out)` | Creates a new `PrintWriter`, without automatic line flushing, **from an existing OutputStream**. |

---

## Method

| Method                                  | Description                                                                                                      |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `void print(content)`                   | Write content to the file. Content can be string, character, int, float, boolean.                                |
| `void println(boolean x)`               | Write content to the file and then terminates the line. Content can be string, character, int, float, boolean.   |
| `printf(String format, Object... args)` | A convenience method to write a formatted string to this writer using the specified format string and arguments. |
| `PrintWriter append(CharSequence ch)`   | to append the specified character sequence to the writer.                                                        |

---

## Example: output to console

```java

public class WriteTextToConsole {
    public static void main(String[] args) {

        PrintWriter writer = new PrintWriter(System.out);
        writer.println("This is an example of printwriter.");// content will display in console.
        writer.println("Print content to the console.");
        writer.flush();
        writer.close();
    }
}

```

---

## Example: Output to Text File

```java

public class WriteTextFile {
    public static void main(String[] args) {
        String path = "./text.txt";
        File file = new File(path);

        try {
            PrintWriter writer = new PrintWriter(file);
            writer.println("This is an example of printwriter.");
            writer.println("Print content to the console.");
            writer.flush();
            writer.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

## Example: Output to Text File, using try-resource

```java

public class WriteTextFileTry {
    public static void main(String[] args) {
        String path = "./text.txt";
        File file = new File(path);

        try (PrintWriter writer = new PrintWriter(file);) {

            writer.println("This is an example of printwriter.");
            writer.println("Print content to the console.");
            writer.flush();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

[TOP](#printwriter-clas)
