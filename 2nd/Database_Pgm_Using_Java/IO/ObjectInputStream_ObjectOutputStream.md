# ObjectInputStream/ObjectOutputStream

[Back](./file_io.md)

- [ObjectInputStream/ObjectOutputStream](#objectinputstreamobjectoutputstream)
  - [ObjectOutputStream](#objectoutputstream)
    - [Example: Write a binary file](#example-write-a-binary-file)
  - [ObjectInputStream](#objectinputstream)
    - [Example: Read a binary file](#example-read-a-binary-file)

---

## ObjectOutputStream

注意: 构造函数中的参数只能是 `inputstream` 的子类; 当要写入一个文件时,使用 `FileOutputStream` 作为参数.

### Example: Write a binary file

```java

import java.io.*;

public class ObjectOutputStreamDemo {

    public static void main(String[] args) {
        String path = "./text.bin";
        File file = new File(path);

        try {
            FileOutputStream fos = new FileOutputStream(file);
            ObjectOutputStream oos = new ObjectOutputStream(fos);

            Person person = new Person();
            person.setFirstName("Simon");
            person.setLastName("Fong");

            oos.writeObject(person);

            oos.close();
            fos.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

```

---

## ObjectInputStream

注意: 构造函数中的参数只能是 `inputstream` 的子类; 当要写入一个文件时,使用 `FileInputStream` 作为参数.

### Example: Read a binary file

```java


import java.io.*;

public class ObjectInputStreamDemo {

    public static void main(String[] args) {
        String path = "./text.bin";
        File file = new File(path);

        try {
            FileInputStream fis = new FileInputStream(file);
            ObjectInputStream ois = new ObjectInputStream(fis);

            Person person = (Person) ois.readObject();
            System.out.println(person.getFirstName());
            System.out.println(person.getLastName());
            ois.close();
            fis.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }
}


```

---

[TOP](#objectinputstreamobjectoutputstream)
