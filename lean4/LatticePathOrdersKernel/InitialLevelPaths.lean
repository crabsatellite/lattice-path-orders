import LatticePathOrdersKernel.NonlocalCover

/-! # Explicit singleton candidates for the initial matching levels -/

namespace LatticePathOrdersKernel

open LatticePathOrders

def initialLevelPath (n r : Nat) : Path :=
  [Step.R, Step.R] ++ urPairs r ++ [Step.R] ++
    urPairs (n - r - 3) ++ [Step.U, Step.U]

def minimumLevelPath (n : Nat) : Path :=
  [Step.R, Step.R] ++ urPairs (n - 2) ++ [Step.U]

theorem minimumLevelPath_carrier {n : Nat} (hn : 4 ≤ n) :
    Carrier n (n - 1) (minimumLevelPath n) := by
  apply carrier_iff_balance.mpr
  constructor
  · have hc := urPairs_countR (n - 2)
    unfold Path.countR at hc ⊢
    simp [minimumLevelPath, hc]
    omega
  constructor
  · have hc := urPairs_countU (n - 2)
    unfold Path.countU at hc ⊢
    simp [minimumLevelPath, hc]
    omega
  · apply (SafeRun_iff_prefixBalance n (n - 1) _).mp
    unfold minimumLevelPath
    apply (SafeRun_append n (n - 1) 0 [Step.R, Step.R]
      (urPairs (n - 2) ++ [Step.U])).2
    constructor
    · simp [SafeRun, stepBalance]
    · have hcredit :
          (0 : Int) + wordBalance n (n - 1) [Step.R, Step.R] =
            2 * ((n - 1 : Nat) : Int) := by
        simp [wordBalance, stepBalance]
        ring
      rw [hcredit]
      apply (SafeRun_append n (n - 1) (2 * ((n - 1 : Nat) : Int))
        (urPairs (n - 2)) [Step.U]).2
      constructor
      · apply SafeRun_urPairs (by omega)
        have hcast : ((n - 2 : Nat) : Int) = (n : Int) - 2 := by
          rw [Nat.cast_sub (by omega : 2 ≤ n)]
          norm_num
        rw [hcast, Nat.cast_sub (by omega : 1 ≤ n)]
        omega
      · have hpair : wordBalance n (n - 1) (urPairs (n - 2)) =
            -((n - 2 : Nat) : Int) := by
          rw [urPairs_balance, Nat.cast_sub (by omega : 1 ≤ n)]
          ring
        have hcast : ((n - 2 : Nat) : Int) = (n : Int) - 2 := by
          rw [Nat.cast_sub (by omega : 2 ≤ n)]
          norm_num
        rw [hpair, hcast, Nat.cast_sub (by omega : 1 ≤ n)]
        simp [SafeRun, stepBalance]
        omega

theorem minimumLevelPath_adjacencyBlocks {n : Nat} (hn : 4 ≤ n) :
    adjacencyBlocks (minimumLevelPath n) =
      [E] ++ List.replicate (2 * n - 3) D := by
  unfold minimumLevelPath
  rw [show [Step.R, Step.R] ++ urPairs (n - 2) ++ [Step.U] =
    Step.R :: Step.R :: (urPairs (n - 2) ++ [Step.U]) by
      simp [List.append_assoc]]
  rw [adjacencyBlocks_cons]
  simp only [edgeBlocks, edgeBlock, if_pos rfl]
  have htail : edgeBlocks Step.R (urPairs (n - 2) ++ [Step.U]) =
      List.replicate (2 * (n - 2) + 1) D := by
    induction (n - 2) with
    | zero => rfl
    | succ k ih =>
        simp only [urPairs, List.cons_append, edgeBlocks]
        rw [ih]
        simp only [edgeBlock, if_neg (by decide : Step.R ≠ Step.U),
          if_neg (by decide : Step.U ≠ Step.R)]
        have hrep : List.replicate (2 * (k + 1) + 1) D =
            D :: D :: List.replicate (2 * k + 1) D := by
          rw [show 2 * (k + 1) + 1 = 2 * k + 1 + 2 by omega]
          simp [List.replicate_succ]
        rw [hrep]
  rw [htail]
  have hcount : 2 * (n - 2) + 1 = 2 * n - 3 := by omega
  rw [hcount]
  rfl

