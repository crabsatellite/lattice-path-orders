import LatticePathOrdersClassical.MatchingParityMatrix
import LatticePathOrdersKernel.MatchingBridge
import LatticePathOrders.MatchingBounds

/-!
# Endpoint parity of the literal matching number

The matrix normal form is proved for every nonempty binary step word.  The
rational-Dyck theorem is its specialization to a word starting in `R` and
ending in `U`.
-/

namespace LatticePathOrdersKernel

set_option maxHeartbeats 1000000

open LatticePathOrders
open LatticePathOrdersClassical
open LatticePathOrdersClassical.F2Matrix

def sameStepCount : Step → Path → Nat
  | .R, word => Path.countR word
  | .U, word => Path.countU word

def oppositeStepCount : Step → Path → Nat
  | .R, word => Path.countU word
  | .U, word => Path.countR word

@[simp] theorem sameStepCount_cons_same (step : Step) (word : Path) :
    sameStepCount step (step :: word) = sameStepCount step word + 1 := by
  cases step <;> simp [sameStepCount, Path.countR, Path.countU]

@[simp] theorem oppositeStepCount_cons_same (step : Step) (word : Path) :
    oppositeStepCount step (step :: word) = oppositeStepCount step word := by
  cases step <;> simp [oppositeStepCount, Path.countR, Path.countU]

@[simp] theorem sameStepCount_cons_other {first next : Step}
    (hne : first ≠ next) (word : Path) :
    sameStepCount first (next :: word) = sameStepCount first word := by
  cases first <;> cases next <;> simp_all [sameStepCount, Path.countR, Path.countU]

@[simp] theorem oppositeStepCount_cons_other {first next : Step}
    (hne : first ≠ next) (word : Path) :
    oppositeStepCount first (next :: word) =
      oppositeStepCount first word + 1 := by
  cases first <;> cases next <;>
    simp_all [oppositeStepCount, Path.countR, Path.countU]

theorem sameStepCount_eq_oppositeStepCount_of_ne {first next : Step}
    (hne : first ≠ next) (word : Path) :
    sameStepCount first word = oppositeStepCount next word := by
  cases first <;> cases next <;> simp_all [sameStepCount, oppositeStepCount]

theorem oppositeStepCount_eq_sameStepCount_of_ne {first next : Step}
    (hne : first ≠ next) (word : Path) :
    oppositeStepCount first word = sameStepCount next word := by
  cases first <;> cases next <;> simp_all [sameStepCount, oppositeStepCount]

def parityExponent (first last : Step) (word : Path) : Nat :=
  oppositeStepCount first word + 2 * sameStepCount first word +
    (if last = first then 1 else 0)

def parityNormalMatrix (first last : Step) (word : Path) : F2Matrix :=
  if last = first then fPow (parityExponent first last word)
  else fPow (parityExponent first last word) * S

theorem ofNatMatrix_foldl (blocks : List Mat2) (accumulator : Mat2) :
    ofNatMatrix (blocks.foldl (fun product block => product * block) accumulator) =
      blocks.foldl (fun product block => product * ofNatMatrix block)
        (ofNatMatrix accumulator) := by
  induction blocks generalizing accumulator with
  | nil => rfl
  | cons block blocks ih =>
      simp only [List.foldl_cons]
      rw [ih, ofNatMatrix_mul]

theorem ofNatMatrix_matrixProduct (blocks : List Mat2) :
    ofNatMatrix (matrixProduct blocks) =
      blocks.foldl (fun product block => product * ofNatMatrix block) 1 := by
  unfold matrixProduct
  rw [ofNatMatrix_foldl]
  exact congrArg (fun initial =>
    blocks.foldl (fun product block => product * ofNatMatrix block) initial)
      ofNatMatrix_one

theorem ofNatMatrix_edgeBlock (left right : Step) :
    ofNatMatrix (edgeBlock left right) =
      if left = right then F * F else S := by
  cases left <;> cases right <;> decide

theorem fPow_shift_two {full base : Nat}
    (hmod : full % 3 = (2 + base) % 3) :
    fPow full = (F * F) * fPow base := by
  rw [fPow_eq_of_mod_eq hmod, fPow_add]
  rfl

