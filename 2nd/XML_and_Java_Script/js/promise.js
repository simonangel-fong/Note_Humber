const inventory = {
  sunglasses: 1900,
  pants: 1088,
  bags: 1344,
};

/**
 * myExecutor() should:

Have two parameters: resolve and reject
Check if the sunglasses property on the inventory object has a value greater than zero
If it does, myExecutor() should invoke resolve() with the string 'Sunglasses order processed.'
If it does not, myExecutor() should invoke reject() with the string 'That item is sold out.'
 * 
 */

const myExecutor = (resolve, reject) => {
  if (obj["sunglasses"] > 0) {
    resolve("Sunglasses order processed.");
  } else {
    reject("That item is sold out.");
  }
};

const myPromise = new Promise(myExecutor);

myPromise.then((data) => console.log(data));
