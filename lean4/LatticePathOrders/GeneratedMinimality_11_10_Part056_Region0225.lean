import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0225 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8041 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6560 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6503 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6077 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6324 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6763 false 0)))))) (some (.node (some (.node none (some (.leaf 6884 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6549 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6492 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6067 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4805 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2502 true 10)))))) (some (.node (some (.node none (some (.leaf 270 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6452 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5953 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4774 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2462 true 10)))))) (some (.node (some (.node none (some (.leaf 837 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 5702 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4655 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2556 true 10)))))) (some (.node (some (.node none (some (.leaf 2589 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4387 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3440 true 10)))))) (some (.node (some (.node none (some (.leaf 3481 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3728 true 10)))))) (some (.node (some (.node none (some (.leaf 3758 true 10)))) none)))) none)))))))))))

theorem region_0225_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURURRRURR") region_0225 = true := by
  unfold region_0225
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

