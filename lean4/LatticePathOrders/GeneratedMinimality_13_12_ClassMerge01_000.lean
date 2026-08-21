import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_000
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge01_000 : ClassTable := .node classMerge00_000 classMerge00_001

theorem classMerge01_000_valid : ClassTableValid classMerge01_000 := by
  unfold classMerge01_000
  simp only [ClassTableValid]
  exact ⟨classMerge00_000_valid, classMerge00_001_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
