# Git Branch

[Back](./index.md)

---

[TOC]

---

## Git Branching

![Git Branching](./pic/git_branching.png)

---

## List Branches 查看分支

- Syntax:

| Git Command         | Description                                            |
| ------------------- | ------------------------------------------------------ |
| `git branch`        | List all of the branches in local repository.          |
| `git branch --list` | 同上                                                   |
| `git branch -r`     | List all branches in remote repository                 |
| `git branch -a`     | List both remote-tracking branches and local branches. |

## Create a new Branch 创建新分支

| Git Command                     | Description                                                     |
| ------------------------------- | --------------------------------------------------------------- |
| `git branch <new-branch>`       | Creates a new branch in local repository, without checking out. |
| `git checkout -b <new-branch> ` | Creates a new branch in local repository and checks out.        |

---

## Switch between branches 切换分支

| Git Command             | Description                     |
| ----------------------- | ------------------------------- |
| `git checkout <branch>` | Switches to a specified branch. |

## Push the branch to the remote Repository 推送分支到远端

| Git Command                  | Description                                       |
| ---------------------------- | ------------------------------------------------- |
| `git push <remote> <branch>` | Push the `<branch>` to the `<remote>` repository. |

- 先使用 checkout 切换到需要的分支，再推送。
- 当以 github 为远端时，会在 github 创建一个分支。
  - 在 github 中可以使用 pull request，将 push 的分支合并到远端的主分支 master。

---

[Top](#git-branch)

**!Important**: This note is for personal use. Copy right reserved.
