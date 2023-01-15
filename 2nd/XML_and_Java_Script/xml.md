## XML

[Back](./index.md)

- [XML](#xml)
  - [Definition 定义](#definition-定义)
  - [Structure 结构](#structure-结构)
  - [Prolog](#prolog)
  - [XML Declaration](#xml-declaration)
  - [Root Element](#root-element)
  - [Elements](#elements)

---

## Definition 定义

- `Extensible Markup Language (XML)` is a **markup language** that defines a set of rules for encoding documents in a format that is both humanreadable and machine-readable.

  - **A markup language** is a system for <u>annotating a document</u> in a way that is <u>syntactically distinguishable</u> from the text.标记语言：对文档进行注解，以区别与文本内容。

- `XML` **isn’t a language**; its rules are used to <u>construct other languages</u>

- `XML` is based on W3C Standard

  - **SGML**: The Standard Generalized Markup Language is a standard for defining generalized markup languages for documents(SGML; ISO 8879:1986). SGML is device-independent and system-independent.与设备或系统无关，独立的语言。
    - e.g.: HTML, XML, XHTML

- Difference:

|          | `XML`                                    | `HTML`                                       |
| -------- | ---------------------------------------- | -------------------------------------------- |
| **Goal** | carry data - with focus on what data is. | display data - with focus on how data looks. |
| **Tag**  | not predefined                           | predefined. e.g.: `<body>`, `<table>`        |

- Benefits/Goal of `XML`:
  - To make data more interchangeable, 数据交换性
  - To use formats readable by both humans and machines, 可读性
  - To relieve developers from having to write low-level code every time they needed to read or write data. 编程效率

---

## Structure 结构

- Each `XML` document is divided into two parts:
  - the **prolog**
  - the **document** or **root element**.

### Prolog

- The `prolog` appears at the top of the XML document and contains information about the document.

  - The `XML prolog` is optional. If it exists, it must come first in the document.第一行

- A prolog defines the XML version and the character encoding.
  e.g.: `<?xml version="1.0" encoding="UTF-8"?>`

- To avoid errors, you should specify the encoding used, or save your XML files as UTF-8.

  - `UTF-8` is the default character encoding for XML documents. 声明编码字符

- <font color="red">The prolog is not a part of the XML document.</font>

#### XML Declaration

- `XML Declaration` is one of the prolog.
  - The `prolog` of an XML document contains **meta information** about the document rather than document content.
  - The very **first line** of an XML file is the `XML declaration`. In general, the XML declaration is optional.

### Root Element

- XML documents must contain one `root element` that is **the parent of all other elements**.

- Any content within an XML document **must appear within** the document or `root element`.

### Elements

Elements are the backbone of an XML document.

- An `element` typically consists of a **start tag**, **character data**, and an **end
  tag**: 包括起始标签，结束标签，和两者中间的字符数据。
- e.g.: `<message>Welcome!</message>`

  - In this example, the **name** of the element is message.
  - The name of the element is the prominent feature of the markup that defines an element.

- XML element names have simple rules: 命名规则
  - The name must start with a letter or the underscore character (\_).以字母或下滑线开始
  - The end tag must contain exactly the same name as the start tag. This includes case; XML is case sensitive. 起止标签名称完全一致，包括大小写。
  - Names should not contain colons. Officially, they’re allowed, but as you’ll see when we get to namespaces later in the chapter, the colon has a special meaning and should not be used under other circumstances. 不包含冒号。
  - Names must not contain spaces. 不包括空格符。

---

[Top](#xml)
