import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0036 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1824 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1510 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1311 true 13)))))) (some (.node (some (.node none (some (.leaf 1411 true 13)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1360 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1136 true 13)))))) (some (.node (some (.node none (some (.leaf 1125 true 13)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1101 true 13)))))) (some (.node (some (.node none (some (.leaf 1097 true 13)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1332 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 786 true 13)))))) (some (.node (some (.node none (some (.leaf 642 true 13)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 644 true 13)))))) (some (.node (some (.node none (some (.leaf 645 true 13)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1318 true 13)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 777 true 13)))))) (some (.node (some (.node none (some (.leaf 704 true 13)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 708 true 13)))))) (some (.node (some (.node none (some (.leaf 710 true 13)))) none)))) none)))) none)) none)))) none)

theorem region_0036_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRURRUUU") region_0036 = true := by
  unfold region_0036
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

