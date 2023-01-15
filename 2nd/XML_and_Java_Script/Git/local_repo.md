# Local Repository

[Back](../index.md)

[TOC]

---

## `git-init`: 创建空的 git 或重新初始化一个存在的 git

- Create an empty Git repository or reinitialize an existing one

- Syntax:

| Git Command            | Description                                                  |
| ---------------------- | ------------------------------------------------------------ |
| `git init`             | create an empty `.git` subdirectory in the current directory |
| `git init <directory>` | create an empty `.git` subdirectory in the given directory   |

---

## `git status`: 显示当前文件夹中文件状态

- List which files are staged, unstaged, and untracked.

  - 是自上一次 commit 后的文件状态，如果 commit 后没有新增修改，则不会显示任何结果。

- Syntax：

  | Git Command     | Description                                                      |
  | --------------- | ---------------------------------------------------------------- |
  | `git status`    | Give the output in the long-format.`--long` This is the default. |
  | `git status -s` | Give the output in the short-format.使用标记简短显示。           |

- State of the files
  - `?`: untrack
  - ` `: unmodified
  - `M`: modified
  - `T`: file type changed (regular file, symbolic link or submodule)
  - `A`: added
  - `D`: deleted
  - `R`: renamed
  - `C`: copied (if config option status.renames is set to "copies")
  - `U`: updated but unmerged

---

## `git add`: 将文件添加到暂存区。

- Add file contents to the index

- Syntax:

| Git Command        | Description                                          |
| ------------------ | ---------------------------------------------------- |
| `git add .`        | Adds the files of the current direcotry to the index |
| `git add *`        | Adds all files                                       |
| `git add -A`       | All files in the entire working tree are updated     |
| `git add filename` | Adds the file with a given filename                  |

---

## `git commit`: 将文件添加到暂存区。

- Record changes to the repository

- Syntax:

| Git Command                         | Description                                          |
| ----------------------------------- | ---------------------------------------------------- |
| `git commit -m '<msg>' `            | Use the given `<msg>` as the commit message.         |
| `git commit -m '<msg>' -m '<desc>'` | `<msg>`: the title of a commit, `<desc>`:description |
| `git commit -am '<msg>'`            | Commits the modified files that have been committed. |

---

## Undo a staged file

| Git Command | Description |
| ----------- | ----------- |
| ``          |             |

---

[TOP](#local-repository)

**!Important**: This note is for personal use. Copy right reserved.
