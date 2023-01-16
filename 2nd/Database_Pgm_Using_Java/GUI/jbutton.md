## JButton

[Back](./java_swing.md)

[TOC]

---

## JButton class

- The `JButton class` is used to create a labeled button that has platform independent implementation. The application result in some `action` when the button is pushed. It inherits AbstractButton class.

- API: https://docs.oracle.com/javase/7/docs/api/javax/swing/JButton.html

---

## Constructors

| Constructor                       | Description                                                           |
| --------------------------------- | --------------------------------------------------------------------- |
| `JButton()`                       | Creates a button with no set text or icon.                            |
| `JButton(Action a)`               | Creates a button where properties are taken from the Action supplied. |
| `JButton(Icon icon)`              | Creates a button with an icon.                                        |
| `JButton(String text)`            | Creates a button with text.                                           |
| `JButton(String text, Icon icon)` | Creates a button with initial text and an icon.                       |

---

## Useful Methods

- Methods

| Methods                                               | Description                                                                             |
| ----------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `void setText(String s)`                              | It is used to set specified text on button                                              |
| `String getText()`                                    | It is used to return the text of the button.                                            |
| `void setEnabled(boolean b)`                          | It is used to enable or disable the button.                                             |
| `void setIcon(Icon b)`                                | It is used to set the specified Icon on the button.                                     |
| `Icon getIcon()`                                      | It is used to get the Icon of the button.                                               |
| `void addActionListener(ActionListener a)`            | It is used to add the action listener to this object.                                   |
| `void setBounds(int x, int y, int width, int height)` | Moves and resizes this component. It is used to add the action listener to this object. |

---

## Example 1

- A Frame without title
- sets frame and button size
- Contains a button with text

```java
import javax.swing.*;

public class Demo01 {

    public static void main(String[] args) {

        // Creates container and component objs
        JFrame frame = new JFrame("Button Example"); // creates a frame container with a title

        JButton btn = new JButton("Click Here"); // creates a button with a text
        btn.setBounds(50, 100, 95, 30); // Moves and resizes a button

        // Adds components to the Frame
        frame.add(btn); // adds the button obj to the frame

        // Set arttributes of the frame
        frame.setSize(400, 400); // sets the size of the frame
        frame.setLayout(null); // sets layout with null, default flowlayout will be applied.
        frame.setDefaultCloseOperation(3); // Uses constant as parameter.
        frame.setVisible(true);// sets frame obj visible
    }
}
```

![output](https://static.javatpoint.com/java/swing/images/java-jbutton1.png)

---

[Top](#jframe)
