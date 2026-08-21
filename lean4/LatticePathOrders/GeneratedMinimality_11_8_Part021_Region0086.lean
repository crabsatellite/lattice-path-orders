import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0086 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1837 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 771 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 894 false 0)))))) (some (.node (some (.node none (some (.leaf 1434 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 635 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 482 false 0)))))) (some (.node (some (.node none (some (.leaf 476 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 385 false 0)))))) (some (.node (some (.node none (some (.leaf 414 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1179 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 219 false 0)))))) (some (.node (some (.node none (some (.leaf 206 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 186 false 0)))))) (some (.node (some (.node none (some (.leaf 179 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1350 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 216 false 0)))))) (some (.node (some (.node none (some (.leaf 481 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 154 false 0)))))) (some (.node (some (.node none (some (.leaf 50 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0086_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRURRRURUU") region_0086 = true := by
  unfold region_0086
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

