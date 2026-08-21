import LatticePathOrdersKernel.Matching1312Data

namespace LatticePathOrdersKernel
open LatticePathOrders
set_option maxRecDepth 100000

def matching1312NonemptyCheck : Bool :=
  matching1312Frontier.all fun p => !p.isEmpty

theorem matching1312_nonempty_check : matching1312NonemptyCheck = true := by
  decide

theorem matching1312_nonempty : ∀ p ∈ matching1312Frontier, p ≠ [] := by
  intro p hp
  have h := List.all_eq_true.mp matching1312_nonempty_check p hp
  cases p <;> simp at h ⊢

end LatticePathOrdersKernel
