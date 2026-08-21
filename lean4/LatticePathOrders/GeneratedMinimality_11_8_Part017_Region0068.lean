import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0068 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1838 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1220 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 922 false 0)))))) (some (.node (some (.node none (some (.leaf 1492 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1137 true 4)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 527 true 7)))))) (some (.node (some (.node none (some (.leaf 34 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 338 false 0)))))) (some (.node (some (.node none (some (.leaf 527 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1158 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 489 true 5)))))) (some (.node (some (.node none (some (.leaf 208 true 5)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 320 true 17)))))) (some (.node (some (.node none (some (.leaf 14 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1316 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 484 true 5)))))) (some (.node (some (.node none (some (.leaf 484 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 311 true 17)))))) (some (.node (some (.node none (some (.leaf 15 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0068_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRURURURU") region_0068 = true := by
  unfold region_0068
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

