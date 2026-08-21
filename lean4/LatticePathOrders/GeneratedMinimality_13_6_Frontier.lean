import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_6

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 13 6 (19 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRR",
  mustParsePath "RRRRRRRRRUR",
  mustParsePath "RRRRRRRRRUU",
  mustParsePath "RRRRRRRRURR",
  mustParsePath "RRRRRRRRURU",
  mustParsePath "RRRRRRRRUU",
  mustParsePath "RRRRRRRURRR",
  mustParsePath "RRRRRRRURRU",
  mustParsePath "RRRRRRRURU",
  mustParsePath "RRRRRRRUU",
  mustParsePath "RRRRRRURRRR",
  mustParsePath "RRRRRRURRRU",
  mustParsePath "RRRRRRURRU",
  mustParsePath "RRRRRRURU",
  mustParsePath "RRRRRRUU",
  mustParsePath "RRRRRURRRRR",
  mustParsePath "RRRRRURRRRU",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRRURRU",
  mustParsePath "RRRRRURU",
  mustParsePath "RRRRRUU",
  mustParsePath "RRRRURRRRRR",
  mustParsePath "RRRRURRRRRU",
  mustParsePath "RRRRURRRRU",
  mustParsePath "RRRRURRRU",
  mustParsePath "RRRRURRU",
  mustParsePath "RRRRURU",
  mustParsePath "RRRURRRRRRR",
  mustParsePath "RRRURRRRRRU",
  mustParsePath "RRRURRRRRU",
  mustParsePath "RRRURRRRU",
  mustParsePath "RRRURRRU",
  mustParsePath "RRRURRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_13_6
