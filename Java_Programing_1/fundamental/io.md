[Back to Java](../index.md)

# I/O

[TOC]

***

- The console window that starts a Java application is typically known as the **standard output device**.
  console window = standard output device

- The **standard input device** is typically the keyboard.
    keyboard = standard input device

## System.out
- The **standard Java library**, which a Java class is used to send information to the standard output device, is commonly referred to as the **Java API**
    std Java library = Java API = 用于输入输出
&emsp;

- 代码解释: `System.out.println("");`
    - The `System` class is called from the standard Java library.
    - The `System` class contains methods and objects that perform system level tasks.
    - The `out` object, a member of the `System` class, contains the methods `print` and `println`.
    - The `println` method places a **newline character** at the end of whatever is being printed out. 在最后放置一个换行号
    - By contrast, the `print` statement does not put a newline character at the end of the output.
    - The value inside the parenthesis, called an **argument**参数, will be sent to the output device (in this case, a string).


### Escape Sequences 转义序列

- **Escape sequences** allow the programmer to print characters that otherwise would be unprintable.
    能打印或显示本来不能被打印的字符

- The `\n` in the string is an **escape sequence**that represents the **newline character**

![escape](../pic/fundamental/io/Common_escape_sequences.png)

--- 

## System.out.printf() 格式化输出

- Syntax

```java
System.out.printf(FormatString, ArgumentList)
```
- `FormatString` is a string that contains text and/or special formatting specifiers

- `ArgumentList` is a list of zero or more additional arguments, formatted according to the format specifiers listed in the FormatString.
    按顺序显示

- Format specifier的数量=argument list的长度

- Format specifier:

|Format specifier|Data type|
|-|-|
|`%d`|`int`|
|`%s`|`string`|
|`%f`|`float`|

- A format specifier may also include a field width. If the value of the argument is wider than the specified field width, the field width will be expanded to accommodate the value. 如果实际参数的位数大于field width, 则自动适应参数。

e.g.: <br>
`%6d` printed in a field that is 6 places wide. 即有六个位，没有内容的用空格表示，内容从右边开始。<br>

` %8.2f` 总共8位，留两个小数，如果小数不够则四舍五入。<br>

`%,.2f` 没有指定总位数，保留2个小数，使用逗号分隔group digits in a number<br>

`%10s` 指定10个字母位。

---

## Scanner class: Reading Keyboard Input

`Scanner class` is defined in `java.util` to read input from the keyboard.

### Declearation and Assignment

- Syntax:

```java
Scanner keyboard = new Scanner (System.in);
```

- import: `import java.util.Scanner;`

- 参数是`System.in`

### Method

| Method       | read for       |
| ------------ | -------------- |
| `nextLine`   | strings        |
| `nextByte`   | bytes          |
| `nextInt`    | integers       |
| `nextLong`   | long integers  |
| `nextShort`  | short integers |
| `nextFloat`  | floats         |
| `nextDouble` | doubles        |

- For a single character, to use the `nextLine` method to read a string first. Then use the `String.charAt()` method to extract the character.

### Mixing Calls to nextLine with Calls to Other Scanner Methods

- Keystrokes are stored in an area of memory that is sometimes called the `keyboard buffer`.

- Pressing the Enter key causes a newline character (`/n`) to be stored in the keyboard buffer.

- The Scanner methods that are designed to read primitive values, such as `nextInt` and `nextDouble`, will **ignore the newline** and return only the numeric value.
  由于被忽略的newline字符的干扰，当下一个读取方式是nextLine时，会默认读取newline字符，导致不会等待用户输入。

- The Scanner class’s `nextLine` method will read the newline that is left over in the keyboard buffer, return it, and terminate without reading the intended input.

- 解决方法: 在读取其他类型数据后，多执行`.nextLine()`,消除newline字符。

---

## Dialog Boxes

- A `dialog box` is a **small graphical window** that **displays a message** to the user or requests input.

- Two of the dialog boxes are:
  - Message Dialog - a dialog box that **displays a message**.
  - Input Dialog - a dialog box that prompts the user **for input**.

### Displaying Message Dialogs

- Syntax:

```java

import javax.swing.JOptionPane;

JOptionPane.showMessageDialog(null, message);

```
- import package: `javax.swing.JOptionPane`

- method: `showMessageDialog()`

- Arguement:
  - `message`: string, the content to display

---

### Displaying Input Dialogs

- displays a text field for input
  - `OK`: return input
  - `Cancel`: return `null`

- Syntax:

```java

import javax.swing.JOptionPane;

String name;

name = JOptionPane.showInputDialog("Enter your name.");

// some codes

System.exit(0);

```

- Arguement: message to display.

- 在结尾输入调用exit方法。因为对话框会一直在后台运行，所以需要调用该方法停止线程。

