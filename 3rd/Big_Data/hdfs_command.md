# Big Data - HDFS Command

[Back](./index.md)

- [Big Data - HDFS Command](#big-data---hdfs-command)
  - [HDFS Command](#hdfs-command)

---

## HDFS Command

- Rel:
  https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/FileSystemShell.html

- Command

| Command                    | Description                                |
| -------------------------- | ------------------------------------------ |
| `hadoop fs -usage command` | Return the help for an individual command. |

- Direcotry

| Command            | Description                    |
| ------------------ | ------------------------------ |
| `hadoop fs -mkdir` | create a new directory in hdfs |
| `hadoop fs -rmdir` | delete a directory             |

- Upload/download

| Command               | Description                                                     |
| --------------------- | --------------------------------------------------------------- |
| `hadoop fs -put`      | Copy file from local to hdfs                                    |
| `hadoop fs -get`      | Copy file from hdfs to local                                    |
| `hadoop fs –getmerge` | Merge several hdfs files into one single file and copy to local |

- File

| Command                         | Description                                                          |
| ------------------------------- | -------------------------------------------------------------------- |
| `hadoop fs -ls`                 | List files in a directory                                            |
| `hadoop fs -touch`              | Updates the access and modification times.Or create zero length file |
| `hadoop fs -cat`                | Preview the content of an hdfs file                                  |
| `hadoop fs –tail`               | Print the last few lines of an hdfs file/directory                   |
| `hadoop fs –cat <file> \| head` | Print the first few lines of an hdfs file                            |

- Copy/Move/Delete

| Command         | Description       |
| --------------- | ----------------- |
| `hadoop fs -cp` | Copy file in hdfs |
| `hadoop fs –mv` | Move file in hdfs |
| `hadoop fs -rm` | Delete files      |

- Disk

| Command         | Description                      |
| --------------- | -------------------------------- |
| `hadoop fs –du` | display the size of an hdfs file |
| `hadoop fs -df` | Displays free space.             |

---

[Top](#big-data---hdfs-command)
