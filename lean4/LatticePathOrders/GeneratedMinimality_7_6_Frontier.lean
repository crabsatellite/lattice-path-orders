import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_7_6

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 7 6 (13 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRR",
  mustParsePath "RRRU",
  mustParsePath "RRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_7_6
