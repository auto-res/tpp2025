# TPPmark21

Consider a state-transition system defined on a hexagonal board subdivided into six triangular cells. Each edge on the boundary carries a port coloured either white or black. Panels consisting of four small triangles (with colours arranged differently on the vertex and edge sides) are placed into the board.

## Rules

- **Initial state:** the board is empty.
- **Transition:** pick an empty small triangle and place any panel there.
- **Termination:**  
  1. A path is formed that connects two non-adjacent boundary ports of the same colour.  
  2. The board is completely filled with no empty triangles remaining.

## Problem 1 — Formalisation

Give a formal description of this state-transition system.

## Problem 2 — Classification of Final States

Partition the terminating board configurations into the following three classes, count how many configurations fall into each class, and prove that your counts are correct.

1. Boards with no connecting path.
2. Boards with paths of exactly one colour (white-to-white or black-to-black, but not both).
3. Boards with both a white-to-white path and a black-to-black path.

## Problem 3 — Game-Theoretic Analysis

Interpret the system as a two-player game. White and black take turns placing panels. If the final state contains only a white path, White wins; if it contains only a black path, Black wins; otherwise the game is a draw.

Prove or refute the existence of a winning strategy in this game.
