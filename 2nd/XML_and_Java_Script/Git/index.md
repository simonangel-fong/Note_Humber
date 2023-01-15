# GIT

[Back](../index.md)

---

Videos are given by instructor:
[Git and GitHub for Beginners - Crash Course](https://www.youtube.com/watch?v=RGOj5yH7evk)

---

- Git
  - [Local Repository](./local_repo.md)
  - [Remote Repository](./remote_repo.md)
  - [Branch](./branch.md)
  - [Diff](./diff.md)

---

## What is Git?

- What is Git?

  - A: Free and open source **version control** system.版本控制系统

- What is **Version Control**?

  - A: The management of changes to documents, computer programs, web sites, and other collections of information. 管理变更 tracking changes

- Terms 术语

  - `Directory`: Folder 文件夹
  - `Terminal or Command Line`: Interface for Text Commands
  - `CLI`: Command Line Interface
  - `cd`: Change Directory
  - `Code Editor`: 代码编辑器
  - `Repository`: Project, or the folder/place where the project is kept.存放代码的地方
  - `Github`: A website to host our repositories online.在线管理仓库的网站。

- Git Commands 常见命令(注意是小写)

  | Git Command | Description                                                                                          |
  | ----------- | ---------------------------------------------------------------------------------------------------- |
  | `clone`     | Bring a repository that is hosted remotely into a folder on a local machine.将远程的代码复制到本地。 |
  | `add`       | track files and changes in Git. 将需要追踪的文件添加到 git。没有 add 的文件或变更不会被 git 追踪。   |
  | `commit`    | save the files or changes in Git.保存被 git 追踪的文件或变更                                         |
  | `push`      | upload Git commits to a remote repository.将 commit 的文件上传到远端。                               |
  | `pull`      | download changes from remote repository to the local machine.将远端仓库的变更同步到本地。            |

---

## Install Git Locally

- Guide: https://www.atlassian.com/git/tutorials/install-git#windows

  - 推荐点选 git bash. 一种专用于 git 的 shell.(因为 bash 命令是 linux 命令, 可以使用 linux 的命令进行操作，所以安装时需要点选安装 git bash)

- 验证安装：
  - 命令： `git --version`
  - 如果安装则会显示 git 的版本号。

---

## `git help`: 获取提示信息或调取文档

| Git Command            | Description                                    |
| ---------------------- | ---------------------------------------------- |
| `git help`             | Display help information about Git             |
| `git help <command>`   | Display help information about a given command |
| `git <command> --help` | Display help information about a given command |

---

## Workflow

![workflow](./pic/git%20and%20github%20workflow.png)

```
cd <directory>
git init
git add .
git commit
git push
```

1. Create a `<directory>/.git` directory.
2. Add all existing files to the index.
3. Record the pristine state as the first commit in the history.
4. Push the local files to the remote repository.

---

[Top](#git)

**!Important**: This note is for personal use. Copy right reserved.
