# Machine Learning - Numpy

[Back](./index.md)

- [Machine Learning - Numpy](#machine-learning---numpy)
  - [Create array](#create-array)
  - [Methods](#methods)
  - [Random Numbers](#random-numbers)
  - [Attribute](#attribute)

---

## Create array

```py
import numpy as np

arr_1d = np.array([0,1,2,3])    # one-dimensional (1D) array.
arr_2d =np.array([[1,2,3],[4,5,6],[7,8,9]])    # two-dimensional (2D) array.
```

---

## Methods

| Method       | Description                                                       |
| ------------ | ----------------------------------------------------------------- |
| `shape()`    | Return the shape of an array.                                     |
| `max()`      | Return the maximum of an array.                                   |
| `argmax()`   | Returns the indices of the maximum values.                        |
| `min()`      | Return the minimum of an array.                                   |
| `argmin()`   | Returns the indices of the minimum values.                        |
| `arange()`   | Return evenly spaced values within a given interval.              |
| `linspace()` | Return evenly spaced numbers over a specified interval.Inclusive  |
| `reshape()`  | Gives a new shape to an array without changing its data.          |
| `zeros()`    | Return a new array of given shape and type, filled with zeros.    |
| `ones()`     | Return a new array of given shape and type, filled with ones.     |
| `eye()`      | Return a 2-D array with ones on the diagonal and zeros elsewhere. |

---

## Random Numbers

| Method             | Description                                                                 |
| ------------------ | --------------------------------------------------------------------------- |
| `random.randn()`   | Return a sample (or samples) from the “standard normal” distribution.       |
| `random.rand()`    | Create an array of the given shape, from a uniform distribution over [0, 1) |
| `random.randint()` | Return random **integers** from low (inclusive) to high (exclusive).        |

---

## Attribute

| Method  | Description |
| ------- | ----------- |
| `dtype` | Return type |

---

[TOP](#machine-learning---numpy)
