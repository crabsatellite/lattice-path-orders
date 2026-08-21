import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_19_5

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)) none)) none)))) none)) none)) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 19 5 (24 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRRRRU",
  mustParsePath "RRRRRRRRRRRRRUR",
  mustParsePath "RRRRRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRRRRURR",
  mustParsePath "RRRRRRRRRRRRURU",
  mustParsePath "RRRRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRRRURRR",
  mustParsePath "RRRRRRRRRRRURRU",
  mustParsePath "RRRRRRRRRRRURU",
  mustParsePath "RRRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRRURRRR",
  mustParsePath "RRRRRRRRRRURRRU",
  mustParsePath "RRRRRRRRRRURRU",
  mustParsePath "RRRRRRRRRRURU",
  mustParsePath "RRRRRRRRRRUU",
  mustParsePath "RRRRRRRRRURRRRR",
  mustParsePath "RRRRRRRRRURRRRU",
  mustParsePath "RRRRRRRRRURRRU",
  mustParsePath "RRRRRRRRRURRU",
  mustParsePath "RRRRRRRRRURU",
  mustParsePath "RRRRRRRRRUU",
  mustParsePath "RRRRRRRRURRRRRR",
  mustParsePath "RRRRRRRRURRRRRU",
  mustParsePath "RRRRRRRRURRRRU",
  mustParsePath "RRRRRRRRURRRU",
  mustParsePath "RRRRRRRRURRU",
  mustParsePath "RRRRRRRRURU",
  mustParsePath "RRRRRRRRUU",
  mustParsePath "RRRRRRRURRRRRRR",
  mustParsePath "RRRRRRRURRRRRRU",
  mustParsePath "RRRRRRRURRRRRU",
  mustParsePath "RRRRRRRURRRRU",
  mustParsePath "RRRRRRRURRRU",
  mustParsePath "RRRRRRRURRU",
  mustParsePath "RRRRRRRURU",
  mustParsePath "RRRRRRURRRRRRRR",
  mustParsePath "RRRRRRURRRRRRRU",
  mustParsePath "RRRRRRURRRRRRU",
  mustParsePath "RRRRRRURRRRRU",
  mustParsePath "RRRRRRURRRRU",
  mustParsePath "RRRRRRURRRU",
  mustParsePath "RRRRRRURRU",
  mustParsePath "RRRRRURRRRRRRRR",
  mustParsePath "RRRRRURRRRRRRRU",
  mustParsePath "RRRRRURRRRRRRU",
  mustParsePath "RRRRRURRRRRRU",
  mustParsePath "RRRRRURRRRRU",
  mustParsePath "RRRRRURRRRU",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRURRRRRRRRRR",
  mustParsePath "RRRRURRRRRRRRRU",
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

end LatticePathOrders.GeneratedMinimality_19_5
