import LatticePathOrdersKernel.LagrangeBridge
import LatticePathOrders.CoverCertificate

/-!
# Order transport for the positive Lagrange value
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem sourceLagrangeValue_eq_iff_lagrangeSq_eq
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {x y : Path} (hx : Carrier a b x) (hy : Carrier a b y) :
    sourceLagrangeValue x = sourceLagrangeValue y ↔
      lagrangeSq x = lagrangeSq y := by
  have hsx := sourceLagrangeValue_sq_eq_lagrangeSq ha hb hx
  have hsy := sourceLagrangeValue_sq_eq_lagrangeSq ha hb hy
  constructor
  · intro h
    have hs : (lagrangeSq x : Real) = (lagrangeSq y : Real) := by
      rw [← hsx, ← hsy, h]
    exact_mod_cast hs
  · intro h
    have hs : (lagrangeSq x : Real) = (lagrangeSq y : Real) := by
      exact_mod_cast h
    have hpx := sourceLagrangeValue_pos x
    have hpy := sourceLagrangeValue_pos y
    rw [← hsx, ← hsy] at hs
    nlinarith

theorem sourceLagrangeValue_lt_iff_lagrangeSq_lt
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {x y : Path} (hx : Carrier a b x) (hy : Carrier a b y) :
    sourceLagrangeValue x < sourceLagrangeValue y ↔
      lagrangeSq x < lagrangeSq y := by
  have hsx := sourceLagrangeValue_sq_eq_lagrangeSq ha hb hx
  have hsy := sourceLagrangeValue_sq_eq_lagrangeSq ha hb hy
  have hpx := sourceLagrangeValue_pos x
  have hpy := sourceLagrangeValue_pos y
  constructor
  · intro h
    have hs : (lagrangeSq x : Real) < (lagrangeSq y : Real) := by
      rw [← hsx, ← hsy]
      nlinarith
    exact_mod_cast hs
  · intro h
    have hs : (lagrangeSq x : Real) < (lagrangeSq y : Real) := by
      exact_mod_cast h
    rw [← hsx, ← hsy] at hs
    nlinarith

theorem pullbackCover_lagrangeSq_iff_source
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) {x y : Path} :
    PullbackCover (Carrier a b) lagrangeSq x y ↔
      PullbackCover (Carrier a b) sourceLagrangeValue x y := by
  constructor
  · rintro ⟨hx, hy, hxy, hcover⟩
    refine ⟨hx, hy,
      (sourceLagrangeValue_lt_iff_lagrangeSq_lt ha hb hx hy).mpr hxy, ?_⟩
    intro z hz hbetween
    apply hcover z hz
    exact ⟨
      (sourceLagrangeValue_lt_iff_lagrangeSq_lt ha hb hx hz).mp hbetween.1,
      (sourceLagrangeValue_lt_iff_lagrangeSq_lt ha hb hz hy).mp hbetween.2⟩
  · rintro ⟨hx, hy, hxy, hcover⟩
    refine ⟨hx, hy,
      (sourceLagrangeValue_lt_iff_lagrangeSq_lt ha hb hx hy).mp hxy, ?_⟩
    intro z hz hbetween
    apply hcover z hz
    exact ⟨
      (sourceLagrangeValue_lt_iff_lagrangeSq_lt ha hb hx hz).mpr hbetween.1,
      (sourceLagrangeValue_lt_iff_lagrangeSq_lt ha hb hz hy).mpr hbetween.2⟩

end LatticePathOrdersKernel
