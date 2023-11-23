# ML - Naive Baye

[Back](../index.md)

- [ML - Naive Baye](#ml---naive-baye)
  - [Random Experiment](#random-experiment)
  - [Naive Baye](#naive-baye)
  - [Implementation](#implementation)

---

## Random Experiment

- `Random Experiment`

  - An experiment whose outcome **cannot be predicted.**
  - e.g.: toss of a coin, roll of a die, drawing a card

- `Sample Space`

  - the set of all possible outcomes of a random experiment. 实验结果全集.
  - denoted by `S`

- `Sample point`

  - an element in S
  - Each outcome of a randome experiment corresponds to a sample point.

- Example: Sample space of rolling a die

  - `S = {1,2,3,4,5,6}`

- `Event`

  - any subset of sample sapce S

- `Probability` of an event
  - `P(event) = Number of sample points in an event / Number of sample points in an sample space`

---

## Naive Baye

- Decision Rule
  - if `P(class A/X)` > `P(class B/X)`, then class A

---

## Implementation

```py
from sklearn.naive_bayes import GaussianNB

# Build a Gaussian Classifier
model = GaussianNB()

# Model training
model.fit(X_train, y_train)

# Predict Output
predicted = model.predict([X_test[6]])
```

---

[TOP](#ml---naive-baye)
