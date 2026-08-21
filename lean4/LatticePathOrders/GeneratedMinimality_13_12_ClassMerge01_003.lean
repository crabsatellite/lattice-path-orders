import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_006
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_007

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge01_003 : ClassTable := .node classMerge00_006 classMerge00_007

theorem classMerge01_003_valid : ClassTableValid classMerge01_003 := by
  unfold classMerge01_003
  simp only [ClassTableValid]
  exact ⟨classMerge00_006_valid, classMerge00_007_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
