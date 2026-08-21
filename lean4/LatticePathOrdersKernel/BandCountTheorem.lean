import LatticePathOrdersKernel.TauFixedCount

namespace LatticePathOrdersKernel

open LatticePathOrders

/-- `cor:band-count`, in exact natural-number form.  The first term is the
coprime cycle-lemma count and `reflectionNecklaceCount` is exactly the
manuscript's piecewise binomial `R_{a,b}`. -/
theorem manuscript_cor_band_count
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    bandClassCount ha hb hcoprime =
      (((a + b).choose a / (a + b)) + reflectionNecklaceCount a b) / 2 := by
  have hburnside := bandClassCount_burnside ha hb hcoprime
  rw [carrierPathFinset_card ha hb hcoprime,
    tauFixedCarrierCount_eq_reflectionNecklaceCount ha hb hcoprime] at hburnside
  exact (Nat.div_eq_of_eq_mul_left (by decide) hburnside.symm).symm

theorem reflectionNecklaceCount_of_odd_total
    {a b : Nat} (hodd : Odd (a + b)) :
    reflectionNecklaceCount a b =
      (((a + b) - 1) / 2).choose (a / 2) := by
  simp [reflectionNecklaceCount, hodd]

theorem reflectionNecklaceCount_of_even_total
    {a b : Nat} (heven : Even (a + b)) :
    reflectionNecklaceCount a b =
      (((a + b) - 2) / 2).choose ((a - 1) / 2) := by
  simp [reflectionNecklaceCount, Nat.not_odd_iff_even.mpr heven]

end LatticePathOrdersKernel
