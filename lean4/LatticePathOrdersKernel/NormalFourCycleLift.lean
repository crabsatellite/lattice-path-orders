import LatticePathOrdersKernel.NormalBandCovering

namespace LatticePathOrdersKernel

open LatticePathOrdersClassical

theorem localBandAdj_index_bounds
    {directions : Int → Direction} {left right : LocalBandVertex}
    (h : LocalBandAdj directions left right) :
    right.1 ≤ left.1 + 1 ∧ left.1 ≤ right.1 + 1 := by
  rcases h with h | ⟨i, endpoint, h | h⟩
  · omega
  · rcases h with ⟨rfl, rfl⟩
    constructor <;> omega
  · rcases h with ⟨rfl, rfl⟩
    constructor <;> omega

theorem int_eq_of_zmod_eq_of_distance_four
    {n : Nat} (hn : 5 ≤ n) {left right : Int}
    (hcast : (left : ZMod n) = (right : ZMod n))
    (hlower : left ≤ right + 4) (hupper : right ≤ left + 4) :
    left = right := by
  have hdvd : (n : Int) ∣ right - left :=
    (ZMod.intCast_eq_intCast_iff_dvd_sub left right n).mp hcast
  have habs : |right - left| < (n : Int) := by
    rw [abs_lt]
    constructor <;> omega
  have hzero := Int.eq_zero_of_abs_lt_dvd hdvd habs
  omega

theorem normal_simple_four_cycle_is_tile_of_five_le
    {n : Nat} (hn : 5 ≤ n) (steps : ZMod n → Direction)
    (v₀ v₁ v₂ v₃ : NormalBandVertex n)
    (hcycle : NormalSimpleFourCycle steps v₀ v₁ v₂ v₃) :
    IsNormalTileFourCycle steps v₀ v₁ v₂ v₃ := by
  letI : NeZero n := ⟨by omega⟩
  rcases hcycle with
    ⟨hne₀₁, hne₀₂, hne₀₃, hne₁₂, hne₁₃, hne₂₃,
      e₀₁, e₁₂, e₂₃, e₃₀⟩
  let local₀ : LocalBandVertex := ((v₀.1.val : Nat), v₀.2)
  have project₀ : projectLocalBandVertex n local₀ = v₀ := by
    apply Prod.ext
    · change (((v₀.1.val : Nat) : Int) : ZMod n) = v₀.1
      rw [Int.cast_natCast, ZMod.natCast_zmod_val]
    · rfl
  rcases liftNormalBandAdj project₀ e₀₁ with ⟨local₁, project₁, le₀₁⟩
  rcases liftNormalBandAdj project₁ e₁₂ with ⟨local₂, project₂, le₁₂⟩
  rcases liftNormalBandAdj project₂ e₂₃ with ⟨local₃, project₃, le₂₃⟩
  rcases liftNormalBandAdj project₃ e₃₀ with ⟨local₄, project₄, le₃₄⟩
  have project₄₀ : projectLocalBandVertex n local₄ =
      projectLocalBandVertex n local₀ := project₄.trans project₀.symm
  have hcast : (local₄.1 : ZMod n) = (local₀.1 : ZMod n) :=
    congrArg Prod.fst project₄₀
  have bound₀₁ := localBandAdj_index_bounds le₀₁
  have bound₁₂ := localBandAdj_index_bounds le₁₂
  have bound₂₃ := localBandAdj_index_bounds le₂₃
  have bound₃₄ := localBandAdj_index_bounds le₃₄
  have hindex : local₄.1 = local₀.1 :=
    int_eq_of_zmod_eq_of_distance_four hn hcast (by omega) (by omega)
  have hcorner : local₄.2 = local₀.2 :=
    by simpa [projectLocalBandVertex] using congrArg Prod.snd project₄₀
  have hlocal₄ : local₄ = local₀ := Prod.ext hindex hcorner
  rw [hlocal₄] at le₃₄
  have localCycle : LocalSimpleFourCycle (liftNormalDirections steps)
      local₀ local₁ local₂ local₃ := by
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, le₀₁, le₁₂, le₂₃, le₃₄⟩
    · intro h
      apply hne₀₁
      rw [← project₀, ← project₁, h]
    · intro h
      apply hne₀₂
      rw [← project₀, ← project₂, h]
    · intro h
      apply hne₀₃
      rw [← project₀, ← project₃, h]
    · intro h
      apply hne₁₂
      rw [← project₁, ← project₂, h]
    · intro h
      apply hne₁₃
      rw [← project₁, ← project₃, h]
    · intro h
      apply hne₂₃
      rw [← project₂, ← project₃, h]
  rcases local_simple_four_cycle_is_tile _ _ _ _ _ localCycle with
    ⟨tile, htile⟩
  refine ⟨projectLocalBandTile n tile, ?_⟩
  have himage := congrArg (Finset.image (projectLocalBandVertex n)) htile
  rw [image_project_fourVertexSet,
    image_project_localTileVertexSet] at himage
  rw [project₀, project₁, project₂, project₃] at himage
  exact himage

end LatticePathOrdersKernel
