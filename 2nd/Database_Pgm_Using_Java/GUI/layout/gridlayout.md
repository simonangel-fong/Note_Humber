# Java GridLayout

[Back](../java_swing.md)

---

## GridLayout Class

- The `Java GridLayout` class is used to arrange the components **in a rectangular grid**. One component is displayed in each rectangle.

---

## Constructor

| Constructor                                             | Description                                                                                          |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `GridLayout()`                                          | creates a grid layout with one column per component in a row.                                        |
| `GridLayout(int rows, int columns)p)`                   | creates a grid layout with the given rows and columns but no gaps between the components.            |
| `GridLayout(int rows, int columns, int hgap, int vgap)` | creates a grid layout with the given rows and columns along with given horizontal and vertical gaps. |

---

## Method

---

## Exmaple

```java

import java.awt.*;
import javax.swing.*;

public class JGridLayout {

    public static void main(String[] args) {
        JFrame frame = new JFrame("GridLayoutDemo");

        JButton btn01 = new JButton("01");
        JButton btn02 = new JButton("02");
        JButton btn03 = new JButton("03");
        JButton btn04 = new JButton("04");
        JButton btn05 = new JButton("05");
        JButton btn06 = new JButton("06");
        JButton btn07 = new JButton("07");
        JButton btn08 = new JButton("08");
        JButton btn09 = new JButton("09");

        // setting the grid layout
        // a 3 * 3 grid is created with the horizontal gap 20 and vertical gap 25
        frame.setLayout(new GridLayout(3, 3, 20, 25));

        frame.add(btn01);
        frame.add(btn02);
        frame.add(btn03);
        frame.add(btn04);
        frame.add(btn05);
        frame.add(btn06);
        frame.add(btn07);
        frame.add(btn08);
        frame.add(btn09);

        frame.setSize(300, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

    }
}

```

![output](https://static.javatpoint.com/core/images/java-gridlayout3.png)

---

[TOP](#java-gridlayout)
