# Machine Learning - Overfitting and Underfitting

[Back](../index.md)

- [Machine Learning - Overfitting and Underfitting](#machine-learning---overfitting-and-underfitting)
  - [Overfitting and Underfitting](#overfitting-and-underfitting)
    - [Terminology](#terminology)
  - [Overfitting](#overfitting)
    - [Reason of Overfitting](#reason-of-overfitting)
    - [Method to avoid the Overfitting](#method-to-avoid-the-overfitting)
  - [Underfitting](#underfitting)
    - [Ways to avoid underfitting:](#ways-to-avoid-underfitting)
  - [Goodness of Fit](#goodness-of-fit)
    - [Way to get a `good point`](#way-to-get-a-good-point)

---

## Overfitting and Underfitting

- `Overfitting and Underfitting` are the two main **problems** that occur in machine learning and **degrade the performance** of the machine learning models.

- The main goal of each machine learning model is **to generalize well**.
  - Here **generalization** defines the **ability** of an ML model to **provide a suitable output** by adapting the given set of **unknown** input.
  - It means after providing training on the dataset, it can produce reliable and accurate output.

---

### Terminology

- `Underfitting`: 欠拟合

  - If our algorithm **does not perform well** even with `training dataset`.

- `Overfitting`: 过拟合

  - If our algorithm **works well with** the `training dataset` but **not well with test dataset**.
  - 在统计模型中，由于使用的参数过多而导致模型对观测数据（训练数据）过度拟合，以至于用该模型来预测其他测试样本输出的时候与实际输出或者期望值相差很大的现象

- `Signal`

  - **the true underlying pattern** of the data that **helps** the machine learning model **to learn** from the data.

- `Noise`:

  - unnecessary and **irrelevant data** that **reduces the performance** of the model.

- `Bias`:

  - a **prediction error** that is introduced in the model **due to oversimplifying** the machine learning **algorithms**.
  - Or it is the **difference** between the **predicted values** and the **actual values**.

- `Variance`:
  - If the machine learning model **performs well with the training dataset**, but does **not perform well with the test dataset**, then variance occurs

---

## Overfitting

- `Overfitting`

  - occurs when our machine learning model tries to **cover** all the data points or **more than the required data points** present in the given dataset.

    - Because of this, the model starts **caching noise** and **inaccurate values** present in the dataset, and all these factors **reduce the efficiency** and **accuracy** of the model.

  - the **main problem** that occurs in `supervised learning`.

- The overfitted model has `low bias` and `high variance`.

- The chances of occurrence of overfitting **increase as much we provide training to our model**.
  - It means the **more we train** our model, the **more chances** of occurring the overfitted model.

---

### Reason of Overfitting

- Large number of features in dataset and many of them are irrelevant.
- Model learns the noise of the data.
- The values of features are not statndardized.

---

### Method to avoid the Overfitting

- There are some ways by which we can reduce the occurrence of overfitting in our model.
  - Cross-Validation
  - Training with more data
  - Removing features
  - Early stopping the training
  - Regularization
  - Ensembling

---

## Underfitting

- `Underfitting`

  - occurs when our machine learning model is **not able to capture the underlying trend** of the data.
  - the model is **not able to learn enough** from the training data, and hence it **reduces the accuracy** and produces **unreliable predictions**.

- To avoid the overfitting in the model, the fed of training data can be **stopped at an early stage**, due to which the model may **not learn enough** from the training data.

  - As a result, it may **fail to find the best fit** of the dominant trend in the data.

- An underfitted model has `high bias` and `low variance`.

---

### Ways to avoid underfitting:

- By increasing the **training time** of the model.
- By increasing the **number of features**.

---

## Goodness of Fit

- `Goodness of fit`

  - defines how closely the result or predicted values **match the true values** of the dataset.

- The model with a `good fit` is **between** the `underfitted` and `overfitted` model, and ideally, it makes predictions with **0 errors**, but in practice, it is difficult to achieve it.

---

### Way to get a `good point`

- we can stop here for achieving a good model at the point just **before the raising of errors**

  - As when we train our model for a time, the `errors` in the `training data` **go down**, and the same happens with `test data`.
  - But if we train the model f**or a long duration**, then the **performance** of the model may **decrease** due to the `overfitting`, as the model also **learn the noise** present in the dataset.
  - The `errors` in the `test dataset` start **increasing**,

- Two other methods:
  - the `resampling` method to estimate model accuracy
  - `validation dataset`.

---

[TOP](#machine-learning---overfitting-and-underfitting)
