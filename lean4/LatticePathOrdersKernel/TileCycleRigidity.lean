import LatticePathOrdersKernel.TileDecorationInvariant

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem cycleMap_reversing
    {n : Nat} [Fact (1 < n)] (map : BandTile n ≃ BandTile n)
    (hadj : ∀ left right, TileCycleAdj (map left) (map right) ↔
      TileCycleAdj left right)
    (start : BandTile n)
    (horientation : map start.successor = tilePredecessor (map start)) :
    ∀ k, map (tileForward k start) = tileBackward k (map start) := by
  intro k
  induction k using Nat.twoStepInduction with
  | zero => rfl
  | one => exact horientation
  | more k ih₀ ih₁ =>
      have hcycle := (hadj _ _).mpr (tileCycleAdj_forward (k + 1) start)
      rcases hcycle with hforward | hback
      · exfalso
        have hcurrent : map (tileForward (k + 1) start) =
            tilePredecessor (map (tileForward k start)) := by
          exact ih₁.trans (congrArg tilePredecessor ih₀).symm
        have hcollision : map (tileForward (k + 2) start) =
            map (tileForward k start) := by
          calc
            map (tileForward (k + 2) start) =
                (map (tileForward (k + 1) start)).successor := hforward
            _ = (tilePredecessor (map (tileForward k start))).successor :=
              congrArg BandTile.successor hcurrent
            _ = map (tileForward k start) := tileSuccessor_predecessor _
        exact tileForward_two_ne k start (map.injective hcollision)
      · calc
          map (tileForward (k + 2) start) =
              tilePredecessor (map (tileForward (k + 1) start)) := by
            apply BandTile.successor_injective
            rw [tileSuccessor_predecessor]
            exact hback.symm
          _ = tilePredecessor (tileBackward (k + 1) (map start)) :=
            congrArg tilePredecessor ih₁
          _ = tileBackward (k + 2) (map start) := rfl

theorem tileForward_two_mul_vertex
    {n : Nat} (k : Nat) (i : ZMod n) :
    tileForward (2 * k) (.vertex i) = .vertex (i + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [Nat.mul_succ]
      change (tileForward (2 * k) (.vertex i)).successor.successor = _
      rw [ih]
      simp [BandTile.successor]
      ring

theorem tileForward_two_mul_midpoint
    {n : Nat} (k : Nat) (i : ZMod n) :
    tileForward (2 * k) (.midpoint i) = .midpoint (i + k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [Nat.mul_succ]
      change (tileForward (2 * k) (.midpoint i)).successor.successor = _
      rw [ih]
      simp [BandTile.successor]
      ring

theorem tileBackward_two_mul_vertex
    {n : Nat} (k : Nat) (i : ZMod n) :
    tileBackward (2 * k) (.vertex i) = .vertex (i - k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [Nat.mul_succ]
      change tilePredecessor (tilePredecessor
        (tileBackward (2 * k) (.vertex i))) = _
      rw [ih]
      simp [tilePredecessor]
      ring

theorem tileBackward_two_mul_midpoint
    {n : Nat} (k : Nat) (i : ZMod n) :
    tileBackward (2 * k) (.midpoint i) = .midpoint (i - k) := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [Nat.mul_succ]
      change tilePredecessor (tilePredecessor
        (tileBackward (2 * k) (.midpoint i))) = _
      rw [ih]
      simp [tilePredecessor]
      ring

end LatticePathOrdersKernel
