import LatticePathOrders.GeneratedMinimality_11_10_Part071_Region0284
import LatticePathOrders.GeneratedMinimality_11_10_Part071_Region0285
import LatticePathOrders.GeneratedMinimality_11_10_Part071_Region0286
import LatticePathOrders.GeneratedMinimality_11_10_Part071_Region0287

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def regionsPart071 : List (Path × Nat × AssignmentTree) := [
  (mustParsePath "RRRUURURRURR", 9, region_0284),
  (mustParsePath "RRRUURURRURU", 9, region_0285),
  (mustParsePath "RRRUURURRUU", 10, region_0286),
  (mustParsePath "RRRUURURURRR", 9, region_0287)
]

theorem regionsPart071_valid : ∀ region ∈ regionsPart071,
    region.1.length + region.2.1 = 21 ∧
      region.2.2.check 11 10 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regionsPart071, List.mem_cons, List.mem_nil_iff, or_false] at h
  rcases h with rfl | rfl | rfl | rfl
  · exact ⟨by decide, region_0284_check⟩
  · exact ⟨by decide, region_0285_check⟩
  · exact ⟨by decide, region_0286_check⟩
  · exact ⟨by decide, region_0287_check⟩

end LatticePathOrders.GeneratedMinimality_11_10

