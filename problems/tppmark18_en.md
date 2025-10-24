# TPPmark18

Let `l = [a0, a1, ..., a_{k-1}]` (length `k >= 1`) be a finite sequence of natural numbers. The sequence is **valid** when it satisfies:

> For all natural numbers `m` and `n`, if `m + a_m mod k = n + a_n mod k`, then `m = n`.

Examples: `[1, 1, 1]`, `[2, 0]`, `[1, 5, 3]`, and `[2, 0, 1, 9]` are valid, whereas `[1, 2, 1]`, `[3, 0]`, `[1, 3, 5]`, and `[2, 0, 1, 8]` are not.

## Tasks

1. Define a function `is_valid` that decides whether a given sequence is valid, and formally prove that the decision procedure is correct.
2. For a valid sequence `l`, define `Across(n) = { m | m <= n < m + a_m mod k }`. Prove that, for sufficiently large `n`, the sum of the elements of `l` equals the product of the cardinality of `Across(n)` and `k`.
