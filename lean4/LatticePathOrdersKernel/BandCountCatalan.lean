import LatticePathOrdersKernel.BandCountTheorem
import Mathlib.Combinatorics.Enumerative.Catalan.Basic

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem odd_choose_div_eq_catalan (k : Nat) :
    (2 * k + 1).choose (k + 1) / (2 * k + 1) = catalan k := by
  have hcat := succ_mul_catalan_eq_centralBinom k
  change (k + 1) * catalan k = (2 * k).choose k at hcat
  have hchoose := Nat.add_one_mul_choose_eq (2 * k) k
  have hmul : (2 * k + 1).choose (k + 1) =
      (2 * k + 1) * catalan k := by
    apply Nat.mul_right_cancel (by omega : 0 < k + 1)
    calc
      (2 * k + 1).choose (k + 1) * (k + 1) =
          (2 * k + 1) * (2 * k).choose k := hchoose.symm
      _ = ((2 * k + 1) * catalan k) * (k + 1) := by
        rw [← hcat]
        ring
  apply Nat.div_eq_of_eq_mul_left (by omega)
  simpa [Nat.mul_comm] using hmul

theorem half_complement (n : Nat) (hn : 1 ≤ n) :
    n - 1 - n / 2 = (n - 1) / 2 := by omega

theorem reflectionNecklaceCount_near_diagonal
    (n : Nat) (hn : 2 ≤ n) :
    reflectionNecklaceCount n (n - 1) =
      (n - 1).choose ((n - 1) / 2) := by
  have htotal : n + (n - 1) = 2 * (n - 1) + 1 := by omega
  have hodd : Odd (n + (n - 1)) := ⟨n - 1, htotal⟩
  rw [reflectionNecklaceCount_of_odd_total hodd]
  have hfirst : (n + (n - 1) - 1) / 2 = n - 1 := by omega
  rw [hfirst]
  rw [← Nat.choose_symm (show n / 2 ≤ n - 1 by omega)]
  rw [half_complement n (by omega)]

theorem nearDiagonalCoprime (n : Nat) (hn : 2 ≤ n) :
    Nat.Coprime n (n - 1) := by
  have hprev : Nat.Coprime (n - 1) n :=
    (Nat.coprime_sub_self_right (show n - 1 ≤ n by omega)).mp (by
      have hone : n - (n - 1) = 1 := by omega
      rw [hone]
      simp)
  exact hprev.symm

/-- The specialized second display of `cor:band-count`. -/
theorem manuscript_cor_band_count_near_diagonal
    (n : Nat) (hn : 2 ≤ n) :
    bandClassCount (by omega : 0 < n) (by omega : 0 < n - 1)
      (nearDiagonalCoprime n hn) =
      (catalan (n - 1) +
        (n - 1).choose ((n - 1) / 2)) / 2 := by
  let ha : 0 < n := by omega
  let hb : 0 < n - 1 := by omega
  have hcoprime : Nat.Coprime n (n - 1) := nearDiagonalCoprime n hn
  have hgeneral := manuscript_cor_band_count ha hb hcoprime
  rw [reflectionNecklaceCount_near_diagonal n hn] at hgeneral
  have htotal : n + (n - 1) = 2 * (n - 1) + 1 := by omega
  have hchoose : (n + (n - 1)).choose n / (n + (n - 1)) =
      catalan (n - 1) := by
    rw [htotal]
    rw [show n = (n - 1) + 1 by omega]
    exact odd_choose_div_eq_catalan (n - 1)
  rw [hchoose] at hgeneral
  simpa [ha, hb, hcoprime] using hgeneral

end LatticePathOrdersKernel
