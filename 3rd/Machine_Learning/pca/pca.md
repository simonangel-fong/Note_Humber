# Machine Learning - PCA

[Back](../index.md)

- [Machine Learning - PCA](#machine-learning---pca)
  - [Principal Component Analysis](#principal-component-analysis)
  - [Benefit](#benefit)
  - [Implementing PCA](#implementing-pca)

---

## Principal Component Analysis

- `Principal Component Analysis` / `PCA`

  - a dimensionality reduction algorithm which reduces the demensions of the k-dimensional features into d-dimensional subspace (where d < k).

- PCA does not choose a subset of existing features but create new subset of feature that are weighted combination of original features.

---

## Benefit

- Cannot observe the key/leading/decisive features from large number of features.
- Make data analysis and visualization meaningful.
- Increase the speed of training and inference.
- Reduce the multicollineariry and redundancy from the dataset.
- Get a new set of features that describe the most variance in the dataset.

---

## Implementing PCA

1. Calculate the **covariance matrix** along the feature dimension.
2. Calculate the **eigen** values from **covariance matrix**.
3. Find d **largest eigen** values and corresponding **eigen vectors**.
4. **Project** original featueres onto new feature space using eigen vectors.

```py
# provided datasets
X
y

# Standarding the data
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
X_scaled

# PCA
from sklearn.decomposition import PCA
pca = PCA(n_components = 2)
X_pca = pca.fit_transform(X_scaled)
X_pca

# visualizing
plt.figure(figsize = (12,8))
plt.scatter(X_pca[:, 0], X_pca[:, 1], s = 100, c = 'm')
plt.xlabel('First principal component', fontsize = 15)
plt.ylabel('Second Principal Component', fontsize = 15)

# verify
print(np.sum(pca.explained_variance_ratio_))
```

---

[TOP](#machine-learning---pca)
