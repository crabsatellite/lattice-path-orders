import LatticePathOrdersClassical.PositiveDigits
import Mathlib.Data.Finset.Max

/-!
# The maximum over cyclic cuts

For a nonempty even positive digit word, every cyclic cut has determinant one
and the same trace.  We prove that the largest conjugate fixed-point gap occurs
exactly at a cut with minimum lower-left matrix entry.
-/

namespace LatticePathOrdersClassical

open NatMatrix2

abbrev CyclicIndex (digits : List Nat) := Fin digits.length

def cyclicProduct (digits : List Nat) (k : CyclicIndex digits) : NatMatrix2 :=
  digitProduct (digits.rotate k.val)

def cyclicDenominator (digits : List Nat) (k : CyclicIndex digits) : Nat :=
  (cyclicProduct digits k).a21

noncomputable def cyclicGap (digits : List Nat) (k : CyclicIndex digits) : Real :=
  fixedPointGap (cyclicProduct digits k)

theorem cyclicIndex_nonempty {digits : List Nat} (hne : digits ≠ []) :
    (Finset.univ : Finset (CyclicIndex digits)).Nonempty := by
  cases digits with
  | nil => contradiction
  | cons a tail =>
      exact ⟨⟨0, by simp⟩, Finset.mem_univ _⟩

def cyclicDenominatorMin (digits : List Nat) (hne : digits ≠ []) : Nat :=
  (Finset.univ.image (cyclicDenominator digits)).min'
    ((cyclicIndex_nonempty hne).image _)

noncomputable def periodicGapMaximum (digits : List Nat) (hne : digits ≠ []) : Real :=
  (Finset.univ.image (cyclicGap digits)).max'
    ((cyclicIndex_nonempty hne).image _)

theorem cyclicDenominator_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (k : CyclicIndex digits) : 0 < cyclicDenominator digits k := by
  exact digitProduct_a21_pos (rotate_ne_nil hne k.val) (hpos.rotate k.val)

theorem cyclicDenominatorMin_pos {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits) :
    0 < cyclicDenominatorMin digits hne := by
  unfold cyclicDenominatorMin
  have hmem := Finset.min'_mem
    (Finset.univ.image (cyclicDenominator digits))
    ((cyclicIndex_nonempty hne).image _)
  rcases Finset.mem_image.mp hmem with ⟨k, -, hk⟩
  rw [← hk]
  exact cyclicDenominator_pos hne hpos k

theorem cyclicDenominatorMin_achieved {digits : List Nat}
    (hne : digits ≠ []) :
    ∃ k : CyclicIndex digits,
      cyclicDenominator digits k = cyclicDenominatorMin digits hne := by
  have hmem := Finset.min'_mem
    (Finset.univ.image (cyclicDenominator digits))
    ((cyclicIndex_nonempty hne).image _)
  rcases Finset.mem_image.mp hmem with ⟨k, -, hk⟩
  exact ⟨k, hk⟩

theorem cyclicDenominatorMin_le {digits : List Nat}
    (hne : digits ≠ []) (k : CyclicIndex digits) :
    cyclicDenominatorMin digits hne ≤ cyclicDenominator digits k := by
  unfold cyclicDenominatorMin
  apply Finset.min'_le
  exact Finset.mem_image.mpr ⟨k, Finset.mem_univ _, rfl⟩

theorem cyclicGap_eq_common {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) (k : CyclicIndex digits) :
    cyclicGap digits k =
      Real.sqrt (fixedDiscriminant (digitProduct digits)) /
        cyclicDenominator digits k := by
  have hq := cyclicDenominator_pos hne hpos k
  have hdetBase := determinant_digitProduct_of_even heven
  have hdetRotate := determinant_rotate_of_even heven k.val
  unfold cyclicGap cyclicDenominator cyclicProduct
  change 0 < (digitProduct (digits.rotate k.val)).a21 at hq
  rw [fixedPointGap_eq _ hq]
  congr 1
  apply congrArg Real.sqrt
  rw [fixedDiscriminant_eq_trace hdetRotate]
  rw [fixedDiscriminant_eq_trace hdetBase]
  rw [trace_rotate_eq]

theorem periodicGapMaximum_eq_traceMin {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) :
    periodicGapMaximum digits hne =
      Real.sqrt (fixedDiscriminant (digitProduct digits)) /
        cyclicDenominatorMin digits hne := by
  let numerator := Real.sqrt (fixedDiscriminant (digitProduct digits))
  let qmin := cyclicDenominatorMin digits hne
  have hn : 0 ≤ numerator := by dsimp [numerator]; positivity
  have hqmin : 0 < qmin := by
    dsimp [qmin]
    exact cyclicDenominatorMin_pos hne hpos
  unfold periodicGapMaximum
  apply (Finset.max'_eq_iff
    (s := Finset.univ.image (cyclicGap digits))
    (H := (cyclicIndex_nonempty hne).image (cyclicGap digits))
    (numerator / (qmin : Real))).mpr
  constructor
  · rcases cyclicDenominatorMin_achieved hne with ⟨k, hk⟩
    apply Finset.mem_image.mpr
    refine ⟨k, Finset.mem_univ _, ?_⟩
    rw [cyclicGap_eq_common hne hpos heven k, hk]
  · intro value hvalue
    rcases Finset.mem_image.mp hvalue with ⟨k, -, rfl⟩
    rw [cyclicGap_eq_common hne hpos heven k]
    have hq := cyclicDenominator_pos hne hpos k
    apply (div_le_div_iff₀ (by exact_mod_cast hq) (by exact_mod_cast hqmin)).mpr
    have hle := cyclicDenominatorMin_le hne k
    exact mul_le_mul_of_nonneg_left (by exact_mod_cast hle) hn

theorem periodicGapMaximum_sq {digits : List Nat}
    (hne : digits ≠ []) (hpos : PositiveDigits digits)
    (heven : Even digits.length) :
    periodicGapMaximum digits hne ^ 2 =
      ((trace (digitProduct digits) : Real) ^ 2 - 4) /
        (cyclicDenominatorMin digits hne : Real) ^ 2 := by
  rw [periodicGapMaximum_eq_traceMin hne hpos heven, div_pow]
  rw [Real.sq_sqrt (fixedDiscriminant_nonneg _)]
  rw [fixedDiscriminant_eq_trace (determinant_digitProduct_of_even heven)]

end LatticePathOrdersClassical
