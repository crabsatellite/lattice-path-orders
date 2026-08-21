import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_3

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) none)) none)) none)) none)) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 19 3 (22 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRR",
  mustParsePath "RRRRRRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_19_3
