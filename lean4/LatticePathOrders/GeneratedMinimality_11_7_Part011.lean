import LatticePathOrders.GeneratedMinimality_11_7_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_7

def region_0044 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 853 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 347 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 501 false 0)))))) (some (.node (some (.node none (some (.leaf 757 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 338 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 124 false 0)))))) (some (.node (some (.node none (some (.leaf 45 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 244 false 0)))))) (some (.node (some (.node none (some (.leaf 411 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 572 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 118 false 0)))))) (some (.node (some (.node none (some (.leaf 122 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 82 false 0)))))) (some (.node (some (.node none (some (.leaf 12 false 0)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 153 false 0)))))) (some (.node (some (.node none (some (.leaf 169 false 0)))) none)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 640 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 116 false 0)))))) (some (.node (some (.node none (some (.leaf 281 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 81 false 0)))))) (some (.node (some (.node none (some (.leaf 1 false 0)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 166 false 0)))))) (some (.node (some (.node none (some (.leaf 0 false 0)))) none)))) none)) none)))) none)))) none)) none)

theorem region_0044_check :
    AssignmentTree.check 11 7 classes 10 (mustParsePath "RRURRURU") region_0044 = true := by
  unfold region_0044
  rfl

def regionsPart011 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURU", 10, region_0044)
]

theorem regionsPart011_valid : ∀ region ∈ regionsPart011,
    region.1.length + region.2.1 = 18 ∧
      region.2.2.check 11 7 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart011, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0044_check⟩

end LatticePathOrders.GeneratedMinimality_11_7
