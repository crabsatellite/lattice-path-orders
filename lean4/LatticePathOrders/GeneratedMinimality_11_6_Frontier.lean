import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_6

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 11 6 (17 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRR",
  mustParsePath "RRRRRRRU",
  mustParsePath "RRRRRRUR",
  mustParsePath "RRRRRRUU",
  mustParsePath "RRRRRURR",
  mustParsePath "RRRRRURU",
  mustParsePath "RRRRRUU",
  mustParsePath "RRRRURRR",
  mustParsePath "RRRRURRU",
  mustParsePath "RRRRURU",
  mustParsePath "RRRRUU",
  mustParsePath "RRRURRRR",
  mustParsePath "RRRURRRU",
  mustParsePath "RRRURRU",
  mustParsePath "RRRURU",
  mustParsePath "RRURRRRR",
  mustParsePath "RRURRRRU",
  mustParsePath "RRURRRU",
  mustParsePath "RRURRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_11_6
