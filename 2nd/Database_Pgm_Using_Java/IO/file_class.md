# File Class

[back](./file_io.md)

- [File Class](#file-class)
  - [File](#file)
  - [Constructor](#constructor)
  - [Method](#method)

---

## File

- Data stored in the program are **temporary**; they are lost when the program terminates. To permanently store the data created in a program, you need to save them in a file on a disk or other permanent storage device.

- The `File` class contains the methods for obtaining file and directory properties and for renaming and deleting files and directories. The `File` class **does not contain the methods for reading and writing file contents**.

- File name

  - **Absolute file name(or full name)**: contains a file name with its **complete path** and drive letter.

    - Absolute file names are **machine dependent**

  - **Relative file name**: in relation to the current working directory.

---

## Constructor

| Constructor                         | Description                                                                                        |
| ----------------------------------- | -------------------------------------------------------------------------------------------------- |
| `File(String pathname)`             | Creates a new File instance by converting the given **pathname string** into an abstract pathname. |
| `File(String parent, String child)` | Creates a new File instance from a **parent pathname string** and a **child pathname string**.     |

---

## Method

| Method                | Return    | Description                                                                                                                   |
| --------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `exists()`            | `boolean` | Tests whether the **file or directory** denoted by this abstract pathname **exists**.                                         |
| `canExecute()`        | `boolean` | Tests whether the application can **execute** the file denoted by this abstract pathname.                                     |
| `canRead()`           | `boolean` | Tests whether the application can **read** the file denoted by this abstract pathname.                                        |
| `canWrite()`          | `boolean` | Tests whether the application can **modify** the file denoted by this abstract pathname.                                      |
| `isDirectory()`       | `boolean` | Tests whether the file denoted by this abstract pathname **is a directory.**                                                  |
| `isFile()`            | `boolean` | Tests whether the file denoted by this abstract pathname **is a normal file**.                                                |
| `isHidden()`          | `boolean` | Tests whether the file named by this abstract pathname **is a hidden file**.                                                  |
| `length()`            | `long`    | Returns the length of the file denoted by this abstract pathname.                                                             |
| `listFiles()`         | `File[]`  | Return the files under the directory for a directory File object.                                                             |
| `createNewFile()`     | `boolean` | Atomically creates a new, empty file named by this abstract pathname if and only if a file with this name does not yet exist. |
| `mkdir()`             | `boolean` | Creates the directory named by this abstract pathname.                                                                        |
| `mkdirs()`            | `boolean` | Creates the directory named by this abstract pathname, including any necessary but nonexistent parent directories.            |
| `delete()`            | `boolean` | Deletes the file or directory denoted by this abstract pathname.                                                              |
| `renameTo(File dest)` | `boolean` | Renames the file denoted by this abstract pathname.                                                                           |

---

[TOP](#file)
