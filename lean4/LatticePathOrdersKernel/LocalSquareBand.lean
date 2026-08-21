import LatticePathOrdersKernel.NormalBandAdjacency

/-! # The integer universal cover of a square band -/

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

abbrev LocalBandVertex := Int × CornerIndex

def LocalBandAdj (directions : Int → Direction)
    (left right : LocalBandVertex) : Prop :=
  (left.1 = right.1 ∧ CornerCycleAdj left.2 right.2) ∨
  ∃ i endpoint,
    (left = (i - 1, bridgePreviousCorner (directions i) endpoint) ∧
      right = (i, bridgeNextCorner (directions i) endpoint)) ∨
    (right = (i - 1, bridgePreviousCorner (directions i) endpoint) ∧
      left = (i, bridgeNextCorner (directions i) endpoint))

inductive LocalBandTile where
  | vertex (i : Int)
  | midpoint (i : Int)
deriving DecidableEq

def localTileCorner (directions : Int → Direction) :
    LocalBandTile → CornerIndex → LocalBandVertex
  | .vertex i, corner => (i, corner)
  | .midpoint i, corner =>
      match directions i with
      | .right =>
          if corner = cornerZero then (i - 1, cornerOne)
          else if corner = cornerOne then (i, cornerZero)
          else if corner = cornerTwo then (i, cornerThree)
          else (i - 1, cornerTwo)
      | .up =>
          if corner = cornerZero then (i - 1, cornerThree)
          else if corner = cornerOne then (i - 1, cornerTwo)
          else if corner = cornerTwo then (i, cornerOne)
          else (i, cornerZero)

def localTileVertexSet (directions : Int → Direction)
    (tile : LocalBandTile) : Finset LocalBandVertex :=
  Finset.univ.image (localTileCorner directions tile)

theorem localTileCorner_mem (directions : Int → Direction)
    (tile : LocalBandTile) (corner : CornerIndex) :
    localTileCorner directions tile corner ∈
      localTileVertexSet directions tile := by
  exact Finset.mem_image.mpr ⟨corner, Finset.mem_univ _, rfl⟩

def fourVertexSet (v₀ v₁ v₂ v₃ : LocalBandVertex) :
    Finset LocalBandVertex := {v₀, v₁, v₂, v₃}

def LocalSimpleFourCycle (directions : Int → Direction)
    (v₀ v₁ v₂ v₃ : LocalBandVertex) : Prop :=
  v₀ ≠ v₁ ∧ v₀ ≠ v₂ ∧ v₀ ≠ v₃ ∧
  v₁ ≠ v₂ ∧ v₁ ≠ v₃ ∧ v₂ ≠ v₃ ∧
  LocalBandAdj directions v₀ v₁ ∧
  LocalBandAdj directions v₁ v₂ ∧
  LocalBandAdj directions v₂ v₃ ∧
  LocalBandAdj directions v₃ v₀

def IsLocalTileFourCycle (directions : Int → Direction)
    (v₀ v₁ v₂ v₃ : LocalBandVertex) : Prop :=
  ∃ tile, fourVertexSet v₀ v₁ v₂ v₃ =
    localTileVertexSet directions tile

theorem localTileCorner_injective (directions : Int → Direction)
    (tile : LocalBandTile) : Function.Injective (localTileCorner directions tile) := by
  intro left right h
  cases tile with
  | vertex i => exact congrArg Prod.snd h
  | midpoint i =>
      cases hdir : directions i <;> fin_cases left <;> fin_cases right <;>
        simp [localTileCorner, hdir] at h ⊢ <;> omega

theorem localTileVertexSet_card (directions : Int → Direction)
    (tile : LocalBandTile) : (localTileVertexSet directions tile).card = 4 := by
  rw [localTileVertexSet, Finset.card_image_of_injective _
    (localTileCorner_injective directions tile)]
  simp

theorem fourVertexSet_card_of_distinct
    {v₀ v₁ v₂ v₃ : LocalBandVertex}
    (h₀₁ : v₀ ≠ v₁) (h₀₂ : v₀ ≠ v₂) (h₀₃ : v₀ ≠ v₃)
    (h₁₂ : v₁ ≠ v₂) (h₁₃ : v₁ ≠ v₃) (h₂₃ : v₂ ≠ v₃) :
    (fourVertexSet v₀ v₁ v₂ v₃).card = 4 := by
  simp [fourVertexSet, h₀₁, h₀₂, h₀₃, h₁₂, h₁₃, h₂₃,
    Ne.symm h₀₁, Ne.symm h₀₂, Ne.symm h₀₃,
    Ne.symm h₁₂, Ne.symm h₁₃, Ne.symm h₂₃]

