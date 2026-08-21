import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0201 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8026 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6836 true 9)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6706 true 9)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6280 true 9)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6280 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6706 false 0)))))) (some (.node (some (.node none (some (.leaf 6836 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6825 true 7)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6677 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6261 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4877 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2595 true 10)))))) (some (.node (some (.node none (some (.leaf 275 true 10)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6631 true 10)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6193 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4847 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2560 true 10)))))) (some (.node (some (.node none (some (.leaf 820 true 10)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6055 true 10)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4775 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2465 true 10)))))) (some (.node (some (.node none (some (.leaf 2497 true 10)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4515 true 10)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 3282 true 10)))))) (some (.node (some (.node none (some (.leaf 3358 true 10)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 3609 true 10)))))) (some (.node (some (.node none (some (.leaf 3643 true 10)))) none)))) none)))))))))))

theorem region_0201_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRRURRURRURR") region_0201 = true := by
  unfold region_0201
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

