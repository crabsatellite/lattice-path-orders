import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0040 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1827 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1491 true 6)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 921 true 6)))))) (some (.node (some (.node none (some (.leaf 1430 true 6)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1352 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 810 true 16)))))) (some (.node (some (.node none (some (.leaf 509 true 16)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 454 true 16)))))) (some (.node (some (.node none (some (.leaf 412 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1313 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 780 true 16)))))) (some (.node (some (.node none (some (.leaf 217 true 16)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 419 true 16)))))) (some (.node (some (.node none (some (.leaf 193 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1304 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 774 true 16)))))) (some (.node (some (.node none (some (.leaf 474 true 16)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 410 true 16)))))) (some (.node (some (.node none (some (.leaf 29 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0040_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRURURUU") region_0040 = true := by
  unfold region_0040
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

