# TPPmark11/15 — Normal Forms for Propositional Logic

*(Original PDF header: “第11回TPP (Theorem Proving amd Provers) 研究集会 – TPPmark11”.)*

## Tasks

1. Define the set (type) of all propositional formulas.
2. Define what it means for two propositional formulas to be equivalent.
3. Define a function `nf` from formulas to formulas such that:
   - 3.1 For every propositional formula `P`, the formulas `P` and `nf(P)` are equivalent.
   - 3.2 If `P` and `Q` are equivalent, then `nf(P)` and `nf(Q)` are syntactically identical.
4. Prove Items 3.1 and 3.2.

## Rationale

Beyond delivering a proof, the exercise is meant to compare how participants set up the underlying ontology: how formulas and truth values are defined and which auxiliary functions are introduced. Although we broadly agree on what “normal form” should mean informally, there are many formalisation choices. The prover and its libraries may influence these choices. We therefore examine not only the formal proof, but also the manner in which the problem itself is formalised.

### Possible design decisions

- Should we assume infinitely many propositional variables, or fix a natural number `n`, provide exactly `n` variables, and parameterise the development by `n`?
- Should equivalence and the computation of `nf` be defined syntactically (via rewrite rules), or should we use semantic devices such as normalisation by evaluation?
- Should `nf` yield conjunctive normal form, disjunctive normal form, or some other notion of normal form?
