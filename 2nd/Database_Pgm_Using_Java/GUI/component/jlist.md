## JList

[Back](../java_swing.md)

[TOC]

---

## JList Class

- The object of `JList` class represents a list of text items. The list of text items can be set up so that the user can choose either one item or multiple items. It inherits JComponent class.It inherits JComponent class.

- API: https://docs.oracle.com/javase/8/docs/api/javax/swing/JList.html

---

## Constructors

| Constructor                       | Description                                                                 |
| --------------------------------- | --------------------------------------------------------------------------- |
| `JList()`                         | Creates a JList with an empty, read-only, model.                            |
| `JList(ary[] listData)`           | Creates a JList that displays the elements in the specified array.          |
| `JList(ListModel<ary> dataModel)` | Creates a JList that displays elements from the specified, non-null, model. |

---

## Methods

| Methods                                        | Description                                                                                                                                                                                                                                                                      |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `int getSelectedIndex()`                       | It is used to return the smallest selected cell index.                                                                                                                                                                                                                           |
| `E	getSelectedValue()`                          | Returns the value for the smallest selected cell index; the selected value when only a single item is selected in the list.                                                                                                                                                      |
| `ListModel getModel()`                         | It is used to return the data model that holds a list of items displayed by the JList component.                                                                                                                                                                                 |
| `void setListData(Object[] listData)`          | It is used to create a read-only ListModel from an array of objects.                                                                                                                                                                                                             |
| `void setVisibleRowCount(int visibleRowCount)` | Sets the visibleRowCount property, which has different meanings depending on the layout orientation: For a VERTICAL layout orientation, this sets the preferred number of rows to display without requiring scrolling; for other orientations, it affects the wrapping of cells. |
|`void	setFixedCellWidth(int width)`|Sets a fixed value to be used for the width of every cell in the list.|
|`void	setLayoutOrientation(int layoutOrientation)`|Defines the way list cells are layed out.|

---

## Event Listener

| Methods                                                         | Description                                                                                          |
| --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `Void addListSelectionListener(ListSelectionListener listener)` | It is used to add a listener to the list, to be notified each time a change to the selection occurs. |

---

## Example

### Example: Creates a List with scroll bar

```java

import java.awt.*;
import javax.swing.*;

public class DemoJList01 {

    DemoJList01() {
        JFrame frame = new JFrame();

        String[] str_list = { "A", "B", "C", "D", "E", "F", "G", "H", "I" };
        JList list = new JList();
        list.setListData(str_list);// Adds String[] to list
        list.setVisibleRowCount(5);// sets number of visible 设置可见行数
        list.setFixedCellWidth(100);// 设置固定宽度

        JScrollPane listScroller = new JScrollPane(list);// 创建一个可滚动的面板，当list中的元素大于设置的可见行数时，滚动条可见。

        frame.add(listScroller);

        frame.setDefaultCloseOperation(3);
        frame.setLayout(new FlowLayout());
        frame.setSize(300, 300);
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        DemoJList01 demo = new DemoJList01();
    }
}

```

---

### Example: Get select value

```java
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class DemoJList02 {

    DemoJList02() {
        JFrame frame = new JFrame("Demo - List");

        JLabel label = new JLabel();
        label.setSize(500, 100);
        frame.add(label, BorderLayout.NORTH);

        DefaultListModel<String> l1 = new DefaultListModel<>();
        l1.addElement("C");
        l1.addElement("C++");
        l1.addElement("Java");
        l1.addElement("PHP");

        JList<String> list = new JList<>(l1);
        JButton btn = new JButton("Show");

        JPanel pl = new JPanel();
        pl.add(list);
        pl.add(btn);

        frame.add(pl, BorderLayout.CENTER);

        frame.setSize(300, 300);
        frame.setLayout(new FlowLayout());
        frame.setDefaultCloseOperation(3);
        frame.setVisible(true);

        btn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (list.getSelectedIndex() != -1) {
                    String data = "Programming language Selected: " + list.getSelectedValue();
                    label.setText(data);
                }
            }
        });
    }

    public static void main(String[] args) {
        DemoJList02 demo = new DemoJList02();
    }
}
```

---

[TOP](#jlist)
