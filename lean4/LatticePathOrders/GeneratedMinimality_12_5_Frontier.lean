import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) none)) none)))) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 12 5 (17 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRR",
  mustParsePath "RRRRRRRRU",
  mustParsePath "RRRRRRRU",
  mustParsePath "RRRRRRU",
  mustParsePath "RRRRRUR",
  mustParsePath "RRRRRUU",
  mustParsePath "RRRRURR",
  mustParsePath "RRRRURU",
  mustParsePath "RRRURRR",
  mustParsePath "RRRURRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_12_5
