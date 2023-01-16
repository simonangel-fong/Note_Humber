# Java CardLayout

[Back](../java_swing.md)

---

## CardLayout Class

- The `Java CardLayout` class manages the components in such a manner that **only one component is visible at a time**. It treats each component as a card that is why it is known as CardLayout.

---

## Constructor

| Constructor                      | Description                                                       |
| -------------------------------- | ----------------------------------------------------------------- |
| `CardLayout()`                   | creates a card layout with zero horizontal and vertical gap.      |
| `CardLayout(int hgap, int vgap)` | creates a card layout with the given horizontal and vertical gap. |

---

## Method

| Method                                            | Description                                                  |
| ------------------------------------------------- | ------------------------------------------------------------ |
| `public void next(Container parent)`              | is used to flip to the next card of the given container.     |
| `public void previous(Container parent)`          | is used to flip to the previous card of the given container. |
| `public void first(Container parent)`             | is used to flip to the first card of the given container.    |
| `public void last(Container parent)`              | is used to flip to the last card of the given container.     |
| `public void show(Container parent, String name)` | is used to flip to the specified card with the given name.   |

---

## Exmaple

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class DemoCardLayout extends JFrame implements ActionListener {

    CardLayout card;
    Container container;

    public DemoCardLayout() {
        this.setTitle("CardLayout Demo");

        container = getContentPane();
        card = new CardLayout(40, 30);

        container.setLayout(card);

        JButton btn01 = new JButton("Apple");
        btn01.addActionListener(this);
        JButton btn02 = new JButton("Facebook");
        btn02.addActionListener(this);
        JButton btn03 = new JButton("Google");
        btn03.addActionListener(this);

        container.add(btn01);
        container.add(btn02);
        container.add(btn03);
    }

    public void actionPerformed(ActionEvent e) {
        card.next(container);
    }

    public static void main(String[] args) {
        DemoCardLayout frame = new DemoCardLayout();
        frame.setDefaultCloseOperation(3);
        frame.setSize(400, 400);
        frame.setVisible(true);
    }
}

```

![output](https://static.javatpoint.com/core/images/java-cardlayout.png)

---

[TOP](#java-gridlayout)
