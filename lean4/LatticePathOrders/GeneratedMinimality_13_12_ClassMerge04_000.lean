import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge03_000
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge03_001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge04_000 : ClassTable := .node classMerge03_000 classMerge03_001

theorem classMerge04_000_valid : ClassTableValid classMerge04_000 := by
  unfold classMerge04_000
  simp only [ClassTableValid]
  exact ⟨classMerge03_000_valid, classMerge03_001_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
