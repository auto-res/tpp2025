# TPPmark11

**Event:** 7th TPP (2011), AIST Tsukuba

## Problem

`N` children sit in a circle, each starting with an even number of candies. The following two actions occur on every step (and the process repeats indefinitely):

1. Every child passes half of their candies to the child on their left.
2. If a child finishes the step with an odd number of candies, the teacher gives that child one additional candy.

Prove that, after finitely many steps, every child holds the same number of candies.

## Proof Outline

Let `m(i, k)` denote the number of candies held by the `i`th child (for `i` in `{1, ..., N}`) after `k` steps. Establish these lemmas first:

1. `max(k + 1) <= max(k)`
2. `min(k) <= min(k + 1)`
3. If `min(k) < m(i, k)` then `min(k) < m(i, k + 1)`
4. If `m(i, k) < m(right(i), k)` then `m(i, k) < m(i, k + 1)`

with the abbreviations

```
max(k)  = max{ m(i, k) | i in {1, ..., N} }
min(k)  = min{ m(i, k) | i in {1, ..., N} }
right(i) = i + 1  if i < N, otherwise 1
```

Next, prove the key lemma:

5. If `min(k) < m(i, k)` for some `i`, then `num(min(k), k + 1) < num(min(k), k)`

where `num(m, k)` counts the children holding exactly `m` candies after `k` steps.

Combining Lemmas 1–5 shows that the minimum and maximum candy counts converge. It follows that all children eventually hold the same number of candies.

## Reference

- Bohman, T.; Pikhurko, O.; Frieze, A.; Sleator, D. *The Puzzle TOAD, Puzzle 6: Uniform Candy Distribution.* Carnegie Mellon School of Computer Science. Solution accessed 2011-10-13.

## Theorem-Prover Solutions

- Isabelle — YOSHINAO ISOBE (slides) (script)
- Coq — MITSUHARU YAMAMOTO (script)
- Coq — TAKAFUMI SAIKAWA (script)
- SSReflect — REYNALD AFFELDT (PDF) (script)
- Z3 — MASAHIRO SAKAI (script, UTF-8 encoding) (local copy)
- Coq — JACQUES GARRIGUE (script)
- Isabelle — YASUHIKO MINAMIDE (script)
