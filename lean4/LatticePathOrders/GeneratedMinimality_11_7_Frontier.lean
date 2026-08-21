import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_7

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) none)) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 11 7 (18 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRR",
  mustParsePath "RRRRRRRRU",
  mustParsePath "RRRRRRRUR",
  mustParsePath "RRRRRRRUU",
  mustParsePath "RRRRRRURR",
  mustParsePath "RRRRRRURU",
  mustParsePath "RRRRRRUUR",
  mustParsePath "RRRRRRUUU",
  mustParsePath "RRRRRURRR",
  mustParsePath "RRRRRURRU",
  mustParsePath "RRRRRURUR",
  mustParsePath "RRRRRURUU",
  mustParsePath "RRRRRUURR",
  mustParsePath "RRRRRUURU",
  mustParsePath "RRRRRUUU",
  mustParsePath "RRRRURRRR",
  mustParsePath "RRRRURRRU",
  mustParsePath "RRRRURRUR",
  mustParsePath "RRRRURRUU",
  mustParsePath "RRRRURURR",
  mustParsePath "RRRRURURU",
  mustParsePath "RRRRURUU",
  mustParsePath "RRRRUURRR",
  mustParsePath "RRRRUURRU",
  mustParsePath "RRRRUURU",
  mustParsePath "RRRURRRRR",
  mustParsePath "RRRURRRRU",
  mustParsePath "RRRURRRUR",
  mustParsePath "RRRURRRUU",
  mustParsePath "RRRURRURR",
  mustParsePath "RRRURRURU",
  mustParsePath "RRRURRUU",
  mustParsePath "RRRURURRR",
  mustParsePath "RRRURURRU",
  mustParsePath "RRRURURU",
  mustParsePath "RRURRRRRR",
  mustParsePath "RRURRRRRU",
  mustParsePath "RRURRRRUR",
  mustParsePath "RRURRRRUU",
  mustParsePath "RRURRRURR",
  mustParsePath "RRURRRURU",
  mustParsePath "RRURRRUU",
  mustParsePath "RRURRURRR",
  mustParsePath "RRURRURRU",
  mustParsePath "RRURRURU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_11_7
