import LatticePathOrdersKernel.LocalFourCycleClassifier

/-! # Four-cycles in the cyclic normal band and its integer cover -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

def normalTileVertexSet {n : Nat} (steps : ZMod n → Direction)
    (tile : BandTile n) : Finset (NormalBandVertex n) :=
  Finset.univ.image (normalTileCorner steps tile)

def normalFourVertexSet {n : Nat}
    (v₀ v₁ v₂ v₃ : NormalBandVertex n) :
    Finset (NormalBandVertex n) := {v₀, v₁, v₂, v₃}

def NormalSimpleFourCycle {n : Nat} (steps : ZMod n → Direction)
    (v₀ v₁ v₂ v₃ : NormalBandVertex n) : Prop :=
  v₀ ≠ v₁ ∧ v₀ ≠ v₂ ∧ v₀ ≠ v₃ ∧
  v₁ ≠ v₂ ∧ v₁ ≠ v₃ ∧ v₂ ≠ v₃ ∧
  NormalBandAdj steps v₀ v₁ ∧ NormalBandAdj steps v₁ v₂ ∧
  NormalBandAdj steps v₂ v₃ ∧ NormalBandAdj steps v₃ v₀

def IsNormalTileFourCycle {n : Nat} (steps : ZMod n → Direction)
    (v₀ v₁ v₂ v₃ : NormalBandVertex n) : Prop :=
  ∃ tile, normalFourVertexSet v₀ v₁ v₂ v₃ =
    normalTileVertexSet steps tile

def liftNormalDirections {n : Nat} (steps : ZMod n → Direction) :
    Int → Direction := fun i => steps (i : ZMod n)

def projectLocalBandVertex (n : Nat) (vertex : LocalBandVertex) :
    NormalBandVertex n := ((vertex.1 : ZMod n), vertex.2)

def projectLocalBandTile (n : Nat) : LocalBandTile → BandTile n
  | .vertex i => .vertex (i : ZMod n)
  | .midpoint i => .midpoint (i : ZMod n)

theorem project_localTileCorner
    {n : Nat} (steps : ZMod n → Direction)
    (tile : LocalBandTile) (corner : CornerIndex) :
    projectLocalBandVertex n
        (localTileCorner (liftNormalDirections steps) tile corner) =
      normalTileCorner steps (projectLocalBandTile n tile) corner := by
  cases tile with
  | vertex i => rfl
  | midpoint i =>
      cases hdir : steps (i : ZMod n) <;> fin_cases corner <;>
        simp [projectLocalBandVertex, localTileCorner, liftNormalDirections,
          normalTileCorner, normalizedBandPair, rawBandCornerPair,
          normalizeRawBandCorner, projectLocalBandTile, hdir]

theorem image_project_localTileVertexSet
    {n : Nat} (steps : ZMod n → Direction) (tile : LocalBandTile) :
    (localTileVertexSet (liftNormalDirections steps) tile).image
        (projectLocalBandVertex n) =
      normalTileVertexSet steps (projectLocalBandTile n tile) := by
  apply Finset.ext
  intro vertex
  constructor
  · intro hvertex
    rcases Finset.mem_image.mp hvertex with ⟨oldVertex, hold, rfl⟩
    rcases Finset.mem_image.mp hold with ⟨corner, _, rfl⟩
    exact Finset.mem_image.mpr
      ⟨corner, Finset.mem_univ _,
        (project_localTileCorner steps tile corner).symm⟩
  · intro hvertex
    rcases Finset.mem_image.mp hvertex with ⟨corner, _, rfl⟩
    apply Finset.mem_image.mpr
    exact ⟨localTileCorner (liftNormalDirections steps) tile corner,
      localTileCorner_mem _ _ _, project_localTileCorner steps tile corner⟩

theorem image_project_fourVertexSet
    {n : Nat} (v₀ v₁ v₂ v₃ : LocalBandVertex) :
    (fourVertexSet v₀ v₁ v₂ v₃).image (projectLocalBandVertex n) =
      normalFourVertexSet (projectLocalBandVertex n v₀)
        (projectLocalBandVertex n v₁) (projectLocalBandVertex n v₂)
        (projectLocalBandVertex n v₃) := by
  simp [fourVertexSet, normalFourVertexSet]

end LatticePathOrdersKernel
