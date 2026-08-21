import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) none)))) none)) none)))) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 11 8 (19 - 1) [Step.R] partitionTree = true := by
  unfold partitionTree
  rfl

def partitionFrontier : List Path := [
  mustParsePath "RRRRRRRRR",
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
  mustParsePath "RRRRRRUUUR",
  mustParsePath "RRRRRRUUUU",
  mustParsePath "RRRRRURRRR",
  mustParsePath "RRRRRURRRU",
  mustParsePath "RRRRRURRUR",
  mustParsePath "RRRRRURRUU",
  mustParsePath "RRRRRURURR",
  mustParsePath "RRRRRURURU",
  mustParsePath "RRRRRURUUR",
  mustParsePath "RRRRRURUUU",
  mustParsePath "RRRRRUURRR",
  mustParsePath "RRRRRUURRU",
  mustParsePath "RRRRRUURUR",
  mustParsePath "RRRRRUURUU",
  mustParsePath "RRRRRUUURR",
  mustParsePath "RRRRRUUURU",
  mustParsePath "RRRRURRRRR",
  mustParsePath "RRRRURRRRU",
  mustParsePath "RRRRURRRUR",
  mustParsePath "RRRRURRRUU",
  mustParsePath "RRRRURRURR",
  mustParsePath "RRRRURRURU",
  mustParsePath "RRRRURRUUR",
  mustParsePath "RRRRURRUUU",
  mustParsePath "RRRRURURRR",
  mustParsePath "RRRRURURRU",
  mustParsePath "RRRRURURUR",
  mustParsePath "RRRRURURUU",
  mustParsePath "RRRRURUURR",
  mustParsePath "RRRRURUURU",
  mustParsePath "RRRRUURRRR",
  mustParsePath "RRRRUURRRU",
  mustParsePath "RRRRUURRUR",
  mustParsePath "RRRRUURRUU",
  mustParsePath "RRRRUURURR",
  mustParsePath "RRRRUURURU",
  mustParsePath "RRRURRRRRR",
  mustParsePath "RRRURRRRRU",
  mustParsePath "RRRURRRRUR",
  mustParsePath "RRRURRRRUU",
  mustParsePath "RRRURRRURR",
  mustParsePath "RRRURRRURU",
  mustParsePath "RRRURRRUUR",
  mustParsePath "RRRURRRUUU",
  mustParsePath "RRRURRURRR",
  mustParsePath "RRRURRURRU",
  mustParsePath "RRRURRURUR",
  mustParsePath "RRRURRURUU",
  mustParsePath "RRRURRUURR",
  mustParsePath "RRRURRUURU",
  mustParsePath "RRRURURRRR",
  mustParsePath "RRRURURRRU",
  mustParsePath "RRRURURRUR",
  mustParsePath "RRRURURRUU",
  mustParsePath "RRRURURURR",
  mustParsePath "RRRURURURU",
  mustParsePath "RRRUURRRRR",
  mustParsePath "RRRUURRRRU",
  mustParsePath "RRRUURRRUR",
  mustParsePath "RRRUURRRUU",
  mustParsePath "RRRUURRURR",
  mustParsePath "RRRUURRURU",
  mustParsePath "RRURRRRRRR",
  mustParsePath "RRURRRRRRU",
  mustParsePath "RRURRRRRUR",
  mustParsePath "RRURRRRRUU",
  mustParsePath "RRURRRRURR",
  mustParsePath "RRURRRRURU",
  mustParsePath "RRURRRRUUR",
  mustParsePath "RRURRRRUUU",
  mustParsePath "RRURRRURRR",
  mustParsePath "RRURRRURRU",
  mustParsePath "RRURRRURUR",
  mustParsePath "RRURRRURUU",
  mustParsePath "RRURRRUURR",
  mustParsePath "RRURRRUURU",
  mustParsePath "RRURRURRRR",
  mustParsePath "RRURRURRRU",
  mustParsePath "RRURRURRUR",
  mustParsePath "RRURRURRUU",
  mustParsePath "RRURRURURR",
  mustParsePath "RRURRURURU",
  mustParsePath "RRURURRRRR",
  mustParsePath "RRURURRRRU",
  mustParsePath "RRURURRRUR",
  mustParsePath "RRURURRRUU",
  mustParsePath "RRURURRURR",
  mustParsePath "RRURURRURU"
]

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  unfold partitionTree partitionFrontier
  rfl

end LatticePathOrders.GeneratedMinimality_11_8
