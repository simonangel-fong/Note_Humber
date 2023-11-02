# ML - Confusion Matrix

[Back](../index.md)

- [ML - Confusion Matrix](#ml---confusion-matrix)
  - [Confusion Matrix](#confusion-matrix)
  - [Accuracy](#accuracy)
  - [Precision](#precision)
  - [Recall](#recall)
  - [Recall vs Precision](#recall-vs-precision)
  - [F1 score](#f1-score)

---

## Confusion Matrix

|                 | Predicted Negative | Predicted Positive |
| --------------- | ------------------ | ------------------ |
| Actual Negative | TN                 | FP                 |
| Actual Positive | FN                 | TP                 |

- `N` / `P`: the predicted value
- `T` / `F`: the whether predicted value matches the actual value.

- `True positive`

  - an outcome where the model correctly predicts the positive class.

- `True negative`

  - an outcome where the model correctly predicts the negative class.

- `False positive`

  - an outcome where the model incorrectly predicts negative class as the **positive** class.
  - `Type 1 Error`

- `False negative`
  - an outcome where the model incorrectly predicts positive class as the **negative** class.
  - `Type 2 Error`

---

## Accuracy

- `Accuracy`

  - the most intuitive performance measure
  - a ratio of correctly predicted observation to the total observations.

- `Accuracy = TP + TN / TP + FP + FN + TN`

- Accuracy issue with biased dataset

  - cannot represent the performance of biased data.
  - Need further metric

- `Accuracy = 0`:

  - No Correct Predictions, Both positive and negative predictions are entirely incorrect.
  - Extreme Class Imbalance, where one class is much more prevalent than the other

- `Accuracy = 1`:
  - Perfect Predictions, no errors in the model's predictions
  - No False Positives or False Negatives, caused by imbalanced datasets.

---

## Precision

- `Precision`

  - the ratio of correctly predicted **positive** observations to the total predicted **positive** observations.
  - tells the ability to make **correct positive predictions**
  - **how well to predict positive cases**.

- `Precision = TP / TP + FP`

- Precision solve the issues of accuracy with biased data.

- `Precision = 0`:

  - completely fail to predict all positve cases.
  - inability to predict positve cases.

- `Precision = 1`:
  - classifies everthing to negative
  - there is no false positive case.
  - Perfect ability to predict positive case.

---

## Recall

- `Recall`

  - the ratio of correctly predicted positive observations to the all observations in actual class.
  - tells the ability to **correctly identify all** relevant instances from the **total actual positive** instances.

- `Recall = TP / TP + FN = Correct P Guess / Total actual P`

- `Recall = 0`

  - not effective at capturing positive cases,
  - fails to recognize instances of interest.

- `Recall = 1`
  - Perfect Positive Predictions
  - more lenient in predicting positive cases

---

## Recall vs Precision

- Inverse Relationship
  - As one metric increases, the other tends to decrease, and vice versa.

---

## F1 score

- `F1 Score`

  - a metric that combines precision and recall into a single value.
  - the harmonic mean of precision and recall and provides a **balance** between these two metrics

- `F1 score = 2 × (Precision+Recall) / Precision×Recall`

- `F1 score` ranges from `0` to `1`
  - values closer to 1 indicate a better overall performance of the model.
  - `1`:
    - the best possible score. It reaches its maximum value when precision and recall are both 1 (perfect precision and perfect recall)
    - No `False Positive` and `False Nagative`.
  - `0`:
    - minimum value when either precision or recall is 0.

---

[TOP](#ml---confusion-matrix)
