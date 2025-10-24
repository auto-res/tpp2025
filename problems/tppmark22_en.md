# TPPmark22 — Higman’s Lemma with Gap Condition

TPP 2022 focuses on the formal verification of mathematical theorems. Many provers (Mizar, Nuprl, Isabelle/HOL, Coq, Lean, …) already contain large libraries and formal proofs of results such as Kruskal’s theorem or Higman’s lemma. The challenge is to reuse existing developments and outline how proofs can be shared across systems by constructing a formal proof of **Higman’s lemma with the gap condition**.

## Goal

Prove, in your favourite prover, the version of Kruskal’s theorem with the gap condition specialized to finite words (Higman’s lemma with gap condition). The usual proof proceeds by induction on `n`, with the inductive step relying on Higman’s lemma and the minimal bad sequence (MBS) argument (typically justified via Zorn’s lemma).

Useful existing formalizations:

- Isabelle/HOL — Well quasi orders: https://www.isa-afp.org/entries/Well_Quasi_Orders.html
- Coq — Kruskal and Higman developments:  
  https://homepages.loria.fr/DLarchey/Kruskal/ , https://github.com/coq-contribs/higman
- Nuprl — Constructive proof of Higman’s lemma [2]
- ACL2 — Formal proof of Higman’s lemma [3]
- Lean — Kruskal’s tree theorem [4]

## Definitions

- **Well-quasi-order (WQO).**  
  A quasi-order `(Q, ⪯)` is a WQO if every infinite sequence `(a_i)_{i∈ℕ}` contains indices `i < j` such that `a_i ⪯ a_j`.

- **Labeled trees.**  
  `T(Q)` denotes the set of finite rooted trees whose nodes carry labels from a quasi-order `(Q, ⪯)`.

- **Tree embedding (≤ₜ).**  
  For `T₁, T₂ ∈ T(Q)`, an injection `ψ : V(T₁) → V(T₂)` is a tree embedding if it preserves ancestor/descendant relations and satisfies `ℓ(t) ⪯ ℓ(ψ(t))` for every node `t` of `T₁`.

- **Gap embedding (≤ᴳ).**  
  Strengthen the tree embedding by additionally requiring:
  1. Label preservation: `ℓ(t) = ℓ(ψ(t))` for all `t`.
  2. Gap condition: along each branch between `ψ(t)` and `ψ(t′)` (for `t′` a child of `t` in `T₁`), every intermediate label `ℓ(s)` in `T₂` dominates `ℓ(t′)`.

## Known Results

- **Kruskal’s theorem.** If `(Q, ⪯)` is a WQO, then `(T(Q), ≤ₜ)` is a WQO.
- **Kruskal with gap condition.** For `Q = {0, 1, …, n}`, the structure `(T(Q), ≤ᴳ)` is a WQO.

The TPPmark challenge specializes the gap version to finite words instead of trees, yielding Higman’s lemma with gap condition.

## References

1. S. G. Simpson, *Nonprovability of certain combinatorial properties of finite trees*, in **Harvey Friedman’s Research on the Foundations of Mathematics**, Studies in Logic 117, North-Holland.
2. C. R. Murthy, J. R. Russell, *A constructive proof of Higman’s lemma*, IEEE LICS 1990, pp. 257–267.
3. F. J. Martin-Mateos, J. L. Ruiz-Reina, J. A. Alonso, M. J. Hidalgo, *Proof pearl: A formal proof of Higman’s lemma in ACL2*, TPHOLs 2005, LNCS 3603.
4. M. Wu, *A formally verified proof of Kruskal’s tree theorem in Lean*, Master’s thesis, CMU, 2017.

Additional resources:  
- https://mizar.org  
- https://nuprl.org  
- https://math-comp.github.io/  
- https://leanprover.github.io/theorem_proving_in_lean/
