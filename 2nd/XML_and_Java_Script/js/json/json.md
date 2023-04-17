# JS JSON

[Back](../index.md)

- [JS JSON](#js-json)
  - [JSON](#json)
  - [Syntax](#syntax)
  - [Data Types](#data-types)
  - [`.parse()`: string to object](#parse-string-to-object)
  - [`.stringify()`: object to string](#stringify-object-to-string)
  - [JSON vs. XML](#json-vs-xml)

---

## JSON

- `JSON` or **JavaScript Object Notation** is a lightweight text-based open standard designed for human-readable data interchange.

  - It was designed for **human-readable** data interchange
  - It has been extended from the JavaScript scripting language

- The filename extension is `.json`, JSON **Internet Media type** is `application/json`

- **Usage of JSON**

  - It is used while writing **JavaScript based applications** that includes browser extensions and websites.
  - `JSON` format is used for **serializing and transmitting** structured data over network connection.
  - It is primarily used to transmit data between a server and web applications.
  - Web services and APIs use JSON format to provide public data.
  - It can be used with modern programming languages, which include C, C++, Python, Perl, etc.

## Syntax

- Data is represented in **name/value** pairs

```js
// Curly braces hold objects
{
  // Square brackets hold arrays
  "book": [
    {
      "id": "01",
      "language": "Java",
      "edition": "third",
      "author": "Herbert Schildt"
    },
    {
      "id": "07",
      "language": "C++",
      "edition": "second",
      "author": "E.Balagurusamy"
    }
  ]
}

// Creating JSON object using JS. Empty object
const data = {};
data.field1 = "value1";

// Creating JSON object using JS. new Object()
const data = new Object();
data.field1 = "value1";

// Creating JSON object using JS. With data
const data = { field1: "value1" };

```

---

## Data Types

| Type    | Description                                          |
| ------- | ---------------------------------------------------- |
| Number  | double-precision floating-point format in JavaScript |
| String  | **double-quoted** Unicode with backslash escaping    |
| Boolean | true or false                                        |
| Array   | an ordered sequence of values                        |
| Object  | an unordered collection of key:value pairs           |

---

## `.parse()`: string to object

- JS `eval` method parses JSON. When applied to JSON, `eval` returns the described object.

```js
// .parse() string to JSON
let text =
  '{ "employees" : [' +
  '{ "firstName":"John" , "lastName":"Doe" },' +
  '{ "firstName":"Anna" , "lastName":"Smith" },' +
  '{ "firstName":"Peter" , "lastName":"Jones" } ]}';

const obj = JSON.parse(text); //object

console.log(obj.employees[1].lastName); //Smith
```

---

## `.stringify()`: object to string

```js
// a JavaScript object...:
var myObj = { name: "John", age: 31, city: "New York" };

// ...converted into JSON:
var myJSON = JSON.stringify(myObj);

console.log(myObj); //{ name: 'John', age: 31, city: 'New York' }该处是对象
console.log(myJSON); //{"name":"John","age":31,"city":"New York"}该处是字符串
```

---

## JSON vs. XML

- `JSON` and `XML` are human readable formats and are language independent. They both have support for creation, reading and decoding in real world situations.
- `XML` is more verbose than `JSON`, so it is faster to write `JSON` for programmers.
- `XML` is used to describe the structured data, which **doesn't include arrays** whereas `JSON` **includes arrays**.

---

[TOP](#json)
