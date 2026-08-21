import LatticePathOrders.GeneratedMinimality_17_5_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_5

def region_0040 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 575 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 460 false 0)))))) (some (.node (some (.node none (some (.leaf 504 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 367 false 0)))))) (some (.node (some (.node none (some (.leaf 175 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 411 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 245 false 0)))))) (some (.node (some (.node none (some (.leaf 68 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 138 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 342 false 0)))) none)) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 240 false 0)))))) (some (.node (some (.node none (some (.leaf 62 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 29 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 106 false 0)))) none)) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 259 false 0)))))) (some (.node (some (.node none (some (.leaf 59 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 7 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 16 false 0)))) none)) none)) none)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 297 false 0)))))) (some (.node (some (.node none (some (.leaf 79 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 6 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)))) none)) none)) none)))) none)) none)) none)) none)

theorem region_0040_check :
    AssignmentTree.check 17 5 classes 13 (mustParsePath "RRRRURRRU") region_0040 = true := by
  unfold region_0040
  rfl

def regionsPart010 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRRU", 13, region_0040)
]

theorem regionsPart010_valid : ∀ region ∈ regionsPart010,
    region.1.length + region.2.1 = 22 ∧
      region.2.2.check 17 5 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart010, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0040_check⟩

end LatticePathOrders.GeneratedMinimality_17_5
