import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0060 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1829 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1237 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 891 false 0)))))) (some (.node (some (.node none (some (.leaf 1431 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1181 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 592 true 14)))))) (some (.node (some (.node none (some (.leaf 481 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 391 true 14)))))) (some (.node (some (.node none (some (.leaf 413 true 14)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1156 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 519 true 14)))))) (some (.node (some (.node none (some (.leaf 206 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 337 true 14)))))) (some (.node (some (.node none (some (.leaf 182 true 14)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1309 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 508 true 14)))))) (some (.node (some (.node none (some (.leaf 476 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 329 true 14)))))) (some (.node (some (.node none (some (.leaf 17 true 14)))) none)))) none)))) none)) none)))) none)

theorem region_0060_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRURRURUU") region_0060 = true := by
  unfold region_0060
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

