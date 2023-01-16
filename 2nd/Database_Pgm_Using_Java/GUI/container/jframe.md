## JFrame

[Back](../java_swing.md)

[TOC]

---

## JFrame Class

- The `javax.swing.JFrame` class is a type of **container** which inherits the `java.awt.Frame` class.

  - JFrame works like the **main window** where components like labels, buttons, textfields are added to create a GUI.
  - Unlike Frame, JFrame has the option to hide or close the window with the help of `setDefaultCloseOperation(int)` method.

- API: https://docs.oracle.com/javase/7/docs/api/javax/swing/JFrame.html

---

## Constructors

| Constructor            | Description                                                                   |
| ---------------------- | ----------------------------------------------------------------------------- |
| `JFrame`               | It constructs a new frame that is initially **invisible**.                    |
| `JFrame(String title)` | It creates a new, initially **invisible** Frame with the specified **title**. |

---

## Useful Methods

- Methods

| Method                                      | Description                                                                                     |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| `.setDefaultCloseOperation(int operation);` | Sets the operation that will happen by default when the user initiates a "close" on this frame. |
| `.setLocationRelativeTo(Component c)`       | Sets the location of the window relative to the specified component.                            |
| `void setLayout(LayoutManager mgr)`         | Sets the layout manager for this container. By default, the JPanel has a `FlowLayout manager`.  |

- Constant Value

| Modifier and Type          | Constant Field        | Value |
| -------------------------- | --------------------- | ----- |
| `public static final int`  | `DO_NOTHING_ON_CLOSE` | 0     |
| `public static final int`  | `HIDE_ON_CLOSE`       | 1     |
| `public static final int ` | `DISPOSE_ON_CLOSE`    | 2     |
| `public static final int`  | `EXIT_ON_CLOSE`       | 3     |

[javax.swing.WindowConstants](https://docs.oracle.com/javase/7/docs/api/)

---

## Example 1

- A Frame without title
- sets size: 400\*300
- Contains a button with text of "click"

```java
package in_class_demo.wk01;

import javax.swing.*;

public class Demo02 {

    public static void main(String[] args) {
        JFrame frame = new JFrame(); // creates a frame container with no title

        JButton btn = new JButton("click"); // creates a button with a text of click
        btn.setBounds(160, 50, 80, 30);// sets bounds of the button

        frame.add(btn); // adds the buttong obj to the frame

        frame.setSize(400, 300); // sets the size of the frame
        frame.setLayout(null);// sets layout with null, default flowlayout will be applied.
        frame.setDefaultCloseOperation(3); // Uses constant as parameter.
        frame.setVisible(true);// sets frame obj visible
    }
}

```

---

[Top](#jframe)
