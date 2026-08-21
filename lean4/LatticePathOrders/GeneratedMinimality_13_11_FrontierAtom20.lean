import LatticePathOrders.Basic

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionFrontierAtom20 : List Path := [
  mustParsePath "RRRRUURRRRRRR",
  mustParsePath "RRRRUURRRRRRUR",
  mustParsePath "RRRRUURRRRRRUUR",
  mustParsePath "RRRRUURRRRRRUUU",
  mustParsePath "RRRRUURRRRRURR",
  mustParsePath "RRRRUURRRRRURUR"
]

@[simp] theorem partitionFrontierAtom20_length :
    partitionFrontierAtom20.length = 6 := by
  decide

end LatticePathOrders.GeneratedMinimality_13_11

