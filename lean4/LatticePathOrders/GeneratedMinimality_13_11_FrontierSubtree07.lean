import LatticePathOrders.MinimalityPartitionTree

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionSubtree07 : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))))) (some (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some (.node (some .leaf) (some .leaf))))) (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))))) (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)))) (some (.node (some (.node (some (.node (some (.node (some .leaf) (some .leaf))) (some .leaf))) none)) none)))) none)))) none)

theorem partitionSubtree07_check :
    PrefixPartitionTree.check 13 11 17 [Step.R, Step.R, Step.R, Step.R, Step.U, Step.U, Step.U] partitionSubtree07 = true := by
  unfold partitionSubtree07
  rfl

def partitionFrontierChunk07 : List Path := [
  mustParsePath "RRRRUUURRRRRRR",
  mustParsePath "RRRRUUURRRRRRUR",
  mustParsePath "RRRRUUURRRRRRUU",
  mustParsePath "RRRRUUURRRRRURR",
  mustParsePath "RRRRUUURRRRRURU",
  mustParsePath "RRRRUUURRRRRUUR",
  mustParsePath "RRRRUUURRRRRUUU",
  mustParsePath "RRRRUUURRRRURRR",
  mustParsePath "RRRRUUURRRRURRU",
  mustParsePath "RRRRUUURRRRURUR",
  mustParsePath "RRRRUUURRRRURUU",
  mustParsePath "RRRRUUURRRRUURR",
  mustParsePath "RRRRUUURRRRUURU",
  mustParsePath "RRRRUUURRRRUUU",
  mustParsePath "RRRRUUURRRURRRR",
  mustParsePath "RRRRUUURRRURRRU",
  mustParsePath "RRRRUUURRRURRUR",
  mustParsePath "RRRRUUURRRURRUU",
  mustParsePath "RRRRUUURRRURURR",
  mustParsePath "RRRRUUURRRURURU",
  mustParsePath "RRRRUUURRRURUU",
  mustParsePath "RRRRUUURRRUURRR",
  mustParsePath "RRRRUUURRRUURRU",
  mustParsePath "RRRRUUURRRUURU",
  mustParsePath "RRRRUUURRURRRRR",
  mustParsePath "RRRRUUURRURRRRU",
  mustParsePath "RRRRUUURRURRRUR",
  mustParsePath "RRRRUUURRURRRUU",
  mustParsePath "RRRRUUURRURRURR",
  mustParsePath "RRRRUUURRURRURU",
  mustParsePath "RRRRUUURRURRUU",
  mustParsePath "RRRRUUURRURURRR",
  mustParsePath "RRRRUUURRURURRU",
  mustParsePath "RRRRUUURRURURU",
  mustParsePath "RRRRUUURRUURRRR",
  mustParsePath "RRRRUUURRUURRRU",
  mustParsePath "RRRRUUURRUURRU",
  mustParsePath "RRRRUUURURRRRRR",
  mustParsePath "RRRRUUURURRRRRU",
  mustParsePath "RRRRUUURURRRRUR",
  mustParsePath "RRRRUUURURRRRUU",
  mustParsePath "RRRRUUURURRRURR",
  mustParsePath "RRRRUUURURRRURU",
  mustParsePath "RRRRUUURURRRUU",
  mustParsePath "RRRRUUURURRURRR",
  mustParsePath "RRRRUUURURRURRU",
  mustParsePath "RRRRUUURURRURU",
  mustParsePath "RRRRUUURURURRRR",
  mustParsePath "RRRRUUURURURRRU",
  mustParsePath "RRRRUUURURURRU"
]

theorem partitionSubtree07_frontier :
    PrefixPartitionTree.frontier [Step.R, Step.R, Step.R, Step.R, Step.U, Step.U, Step.U] partitionSubtree07 = partitionFrontierChunk07 := by
  unfold partitionSubtree07 partitionFrontierChunk07
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