theorem fPow_neg {full base : Nat}
    (hmod : full % 3 = (3 - (base % 3)) % 3) :
    fPow full = S * fPow base * S := by
  rw [S_mul_fPow_mul_S]
  exact fPow_eq_of_mod_eq hmod

theorem fPow_neg_mul_S {full base : Nat}
    (hmod : full % 3 = (3 - (base % 3)) % 3) :
    fPow full * S = S * fPow base := by
  rw [S_mul_fPow]
  apply congrArg (fun matrix => matrix * S)
  exact fPow_eq_of_mod_eq hmod

theorem parityNormalMatrix_same_cons (first : Step) (tail : Path) :
    parityNormalMatrix first (lastAfter first tail) (first :: first :: tail) =
      (F * F) * parityNormalMatrix first (lastAfter first tail) (first :: tail) := by
  cases first <;> cases hlast : lastAfter _ tail
  · unfold parityNormalMatrix parityExponent
    simp only [if_pos rfl, sameStepCount_cons_same,
      oppositeStepCount_cons_same, Nat.add_assoc]
    apply fPow_shift_two
    omega
  · unfold parityNormalMatrix parityExponent
    simp only [if_neg (show Step.U ≠ Step.R by decide), sameStepCount_cons_same,
      oppositeStepCount_cons_same, Nat.add_assoc]
    rw [← mul_assoc]
    apply congrArg (fun matrix => matrix * S)
    apply fPow_shift_two
    omega
  · unfold parityNormalMatrix parityExponent
    simp only [if_neg (show Step.R ≠ Step.U by decide), sameStepCount_cons_same,
      oppositeStepCount_cons_same, Nat.add_assoc]
    rw [← mul_assoc]
    apply congrArg (fun matrix => matrix * S)
    apply fPow_shift_two
    omega
  · unfold parityNormalMatrix parityExponent
    simp only [if_pos rfl, sameStepCount_cons_same,
      oppositeStepCount_cons_same, Nat.add_assoc]
    apply fPow_shift_two
    omega

theorem parityNormalMatrix_change_cons (first next : Step) (tail : Path)
    (hne : first ≠ next) :
    parityNormalMatrix first (lastAfter next tail) (first :: next :: tail) =
      S * parityNormalMatrix next (lastAfter next tail) (next :: tail) := by
  cases first <;> cases next <;> try contradiction
  · cases hlast : lastAfter Step.U tail
    · unfold parityNormalMatrix parityExponent
      simp [sameStepCount, oppositeStepCount, Path.countR, Path.countU]
      rw [← mul_assoc]
      apply fPow_neg
      omega
    · unfold parityNormalMatrix parityExponent
      simp [sameStepCount, oppositeStepCount, Path.countR, Path.countU]
      apply fPow_neg_mul_S
      omega
  · cases hlast : lastAfter Step.R tail
    · unfold parityNormalMatrix parityExponent
      simp [sameStepCount, oppositeStepCount, Path.countR, Path.countU]
      apply fPow_neg_mul_S
      omega
    · unfold parityNormalMatrix parityExponent
      simp [sameStepCount, oppositeStepCount, Path.countR, Path.countU]
      rw [← mul_assoc]
      apply fPow_neg
      omega

theorem matrixProduct_cons (block : Mat2) (blocks : List Mat2) :
    matrixProduct (block :: blocks) = block * matrixProduct blocks := by
  rw [show block :: blocks = [block] ++ blocks by rfl,
    matrixProduct_append]
  have hsingle : matrixProduct [block] = block := by
    unfold matrixProduct
    simp only [List.foldl_cons, List.foldl_nil]
    exact Mat2.one_mul block
  rw [hsingle]

theorem adjacency_parity_normal : ∀ (first : Step) (tail : Path),
    ofNatMatrix (matrixProduct (adjacencyBlocks (first :: tail))) =
      parityNormalMatrix first (lastAfter first tail) (first :: tail)
  | first, [] => by
      cases first <;> decide
  | first, next :: tail => by
      rw [adjacencyBlocks_cons]
      simp only [edgeBlocks]
      rw [matrixProduct_cons]
      rw [ofNatMatrix_mul, ofNatMatrix_edgeBlock]
      rw [← adjacencyBlocks_cons]
      rw [adjacency_parity_normal next tail]
      by_cases h : first = next
      · subst next
        rw [if_pos rfl]
        exact (parityNormalMatrix_same_cons first tail).symm
      · rw [if_neg h]
        exact (parityNormalMatrix_change_cons first next tail h).symm

