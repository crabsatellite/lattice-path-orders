import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree00
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree01
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree02
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree03
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree04
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree05
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree06
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree07
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree08
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree09
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree10
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree11
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree12
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree13
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree14
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree15
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree16
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree17
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree18
import LatticePathOrders.GeneratedMinimality_13_11_FrontierSubtree19

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def partitionTree : PrefixPartitionTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node (some partitionSubtree00) (some partitionSubtree01))) (some (.node (some partitionSubtree02) (some partitionSubtree03))))) (some (.node (some (.node (some partitionSubtree04) (some partitionSubtree05))) (some (.node (some partitionSubtree06) (some partitionSubtree07))))))) (some (.node (some (.node (some (.node (some partitionSubtree08) (some partitionSubtree09))) (some (.node (some partitionSubtree10) (some partitionSubtree11))))) (some (.node (some (.node (some partitionSubtree12) (some partitionSubtree13))) none)))))) (some (.node (some (.node (some (.node (some (.node (some partitionSubtree14) (some partitionSubtree15))) (some (.node (some partitionSubtree16) (some partitionSubtree17))))) (some (.node (some (.node (some partitionSubtree18) (some partitionSubtree19))) none)))) none)))) none)

theorem partitionTree_check :
    PrefixPartitionTree.check 13 11 (24 - 1) [Step.R] partitionTree = true := by
  simp [partitionTree, PrefixPartitionTree.check,
    PrefixPartitionTree.branchCheck,
    Path.countR, Path.countU,
    partitionSubtree00_check,
    partitionSubtree01_check,
    partitionSubtree02_check,
    partitionSubtree03_check,
    partitionSubtree04_check,
    partitionSubtree05_check,
    partitionSubtree06_check,
    partitionSubtree07_check,
    partitionSubtree08_check,
    partitionSubtree09_check,
    partitionSubtree10_check,
    partitionSubtree11_check,
    partitionSubtree12_check,
    partitionSubtree13_check,
    partitionSubtree14_check,
    partitionSubtree15_check,
    partitionSubtree16_check,
    partitionSubtree17_check,
    partitionSubtree18_check,
    partitionSubtree19_check]

def partitionFrontier : List Path :=
  partitionFrontierChunk00 ++
    partitionFrontierChunk01 ++
    partitionFrontierChunk02 ++
    partitionFrontierChunk03 ++
    partitionFrontierChunk04 ++
    partitionFrontierChunk05 ++
    partitionFrontierChunk06 ++
    partitionFrontierChunk07 ++
    partitionFrontierChunk08 ++
    partitionFrontierChunk09 ++
    partitionFrontierChunk10 ++
    partitionFrontierChunk11 ++
    partitionFrontierChunk12 ++
    partitionFrontierChunk13 ++
    partitionFrontierChunk14 ++
    partitionFrontierChunk15 ++
    partitionFrontierChunk16 ++
    partitionFrontierChunk17 ++
    partitionFrontierChunk18 ++
    partitionFrontierChunk19

theorem partitionTree_frontier :
    PrefixPartitionTree.frontier [Step.R] partitionTree = partitionFrontier := by
  simp [partitionTree, partitionFrontier, PrefixPartitionTree.frontier,
    partitionSubtree00_frontier,
    partitionSubtree01_frontier,
    partitionSubtree02_frontier,
    partitionSubtree03_frontier,
    partitionSubtree04_frontier,
    partitionSubtree05_frontier,
    partitionSubtree06_frontier,
    partitionSubtree07_frontier,
    partitionSubtree08_frontier,
    partitionSubtree09_frontier,
    partitionSubtree10_frontier,
    partitionSubtree11_frontier,
    partitionSubtree12_frontier,
    partitionSubtree13_frontier,
    partitionSubtree14_frontier,
    partitionSubtree15_frontier,
    partitionSubtree16_frontier,
    partitionSubtree17_frontier,
    partitionSubtree18_frontier,
    partitionSubtree19_frontier]

end LatticePathOrders.GeneratedMinimality_13_11