theorem minimumLevelPath_score {n : Nat} (hn : 4 ≤ n) :
    sourceMatchingNumber (minimumLevelPath n) = pell (2 * n - 1) := by
  rw [sourceMatchingNumber_eq_matchingScore]
  unfold matchingScore
  rw [minimumLevelPath_adjacencyBlocks hn]
  have hone := one_E_score (m := 2 * n - 2) (by omega)
  have hindex : 2 * n - 2 - 1 = 2 * n - 3 := by omega
  rw [hindex] at hone
  rw [hone]
  congr 1
  omega

theorem initialLevelPath_counts
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    Path.countR (initialLevelPath n r) = n ∧
      Path.countU (initialLevelPath n r) = n - 1 := by
  have hr1 := urPairs_countR r
  have hu1 := urPairs_countU r
  have hr2 := urPairs_countR (n - r - 3)
  have hu2 := urPairs_countU (n - r - 3)
  unfold Path.countR at hr1 hr2
  unfold Path.countU at hu1 hu2
  unfold Path.countR Path.countU
  simp [initialLevelPath, hr1, hu1, hr2, hu2]
  omega

theorem initialLevelPath_safe
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    SafeRun n (n - 1) 0 (initialLevelPath n r) := by
  unfold initialLevelPath
  apply (SafeRun_append n (n - 1) 0 [Step.R, Step.R]
    (urPairs r ++ [Step.R] ++ urPairs (n - r - 3) ++
      [Step.U, Step.U])).2
  constructor
  · simp [SafeRun, stepBalance]
  · have hcredit :
        (0 : Int) + wordBalance n (n - 1) [Step.R, Step.R] =
          2 * ((n - 1 : Nat) : Int) := by
      simp [wordBalance, stepBalance]
      ring
    rw [hcredit]
    rw [show urPairs r ++ [Step.R] ++ urPairs (n - r - 3) ++
        [Step.U, Step.U] =
      urPairs r ++ ([Step.R] ++ urPairs (n - r - 3) ++
        [Step.U, Step.U]) by simp [List.append_assoc]]
    apply (SafeRun_append n (n - 1) (2 * ((n - 1 : Nat) : Int))
      (urPairs r)
      ([Step.R] ++ urPairs (n - r - 3) ++ [Step.U, Step.U])).2
    constructor
    · apply SafeRun_urPairs (by omega)
      rw [Nat.cast_sub (by omega : 1 ≤ n)]
      have hrCast : (r : Int) ≤ ((n - 3 : Nat) : Int) := by exact_mod_cast hr
      rw [Nat.cast_sub (by omega : 3 ≤ n)] at hrCast
      omega
    · have hpair1 : wordBalance n (n - 1) (urPairs r) = -(r : Int) := by
        rw [urPairs_balance, Nat.cast_sub (by omega : 1 ≤ n)]
        ring
      rw [hpair1]
      apply (SafeRun_append n (n - 1)
        (2 * ((n - 1 : Nat) : Int) - r) [Step.R]
        (urPairs (n - r - 3) ++ [Step.U, Step.U])).2
      constructor
      · simp [SafeRun, stepBalance]
        omega
      · have hR : wordBalance n (n - 1) [Step.R] = (n - 1 : Nat) := by
          simp [wordBalance, stepBalance]
        rw [hR]
        apply (SafeRun_append n (n - 1)
          (2 * ((n - 1 : Nat) : Int) - r + (n - 1 : Nat))
          (urPairs (n - r - 3)) [Step.U, Step.U]).2
        constructor
        · apply SafeRun_urPairs (by omega)
          have hsCast : ((n - r - 3 : Nat) : Int) =
              (n : Int) - r - 3 := by
            rw [Nat.cast_sub (by omega : 3 ≤ n - r),
              Nat.cast_sub (by omega : r ≤ n)]
            norm_num
          rw [hsCast, Nat.cast_sub (by omega : 1 ≤ n)]
          omega
        · have hpair2 :
              wordBalance n (n - 1) (urPairs (n - r - 3)) =
                -((n - r - 3 : Nat) : Int) := by
            rw [urPairs_balance, Nat.cast_sub (by omega : 1 ≤ n)]
            ring
          have hsCast : ((n - r - 3 : Nat) : Int) =
              (n : Int) - r - 3 := by
            rw [Nat.cast_sub (by omega : 3 ≤ n - r),
              Nat.cast_sub (by omega : r ≤ n)]
            norm_num
          rw [hpair2, hsCast, Nat.cast_sub (by omega : 1 ≤ n)]
          simp [SafeRun, stepBalance]
          omega

