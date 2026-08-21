import LatticePathOrders.GeneratedMinimality_13_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_8

def region_0244 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4516 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1700 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2429 false 0)))))) (some (.node (some (.node none (some (.leaf 3817 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1639 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 527 false 0)))))) (some (.node (some (.node none (some (.leaf 135 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 829 false 0)))))) (some (.node (some (.node none (some (.leaf 1587 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2949 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 493 false 0)))))) (some (.node (some (.node none (some (.leaf 497 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 339 false 0)))))) (some (.node (some (.node none (some (.leaf 21 false 0)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 643 false 0)))))) (some (.node (some (.node none (some (.leaf 360 false 0)))) none)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3315 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 485 false 0)))))) (some (.node (some (.node none (some (.leaf 1227 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 333 false 0)))))) (some (.node (some (.node none (some (.leaf 20 false 0)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 711 false 0)))))) (some (.node (some (.node none (some (.leaf 29 false 0)))) none)))) none)) none)))) none)))) none)

theorem region_0244_check :
    AssignmentTree.check 13 8 classes 9 (mustParsePath "RRURRURURRRU") region_0244 = true := by
  unfold region_0244
  rfl

def region_0245 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4611 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1699 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2572 false 0)))))) (some (.node (some (.node none (some (.leaf 4042 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1650 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 526 false 0)))))) (some (.node (some (.node none (some (.leaf 177 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1153 false 0)))))) (some (.node (some (.node none (some (.leaf 2056 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2963 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 492 false 0)))))) (some (.node (some (.node none (some (.leaf 519 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 338 false 0)))))) (some (.node (some (.node none (some (.leaf 40 false 0)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 676 false 0)))))) (some (.node (some (.node none (some (.leaf 776 false 0)))) none)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 3329 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 483 false 0)))))) (some (.node (some (.node none (some (.leaf 1344 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 335 false 0)))))) (some (.node (some (.node none (some (.leaf 2 false 0)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 721 false 0)))))) (some (.node (some (.node none (some (.leaf 0 false 0)))) none)))) none)) none)))) none)))) none)) none)

theorem region_0245_check :
    AssignmentTree.check 13 8 classes 10 (mustParsePath "RRURRURURRU") region_0245 = true := by
  unfold region_0245
  rfl

def regionsPart061 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRURRURURRRU", 9, region_0244),
  (mustParsePath "RRURRURURRU", 10, region_0245)
]

theorem regionsPart061_valid : ∀ region ∈ regionsPart061,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 13 8 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart061, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl
  · exact ⟨by decide, region_0244_check⟩
  · exact ⟨by decide, region_0245_check⟩

end LatticePathOrders.GeneratedMinimality_13_8
