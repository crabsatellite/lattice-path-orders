import LatticePathOrdersKernel.Tau

/-!
# The explicit nonlocal path family
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

def urPairs : Nat → Path
  | 0 => []
  | n + 1 => Step.U :: Step.R :: urPairs n

def nonlocalX (n : Nat) : Path :=
  [Step.R, Step.R, Step.R] ++ urPairs (n - 3) ++ [Step.U, Step.U]

def nonlocalY (n : Nat) : Path :=
  [Step.R, Step.R] ++ urPairs (n - 4) ++
    [Step.R, Step.U, Step.U, Step.R, Step.U]

@[simp] theorem urPairs_length (n : Nat) : (urPairs n).length = 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih => simp [urPairs, ih]; omega

@[simp] theorem urPairs_countR (n : Nat) : Path.countR (urPairs n) = n := by
  unfold Path.countR
  induction n with
  | zero => rfl
  | succ n ih => simp [urPairs, ih]

@[simp] theorem urPairs_countU (n : Nat) : Path.countU (urPairs n) = n := by
  unfold Path.countU
  induction n with
  | zero => rfl
  | succ n ih => simp [urPairs, ih]

@[simp] theorem urPairs_balance (a b n : Nat) :
    wordBalance a b (urPairs n) = (b : Int) * n - (a : Int) * n := by
  rw [wordBalance_eq_counts, urPairs_countR, urPairs_countU]

def SafeRun (a b : Nat) : Int → Path → Prop
  | credit, [] => 0 ≤ credit
  | credit, step :: tail =>
      0 ≤ credit ∧ SafeRun a b (credit + stepBalance a b step) tail

theorem SafeRun.credit_nonneg
    {a b : Nat} {credit : Int} {word : Path}
    (h : SafeRun a b credit word) : 0 ≤ credit := by
  cases word with
  | nil => exact h
  | cons _ _ => exact h.1

theorem SafeRun_append (a b : Nat) (credit : Int) (left right : Path) :
    SafeRun a b credit (left ++ right) ↔
      SafeRun a b credit left ∧
        SafeRun a b (credit + wordBalance a b left) right := by
  induction left generalizing credit with
  | nil =>
      constructor
      · intro h
        exact ⟨h.credit_nonneg, by simpa [wordBalance] using h⟩
      · rintro ⟨_, h⟩
        simpa [wordBalance] using h
  | cons step tail ih =>
      simp only [List.cons_append, SafeRun]
      rw [ih]
      unfold wordBalance
      simp only [List.map_cons, List.sum_cons]
      constructor
      · rintro ⟨hc, htail, hright⟩
        exact ⟨⟨hc, htail⟩, by
          convert hright using 1 <;> ring⟩
      · rintro ⟨⟨hc, htail⟩, hright⟩
        exact ⟨hc, htail, by
          convert hright using 1 <;> ring⟩

theorem SafeRun_urPairs
    {n pairs : Nat} {credit : Int}
    (hn : 0 < n)
    (hcredit : (n : Int) + pairs - 1 ≤ credit) :
    SafeRun n (n - 1) credit (urPairs pairs) := by
  induction pairs generalizing credit with
  | zero =>
      simp [urPairs, SafeRun]
      omega
  | succ pairs ih =>
      simp only [urPairs, SafeRun, stepBalance]
      refine ⟨by omega, ?_⟩
      refine ⟨by omega, ?_⟩
      convert ih (credit := credit - 1) (by omega) using 1 <;> omega

theorem SafeRun_iff_prefixBalance_add
    (a b : Nat) (credit : Int) (word : Path) :
    SafeRun a b credit word ↔
      ∀ k, k ≤ word.length →
        0 ≤ credit + prefixBalance a b word k := by
  induction word generalizing credit with
  | nil => simp [SafeRun, prefixBalance, wordBalance]
  | cons step tail ih =>
      constructor
      · rintro ⟨hcredit, htail⟩ k hk
        cases k with
        | zero => simpa [prefixBalance, wordBalance] using hcredit
        | succ k =>
            have htailPrefix := (ih (credit + stepBalance a b step)).mp
              htail k (by simpa using hk)
            unfold prefixBalance at htailPrefix ⊢
            unfold wordBalance at htailPrefix ⊢
            simp only [List.take_succ_cons, wordBalance,
              List.map_cons, List.sum_cons]
            linarith
      · intro hprefix
        constructor
        · have hzero := hprefix 0 (by simp)
          simpa [prefixBalance, wordBalance] using hzero
        · apply (ih (credit + stepBalance a b step)).mpr
          intro k hk
          have horiginal := hprefix (k + 1) (by simpa using hk)
          unfold prefixBalance at horiginal ⊢
          unfold wordBalance at horiginal ⊢
          simp only [List.take_succ_cons, wordBalance,
            List.map_cons, List.sum_cons] at horiginal
          linarith

