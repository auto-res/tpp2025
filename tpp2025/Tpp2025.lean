import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fin.Basic

open Fin

/-- 盤面（ランプ配置）。a i j k = 0/1（ZMod 2）で off/on を表す。 -/
def Board (n : ℕ) := Fin n → Fin n → Fin n → ZMod 2

namespace Board

variable {n : ℕ}

/-- 「線押し」解の形：a i j k = X (j,k) + Y (i,k) + Z (i,j)（mod 2） -/
structure XYZ (n : ℕ) where
  X : Fin n → Fin n → ZMod 2     -- X は (j,k) に依存
  Y : Fin n → Fin n → ZMod 2     -- Y は (i,k) に依存
  Z : Fin n → Fin n → ZMod 2     -- Z は (i,j) に依存

/-- 盤面 a が線押しで 0 配置（全 off）にできる、の定義。 -/
def Solvable (a : Board n) : Prop :=
  ∃ s : XYZ n, ∀ (i j k : Fin n), s.X j k + s.Y i k + s.Z i j = a i j k

/-
  「0 面基準 8 項恒等式」を hn : 0 < n を仮引数で受け取る（全称）形。
  定義内で zero : Fin n := ⟨0, hn⟩ を安全に使える。n=0 のときは vacuous。
-/
def parity2x2x2 (a : Board n) : Prop :=
  ∀ (hn : 0 < n) (i j k : Fin n),
    let zero : Fin n := ⟨0, hn⟩
    a i j k
      = a zero j k
      + a i zero k
      + a i j zero
      + a zero zero k
      + a zero j zero
      + a i zero zero
      + a zero zero zero

/-- 構成：本文の「Z=面、Y=列、X=行」定義に一致。 -/
def constructXYZ (a : Board n) (hn : 0 < n) : XYZ n :=
  let zero : Fin n := ⟨0, hn⟩
  { Z := fun i j => a i j zero
  , Y := fun i k => a i zero k + a i zero zero
  , X := fun j k => a zero j k + a zero zero k + a zero j zero + a zero zero zero }


/-- （十分性）parity2x2x2 a から構成した X,Y,Z が解になる。 -/
theorem constructive_solution
    (a : Board n)
    (hn : 0 < n)
    (hpar : parity2x2x2 a) :
    ∀ (i j k : Fin n),
      let s := constructXYZ a hn
      s.X j k + s.Y i k + s.Z i j = a i j k := by
  intro i j k
  have h8 := hpar hn i j k
  dsimp [constructXYZ]
  grind

/-- （必要性）線押しで解けるなら、8 項恒等式が成り立つ。 -/
theorem solvable_implies_parity
    (a : Board n) :
    Solvable a → parity2x2x2 a := by
  intro h
  rcases h with ⟨s, hs⟩
  -- ゴール：∀ hn i j k, 8項恒等式
  intro hn i j k
  grind

/-- （主定理）盤面 a が全 off にできることと parity2x2x2 は同値。 -/
theorem solvable_iff_parity2x2x2 (a : Board n) :
    Solvable a ↔ parity2x2x2 a := by
  constructor
  · exact solvable_implies_parity a
  · intro hpar
    by_cases hn : 0 < n
    · -- 0 < n：構成定理
      refine ⟨constructXYZ a hn, ?_⟩
      intro i j k
      simpa using constructive_solution a hn hpar i j k
    · -- n = 0：空の盤面
      have h0 : n = 0 := Nat.eq_zero_of_not_pos hn
      subst h0
      let s : XYZ 0 :=
        { X := fun _ _ => 0
        , Y := fun _ _ => 0
        , Z := fun _ _ => 0 }
      refine ⟨s, ?_⟩
      intro i j k
      exact Fin.elim0 i

/-- おまけ：8 項恒等式 ⇒ 隣接 2×2×2 ブロックの on 個数は偶数。 -/
theorem corner_implies_adjacentParity
    (a : Board n) (hpar : parity2x2x2 a) (hn : 0 < n) :
    ∀ (i : Fin (n-1)) (j : Fin (n-1)) (k : Fin (n-1)),
      -- まず (n - 1) + 1 = n を作り、すべての添字を Fin n に揃える
      let h_cast : (n - 1) + 1 = n := by grind
      let i0 := (i.castSucc).cast h_cast
      let i1 := (i.succ).cast     h_cast
      let j0 := (j.castSucc).cast h_cast
      let j1 := (j.succ).cast     h_cast
      let k0 := (k.castSucc).cast h_cast
      let k1 := (k.succ).cast     h_cast
      a i0 j0 k0 + a i1 j0 k0 + a i0 j1 k0 + a i1 j1 k0
    + a i0 j0 k1 + a i1 j0 k1 + a i0 j1 k1 + a i1 j1 k1 = 0 := by
  intro i j k
  -- n>1 かで分岐（n=1 なら Fin (n-1)=Fin 0）
  by_cases hgt1 : n > 1
  · -- n > 1：1 ≤ n を le_of_lt hgt1 から作る
    have one_le : 1 ≤ n := le_of_lt hgt1
    let h_cast : (n - 1) + 1 = n := Nat.sub_add_cancel one_le
    -- 省略名（すべて Fin n に統一）
    let i0 := (i.castSucc).cast h_cast
    let i1 := (i.succ).cast     h_cast
    let j0 := (j.castSucc).cast h_cast
    let j1 := (j.succ).cast     h_cast
    let k0 := (k.castSucc).cast h_cast
    let k1 := (k.succ).cast     h_cast
    -- 各項を 8 項恒等式で展開
    have h8₁ := hpar hn i0 j0 k0
    have h8₂ := hpar hn i1 j0 k0
    have h8₃ := hpar hn i0 j1 k0
    have h8₄ := hpar hn i1 j1 k0
    have h8₅ := hpar hn i0 j0 k1
    have h8₆ := hpar hn i1 j0 k1
    have h8₇ := hpar hn i0 j1 k1
    have h8₈ := hpar hn i1 j1 k1
    -- 左辺 8 項をまとめて置換
    grind
  · -- n ≤ 1：hn : 0 < n と合わせると n=1、ゆえに Fin (n-1) = Fin 0
    have hle1 : n ≤ 1 := le_of_not_gt hgt1
    have h_eq1 : n = 1 := Nat.le_antisymm hle1 (Nat.succ_le_of_lt hn)
    subst h_eq1
    -- 既に i j k : Fin 0 が冒頭で intro 済みなのでそのまま空
    exact Fin.elim0 i

end Board