theorem matchingScore_mod_two_eq_parity_a11 (word : Path) :
    ((matchingScore word : Nat) : F2) =
      (ofNatMatrix (matrixProduct (adjacencyBlocks word))).a11 := by
  rfl

theorem matching_parity_normal_form {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {word : Path} (hword : Carrier a b word) :
    ofNatMatrix (matrixProduct (adjacencyBlocks word)) =
      fPow (b + 2 * a) * S := by
  have hstart := carrier_starts_R ha hword
  rcases hstart with ⟨tail, htail⟩
  simp only [List.singleton_append] at htail
  subst word
  have hlast : lastAfter Step.R tail = Step.U := by
    have hget := getLast?_eq_lastAfter Step.R tail
    rcases carrier_ends_U ha hb hword with ⟨pfx, hend⟩
    rw [hend] at hget
    simp at hget
    exact hget.symm
  rw [adjacency_parity_normal, hlast]
  unfold parityNormalMatrix parityExponent sameStepCount oppositeStepCount
  have hcounts := carrier_components hword
  simp [hcounts.1, hcounts.2.1]

theorem fPow_mul_S_a11_eq_zero_iff (exponent : Nat) :
    (fPow exponent * S).a11 = 0 ↔ exponent % 3 = 0 := by
  have h : exponent % 3 = 0 ∨ exponent % 3 = 1 ∨ exponent % 3 = 2 := by omega
  rcases h with h | h | h
  · have heq : fPow exponent = fPow 0 :=
      fPow_eq_of_mod_eq (by simpa using h)
    rw [heq, h]
    decide
  · have heq : fPow exponent = fPow 1 :=
      fPow_eq_of_mod_eq (by simpa using h)
    rw [heq, h]
    decide
  · have heq : fPow exponent = fPow 2 :=
      fPow_eq_of_mod_eq (by simpa using h)
    rw [heq, h]
    decide

theorem matchingScore_even_iff_three_dvd_difference
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    {word : Path} (hword : Carrier a b word) :
    Even (sourceMatchingNumber word) ↔ 3 ∣ a - b := by
  rw [sourceMatchingNumber_eq_matchingScore]
  have hnormal := matching_parity_normal_form ha hb hword
  have hcast := congrArg F2Matrix.a11 hnormal
  rw [← matchingScore_mod_two_eq_parity_a11] at hcast
  rw [← ZMod.natCast_eq_zero_iff_even, hcast,
    fPow_mul_S_a11_eq_zero_iff, Nat.dvd_iff_mod_eq_zero]
  omega

/-- Manuscript Corollary `cor:unit-gap`: the endpoint parity theorem excludes
every possible score strictly between two realized matching scores differing
by two.  This is stated for the literal snake-graph perfect-matching count. -/
theorem sourceMatchingNumber_unit_gap_cover
    {a b : Nat} (ha : 0 < a) (hb : 0 < b) (hab : b < a)
    {x y : Path} (hx : Carrier a b x) (hy : Carrier a b y)
    (hgap : sourceMatchingNumber y = sourceMatchingNumber x + 2) :
    PullbackCover (Carrier a b) sourceMatchingNumber x y := by
  refine ⟨hx, hy, by omega, ?_⟩
  intro z hz hbetween
  have hparX := matchingScore_even_iff_three_dvd_difference ha hb hab hx
  have hparZ := matchingScore_even_iff_three_dvd_difference ha hb hab hz
  have hmiddle : sourceMatchingNumber z = sourceMatchingNumber x + 1 := by
    omega
  by_cases hdiv : 3 ∣ a - b
  · rcases hparX.mpr hdiv with ⟨kx, hkx⟩
    rcases hparZ.mpr hdiv with ⟨kz, hkz⟩
    omega
  · have hoddX : Odd (sourceMatchingNumber x) :=
      Nat.not_even_iff_odd.mp (fun heven => hdiv (hparX.mp heven))
    have hoddZ : Odd (sourceMatchingNumber z) :=
      Nat.not_even_iff_odd.mp (fun heven => hdiv (hparZ.mp heven))
    rcases hoddX with ⟨kx, hkx⟩
    rcases hoddZ with ⟨kz, hkz⟩
    omega

end LatticePathOrdersKernel
