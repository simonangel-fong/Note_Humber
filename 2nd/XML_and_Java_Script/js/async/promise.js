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

// delaySecond(2000)
//   .then((data) => Promise.all([xFunc(data), yFunc(data)]))
//   .then((data) => sum(data))
//   .then((data) => console.log(data));

const main = async (ms) => {
  const ms1 = await delaySecond(ms);
  const ms2 = await Promise.all([xFunc(ms1), yFunc(ms1)]);
  const sumAll = await sum(ms2);
  console.log(sumAll);
};

main(3000);
