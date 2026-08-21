import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0092 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1840 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 668 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 896 false 0)))))) (some (.node (some (.node none (some (.leaf 1442 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 634 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 309 false 0)))))) (some (.node (some (.node none (some (.leaf 305 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 298 false 0)))))) (some (.node (some (.node none (some (.leaf 425 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1180 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 212 true 12)))))) (some (.node (some (.node none (some (.leaf 207 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 150 false 0)))))) (some (.node (some (.node none (some (.leaf 152 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1351 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 209 false 0)))))) (some (.node (some (.node none (some (.leaf 483 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 212 false 0)))))) (some (.node (some (.node none (some (.leaf 213 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0092_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURRURRUU") region_0092 = true := by
  unfold region_0092
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

