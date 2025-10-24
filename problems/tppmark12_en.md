# TPPmark12

**Date:** October 18, 2012

We revisit the Huffman tree construction from [1], an algorithm that produces an optimal binary prefix code for a finite source with known positive probabilities.

## Huffman Tree Construction

1. Let `L` be the list of leaf probabilities.
2. Take the two smallest probabilities in `L`, make their nodes siblings, create a parent node, and label the edges to the children with `0` and `1`.
3. Replace those two probabilities in `L` with their sum (the parent’s probability). If `L` now has a single element, stop; otherwise return to Step 2.

## Problem Statement

Assume that all source letters have strictly positive probabilities. A binary code tree satisfies the **sibling property** [1] if every non-root node has a sibling and the nodes can be listed in non-increasing order of probability so that each node appears adjacent to its sibling.

Show that:

1. Every Huffman tree satisfies the sibling property.
2. Every binary code tree with the sibling property is a Huffman tree.

## Hints

- You may work with positive integer weights instead of real probabilities:
  - Assign each leaf a positive integer that counts occurrences of its source letter (add labels if distinct leaves share the same count).
  - Give each internal node exactly two children and label it with the sum of its descendant leaf weights.
- Informal proofs of both directions are given in [1] (see Theorem 1).
- Formal developments already exist [2, 3]. The predicate `build` in [2] captures “being a Huffman tree,” but it requires the left child’s weight not to exceed the right child’s weight. If you adopt that convention, add the analogous restriction to the sibling-property definition when proving Item 2.

## References

- [1] Robert G. Gallager, “Variations on a Theme by Huffman,” IEEE Transactions on Information Theory, IT-24(6):668–674, 1978.
- [2] Laurent Thery, “Formalising Huffman’s Algorithm,” Technical Report TRCS 034, Department of Informatics, University of L’Aquila, 2004. Coq proof: http://coq.inria.fr/pylons/pylons/contribs/view/Huffman/v8.4
- [3] Jasmin Christian Blanchette, “Proof Pearl: Mechanizing the Textbook Proof of Huffman’s Algorithm,” Journal of Automated Reasoning, 43(1):1–18, 2009. Isabelle/HOL proof: http://afp.sourceforge.net/browser_info/current/HOL/Huffman/Huffman.html
