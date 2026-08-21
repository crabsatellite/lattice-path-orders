import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) none)) none)) none)))) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 13 5 (18 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRR",
  mustParsePath "RRRRRRRRRU",
  mustParsePath "RRRRRRRRU",
  mustParsePath "RRRRRRRU",
  mustParsePath "RRRRRRUR",
  mustParsePath "RRRRRRUU",
  mustParsePath "RRRRRURR",
  mustParsePath "RRRRRURU",
  mustParsePath "RRRRURRR",
  mustParsePath "RRRRURRU",
  mustParsePath "RRRURRRR",
  mustParsePath "RRRURRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_13_5
