import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge00_008
import LatticePathOrders.GeneratedMinimality_14_11_ClassMerge00_009

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_11

def classMerge01_004 : ClassTable := .node classMerge00_008 classMerge00_009

theorem classMerge01_004_valid : ClassTableValid classMerge01_004 := by
  unfold classMerge01_004
  simp only [ClassTableValid]
  exact ⟨classMerge00_008_valid, classMerge00_009_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_14_11
