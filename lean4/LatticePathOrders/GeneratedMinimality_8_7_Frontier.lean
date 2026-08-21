import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_8_7

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 8 7 (15 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRR",
  mustParsePath "RRRRRU",
  mustParsePath "RRRRUR",
  mustParsePath "RRRRUU",
  mustParsePath "RRRURR",
  mustParsePath "RRRURU",
  mustParsePath "RRRUU",
  mustParsePath "RRURRR",
  mustParsePath "RRURRU",
  mustParsePath "RRURU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_8_7
