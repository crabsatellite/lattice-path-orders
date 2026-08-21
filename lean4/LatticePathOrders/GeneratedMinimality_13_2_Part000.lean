import LatticePathOrders.GeneratedMinimality_13_2_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_2

def region_0000 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6 false 0)))))) (some (.node (some (.node none (some (.leaf 5 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 4 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 3 false 0)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 2 false 0)))) none)) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 1 false 0)))) none)) none)) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)) none)) none)) none)))) none)) none)) none)) none)) none)) none)

theorem region_0000_check :
    AssignmentTree.check 13 2 classes 14 (mustParsePath "R") region_0000 = true := by
  unfold region_0000
  rfl

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "R", 14, region_0000)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 15 ∧
      region.2.2.check 13 2 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0000_check⟩

end LatticePathOrders.GeneratedMinimality_13_2
