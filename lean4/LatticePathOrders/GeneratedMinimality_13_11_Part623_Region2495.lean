import LatticePathOrders.GeneratedMinimality_13_11_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_13_11

def region_2495 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 52100 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17172 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22671 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 42021 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 49186 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 51280 false 0)))))) (some (.node (some (.node none (some (.leaf 51840 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 22479 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16686 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 15591 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 10765 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3264 false 0)))))) (some (.node (some (.node none (some (.leaf 1417 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 16573 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 17544 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 21113 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 22186 false 0)))))) (some (.node (some (.node none (some (.leaf 22412 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 34588 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 39532 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 41290 false 0)))))) (some (.node (some (.node none (some (.leaf 41651 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 46658 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 48350 false 0)))))) (some (.node (some (.node none (some (.leaf 48762 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 50398 false 0)))))) (some (.node (some (.node none (some (.leaf 50842 false 0)))) none)))) none)))))))))))

theorem region_2495_check :
    AssignmentTree.check 13 11 classes 9 (mustParsePath "RRURURURURRRRRR") region_2495 = true := by
  unfold region_2495
  rfl

end LatticePathOrders.GeneratedMinimality_13_11

