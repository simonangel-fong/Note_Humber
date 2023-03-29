# JS Promise

[Back](../index.md)

- [JS Promise](#js-promise)
  - [Promise](#promise)
  - [Chaining](#chaining)
  - [Parallel Promises: all()](#parallel-promises-all)
  - [Mixed Promises](#mixed-promises)

## Promise

- `Promise`: objects that represent the eventual outcome of an asynchronous operation 代表最后的结果.

- **Promise object state**

  - `Pending`: The initial state-the operation has not completed yet.
  - `Fulfilled/Resolved`: The operation has **completed successfully**, and the promise now has a **resolved value**.
  - `Rejected`: The operation has **failed**, and the promise has a reason for the failure. This reason is usually an Error of some kind.

- **Syntax**

```js
// create a promise
let myPromise = new Promise((resolve, reject) => {
  // Promise code here
  //resolve(data);
  //reject(new Error());
});

// call a promise
myPromise.then(() => {}).catch(() => {});
```

- Example: 经典问题

```js
// Promise

const waitSecond = (ms) =>
  new Promise((resolve) => {
    setTimeout(resolve, ms);
  });

console.log("1");
waitSecond(100)
  .then(() => {
    console.log("2");
  })
  .then(() => {
    console.log("3");
  });
console.log("4");

/*
1
4
2
3
*/
```

- Example: 根据 then 延迟

```js
// Promise
const delaySecond = (sec) =>
  new Promise((resolve) => {
    console.log("delay second:", sec);
    setTimeout(resolve, sec, sec);
  });

delaySecond(1000)
  .then((data) => delaySecond(data))
  .then((data) => delaySecond(data))
  .then((data) => delaySecond(data));
```

---

## Chaining

- Separated control flow for success and fail.
- `.then()`: performs operations on a fulfilled promise object and returns a new value.
- `.catch()`: handles any anticipated promise rejections and throws an error.
- `.finally()`: executes without regard to whether the promise was fulfilled or rejected.

```js
//Chain
const delaySecond = (sec) =>
  new Promise((resolve) => {
    console.log("delay second:", sec);
    setTimeout(resolve, sec, sec);
  });

delaySecond(1000)
  .then((data) => delaySecond(data))
  .then((data) => delaySecond(data))
  .then((data) => delaySecond(data));

/*
delay second: 1000
delay second: 1000
delay second: 1000
delay second: 1000
*/
```

---

## Parallel Promises: all()

- `all()`: returns a new Promise that can be accessed as an **array of resolved values** of fulfulled Promises.
  - return: **an array of resolved values**.

```js
// all()
const xFunc = (x) => x / 100;
const yFunc = (y) => y / 1000;

const sum = (arr) =>
  new Promise((resolve) => {
    const s = arr.reduce((acc, item) => acc + item, 0);
    resolve(s);
  });

Promise.all([xFunc(3000), yFunc(3000)])
  .then((data) => sum(data))
  .then(console.log); //33
```

---

## Mixed Promises

```js
// mix;

const delaySecond = (sec) =>
  new Promise((resolve) => {
    console.log("delay second:", sec);
    setTimeout(resolve, sec, sec);
  });

const xFunc = (x) => x / 100;
const yFunc = (y) => y / 1000;

const sum = (arr) =>
  new Promise((resolve) => {
    const s = arr.reduce((acc, item) => acc + item, 0);
    resolve(s);
  });

delaySecond(2000)
  .then((data) => Promise.all([xFunc(data), yFunc(data)]))
  .then((data) => sum(data))
  .then((data) => console.log(data));

/*
  delay second: 2000
  22
  */
```

---

[TOP](#js-promise)
