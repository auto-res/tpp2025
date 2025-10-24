# TPPmark16

## 3.1 Dependent-Type Programming Perspective

Construct a function `remove_lst` that receives the following arguments and returns the list obtained by removing the `j`-th element from the `i`-th sublist of `lst`.

1. A list of lists `lst`
2. An integer index `i`
3. An integer index `j`

Guarantee the following conditions (indices start at 0):

1. The `i`-th sublist of `lst` exists.
2. The `j`-th element of the `i`-th sublist exists.
3. In the result, only the `i`-th sublist becomes shorter by exactly one element; all other sublists keep their lengths.

## 3.2 Logical Perspective

Given `lst`, `i`, and `j`, show that if the `j`-th element of the `i`-th sublist can be accessed, then there exists a unique list that satisfies:

- The `i`-th sublist is obtained by removing its `j`-th element.
- Every other sublist is unchanged.
- Among the sublists of the result, only the `i`-th has length decreased by one; the lengths of the others are preserved.

Again, assume 0-based indices throughout.

## 3.3 OCaml Program

The file `remove.ml` contains an OCaml implementation of the dependent-type specification, but without safety checks. The program raises `CannotHappen` in two places. The goal is to constrain the arguments so that these exceptions are impossible and to prove that the output lists satisfy the prescribed length conditions.

Let `n` be the length of `lst`, and let `m0, ..., mn-1` be the lengths of the sublists. Restricting `i` to the range `0 .. n - 1` and `j` to `0 .. mi - 1` appears to rule out the exceptions, but note that the admissible range of `j` depends on `i`. The core of the task is to capture this dependency cleanly in types or in preconditions.

## 3.4 Background

In term unification we often substitute terms for meta-variables. For example, in the SK combinator expression `S X K (Y K Z) K`, substituting `S` for the meta-variable `Y` yields `S X K (S K Z) K`, reducing the meta-variable set from `[X, Y, Z]` to `[X, Z]`. This mirrors removing one element from the first sublist of `lst`.

The example discusses a single kind of term (“SK expressions”), but real-world developments may involve several mutually recursive term families. Suppose there are `n` such families and the `i`-th family currently has `mi` meta-variables. Substituting for the `j`-th meta-variable of family `i` removes exactly that entry from the collection.

The author is attempting to implement unification while tracking the number of meta-variables in this way, but once multiple, mutually recursive families are introduced, the design becomes unclear. Community input is sought.
