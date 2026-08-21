import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0046 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1828 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1432 true 6)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 892 false 0)))))) (some (.node (some (.node none (some (.leaf 1432 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1319 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 796 true 16)))))) (some (.node (some (.node none (some (.leaf 452 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 438 false 0)))))) (some (.node (some (.node none (some (.leaf 454 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1295 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 764 true 16)))))) (some (.node (some (.node none (some (.leaf 453 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 439 false 0)))))) (some (.node (some (.node none (some (.leaf 455 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1302 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 761 true 16)))))) (some (.node (some (.node none (some (.leaf 475 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 443 false 0)))))) (some (.node (some (.node none (some (.leaf 458 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0046_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRUURRUU") region_0046 = true := by
  unfold region_0046
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

