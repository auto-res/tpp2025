# TPPmark13

**Date:** August 17, 2013

This year’s challenge revisits Sam Loyd’s famous claim that the “14–15 puzzle” cannot be solved.

## Overview

The 15-puzzle (also known as the 15 game) uses a 4×4 board with tiles numbered 1 through 15 and one blank square. Players slide tiles into the blank to reach the goal configuration. Sam Loyd proposed a starting position obtained by swapping only tiles 14 and 15 and claimed that no sequence of legal moves restores the solved state.

Reference: the 15-puzzle entry on Wikipedia.

## Task

Formalize, in your preferred theorem prover, that the 14–15 puzzle instance is unsolvable.

### Notes

- The initial board is identical to the solved state except that tiles 14 and 15 are swapped.
- Model moves as compositions of transpositions on the set `{1, 2, ..., 16}` (with `16` denoting the blank). Provide this formalization before presenting the proof.

## Reference

- *15 パズルの数理* (Mathematics of the 15-Puzzle): <http://www.tcp-ip.or.jp/~n01/math/combinatorics/15puzzle/15puzzle.pdf>
