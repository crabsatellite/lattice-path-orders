import LatticePathOrdersKernel.LagrangeBridge
import LatticePathOrdersKernel.LiteralBandGraph

set_option maxRecDepth 10000

/-!
# The two paths for Problem 6.3
-/

namespace LatticePathOrdersKernel

open LatticePathOrders

@[reducible] def problem63Left : Path :=
  [.R, .R, .R, .R, .R, .R, .U, .R, .R, .U, .R, .R, .U,
   .U, .R, .U, .R, .R, .U, .R, .R, .R, .U, .U, .R, .U]

@[reducible] def problem63Right : Path :=
  [.R, .R, .R, .R, .R, .R, .U, .R, .U, .U, .R, .U, .R,
   .R, .U, .R, .R, .R, .U, .R, .R, .U, .R, .R, .U, .U]

theorem problem63Left_mem : Carrier 17 9 problem63Left := by
  decide

theorem problem63Right_mem : Carrier 17 9 problem63Right := by
  decide

theorem problem63Left_numerator :
    lagrangeNumerator problem63Left = 401364347302339644605 := by
  decide

theorem problem63Right_numerator :
    lagrangeNumerator problem63Right = 401364347302339644605 := by
  decide

theorem problem63Left_qMin :
    qMin (cyclicDigits problem63Left) = 6262579207 := by
  decide

theorem problem63Right_qMin :
    qMin (cyclicDigits problem63Right) = 6262579207 := by
  decide

theorem problem63_exact_lagrangeSq :
    lagrangeSq problem63Left = lagrangeSq problem63Right := by
  simp only [lagrangeSq, problem63Left_numerator, problem63Right_numerator,
    problem63Left_qMin, problem63Right_qMin]

theorem problem63_sourceLagrange_equal :
    sourceLagrangeValue problem63Left = sourceLagrangeValue problem63Right := by
  have hsqLeft := sourceLagrangeValue_sq_eq_lagrangeSq
    (a := 17) (b := 9) (by decide) (by decide) problem63Left_mem
  have hsqRight := sourceLagrangeValue_sq_eq_lagrangeSq
    (a := 17) (b := 9) (by decide) (by decide) problem63Right_mem
  have hposLeft := sourceLagrangeValue_pos problem63Left
  have hposRight := sourceLagrangeValue_pos problem63Right
  rw [problem63_exact_lagrangeSq] at hsqLeft
  nlinarith

end LatticePathOrdersKernel
