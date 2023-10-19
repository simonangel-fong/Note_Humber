# Machine Learning - Regression Analysis

[Back](../index.md)

- [Machine Learning - Regression Analysis](#machine-learning---regression-analysis)
  - [Regression Analysis in Machine learning](#regression-analysis-in-machine-learning)
  - [Terminologies Related to the Regression Analysis](#terminologies-related-to-the-regression-analysis)
  - [Benefit of Regression Analysis](#benefit-of-regression-analysis)
  - [Types of Regression](#types-of-regression)

---

## Regression Analysis in Machine learning

- `Regression analysis`

  - a statistical method to model the **relationship** between a **dependent (target) and independent (predictor) variables** with one or more **independent variables**.

  - a **supervised learning technique** which helps in **finding the correlation** between variables and enables us to **predict the continuous output variable** based on the one or more predictor variables.

    - It is mainly used for **prediction, forecasting, time series modeling**, and determining the **causal-effect relationship** between variables.

  - helps us to understand how **the value of the dependent variable is changing corresponding to an independent variable when other independent variables are held fixed.**

  - It predicts **continuous/real values**
    - such as temperature, age, salary, price, etc.

- **Plot**

  - In Regression, we **plot a graph** between the _variables_ which best fits the given datapoints. Using this **plot**, the machine learning model can **make predictions about the data**.
    - In simple words, "Regression shows a line or curve that passes through all the datapoints on target-predictor graph _in such a way that the **vertical distance** between the datapoints and the regression line is **minimum**_."
  - The **distance between datapoints and line** tells **whether a model has captured a strong relationship or not**.

---

## Terminologies Related to the Regression Analysis

- `Dependent Variable` / `target variable`

  - The main factor which we **want to predict or understand**.

- `Independent Variable` / `predictor`

  - The factors which **affect the dependent variables** or which are **used to predict** the values of the dependent variables.

- `Outliers`:

  - an observation which contains either very **low value** or very **high value** in **comparison** to other observed values.
  - An outlier may **hamper the result**, so it **should be avoided**.

- `Multicollinearity`: 多重共线性

  - If the `independent variables` are **highly correlated with each other** with other variables.
  - It should not be present in the dataset, because it creates problem while ranking the most affecting variable.

- `Underfitting`: 欠拟合

  - If our algorithm **does not perform well** even with `training dataset`.

- `Overfitting`: 过拟合

  - If our algorithm **works well with** the `training dataset` but **not well with test dataset**.
  - 在统计模型中，由于使用的参数过多而导致模型对观测数据（训练数据）过度拟合，以至于用该模型来预测其他测试样本输出的时候与实际输出或者期望值相差很大的现象

---

## Benefit of Regression Analysis

- Regression **estimates the relationship** between the _target_ and the _independent_ variable.
- It is used to **find the trends** in data.
- It helps to **predict real/continuous values**.
- we can confidently determine the **most** important factor, the **least** important factor, and **how each factor is affecting** the other factors.

---

## Types of Regression

- Each type has its own importance on **different scenarios**, but at the core, all the regression methods **analyze** **the effect of the independent variable on dependent variables**.
- Here we are discussing some important types of regression which are given below:
  - Linear Regression
  - Logistic Regression
  - Polynomial Regression
  - Support Vector Regression
  - Decision Tree Regression
  - Random Forest Regression
  - Ridge Regression
  - Lasso Regression:

---

[TOP](#machine-learning---regression-analysis)
