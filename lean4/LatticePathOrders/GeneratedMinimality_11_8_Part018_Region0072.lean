import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0072 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1831 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1139 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 895 false 0)))))) (some (.node (some (.node none (some (.leaf 1436 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1104 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 428 true 7)))))) (some (.node (some (.node none (some (.leaf 280 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 299 false 0)))))) (some (.node (some (.node none (some (.leaf 428 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1157 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 394 true 12)))))) (some (.node (some (.node none (some (.leaf 284 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 289 false 0)))))) (some (.node (some (.node none (some (.leaf 290 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1315 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 390 false 0)))))) (some (.node (some (.node none (some (.leaf 478 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 394 false 0)))))) (some (.node (some (.node none (some (.leaf 395 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0072_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRUURRRUU") region_0072 = true := by
  unfold region_0072
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

