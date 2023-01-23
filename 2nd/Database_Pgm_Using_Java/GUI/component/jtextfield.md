## JTextField

[Back](../java_swing.md)

[TOC]

---

## JTextField class

The object of a `JTextField class` is a text component that **allows the editing of a single line text**. It inherits JTextComponent class.

---

## Constructor

| Constructor                           | Description                                                              |
| ------------------------------------- | ------------------------------------------------------------------------ |
| `JTextField()`                        | Creates a new TextField                                                  |
| `JTextField(String text)`             | Creates a new TextField initialized with the specified text.             |
| `JTextField(String text, int columns) | Creates a new TextField initialized with the specified text and columns. |
| `JTextField(int columns)`             | Creates a new empty TextField with the specified number of columns.      |

---

## Methods

| Methods                | Description                                                                                   |
| ---------------------- | --------------------------------------------------------------------------------------------- |
| `Action getAction()`   | It returns the currently set Action for this ActionEvent source, or null if no Action is set. |
| `void setFont(Font f)` | It is used to set the current font.                                                           |

---

## Event Listener

| Methods                                       | Description                                                                                                         |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `void addActionListener(ActionListener l)`    | It is used to add the specified action listener to receive action events from this textfield.                       |
| `void removeActionListener(ActionListener l)` | It is used to remove the specified action listener so that it no longer receives action events from this textfield. |

---

## Example

```java
import javax.swing.*;

public class DemoTextField {
    public static void main(String[] args) {

        JFrame frame = new JFrame("TextField Example");

        JTextField textField01, textField02;
        textField01 = new JTextField("Welcome to Javatpoint.");
        textField01.setBounds(50, 100, 200, 30);

        textField02 = new JTextField("AWT Tutorial");
        textField02.setBounds(50, 150, 200, 30);

        frame.add(textField01);
        frame.add(textField02);

        frame.setSize(400, 400);
        frame.setLayout(null);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
```

![output](https://static.javatpoint.com/java/swing/images/java-jtextfield1.png)

---

[TOP](#jtextfield)
