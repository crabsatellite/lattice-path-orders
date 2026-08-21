import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionSubtree19 : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)))) none)

theorem partitionSubtree19_check :
    PrefixPartitionTree.check 13 11 17 [Step.R, Step.R, Step.U, Step.R, Step.U, Step.R, Step.U] partitionSubtree19 = true := by
  unfold partitionSubtree19
  rfl

def partitionFrontierChunk19 : List Path := [
  mustParsePath "RRURURURRRRRRR",
  mustParsePath "RRURURURRRRRRUR",
  mustParsePath "RRURURURRRRRRUU",
  mustParsePath "RRURURURRRRRURR",
  mustParsePath "RRURURURRRRRURU",
  mustParsePath "RRURURURRRRRUUR",
  mustParsePath "RRURURURRRRRUUU",
  mustParsePath "RRURURURRRRURRR",
  mustParsePath "RRURURURRRRURRU",
  mustParsePath "RRURURURRRRURUR",
  mustParsePath "RRURURURRRRURUU",
  mustParsePath "RRURURURRRRUURR",
  mustParsePath "RRURURURRRRUURU",
  mustParsePath "RRURURURRRRUUU",
  mustParsePath "RRURURURRRURRRR",
  mustParsePath "RRURURURRRURRRU",
  mustParsePath "RRURURURRRURRUR",
  mustParsePath "RRURURURRRURRUU",
  mustParsePath "RRURURURRRURURR",
  mustParsePath "RRURURURRRURURU",
  mustParsePath "RRURURURRRURUU",
  mustParsePath "RRURURURRRUURRR",
  mustParsePath "RRURURURRRUURRU",
  mustParsePath "RRURURURRRUURU",
  mustParsePath "RRURURURRURRRRR",
  mustParsePath "RRURURURRURRRRU",
  mustParsePath "RRURURURRURRRUR",
  mustParsePath "RRURURURRURRRUU",
  mustParsePath "RRURURURRURRURR",
  mustParsePath "RRURURURRURRURU",
  mustParsePath "RRURURURRURRUU",
  mustParsePath "RRURURURRURURRR",
  mustParsePath "RRURURURRURURRU",
  mustParsePath "RRURURURRURURU",
  mustParsePath "RRURURURRUURRRR",
  mustParsePath "RRURURURRUURRRU",
  mustParsePath "RRURURURRUURRU",
  mustParsePath "RRURURURURRRRRR",
  mustParsePath "RRURURURURRRRRU",
  mustParsePath "RRURURURURRRRUR",
  mustParsePath "RRURURURURRRRUU",
  mustParsePath "RRURURURURRRURR",
  mustParsePath "RRURURURURRRURU",
  mustParsePath "RRURURURURRRUU",
  mustParsePath "RRURURURURRURRR",
  mustParsePath "RRURURURURRURRU",
  mustParsePath "RRURURURURRURU",
  mustParsePath "RRURURURURURRRR",
  mustParsePath "RRURURURURURRRU",
  mustParsePath "RRURURURURURRU"
]

theorem partitionSubtree19_frontier :
    PrefixPartitionTree.frontier [Step.R, Step.R, Step.U, Step.R, Step.U, Step.R, Step.U] partitionSubtree19 = partitionFrontierChunk19 := by
  unfold partitionSubtree19 partitionFrontierChunk19
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

