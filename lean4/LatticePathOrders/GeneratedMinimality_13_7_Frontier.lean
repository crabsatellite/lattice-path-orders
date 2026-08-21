import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_7

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) (some .leaf))) none)) none)))) none)) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 13 7 (20 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRRRR",
  mustParsePath "RRRRRRRRRRU",
  mustParsePath "RRRRRRRRRUR",
  mustParsePath "RRRRRRRRRUU",
  mustParsePath "RRRRRRRRURR",
  mustParsePath "RRRRRRRRURU",
  mustParsePath "RRRRRRRRUUR",
  mustParsePath "RRRRRRRRUUU",
  mustParsePath "RRRRRRRURRR",
  mustParsePath "RRRRRRRURRU",
  mustParsePath "RRRRRRRURUR",
  mustParsePath "RRRRRRRURUU",
  mustParsePath "RRRRRRRUURR",
  mustParsePath "RRRRRRRUURU",
  mustParsePath "RRRRRRRUUU",
  mustParsePath "RRRRRRURRRR",
  mustParsePath "RRRRRRURRRU",
  mustParsePath "RRRRRRURRUR",
  mustParsePath "RRRRRRURRUU",
  mustParsePath "RRRRRRURURR",
  mustParsePath "RRRRRRURURU",
  mustParsePath "RRRRRRURUU",
  mustParsePath "RRRRRRUURRR",
  mustParsePath "RRRRRRUURRU",
  mustParsePath "RRRRRRUURU",
  mustParsePath "RRRRRRUUU",
  mustParsePath "RRRRRURRRRR",
  mustParsePath "RRRRRURRRRU",
  mustParsePath "RRRRRURRRUR",
  mustParsePath "RRRRRURRRUU",
  mustParsePath "RRRRRURRURR",
  mustParsePath "RRRRRURRURU",
  mustParsePath "RRRRRURRUU",
  mustParsePath "RRRRRURURRR",
  mustParsePath "RRRRRURURRU",
  mustParsePath "RRRRRURURU",
  mustParsePath "RRRRRURUU",
  mustParsePath "RRRRRUURRRR",
  mustParsePath "RRRRRUURRRU",
  mustParsePath "RRRRRUURRU",
  mustParsePath "RRRRRUURU",
  mustParsePath "RRRRURRRRRR",
  mustParsePath "RRRRURRRRRU",
  mustParsePath "RRRRURRRRUR",
  mustParsePath "RRRRURRRRUU",
  mustParsePath "RRRRURRRURR",
  mustParsePath "RRRRURRRURU",
  mustParsePath "RRRRURRRUU",
  mustParsePath "RRRRURRURRR",
  mustParsePath "RRRRURRURRU",
  mustParsePath "RRRRURRURU",
  mustParsePath "RRRRURRUU",
  mustParsePath "RRRRURURRRR",
  mustParsePath "RRRRURURRRU",
  mustParsePath "RRRRURURRU",
  mustParsePath "RRRRURURU",
  mustParsePath "RRRRUURRRRR",
  mustParsePath "RRRRUURRRRU",
  mustParsePath "RRRRUURRRU",
  mustParsePath "RRRRUURRU",
  mustParsePath "RRRURRRRRRR",
  mustParsePath "RRRURRRRRRU",
  mustParsePath "RRRURRRRRUR",
  mustParsePath "RRRURRRRRUU",
  mustParsePath "RRRURRRRURR",
  mustParsePath "RRRURRRRURU",
  mustParsePath "RRRURRRRUU",
  mustParsePath "RRRURRRURRR",
  mustParsePath "RRRURRRURRU",
  mustParsePath "RRRURRRURU",
  mustParsePath "RRRURRRUU",
  mustParsePath "RRRURRURRRR",
  mustParsePath "RRRURRURRRU",
  mustParsePath "RRRURRURRU",
  mustParsePath "RRRURRURU",
  mustParsePath "RRRURURRRRR",
  mustParsePath "RRRURURRRRU",
  mustParsePath "RRRURURRRU",
  mustParsePath "RRRURURRU",
  mustParsePath "RRURRRRRRRR",
  mustParsePath "RRURRRRRRRU",
  mustParsePath "RRURRRRRRUR",
  mustParsePath "RRURRRRRRUU",
  mustParsePath "RRURRRRRURR",
  mustParsePath "RRURRRRRURU",
  mustParsePath "RRURRRRRUU",
  mustParsePath "RRURRRRURRR",
  mustParsePath "RRURRRRURRU",
  mustParsePath "RRURRRRURU",
  mustParsePath "RRURRRRUU",
  mustParsePath "RRURRRURRRR",
  mustParsePath "RRURRRURRRU",
  mustParsePath "RRURRRURRU",
  mustParsePath "RRURRRURU",
  mustParsePath "RRURRURRRRR",
  mustParsePath "RRURRURRRRU",
  mustParsePath "RRURRURRRU",
  mustParsePath "RRURRURRU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_13_7
