import LatticePathOrdersKernel.BestFirst
import Mathlib.Algebra.Ring.Parity

/-!
# Pell continuant identities for the nonlocal cover family

The sequence is the manuscript sequence
`P₀=0`, `P₁=1`, `Pₙ₊₂=2Pₙ₊₁+Pₙ`.
-/

namespace LatticePathOrdersKernel

def pell : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => 2 * pell (n + 1) + pell n

@[simp] theorem pell_zero : pell 0 = 0 := rfl
@[simp] theorem pell_one : pell 1 = 1 := rfl

theorem pell_add_two (n : Nat) :
    pell (n + 2) = 2 * pell (n + 1) + pell n := by
  simp [pell]

theorem pell_pos {n : Nat} (hn : 0 < n) : 0 < pell n := by
  induction n using Nat.twoStepInduction with
  | zero => omega
  | one => decide
  | more n ih0 ih1 =>
      rw [pell_add_two]
      omega

theorem pell_strictMono_pos {m n : Nat} (hm : 0 < m) (hmn : m < n) :
    pell m < pell n := by
  have hstep : ∀ k, pell k < pell (k + 1) := by
    intro k
    cases k with
    | zero => decide
    | succ j =>
        rw [show j + 1 + 1 = j + 2 by omega, pell_add_two]
        have hp := pell_pos (n := j + 1) (by omega)
        omega
  exact (strictMono_nat_of_lt_succ hstep) hmn

theorem pell_det_shift (d k : Nat) :
    (pell (d + k) : Int) * pell (k + 1) -
        (pell (d + k + 1) : Int) * pell k =
      (-1 : Int) ^ k * pell d := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [show d + (k + 1) = d + k + 1 by omega]
      rw [show k + 1 + 1 = k + 2 by omega, pell_add_two]
      rw [show d + k + 1 + 1 = (d + k) + 2 by omega,
        pell_add_two]
      push_cast
      calc
        (pell (d + k + 1) : Int) *
              (2 * pell (k + 1) + pell k) -
            (2 * pell (d + k + 1) + pell (d + k)) * pell (k + 1) =
            -((pell (d + k) : Int) * pell (k + 1) -
              pell (d + k + 1) * pell k) := by ring
        _ = -((-1 : Int) ^ k * pell d) := by rw [ih]
        _ = (-1 : Int) ^ (k + 1) * pell d := by
          rw [pow_succ]
          ring

def pellF (N k : Nat) : Nat := pell k * pell (N - k)

theorem pellF_symm {N k : Nat} (hk : k ≤ N) :
    pellF N k = pellF N (N - k) := by
  unfold pellF
  rw [Nat.sub_sub_self hk]
  exact Nat.mul_comm _ _

/-- First determinant identity used in manuscript Lemma `lem:pell-extrema`. -/
theorem pellF_neighbor_identity
    {N k : Nat} (hkn : 2 * k + 1 ≤ N) :
    (pellF N k : Int) - pellF N (k + 1) =
      (-1 : Int) ^ (k + 1) * pell (N - 2 * k - 1) := by
  let d := N - 2 * k - 1
  have hd : d + k = N - k - 1 := by
    dsimp [d]
    omega
  have hd1 : d + k + 1 = N - k := by
    dsimp [d]
    omega
  have hkN : k ≤ N := by omega
  have hk1N : k + 1 ≤ N := by omega
  have hdet := pell_det_shift d k
  unfold pellF
  rw [hd1, hd] at hdet
  rw [show N - (k + 1) = N - k - 1 by omega]
  rw [pow_succ]
  push_cast
  nlinarith

/-- Second determinant identity used in manuscript Lemma `lem:pell-extrema`. -/
theorem pellF_two_step_identity
    {N k : Nat} (hkn : 2 * k + 3 ≤ N) :
    (pellF N (k + 2) : Int) - pellF N k =
      2 * (-1 : Int) ^ k * pell (N - 2 * k - 2) := by
  have hfirst := pellF_neighbor_identity (N := N) (k := k) (by omega)
  have hsecond := pellF_neighbor_identity (N := N) (k := k + 1) (by omega)
  have hindex : N - 2 * k - 1 = (N - 2 * k - 3) + 2 := by omega
  have hrec := pell_add_two (N - 2 * k - 3)
  rw [← hindex] at hrec
  have hmiddle : N - 2 * k - 2 = (N - 2 * k - 3) + 1 := by omega
  rw [← hmiddle] at hrec
  have hsecondIndex : N - 2 * (k + 1) - 1 = N - 2 * k - 3 := by omega
  rw [hsecondIndex] at hsecond
  rw [pow_succ] at hfirst
  rw [pow_succ, pow_succ] at hsecond
  have hrecZ : (pell (N - 2 * k - 1) : Int) =
      2 * pell (N - 2 * k - 2) + pell (N - 2 * k - 3) := by
    exact_mod_cast hrec
  have hsrec := congrArg (fun value : Int => (-1 : Int) ^ k * value) hrecZ
  nlinarith

theorem pellF_odd_gt_next
    {N k : Nat} (hkOdd : Odd k) (hkn : 2 * k + 1 < N) :
    pellF N (k + 1) < pellF N k := by
  have hid := pellF_neighbor_identity (N := N) (k := k) (by omega)
  have heven : Even (k + 1) := hkOdd.add_one
  rw [heven.neg_one_pow] at hid
  have hp : 0 < pell (N - 2 * k - 1) := pell_pos (by omega)
  exact_mod_cast (show (pellF N (k + 1) : Int) < pellF N k by omega)

theorem pellF_even_lt_next
    {N k : Nat} (hkEven : Even k) (hkn : 2 * k + 1 < N) :
    pellF N k < pellF N (k + 1) := by
  have hid := pellF_neighbor_identity (N := N) (k := k) (by omega)
  have hodd : Odd (k + 1) := hkEven.add_one
  rw [hodd.neg_one_pow] at hid
  have hp : 0 < pell (N - 2 * k - 1) := pell_pos (by omega)
  exact_mod_cast (show (pellF N k : Int) < pellF N (k + 1) by omega)

theorem pellF_even_two_step_increases
    {N k : Nat} (hkEven : Even k) (hkn : 2 * k + 2 < N) :
    pellF N k < pellF N (k + 2) := by
  have hid := pellF_two_step_identity (N := N) (k := k) (by omega)
  rw [hkEven.neg_one_pow] at hid
  have hp : 0 < pell (N - 2 * k - 2) := pell_pos (by omega)
  exact_mod_cast (show (pellF N k : Int) < pellF N (k + 2) by omega)

theorem pellF_odd_two_step_decreases
    {N k : Nat} (hkOdd : Odd k) (hkn : 2 * k + 2 < N) :
    pellF N (k + 2) < pellF N k := by
  have hid := pellF_two_step_identity (N := N) (k := k) (by omega)
  rw [hkOdd.neg_one_pow] at hid
  have hp : 0 < pell (N - 2 * k - 2) := pell_pos (by omega)
  exact_mod_cast (show (pellF N (k + 2) : Int) < pellF N k by omega)

end LatticePathOrdersKernel
