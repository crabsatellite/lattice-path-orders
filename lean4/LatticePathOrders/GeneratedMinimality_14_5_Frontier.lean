import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_14_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)) none)))) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 14 5 (19 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRU",
  mustParsePath "RRRRRRRRRU",
  mustParsePath "RRRRRRRRU",
  mustParsePath "RRRRRRRUR",
  mustParsePath "RRRRRRRUU",
  mustParsePath "RRRRRRURR",
  mustParsePath "RRRRRRURU",
  mustParsePath "RRRRRRUU",
  mustParsePath "RRRRRURRR",
  mustParsePath "RRRRRURRU",
  mustParsePath "RRRRRURU",
  mustParsePath "RRRRURRRR",
  mustParsePath "RRRRURRRU",
  mustParsePath "RRRRURRU",
  mustParsePath "RRRURRRRR",
  mustParsePath "RRRURRRRU",
  mustParsePath "RRRURRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_14_5
