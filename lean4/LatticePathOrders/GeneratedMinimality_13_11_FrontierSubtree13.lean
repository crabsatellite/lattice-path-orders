import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionSubtree13 : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)))) none)

theorem partitionSubtree13_check :
    PrefixPartitionTree.check 13 11 17 [Step.R, Step.R, Step.R, Step.U, Step.U, Step.R, Step.U] partitionSubtree13 = true := by
  unfold partitionSubtree13
  rfl

def partitionFrontierChunk13 : List Path := [
  mustParsePath "RRRUURURRRRRRR",
  mustParsePath "RRRUURURRRRRRUR",
  mustParsePath "RRRUURURRRRRRUU",
  mustParsePath "RRRUURURRRRRURR",
  mustParsePath "RRRUURURRRRRURU",
  mustParsePath "RRRUURURRRRRUUR",
  mustParsePath "RRRUURURRRRRUUU",
  mustParsePath "RRRUURURRRRURRR",
  mustParsePath "RRRUURURRRRURRU",
  mustParsePath "RRRUURURRRRURUR",
  mustParsePath "RRRUURURRRRURUU",
  mustParsePath "RRRUURURRRRUURR",
  mustParsePath "RRRUURURRRRUURU",
  mustParsePath "RRRUURURRRRUUU",
  mustParsePath "RRRUURURRRURRRR",
  mustParsePath "RRRUURURRRURRRU",
  mustParsePath "RRRUURURRRURRUR",
  mustParsePath "RRRUURURRRURRUU",
  mustParsePath "RRRUURURRRURURR",
  mustParsePath "RRRUURURRRURURU",
  mustParsePath "RRRUURURRRURUU",
  mustParsePath "RRRUURURRRUURRR",
  mustParsePath "RRRUURURRRUURRU",
  mustParsePath "RRRUURURRRUURU",
  mustParsePath "RRRUURURRURRRRR",
  mustParsePath "RRRUURURRURRRRU",
  mustParsePath "RRRUURURRURRRUR",
  mustParsePath "RRRUURURRURRRUU",
  mustParsePath "RRRUURURRURRURR",
  mustParsePath "RRRUURURRURRURU",
  mustParsePath "RRRUURURRURRUU",
  mustParsePath "RRRUURURRURURRR",
  mustParsePath "RRRUURURRURURRU",
  mustParsePath "RRRUURURRURURU",
  mustParsePath "RRRUURURRUURRRR",
  mustParsePath "RRRUURURRUURRRU",
  mustParsePath "RRRUURURRUURRU",
  mustParsePath "RRRUURURURRRRRR",
  mustParsePath "RRRUURURURRRRRU",
  mustParsePath "RRRUURURURRRRUR",
  mustParsePath "RRRUURURURRRRUU",
  mustParsePath "RRRUURURURRRURR",
  mustParsePath "RRRUURURURRRURU",
  mustParsePath "RRRUURURURRRUU",
  mustParsePath "RRRUURURURRURRR",
  mustParsePath "RRRUURURURRURRU",
  mustParsePath "RRRUURURURRURU",
  mustParsePath "RRRUURURURURRRR",
  mustParsePath "RRRUURURURURRRU",
  mustParsePath "RRRUURURURURRU"
]

theorem partitionSubtree13_frontier :
    PrefixPartitionTree.frontier [Step.R, Step.R, Step.R, Step.U, Step.U, Step.R, Step.U] partitionSubtree13 = partitionFrontierChunk13 := by
  unfold partitionSubtree13 partitionFrontierChunk13
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

