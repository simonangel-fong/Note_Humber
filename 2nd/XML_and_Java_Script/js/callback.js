// setTimeout()

const cbFunc = (data) => {
  console.log(data);
};

// Error: callback function must be funtion(a named function or anonymous function), not codes
// setTimeout(console.log("SetTimeout"), 1000);

setTimeout(cbFunc, 1000, "SetTimeout"); // SetTimeout;

setTimeout(cbFunc, 1000, "SetTimeout", "Hi"); // SetTimeout; "Hi" will not pass

// Call Back Function

const perSecond = (cb, str) => {
  setTimeout(cb, 1000, str);
};

perSecond(cbFunc, "perSecond");

list = ["apple", "banana", "cherry"];

const logEach = (arr, cb) => {
  for (var i = 0; i < arr.length; i++) {
    const element = arr[i];
    cb(element);
  }
};

logEach(list, (data) => {
  console.log(data);
});

/*
apple
banana
cherry
 */

// 经典题型

// Q: 执行顺序
// console.log("1");
// setTimeout(() => console.log("2"), 1000);
// console.log("3");

/*
1
3
2
*/

// Q: 执行顺序
// console.log("1");
// setTimeout(() => console.log("2"), 0);
// console.log("3");

// 注意: 即使是0秒,也会延后执行, 因为setTimeout是macroStack, 会take time
/*
1
3
2
*/
