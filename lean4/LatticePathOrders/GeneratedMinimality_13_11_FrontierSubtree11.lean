import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionSubtree11 : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)))) none)

theorem partitionSubtree11_check :
    PrefixPartitionTree.check 13 11 17 [Step.R, Step.R, Step.R, Step.U, Step.R, Step.U, Step.U] partitionSubtree11 = true := by
  unfold partitionSubtree11
  rfl

def partitionFrontierChunk11 : List Path := [
  mustParsePath "RRRURUURRRRRRR",
  mustParsePath "RRRURUURRRRRRUR",
  mustParsePath "RRRURUURRRRRRUU",
  mustParsePath "RRRURUURRRRRURR",
  mustParsePath "RRRURUURRRRRURU",
  mustParsePath "RRRURUURRRRRUUR",
  mustParsePath "RRRURUURRRRRUUU",
  mustParsePath "RRRURUURRRRURRR",
  mustParsePath "RRRURUURRRRURRU",
  mustParsePath "RRRURUURRRRURUR",
  mustParsePath "RRRURUURRRRURUU",
  mustParsePath "RRRURUURRRRUURR",
  mustParsePath "RRRURUURRRRUURU",
  mustParsePath "RRRURUURRRRUUU",
  mustParsePath "RRRURUURRRURRRR",
  mustParsePath "RRRURUURRRURRRU",
  mustParsePath "RRRURUURRRURRUR",
  mustParsePath "RRRURUURRRURRUU",
  mustParsePath "RRRURUURRRURURR",
  mustParsePath "RRRURUURRRURURU",
  mustParsePath "RRRURUURRRURUU",
  mustParsePath "RRRURUURRRUURRR",
  mustParsePath "RRRURUURRRUURRU",
  mustParsePath "RRRURUURRRUURU",
  mustParsePath "RRRURUURRURRRRR",
  mustParsePath "RRRURUURRURRRRU",
  mustParsePath "RRRURUURRURRRUR",
  mustParsePath "RRRURUURRURRRUU",
  mustParsePath "RRRURUURRURRURR",
  mustParsePath "RRRURUURRURRURU",
  mustParsePath "RRRURUURRURRUU",
  mustParsePath "RRRURUURRURURRR",
  mustParsePath "RRRURUURRURURRU",
  mustParsePath "RRRURUURRURURU",
  mustParsePath "RRRURUURRUURRRR",
  mustParsePath "RRRURUURRUURRRU",
  mustParsePath "RRRURUURRUURRU",
  mustParsePath "RRRURUURURRRRRR",
  mustParsePath "RRRURUURURRRRRU",
  mustParsePath "RRRURUURURRRRUR",
  mustParsePath "RRRURUURURRRRUU",
  mustParsePath "RRRURUURURRRURR",
  mustParsePath "RRRURUURURRRURU",
  mustParsePath "RRRURUURURRRUU",
  mustParsePath "RRRURUURURRURRR",
  mustParsePath "RRRURUURURRURRU",
  mustParsePath "RRRURUURURRURU",
  mustParsePath "RRRURUURURURRRR",
  mustParsePath "RRRURUURURURRRU",
  mustParsePath "RRRURUURURURRU"
]

theorem partitionSubtree11_frontier :
    PrefixPartitionTree.frontier [Step.R, Step.R, Step.R, Step.U, Step.R, Step.U, Step.U] partitionSubtree11 = partitionFrontierChunk11 := by
  unfold partitionSubtree11 partitionFrontierChunk11
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

