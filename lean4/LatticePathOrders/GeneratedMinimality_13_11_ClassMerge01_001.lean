import LatticePathOrders.GeneratedMinimality_13_11_ClassMerge00_002
import LatticePathOrders.GeneratedMinimality_13_11_ClassMerge00_003

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def classMerge01_001 : ClassTable := .node classMerge00_002 classMerge00_003

theorem classMerge01_001_valid : ClassTableValid classMerge01_001 := by
  unfold classMerge01_001
  simp only [ClassTableValid]
  exact ⟨classMerge00_002_valid, classMerge00_003_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_11
