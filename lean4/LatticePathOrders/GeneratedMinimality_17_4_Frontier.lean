import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_4

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 17 4 (21 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRU",
  mustParsePath "RRRRRRRRRU",
  mustParsePath "RRRRRRRRU",
  mustParsePath "RRRRRRRU",
  mustParsePath "RRRRRRU",
  mustParsePath "RRRRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_17_4
