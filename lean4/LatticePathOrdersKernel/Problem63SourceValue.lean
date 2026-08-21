import LatticePathOrdersKernel.Problem63Root

/-!
# Literal source-value endpoint for the counterexample

This is the manuscript's displayed equation for `L(omega)^2`, stated for the
real periodic-continued-fraction value rather than only for the cached
rational comparison score.
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

theorem problem63_sourceLagrangeValue_sq_exact :
    sourceLagrangeValue problem63Left ^ 2 =
        (((401364347302339644605 : Rat) /
          39219898323948748849 : Rat) : Real) ∧
      sourceLagrangeValue problem63Right ^ 2 =
        (((401364347302339644605 : Rat) /
          39219898323948748849 : Rat) : Real) := by
  constructor
  · rw [sourceLagrangeValue_sq_eq_lagrangeSq (by decide) (by decide)
      problem63Left_mem]
    norm_num [lagrangeSq, problem63Left_numerator, problem63Left_qMin]
  · rw [sourceLagrangeValue_sq_eq_lagrangeSq (by decide) (by decide)
      problem63Right_mem]
    norm_num [lagrangeSq, problem63Right_numerator, problem63Right_qMin]

end LatticePathOrdersKernel
