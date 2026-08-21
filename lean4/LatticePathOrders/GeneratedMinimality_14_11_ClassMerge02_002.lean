import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge01_004
import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge00_010

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge02_002 : ClassTable := .node classMerge01_004 classMerge00_010

theorem classMerge02_002_valid : ClassTableValid classMerge02_002 := by
  unfold classMerge02_002
  simp only [ClassTableValid]
  exact ⟨classMerge01_004_valid, classMerge00_010_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
