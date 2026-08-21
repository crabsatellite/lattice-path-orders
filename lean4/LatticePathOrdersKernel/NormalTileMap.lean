import LatticePathOrdersKernel.NormalTileUniqueness

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem normalTileVertexSet_eq_four
    {n : Nat} (steps : ZMod n → Direction) (tile : BandTile n) :
    normalTileVertexSet steps tile =
      normalFourVertexSet
        (normalTileCorner steps tile cornerZero)
        (normalTileCorner steps tile cornerOne)
        (normalTileCorner steps tile cornerTwo)
        (normalTileCorner steps tile cornerThree) := by
  apply Finset.ext
  intro vertex
  constructor
  · intro hvertex
    rcases Finset.mem_image.mp hvertex with ⟨corner, _, rfl⟩
    fin_cases corner <;> simp [normalFourVertexSet]
  · intro hvertex
    simp only [normalFourVertexSet, Finset.mem_insert,
      Finset.mem_singleton] at hvertex
    rcases hvertex with rfl | rfl | rfl | rfl
    · exact normalTileCorner_mem steps tile cornerZero
    · exact normalTileCorner_mem steps tile cornerOne
    · exact normalTileCorner_mem steps tile cornerTwo
    · exact normalTileCorner_mem steps tile cornerThree

theorem NormalBandGraphIso.map_simple_four_cycle
    {n : Nat} {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right)
    {v₀ v₁ v₂ v₃ : NormalBandVertex n}
    (h : NormalSimpleFourCycle left v₀ v₁ v₂ v₃) :
    NormalSimpleFourCycle right (iso.vertexEquiv v₀) (iso.vertexEquiv v₁)
      (iso.vertexEquiv v₂) (iso.vertexEquiv v₃) := by
  rcases h with ⟨h₀₁, h₀₂, h₀₃, h₁₂, h₁₃, h₂₃,
    e₀₁, e₁₂, e₂₃, e₃₀⟩
  exact ⟨fun heq => h₀₁ (iso.vertexEquiv.injective heq),
    fun heq => h₀₂ (iso.vertexEquiv.injective heq),
    fun heq => h₀₃ (iso.vertexEquiv.injective heq),
    fun heq => h₁₂ (iso.vertexEquiv.injective heq),
    fun heq => h₁₃ (iso.vertexEquiv.injective heq),
    fun heq => h₂₃ (iso.vertexEquiv.injective heq),
    (iso.map_adj_iff _ _).mp e₀₁, (iso.map_adj_iff _ _).mp e₁₂,
    (iso.map_adj_iff _ _).mp e₂₃, (iso.map_adj_iff _ _).mp e₃₀⟩

theorem NormalBandGraphIso.image_tile_exists
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n) :
    ∃ rightTile,
      (normalTileVertexSet left tile).image iso.vertexEquiv =
        normalTileVertexSet right rightTile := by
  letI : Fact (1 < n) := ⟨by omega⟩
  have hsimple := iso.map_simple_four_cycle
    (normalTile_simple_four_cycle left tile)
  rcases normal_simple_four_cycle_is_tile_of_five_le hn right _ _ _ _ hsimple with
    ⟨rightTile, hrightTile⟩
  refine ⟨rightTile, ?_⟩
  rw [normalTileVertexSet_eq_four]
  simp only [normalFourVertexSet, Finset.image_insert,
    Finset.image_singleton]
  exact hrightTile

noncomputable def NormalBandGraphIso.tileMap
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n) : BandTile n :=
  Classical.choose (iso.image_tile_exists hn tile)

theorem NormalBandGraphIso.tileMap_spec
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) (tile : BandTile n) :
    (normalTileVertexSet left tile).image iso.vertexEquiv =
      normalTileVertexSet right (iso.tileMap hn tile) :=
  Classical.choose_spec (iso.image_tile_exists hn tile)

theorem NormalBandGraphIso.tileMap_injective
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) : Function.Injective (iso.tileMap hn) := by
  intro tile₁ tile₂ htiles
  apply normalTileVertexSet_injective hn left
  apply (Finset.image_inj iso.vertexEquiv.injective).mp
  rw [iso.tileMap_spec hn, iso.tileMap_spec hn, htiles]

noncomputable def NormalBandGraphIso.tileEquiv
    {n : Nat} (hn : 5 ≤ n) {left right : ZMod n → Direction}
    (iso : NormalBandGraphIso left right) : BandTile n ≃ BandTile n :=
  by
    letI : NeZero n := ⟨by omega⟩
    exact Equiv.ofBijective (iso.tileMap hn)
      ((Fintype.bijective_iff_injective_and_card _).mpr
        ⟨iso.tileMap_injective hn, rfl⟩)

end LatticePathOrdersKernel
