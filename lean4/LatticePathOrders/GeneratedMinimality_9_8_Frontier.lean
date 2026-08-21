import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_9_8

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 9 8 (17 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRR",
  mustParsePath "RRRRRRUR",
  mustParsePath "RRRRRRUU",
  mustParsePath "RRRRRURR",
  mustParsePath "RRRRRURU",
  mustParsePath "RRRRRUUR",
  mustParsePath "RRRRRUUU",
  mustParsePath "RRRRURRR",
  mustParsePath "RRRRURRU",
  mustParsePath "RRRRURUR",
  mustParsePath "RRRRURUU",
  mustParsePath "RRRRUURR",
  mustParsePath "RRRRUURU",
  mustParsePath "RRRRUUU",
  mustParsePath "RRRURRRR",
  mustParsePath "RRRURRRU",
  mustParsePath "RRRURRUR",
  mustParsePath "RRRURRUU",
  mustParsePath "RRRURURR",
  mustParsePath "RRRURURU",
  mustParsePath "RRRURUU",
  mustParsePath "RRRUURRR",
  mustParsePath "RRRUURRU",
  mustParsePath "RRRUURU",
  mustParsePath "RRURRRRR",
  mustParsePath "RRURRRRU",
  mustParsePath "RRURRRUR",
  mustParsePath "RRURRRUU",
  mustParsePath "RRURRURR",
  mustParsePath "RRURRURU",
  mustParsePath "RRURRUU",
  mustParsePath "RRURURRR",
  mustParsePath "RRURURRU",
  mustParsePath "RRURURU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_9_8
