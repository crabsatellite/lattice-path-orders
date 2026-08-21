import LatticePathOrders.GeneratedMinimality_22_3_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_22_3

def region_0004 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 43 false 0)))))) (some (.node (some (.node none (some (.leaf 32 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 23 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 15 false 0)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 9 false 0)))) none)) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 4 false 0)))) none)) none)) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 1 false 0)))) none)) none)) none)) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)) none)) none)) none)) none)))) none)) none)) none)) none)) none)) none)) none)

theorem region_0004_check :
    AssignmentTree.check 22 3 classes 16 (mustParsePath "RRRRRRRRU") region_0004 = true := by
  unfold region_0004
  rfl

def regionsPart001 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRRRRRU", 16, region_0004)
]

theorem regionsPart001_valid : ∀ region ∈ regionsPart001,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 22 3 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart001, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0004_check⟩

end LatticePathOrders.GeneratedMinimality_22_3
