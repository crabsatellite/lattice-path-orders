import LatticePathOrders.GeneratedMinimality_13_4_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_4

def region_0004 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 79 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 68 false 0)))))) (some (.node (some (.node none (some (.leaf 72 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 58 false 0)))))) (some (.node (some (.node none (some (.leaf 31 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 62 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 41 false 0)))))) (some (.node (some (.node none (some (.leaf 15 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 26 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 54 false 0)))) none)) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 40 false 0)))))) (some (.node (some (.node none (some (.leaf 14 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 6 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 18 false 0)))) none)) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 43 false 0)))))) (some (.node (some (.node none (some (.leaf 13 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 3 true 9)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 3 false 0)))) none)) none)) none)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 49 false 0)))))) (some (.node (some (.node none (some (.leaf 17 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 2 false 0)))) none)) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)) none)))) none)) none)) none)))) none)) none)) none)

theorem region_0004_check :
    AssignmentTree.check 13 4 classes 12 (mustParsePath "RRRRU") region_0004 = true := by
  unfold region_0004
  rfl

def regionsPart001 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRRU", 12, region_0004)
]

theorem regionsPart001_valid : ∀ region ∈ regionsPart001,
    region.1.length + region.2.1 = 17 ∧
      region.2.2.check 13 4 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart001, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_0004_check⟩

end LatticePathOrders.GeneratedMinimality_13_4
