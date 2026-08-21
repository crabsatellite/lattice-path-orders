import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_12_7

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 12 7 (19 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRR",
  mustParsePath "RRRRRRRRRU",
  mustParsePath "RRRRRRRRUR",
  mustParsePath "RRRRRRRRUU",
  mustParsePath "RRRRRRRURR",
  mustParsePath "RRRRRRRURU",
  mustParsePath "RRRRRRRUUR",
  mustParsePath "RRRRRRRUUU",
  mustParsePath "RRRRRRURRR",
  mustParsePath "RRRRRRURRU",
  mustParsePath "RRRRRRURUR",
  mustParsePath "RRRRRRURUU",
  mustParsePath "RRRRRRUURR",
  mustParsePath "RRRRRRUURU",
  mustParsePath "RRRRRRUUU",
  mustParsePath "RRRRRURRRR",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRRURRUR",
  mustParsePath "RRRRRURRUU",
  mustParsePath "RRRRRURURR",
  mustParsePath "RRRRRURURU",
  mustParsePath "RRRRRURUU",
  mustParsePath "RRRRRUURRR",
  mustParsePath "RRRRRUURRU",
  mustParsePath "RRRRRUURU",
  mustParsePath "RRRRURRRRR",
  mustParsePath "RRRRURRRRU",
  mustParsePath "RRRRURRRUR",
  mustParsePath "RRRRURRRUU",
  mustParsePath "RRRRURRURR",
  mustParsePath "RRRRURRURU",
  mustParsePath "RRRRURRUU",
  mustParsePath "RRRRURURRR",
  mustParsePath "RRRRURURRU",
  mustParsePath "RRRRURURU",
  mustParsePath "RRRRUURRRR",
  mustParsePath "RRRRUURRRU",
  mustParsePath "RRRRUURRU",
  mustParsePath "RRRURRRRRR",
  mustParsePath "RRRURRRRRU",
  mustParsePath "RRRURRRRUR",
  mustParsePath "RRRURRRRUU",
  mustParsePath "RRRURRRURR",
  mustParsePath "RRRURRRURU",
  mustParsePath "RRRURRRUU",
  mustParsePath "RRRURRURRR",
  mustParsePath "RRRURRURRU",
  mustParsePath "RRRURRURU",
  mustParsePath "RRRURURRRR",
  mustParsePath "RRRURURRRU",
  mustParsePath "RRRURURRU",
  mustParsePath "RRURRRRRRR",
  mustParsePath "RRURRRRRRU",
  mustParsePath "RRURRRRRUR",
  mustParsePath "RRURRRRRUU",
  mustParsePath "RRURRRRURR",
  mustParsePath "RRURRRRURU",
  mustParsePath "RRURRRRUU",
  mustParsePath "RRURRRURRR",
  mustParsePath "RRURRRURRU",
  mustParsePath "RRURRRURU",
  mustParsePath "RRURRURRRR",
  mustParsePath "RRURRURRRU",
  mustParsePath "RRURRURRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_12_7