theorem initialLevelPath_carrier
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    Carrier n (n - 1) (initialLevelPath n r) := by
  apply carrier_iff_balance.mpr
  exact ⟨(initialLevelPath_counts hn hr).1, (initialLevelPath_counts hn hr).2,
    (SafeRun_iff_prefixBalance n (n - 1) _).mp
      (initialLevelPath_safe hn hr)⟩

theorem edgeBlocks_R_urPairs_R (pairs : Nat) :
    edgeBlocks Step.R (urPairs pairs ++ [Step.R]) =
      List.replicate (2 * pairs) D ++ [E] := by
  induction pairs with
  | zero => rfl
  | succ pairs ih =>
      simp only [urPairs, List.cons_append, edgeBlocks]
      rw [ih]
      simp only [edgeBlock, if_neg (by decide : Step.R ≠ Step.U),
        if_neg (by decide : Step.U ≠ Step.R)]
      have hrep : List.replicate (2 * (pairs + 1)) D =
          D :: D :: List.replicate (2 * pairs) D := by
        rw [show 2 * (pairs + 1) = 2 * pairs + 2 by omega]
        simp [List.replicate_succ]
      rw [hrep]
      simp [List.append_assoc]

theorem lastAfter_R_urPairs_R (pairs : Nat) :
    LatticePathOrders.lastAfter Step.R (urPairs pairs ++ [Step.R]) = Step.R := by
  induction pairs with
  | zero => rfl
  | succ pairs ih =>
      simp only [urPairs, List.cons_append, LatticePathOrders.lastAfter]
      exact ih

theorem initialLevelPath_adjacencyBlocks
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    adjacencyBlocks (initialLevelPath n r) =
      [E] ++ List.replicate (2 * r) D ++ [E] ++
        List.replicate (2 * n - 2 * r - 5) D ++ [E] := by
  unfold initialLevelPath
  rw [show [Step.R, Step.R] ++ urPairs r ++ [Step.R] ++
      urPairs (n - r - 3) ++ [Step.U, Step.U] =
    Step.R :: Step.R ::
      (urPairs r ++ [Step.R] ++ urPairs (n - r - 3) ++ [Step.U, Step.U]) by
    simp [List.append_assoc]]
  rw [adjacencyBlocks_cons]
  simp only [edgeBlocks, edgeBlock, if_pos rfl]
  rw [show urPairs r ++ [Step.R] ++ urPairs (n - r - 3) ++ [Step.U, Step.U] =
      (urPairs r ++ [Step.R]) ++ (urPairs (n - r - 3) ++ [Step.U, Step.U]) by
    simp [List.append_assoc]]
  rw [edgeBlocks_append, edgeBlocks_R_urPairs_R,
    lastAfter_R_urPairs_R, edgeBlocks_R_urPairs_UU]
  have hcount : 2 * (n - r - 3) + 1 = 2 * n - 2 * r - 5 := by omega
  rw [hcount]
  simp [List.append_assoc]

theorem initialLevelPath_score
    {n r : Nat} (hn : 4 ≤ n) (hr : r ≤ n - 3) :
    sourceMatchingNumber (initialLevelPath n r) =
      pell (2 * n - 1) + pellF (2 * n - 3) (2 * r + 1) := by
  rw [sourceMatchingNumber_eq_matchingScore]
  unfold matchingScore
  rw [initialLevelPath_adjacencyBlocks hn hr]
  have hlength :
      1 + 2 * r + 1 + (2 * n - 2 * r - 5) + 1 + 0 = 2 * n - 2 := by
    omega
  have hproduct := threeE_decomposition_product hlength
  simp only [List.replicate_zero, List.append_nil] at hproduct
  rw [hproduct]
  rw [three_E_formula (by omega) (by omega) (by omega)]
  have hbase : 2 * n - 2 + 1 = 2 * n - 1 := by omega
  have hN : 2 * n - 2 - 1 = 2 * n - 3 := by omega
  rw [hbase, hN]
  unfold pellF threeEInteraction
  have hj : 2 * r + (2 * n - 2 * r - 5) + 2 = 2 * n - 3 := by omega
  rw [hj]
  have htail : 2 * n - 2 - 1 - (2 * n - 3) = 0 := by omega
  rw [htail]
  simp

@[simp] theorem initialLevelPath_zero {n : Nat} (hn : 4 ≤ n) :
    initialLevelPath n 0 = nonlocalX n := by
  unfold initialLevelPath nonlocalX
  have hindex : n - 0 - 3 = n - 3 := by omega
  rw [hindex]
  rfl

end LatticePathOrdersKernel
