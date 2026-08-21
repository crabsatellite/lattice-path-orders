import LatticePathOrders.GeneratedMinimality_19_6_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_6

def region_0224 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3253 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2438 false 0)))))) (some (.node (some (.node none (some (.leaf 2721 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1798 false 0)))))) (some (.node (some (.node none (some (.leaf 646 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 2060 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1157 false 0)))))) (some (.node (some (.node none (some (.leaf 228 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 459 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 1625 false 0)))) none)) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1120 false 0)))))) (some (.node (some (.node none (some (.leaf 200 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 43 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 283 false 0)))) none)) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1236 false 0)))))) (some (.node (some (.node none (some (.leaf 186 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 14 true 9)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 14 false 0)))) none)) none)) none)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1423 false 0)))))) (some (.node (some (.node none (some (.leaf 264 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 11 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)))) none)) none)) none)))) none)) none)) none)

theorem region_0224_check :
    AssignmentTree.check 19 6 classes 12 (mustParsePath "RRRRURRRURRRU") region_0224 = true := by
  unfold region_0224
  rfl

def regionsPart056 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRURRRURRRU", 12, region_0224)
]

theorem regionsPart056_valid : ∀ region ∈ regionsPart056,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 19 6 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart056, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0224_check⟩

end LatticePathOrders.GeneratedMinimality_19_6
