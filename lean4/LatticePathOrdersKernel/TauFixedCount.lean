import LatticePathOrdersKernel.TauFixedReflection

namespace LatticePathOrdersKernel

open LatticePathOrders

def reflectionNecklaceCount (a b : Nat) : Nat :=
  let n := a + b
  if Odd n then
    ((n - 1) / 2).choose (a / 2)
  else
    ((n - 2) / 2).choose ((a - 1) / 2)

theorem coprime_left_odd_of_sum_even
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) (hsum : Even (a + b)) : Odd a := by
  by_contra hnotOdd
  have haEven : Even a := (Nat.not_odd_iff_even.mp hnotOdd)
  have h2a : 2 ∣ a := by
    rcases haEven with ⟨aHalf, haEq⟩
    refine ⟨aHalf, ?_⟩
    omega
  rcases hsum with ⟨totalHalf, htotal⟩
  rcases haEven with ⟨aHalf, haEq⟩
  have hbEven : Even b := by
    refine ⟨totalHalf - aHalf, ?_⟩
    omega
  have h2b : 2 ∣ b := by
    rcases hbEven with ⟨bHalf, hbEq⟩
    refine ⟨bHalf, ?_⟩
    omega
  have h22 : Nat.Coprime 2 2 :=
    hcoprime.of_dvd h2a h2b
  norm_num at h22

theorem tauFixedCarrierCount_eq_reflectionNecklaceCount
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    (hcoprime : Nat.Coprime a b) :
    tauFixedCarrierCount a b = reflectionNecklaceCount a b := by
  rcases Nat.even_or_odd (a + b) with hEven | hOdd
  · have haOdd := coprime_left_odd_of_sum_even ha hb hcoprime hEven
    rcases hEven with ⟨half, hhalf⟩
    have hhalfPos : 0 < half := by omega
    let m := half - 1
    have htotal : a + b = 2 * m + 2 := by dsimp [m]; omega
    have hreflect := tauFixedCarrierCount_mul_total_eq_reflectionPairCount
      ha hb hcoprime
    rw [htotal, reflectionPairCount_even_of_odd m a haOdd] at hreflect
    have hcancel : tauFixedCarrierCount a b =
        m.choose ((a - 1) / 2) := by
      have hmul := hreflect
      rw [Nat.mul_comm (2 * m + 2) (m.choose ((a - 1) / 2))] at hmul
      exact Nat.mul_right_cancel (by omega) hmul
    rw [hcancel]
    unfold reflectionNecklaceCount
    simp only [Nat.not_odd_iff_even.mpr ⟨half, hhalf⟩, ↓reduceIte]
    congr 2
    dsimp [m]
    omega
  · rcases hOdd with ⟨m, htotal⟩
    have hreflect := tauFixedCarrierCount_mul_total_eq_reflectionPairCount
      ha hb hcoprime
    rw [htotal, reflectionPairCount_odd m a] at hreflect
    have hcancel : tauFixedCarrierCount a b = m.choose (a / 2) := by
      have hmul := hreflect
      rw [Nat.mul_comm (2 * m + 1) (m.choose (a / 2))] at hmul
      exact Nat.mul_right_cancel (by omega) hmul
    rw [hcancel]
    unfold reflectionNecklaceCount
    simp only [show Odd (a + b) from ⟨m, htotal⟩, ↓reduceIte]
    congr 2
    omega

end LatticePathOrdersKernel
