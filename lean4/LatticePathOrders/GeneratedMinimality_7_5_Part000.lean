import LatticePathOrders.GeneratedMinimality_7_5_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_5

def region_0000 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 37 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 36 true 7)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 33 true 7)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 33 false 0)))))) (some (.node (some (.node none (some (.leaf 36 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 35 true 5)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 32 true 8)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 24 true 8)))))) (some (.node (some (.node none (some (.leaf 5 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 30 true 8)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22 false 0)))))) (some (.node (some (.node none (some (.leaf 24 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 30 false 0)))))) (some (.node (some (.node none (some (.leaf 32 false 0)))) none)))) none)))))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 34 true 5)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 31 true 6)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 23 true 6)))))) (some (.node (some (.node none (some (.leaf 19 true 6)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 29 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 21 true 9)))))) (some (.node (some (.node none (some (.leaf 4 true 9)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 14 true 9)))))) (some (.node (some (.node none (some (.leaf 4 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 28 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 20 true 9)))))) (some (.node (some (.node none (some (.leaf 14 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 20 false 0)))))) (some (.node (some (.node none (some (.leaf 21 false 0)))) none)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 34 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 27 true 6)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 18 false 0)))))) (some (.node (some (.node none (some (.leaf 27 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 26 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 16 true 7)))))) (some (.node (some (.node none (some (.leaf 3 true 7)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 12 true 7)))))) (some (.node (some (.node none (some (.leaf 9 true 7)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 25 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 15 true 5)))))) (some (.node (some (.node none (some (.leaf 7 true 5)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 11 true 10)))))) (some (.node (some (.node none (some (.leaf 2 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 28 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 13 true 5)))))) (some (.node (some (.node none (some (.leaf 13 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 10 false 0)))))) (some (.node (some (.node none (some (.leaf 11 false 0)))) none)))) none)))) none)) none)))))

theorem region_0000_check :
    AssignmentTree.check 7 5 classes 9 (mustParsePath "RRR") region_0000 = true := by
  unfold region_0000
  rfl

def region_0001 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 35 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 19 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 23 false 0)))))) (some (.node (some (.node none (some (.leaf 31 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 17 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 9 false 0)))))) (some (.node (some (.node none (some (.leaf 3 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 12 false 0)))))) (some (.node (some (.node none (some (.leaf 16 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 26 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 8 true 5)))))) (some (.node (some (.node none (some (.leaf 8 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6 true 3)))))) (some (.node (some (.node none (some (.leaf 1 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 29 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7 false 0)))))) (some (.node (some (.node none (some (.leaf 15 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6 false 0)))))) (some (.node (some (.node none (some (.leaf 0 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0001_check :
    AssignmentTree.check 7 5 classes 9 (mustParsePath "RRU") region_0001 = true := by
  unfold region_0001
  rfl

def regionsPart000 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRR", 9, region_0000),
  (mustParsePath "RRU", 9, region_0001)
]

theorem regionsPart000_valid : ∀ region ∈ regionsPart000,
    region.1.length + region.2.1 = 12 ∧
      region.2.2.check 7 5 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart000, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl
  · exact ⟨by decide, region_0000_check⟩
  · exact ⟨by decide, region_0001_check⟩

end LatticePathOrders.GeneratedMinimality_7_5
