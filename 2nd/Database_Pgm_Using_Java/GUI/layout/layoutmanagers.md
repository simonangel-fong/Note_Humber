## LayoutManagers

[Back](../java_swing.md)

- [LayoutManagers](#layoutmanagers)
  - [LayoutManagers Class](#layoutmanagers-class)

---

## LayoutManagers Class

- The `LayoutManagers` are used to <u>arrange components</u> in a particular manner. The Java `LayoutManagers` facilitates us to <u>control the positioning and size of the components in GUI forms</u>. LayoutManager is an interface that is implemented by all the classes of layout managers.

- There are the following classes that represent the layout managers:

  - java.awt.BorderLayout
  - java.awt.FlowLayout
  - java.awt.GridLayout
  - java.awt.CardLayout
  - java.awt.GridBagLayout
  - javax.swing.BoxLayout
  - javax.swing.GroupLayout
  - javax.swing.ScrollPaneLayout
  - javax.swing.SpringLayout etc.

---

## Guide

- Guide: https://docs.oracle.com/javase/tutorial/uiswing/layout/visual.html

| Layout Type  | Setting                                                         |
| ------------ | --------------------------------------------------------------- |
| BorderLayout | `frame.add(item, BorderLayout.CENTER);`                         |
| FlowLayout   | `frame.setLayout(new FlowLayout(FlowLayout.CENTER));`                  |
| BoxLayout    | `frame.setLayout(new BoxLayout (container, BoxLayout.Y_Axis));` |
| CardLayout   | `frame.setLayout(new CardLayout (int, int));`                    |

---

[TOP](#layoutmanagers)
