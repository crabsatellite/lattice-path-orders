import LatticePathOrdersKernel.TileMapCycleIso

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def tilePredecessor {n : Nat} : BandTile n → BandTile n
  | .midpoint i => .vertex (i - 1)
  | .vertex i => .midpoint i

@[simp] theorem tilePredecessor_successor
    {n : Nat} (tile : BandTile n) : tilePredecessor tile.successor = tile := by
  cases tile <;> simp [BandTile.successor, tilePredecessor] <;> ring

@[simp] theorem tileSuccessor_predecessor
    {n : Nat} (tile : BandTile n) : (tilePredecessor tile).successor = tile := by
  cases tile <;> simp [BandTile.successor, tilePredecessor] <;> ring

theorem BandTile.successor_injective {n : Nat} :
    Function.Injective (@BandTile.successor n) :=
  Function.LeftInverse.injective tilePredecessor_successor

theorem tilePredecessor_injective {n : Nat} :
    Function.Injective (@tilePredecessor n) :=
  Function.LeftInverse.injective tileSuccessor_predecessor

def tileForward {n : Nat} : Nat → BandTile n → BandTile n
  | 0, tile => tile
  | k + 1, tile => (tileForward k tile).successor

def tileBackward {n : Nat} : Nat → BandTile n → BandTile n
  | 0, tile => tile
  | k + 1, tile => tilePredecessor (tileBackward k tile)

@[simp] theorem tileForward_zero {n : Nat} (tile : BandTile n) :
    tileForward 0 tile = tile := rfl

@[simp] theorem tileForward_succ {n : Nat} (k : Nat) (tile : BandTile n) :
    tileForward (k + 1) tile = (tileForward k tile).successor := rfl

@[simp] theorem tileBackward_zero {n : Nat} (tile : BandTile n) :
    tileBackward 0 tile = tile := rfl

@[simp] theorem tileBackward_succ {n : Nat} (k : Nat) (tile : BandTile n) :
    tileBackward (k + 1) tile = tilePredecessor (tileBackward k tile) := rfl

theorem tileForward_two_ne
    {n : Nat} [Fact (1 < n)] (k : Nat) (tile : BandTile n) :
    tileForward (k + 2) tile ≠ tileForward k tile := by
  change (tileForward k tile).successor.successor ≠ tileForward k tile
  cases htile : tileForward k tile with
  | midpoint i =>
      simp [BandTile.successor]
  | vertex i =>
      simp [BandTile.successor]

theorem tileBackward_two_ne
    {n : Nat} [Fact (1 < n)] (k : Nat) (tile : BandTile n) :
    tileBackward (k + 2) tile ≠ tileBackward k tile := by
  change tilePredecessor (tilePredecessor (tileBackward k tile)) ≠ tileBackward k tile
  cases htile : tileBackward k tile with
  | midpoint i =>
      simp [tilePredecessor]
  | vertex i =>
      simp [tilePredecessor]

theorem tileCycleAdj_forward
    {n : Nat} (k : Nat) (tile : BandTile n) :
    TileCycleAdj (tileForward k tile) (tileForward (k + 1) tile) :=
  Or.inl rfl

theorem tileCycleAdj_backward
    {n : Nat} (k : Nat) (tile : BandTile n) :
    TileCycleAdj (tileBackward k tile) (tileBackward (k + 1) tile) :=
  Or.inr (tileSuccessor_predecessor _).symm

theorem cycleMap_forward
    {n : Nat} [Fact (1 < n)] (map : BandTile n ≃ BandTile n)
    (hadj : ∀ left right, TileCycleAdj (map left) (map right) ↔
      TileCycleAdj left right)
    (start : BandTile n)
    (horientation : map start.successor = (map start).successor) :
    ∀ k, map (tileForward k start) = tileForward k (map start) := by
  intro k
  induction k using Nat.twoStepInduction with
  | zero => rfl
  | one => exact horientation
  | more k ih₀ ih₁ =>
      have hcycle := (hadj _ _).mpr (tileCycleAdj_forward (k + 1) start)
      rcases hcycle with hforward | hback
      · calc
          map (tileForward (k + 2) start) =
              (map (tileForward (k + 1) start)).successor := hforward
          _ = (tileForward (k + 1) (map start)).successor :=
            congrArg BandTile.successor ih₁
          _ = tileForward (k + 2) (map start) := rfl
      · exfalso
        have hcurrent : map (tileForward (k + 1) start) =
            (map (tileForward k start)).successor := by
          exact ih₁.trans (congrArg BandTile.successor ih₀).symm
        have hcollision : map (tileForward (k + 2) start) =
            map (tileForward k start) := by
          apply BandTile.successor_injective
          exact hback.symm.trans hcurrent
        exact tileForward_two_ne k start (map.injective hcollision)

theorem cycleMap_backward
    {n : Nat} [Fact (1 < n)] (map : BandTile n ≃ BandTile n)
    (hadj : ∀ left right, TileCycleAdj (map left) (map right) ↔
      TileCycleAdj left right)
    (start : BandTile n)
    (horientation : map (tilePredecessor start) = tilePredecessor (map start)) :
    ∀ k, map (tileBackward k start) = tileBackward k (map start) := by
  intro k
  induction k using Nat.twoStepInduction with
  | zero => rfl
  | one => exact horientation
  | more k ih₀ ih₁ =>
      have hcycle := (hadj _ _).mpr (tileCycleAdj_backward (k + 1) start)
      rcases hcycle with hforward | hback
      · exfalso
        have hcurrent : map (tileBackward (k + 1) start) =
            tilePredecessor (map (tileBackward k start)) := by
          exact ih₁.trans (congrArg tilePredecessor ih₀).symm
        have hcollision : map (tileBackward (k + 2) start) =
            map (tileBackward k start) := by
          calc
            map (tileBackward (k + 2) start) =
                (map (tileBackward (k + 1) start)).successor := hforward
            _ = (tilePredecessor (map (tileBackward k start))).successor :=
              congrArg BandTile.successor hcurrent
            _ = map (tileBackward k start) := tileSuccessor_predecessor _
        exact tileBackward_two_ne k start (map.injective hcollision)
      · calc
          map (tileBackward (k + 2) start) =
              tilePredecessor (map (tileBackward (k + 1) start)) := by
            apply BandTile.successor_injective
            rw [tileSuccessor_predecessor]
            exact hback.symm
          _ = tilePredecessor (tileBackward (k + 1) (map start)) :=
            congrArg tilePredecessor ih₁
          _ = tileBackward (k + 2) (map start) := rfl

end LatticePathOrdersKernel
