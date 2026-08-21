import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_17_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)))) none)) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 17 5 (22 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRUR",
  mustParsePath "RRRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRRURR",
  mustParsePath "RRRRRRRRRRURU",
  mustParsePath "RRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRURRR",
  mustParsePath "RRRRRRRRRURRU",
  mustParsePath "RRRRRRRRRURU",
  mustParsePath "RRRRRRRRRUU",
  mustParsePath "RRRRRRRRURRRR",
  mustParsePath "RRRRRRRRURRRU",
  mustParsePath "RRRRRRRRURRU",
  mustParsePath "RRRRRRRRURU",
  mustParsePath "RRRRRRRRUU",
  mustParsePath "RRRRRRRURRRRR",
  mustParsePath "RRRRRRRURRRRU",
  mustParsePath "RRRRRRRURRRU",
  mustParsePath "RRRRRRRURRU",
  mustParsePath "RRRRRRRURU",
  mustParsePath "RRRRRRRUU",
  mustParsePath "RRRRRRURRRRRR",
  mustParsePath "RRRRRRURRRRRU",
  mustParsePath "RRRRRRURRRRU",
  mustParsePath "RRRRRRURRRU",
  mustParsePath "RRRRRRURRU",
  mustParsePath "RRRRRRURU",
  mustParsePath "RRRRRURRRRRRR",
  mustParsePath "RRRRRURRRRRRU",
  mustParsePath "RRRRRURRRRRU",
  mustParsePath "RRRRRURRRRU",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRRURRU",
  mustParsePath "RRRRURRRRRRRR",
  mustParsePath "RRRRURRRRRRRU",
  mustParsePath "RRRRURRRRRRU",
  mustParsePath "RRRRURRRRRU",
  mustParsePath "RRRRURRRRU",
  mustParsePath "RRRRURRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_17_5