theorem SafeRun_iff_prefixBalance
    (a b : Nat) (word : Path) :
    SafeRun a b 0 word ↔
      ∀ k, k ≤ word.length → 0 ≤ prefixBalance a b word k := by
  simpa using SafeRun_iff_prefixBalance_add a b 0 word

theorem nonlocalX_counts {n : Nat} (hn : 4 ≤ n) :
    Path.countR (nonlocalX n) = n ∧ Path.countU (nonlocalX n) = n - 1 := by
  have hr := urPairs_countR (n - 3)
  have hu := urPairs_countU (n - 3)
  unfold Path.countR at hr
  unfold Path.countU at hu
  unfold Path.countR Path.countU
  simp [nonlocalX, hr, hu]
  omega

theorem nonlocalY_counts {n : Nat} (hn : 4 ≤ n) :
    Path.countR (nonlocalY n) = n ∧ Path.countU (nonlocalY n) = n - 1 := by
  have hr := urPairs_countR (n - 4)
  have hu := urPairs_countU (n - 4)
  unfold Path.countR at hr
  unfold Path.countU at hu
  unfold Path.countR Path.countU
  simp [nonlocalY, hr, hu]
  omega

theorem nonlocalX_safe {n : Nat} (hn : 4 ≤ n) :
    SafeRun n (n - 1) 0 (nonlocalX n) := by
  unfold nonlocalX
  apply (SafeRun_append n (n - 1) 0
    [Step.R, Step.R, Step.R]
    (urPairs (n - 3) ++ [Step.U, Step.U])).2
  constructor
  · simp [SafeRun, stepBalance]
    omega
  · have hcredit :
        (0 : Int) + wordBalance n (n - 1) [Step.R, Step.R, Step.R] =
          3 * (n - 1) := by
      simp [wordBalance, stepBalance]
      rw [Nat.cast_sub (by omega : 1 ≤ n)]
      ring
    rw [hcredit]
    apply (SafeRun_append n (n - 1) (3 * (n - 1))
      (urPairs (n - 3)) [Step.U, Step.U]).2
    constructor
    · apply SafeRun_urPairs (by omega)
      rw [Nat.cast_sub (by omega : 3 ≤ n)]
      omega
    · have hpairBalance :
          wordBalance n (n - 1) (urPairs (n - 3)) =
            -((n - 3 : Nat) : Int) := by
        rw [urPairs_balance, Nat.cast_sub (by omega : 1 ≤ n)]
        ring
      rw [hpairBalance, Nat.cast_sub (by omega : 3 ≤ n)]
      simp [SafeRun, stepBalance]
      omega

theorem nonlocalY_safe {n : Nat} (hn : 4 ≤ n) :
    SafeRun n (n - 1) 0 (nonlocalY n) := by
  unfold nonlocalY
  apply (SafeRun_append n (n - 1) 0 [Step.R, Step.R]
    (urPairs (n - 4) ++
      [Step.R, Step.U, Step.U, Step.R, Step.U])).2
  constructor
  · simp [SafeRun, stepBalance]
  · have hcredit :
        (0 : Int) + wordBalance n (n - 1) [Step.R, Step.R] =
          2 * (n - 1) := by
      simp [wordBalance, stepBalance]
      rw [Nat.cast_sub (by omega : 1 ≤ n)]
      ring
    rw [hcredit]
    apply (SafeRun_append n (n - 1) (2 * (n - 1))
      (urPairs (n - 4))
      [Step.R, Step.U, Step.U, Step.R, Step.U]).2
    constructor
    · apply SafeRun_urPairs (by omega)
      rw [Nat.cast_sub (by omega : 4 ≤ n)]
      omega
    · have hpairBalance :
          wordBalance n (n - 1) (urPairs (n - 4)) =
            -((n - 4 : Nat) : Int) := by
        rw [urPairs_balance, Nat.cast_sub (by omega : 1 ≤ n)]
        ring
      rw [hpairBalance, Nat.cast_sub (by omega : 4 ≤ n)]
      simp [SafeRun, stepBalance]
      omega

theorem nonlocalX_carrier {n : Nat} (hn : 4 ≤ n) :
    Carrier n (n - 1) (nonlocalX n) := by
  apply carrier_iff_balance.mpr
  exact ⟨(nonlocalX_counts hn).1, (nonlocalX_counts hn).2,
    (SafeRun_iff_prefixBalance n (n - 1) (nonlocalX n)).mp
      (nonlocalX_safe hn)⟩

theorem nonlocalY_carrier {n : Nat} (hn : 4 ≤ n) :
    Carrier n (n - 1) (nonlocalY n) := by
  apply carrier_iff_balance.mpr
  exact ⟨(nonlocalY_counts hn).1, (nonlocalY_counts hn).2,
    (SafeRun_iff_prefixBalance n (n - 1) (nonlocalY n)).mp
      (nonlocalY_safe hn)⟩

end LatticePathOrdersKernel
