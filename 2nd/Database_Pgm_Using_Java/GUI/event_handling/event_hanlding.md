# Event Handling

[back](../java_swing.md)

[TOC]

---

## Event and Listener

- Changing the state of an object is known as an event.

  - For example, click on button, dragging mouse etc.

- The `java.awt.event` package provides many event classes and Listener interfaces for event handling.

- Package: `import java.awt.event.*;`

---

## Java Event classes and Listener interfaces

| Component                            | Register Method                        | Listener Interfaces | Orverridden Methos               |
| ------------------------------------ | -------------------------------------- | ------------------- | -------------------------------- | --- |
| [`JButton`](../component/jbutton.md) | `addActionListener(ActionListener al)` | `ActionListener`    | `actionPerformed(ActionEvent e)` |     |

---

## Steps to perform Event Handling

1. Creates Object implementing Event Listener Interfaces.
   - Inner Class
   - Anonymous Class
   - Outter Class
2. Builds Event Handling Code (Overridden Action Methods).
3. Adds Event Listener to component.

---

## Ways to build Event Handling Code

| #   | Way             | Description                                                                                            |
| --- | --------------- | ------------------------------------------------------------------------------------------------------ |
| 1   | Inner Class     | Creates Inner class to implement event handling interface, manageable **in the same file**.            |
| 2   | Anonymous Class | **Without object creation**, when the codes is simple                                                  |
| 3   | Outer Class     | Creates a separate class to implement event handling interface, good management but **multiple files** |

---

### Example：Inner Class

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/**
 * 这里使用extends的原因：
 * 因为要实现事件listener，就需要改写方法
 * 要改写方法，需要在方法体中调用component的对象。
 * 如果没有extends,则无法调用component的对象。
 */
public class DemoInnerClass extends JFrame {

    JButton btn;
    JLabel lb;

    DemoInnerClass() {
        btn = new JButton("Ok");
        Listener l = new Listener(); // Step 1: creates an Event Listener Object
        btn.addActionListener(l); // Step 3: registers Listener Object to component

        lb = new JLabel("Label");

        JPanel pl = new JPanel(new GridLayout(2, 1));
        pl.add(btn);
        pl.add(lb);

        add(pl);
        setLayout(new FlowLayout(FlowLayout.CENTER));

        setSize(200, 200);
        setDefaultCloseOperation(3);
        setVisible(true);
    }

    //An Inner class to implement event listener
    class Listener implements ActionListener {
        // Step 2: Overrides action method
        @Override
        public void actionPerformed(ActionEvent e) {
            lb.setText("OK");
        }
    }

    public static void main(String[] args) {
        DemoInnerClass demo = new DemoInnerClass();
    }
}

```

---

### Example：Anonymous Class

```java

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/**
 * 这里使用extends的原因：
 * 因为要实现事件listener，就需要改写方法
 * 要改写方法，需要在方法体中调用component的对象。
 * 如果没有extends,则无法调用component的对象。
 */
public class DemoAnonymousClass extends JFrame {

    JButton btn;
    JLabel lb;

    DemoAnonymousClass() {
        btn = new JButton("Ok");

        // Step 1: Add an Anonymous Class
        btn.addActionListener(new ActionListener() {

            // Step 2: Overrides action method
            @Override
            public void actionPerformed(ActionEvent e) {
                lb.setText("OK");
            }

        });

        lb = new JLabel("Label");

        JPanel pl = new JPanel(new GridLayout(2, 1));
        pl.add(btn);
        pl.add(lb);

        add(pl);
        setLayout(new FlowLayout(FlowLayout.CENTER));

        setSize(200, 200);
        setDefaultCloseOperation(3);
        setVisible(true);
    }

    public static void main(String[] args) {
        DemoInnerClass demo = new DemoInnerClass();
    }
}

```

---

### Example：Outer Class

- DemoOuterClass.java

```java

import java.awt.*;
import javax.swing.*;

/**
 * 这里使用extends的原因：
 * 1.可以将组件声明为属性，方便在listener中改写
 * 2.可以直接调用JFrame的方法
 */
public class DemoOuterClass extends JFrame {

    public JButton btn;
    public JLabel lb;// 必须声明为属性，才能在outer类中调用

    DemoOuterClass() {
        btn = new JButton("Ok");
        OuterListener l = new OuterListener(this); // Step 1: creates an Event Listener Object
        btn.addActionListener(l); // Step 3: registers Listener Object to component

        lb = new JLabel("Label");

        JPanel pl = new JPanel(new GridLayout(2, 1));
        pl.add(btn);
        pl.add(lb);

        add(pl);
        setLayout(new FlowLayout(FlowLayout.CENTER));

        setSize(200, 200);
        setDefaultCloseOperation(3);
        setVisible(true);
    }

    public static void main(String[] args) {
        DemoInnerClass demo = new DemoInnerClass();
    }
}
```

- OuterListener.java

```java
import java.awt.event.*;

//An Outer class to implement event listener
//好处：所有关于事件的设置都在该类中定义
public class OuterListener implements ActionListener {

    DemoOuterClass frame;// 需要监听的对象

    OuterListener(DemoOuterClass frame) {
        this.frame = frame;
    }

    // Step 2: Overrides action method
    @Override
    public void actionPerformed(ActionEvent e) {
        frame.lb.setText("OK");// 该处.lb是因为lb是DemoOuterClass类的属性
    }
}
```

---

[TOP](#event-handling)
