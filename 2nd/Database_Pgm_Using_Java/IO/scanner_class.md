# Scanner Class

[Back](./file_io.md)

- [Scanner Class](#scanner-class)
  - [Scanner](#scanner)
  - [Constructor](#constructor)
  - [Method](#method)
  - [Example: Read input from console](#example-read-input-from-console)
  - [Example: Read input from file](#example-read-input-from-file)
  - [Example: Read input from file, using try-with-resource](#example-read-input-from-file-using-try-with-resource)

---

## Scanner

- The `java.util.Scanner` class was used to read strings and primitive values from the console.

  - A Scanner breaks its input into tokens delimited by **whitespace characters**.

- To read from the **keyboard**, create a Scanner for `System.in`:
  `Scanner input = new Scanner(System.in);`

- To read from a **file**, create a Scanner for a `file`:
  `Scanner input = new Scanner(new File(filename));`

---

## Constructor

| Constructor                   | Description                                                                            |
| ----------------------------- | -------------------------------------------------------------------------------------- |
| `Scanner(File source)`        | constructs a new Scanner that produces values scanned from the specified file.         |
| `Scanner(InputStream source)` | constructs a new Scanner that produces values scanned from the specified input stream. |

---

## Method

| Method              | Description                                                   |
| ------------------- | ------------------------------------------------------------- |
| `boolean hasNext()` | returns true if this scanner has another token in its input.  |
| `String next()`     | get the next complete token from the scanner which is in use. |
| `String nextLine()` | get the input string that was skipped of the Scanner object.  |

---

## Example: Read input from console

```java

public class ScannerConsole {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Input a word:");
        String word = sc.nextLine();

        System.out.println("\nThe line just input:");
        System.out.println(word);
    }

}

```

---

## Example: Read input from file

```java

import java.io.*;
import java.util.*;

public class ScannerTextFile {
    public static void main(String[] args) {
        String path = "./text.txt";
        File file = new File(path);

        try {
            Scanner scanner = new Scanner(file);

            while (scanner.hasNext()) {
                System.out.println(scanner.nextLine());
            }

            scanner.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

## Example: Read input from file, using try-with-resource

```java

import java.io.*;
import java.util.*;

public class ScannerTextFileTry {
    public static void main(String[] args) {
        String path = "./text.txt";
        File file = new File(path);

        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNext()) {
                System.out.println(scanner.nextLine());
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

[TOP](#scanner-class)
