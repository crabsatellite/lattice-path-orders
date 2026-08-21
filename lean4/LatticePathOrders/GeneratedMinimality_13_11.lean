import LatticePathOrders.GeneratedMinimality_13_11_FrontierAlignment

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def regions : List (Path × Nat × AssignmentTree) :=
  regionsSegment00 ++
    (regionsSegment01 ++
      (regionsSegment02 ++ (regionsSegment03 ++ regionsSegment04)))

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  rw [partitionFrontier_segments]
  unfold regions
  rw [List.map_append, frontierSegment00_regions,
    List.map_append, frontierSegment01_regions,
    List.map_append, frontierSegment02_regions,
    List.map_append, frontierSegment03_regions,
    frontierSegment04_regions]
  simp [List.append_assoc]

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 24 ∧
      region.2.2.check 13 11 classes region.2.1 region.1 = true := by
  unfold regions
  exact forall_mem_append regionsSegment00_valid
    (forall_mem_append regionsSegment01_valid
      (forall_mem_append regionsSegment02_valid
        (forall_mem_append regionsSegment03_valid regionsSegment04_valid)))

theorem regions_cover : TreeRegionsCover 13 11 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_13_11 : Problem63HoldsAt 13 11 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 2508 regions. -/
theorem region_count : regions.length = 2508 := by
  have h := congrArg List.length partitionFrontier_regions
  rw [partitionFrontier_length] at h
  simpa using h.symm

end LatticePathOrders.GeneratedMinimality_13_11
