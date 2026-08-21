import LatticePathOrders.GeneratedMinimality_12_5_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_5

def region_0008 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 192 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 158 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 153 false 0)))))) (some (.node (some (.node none (some (.leaf 185 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 157 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 120 false 0)))))) (some (.node (some (.node none (some (.leaf 40 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 117 false 0)))))) (some (.node (some (.node none (some (.leaf 147 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 177 false 0)))) none)) none)))))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 156 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 114 false 0)))))) (some (.node (some (.node none (some (.leaf 53 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 64 false 0)))))) (some (.node (some (.node none (some (.leaf 35 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 50 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 88 false 0)))))) (some (.node (some (.node none (some (.leaf 109 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 141 false 0)))) none)) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 160 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 111 true 5)))))) (some (.node (some (.node none (some (.leaf 111 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 63 false 0)))))) (some (.node (some (.node none (some (.leaf 11 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 45 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 58 false 0)))))) (some (.node (some (.node none (some (.leaf 22 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 30 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 75 false 0)))))) (some (.node (some (.node none (some (.leaf 81 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 99 false 0)))) none)) none)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 164 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 110 false 0)))))) (some (.node (some (.node none (some (.leaf 127 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 62 true 6)))))) (some (.node (some (.node none (some (.leaf 10 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 62 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 57 true 3)))))) (some (.node (some (.node none (some (.leaf 9 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 3 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 68 false 0)))))) (some (.node (some (.node none (some (.leaf 14 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 17 false 0)))) none)) none)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 171 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 108 false 0)))))) (some (.node (some (.node none (some (.leaf 133 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 61 false 0)))))) (some (.node (some (.node none (some (.leaf 26 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 90 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 56 false 0)))))) (some (.node (some (.node none (some (.leaf 8 true 7)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 8 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 69 false 0)))))) (some (.node (some (.node none (some (.leaf 6 true 4)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 1 false 0)))) none)) none)))) none)) none)))) none)) none)))

theorem region_0008_check :
    AssignmentTree.check 12 5 classes 10 (mustParsePath "RRRURRR") region_0008 = true := by
  unfold region_0008
  rfl

def region_0009 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 172 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 104 false 0)))))) (some (.node (some (.node none (some (.leaf 137 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 60 false 0)))))) (some (.node (some (.node none (some (.leaf 29 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 98 false 0)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 57 false 0)))))) (some (.node (some (.node none (some (.leaf 7 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 16 false 0)))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 70 false 0)))))) (some (.node (some (.node none (some (.leaf 6 false 0)))) none)))) (some (.node (some (.node (some (.node none (some (.leaf 0 false 0)))) none)) none)))) none)) none)))) none)) none)) none)

theorem region_0009_check :
    AssignmentTree.check 12 5 classes 10 (mustParsePath "RRRURRU") region_0009 = true := by
  unfold region_0009
  rfl

def regionsPart002 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRURRR", 10, region_0008),
  (mustParsePath "RRRURRU", 10, region_0009)
]

theorem regionsPart002_valid : ∀ region ∈ regionsPart002,
    region.1.length + region.2.1 = 17 ∧
      region.2.2.check 12 5 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart002, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl
  · exact ⟨by decide, region_0008_check⟩
  · exact ⟨by decide, region_0009_check⟩

end LatticePathOrders.GeneratedMinimality_12_5
