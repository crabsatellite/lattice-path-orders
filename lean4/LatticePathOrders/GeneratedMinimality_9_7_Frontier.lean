import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_9_7

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 9 7 (16 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRR",
  mustParsePath "RRRRRRU",
  mustParsePath "RRRRRUR",
  mustParsePath "RRRRRUU",
  mustParsePath "RRRRURR",
  mustParsePath "RRRRURU",
  mustParsePath "RRRRUU",
  mustParsePath "RRRURRR",
  mustParsePath "RRRURRU",
  mustParsePath "RRRURU",
  mustParsePath "RRRUU",
  mustParsePath "RRURRRR",
  mustParsePath "RRURRRU",
  mustParsePath "RRURRU",
  mustParsePath "RRURU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_9_7
