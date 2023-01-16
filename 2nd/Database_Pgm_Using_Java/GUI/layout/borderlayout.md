# Java BorderLayout

[Back](../java_swing.md)

- [Java BorderLayout](#java-borderlayout)
  - [BorderLayout Class](#borderlayout-class)
  - [Constructor](#constructor)
  - [Method](#method)

---

## BorderLayout Class

- The `BorderLayout` is used to arrange the components in five regions: **north, south, east, west, and center**. Each region (area) may **contain one component only**. It is the default layout of a frame or window. The `BorderLayout` provides five constants for each region:

  - `public static final int NORTH`
  - `public static final int SOUTH`
  - `public static final int EAST`
  - `public static final int WEST`
  - `public static final int CENTER`

---

## Constructor

| Constructor                        | Description                                                                                 |
| ---------------------------------- | ------------------------------------------------------------------------------------------- |
| `BorderLayout()`                   | creates a border layout but with no gaps between the components.                            |
| `BorderLayout(int hgap, int vgap)` | creates a border layout with the given horizontal and vertical gaps between the components. |

---

## Method

---

## Exmaple

```java

import java.awt.*;
import javax.swing.*;

public class JBorderLayout {

    public static void main(String[] args) {

        JFrame frame = new JFrame("BorderLayout Demo");

        JButton btnNorth = new JButton("North");
        JButton btnSouth = new JButton("South");
        JButton btnWest = new JButton("West");
        JButton btnEast = new JButton("East");
        JButton btnCenter = new JButton("Center");

        frame.setLayout(new BorderLayout(20, 15));// Sets the layout before add components.If without this codes, there
                                                  // will be no gap between the button.

        frame.add(btnNorth, BorderLayout.NORTH);
        frame.add(btnSouth, BorderLayout.SOUTH);
        frame.add(btnWest, BorderLayout.WEST);
        frame.add(btnEast, BorderLayout.EAST);
        frame.add(btnCenter, BorderLayout.CENTER);

        frame.setSize(300, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

    }
}

```

![output](https://static.javatpoint.com/core/images/javaborderlayout2.png)

---


[TOP](#java-borderlayout)
