# TPPmark17

This assignment concerns the longest common subsequence (LCS). Please send your solutions to the designated contact.

## Definitions

Subsequences do not need to be contiguous. A sequence of length `n` can have up to `2^n` subsequences. For example, the subsequences of `ABC` are `ε` (the empty sequence), `A`, `B`, `C`, `AB`, `BC`, `AC`, and `ABC`.

For two finite sequences `s` and `t`, a **common subsequence** is a sequence that is a subsequence of both `s` and `t`. A **longest common subsequence** is a common subsequence of maximum possible length. It need not be unique—`AB` and `BA`, for instance, are both longest common subsequences of `ABA` and `BAB`.

## Tasks

1. Define a function `LCS` that receives finite sequences `s` and `t` and returns one of their longest common subsequences. Represent sequences using any suitable data structure provided by your prover (e.g., lists) and fix an element type such as natural numbers if convenient.
2. Prove that `LCS s t` is indeed a common subsequence of both `s` and `t`. Define a predicate expressing “is a subsequence” if necessary.
3. Prove that `LCS s t` has maximal length: for every common subsequence `u` of `s` and `t`, the length of `u` is no greater than the length of `LCS s t`.

### Remarks

Dynamic programming is the standard algorithm for computing an LCS, but the task does not prescribe a particular implementation strategy. Brute force is acceptable, and you may prioritise the ease of formal proof.
