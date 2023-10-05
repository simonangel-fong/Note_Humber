# Unsupervised - DBSCAN

[Back](../index.md)

- [Unsupervised - DBSCAN](#unsupervised---dbscan)
  - [Density Based Spatial Clustering of Applications with Noise (DBSCAN)](#density-based-spatial-clustering-of-applications-with-noise-dbscan)
    - [Python Implementation](#python-implementation)

---

## Density Based Spatial Clustering of Applications with Noise (DBSCAN)

- `DBSCAN`

  - a **density-based clustering** approach grouping close points into clusters and classifying points in **low density regions as noise**.

- `density`:

  - a radius and minimum number of points

- **User specifies density** for a cluster to exist

- Parameters:

  - `ε`: distance extended from the point.
  - Minimum number of points in an distance.

- Within Cluster:

  - `Core point`:

    - the trial point whose number of neighbours is at least min-points.

  - `Border point`:
    - the point that in the `ε` distance of core point
    - does not have min-points neighbours.

- Outside cluster:

  - `Outliers` / `Noise`
    - the point that not as `Core` or `Border`

- 性质:
  - As `e` increases, `Outlier` descreases.
    - If `e` is very high, then only one single cluster.
  - As mininum number increases, `Outlier` increases.
    - When # == # of point, then each point is `Outlier`.

---

### Python Implementation

```py
from sklearn.cluster import DBSCAN, KMeans
kmeans = KMeans(n_clusters = 2, init = 'k-means++', n_init = 'auto')
dbscan = DBSCAN(eps=0.2)
y_kmeans = kmeans.fit_predict(Xm)
y_dbscan = dbscan.fit_predict(Xm)

# Visualize
fig,ax = plt.subplots(1,2,figsize=(18,6))

ax[0].scatter(Xm[y_kmeans == 0, 0], Xm[y_kmeans == 0, 1], s = 20, c = 'red', label = 'Cluster 1')
ax[0].scatter(Xm[y_kmeans == 1, 0], Xm[y_kmeans == 1, 1], s = 20, c = 'blue', label = 'Cluster 2')
ax[0].set_xlabel('X1', fontsize = 15)
ax[0].set_ylabel('X2', fontsize = 15)
ax[0].legend(fontsize = 15)
ax[0].set_title('KMeans Clustering', fontsize = 25)


sns.scatterplot(data = Xm, x = Xm[:,0], y = Xm[:,1], hue = y_dbscan, palette = 'Set1')
ax[1].set_xlabel('X1', fontsize = 15)
ax[1].set_ylabel('X2', fontsize = 15)
ax[1].legend(fontsize = 15)
ax[1].set_title('DBSCAN Clustering', fontsize = 25)
plt.show()
```

---

[TOP](#unsupervised---dbscan)
