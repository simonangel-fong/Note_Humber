## JCheckBox

[Back](../java_swing.md)

[TOC]

---

## JCheckBox Class

- The `JCheckBox` class is used to create a checkbox. It is used to turn an option on (true) or off (false). Clicking on a CheckBox changes its state from "on" to "off" or from "off" to "on ".It inherits JToggleButton class.

- API: https://docs.oracle.com/javase/8/docs/api/javax/swing/JCheckBox.html

---

## Constructors

| Constructor                                | Description                                                                          |
| ------------------------------------------ | ------------------------------------------------------------------------------------ |
| `JCheckBox()`                              | Creates an initially unselected check box button with no text, no icon.              |
| `JChechBox(String s)`                      | Creates an initially unselected check box with text.                                 |
| `JCheckBox(String text, boolean selected)` | Creates a check box with text and specifies whether or not it is initially selected. |
| `JCheckBox(Action a)`                      | Creates a check box where properties are taken from the Action supplied.             |

---

## Useful Methods

- Methods

| Methods                          | Description                                           |
| -------------------------------- | ----------------------------------------------------- |
| `protected String paramString()` | It returns a string representation of this JCheckBox. |

---

## Exmaple: Creates a group of CheckBox

```java

import java.awt.*;
import javax.swing.*;

public class DemoJCheckBox {

    private JFrame frame;

    private JCheckBox ckBx01;
    private JCheckBox ckBx02;

    DemoJCheckBox() {
        frame = new JFrame("Demo - JCheckBox");
        frame.setSize(300, 300);
        frame.setLayout(new FlowLayout(FlowLayout.CENTER));
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);

        ckBx01 = new JCheckBox("C++");
        ckBx02 = new JCheckBox("Java");

        JPanel pl = new JPanel();
        pl.setLayout(new BoxLayout(pl, BoxLayout.Y_AXIS));
        pl.add(ckBx01);
        pl.add(ckBx02);

        frame.add(pl);
    }

    public static void main(String[] args) {
        DemoJCheckBox demo = new DemoJCheckBox();
    }
}

```

![output](https://static.javatpoint.com/java/swing/images/java-jcheckbox1.png)

---

## Example: `.addItemListener()`

```java

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class DemoJCheckBox02 {

    DemoJCheckBox02() {
        JFrame frame = new JFrame("Demo - JCheckBox Add Action");
        frame.setSize(300, 300);
        frame.setLayout(new FlowLayout(FlowLayout.CENTER));
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);

        JCheckBox ckBx01 = new JCheckBox("C++");
        JCheckBox ckBx02 = new JCheckBox("Java");

        JLabel lb = new JLabel("fdfsdf");
        lb.setHorizontalAlignment(JLabel.CENTER);

        JPanel pl = new JPanel();
        pl.setLayout(new BoxLayout(pl, BoxLayout.Y_AXIS));
        pl.add(ckBx01);
        pl.add(ckBx02);
        pl.add(lb);

        frame.add(pl);

        // 注册监听
        ckBx01.addItemListener(new ItemListener() {
            public void itemStateChanged(ItemEvent e) {
                lb.setText("C++ Checkbox: "
                        + (e.getStateChange() == 1 ? "checked" : "unchecked"));
            }
        });

        // 注册监听
        ckBx02.addItemListener(new ItemListener() {
            public void itemStateChanged(ItemEvent e) {
                lb.setText("Java Checkbox: "
                        + (e.getStateChange() == 1 ? "checked" : "unchecked"));
            }
        });

    }

    public static void main(String[] args) {
        DemoJCheckBox02 demo = new DemoJCheckBox02();
    }
}
```

![output](https://static.javatpoint.com/java/swing/images/java-jcheckbox2.png)

---

[Top](#jcheckbox)
