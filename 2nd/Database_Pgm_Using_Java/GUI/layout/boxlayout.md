# Java BoxLayout

[Back](../java_swing.md)

---

## BoxLayout Class

The `Java BoxLayout` class is used to arrange the components **either vertically or horizontally**. For this purpose, the BoxLayout class provides four constants.

---

## Field

- `public static final int X_AXIS`: Alignment of the components are **horizontal from left to right**.

- `public static final int Y_AXIS`: Alignment of the components are **vertical from top to bottom**.

- `public static final int LINE_AXIS`: Alignment of the components is similar to the way words are aligned in a line, which is based on the ComponentOrientation property of the container. If the ComponentOrientation property of the container is horizontal, then the components are aligned horizontally; otherwise, the components are aligned vertically. For horizontal orientations, we have two cases: left to right, and right to left. If the value ComponentOrientation property of the container is from left to right, then the components are rendered from left to right, and for right to left, the rendering of components is also from right to left. In the case of vertical orientations, the components are always rendered from top to bottom.

- `public static final int PAGE_AXIS`: Alignment of the components is similar to the way text lines are put on a page, which is based on the ComponentOrientation property of the container. If the ComponentOrientation property of the container is horizontal, then components are aligned vertically; otherwise, the components are aligned horizontally. For horizontal orientations, we have two cases: left to right, and right to left. If the value ComponentOrientation property of the container is also from left to right, then the components are rendered from left to right, and for right to left, the rendering of components is from right to left. In the case of vertical orientations, the components are always rendered from top to bottom.

---

## Constructor

| Constructor                        | Description                                                            |
| ---------------------------------- | ---------------------------------------------------------------------- |
| `BoxLayout(Container c, int axis)` | creates a box layout that arranges the components with the given axis. |

---

## Method

---

## Exmaple

```java

import javax.swing.*;

public class JBoxLayout {

    public static void main(String[] args) {

        JFrame frame = new JFrame("JBoxLayout Demo");

        for (int i = 0; i < 10; i++) {
            JButton btn = new JButton(Integer.toString(i + 1));
            frame.add(btn);
        }

        // 注意，container参数需要是pane，不能是frame，所以需要调用getContentPane
        frame.setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));
        frame.setSize(200, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

    }
}

```

![output](https://static.javatpoint.com/core/images/java-gridlayout3.png)

---

[TOP](#java-boxlayout)
