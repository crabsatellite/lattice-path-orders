import LatticePathOrders.GeneratedMinimality_19_1_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_1

def region_0000 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)) none)

theorem region_0000_check :
    AssignmentTree.check 19 1 classes 19 (mustParsePath "R") region_0000 = true := by
  unfold region_0000
  rfl

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "R", 19, region_0000)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 20 ∧
      region.2.2.check 19 1 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0000_check⟩

end LatticePathOrders.GeneratedMinimality_19_1
