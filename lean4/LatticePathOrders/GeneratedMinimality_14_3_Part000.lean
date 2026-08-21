import LatticePathOrders.GeneratedMinimality_14_3_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_3

def region_0000 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 23 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22 true 5)))))) (some (.node (some (.node none (some (.leaf 22 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 21 true 6)))))) (some (.node (some (.node none (some (.leaf 15 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 21 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 20 true 7)))))) (some (.node (some (.node none (some (.leaf 14 true 7)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 14 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 20 false 0)))) none)) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 19 true 8)))))) (some (.node (some (.node none (some (.leaf 13 true 8)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 9 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 13 false 0)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 19 false 0)))) none)) none)) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 18 true 3)))))) (some (.node (some (.node none (some (.leaf 12 true 9)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 8 true 9)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 8 false 0)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 12 false 0)))) none)) none)) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 17 true 3)))))) (some (.node (some (.node none (some (.leaf 11 true 4)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 7 true 10)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 4 false 0)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 7 false 0)))) none)) none)) none)) none)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 16 false 0)))))) (some (.node (some (.node none (some (.leaf 10 true 4)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 6 true 5)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 3 true 11)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 3 false 0)))) none)) none)) none)) none)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 17 false 0)))))) (some (.node (some (.node none (some (.leaf 10 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 5 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 2 true 6)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 1 false 0)))) none)) none)) none)) none)))) none)) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 18 false 0)))))) (some (.node (some (.node none (some (.leaf 11 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 6 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 2 false 0)))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)) none)))) none)) none)) none)) none)) none)))) none)) none)) none)) none)

theorem region_0000_check :
    AssignmentTree.check 14 3 classes 16 (mustParsePath "R") region_0000 = true := by
  unfold region_0000
  rfl

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "R", 16, region_0000)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 17 ∧
      region.2.2.check 14 3 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0000_check⟩

end LatticePathOrders.GeneratedMinimality_14_3
