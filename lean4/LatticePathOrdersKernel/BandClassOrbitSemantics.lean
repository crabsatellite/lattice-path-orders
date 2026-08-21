import LatticePathOrdersKernel.BandCountCatalan

namespace LatticePathOrdersKernel

open LatticePathOrders

/-- The quotient counted by `bandClassCount` is exactly the quotient by
literal band-graph isomorphism, not merely an auxiliary `tau` quotient. -/
theorem carrierTau_orbitRel_iff_bandIso
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    (hcoprime : Nat.Coprime a b)
    (left right : CarrierObject a b) :
    letI := carrierTauAddAction ha hb hcoprime
    AddAction.orbitRel (ZMod 2) (CarrierObject a b) left right ↔
      PathBandIso (a + b) left.1 right.1 := by
  letI := carrierTauAddAction ha hb hcoprime
  rw [AddAction.orbitRel_apply, AddAction.mem_orbit_iff]
  constructor
  · rintro ⟨g, hg⟩
    fin_cases g
    · change right = left at hg
      subst right
      exact PathBandIso.refl _ _
    · change carrierTauObject ha hb right = left at hg
      have hpath : left.1 = tau a b right.1 :=
        (congrArg Subtype.val hg).symm
      have hiso : PathBandIso (a + b) right.1 left.1 :=
        (manuscript_thm_band_classes ha hb hab hcoprime
          (mem_carrierPathFinset.mp right.2)
          (mem_carrierPathFinset.mp left.2)).mpr (Or.inr hpath)
      exact hiso.symm
  · intro hiso
    have hcases := (manuscript_thm_band_classes ha hb hab hcoprime
      (mem_carrierPathFinset.mp left.2)
      (mem_carrierPathFinset.mp right.2)).mp hiso
    rcases hcases with heq | htau
    · refine ⟨0, ?_⟩
      change right = left
      exact Subtype.ext heq
    · refine ⟨1, ?_⟩
      change carrierTauObject ha hb right = left
      apply Subtype.ext
      change tau a b right.1 = left.1
      rw [htau, tau_involution ha hb hcoprime
        (mem_carrierPathFinset.mp left.2)]

end LatticePathOrdersKernel
