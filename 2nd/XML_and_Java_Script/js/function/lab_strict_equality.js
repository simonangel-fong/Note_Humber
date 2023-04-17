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

// differen type
console.log("3" == 3)//true
console.log("3" === 3)//false

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
