# Formally Verified Implementation of the K-Nearest Neighbors Classification Algorithm
- [nhamid](https://cs.berry.edu/~nhamid/)

## Implementing Machine Learning Algorithms
- Gap between the mathematical model and mechanics of implementation
- Development of verified implementations of ML systems
- Focus: Classification
    - Does the program code for an ML algorithm faithfully implement the mathematical model/description?

### KNN (K-Nearest-Neighbors) Classification
- One of the oldest, well-known, widely used classification algorithms
- Mechanically verified implementation of **KNN Classification Algorithm** in the **Coq proof assistant**.
- Integrating AVL tree-based map, plurality algorithm, formal specification and verification

### Classifier Implementation
- Produces a labeltable
- Prior work: Verified KNN Search
- `build_kdtree (k:nat) (data:list datapt) : kdtree`
- Produce a list of the K nearest data points (based on a given distance metric) to the query point among all the points in the tree
- `knn_search (D:datapt ...)`
```coq
Check (knn_search_build_kdtree_correct 5 2 data_table
    (proj1 (Nat.ltb_lt 0 5) (refl_equal _))
    (proj1 (Nat.ltb_lt 0 (length data_table)) (refl_equal _))
    (proj1 (Nat.ltb_lt 0 2) (refl_equal _))
    valid_len
    data_tree
    query
    (knn_search 5 2 data_tree query)
    (refl_equal _)
    (refl_equal _)).
```
- [knn_search_build_kdtree_correct](https://github.com/nadeemabdulhamid/knn-search-coq)
- All things in the result are closer to the query

### Classify algorithm:
- `plurality`: If there are ties the function will return None, with the count of the most frequently occurring values
- There is a portion of the data that are the K nearest neighbors
- Algorithm says `None` $\iff$ There isn't a plurality value
- Supporting predicates
- User-defined tactics

