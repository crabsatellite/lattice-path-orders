import LatticePathOrders.GeneratedMinimality_13_11_Frontier
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge00
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge01
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge02
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge03
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge04
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge05
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge06
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge07
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge08
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge09
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge10
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge11
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge12
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge13
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge14
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge15
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge16
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge17
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge18
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtreeBridge19
import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment00
import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment01
import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment02
import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment03
import LatticePathOrders.GeneratedMinimality_13_11_EndpointSegment04

namespace LatticePathOrders.GeneratedMinimality_13_11

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

theorem partitionFrontier_segments :
    partitionFrontier =
      frontierSegment00 ++
    frontierSegment01 ++
    frontierSegment02 ++
    frontierSegment03 ++
    frontierSegment04 := by
  unfold partitionFrontier
  rw [partitionFrontierChunk00_atoms,
    partitionFrontierChunk01_atoms,
    partitionFrontierChunk02_atoms,
    partitionFrontierChunk03_atoms,
    partitionFrontierChunk04_atoms,
    partitionFrontierChunk05_atoms,
    partitionFrontierChunk06_atoms,
    partitionFrontierChunk07_atoms,
    partitionFrontierChunk08_atoms,
    partitionFrontierChunk09_atoms,
    partitionFrontierChunk10_atoms,
    partitionFrontierChunk11_atoms,
    partitionFrontierChunk12_atoms,
    partitionFrontierChunk13_atoms,
    partitionFrontierChunk14_atoms,
    partitionFrontierChunk15_atoms,
    partitionFrontierChunk16_atoms,
    partitionFrontierChunk17_atoms,
    partitionFrontierChunk18_atoms,
    partitionFrontierChunk19_atoms]
  simp [frontierSegment00, frontierSegment01, frontierSegment02,
    frontierSegment03, frontierSegment04,
    frontierPair00, frontierPair01, frontierPair02, frontierPair03, frontierPair04,
    frontierPair05, frontierPair06, frontierPair07, frontierPair08, frontierPair09,
    frontierPair10, frontierPair11, frontierPair12, frontierPair13, frontierPair14,
    frontierPair15, frontierPair16, frontierPair17, frontierPair18, frontierPair19,
    groupFrontier000, groupFrontier001, groupFrontier002, groupFrontier003,
    groupFrontier004, groupFrontier005, groupFrontier006, groupFrontier007,
    groupFrontier008, groupFrontier009, groupFrontier010, groupFrontier011,
    groupFrontier012, groupFrontier013, groupFrontier014, groupFrontier015,
    groupFrontier016, groupFrontier017, groupFrontier018, groupFrontier019,
    groupFrontier020, groupFrontier021, groupFrontier022, groupFrontier023,
    groupFrontier024, groupFrontier025, groupFrontier026, groupFrontier027,
    groupFrontier028, groupFrontier029, groupFrontier030, groupFrontier031,
    groupFrontier032, groupFrontier033, groupFrontier034, groupFrontier035,
    groupFrontier036, groupFrontier037, groupFrontier038, groupFrontier039,
    List.append_assoc]

theorem partitionFrontier_length : List.length partitionFrontier = 2508 := by
  rw [partitionFrontier_segments]
  simp [frontierSegment00, frontierSegment01, frontierSegment02,
    frontierSegment03, frontierSegment04,
    frontierPair00, frontierPair01, frontierPair02, frontierPair03, frontierPair04,
    frontierPair05, frontierPair06, frontierPair07, frontierPair08, frontierPair09,
    frontierPair10, frontierPair11, frontierPair12, frontierPair13, frontierPair14,
    frontierPair15, frontierPair16, frontierPair17, frontierPair18, frontierPair19,
    groupFrontier000, groupFrontier001, groupFrontier002, groupFrontier003,
    groupFrontier004, groupFrontier005, groupFrontier006, groupFrontier007,
    groupFrontier008, groupFrontier009, groupFrontier010, groupFrontier011,
    groupFrontier012, groupFrontier013, groupFrontier014, groupFrontier015,
    groupFrontier016, groupFrontier017, groupFrontier018, groupFrontier019,
    groupFrontier020, groupFrontier021, groupFrontier022, groupFrontier023,
    groupFrontier024, groupFrontier025, groupFrontier026, groupFrontier027,
    groupFrontier028, groupFrontier029, groupFrontier030, groupFrontier031,
    groupFrontier032, groupFrontier033, groupFrontier034, groupFrontier035,
    groupFrontier036, groupFrontier037, groupFrontier038, groupFrontier039]

end LatticePathOrders.GeneratedMinimality_13_11
