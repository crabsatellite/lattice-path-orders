import LatticePathOrdersKernel.OperationalBestFirstTree
import Mathlib.Data.Prod.Lex

namespace LatticePathOrdersKernel

open LatticePathOrders

def bestFirstPriority {alpha : Type*} [LinearOrder alpha]
    (key : Path → alpha) (total : Nat) (pfx : Path) : alpha ×ₗ Bool :=
  toLex (key pfx, decide (pfx.length = total))

theorem bestFirstChoice_exists
    {alpha : Type*} [LinearOrder alpha] (key : Path → alpha)
    (total : Nat) {frontier : Finset Path} (hnonempty : frontier.Nonempty) :
    ∃ selected, BestFirstChoice key total frontier selected := by
  rcases Finset.exists_min_image frontier (bestFirstPriority key total)
      hnonempty with ⟨selected, hselected, hminimum⟩
  refine ⟨selected, hselected, ?_, ?_⟩
  · intro pfx hpfx
    have hpriority := hminimum pfx hpfx
    by_contra hnot
    have hlt : key pfx < key selected := lt_of_not_ge hnot
    have hpLt : bestFirstPriority key total pfx <
        bestFirstPriority key total selected := by
      exact Prod.Lex.toLex_lt_toLex.mpr (Or.inl hlt)
    exact (not_lt_of_ge hpriority) hpLt
  · intro hselectedLeaf pfx hpfx hpfxNonleaf
    have hpriority := hminimum pfx hpfx
    by_contra hnot
    have hle : key pfx ≤ key selected := le_of_not_gt hnot
    rcases hle.eq_or_lt with heq | hlt
    · have hpLt : bestFirstPriority key total pfx <
          bestFirstPriority key total selected := by
        apply Prod.Lex.toLex_lt_toLex.mpr
        exact Or.inr ⟨heq, by
          simp [hselectedLeaf, ne_of_lt hpfxNonleaf]⟩
      exact (not_lt_of_ge hpriority) hpLt
    · have hpLt : bestFirstPriority key total pfx <
          bestFirstPriority key total selected := by
        exact Prod.Lex.toLex_lt_toLex.mpr (Or.inl hlt)
      exact (not_lt_of_ge hpriority) hpLt

end LatticePathOrdersKernel
