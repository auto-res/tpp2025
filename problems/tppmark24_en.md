# TPPmark24 — Sorting by Transpositions (Swaps)

This year’s theme: sort lists where the cost is the number of swaps, not comparisons. For example, to sort `[5, 9, 1, 3, 7]` into `[1, 3, 5, 7, 9]`, we can apply three swaps on positions counted from 1:

1. Swap positions 1 and 3.
2. Swap positions 2 and 4.
3. Swap positions 4 and 5.

Equivalently, we apply the permutation `{1 ↦ 3, 2 ↦ 5, 3 ↦ 1, 4 ↦ 2, 5 ↦ 4}`. Decomposing into cycles yields `(1 3)(2 5 4)`, and each cycle of length `m` requires `m - 1` swaps. Hence an optimal algorithm uses `(#elements − #cycles)` swaps.

## Tasks

1. Implement a function that converts a permutation into a minimal swap sequence realizing it.
2. Prove that the function is correct and produces a minimal sequence (develop the necessary theory of permutations).
3. Given a list of distinct natural numbers, implement a function that returns the minimal swap sequence to sort it; prove correctness and minimality.
4. Extend the function to lists with possible duplicates, again proving correctness and minimality.

Positions may be indexed from 0 if preferred.
