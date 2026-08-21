import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_18_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)) none)))) none)) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 18 5 (23 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRRUR",
  mustParsePath "RRRRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRRRURR",
  mustParsePath "RRRRRRRRRRRURU",
  mustParsePath "RRRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRRURRR",
  mustParsePath "RRRRRRRRRRURRU",
  mustParsePath "RRRRRRRRRRURU",
  mustParsePath "RRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRURRRR",
  mustParsePath "RRRRRRRRRURRRU",
  mustParsePath "RRRRRRRRRURRU",
  mustParsePath "RRRRRRRRRURU",
  mustParsePath "RRRRRRRRRUU",
  mustParsePath "RRRRRRRRURRRRR",
  mustParsePath "RRRRRRRRURRRRU",
  mustParsePath "RRRRRRRRURRRU",
  mustParsePath "RRRRRRRRURRU",
  mustParsePath "RRRRRRRRURU",
  mustParsePath "RRRRRRRRUU",
  mustParsePath "RRRRRRRURRRRRR",
  mustParsePath "RRRRRRRURRRRRU",
  mustParsePath "RRRRRRRURRRRU",
  mustParsePath "RRRRRRRURRRU",
  mustParsePath "RRRRRRRURRU",
  mustParsePath "RRRRRRRURU",
  mustParsePath "RRRRRRURRRRRRR",
  mustParsePath "RRRRRRURRRRRRU",
  mustParsePath "RRRRRRURRRRRU",
  mustParsePath "RRRRRRURRRRU",
  mustParsePath "RRRRRRURRRU",
  mustParsePath "RRRRRRURRU",
  mustParsePath "RRRRRURRRRRRRR",
  mustParsePath "RRRRRURRRRRRRU",
  mustParsePath "RRRRRURRRRRRU",
  mustParsePath "RRRRRURRRRRU",
  mustParsePath "RRRRRURRRRU",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRURRRRRRRRR",
  mustParsePath "RRRRURRRRRRRRU",
  mustParsePath "RRRRURRRRRRRU",
  mustParsePath "RRRRURRRRRRU",
  mustParsePath "RRRRURRRRRU",
  mustParsePath "RRRRURRRRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_18_5
