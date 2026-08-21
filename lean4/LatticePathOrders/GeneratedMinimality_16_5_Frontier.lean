import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_16_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)))) none)) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 16 5 (21 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRUR",
  mustParsePath "RRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRURR",
  mustParsePath "RRRRRRRRRURU",
  mustParsePath "RRRRRRRRRUU",
  mustParsePath "RRRRRRRRURRR",
  mustParsePath "RRRRRRRRURRU",
  mustParsePath "RRRRRRRRURU",
  mustParsePath "RRRRRRRRUU",
  mustParsePath "RRRRRRRURRRR",
  mustParsePath "RRRRRRRURRRU",
  mustParsePath "RRRRRRRURRU",
  mustParsePath "RRRRRRRURU",
  mustParsePath "RRRRRRRUU",
  mustParsePath "RRRRRRURRRRR",
  mustParsePath "RRRRRRURRRRU",
  mustParsePath "RRRRRRURRRU",
  mustParsePath "RRRRRRURRU",
  mustParsePath "RRRRRRURU",
  mustParsePath "RRRRRURRRRRR",
  mustParsePath "RRRRRURRRRRU",
  mustParsePath "RRRRRURRRRU",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRRURRU",
  mustParsePath "RRRRURRRRRRR",
  mustParsePath "RRRRURRRRRRU",
  mustParsePath "RRRRURRRRRU",
  mustParsePath "RRRRURRRRU",
  mustParsePath "RRRRURRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_16_5
