import LatticePathOrders.GeneratedMinimality_17_7_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_7

def region_0384 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6020 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2915 false 0)))))) (some (.node (some (.node none (some (.leaf 4311 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1437 false 0)))))) (some (.node (some (.node none (some (.leaf 443 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 2739 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1331 false 0)))))) (some (.node (some (.node none (some (.leaf 75 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 189 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1693 false 0)))))) (some (.node (some (.node none (some (.leaf 62 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)))) none)) none)))) none)) none)) none)

theorem region_0384_check :
    AssignmentTree.check 17 7 classes 10 (mustParsePath "RRRURRURRRURRU") region_0384 = true := by
  unfold region_0384
  rfl

def regionsPart096 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRURRRURRU", 10, region_0384)
]

theorem regionsPart096_valid : ∀ region ∈ regionsPart096,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 17 7 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart096, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0384_check⟩

end LatticePathOrders.GeneratedMinimality_17_7
