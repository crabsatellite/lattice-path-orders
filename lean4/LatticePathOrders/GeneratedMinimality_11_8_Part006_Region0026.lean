import LatticePathOrders.GeneratedMinimality_11_8_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_8

def region_0026 : AssignmentTree :=
  (.node (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 1825 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1619 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 998 false 0)))))) (some (.node (some (.node none (some (.leaf 1429 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1419 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 999 false 0)))))) (some (.node (some (.node none (some (.leaf 1004 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1000 false 0)))))) (some (.node (some (.node none (some (.leaf 1005 false 0)))) none)))) none)))))) (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1393 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1001 false 0)))))) (some (.node (some (.node none (some (.leaf 1006 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1002 false 0)))))) (some (.node (some (.node none (some (.leaf 1007 false 0)))) none)))) none)))) none)))) (some (.node (some (.node (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 1389 true 15)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 1011 false 0)))))) (some (.node (some (.node none (some (.leaf 1015 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 1012 false 0)))))) (some (.node (some (.node none (some (.leaf 1016 false 0)))) none)))) none)))) none)) none)))) none)

theorem region_0026_check :
    AssignmentTree.check 11 8 classes 9 (mustParsePath "RRRRRUURUU") region_0026 = true := by
  unfold region_0026
  rfl

end LatticePathOrders.GeneratedMinimality_11_8

