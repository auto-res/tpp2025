# TPPmark22 — ギャップ条件付き Higman の補題

TPP 2022 のテーマは数学定理の形式検証である。Mizar、Nuprl、Isabelle/HOL、Coq、Lean など多くの定理証明支援系には、Kruskal の定理や Higman の補題といった結果に関する大規模なライブラリや形式証明がすでに存在する。本課題では、これら既存の成果を活用しつつ、**ギャップ条件付き Higman の補題** の形式証明を構築し、証明を他系へ移植する可能性を探る。

## 目標

有限木ではなく有限語に対するギャップ条件付き Kruskal の定理、すなわちギャップ条件付き Higman の補題を任意の定理証明支援系で証明せよ。標準的な証明は `n` に関する帰納法であり、帰納ステップでは Higman の補題と最小悪列 (MBS: minimal bad sequence) を用いる（通常は Zorn の補題によって正当化する）。

利用可能な既存の形式化:

- Isabelle/HOL — Well quasi orders: https://www.isa-afp.org/entries/Well_Quasi_Orders.html
- Coq — Kruskal と Higman に関する開発  
  https://homepages.loria.fr/DLarchey/Kruskal/ , https://github.com/coq-contribs/higman
- Nuprl — Higman の補題の構成的証明 [2]
- ACL2 — Higman の補題の形式証明 [3]
- Lean — Kruskal の木の定理 [4]

## 定義

- **準同型順序 (WQO)。**  
  準順序 `(Q, ⪯)` が WQO であるとは、任意の無限列 `(a_i)_{i∈ℕ}` に対して `i < j` かつ `a_i ⪯ a_j` を満たす添え字対が存在することである。

- **ラベル付き木。**  
  `T(Q)` を、準順序 `(Q, ⪯)` からラベルを付与した有限根付き木の集合とする。

- **木の埋め込み (≤ₜ)。**  
  `T₁, T₂ ∈ T(Q)` について、全単射 `ψ : V(T₁) → V(T₂)` が祖先・子孫関係を保ち、任意の `t ∈ V(T₁)` で `ℓ(t) ⪯ ℓ(ψ(t))` が成り立つとき、`ψ` は木の埋め込みである。

- **ギャップ埋め込み (≤ᴳ)。**  
  木の埋め込みに加えて次を要求する。
  1. ラベル保存: 任意の `t` で `ℓ(t) = ℓ(ψ(t))`。
  2. ギャップ条件: `T₁` のノード `t` の子 `t′` に対し、`ψ(t)` と `ψ(t′)` を結ぶ `T₂` 上の経路にある全ノード `s` が `ℓ(s) ⪰ ℓ(t′)` を満たす。

## 既知の結果

- **Kruskal の定理。** `(Q, ⪯)` が WQO ならば `(T(Q), ≤ₜ)` も WQO である。
- **ギャップ条件付き Kruskal の定理。** `Q = {0, 1, …, n}` に対し、`(T(Q), ≤ᴳ)` は WQO である。

TPPmark の課題では、木ではなく有限語に特殊化したギャップ条件版を扱い、ギャップ条件付き Higman の補題を示す。

## 参考文献

1. S. G. Simpson, *Nonprovability of certain combinatorial properties of finite trees*, in **Harvey Friedman’s Research on the Foundations of Mathematics**, Studies in Logic 117, North-Holland.
2. C. R. Murthy, J. R. Russell, *A constructive proof of Higman’s lemma*, IEEE LICS 1990, pp. 257–267.
3. F. J. Martin-Mateos, J. L. Ruiz-Reina, J. A. Alonso, M. J. Hidalgo, *Proof pearl: A formal proof of Higman’s lemma in ACL2*, TPHOLs 2005, LNCS 3603.
4. M. Wu, *A formally verified proof of Kruskal’s tree theorem in Lean*, Master’s thesis, CMU, 2017.

追加リソース:  
- https://mizar.org  
- https://nuprl.org  
- https://math-comp.github.io/  
- https://leanprover.github.io/theorem_proving_in_lean/
