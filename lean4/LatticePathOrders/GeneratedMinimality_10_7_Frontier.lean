import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_10_7

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) none)) none)))) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 10 7 (17 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRR",
  mustParsePath "RRRRRRRU",
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
  mustParsePath "RRRURRRR",
  mustParsePath "RRRURRRU",
  mustParsePath "RRRURRUR",
  mustParsePath "RRRURRUU",
  mustParsePath "RRRURURR",
  mustParsePath "RRRURURU",
  mustParsePath "RRRUURRR",
  mustParsePath "RRRUURRU",
  mustParsePath "RRURRRRR",
  mustParsePath "RRURRRRU",
  mustParsePath "RRURRRUR",
  mustParsePath "RRURRRUU",
  mustParsePath "RRURRURR",
  mustParsePath "RRURRURU",
  mustParsePath "RRURURRR",
  mustParsePath "RRURURRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_10_7
