import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionSubtree17 : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)))) none)

theorem partitionSubtree17_check :
    PrefixPartitionTree.check 13 11 17 [Step.R, Step.R, Step.U, Step.R, Step.R, Step.U, Step.U] partitionSubtree17 = true := by
  unfold partitionSubtree17
  rfl

def partitionFrontierChunk17 : List Path := [
  mustParsePath "RRURRUURRRRRRR",
  mustParsePath "RRURRUURRRRRRUR",
  mustParsePath "RRURRUURRRRRRUU",
  mustParsePath "RRURRUURRRRRURR",
  mustParsePath "RRURRUURRRRRURU",
  mustParsePath "RRURRUURRRRRUUR",
  mustParsePath "RRURRUURRRRRUUU",
  mustParsePath "RRURRUURRRRURRR",
  mustParsePath "RRURRUURRRRURRU",
  mustParsePath "RRURRUURRRRURUR",
  mustParsePath "RRURRUURRRRURUU",
  mustParsePath "RRURRUURRRRUURR",
  mustParsePath "RRURRUURRRRUURU",
  mustParsePath "RRURRUURRRRUUU",
  mustParsePath "RRURRUURRRURRRR",
  mustParsePath "RRURRUURRRURRRU",
  mustParsePath "RRURRUURRRURRUR",
  mustParsePath "RRURRUURRRURRUU",
  mustParsePath "RRURRUURRRURURR",
  mustParsePath "RRURRUURRRURURU",
  mustParsePath "RRURRUURRRURUU",
  mustParsePath "RRURRUURRRUURRR",
  mustParsePath "RRURRUURRRUURRU",
  mustParsePath "RRURRUURRRUURU",
  mustParsePath "RRURRUURRURRRRR",
  mustParsePath "RRURRUURRURRRRU",
  mustParsePath "RRURRUURRURRRUR",
  mustParsePath "RRURRUURRURRRUU",
  mustParsePath "RRURRUURRURRURR",
  mustParsePath "RRURRUURRURRURU",
  mustParsePath "RRURRUURRURRUU",
  mustParsePath "RRURRUURRURURRR",
  mustParsePath "RRURRUURRURURRU",
  mustParsePath "RRURRUURRURURU",
  mustParsePath "RRURRUURRUURRRR",
  mustParsePath "RRURRUURRUURRRU",
  mustParsePath "RRURRUURRUURRU",
  mustParsePath "RRURRUURURRRRRR",
  mustParsePath "RRURRUURURRRRRU",
  mustParsePath "RRURRUURURRRRUR",
  mustParsePath "RRURRUURURRRRUU",
  mustParsePath "RRURRUURURRRURR",
  mustParsePath "RRURRUURURRRURU",
  mustParsePath "RRURRUURURRRUU",
  mustParsePath "RRURRUURURRURRR",
  mustParsePath "RRURRUURURRURRU",
  mustParsePath "RRURRUURURRURU",
  mustParsePath "RRURRUURURURRRR",
  mustParsePath "RRURRUURURURRRU",
  mustParsePath "RRURRUURURURRU"
]

theorem partitionSubtree17_frontier :
    PrefixPartitionTree.frontier [Step.R, Step.R, Step.U, Step.R, Step.R, Step.U, Step.U] partitionSubtree17 = partitionFrontierChunk17 := by
  unfold partitionSubtree17 partitionFrontierChunk17
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

