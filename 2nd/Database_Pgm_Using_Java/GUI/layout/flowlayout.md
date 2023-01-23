# Java FlowLayout

[Back](../java_swing.md)

---

## FlowLayout Class

- The `Java FlowLayout` class is used to arrange the components **in a line, one after another (in a flow)**.

- It is the `default` layout of the applet or panel.

---

## Fields

- Alignment 对齐

  - `public static final int LEFT`
  - `public static final int RIGHT`
  - `public static final int CENTER`
  - `public static final int LEADING`
  - `public static final int TRAILING`

---

## Constructor

| Constructor                                 | Description                                                                                      |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `FlowLayout()`                              | creates a flow layout with centered alignment and a default 5 unit horizontal and vertical gap.  |
| `FlowLayout(int align)`                     | creates a flow layout with the given alignment and a default 5 unit horizontal and vertical gap. |
| `FlowLayout(int align, int hgap, int vgap)` | creates a flow layout with the given alignment and the given horizontal and vertical gap.        |

---

## Exmaple

```java

import java.awt.*;
import javax.swing.*;

public class JFlowLayout {
    public static void main(String[] args) {

        JFrame frame = new JFrame("FlowLayout Demo");

        JButton btn01 = new JButton("01");
        JButton btn02 = new JButton("02");
        JButton btn03 = new JButton("03");
        JButton btn04 = new JButton("04");
        JButton btn05 = new JButton("05");
        JButton btn06 = new JButton("06");
        JButton btn07 = new JButton("07");
        JButton btn08 = new JButton("08");
        JButton btn09 = new JButton("09");
        JButton btn10 = new JButton("10");

        // frame.setLayout(new FlowLayout(FlowLayout.RIGHT));//defautl gap is 5 unit
        frame.setLayout(new FlowLayout(FlowLayout.RIGHT,
                20, 25));

        frame.add(btn01);
        frame.add(btn02);
        frame.add(btn03);
        frame.add(btn04);
        frame.add(btn05);
        frame.add(btn06);
        frame.add(btn07);
        frame.add(btn08);
        frame.add(btn09);
        frame.add(btn10);

        frame.setSize(300, 300);
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);

    }
}
```

![output](https://static.javatpoint.com/core/images/java-flowlayout.png)

---

[TOP](#java-flowlayout)
