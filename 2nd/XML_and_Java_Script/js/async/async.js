// async
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

// mainChain(2000);

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

// mainAll(3000);

// mix;
const mainMix = async (ms) => {
  const sec = await delaySecond(ms);
  const arr = await Promise.all([xFunc(ms), yFunc(ms)]);
  const sumArr = await sum(arr);
  console.log(sumArr);
};

mainMix(2000);
