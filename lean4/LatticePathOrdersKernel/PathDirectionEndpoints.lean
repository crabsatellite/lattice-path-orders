import LatticePathOrdersKernel.TileCycleRigidity
import LatticePathOrdersKernel.PathBand
import LatticePathOrdersKernel.PathDomain

namespace LatticePathOrdersKernel

open LatticePathOrders
open LatticePathOrdersClassical

theorem pathDirections_zero_of_starts_R
    {n : Nat} [NeZero n] {word : Path} (hstart : IsPrefix [Step.R] word) :
    pathDirections n word 0 = .right := by
  rcases hstart with ⟨tail, hword⟩
  simp only [List.singleton_append] at hword
  subst word
  simp [pathDirections, directionOfStep]

theorem pathDirections_neg_one_of_ends_U
    {n : Nat} [NeZero n] [Fact (1 < n)] {word : Path}
    (hlength : word.length = n)
    (hend : ∃ pfx, word = pfx ++ [Step.U]) :
    pathDirections n word (-1) = .up := by
  rcases hend with ⟨pfx, hword⟩
  subst word
  have hpfxLength : pfx.length + 1 = n := by
    simpa using hlength
  have hval : ((-1 : ZMod n).val) = n - 1 := by
    simpa using (val_neg_sub_one (n := n) (0 : ZMod n))
  have hindex : n - 1 = pfx.length := by omega
  unfold pathDirections
  rw [hval, hindex]
  simp [directionOfStep]

theorem carrier_pathDirections_has_turn
    {a b : Nat} (ha : 0 < a) (hb : 0 < b)
    {word : Path} (hword : Carrier a b word) :
    ∃ i : ZMod (a + b),
      pathDirections (a + b) word i ≠
        pathDirections (a + b) word (i + 1) := by
  letI : NeZero (a + b) := ⟨by omega⟩
  letI : Fact (1 < a + b) := ⟨by omega⟩
  refine ⟨-1, ?_⟩
  rw [pathDirections_neg_one_of_ends_U (carrier_length hword)
      (carrier_ends_U ha hb hword)]
  have hzero := pathDirections_zero_of_starts_R
    (n := a + b) (carrier_starts_R ha hword)
  have hnext : ((-1 : ZMod (a + b)) + 1) = 0 := by ring
  rw [hnext, hzero]
  decide

end LatticePathOrdersKernel
