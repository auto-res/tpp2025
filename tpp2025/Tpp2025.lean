import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fin.Basic
import Mathlib.Tactic.Simps.Basic

open Fin

def PosNat := { n : Nat // n > 0 }

instance (n : Nat) : OfNat PosNat (n + 1) where
  ofNat := ⟨ n+1, Nat.succ_pos n ⟩

instance (n : PosNat) : NeZero n.val where
  out := Nat.ne_of_gt n.property

def Cube (n : PosNat) := Fin n.val → Fin n.val → Fin n.val → ZMod 2

namespace Cube

variable {n : PosNat}

structure XYZ (n : ℕ) where
  X : Fin n → Fin n → ZMod 2
  Y : Fin n → Fin n → ZMod 2
  Z : Fin n → Fin n → ZMod 2

@[grind]
def Solvable (a : Cube n) : Prop :=
  ∃ s : XYZ n.val, ∀ (i j k : Fin n.val), s.X j k + s.Y i k + s.Z i j = a i j k

@[grind]
def parity (a : Cube n) : Prop :=
  ∀ (i j k : Fin n.val),
    a i j k
      = a 0 j k
      + a i 0 k
      + a i j 0
      + a 0 0 k
      + a 0 j 0
      + a i 0 0
      + a 0 0 0

@[simps]
def constructXYZ (a : Cube n) : XYZ n.val :=
  { Z := fun i j => a i j 0
  , Y := fun i k => a i 0 k + a i 0 0
  , X := fun j k => a 0 j k + a 0 0 k + a 0 j 0 + a 0 0 0 }

@[grind]
theorem constructive_solution
    (a : Cube n)
    (hpar : parity a) :
    ∀ (i j k : Fin n.val),
      let s := constructXYZ a
      s.X j k + s.Y i k + s.Z i j = a i j k := by
  simp
  grind

@[grind]
theorem solvable_implies_parity (a : Cube n) :
  Solvable a → parity a := by
  grind

theorem solvable_iff_parity (a : Cube n) :
    Solvable a ↔ parity a := by
  constructor
  · grind
  · intro hpar
    refine ⟨constructXYZ a, ?_⟩
    grind

theorem corner_implies_adjacentParity
    (a : Cube n) (hpar : parity a) :
    ∀ (i0 i1 j0 j1 k0 k1 : Fin n.val),
      a i0 j0 k0 + a i1 j0 k0 + a i0 j1 k0 + a i1 j1 k0
    + a i0 j0 k1 + a i1 j0 k1 + a i0 j1 k1 + a i1 j1 k1 = 0 := by
  grind

theorem adjacentParity_implies_corner
    (a : Cube n)
    (hadj : ∀ (i0 i1 j0 j1 k0 k1 : Fin n.val),
      a i0 j0 k0 + a i1 j0 k0 + a i0 j1 k0 + a i1 j1 k0
    + a i0 j0 k1 + a i1 j0 k1 + a i0 j1 k1 + a i1 j1 k1 = 0) :
    parity a := by
  grind

end Cube
