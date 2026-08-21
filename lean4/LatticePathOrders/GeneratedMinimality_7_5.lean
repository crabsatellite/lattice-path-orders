import LatticePathOrders.GeneratedMinimality_7_5_Frontier
import LatticePathOrders.GeneratedMinimality_7_5_Group000

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_5

def regions : List (Path × Nat × AssignmentTree) := regionsGroup000

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  unfold partitionFrontier regions regionsGroup000 regionsPart000
  rfl

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 12 ∧
      region.2.2.check 7 5 classes region.2.1 region.1 = true := by
  intro region h
  exact regionsGroup000_valid region h

theorem regions_cover : TreeRegionsCover 7 5 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_7_5 : Problem63HoldsAt 7 5 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 2 regions. -/
theorem region_count : regions.length = 2 := by
  have h := congrArg List.length partitionFrontier_regions
  simpa [partitionFrontier] using h

end LatticePathOrders.GeneratedMinimality_7_5