theorem isLocalTileFourCycle_of_mem
    (directions : Int → Direction) (tile : LocalBandTile)
    {v₀ v₁ v₂ v₃ : LocalBandVertex}
    (h₀₁ : v₀ ≠ v₁) (h₀₂ : v₀ ≠ v₂) (h₀₃ : v₀ ≠ v₃)
    (h₁₂ : v₁ ≠ v₂) (h₁₃ : v₁ ≠ v₃) (h₂₃ : v₂ ≠ v₃)
    (h₀ : v₀ ∈ localTileVertexSet directions tile)
    (h₁ : v₁ ∈ localTileVertexSet directions tile)
    (h₂ : v₂ ∈ localTileVertexSet directions tile)
    (h₃ : v₃ ∈ localTileVertexSet directions tile) :
    IsLocalTileFourCycle directions v₀ v₁ v₂ v₃ := by
  refine ⟨tile, Finset.eq_of_subset_of_card_le ?_ ?_⟩
  · intro vertex hvertex
    simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton] at hvertex
    rcases hvertex with rfl | rfl | rfl | rfl
    · exact h₀
    · exact h₁
    · exact h₂
    · exact h₃
  · rw [localTileVertexSet_card,
      fourVertexSet_card_of_distinct h₀₁ h₀₂ h₀₃ h₁₂ h₁₃ h₂₃]

theorem localTile_is_four_cycle (directions : Int → Direction)
    (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerZero)
      (localTileCorner directions tile cornerOne)
      (localTileCorner directions tile cornerTwo)
      (localTileCorner directions tile cornerThree) := by
  have hinjective := localTileCorner_injective directions tile
  have hne {left right : CornerIndex} (h : left ≠ right) :
      localTileCorner directions tile left ≠
        localTileCorner directions tile right :=
    fun heq => h (hinjective heq)
  exact isLocalTileFourCycle_of_mem directions tile
    (hne (by decide)) (hne (by decide)) (hne (by decide))
    (hne (by decide)) (hne (by decide)) (hne (by decide))
    (localTileCorner_mem directions tile cornerZero)
    (localTileCorner_mem directions tile cornerOne)
    (localTileCorner_mem directions tile cornerTwo)
    (localTileCorner_mem directions tile cornerThree)

theorem local_vertex_is_four_cycle (directions : Int → Direction) (i : Int) :
    IsLocalTileFourCycle directions (i, cornerZero) (i, cornerOne)
      (i, cornerTwo) (i, cornerThree) := by
  exact localTile_is_four_cycle directions (.vertex i)

theorem isLocalTileFourCycle_of_set_eq
    {directions : Int → Direction}
    {v₀ v₁ v₂ v₃ w₀ w₁ w₂ w₃ : LocalBandVertex}
    (hset : fourVertexSet v₀ v₁ v₂ v₃ =
      fourVertexSet w₀ w₁ w₂ w₃)
    (h : IsLocalTileFourCycle directions w₀ w₁ w₂ w₃) :
    IsLocalTileFourCycle directions v₀ v₁ v₂ v₃ := by
  rcases h with ⟨tile, htile⟩
  exact ⟨tile, hset.trans htile⟩

theorem localTile_is_four_cycle_reverse
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerZero)
      (localTileCorner directions tile cornerThree)
      (localTileCorner directions tile cornerTwo)
      (localTileCorner directions tile cornerOne) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

theorem localTile_is_four_cycle_rotate_one
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerOne)
      (localTileCorner directions tile cornerTwo)
      (localTileCorner directions tile cornerThree)
      (localTileCorner directions tile cornerZero) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

theorem localTile_is_four_cycle_rotate_one_reverse
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerOne)
      (localTileCorner directions tile cornerZero)
      (localTileCorner directions tile cornerThree)
      (localTileCorner directions tile cornerTwo) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

theorem localTile_is_four_cycle_rotate_two
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerTwo)
      (localTileCorner directions tile cornerThree)
      (localTileCorner directions tile cornerZero)
      (localTileCorner directions tile cornerOne) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

theorem localTile_is_four_cycle_rotate_two_reverse
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerTwo)
      (localTileCorner directions tile cornerOne)
      (localTileCorner directions tile cornerZero)
      (localTileCorner directions tile cornerThree) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

theorem localTile_is_four_cycle_rotate_three
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerThree)
      (localTileCorner directions tile cornerZero)
      (localTileCorner directions tile cornerOne)
      (localTileCorner directions tile cornerTwo) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

theorem localTile_is_four_cycle_rotate_three_reverse
    (directions : Int → Direction) (tile : LocalBandTile) :
    IsLocalTileFourCycle directions
      (localTileCorner directions tile cornerThree)
      (localTileCorner directions tile cornerTwo)
      (localTileCorner directions tile cornerOne)
      (localTileCorner directions tile cornerZero) := by
  refine isLocalTileFourCycle_of_set_eq ?_
    (localTile_is_four_cycle directions tile)
  ext vertex
  simp only [fourVertexSet, Finset.mem_insert, Finset.mem_singleton]
  tauto

end LatticePathOrdersKernel
