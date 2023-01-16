## JPanel

[Back](../java_swing.md)

[TOC]

---

## JPanel class

- `JPanel class` is a simplest **container class**. It <u>provides space</u> in which an application can attach any other component.
  - It inherits the JComponents class.

---

## Constructors

| Constructor                    | Description                                                                 |
| ------------------------------ | --------------------------------------------------------------------------- |
| `JPanel()`                     | It is used to create a new JPanel with a double buffer and a `flow layout`. |
| `JPanel(LayoutManager layout)` | It is used to create a new JPanel with the specified layout manager.        |

---

## Useful Methods

---

## Example

1. creates a frame
2. creates 2 buttons
3. Uses panel to contain 2 buttons in flowlayout.

```java

import java.awt.*;
import javax.swing.*;

public class Demo03 {

    public static void main(String[] args) {

        // Creates a Frame
        JFrame frame = new JFrame("Panel Example");

        // Creates a Panel and sets attributes
        JPanel panel = new JPanel();
        panel.setBounds(40, 80, 200, 200);
        panel.setBackground(Color.gray);//

        // Creates 2 buttons
        JButton btn01 = new JButton("Button 1");
        btn01.setBounds(50, 100, 80, 30);
        btn01.setBackground(Color.yellow);

        JButton btn02 = new JButton("Button 2");
        btn02.setBounds(100, 100, 80, 30);
        btn02.setBackground(Color.green);

        // Add components to container
        panel.add(btn01);
        panel.add(btn02);
        frame.add(panel);

        // Sets attributes of the Frame
        frame.setSize(400, 400);
        frame.setLayout(null);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}

```

![panel](https://static.javatpoint.com/java/swing/images/java-jpanel1.png)


---

[Top](#GUI)
