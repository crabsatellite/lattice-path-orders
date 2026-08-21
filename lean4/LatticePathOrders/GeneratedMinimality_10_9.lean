import LatticePathOrders.GeneratedMinimality_10_9_Frontier
import LatticePathOrders.GeneratedMinimality_10_9_Group000
import LatticePathOrders.GeneratedMinimality_10_9_Group001

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_9

def regions : List (Path × Nat × AssignmentTree) :=
  regionsGroup000 ++ (regionsGroup001)

theorem partitionFrontier_regions :
    partitionFrontier = regions.map Prod.fst := by
  unfold partitionFrontier regions regionsGroup000 regionsGroup001 regionsPart000 regionsPart001 regionsPart002 regionsPart003 regionsPart004 regionsPart005 regionsPart006 regionsPart007 regionsPart008 regionsPart009 regionsPart010 regionsPart011 regionsPart012 regionsPart013 regionsPart014 regionsPart015 regionsPart016 regionsPart017 regionsPart018 regionsPart019 regionsPart020 regionsPart021 regionsPart022 regionsPart023 regionsPart024 regionsPart025 regionsPart026 regionsPart027 regionsPart028 regionsPart029
  rfl

theorem regions_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = regions.map Prod.fst :=
  partitionTree_frontier.trans partitionFrontier_regions

theorem regions_valid : ∀ region ∈ regions,
    region.1.length + region.2.1 = 19 ∧
      region.2.2.check 10 9 classes region.2.1 region.1 = true := by
  intro region h
  simp only [regions, List.mem_append] at h
  rcases h with h | h
  · exact regionsGroup000_valid region h
  · exact regionsGroup001_valid region h

theorem regions_cover : TreeRegionsCover 10 9 classes regions partitionTree :=
  ⟨classes_valid, partitionTree_check, regions_frontier, regions_valid⟩

theorem problem63_10_9 : Problem63HoldsAt 10 9 :=
  problem63HoldsAt_of_treeRegionsCover (by decide) (by decide) regions_cover

/-- Endpoint certificate: 117 regions. -/
theorem region_count : regions.length = 117 := by
  have h := congrArg List.length partitionFrontier_regions
  simpa [partitionFrontier] using h

end LatticePathOrders.GeneratedMinimality_10_9
