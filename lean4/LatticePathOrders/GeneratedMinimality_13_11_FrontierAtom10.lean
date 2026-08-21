import LatticePathOrders.Basic

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionFrontierAtom10 : List Path := [
  mustParsePath "RRRRRUURRRRRR",
  mustParsePath "RRRRRUURRRRRUR",
  mustParsePath "RRRRRUURRRRRUUR",
  mustParsePath "RRRRRUURRRRRUUU",
  mustParsePath "RRRRRUURRRRURR",
  mustParsePath "RRRRRUURRRRURUR"
]

@[simp] theorem partitionFrontierAtom10_length :
    partitionFrontierAtom10.length = 6 := by
  decide

end LatticePathOrders.GeneratedMinimality_13_11

