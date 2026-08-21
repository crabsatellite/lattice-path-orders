import LatticePathOrders.GeneratedMinimality_11_10_Data
import LatticePathOrders.MinimalityCertificate

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

namespace LatticePathOrders.GeneratedMinimality_11_10

def region_0346 : AssignmentTree :=
  (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 8369 false 0)))))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3692 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3655 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 6331 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 7355 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 7845 false 0)))))) (some (.node (some (.node none (some (.leaf 7978 false 0)))) none)))))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3868 false 0)))))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3643 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3358 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2497 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 820 false 0)))))) (some (.node (some (.node none (some (.leaf 275 false 0)))) none)))))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3609 false 0)))))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 3282 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 2465 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 2560 false 0)))))) (some (.node (some (.node none (some (.leaf 2595 false 0)))) none)))))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.node none (some (.leaf 4515 false 0)))))))))) (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 4775 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 4847 false 0)))))) (some (.node (some (.node none (some (.leaf 4877 false 0)))) none)))))))) (some (.node (some (.node (some (.node none (some (.node none (some (.node none (some (.leaf 6055 false 0)))))))) (some (.node (some (.node none (some (.node none (some (.leaf 6193 false 0)))))) (some (.node (some (.node none (some (.leaf 6261 false 0)))) none)))))) (some (.node (some (.node (some (.node none (some (.node none (some (.leaf 6631 false 0)))))) (some (.node (some (.node none (some (.leaf 6677 false 0)))) none)))) none)))))))))))

theorem region_0346_check :
    AssignmentTree.check 11 10 classes 9 (mustParsePath "RRURRURRURRR") region_0346 = true := by
  unfold region_0346
  rfl

end LatticePathOrders.GeneratedMinimality_11_10

