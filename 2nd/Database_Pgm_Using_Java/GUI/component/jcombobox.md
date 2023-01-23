## JComboBox

[Back](../java_swing.md)

[TOC]

---

## JComboBox class

- The object of Choice class is used to show popup menu of choices. Choice selected by user is shown on the top of a menu. It inherits JComponent class. 下拉菜单

- Use a combo box for a large set of choices. Use when radio buttons would take up too much space. It can be editable.

---

## Constructor

| Constructor                  | Description                                                             |
| ---------------------------- | ----------------------------------------------------------------------- |
| `JComboBox()`                | Creates a JComboBox with a default data model.                          |
| `JComboBox(Object[] items)`  | Creates a JComboBox that contains the elements in the specified array.  |
| `JComboBox(Vector<?> items)` | Creates a JComboBox that contains the elements in the specified Vector. |

---

## Methods

| Methods                            | Description                                                     |
| ---------------------------------- | --------------------------------------------------------------- |
| `void addItem(Object anObject)`    | It is used to add an item to the item list.                     |
| `void removeItem(Object anObject)` | It is used to delete an item to the item list.                  |
| `void removeAllItems()`            | It is used to remove all the items from the list.               |
| `void setEditable(boolean b)`      | It is used to determine whether the JComboBox is editable.      |
| `E getItemAt(int index)`           | Returns the list item at the specified index.                   |
| `int getSelectedIndex()`           | Returns the first item in the list that matches the given item. |
| `void setEditable(boolean aFlag)`  | Determines whether the JComboBox field is editable.             |

---

## Event Listener

| Methods                                    | Description                           |
| ------------------------------------------ | ------------------------------------- |
| `void addActionListener(ActionListener a)` | It is used to add the ActionListener. |
| `void addItemListener(ItemListener i)`     | It is used to add the ItemListener.   |

---

## Example

### Example: Create a ComboBox

```java

import java.awt.*;
import javax.swing.*;

public class DemoJComboBox {

    DemoJComboBox() {
        JFrame frame = new JFrame();
        String country[] = { "Canada", "US", "UK" };

        JComboBox cb = new JComboBox(country);
        frame.getContentPane().add(cb);

        frame.setLayout(new FlowLayout());

        frame.setDefaultCloseOperation(3);
        frame.setSize(300, 300);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        DemoJComboBox demo = new DemoJComboBox();
    }
}

```

---

### Example: Select Item

```java

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class DemoJComboBox02 {

    DemoJComboBox02() {
        JFrame frame = new JFrame("Demo - JComboBox02");

        JLabel label = new JLabel();
        label.setHorizontalAlignment(JLabel.CENTER);
        label.setSize(100, 200);

        JPanel plTop = new JPanel();
        plTop.add(label);

        String languages[] = { "C", "C++", "C#", "Java", "PHP" };
        JComboBox cb = new JComboBox(languages);
        JButton btn = new JButton("Show");

        JPanel plMain = new JPanel();
        plMain.add(cb);
        plMain.add(btn);

        frame.add(plTop, BorderLayout.NORTH);
        frame.add(plMain, BorderLayout.CENTER);

        frame.setDefaultCloseOperation(3);
        frame.setSize(300, 300);
        frame.setVisible(true);

        btn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String data = "Programming language Selected: "
                        + cb.getItemAt(cb.getSelectedIndex());
                label.setText(data);
            }
        });
    }

    public static void main(String[] args) {
        DemoJComboBox02 demo = new DemoJComboBox02();
    }
}

```

![output](https://static.javatpoint.com/java/swing/images/java-jcombobox2.png)

---

[TOP](#jcombobox)
