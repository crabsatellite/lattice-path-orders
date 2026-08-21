import LatticePathOrdersKernel.Matching1312Data

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def matching1312OutsideAt (p : Path) : Bool :=
  decide (matchingUpper p (25 - p.length) ≤ matchingScore matching1312Lower ∨
    matchingScore matching1312Upper ≤ matchingLower p (25 - p.length))

def matching1312OutsideCheck : Bool :=
  matching1312Frontier.all matching1312OutsideAt

theorem matching1312_outside_check : matching1312OutsideCheck = true := by
  decide

theorem matching1312_outside : ∀ p ∈ matching1312Frontier,
    matchingUpper p (25 - p.length) ≤ matchingScore matching1312Lower ∨
      matchingScore matching1312Upper ≤ matchingLower p (25 - p.length) := by
  intro p hp
  have h := List.all_eq_true.mp matching1312_outside_check p hp
  exact of_decide_eq_true h

end LatticePathOrdersKernel
