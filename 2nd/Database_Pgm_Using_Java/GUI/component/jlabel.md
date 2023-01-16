## JLabel

[Back](../java_swing.md)

[TOC]

---

## JLabel Class

`Java JLabel`: The object of JLabel class is a component for **placing text** in a container. It is used to <u>display a single line of read only text</u>. The text can be changed by an application but a <u>user cannot edit it directly</u>. It inherits JComponent class.

---

## Constructors

| Constructor                                         | Description                                                                         |
| --------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `JLabel()`                                          | Creates a JLabel instance with no image and with an empty string for the title.     |
| `JLabel(String s)`                                  | Creates a JLabel instance with the specified text.                                  |
| `JLabel(Icon i)`                                    | Creates a JLabel instance with the specified image.                                 |
| `JLabel(String s, Icon i, int horizontalAlignment)` | Creates a JLabel instance with the specified text, image, and horizontal alignment. |

---

## Methods

| Methods                                      | Description                                                        |
| -------------------------------------------- | ------------------------------------------------------------------ |
| `String getText()`                           | It returns the text string that a label displays.                  |
| `void setText(String text)`                  | It defines the single line of text this component will display.    |
| `void setHorizontalAlignment(int alignment)` | It sets the alignment of the label's contents along the X axis.    |
| `Icon getIcon()`                             | It returns the graphic image that the label displays.              |
| `int getHorizontalAlignment()`               | It returns the alignment of the label's contents along the X axis. |

---

## Example 1

```java
import javax.swing.*;

public class DemoLabel {
    public static void main(String args[]) {
        // Creates Frame
        JFrame frame = new JFrame("Label Example");

        // Creates Label and sets attributes
        JLabel label01, label02;
        label01 = new JLabel("First Label.");
        label01.setBounds(50, 50, 100, 30);
        label02 = new JLabel("Second Label.");
        label02.setBounds(50, 120, 100, 30);

        // Adds components to the frame
        frame.add(label01);
        frame.add(label02);

        // Sets attributes of the frame
        frame.setSize(300, 300);
        frame.setLayout(null);
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);
    }
}
```

![output](https://static.javatpoint.com/java/swing/images/java-jlabel1.png)

---

[TOP](#jlabel)
