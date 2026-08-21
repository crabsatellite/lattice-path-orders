import LatticePathOrders.GeneratedMinimality_12_7_Frontier
import LatticePathOrders.GeneratedMinimality_12_7_Group000

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_7

def regions : List (Path × Nat × AssignmentTree) := regionsGroup000

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  unfold partitionFrontier regions regionsGroup000 regionsPart000 regionsPart001 regionsPart002 regionsPart003 regionsPart004 regionsPart005 regionsPart006 regionsPart007 regionsPart008 regionsPart009 regionsPart010 regionsPart011 regionsPart012 regionsPart013 regionsPart014 regionsPart015
  rfl

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 12 7 classes region.2.1 region.1 = true := by
  intro region h
  exact regionsGroup000_valid region h

theorem regions_cover : TreeRegionsCover 12 7 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_12_7 : Problem63HoldsAt 12 7 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 64 regions. -/
theorem region_count : regions.length = 64 := by
  have h := congrArg List.length partitionFrontier_regions
  simpa [partitionFrontier] using h

end LatticePathOrders.GeneratedMinimality_12_7
