import LatticePathOrders.GeneratedMinimality_4_3_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_4_3

def region_0000 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2 true 5)))))) (some (.node (some (.node none (some (.leaf 2 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1 false 0)))))) (some (.node (some (.node none (some (.leaf 0 false 0)))) none)))) none)))) none)

theorem region_0000_check :
    AssignmentTree.check 4 3 classes 6 (mustParsePath "R") region_0000 = true := by
  unfold region_0000
  rfl

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "R", 6, region_0000)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 7 ∧
      region.2.2.check 4 3 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0000_check⟩

end LatticePathOrders.GeneratedMinimality_4_3
