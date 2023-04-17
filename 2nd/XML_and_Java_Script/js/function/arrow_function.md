# JS - Arrow Function

[Back](../../index.md)

- [JS - Arrow Function](#js---arrow-function)
  - [Arrow functions](#arrow-functions)
  - [High-Order Function](#high-order-function)
  - [Destructuring assignment](#destructuring-assignment)
    - [Unpack Array](#unpack-array)
    - [Unpack Object](#unpack-object)
  - [Strict equality (===)](#strict-equality-)

---

## Arrow functions

- uses an arrow => to separate the parameter(s) from the body.

```js
// array Funcion

// Arrow Function
// without parameter
const log = () => console.log("important function");
log(); //important function
console.log(log); //[Function: log]

// with parameter
const arrowFun = (a, b) => {
  return a * b;
};

console.log(arrowFun(3, 4)); //12

// Single parameter: do not require () around the parameter list.
const singleParamLog = (i) => console.log(i * i);

singleParamLog(3); //4

// retunn a single expression: without the return keyword
const singleReturn = (i) => i * i;
const singleParamReturn = (i) => i * i;

console.log(singleReturn(5)); //25
console.log(singleParamReturn(5)); //25
```

---

## High-Order Function

- High-Order Function: Function that excepts other functions as arguments

```js
// arg is a function that pass to hof function as a parameter
const hof = (arg) => {
  arg();
  return `I just invoked ${arg.name} as a callback function!`;
};
const argFunc = () => {
  console.log("I'm being invoked by the higher-order function!");
};
console.log(hof(argFunc));
// I'm being invoked by the higher-order function!
// I just invoked argFunc as a callback function!

console.log(
  //an anomynous function is passed as parameter
  hof(() => {
    for (let i = 0; i <= 10; i++) {
      console.log(i);
    }
  })
);
// 0
// 1
// 2
// 3
// 4
// 5
// 6
// 7
// 8
// 9
// 10
// I just invoked  as a callback function!
```

---

## Destructuring assignment

- The `destructuring assignment` syntax is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.

### Unpack Array

```js
// destructuring array
const arr = [1, 2, 3, 4];
const [a1, b1] = arr;
// console.log(a1); //1
// console.log(b1); //2

const [a2, b2, c2, d2, e2] = arr;
console.log(a2); //1
console.log(b2); //2
console.log(c2); //3
console.log(d2); //4
console.log(e2); //undefined

const [a3, b3, ...c3] = arr;
console.log(a3); //1
console.log(b3); //2
console.log(c3); //[ 3, 4 ]
```

### Unpack Object

```js
const obj01 = { b1: 2, a1: 1, c1: 3, d1: 4 };
const { a1, b1 } = obj01; //相当于a=obj.a
// console.log(a1); //1
// console.log(b1); //2

const obj02 = { b3: 2, a2: 1, c2: 3, d2: 4 };
const { a2, b2, c2, d2, e2 } = obj02;
console.log(a2); //1
console.log(b2); //2
console.log(c2); //3
console.log(d2); //4
console.log(e2); //undefined, 因为obj没有e2的属性

const obj03 = { b3: 2, a3: 1, c3: 3, d3: 4 };
const { a3, b3, ...c3 } = obj03;
console.log(a3); //1
console.log(b3); //2
console.log(c3); //{ c3: 3, d3: 4 }

const obj04 = { b4: 2, a4: 1, c4: 3, d4: 4 };
const { a4: x, b4: y } = obj04; //相当于x=obj04.a4
console.log(x); //1
console.log(y); //2
```

---

## Strict equality (===)

- The strict equality (`===`) operator checks whether its two operands are equal, returning a Boolean result.

  - Unlike the equality operator, the strict equality operator always considers operands of different **types** to be different.

- If the operands are of **different types**, return `false`.

- If both operands are **objects**, return true only if they **refer to the same object**.

- If both operands are `null` or both operands are `undefined`, return `true`.

- If either operand is `NaN`, return `false`.

- Otherwise, compare the two operand's values:

  - `Numbers` must have the **same numeric values.**
    - +0 and -0 are considered to be the same value.
  - `Strings` must have the **same characters** in the **same order**.
  - `Booleans` must be both true or both false.

- Same Type

```js
// Strict equality (===)

// same type
console.log("hello" === "hello"); // true
console.log("hello" === "hola"); // false

console.log(3 === 3); // true
console.log(3 === 4); // false

console.log(true === true); // true
console.log(true === false); // false

console.log(null === null); // true
console.log(undefined === undefined); // true

console.log(NaN === NaN); // false
```

- Difference Types

```sql

// differen type
console.log("3" == 3); //true
console.log("3" === 3); //false

console.log(0 == false); //true
console.log(0 === false); //false
console.log("0" == false); //true
console.log("0" === false); //false
console.log(1 == true); //true
console.log(1 === true); //false

const object1 = {
  key: "value",
};

const object2 = {
  key: "value",
};

const object3 = object1;

console.log(object1 == object1); // true
console.log(object1 === object1); // true

console.log(object1 == object2); // false
console.log(object1 === object2); // false

console.log(object1 == object3); // true
console.log(object1 === object3); // true
```

---

[TOP](#js---arrow-function)
