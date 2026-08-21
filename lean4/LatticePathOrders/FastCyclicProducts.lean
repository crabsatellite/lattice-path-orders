import LatticePathOrders.MatrixScore

namespace LatticePathOrders

/-! A linear-work implementation of the literal cyclic product list. -/

theorem matrixProduct_append (xs ys : List Mat2) :
    matrixProduct (xs ++ ys) = matrixProduct xs * matrixProduct ys := by
  have foldl_mul : ∀ (zs : List Mat2) (acc : Mat2),
      zs.foldl (· * ·) acc = acc * zs.foldl (· * ·) 1 := by
    intro zs
    induction zs with
    | nil =>
        intro acc
        exact (Mat2.mul_one acc).symm
    | cons z zs ih =>
        intro acc
        simp only [List.foldl_cons]
        rw [ih (acc * z)]
        simp only [Mat2.one_mul]
        rw [ih z]
        exact Mat2.mul_assoc acc z (List.foldl (· * ·) 1 zs)
  simp only [matrixProduct, List.foldl_append]
  exact foldl_mul ys (List.foldl (· * ·) 1 xs)

def prefixDigitProducts (digits : List Nat) : List Mat2 :=
  (digits.map T).scanl (· * ·) 1

def suffixDigitProducts (digits : List Nat) : List Mat2 :=
  (digits.map T).scanr (· * ·) 1

/-- At position `k`, multiply the cached product of `drop k` by the cached
product of `take k`. -/
def cyclicProductsFast (digits : List Nat) : List Mat2 :=
  List.zipWith (· * ·) (suffixDigitProducts digits).dropLast
    (prefixDigitProducts digits).dropLast

theorem cyclicProductsFast_eq (digits : List Nat) :
    cyclicProductsFast digits = (rotations digits).map digitProduct := by
  apply List.ext_getElem
  · simp [cyclicProductsFast, prefixDigitProducts, suffixDigitProducts, rotations]
  · intro i hfast hslow
    have hi : i < digits.length := by
      simpa [cyclicProductsFast, prefixDigitProducts, suffixDigitProducts] using hfast
    simp only [cyclicProductsFast, List.getElem_zipWith, List.getElem_dropLast,
      suffixDigitProducts, prefixDigitProducts, List.getElem_scanr,
      List.getElem_scanl, rotations, List.getElem_map, List.getElem_range,
      digitProduct]
    rw [← List.map_drop, ← List.map_take]
    rw [List.foldr_eq_foldl]
    change matrixProduct (List.map T (List.drop i digits)) *
        matrixProduct (List.map T (List.take i digits)) = _
    rw [← matrixProduct_append]
    rw [List.rotate_eq_drop_append_take hi.le, List.map_append]

def lowerLeftValuesFast (digits : List Nat) : List Nat :=
  (cyclicProductsFast digits).map Mat2.a21

def qMinFast (digits : List Nat) : Nat :=
  (lowerLeftValuesFast digits).min?.getD 1

theorem lowerLeftValuesFast_eq (digits : List Nat) :
    lowerLeftValuesFast digits = lowerLeftValues digits := by
  simp only [lowerLeftValuesFast, lowerLeftValues, cyclicProductsFast_eq,
    List.map_map, Function.comp_def]

theorem qMinFast_eq (digits : List Nat) : qMinFast digits = qMin digits := by
  simp only [qMinFast, qMin, lowerLeftValuesFast_eq]

end LatticePathOrders
