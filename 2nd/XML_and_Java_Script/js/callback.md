# JavaScript Asynchronous Function

[Back](../index.md)

- [JavaScript Asynchronous Function](#javascript-asynchronous-function)
  - [Asynchronous](#asynchronous)
  - [Callbacks Function](#callbacks-function)
  - [setTimeout(): 典型回调函数](#settimeout-典型回调函数)

---

## Asynchronous

- `asynchronous operation`: allows the computer to “move on” to other tasks while waiting for the asynchronous operation to complete.

- `Asynchronous programming`: time-consuming operations don’t have to bring everything else in our programs to a halt.

- `blocking`: the browser can appear to be frozen when a web app runs in a browser and it executes an intensive chunk of code without **returning control** to the browser.
  - the browser is blocked from continuing to handle user input and perform other tasks until the web app returns control of the processor

---

## Callbacks Function

- `Callback`: a way to handle asynchronous executing by **passing function as an argument** to the asynchronous function.

  - Standard contract: error-first, callback-last

  - `(callback) => callback(data)`
  - `(args, callback) => callback(err, data)`

- `Callback functions`: functions that are passed as a parameter to another function.

- 特征: 以回调函数为参数
- 效果: 回调函数将在本函数执行后执行.

- Example:

  ```js
  list = ["apple", "banana", "cherry"];

  const logEach = (arr, cb) => {
    for (var i = 0; i < arr.length; i++) {
      const element = arr[i];
      cb(element);
    }
  };

  //using a anonymous
  logEach(list, (data) => {
    console.log(data);
  });

  /*
  apple
  banana
  cherry
   */
  ```

---

## setTimeout(): 典型回调函数

- The `setTimeout()` sets a timer and <u>executes a callback function</u> **after** the timer expires.

- Syntax:

  - `setTimeout(call_back_function, milliseconds, [param])`

- Parameter:

  - `call_back_function`:
    - Function to be executed after a specific seconds
    - 需要是函数名称,或是匿名函数(function 或=>),不能直接是代码(console.log())
  - `milliseconds`: 1000 = 1 second
  - `param`: a list of parameter to be passed into the call back function

- Example:

  ```js
  // setTimeout()

  const cbFunc = (data) => {
    console.log(data);
  };

  // Error: callback function must be funtion(a named function or anonymous function), not codes
  // setTimeout(console.log("SetTimeout"), 1000);

  setTimeout(cbFunc, 1000, "SetTimeout"); // SetTimeout;

  setTimeout(cbFunc, 1000, "SetTimeout", "Hi"); // SetTimeout; "Hi" will not pass
  ```

  ```js
  const cbFunc = (data) => {
    console.log(data);
  };

  const main = (cb, str) => {
    setTimeout(cb, 1000, str);
  };

  main(cbFunc, "hello");
  ```

- **经典题型**

  ```js
  // Q: 执行顺序
  console.log("1");
  setTimeout(() => console.log("2"), 1000);
  console.log("3");

  /*
  1
  3
  2
  */

  // Q: 执行顺序
  console.log("1");
  setTimeout(() => console.log("2"), 0);
  console.log("3");

  // 注意: 即使是0秒,也会延后执行, 因为setTimeout是macroStack, 会take time
  /*
  1
  3
  2
  */
  ```

---

[TOP](#javascript-asynchronous-function)
