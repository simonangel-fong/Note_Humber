# JS Async

[Back](../index.md)

- [JS Async](#js-async)
  - [async/await](#asyncawait)

## async/await

- a new syntax for using promises

- `async` – keyword to mark function as asynchronous. Such function will
  **return Promise**
- `await` – can be used **inside async functions only**. It is an operator that
  is used to wait for resolves value of a promise.
  所以使用 await 时, 其后的必须时 promise

- Problems of callbacks, Promise, async/await:

  - Nesting and syntax
  - Different contacts
  - Not cancellable, no timeouts
  - Complexity and Performance

- Example: Chain

```js
// chain
const delaySecond = (sec) =>
  new Promise((resolve) => {
    console.log("delay second:", sec);
    setTimeout(resolve, sec, sec);
  });

const mainChain = async (ms) => {
  const ms1 = await delaySecond(ms);
  const ms2 = await delaySecond(ms1);
  const ms3 = await delaySecond(ms2);
};
mainChain(2000);
```

- Example: All()

```js
// all()
const xFunc = (x) => x / 100;
const yFunc = (y) => y / 1000;

const sum = (arr) =>
  new Promise((resolve) => {
    const s = arr.reduce((acc, item) => acc + item, 0);
    resolve(s);
  });

const mainAll = async (ms) => {
  const arr = await Promise.all([xFunc(ms), yFunc(ms)]);
  const sumArr = await sum(arr);
  console.log(sumArr);
};

mainAll(3000);
```

- Example: mix

```js
// mix;
const mainMix = async (ms) => {
  const sec = await delaySecond(ms);
  const arr = await Promise.all([xFunc(ms), yFunc(ms)]);
  const sumArr = await sum(arr);
  console.log(sumArr);
};

mainMix(2000);
```

---

[TOP](#js-async)
