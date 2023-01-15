# Local Repository

[Back](./index.md)

- [Local Repository](#local-repository)

  - [git init: 创建空的 - git 或重新初始化一个存在的 - git](#git-init-创建空的-git-或重新初始化一个存在的-git)
  - [git status: 显示当前文件夹中文件状态](#git-status-显示当前文件夹中文件状态)
  - [git add: 将文件添加到暂存区](#git-add-将文件添加到暂存区)
  - [git commit: 提交](#git-commit-提交)
  - [git log: 查看提交记录](#git-log-查看提交记录)
  - [Undo a staged file 撤销缓存](#undo-a-staged-file-撤销缓存)
  - [Undo a Commit 撤销提交](#undos-a-commit-撤销提交)

---

## `git init`: 创建空的 git 或重新初始化一个存在的 git

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

## `git add`: 将文件添加到暂存区

- Add file contents to the index

- Syntax:

| Git Command        | Description                                          |
| ------------------ | ---------------------------------------------------- |
| `git add .`        | Adds the files of the current direcotry to the index |
| `git add *`        | Adds all files                                       |
| `git add -A`       | All files in the entire working tree are updated     |
| `git add filename` | Adds the file with a given filename                  |

---

## `git commit`: 提交

- Record changes to the repository

- Syntax:

| Git Command                         | Description                                          |
| ----------------------------------- | ---------------------------------------------------- |
| `git commit -m '<msg>' `            | Use the given `<msg>` as the commit message.         |
| `git commit -m '<msg>' -m '<desc>'` | `<msg>`: the title of a commit, `<desc>`:description |
| `git commit -am '<msg>'`            | Commits the modified files that have been committed. |

---

## `git log`: 查看提交记录

| Git Command                | Description                                    |
| -------------------------- | ---------------------------------------------- |
| `git log`                  | Show commit history                            |
| `git log -<NUM>`           | Show the last `<NUM>` history                  |
| `git log --oneline -<NUM>` | Show the last `<NUM>` history in a short form. |

---

## Undo a staged file 撤销缓存

- 注意该处时 staged file, 即已经被 add 但没有 commit 的文件。
- reset 后在 stage 的修改将会撤销，但修改依然会存在 unstage，即相关修改依然保留在文件。

| Git Command          | Description               |
| -------------------- | ------------------------- |
| `git reset`          | Unstates all staged files |
| `git reset filename` | Unstates the staged file  |

---

## Undos a Commit 撤销提交

| Git Command             | Description                                                             |
| ----------------------- | ----------------------------------------------------------------------- |
| `git reset HEAD`        | Undo all commits after the specific commit                              |
| `git reset --hard HEAD` | Undo all commits after the specific commit and remove all modification. |
| `git reset HEAD~1`      | Undo the last commit                                                    |
| `git reset HEAD~2`      | Undo the last two commit                                                |

- `HEAD~1`: the pointer of the last commit 上一个.
- `HEAD~2`: the pointer of the last two commit 上上一个.

- 默认撤销后，自指定提交之后的所有修改会被 unstage。即新的修改会保留在文件，但会从提交历史中撤销。
- 使用参数`--hard`,则所有新的修改会被移除。

---

[TOP](#local-repository)

**!Important**: This note is for personal use. Copy right reserved.
