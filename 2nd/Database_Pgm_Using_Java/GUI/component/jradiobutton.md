## JRadioButton

[Back](../java_swing.md)

[TOC]

---

## JRadioButton Class

- The `JRadioButton` class is used to create a radio button. It is used to choose one option from multiple options. It is widely used in exam systems or quiz.

- API: https://docs.oracle.com/javase/8/docs/api/javax/swing/JRadioButton.html

---

## Constructors

| Constructor                                   | Description                                                                |
| --------------------------------------------- | -------------------------------------------------------------------------- |
| `JRadioButton()`                              | Creates an initially unselected radio button with no set text.             |
| `JRadioButton(Action a)`                      | Creates a radiobutton where properties are taken from the Action supplied. |
| `JRadioButton(String text)`                   | Creates an unselected radio button with the specified text.                |
| `JRadioButton(String text, boolean selected)` | Creates a radio button with the specified text and selection state.        |

---

## Useful Methods

- Methods

| Methods                                  | Description                                                                                                                            |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| `addActionListener(ActionListener l)`    | Adds an ActionListener to the button.                                                                                                  |
| `removeActionListener(ActionListener l)` | Removes an ActionListener from the button. If the listener is the currently set Action for the button, then the Action is set to null. |

---

## Exmaple: Creates a group of radio buttons

```java

import java.awt.*;
import javax.swing.*;

public class DemoJRadioButton01 {

    DemoJRadioButton01() {
        JFrame frame = new JFrame("Demo - JRadioButton");

        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));

        JRadioButton radioBtn01=new JRadioButton("A) Male");
        JRadioButton radioBtn02=new JRadioButton("B) Female");

        ButtonGroup btnGroup = new ButtonGroup(); // 使用ButtonGroup将radioButton作为一个组，实现单选的效果。
        btnGroup.add(radioBtn01);
        btnGroup.add(radioBtn02);

        mainPanel.add(radioBtn01);// 注意,不是添加group，而是添加components
        mainPanel.add(radioBtn02);

        frame.add(mainPanel, BorderLayout.EAST);
        frame.getContentPane().setLayout(new FlowLayout(FlowLayout.CENTER));

        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        DemoJRadioButton01 demo = new DemoJRadioButton01();
    }
}


```

![output](https://static.javatpoint.com/java/swing/images/java-jradiobutton1.png)

---

## Example: `.isSelected()`

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class DemoJRadioButton02 extends JFrame implements ActionListener {

    private JButton btnSubmit;

    private JRadioButton radioBtnMale;
    private JRadioButton radioBtnFemale;

    private JFrame frame;

    DemoJRadioButton02() {
        frame = new JFrame("Demo - RadioButton | Add Action");
        frame.setLayout(new FlowLayout(FlowLayout.CENTER));
        frame.setSize(300, 300);
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);

        radioBtnMale = new JRadioButton("A) Male");
        radioBtnFemale = new JRadioButton("B) Female");

        ButtonGroup btnGroup = new ButtonGroup();
        btnGroup.add(radioBtnMale);
        btnGroup.add(radioBtnFemale);

        btnSubmit = new JButton("Submit");
        btnSubmit.addActionListener(this);

        JPanel pl = new JPanel();
        pl.setLayout(new BoxLayout(pl, BoxLayout.Y_AXIS));
        pl.add(radioBtnMale);
        pl.add(radioBtnFemale);
        pl.add(btnSubmit);

        frame.add(pl);

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (radioBtnMale.isSelected()) {
            JOptionPane.showMessageDialog(this, "You are Male.");
        }

        if (radioBtnFemale.isSelected()) {
            JOptionPane.showMessageDialog(this, "You are Female.");
        }
    }

    public static void main(String[] args) {
        DemoJRadioButton02 demo = new DemoJRadioButton02();
    }
}

```

![output](https://static.javatpoint.com/java/swing/images/java-jradiobutton2.png)

---

[Top](#jradiobutton)
