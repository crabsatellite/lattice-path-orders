import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0022 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1832 true 5)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1626 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1429 true 15)))))) (some (.node (some (.node none (some (.leaf 1410 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1439 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1219 true 15)))))) (some (.node (some (.node none (some (.leaf 1215 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1133 true 15)))))) (some (.node (some (.node none (some (.leaf 1126 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1401 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 846 true 15)))))) (some (.node (some (.node none (some (.leaf 659 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 531 true 15)))))) (some (.node (some (.node none (some (.leaf 511 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1392 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 841 true 15)))))) (some (.node (some (.node none (some (.leaf 473 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 497 true 15)))))) (some (.node (some (.node none (some (.leaf 105 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0022_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRURUUU") region_0022 = true := by
  unfold region_0022
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

