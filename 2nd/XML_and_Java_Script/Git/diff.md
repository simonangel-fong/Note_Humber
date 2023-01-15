# Git diff

[Back](./index.md)

- [Git diff](#git-diff)
  - [Displays changes since last commit 查看自上次提交后的修改](#displays-changes-since-last-commit-查看自上次提交后的修改)
  - [Compares Between Branches](#compares-between-branches)

---

## Displays changes since last commit 查看自上次提交后的修改

| Git Command           | Description                                           |
| --------------------- | ----------------------------------------------------- |
| `git diff`            | Displays all changes since last commit                |
| `git diff [filename]` | Displays all changes in given files since last commit |

1. 被 git 追踪的文件中的新修改，未 Add 的新文件不会比较.
2. 只比较当前分支，不涉及其他分支。

---

## Compares Between Branches

| Git Command                    | Description                                    |
| ------------------------------ | ---------------------------------------------- |
| `git diff <branchA> <branchB>` | Displays changes between branch A and branch B |

---

[TOP](#git-diff)

**!Important**: This note is for personal use. Copy right reserved.
