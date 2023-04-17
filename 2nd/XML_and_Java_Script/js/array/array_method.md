# JS - Array methods

[Back](../../index.md)

- [JS - Array methods](#js---array-methods)
  - [Array methods](#array-methods)
    - [`.map()`](#map)
    - [`.filter()`](#filter)
    - [`.reduce()`](#reduce)
    - [Chaining](#chaining)

---

## Array methods

### `.map()`

- 按照原始数组元素顺序依次处理元素。
- Always returns a new array object
- Has one argument – callback function to run on each value of the array that **maps** <u>the value of original array</u> **into** <u>some value for the new returning array</u>

```js
const tenFold = (i) => i * 10;

const arr = [1, 2, 3, 4, 5];

const mapTest01 = arr.map((row) => tenFold(row));
const mapTest02 = arr.map((row) => {
  const double = row * 2;
  return tenFold(double);
});
console.log(mapTest01); //[ 10, 20, 30, 40, 50 ]
console.log(mapTest02); //[ 20, 40, 60, 80, 100 ]
```

- Example:提取一列数据

```js
const officers = [
  { id: 20, name: "Captain Piett" },
  { id: 24, name: "General Veers" },
  { id: 56, name: "Admiral Ozzel" },
  { id: 88, name: "Commander Jerjerrod" },
];

const officers_Ids = [];
officers.forEach((officer) => {
  officers_Ids.push(officer.id);
});

console.log(officers_Ids); //[ 20, 24, 56, 88 ]

const officersIds = officers.map((officer) => {
  return officer.id;
});
console.log(officersIds); //[ 20, 24, 56, 88 ]

const officersIdList = officers.map(({ id: idnumb }) => idnumb); //
console.log(officersIdList); //[ 20, 24, 56, 88 ]
```

---

### `.filter()`

- Always returns a new array object
- The callback function for the `.filter()` method should return true or false depending on the element that is passed to it.

- 创建一个新的数组，新数组中的元素是通过检查指定数组中符合条件的所有元素。
  - 注意： filter() 不会对空数组进行检测。
  - 注意： filter() 不会改变原始数组。

```js
const numbers = [1, 2, 3, 4, 5, 6];
const evenNumbers = numbers.filter((number) => {
  return number % 2 === 0;
});
console.log(evenNumbers); //[ 2, 4, 6 ]
```

- Example: 筛选行

```js
const pilots = [
  {
    id: 2,
    name: "Wedge Antilles",
    faction: "Rebels",
  },
  {
    id: 8,
    name: "Ciena Ree",
    faction: "Empire",
  },
  {
    id: 40,
    name: "Iden Versio",
    faction: "Empire",
  },
  {
    id: 66,
    name: "Thane Kyrell",
    faction: "Rebels",
  },
];

const empire = pilots.filter((pilot) => pilot.faction === "Empire");

console.log(empire);
// [
//   { id: 8, name: 'Ciena Ree', faction: 'Empire' },
//   { id: 40, name: 'Iden Versio', faction: 'Empire' }
// ]
```

---

### `.reduce()`

- The `.reduce()` method returns **a single value** after iterating through the elements of an array, thereby reducing the array.

```js
const numbers = [1, 2, 4, 10];

const summedNums = numbers.reduce((accumulator, currentValue) => {
  return accumulator + currentValue;
}); //initial value = NaN
console.log(summedNums); //17

const summedNums20 = numbers.reduce((accumulator, currentValue) => {
  return accumulator + currentValue;
}, 20); //initial value = 20
console.log(summedNums20); //17
```

- Example: 分列记录

```js
const pilots = [
  {
    id: 2,
    name: "Wedge Antilles",
    faction: "Rebels",
  },
  {
    id: 8,
    name: "Ciena Ree",
    faction: "Empire",
  },
  {
    id: 40,
    name: "Iden Versio",
    faction: "Empire",
  },
  {
    id: 66,
    name: "Thane Kyrell",
    faction: "Rebels",
  },
];

// 定义新对象
const { rebels, empire } = pilots.reduce(
  //因为目的是按条件分开行,所以只能使用reduce
  (accum, pilot) => {
    if (pilot.faction === "Rebels") {
      //如果faction是Rebel
      accum.rebels.push(pilot);
    } else if (pilot.faction === "Empire") {
      //如果faction是Empire
      accum.empire.push(pilot);
    }
    return accum; //返回累计到下一次迭代
  },
  { rebels: [], empire: [] } //初始值为对象, 对象的属性是空数组
);

console.log(rebels); //输出两个筛选的数组
// [
//   { id: 2, name: 'Wedge Antilles', faction: 'Rebels' },
//   { id: 66, name: 'Thane Kyrell', faction: 'Rebels' }
// ]
console.log(empire);
// [
//   { id: 8, name: 'Ciena Ree', faction: 'Empire' },
//   { id: 40, name: 'Iden Versio', faction: 'Empire' }
// ]
```

- Example: 累计

```js
const pilots = [
  {
    id: 10,
    name: "Poe Dameron",
    years: 14,
  },
  {
    id: 2,
    name: "Temmin 'Snap' Wexley",
    years: 30,
  },
  {
    id: 41,
    name: "Tallissan Lintra",
    years: 16,
  },
  {
    id: 99,
    name: "Ello Asty",
    years: 22,
  },
];

const totalYears = pilots.reduce((accum, pilot) => {
  return accum + pilot.years;
}, 0);

console.log(totalYears); //82
```

---

### Chaining

```js
const personnel = [
  {
    id: 5,
    name: "Luke Skywalker",
    pilotingScore: 98,
    shootingScore: 56,
    isForceUser: true,
  },
  {
    id: 82,
    name: "Sabine Wren",
    pilotingScore: 73,
    shootingScore: 99,
    isForceUser: false,
  },
  {
    id: 22,
    name: "Zeb Orellios",
    pilotingScore: 20,
    shootingScore: 59,
    isForceUser: false,
  },
  {
    id: 15,
    name: "Ezra Bridger",
    pilotingScore: 43,
    shootingScore: 67,
    isForceUser: true,
  },
  {
    id: 11,
    name: "Caleb Dume",
    pilotingScore: 71,
    shootingScore: 85,
    isForceUser: true,
  },
];

const totalJediScore = personnel
  .filter((person) => person.isForceUser)
  .map((jedi) => jedi.pilotingScore + jedi.shootingScore)
  .reduce((acc, score) => acc + score, 0);

console.log(totalJediScore); //420


const totalShootScore = personnel
  .filter(({ isForceUser: isUser }) => isUser)
  .map(({ shootingScore: shoot, pilotingScore: pilot }) => shoot + pilot)
  .reduce((acc, score) => acc + score, 0);

console.log(totalShootScore);//420

```

---

[TOP](#array-function)
