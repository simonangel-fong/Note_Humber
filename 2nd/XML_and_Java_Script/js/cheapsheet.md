# Cheapsheet

[back](../index.md)

- [Cheapsheet](#cheapsheet)
  - [JSON](#json)
    - [`.parse()`: string to object](#parse-string-to-object)
    - [`.stringify()`: object to string](#stringify-object-to-string)

---

## JSON

### `.parse()`: string to object

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

### `.stringify()`: object to string

```js
// a JavaScript object...:
var myObj = { name: "John", age: 31, city: "New York" };

// ...converted into JSON:
var myJSON = JSON.stringify(myObj);

console.log(myObj); //{ name: 'John', age: 31, city: 'New York' }该处是对象
console.log(myJSON); //{"name":"John","age":31,"city":"New York"}该处是字符串
```

---

---

[TOP](#cheapsheet)
