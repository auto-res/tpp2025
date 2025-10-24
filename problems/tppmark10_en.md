# TPPmark10

**Date:** October 29, 2010

We revisit tic-tac-toe and gomoku-style games on a one-dimensional board and investigate how defensive and offensive strategies change under different win conditions.

## 1. Linear Tic-Tac-Toe

The game is played on the integer line `Z`. Two players—an attacker and a defender—claim unoccupied integers in alternating turns. The attacker moves first. The attacker wins by claiming three consecutive integers, that is `x`, `x + 1`, and `x + 2` for some integer `x`. The defender succeeds by guaranteeing that the attacker never occupies such a triple.

- **Task 1.a:** Prove that the defender has a successful strategy.

## 2. Arithmetic Tic-Tac-Toe

This variant is also played on the integer line `Z`. Two players alternately claim unoccupied integers, with the attacker moving first. The attacker wins by claiming `n` integers that form an arithmetic progression, i.e. `x`, `x + d`, `x + 2d`, ..., `x + (n - 1)d` for some integer `x` and step size `d > 0`. The defender tries to prevent the attacker from ever collecting such a progression.

- **Task 2.a:** Show that the attacker can force a win for `n = 3` and `n = 4`, regardless of the defender’s play.
- **Task 2.b:** Extend the argument to `n = 5` (this is conjectured to hold).
- **Task 2.c:** For `n > 6`, determine which player has a successful strategy and justify your conclusion.

**Note:** For arithmetic tic-tac-toe, the integer line `Z` can be replaced by the rational line `Q` without changing the outcome for finite games.
