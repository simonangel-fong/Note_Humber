# For Loop

[Back](../index.md)

- [For Loop](#for-loop)
  - [`FOR`](#for)
    - [Example](#example)

---

## `FOR`

- A `FOR` loop is used within the code when the <u>beginning and ending value of the loop</u> is **known**.

- Syntax:

```sql

FOR counter IN REVERSE
    lower_bound..upper_bound LOOP
    -- statements;
END LOOP;

```

- 语法：
  - counter：
    - Do not declare the **counter**; it is declared implicitly.无需声明，即无需声明其数据类型和值
    - The value automatically **increases or decreases by 1** on each iteration of the loop until the upper or lower bound is reached. 步长为 1；包含上下标；
    - Reference the counter only within the loop; its scope does not extend outside the loop.仅仅在内部有效
    - Do not reference the counter as the target of an assignment. 不要再 loop 内对 counter 赋值
  - bound：
    - lower_bound .. upper_bound is the required syntax.Neither loop bound (lower or upper) should be NULL.上下标必须且不能是空
    - lower bound is referenced first. 下标先行
    - the lower and upper bounds of a LOOP statement **do not need to be numeric literals**.可以是变量
    - lower_buond specifies the **lower bound** for the range of counter values.
    - upper_bound specifies the **upper bound** for the range of counter values.
    - 一定是较小的值放在左边，较大值放在右边，否则不会迭代。
    - `..`只要放在中间即可，即可以有空格，也可以没有空格。
  - `REVERSE`: causes the counter to decrement with each iteration from the upper bound to the lower bound.降序

### Example

```sql
-- wk:04
-- Demo: FOR loop

DECLARE
    v_lowerbound INTEGER :=1;
    v_upperbound INTEGER :=5;
BEGIN
    FOR v_count IN REVERSE v_lowerbound..v_upperbound LOOP
        DBMS_OUTPUT.PUT_LINE('Loop exectuion #'||v_count);
    END LOOP;

END;

-- Loop exectuion #5
-- Loop exectuion #4
-- Loop exectuion #3
-- Loop exectuion #2
-- Loop exectuion #1
```

---

[TOP](#for-loop)
