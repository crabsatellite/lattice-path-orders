import LatticePathOrders.GeneratedMinimality_14_5_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_5

def region_0016 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 293 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 200 false 0)))))) (some (.node (some (.node none (some (.leaf 239 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 108 false 0)))))) (some (.node (some (.node none (some (.leaf 62 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 180 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 101 false 0)))))) (some (.node (some (.node none (some (.leaf 18 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 30 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 118 false 0)))))) (some (.node (some (.node none (some (.leaf 14 true 4)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 1 false 0)))) none)) none)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 145 false 0)))))) (some (.node (some (.node none (some (.leaf 25 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 3 false 0)))) none)) none)))) none)) none)) none)))) none)) none)

theorem region_0016_check :
    AssignmentTree.check 14 5 classes 10 (mustParsePath "RRRURRRRU") region_0016 = true := by
  unfold region_0016
  rfl

def region_0017 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 294 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 199 false 0)))))) (some (.node (some (.node none (some (.leaf 246 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 107 false 0)))))) (some (.node (some (.node none (some (.leaf 66 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 186 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 102 false 0)))))) (some (.node (some (.node none (some (.leaf 17 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 45 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 119 false 0)))))) (some (.node (some (.node none (some (.leaf 14 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 5 false 0)))) none)) none)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 147 false 0)))))) (some (.node (some (.node none (some (.leaf 26 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)))) none)) none)) none)))) none)) none)) none)

theorem region_0017_check :
    AssignmentTree.check 14 5 classes 11 (mustParsePath "RRRURRRU") region_0017 = true := by
  unfold region_0017
  rfl

def regionsPart004 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRRRU", 10, region_0016),
  (mustParsePath "RRRURRRU", 11, region_0017)
]

theorem regionsPart004_valid : ∀ region ∈ regionsPart004,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 14 5 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart004, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl
  · exact ⟨by decide, region_0016_check⟩
  · exact ⟨by decide, region_0017_check⟩

end LatticePathOrders.GeneratedMinimality_14_5
