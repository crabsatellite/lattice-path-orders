import LatticePathOrders.GeneratedMinimality_13_12_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_12

def region_5080 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 99038 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 28790 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 36566 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 72052 false 0)))))) (some (.node (some (.node none (some (.leaf 87000 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 35352 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 16142 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 5067 false 0)))))) (some (.node (some (.node none (some (.leaf 897 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 11817 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 17101 false 0)))))) (some (.node (some (.node none (some (.leaf 22614 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 47776 false 0)))))) (some (.node (some (.node none (some (.leaf 51490 false 0)))) none)))) none)))))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 69944 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 15556 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6092 false 0)))))) (some (.node (some (.node none (some (.leaf 22211 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 12041 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4290 true 9)))))) (some (.node (some (.node none (some (.leaf 29 true 9)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2842 true 9)))))) (some (.node (some (.node none (some (.leaf 29 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 44291 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4109 true 9)))))) (some (.node (some (.node none (some (.leaf 2842 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 4109 false 0)))))) (some (.node (some (.node none (some (.leaf 4290 false 0)))) none)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 85324 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 15441 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22121 false 0)))))) (some (.node (some (.node none (some (.leaf 51141 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 18283 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4266 true 7)))))) (some (.node (some (.node none (some (.leaf 26 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2818 false 0)))))) (some (.node (some (.node none (some (.leaf 4266 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46742 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4056 true 5)))))) (some (.node (some (.node none (some (.leaf 4056 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 2586 false 0)))))) (some (.node (some (.node none (some (.leaf 0 false 0)))) none)))) none)))) none)))) none)))) none)

theorem region_5080_check :
    AssignmentTree.check 13 12 classes 10 (mustParsePath "RRURURURURURURU") region_5080 = true := by
  unfold region_5080
  rfl

def regionsPart1270 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURURURURURURU", 10, region_5080)
]

theorem regionsPart1270_valid : ∀ region ∈ regionsPart1270,
    region.1.length + region.2.1 = 25 ∧
      region.2.2.check 13 12 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart1270, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl
  · exact ⟨by decide, region_5080_check⟩

end LatticePathOrders.GeneratedMinimality_13_12
