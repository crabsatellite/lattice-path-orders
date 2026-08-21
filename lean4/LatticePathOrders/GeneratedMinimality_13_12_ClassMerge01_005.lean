import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_010
import LatticePathOrders.GeneratedMinimality_13_12_ClassMerge00_011

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def classMerge01_005 : ClassTable := .node classMerge00_010 classMerge00_011

theorem classMerge01_005_valid : ClassTableValid classMerge01_005 := by
  unfold classMerge01_005
  simp only [ClassTableValid]
  exact ⟨classMerge00_010_valid, classMerge00_011_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_13_12
