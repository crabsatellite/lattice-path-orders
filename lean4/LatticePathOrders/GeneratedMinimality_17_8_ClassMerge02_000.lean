import LatticePathOrders.GeneratedMinimality_17_8_ClassMerge01_000
import LatticePathOrders.GeneratedMinimality_17_8_ClassMerge00_002

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_8

def classMerge02_000 : ClassTable := .node classMerge01_000 classMerge00_002

theorem classMerge02_000_valid : ClassTableValid classMerge02_000 := by
  unfold classMerge02_000
  simp only [ClassTableValid]
  exact ⟨classMerge01_000_valid, classMerge00_002_valid, by decide⟩

end LatticePathOrders.GeneratedMinimality_17_8
