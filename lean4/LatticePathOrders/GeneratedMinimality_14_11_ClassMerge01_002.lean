import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge00_004
import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge00_005

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge01_002 : ClassTable := .node classMerge00_004 classMerge00_005

theorem classMerge01_002_valid : ClassTableValid classMerge01_002 := by
  unfold classMerge01_002
  simp only [ClassTableValid]
  exact ⟨classMerge00_004_valid, classMerge00_005_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
