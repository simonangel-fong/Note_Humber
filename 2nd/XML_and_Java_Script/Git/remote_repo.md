# Remote Repository

[Back](../index.md)

[TOC]

---

## `git remote`: 远端仓库设置

- Syntax:

| Git Command                               | Description                                                                 |
| ----------------------------------------- | --------------------------------------------------------------------------- |
| `git remote`                              | Lists the remote connections 列出远端的名称                                 |
| `git remote -v`                           | Lists the remote connections, including the URL of each connection.包括 url |
| `git remote add <name> <url>`             | Adds a remote named `<name>` for the repository at `<URL>`                  |
| `git remote rm <name>`                    | Removes the connection to the remote repository called `＜name＞`           |
| `git remote rename <old-name> <new-name>` | Rename a remote connection from `＜old-name＞` to `＜new-name＞`.           |
| `git remote show <name>`                  | Outputs high-level information about the remote `＜name＞`.                 |

---

## `git clone`: 克隆远端代码仓库到本地

- Syntax:

```
git clone url
```

- Argument:

  - `url`: 一般是 github 的 url。

- Clone the remote repository in a folder on a local machine.
  - 复制仓库的代码文件的同时， 会创建一个隐藏文件夹`.git`，用于存放 git 数据。

> 查看隐藏文件`.git`
>
> 1.  打开 git bash
> 2.  输入命令`ls -al`<br> ![hidden .git folder](./pic/hidden%20git%20folder.png)

---

## `git push`:推送到远端仓库

- Update remote refs along with associated objects

- Syntax:

| Git Command                    | Description                                                 |
| ------------------------------ | ----------------------------------------------------------- |
| `git push <alias> <branch>`    | `<alias>`:远端仓库别名; `<branch>`:分支                     |
| `git push -u <alias> <branch>` | set upstream:设置 push 的默认参数，此后只需要`git push`即可 |

---

## `git pull`: 从远程获取代码并合并本地的版本

- Fetches and download content from a remote repository and immediately updates the local repository to match that content.

- Syntax:

| Git Command                                        | Description                                      |
| -------------------------------------------------- | ------------------------------------------------ |
| `git pull`                                         | Updates the master branch with remote            |
| `git pull <remote>`                                | Updates the master branch with `<remote>`        |
| `git pull <remote> <remote_branch>`                | Updates the master branch with `<remote_branch>` |
| `git pull <remote> <remote_branch>:<local_branch>` | Updates `<local_branch>` with `<remote_branch>`  |

---

[TOP](#remote-repository)

**!Important**: This note is for personal use. Copy right reserved.
