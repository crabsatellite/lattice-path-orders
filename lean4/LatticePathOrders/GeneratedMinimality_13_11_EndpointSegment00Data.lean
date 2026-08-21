import LatticePathOrders.GeneratedMinimality_13_11_EndpointPair00
import LatticePathOrders.GeneratedMinimality_13_11_EndpointPair01
import LatticePathOrders.GeneratedMinimality_13_11_EndpointPair02
import LatticePathOrders.GeneratedMinimality_13_11_EndpointPair03

namespace LatticePathOrders.GeneratedMinimality_13_11

def regionsSegment00 : List (Path × Nat × AssignmentTree) :=
  regionsPair00 ++ (regionsPair01 ++ (regionsPair02 ++ regionsPair03))

def frontierSegment00 : List Path :=
  frontierPair00 ++ (frontierPair01 ++ (frontierPair02 ++ frontierPair03))

end LatticePathOrders.GeneratedMinimality_13_11
