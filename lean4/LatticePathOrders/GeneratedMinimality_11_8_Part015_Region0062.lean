import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0062 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1836 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1235 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 920 false 0)))))) (some (.node (some (.node none (some (.leaf 1490 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1179 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 590 true 14)))))) (some (.node (some (.node none (some (.leaf 216 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 355 true 14)))))) (some (.node (some (.node none (some (.leaf 510 true 14)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1156 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 515 true 14)))))) (some (.node (some (.node none (some (.leaf 219 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 335 true 14)))))) (some (.node (some (.node none (some (.leaf 220 true 14)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1313 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 506 true 14)))))) (some (.node (some (.node none (some (.leaf 482 true 14)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 327 true 14)))))) (some (.node (some (.node none (some (.leaf 239 true 14)))) none)))) none)))) none)) none)))) none)

theorem region_0062_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRURRUURU") region_0062 = true := by
  unfold region_0062
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

